@interface PXExistingSuggestionsDebugCollectionItem
- (NSString)description;
- (NSString)name;
- (PHSuggestion)suggestion;
- (PXExistingSuggestionsDebugCollectionItem)initWithSuggestion:(id)a3;
@end

@implementation PXExistingSuggestionsDebugCollectionItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (PHSuggestion)suggestion
{
  return (PHSuggestion *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)description
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (PXExistingSuggestionsDebugCollectionItem)initWithSuggestion:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PXExistingSuggestionsDebugCollectionItem;
  v6 = [(PXExistingSuggestionsDebugCollectionItem *)&v28 init];
  if (v6)
  {
    v7 = [MEMORY[0x1E4F38EB8] fetchKeyAssetsInAssetCollection:v5 options:0];
    v8 = [v7 firstObject];

    v9 = [v5 localizedTitle];
    v10 = [v9 stringByReplacingOccurrencesOfString:@"\\n" withString:@" "];
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      v12 = [v8 uuid];
    }
    name = v6->_name;
    v6->_name = v12;

    v14 = [v5 localizedSubtitle];
    uint64_t v15 = [v14 stringByReplacingOccurrencesOfString:@"\\n" withString:@" "];
    p_description = (void **)&v6->_description;
    description = v6->_description;
    v6->_description = (NSString *)v15;

    uint64_t v18 = [(NSString *)v6->_description stringByAppendingString:@", "];
    v19 = (void *)v18;
    if (v18) {
      v20 = (__CFString *)v18;
    }
    else {
      v20 = &stru_1F00B0030;
    }
    objc_storeStrong((id *)&v6->_description, v20);

    v21 = *p_description;
    v22 = (void *)MEMORY[0x1E4F28C10];
    v23 = [v8 creationDate];
    v24 = [v22 localizedStringFromDate:v23 dateStyle:1 timeStyle:2];
    uint64_t v25 = [v21 stringByAppendingString:v24];
    v26 = *p_description;
    *p_description = (void *)v25;

    objc_storeStrong((id *)&v6->_suggestion, a3);
  }

  return v6;
}

@end