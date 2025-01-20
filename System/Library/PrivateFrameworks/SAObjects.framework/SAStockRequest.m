@interface SAStockRequest
+ (id)request;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)requestType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEndDate:(id)a3;
- (void)setRequestType:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation SAStockRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.stock";
}

- (id)encodedClassName
{
  return @"Request";
}

+ (id)request
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDate)endDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"endDate"];
}

- (void)setEndDate:(id)a3
{
}

- (NSString)requestType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"requestType"];
}

- (void)setRequestType:(id)a3
{
}

- (NSDate)startDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"startDate"];
}

- (void)setStartDate:(id)a3
{
}

@end