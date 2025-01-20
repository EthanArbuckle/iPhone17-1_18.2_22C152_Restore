@interface SecurityIntentAccessoryResolutionResult
+ (BOOL)supportsSecureCoding;
+ (id)confirmationRequiredWithSecurityIntentAccessoryToConfirm:(id)a3;
+ (id)disambiguationWithSecurityIntentAccessorysToDisambiguate:(id)a3;
+ (id)successWithResolvedSecurityIntentAccessory:(id)a3;
@end

@implementation SecurityIntentAccessoryResolutionResult

+ (id)successWithResolvedSecurityIntentAccessory:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___SecurityIntentAccessoryResolutionResult;
  [super successWithResolvedObject:a3];

  return v3;
}

+ (id)disambiguationWithSecurityIntentAccessorysToDisambiguate:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___SecurityIntentAccessoryResolutionResult;
  v3 = [super disambiguationWithObjectsToDisambiguate:a3];

  return v3;
}

+ (id)confirmationRequiredWithSecurityIntentAccessoryToConfirm:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___SecurityIntentAccessoryResolutionResult;
  v3 = [super confirmationRequiredWithObjectToConfirm:a3];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end