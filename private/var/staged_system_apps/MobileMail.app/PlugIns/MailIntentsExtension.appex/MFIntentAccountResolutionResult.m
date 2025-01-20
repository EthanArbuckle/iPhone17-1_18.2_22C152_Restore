@interface MFIntentAccountResolutionResult
+ (BOOL)supportsSecureCoding;
+ (id)confirmationRequiredWithMFIntentAccountToConfirm:(id)a3;
+ (id)disambiguationWithMFIntentAccountsToDisambiguate:(id)a3;
+ (id)successWithResolvedMFIntentAccount:(id)a3;
@end

@implementation MFIntentAccountResolutionResult

+ (id)successWithResolvedMFIntentAccount:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___MFIntentAccountResolutionResult;
  [super successWithResolvedObject:a3];

  return v3;
}

+ (id)disambiguationWithMFIntentAccountsToDisambiguate:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___MFIntentAccountResolutionResult;
  v3 = [super disambiguationWithObjectsToDisambiguate:a3];

  return v3;
}

+ (id)confirmationRequiredWithMFIntentAccountToConfirm:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___MFIntentAccountResolutionResult;
  v3 = [super confirmationRequiredWithObjectToConfirm:a3];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end