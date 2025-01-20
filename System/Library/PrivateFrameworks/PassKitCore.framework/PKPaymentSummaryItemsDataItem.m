@interface PKPaymentSummaryItemsDataItem
+ (int64_t)dataType;
- (BOOL)isValidWithError:(id *)a3;
- (NSArray)paymentSummaryItems;
- (NSString)currencyCode;
- (int64_t)context;
@end

@implementation PKPaymentSummaryItemsDataItem

+ (int64_t)dataType
{
  return 8;
}

- (int64_t)context
{
  return 3;
}

- (NSString)currencyCode
{
  v2 = [(PKPaymentDataItem *)self model];
  v3 = [v2 currencyCode];

  return (NSString *)v3;
}

- (NSArray)paymentSummaryItems
{
  v2 = [(PKPaymentDataItem *)self model];
  v3 = [v2 paymentSummaryItems];

  return (NSArray *)v3;
}

- (BOOL)isValidWithError:(id *)a3
{
  return 1;
}

@end