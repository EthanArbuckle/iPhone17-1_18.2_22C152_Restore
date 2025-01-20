@interface PKPaymentShippingMethodDataItem
+ (int64_t)dataType;
- (BOOL)isValidWithError:(id *)a3;
- (PKShippingMethod)shippingMethod;
- (int64_t)context;
@end

@implementation PKPaymentShippingMethodDataItem

+ (int64_t)dataType
{
  return 6;
}

- (PKShippingMethod)shippingMethod
{
  v2 = [(PKPaymentDataItem *)self model];
  v3 = [v2 shippingMethod];

  return (PKShippingMethod *)v3;
}

- (BOOL)isValidWithError:(id *)a3
{
  return 1;
}

- (int64_t)context
{
  return 3;
}

@end