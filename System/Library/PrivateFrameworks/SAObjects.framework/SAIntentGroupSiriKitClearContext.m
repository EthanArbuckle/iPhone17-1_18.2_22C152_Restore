@interface SAIntentGroupSiriKitClearContext
+ (id)siriKitClearContext;
+ (id)siriKitClearContextWithReason:(id)a3;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSString)reason;
- (SAIntentGroupSiriKitClearContext)initWithReason:(id)a3;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setReason:(id)a3;
@end

@implementation SAIntentGroupSiriKitClearContext

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"SiriKitClearContext";
}

+ (id)siriKitClearContext
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (id)siriKitClearContextWithReason:(id)a3
{
  id v3 = a3;
  v4 = [[SAIntentGroupSiriKitClearContext alloc] initWithReason:v3];

  return v4;
}

- (SAIntentGroupSiriKitClearContext)initWithReason:(id)a3
{
  id v4 = a3;
  v5 = [(AceObject *)self init];
  v6 = v5;
  if (v5) {
    [(SAIntentGroupSiriKitClearContext *)v5 setReason:v4];
  }

  return v6;
}

- (NSString)reason
{
  return (NSString *)[(AceObject *)self propertyForKey:@"reason"];
}

- (void)setReason:(id)a3
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