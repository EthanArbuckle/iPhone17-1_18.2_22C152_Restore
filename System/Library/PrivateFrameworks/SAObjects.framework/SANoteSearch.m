@interface SANoteSearch
+ (id)search;
- (BOOL)requiresResponse;
- (NSDate)fromDate;
- (NSDate)toDate;
- (NSString)contentQuery;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setContentQuery:(id)a3;
- (void)setFromDate:(id)a3;
- (void)setToDate:(id)a3;
@end

@implementation SANoteSearch

- (id)groupIdentifier
{
  return @"com.apple.ace.note";
}

- (id)encodedClassName
{
  return @"Search";
}

+ (id)search
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)contentQuery
{
  return (NSString *)[(AceObject *)self propertyForKey:@"contentQuery"];
}

- (void)setContentQuery:(id)a3
{
}

- (NSDate)fromDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"fromDate"];
}

- (void)setFromDate:(id)a3
{
}

- (NSDate)toDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"toDate"];
}

- (void)setToDate:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end