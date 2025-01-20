@interface AEAConcreteOSTransactionPrimitives
- (id)acquireAssessmentModeTransaction;
@end

@implementation AEAConcreteOSTransactionPrimitives

- (id)acquireAssessmentModeTransaction
{
  v2 = (void *)os_transaction_create();
  v3 = sub_100003E68((id *)[AEAConcreteOSTransactionToken alloc], v2);

  return v3;
}

@end