@interface PXSuggesterDebugCollectionItem
- (BOOL)isInvalid;
- (NSDate)date;
- (NSDictionary)info;
- (NSString)description;
- (NSString)name;
- (PHSuggestion)suggestion;
- (PXSuggesterDebugCollectionItem)initWithSuggestion:(id)a3 suggestionInfo:(id)a4;
@end

@implementation PXSuggesterDebugCollectionItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (PHSuggestion)suggestion
{
  return (PHSuggestion *)objc_getProperty(self, a2, 32, 1);
}

- (NSDictionary)info
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)description
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)isInvalid
{
  v2 = [(NSDictionary *)self->_info objectForKeyedSubscript:@"isInvalid"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (PXSuggesterDebugCollectionItem)initWithSuggestion:(id)a3 suggestionInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v40.receiver = self;
  v40.super_class = (Class)PXSuggesterDebugCollectionItem;
  v9 = [(PXSuggesterDebugCollectionItem *)&v40 init];
  if (v9)
  {
    v10 = [v7 localizedTitle];
    v11 = [v10 stringByReplacingOccurrencesOfString:@"\\n" withString:@" "];
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      v13 = [v8 objectForKeyedSubscript:@"keyAssetUUID"];
    }
    name = v9->_name;
    v9->_name = v13;

    v15 = [v7 localizedSubtitle];
    uint64_t v16 = [v15 stringByReplacingOccurrencesOfString:@"\\n" withString:@" "];
    p_description = (id *)&v9->_description;
    description = v9->_description;
    v9->_description = (NSString *)v16;

    uint64_t v19 = [(NSString *)v9->_description stringByAppendingString:@", "];
    v20 = (void *)v19;
    if (v19) {
      v21 = (__CFString *)v19;
    }
    else {
      v21 = &stru_1F00B0030;
    }
    objc_storeStrong((id *)&v9->_description, v21);

    id v22 = *p_description;
    v23 = (void *)MEMORY[0x1E4F28C10];
    v24 = [v8 objectForKeyedSubscript:@"keyAssetCreationDate"];
    v25 = [v23 localizedStringFromDate:v24 dateStyle:1 timeStyle:2];
    uint64_t v26 = [v22 stringByAppendingString:v25];
    id v27 = *p_description;
    id *p_description = (id)v26;

    v28 = [v8 objectForKeyedSubscript:@"reasons"];
    if ([v28 count])
    {
      uint64_t v29 = [*p_description stringByAppendingString:@", "];
      id v30 = *p_description;
      id *p_description = (id)v29;

      id v31 = *p_description;
      v32 = [v28 componentsJoinedByString:@", "];
      uint64_t v33 = [v31 stringByAppendingString:v32];
      id v34 = *p_description;
      id *p_description = (id)v33;
    }
    objc_storeStrong((id *)&v9->_suggestion, a3);
    v35 = [v7 startDate];
    v36 = v35;
    if (v35)
    {
      v37 = v35;
    }
    else
    {
      v37 = [v8 objectForKeyedSubscript:@"universalStartDate"];
    }
    date = v9->_date;
    v9->_date = v37;

    objc_storeStrong((id *)&v9->_info, a4);
  }

  return v9;
}

@end