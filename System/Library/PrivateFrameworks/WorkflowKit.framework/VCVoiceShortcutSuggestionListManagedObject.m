@interface VCVoiceShortcutSuggestionListManagedObject
+ (id)fetchRequest;
- (id)descriptor;
@end

@implementation VCVoiceShortcutSuggestionListManagedObject

- (id)descriptor
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28DC0];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v6 = [v4 setWithArray:v5];
  v7 = [(VCVoiceShortcutSuggestionListManagedObject *)self serializedSuggestions];
  v8 = [v3 unarchivedObjectOfClasses:v6 fromData:v7 error:0];

  v9 = [WFShortcutSuggestionsDescriptor alloc];
  v10 = [(VCVoiceShortcutSuggestionListManagedObject *)self associatedAppBundleIdentifier];
  if (v8) {
    v11 = v8;
  }
  else {
    v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v12 = [(WFShortcutSuggestionsDescriptor *)v9 initWithIdentifier:v10 suggestions:v11 availability:(int)[(VCVoiceShortcutSuggestionListManagedObject *)self shortcutAvailabilityOptions]];

  return v12;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"VCVoiceShortcutSuggestionListManagedObject"];
}

@end