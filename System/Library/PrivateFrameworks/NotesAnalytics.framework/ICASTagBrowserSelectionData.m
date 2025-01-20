@interface ICASTagBrowserSelectionData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASTagBrowserSelectionData)initWithCountOfSelectedTags:(id)a3 isAllTagsSelected:(id)a4;
- (NSNumber)countOfSelectedTags;
- (NSNumber)isAllTagsSelected;
- (id)toDict;
@end

@implementation ICASTagBrowserSelectionData

- (ICASTagBrowserSelectionData)initWithCountOfSelectedTags:(id)a3 isAllTagsSelected:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASTagBrowserSelectionData;
  v9 = [(ICASTagBrowserSelectionData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_countOfSelectedTags, a3);
    objc_storeStrong((id *)&v10->_isAllTagsSelected, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"TagBrowserSelectionData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"countOfSelectedTags";
  v3 = [(ICASTagBrowserSelectionData *)self countOfSelectedTags];
  if (v3)
  {
    uint64_t v4 = [(ICASTagBrowserSelectionData *)self countOfSelectedTags];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"isAllTagsSelected";
  v12[0] = v4;
  v6 = [(ICASTagBrowserSelectionData *)self isAllTagsSelected];
  if (v6)
  {
    uint64_t v7 = [(ICASTagBrowserSelectionData *)self isAllTagsSelected];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  id v8 = (void *)v7;
  v12[1] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (NSNumber)countOfSelectedTags
{
  return self->_countOfSelectedTags;
}

- (NSNumber)isAllTagsSelected
{
  return self->_isAllTagsSelected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isAllTagsSelected, 0);
  objc_storeStrong((id *)&self->_countOfSelectedTags, 0);
}

@end