@interface TagResolutionResult
+ (BOOL)supportsSecureCoding;
+ (id)confirmationRequiredWithTagToConfirm:(id)a3;
+ (id)disambiguationWithTagsToDisambiguate:(id)a3;
+ (id)successWithResolvedTag:(id)a3;
@end

@implementation TagResolutionResult

+ (id)successWithResolvedTag:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___TagResolutionResult;
  [super successWithResolvedObject:a3];

  return v3;
}

+ (id)disambiguationWithTagsToDisambiguate:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___TagResolutionResult;
  v3 = [super disambiguationWithObjectsToDisambiguate:a3];

  return v3;
}

+ (id)confirmationRequiredWithTagToConfirm:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___TagResolutionResult;
  v3 = [super confirmationRequiredWithObjectToConfirm:a3];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end