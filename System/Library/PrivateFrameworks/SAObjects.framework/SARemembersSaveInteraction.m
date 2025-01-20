@interface SARemembersSaveInteraction
+ (id)saveInteraction;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSString)jsonEncodedIntent;
- (NSString)jsonEncodedIntentResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setJsonEncodedIntent:(id)a3;
- (void)setJsonEncodedIntentResponse:(id)a3;
@end

@implementation SARemembersSaveInteraction

- (id)groupIdentifier
{
  return @"com.apple.ace.remembers";
}

- (id)encodedClassName
{
  return @"SaveInteraction";
}

+ (id)saveInteraction
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)jsonEncodedIntent
{
  return (NSString *)[(AceObject *)self propertyForKey:@"jsonEncodedIntent"];
}

- (void)setJsonEncodedIntent:(id)a3
{
}

- (NSString)jsonEncodedIntentResponse
{
  return (NSString *)[(AceObject *)self propertyForKey:@"jsonEncodedIntentResponse"];
}

- (void)setJsonEncodedIntentResponse:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end