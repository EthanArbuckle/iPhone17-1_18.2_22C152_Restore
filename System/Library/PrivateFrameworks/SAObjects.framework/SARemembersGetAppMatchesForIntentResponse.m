@interface SARemembersGetAppMatchesForIntentResponse
+ (id)getAppMatchesForIntentResponse;
- (BOOL)requiresResponse;
- (NSArray)matchingBundleIDs;
- (NSString)jsonMatchSignals;
- (NSString)matchStatus;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setJsonMatchSignals:(id)a3;
- (void)setMatchStatus:(id)a3;
- (void)setMatchingBundleIDs:(id)a3;
@end

@implementation SARemembersGetAppMatchesForIntentResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.remembers";
}

- (id)encodedClassName
{
  return @"GetAppMatchesForIntentResponse";
}

+ (id)getAppMatchesForIntentResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)jsonMatchSignals
{
  return (NSString *)[(AceObject *)self propertyForKey:@"jsonMatchSignals"];
}

- (void)setJsonMatchSignals:(id)a3
{
}

- (NSString)matchStatus
{
  return (NSString *)[(AceObject *)self propertyForKey:@"matchStatus"];
}

- (void)setMatchStatus:(id)a3
{
}

- (NSArray)matchingBundleIDs
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"matchingBundleIDs"];
}

- (void)setMatchingBundleIDs:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end