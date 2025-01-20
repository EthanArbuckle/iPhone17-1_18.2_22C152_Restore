@interface SAPunchoutOutcome
+ (id)punchoutOutcome;
- (BOOL)requiresResponse;
- (NSDictionary)outcomes;
- (NSString)originalCommandId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setOriginalCommandId:(id)a3;
- (void)setOutcomes:(id)a3;
@end

@implementation SAPunchoutOutcome

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"PunchoutOutcome";
}

+ (id)punchoutOutcome
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)originalCommandId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"originalCommandId"];
}

- (void)setOriginalCommandId:(id)a3
{
}

- (NSDictionary)outcomes
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"outcomes"];
}

- (void)setOutcomes:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end