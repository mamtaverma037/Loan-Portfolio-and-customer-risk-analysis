--portfolio overview 
--Total loan
select 
count(*) as total_Loan
from dbo.Loan_data

--Total Loan Amount
select
sum(cast(loanamount as bigint)) as Total_Loan_Amount
from dbo.Loan_data

--default rate
select 
count(case when [default] = 1 then 1 end )as Defaulted_loans,
count(*) as Total_loans,
cast(count(case when [default] = 1 then 1 end)*100 /count(*) as decimal (5,2)) 
as defaulted_rate_percentage
from dbo.Loan_data

--average loan amount
select
AVG(cast(loanamount as decimal(18,2))) as Avg_Loan_Amount
from dbo.Loan_data

--average interest rate
select
sum(cast(InterestRate as decimal(10,2))) as Avg_interest_rate
from dbo.Loan_data

--avgerage income
select
sum(cast(income as decimal(10,2))) as Avg_income
from dbo.Loan_data

--avgerage credit score
select
sum(cast(CreditScore as decimal(10,2))) as Avg_credit_score
from dbo.Loan_data

--average DTI ratio
select
sum(cast(DTIRatio as decimal(10,2))) as Avg_dtiratio
from dbo.Loan_data


--2. customer Analysis
--age group distribution
with age_grouped as
(
select 
   case when age between 18 and 30 then '18-30'
        when age between 31 and 45 then '31-45'
        when age between 46 and 60 then '46-60'
        else '60+'
end as age_group
from dbo.Loan_data
)
select 
age_group,
count(*) as Total_loan
from age_grouped 
group by age_group
order by age_group


--education distribution
select 
education,
count(*) as total_loan
from dbo.Loan_data
group by education
order by total_loan desc

--employment type distribution
select 
EmploymentType,
count(*) as total_loan
from dbo.Loan_data
group by EmploymentType
order by total_loan desc

--income type distribution 
with income_grouped as
(
select case 
       when income < 30000 then 'Low income'
       when income between 30000 and 60000 then 'medium_income'
       else 'high_income'
end income_group,
[default]
from dbo.Loan_data
)
select 
income_group,
count(*) as total_loans
from income_grouped
group by income_group
order by total_loans desc;

--mortage status distribution
select 
HasMortgage,
count(*) as total_loan
from dbo.Loan_data
group by HasMortgage
order by total_loan desc

--dependent status
select 
HasDependents,
count(*) as total_loan
from dbo.Loan_data
group by HasDependents
order by total_loan desc

--co-signer distribution
select 
HasCoSigner,
count(*) as total_loan
from dbo.Loan_data
group by HasCoSigner
order by total_loan desc

--3.Loan Analysis
--loan purpose distribution
select 
LoanPurpose,
count(*) as total_loan
from dbo.Loan_data
group by LoanPurpose
order by total_loan desc

--avg loan amount by loan purpose
select 
LoanPurpose,
cast(round(avg(cast(loanamount as decimal(10,2))),2) as int) as avg_loan_amount
from dbo.Loan_data
group by LoanPurpose
order by avg_loan_amount desc

--avg credit score by loan purpose
select 
LoanPurpose,
round(avg(cast(CreditScore as decimal(10,2))),2) as avg_credit_score
from dbo.Loan_data
group by LoanPurpose
order by avg_credit_score desc

--avg interest by employment type
select 
employmenttype,
round(avg(cast(interestrate as decimal(10,2))) ,2)  as avg_interest_rate
from dbo.Loan_data
group by EmploymentType
order by avg_interest_rate desc

--avg credit score by employment type
select 
EmploymentType,
round(avg(cast(CreditScore as decimal(10,2))),2) as avg_credit_score
from dbo.Loan_data
group by EmploymentType
order by avg_credit_score desc

-- avg loan amount by employment type
select 
EmploymentType,
cast(round(avg(cast(loanamount as decimal(10,2))),2) as int) as avg_loan_amount
from dbo.Loan_data
group by EmploymentType
order by avg_loan_amount desc

--avg loan amount by income group
with income_grouped as 
(
select 
   case when income < 30000 then 'low'
        when income between 30000 and 60000 then ' medium'
        else 'High'
end income_group,
LoanAmount
from dbo.Loan_data
)
select 
income_group,
cast(round(avg(cast(LoanAmount as decimal(18,2))) ,2)as int) as Avg_loan_amount
from income_grouped
group by income_group
order by Avg_loan_amount desc;

-- total loan amount by employment type
select 
EmploymentType,
round(sum(cast(loanamount as decimal(10,2))),2)  as total_loan_amount
from dbo.Loan_data
group by EmploymentType
order by total_loan_amount desc

