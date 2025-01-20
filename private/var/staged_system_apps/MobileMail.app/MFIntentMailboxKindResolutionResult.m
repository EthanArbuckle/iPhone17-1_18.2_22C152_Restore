@interface MFIntentMailboxKindResolutionResult
+ (id)confirmationRequiredWithMFIntentMailboxKindToConfirm:(int64_t)a3;
+ (id)successWithResolvedMFIntentMailboxKind:(int64_t)a3;
@end

@implementation MFIntentMailboxKindResolutionResult

+ (id)successWithResolvedMFIntentMailboxKind:(int64_t)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___MFIntentMailboxKindResolutionResult;
  v3 = [super successWithResolvedValue:a3];

  return v3;
}

+ (id)confirmationRequiredWithMFIntentMailboxKindToConfirm:(int64_t)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___MFIntentMailboxKindResolutionResult;
  [super confirmationRequiredWithValueToConfirm:a3];

  return v3;
}

@end