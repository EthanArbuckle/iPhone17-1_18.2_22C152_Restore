@interface PKPaymentCouponCodeDataItem
+ (int64_t)dataType;
- (BOOL)isAwaitingCouponCodeUpdate;
- (BOOL)isValidWithError:(id *)a3;
- (NSArray)errors;
- (NSString)couponCode;
- (int64_t)context;
@end

@implementation PKPaymentCouponCodeDataItem

+ (int64_t)dataType
{
  return 11;
}

- (int64_t)context
{
  return 3;
}

- (BOOL)isValidWithError:(id *)a3
{
  return 1;
}

- (NSString)couponCode
{
  v2 = [(PKPaymentDataItem *)self model];
  v3 = [v2 couponCode];

  return (NSString *)v3;
}

- (BOOL)isAwaitingCouponCodeUpdate
{
  v2 = [(PKPaymentDataItem *)self model];
  BOOL v3 = [v2 numberOfOutstandingCouponCodeUpdates] != 0;

  return v3;
}

- (NSArray)errors
{
  v2 = [(PKPaymentDataItem *)self model];
  BOOL v3 = [v2 paymentErrors];
  v4 = objc_msgSend(v3, "pk_objectsPassingTest:", &__block_literal_global_369);

  return (NSArray *)v4;
}

BOOL __37__PKPaymentCouponCodeDataItem_errors__block_invoke(uint64_t a1, void *a2)
{
  return PKIsCouponCodeError(a2);
}

@end