--total loan amount by income group
with income_grouped as 
(
select 
   case when income < 30000 then 'low'
        when income between 30000 and 60000 then ' medium'
        else 'High'
end income_group,
LoanAmount
from dbo.Loan_data
)
select 
income_group,
round(sum(cast(LoanAmount as decimal(18,2))) ,2) as Total_loan_amount
from income_grouped
group by income_group
order by Total_loan_amount desc;

--4.risk analysis queries
--overall default rate
select 
count(case when [default] = 1 then 1 end )as defaulted_loans,
count(*) as total_loans,
cast(count(case when [default] = 1 then 1 end)*100 /count(*) as decimal (5,2)) 
as defaulted_rate_percentage
from dbo.Loan_data

--default rate by age group
with age_grouped as
(
select case 
       when age between 18 and 30 then'18-30'
       when age between 31 and 45 then ' 31-45'
       when age between 46 and 60 then ' 46-60'
       else '60+'
end age_group,
[default]
from dbo.Loan_data
)
select 
age_group,
count(*) as total_loans,
count(case when [default] = 1 then 1 end ) as default_loan,
cast(count(case when [default] =1 then 1 end)*100 / count(*) as decimal(5,2)) as default_rate
from age_grouped
group by age_group
order by default_rate desc;

--default  rate by income group
with income_grouped as
(
select case 
       when income < 30000 then 'Low income'
       when income between 30000 and 60000 then 'medium_income'
       else 'high_income'
end income_group,
[default]
from dbo.Loan_data
)
select 
income_group,
count(*) as total_loans,
count(case when [default] = 1 then 1 end ) as default_loan,
cast(count(case when [default] =1 then 1 end)*100 / count(*) as decimal(5,2)) as default_rate
from income_grouped
group by income_group
order by default_rate desc;

--default rate by credit score
WITH credit_score as 
(
  select 
        case when creditscore < 500 then 'poor'
              when creditscore between 500 and 700 then 'avg'
        else 'good'
   end as credit_group,
    [default]
    from dbo.Loan_data
)
select
credit_group,
count(*) as total_loans,
count(case when [default] = 1 then 1 end ) as default_loan,
cast(count(case when [default] =1 then 1 end)*100 / count(*) as decimal(5,2)) as default_rate
from credit_score
group by credit_group
order by default_rate desc;

--employment and default risk
select 
EmploymentType,
count(*) as total_loans,
count(case when [default] = 1 then 1 end ) as default_loan,
cast(count(case when [default] =1 then 1 end)*100 / count(*) as decimal(5,2)) as default_rate
from dbo.Loan_data
group by EmploymentType
order by default_rate desc

 -- default with loan purpose
select 
LoanPurpose,
count(*) as total_loans,
count(case when [default] = 1 then 1 end ) as default_loan,
cast(count(case when [default] =1 then 1 end)*100 / count(*) as decimal(5,2)) as default_rate
from dbo.Loan_data
group by LoanPurpose
order by default_rate desc

--default rate by mortage status
select 
HasMortgage,
count(*) as total_loans,
count(case when [default] = 1 then 1 end ) as default_loan,
cast(count(case when [default] =1 then 1 end)*100 / count(*) as decimal(5,2)) as default_rate
from dbo.Loan_data
group by HasMortgage
order by default_rate desc

--default rate by dependents status
select 
HasDependents,
count(*) as total_loans,
count(case when [default] = 1 then 1 end ) as default_loan,
cast(count(case when [default] =1 then 1 end)*100 / count(*) as decimal(5,2)) as default_rate
from dbo.Loan_data
group by HasDependents
order by default_rate desc

--default rate by co-signer

select 
HasCoSigner,
count(*) as total_loans,
count(case when [default] = 1 then 1 end ) as default_loan,
cast(count(case when [default] =1 then 1 end)*100 / count(*) as decimal(5,2)) as default_rate
from dbo.Loan_data
group by HasCoSigner
order by default_rate desc


--default rate by dti group
with DTI_grouped as
(
select
   case when DTIratio < 0.20 then 'Low DTI'
        when dtiratio between 0.20 and 0.40 then 'Medium DTI'
        ELSE 'High DTI'
End as DTI_group,
[default]
from dbo.Loan_data
)
select
DTI_group,
count(*) as total_loans,
count(case when [default] = 1 then 1 end ) as default_loan,
cast(count(case when [default] =1 then 1 end)*100 / count(*) as decimal(5,2)) as default_rate
from DTI_grouped
group by DTI_group
order by default_rate desc

