@interface PKAccountWebServiceTransferEligibilityResponse
- (NSDecimalNumber)overflowAmount;
- (PKAccountWebServiceTransferEligibilityResponse)initWithData:(id)a3;
- (PKAccountWebServiceTransferEligibilityResponse)initWithData:(id)a3 account:(id)a4 request:(id)a5;
- (unint64_t)eligibility;
@end

@implementation PKAccountWebServiceTransferEligibilityResponse

- (PKAccountWebServiceTransferEligibilityResponse)initWithData:(id)a3
{
  return [(PKAccountWebServiceTransferEligibilityResponse *)self initWithData:a3 account:0 request:0];
}

- (PKAccountWebServiceTransferEligibilityResponse)initWithData:(id)a3 account:(id)a4 request:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)PKAccountWebServiceTransferEligibilityResponse;
  v5 = -[PKWebServiceResponse initWithData:](&v13, sel_initWithData_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    v7 = [(PKWebServiceResponse *)v5 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      v9 = [v8 PKStringForKey:@"eligibility"];
      v6->_eligibility = PKAccountTransferEligibilityFromString(v9);

      uint64_t v10 = [v8 PKDecimalNumberForKey:@"overflowAmount"];

      overflowAmount = v6->_overflowAmount;
      v6->_overflowAmount = (NSDecimalNumber *)v10;
    }
  }
  return v6;
}

- (unint64_t)eligibility
{
  return self->_eligibility;
}

- (NSDecimalNumber)overflowAmount
{
  return self->_overflowAmount;
}

- (void).cxx_destruct
{
}

@end