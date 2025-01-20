@interface ICIntentNotesFolderResolutionResult
+ (id)confirmationRequiredWithIntentNotesFolderToConfirm:(id)a3;
+ (id)disambiguationWithIntentNotesFoldersToDisambiguate:(id)a3;
+ (id)successWithResolvedIntentNotesFolder:(id)a3;
@end

@implementation ICIntentNotesFolderResolutionResult

+ (id)successWithResolvedIntentNotesFolder:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___ICIntentNotesFolderResolutionResult;
  [super successWithResolvedObject:a3];

  return v3;
}

+ (id)disambiguationWithIntentNotesFoldersToDisambiguate:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___ICIntentNotesFolderResolutionResult;
  v3 = [super disambiguationWithObjectsToDisambiguate:a3];

  return v3;
}

+ (id)confirmationRequiredWithIntentNotesFolderToConfirm:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___ICIntentNotesFolderResolutionResult;
  v3 = [super confirmationRequiredWithObjectToConfirm:a3];

  return v3;
}

@end