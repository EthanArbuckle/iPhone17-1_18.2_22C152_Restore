@interface SASmsGroupSearch
+ (id)groupSearch;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSString)smsGroupName;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSmsGroupName:(id)a3;
@end

@implementation SASmsGroupSearch

- (id)groupIdentifier
{
  return @"com.apple.ace.sms";
}

- (id)encodedClassName
{
  return @"GroupSearch";
}

+ (id)groupSearch
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)smsGroupName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"smsGroupName"];
}

- (void)setSmsGroupName:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end