@interface NCNotificationRequest(NCUIAdditions)
+ (id)requesterIdentifier;
- (BOOL)hasAttachments;
- (BOOL)hasOnlySingleMinimalTextInputAction;
- (BOOL)hasOnlySingleTextInputAction;
- (id)defaultEnvironmentActions;
- (id)minimalEnvironmentActions;
- (uint64_t)showsTextInputOnAppearance;
@end

@implementation NCNotificationRequest(NCUIAdditions)

+ (id)requesterIdentifier
{
  if (requesterIdentifier_onceToken_0 != -1) {
    dispatch_once(&requesterIdentifier_onceToken_0, &__block_literal_global_39);
  }
  v0 = (void *)requesterIdentifier___requesterIdentifier_0;

  return v0;
}

- (BOOL)hasAttachments
{
  v1 = [a1 userNotification];
  v2 = [v1 request];
  v3 = [v2 content];
  v4 = [v3 attachments];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (BOOL)hasOnlySingleTextInputAction
{
  v1 = [a1 defaultEnvironmentActions];
  if ([v1 count] == 1)
  {
    v2 = [v1 firstObject];
    BOOL v3 = [v2 behavior] == 1;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)hasOnlySingleMinimalTextInputAction
{
  v1 = [a1 minimalEnvironmentActions];
  if ([v1 count] == 1)
  {
    v2 = [v1 firstObject];
    BOOL v3 = [v2 behavior] == 1;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (uint64_t)showsTextInputOnAppearance
{
  uint64_t result = [a1 hasOnlySingleTextInputAction];
  if (result) {
    return [a1 hasAttachments] ^ 1;
  }
  return result;
}

- (id)defaultEnvironmentActions
{
  v1 = [a1 supplementaryActions];
  v2 = [v1 objectForKey:*MEMORY[0x1E4FB3740]];

  return v2;
}

- (id)minimalEnvironmentActions
{
  v1 = [a1 supplementaryActions];
  v2 = [v1 objectForKey:*MEMORY[0x1E4FB3748]];

  return v2;
}

@end