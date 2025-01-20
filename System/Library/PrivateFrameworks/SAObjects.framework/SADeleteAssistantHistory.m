@interface SADeleteAssistantHistory
+ (id)deleteAssistantHistory;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SADeleteAssistantHistory

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"DeleteAssistantHistory";
}

+ (id)deleteAssistantHistory
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 1;
}

@end