@interface MFIntentMailboxResolutionResult
+ (BOOL)supportsSecureCoding;
+ (id)confirmationRequiredWithMFIntentMailboxToConfirm:(id)a3;
+ (id)disambiguationWithMFIntentMailboxsToDisambiguate:(id)a3;
+ (id)successWithResolvedMFIntentMailbox:(id)a3;
@end

@implementation MFIntentMailboxResolutionResult

+ (id)successWithResolvedMFIntentMailbox:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___MFIntentMailboxResolutionResult;
  v3 = [super successWithResolvedObject:a3];

  return v3;
}

+ (id)disambiguationWithMFIntentMailboxsToDisambiguate:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___MFIntentMailboxResolutionResult;
  [super disambiguationWithObjectsToDisambiguate:a3];

  return v3;
}

+ (id)confirmationRequiredWithMFIntentMailboxToConfirm:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___MFIntentMailboxResolutionResult;
  v3 = [super confirmationRequiredWithObjectToConfirm:a3];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end