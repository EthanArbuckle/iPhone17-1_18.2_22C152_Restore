@interface PKPaymentBalance(NanoPassKit)
+ (id)NPK_paymentBalanceWithAppletBalance:()NanoPassKit;
@end

@implementation PKPaymentBalance(NanoPassKit)

+ (id)NPK_paymentBalanceWithAppletBalance:()NanoPassKit
{
  id v3 = a3;
  v4 = [v3 balance];
  v5 = [v3 currency];
  [v3 exponent];
  v6 = PKCurrencyAmountCreate(v4, v5);

  id v7 = objc_alloc(MEMORY[0x263F5BFB8]);
  v8 = [v3 identifier];

  v9 = (void *)[v7 initWithIdentifier:v8 forCurrencyAmount:v6];
  return v9;
}

@end