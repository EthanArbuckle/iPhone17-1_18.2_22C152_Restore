@interface WBSCreditCardDataController(CreditCardData)
+ (id)creditCardDataController;
@end

@implementation WBSCreditCardDataController(CreditCardData)

+ (id)creditCardDataController
{
  return +[WBUCreditCardDataController sharedCreditCardDataController];
}

@end