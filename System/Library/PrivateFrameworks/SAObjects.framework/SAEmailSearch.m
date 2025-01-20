@interface SAEmailSearch
+ (id)search;
- (BOOL)requiresResponse;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)fromEmail;
- (NSString)subject;
- (NSString)timeZoneId;
- (NSString)toEmail;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int)status;
- (void)setEndDate:(id)a3;
- (void)setFromEmail:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setStatus:(int)a3;
- (void)setSubject:(id)a3;
- (void)setTimeZoneId:(id)a3;
- (void)setToEmail:(id)a3;
@end

@implementation SAEmailSearch

- (id)groupIdentifier
{
  return @"com.apple.ace.email";
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

- (NSDate)endDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"endDate"];
}

- (void)setEndDate:(id)a3
{
}

- (NSString)fromEmail
{
  return (NSString *)[(AceObject *)self propertyForKey:@"fromEmail"];
}

- (void)setFromEmail:(id)a3
{
}

- (NSDate)startDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"startDate"];
}

- (void)setStartDate:(id)a3
{
}

- (int)status
{
  id v2 = [(AceObject *)self propertyForKey:@"status"];
  int v3 = SAEmailSearchStatusForString(v2);

  return v3;
}

- (void)setStatus:(int)a3
{
  stringForSAEmailSearchStatus(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  AceObjectSetCopyingObjectForProperty(self, @"status", v4);
}

- (NSString)subject
{
  return (NSString *)[(AceObject *)self propertyForKey:@"subject"];
}

- (void)setSubject:(id)a3
{
}

- (NSString)timeZoneId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"timeZoneId"];
}

- (void)setTimeZoneId:(id)a3
{
}

- (NSString)toEmail
{
  return (NSString *)[(AceObject *)self propertyForKey:@"toEmail"];
}

- (void)setToEmail:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end