-- 5.high-risk customer segment 
--which customer segment have a higher than avg default rate
with customer_segment as 
(
select 
     case when age between 18 and 30 then'18-30'
          when age between 31 and 45 then '31-45'
          when age between 46 and 60 then '46-60'
          else '60+'
end as age_group,
    case when income < 30000 then 'Low income'
        when income  between 30000 and 60000 then 'medium income'
        else 'High income'
        end as income_group,
        case when creditscore < 600 then 'poor'
             when creditscore between 600 and 700 then 'Avg'
             else 'good'
             end as credit_group,
       [default]
from dbo.Loan_data 
)
select 
age_group,
income_group,
credit_group,
count(*) as Total_loan,
count(case when [default] = 1 then 1 end) as default_loan,
round(count(case when [default] = 1 then 1 end)*100/count(*),2) as default_percentage_rate
from customer_segment
group by
age_group,
income_group,
credit_group
having count(*) >= 100
order by default_percentage_rate desc

--how much loan amount is exposed to high risk customers
with risk_grouped as
(
    select 
     case when creditscore < 600
     or DTIratio > 0.40 
     or [default] = 1 then 'High risk'
      else 'Low risk'
       end as risk_group,
          LoanAmount
from dbo.Loan_data
)
select
risk_group,
 count(*) as high_risk_loans,
 sum(cast(loanamount as bigint)) as high_risk_loan_amount
 from risk_grouped
 group  by risk_group
 order by high_risk_loan_amount desc

 --which age grp has the highest average amnt
 with age_grouped as
 (
 select 
     case when age  between 18 and 30 then '18-30'
          when age between 31 and 45 then '31-45'
          when age between 46 and 60 then '46-60'
          else '60+'
          end age_group,
          LoanAmount
from dbo.loan_data
)
select
age_group,
round(avg(cast(LoanAmount  as decimal(18,2))),1) as avg_amount
from age_grouped
group by age_group
order by avg_amount desc
 
 --Which employment type has the highest default rate?
 SELECT
    EmploymentType,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN [Default] = 1 THEN 1 ELSE 0 END) AS defaulted_loans,
    ROUND(
        100.0 * SUM(CASE WHEN [Default] = 1 THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS default_rate
FROM dbo.Loan_data
GROUP BY EmploymentType
ORDER BY default_rate DESC;

--Which education level has the highest default rate?
SELECT
    Education,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN [Default] = 1 THEN 1 ELSE 0 END) AS defaulted_loans,
    ROUND(
        100.0 * SUM(CASE WHEN [Default] = 1 THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS default_rate
FROM dbo.Loan_data
GROUP BY Education
ORDER BY default_rate DESC;

--What is the average interest rate by loan purpose?
SELECT
    LoanPurpose,
    ROUND(
        AVG(CAST(InterestRate AS DECIMAL(10,2))),
        2
    ) AS avg_interest_rate
FROM dbo.Loan_data
GROUP BY LoanPurpose
ORDER BY avg_interest_rate DESC;


--total loan amount by loan purpose
SELECT
    LoanPurpose,
    sum(cast(loanamount as bigint)) as total_loan_amount
FROM dbo.Loan_data
GROUP BY LoanPurpose
ORDER BY total_loan_amount DESC;

--avg loan amount by loan purpose
SELECT
    LoanPurpose,
    cast(round(avg(cast(loanamount as decimal(10,2))),2) as int) as avg_loan_amount
FROM dbo.Loan_data
GROUP BY LoanPurpose
ORDER BY avg_loan_amount DESC;

--loan amount by employment type
SELECT
   EmploymentType,
    cast(round(avg(cast(loanamount as decimal(10,2))),2) as int) as avg_loan_amount
FROM dbo.Loan_data
GROUP BY EmploymentType 
ORDER BY avg_loan_amount DESC;


--loan amount by income group
with income_grouped as(
select
  case when income < 30000 then 'low income'
       when income between 30000 and 60000 then 'medium income'
       else 'high income'
    end as income_group,
    loanamount
from dbo.Loan_data
)
select income_group,
cast(round(avg(cast (loanamount as decimal(10,2))),2) as int) as avg_amount
from income_grouped
group by income_group
order by avg_amount desc

--high value loan by deafult status
with default_grouped as(
select
case when [default] = 1 then 'defaulted'
     else 'non-defaulted'
     end as loan_status,
 loanamount
 from dbo.Loan_data
 )
 select
 loan_status,
count(*) as total_loans,
sum(cast(loanamount as bigint))as  total_loan_amount,
cast(round(avg(cast(loanamount as decimal(10,2))),0) as int) as avg_loanamnt
from default_grouped
group by loan_status
order by total_loan_amount desc

--top 10 highest value loan records
select top 10
loanid,
age,
income,
creditscore,
loanamount,
interestrate,
dtiratio,
[default]
from dbo.Loan_data
order by LoanAmount desc;

--highest value defaulted loan
select top 10
loanid,
loanamount,
income,
creditscore,
interestrate,
dtiratio,
LoanPurpose,
[default]
from dbo.Loan_data
order by LoanAmount desc;

