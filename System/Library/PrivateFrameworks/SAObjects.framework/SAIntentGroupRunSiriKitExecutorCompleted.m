@interface SAIntentGroupRunSiriKitExecutorCompleted
+ (id)runSiriKitExecutorCompleted;
- (BOOL)needsServerExecution;
- (BOOL)needsUserInput;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setNeedsServerExecution:(BOOL)a3;
- (void)setNeedsUserInput:(BOOL)a3;
@end

@implementation SAIntentGroupRunSiriKitExecutorCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"RunSiriKitExecutorCompleted";
}

+ (id)runSiriKitExecutorCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)needsServerExecution
{
  return AceObjectBoolForProperty(self, @"needsServerExecution");
}

- (void)setNeedsServerExecution:(BOOL)a3
{
}

- (BOOL)needsUserInput
{
  return AceObjectBoolForProperty(self, @"needsUserInput");
}

- (void)setNeedsUserInput:(BOOL)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end