@interface PKAccountWebServicePayLaterReportIssueContentRequest
- (PKAccountWebServicePayLaterReportIssueContentRequest)initWithTopic:(id)a3;
- (PKPayLaterFinancingPlan)financingPlan;
- (PKPayLaterInstallment)installment;
- (PKPayLaterPayment)payment;
- (id)bodyDictionary;
- (id)contextString;
- (void)setFinancingPlan:(id)a3;
- (void)setInstallment:(id)a3;
- (void)setPayment:(id)a3;
@end

@implementation PKAccountWebServicePayLaterReportIssueContentRequest

- (PKAccountWebServicePayLaterReportIssueContentRequest)initWithTopic:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountWebServicePayLaterReportIssueContentRequest;
  v5 = [(PKOverlayableWebServiceRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 payLaterContentRequestTypeString];
    contextString = v5->_contextString;
    v5->_contextString = (NSString *)v6;
  }
  return v5;
}

- (id)contextString
{
  return self->_contextString;
}

- (id)bodyDictionary
{
  v20.receiver = self;
  v20.super_class = (Class)PKAccountWebServicePayLaterReportIssueContentRequest;
  v3 = [(PKAccountWebServicePayLaterContentRequest *)&v20 bodyDictionary];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
  [v4 safelySetObject:v5 forKey:@"financingPlanIdentifier"];

  uint64_t v6 = [(PKPayLaterPayment *)self->_payment paymentIdentifier];
  [v4 safelySetObject:v6 forKey:@"paymentIdentifier"];

  v7 = [(PKPayLaterInstallment *)self->_installment installmentIdentifier];
  [v4 safelySetObject:v7 forKey:@"installmentIdentifier"];

  v8 = [(PKPayLaterFinancingPlan *)self->_financingPlan merchant];
  objc_super v9 = [v8 displayName];
  [v4 safelySetObject:v9 forKey:@"merchantName"];

  v10 = [(PKPayLaterFinancingPlan *)self->_financingPlan planSummary];
  v11 = [v10 totalAmount];

  if (v11)
  {
    v12 = +[PKAccountWebServiceRequest currencyAmountFormattedDictionary:v11];
    [v4 safelySetObject:v12 forKey:@"financingPlanTotalAmount"];
  }
  v13 = [(PKPayLaterPayment *)self->_payment amount];
  if (v13)
  {
    v14 = +[PKAccountWebServiceRequest currencyAmountFormattedDictionary:v13];
    [v4 safelySetObject:v14 forKey:@"paymentAmount"];
  }
  v15 = [(PKPayLaterPayment *)self->_payment postedDate];
  v16 = v15;
  if (v15)
  {
    v17 = PKISO8601DateStringFromDate(v15);
    [v4 safelySetObject:v17 forKey:@"paymentPostedDate"];
  }
  v18 = (void *)[v4 copy];

  return v18;
}

- (PKPayLaterFinancingPlan)financingPlan
{
  return self->_financingPlan;
}

- (void)setFinancingPlan:(id)a3
{
}

- (PKPayLaterPayment)payment
{
  return self->_payment;
}

- (void)setPayment:(id)a3
{
}

- (PKPayLaterInstallment)installment
{
  return self->_installment;
}

- (void)setInstallment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installment, 0);
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
  objc_storeStrong((id *)&self->_contextString, 0);
}

@end