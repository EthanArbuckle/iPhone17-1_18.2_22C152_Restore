@interface PKPaymentMultiTokenDataItem
+ (int64_t)dataType;
- (BOOL)isValidWithError:(id *)a3;
- (NSArray)multiTokenContexts;
- (int64_t)context;
@end

@implementation PKPaymentMultiTokenDataItem

- (int64_t)context
{
  return 1;
}

+ (int64_t)dataType
{
  return 13;
}

- (NSArray)multiTokenContexts
{
  v2 = [(PKPaymentDataItem *)self model];
  v3 = [v2 paymentRequest];
  v4 = [v3 multiTokenContexts];

  return (NSArray *)v4;
}

- (BOOL)isValidWithError:(id *)a3
{
  return 1;
}

@end