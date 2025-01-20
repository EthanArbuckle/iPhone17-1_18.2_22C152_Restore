@interface PKAccountTransferExternalAccount
- (id)hashComponent;
@end

@implementation PKAccountTransferExternalAccount

- (id)hashComponent
{
  v3 = [MEMORY[0x1E4F28E78] string];
  int64_t v4 = [(PKAccountPaymentFundingSource *)self type];
  switch(v4)
  {
    case 4:
      v6 = PKAccountFundingSourceTypeStringSavings;
LABEL_7:
      [v3 appendString:*v6];
      break;
    case 2:
      v6 = PKAccountFundingSourceTypeStringApplePayCash;
      goto LABEL_7;
    case 1:
      [v3 appendString:@"ACH"];
      v5 = [(PKAccountPaymentFundingSource *)self identifier];
      [v3 appendString:v5];

      break;
  }
  v7 = (void *)[v3 copy];

  return v7;
}

@end