@interface SARemembersGetAppMatchesForIntent
+ (id)getAppMatchesForIntent;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)candidateBundleIDs;
- (NSString)jsonEncodedIntent;
- (SAIntentGroupProtobufMessage)protoEncodedIntent;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCandidateBundleIDs:(id)a3;
- (void)setJsonEncodedIntent:(id)a3;
- (void)setProtoEncodedIntent:(id)a3;
@end

@implementation SARemembersGetAppMatchesForIntent

- (id)groupIdentifier
{
  return @"com.apple.ace.remembers";
}

- (id)encodedClassName
{
  return @"GetAppMatchesForIntent";
}

+ (id)getAppMatchesForIntent
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)candidateBundleIDs
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"candidateBundleIDs"];
}

- (void)setCandidateBundleIDs:(id)a3
{
}

- (NSString)jsonEncodedIntent
{
  return (NSString *)[(AceObject *)self propertyForKey:@"jsonEncodedIntent"];
}

- (void)setJsonEncodedIntent:(id)a3
{
}

- (SAIntentGroupProtobufMessage)protoEncodedIntent
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, @"protoEncodedIntent");
}

- (void)setProtoEncodedIntent:(id)a3
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