@interface ICIntentNoteResolutionResult
+ (id)confirmationRequiredWithIntentNoteToConfirm:(id)a3;
+ (id)disambiguationWithIntentNotesToDisambiguate:(id)a3;
+ (id)successWithResolvedIntentNote:(id)a3;
@end

@implementation ICIntentNoteResolutionResult

+ (id)successWithResolvedIntentNote:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___ICIntentNoteResolutionResult;
  [super successWithResolvedObject:a3];

  return v3;
}

+ (id)disambiguationWithIntentNotesToDisambiguate:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___ICIntentNoteResolutionResult;
  v3 = [super disambiguationWithObjectsToDisambiguate:a3];

  return v3;
}

+ (id)confirmationRequiredWithIntentNoteToConfirm:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___ICIntentNoteResolutionResult;
  v3 = [super confirmationRequiredWithObjectToConfirm:a3];

  return v3;
}

@end