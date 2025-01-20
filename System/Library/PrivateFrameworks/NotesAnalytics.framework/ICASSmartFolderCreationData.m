@interface ICASSmartFolderCreationData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASFilterCondition)filterCondition;
- (ICASFolderCreationApproach)folderCreationApproach;
- (ICASSmartFolderCreationData)initWithFolderCreationApproach:(id)a3 countOfTags:(id)a4 filterCondition:(id)a5 enabledFiltersArray:(id)a6;
- (NSArray)enabledFiltersArray;
- (NSNumber)countOfTags;
- (id)toDict;
@end

@implementation ICASSmartFolderCreationData

- (ICASSmartFolderCreationData)initWithFolderCreationApproach:(id)a3 countOfTags:(id)a4 filterCondition:(id)a5 enabledFiltersArray:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICASSmartFolderCreationData;
  v15 = [(ICASSmartFolderCreationData *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_folderCreationApproach, a3);
    objc_storeStrong((id *)&v16->_countOfTags, a4);
    objc_storeStrong((id *)&v16->_filterCondition, a5);
    objc_storeStrong((id *)&v16->_enabledFiltersArray, a6);
  }

  return v16;
}

+ (NSString)dataName
{
  return (NSString *)@"SmartFolderCreationData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v18[4] = *MEMORY[0x1E4F143B8];
  v17[0] = @"folderCreationApproach";
  v3 = [(ICASSmartFolderCreationData *)self folderCreationApproach];
  if (v3)
  {
    uint64_t v4 = [(ICASSmartFolderCreationData *)self folderCreationApproach];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v18[0] = v4;
  v17[1] = @"countOfTags";
  v6 = [(ICASSmartFolderCreationData *)self countOfTags];
  if (v6)
  {
    uint64_t v7 = [(ICASSmartFolderCreationData *)self countOfTags];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v18[1] = v7;
  v17[2] = @"filterCondition";
  v9 = [(ICASSmartFolderCreationData *)self filterCondition];
  if (v9)
  {
    uint64_t v10 = [(ICASSmartFolderCreationData *)self filterCondition];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  id v11 = (void *)v10;
  v18[2] = v10;
  v17[3] = @"enabledFiltersArray";
  id v12 = [(ICASSmartFolderCreationData *)self enabledFiltersArray];
  if (v12)
  {
    uint64_t v13 = [(ICASSmartFolderCreationData *)self enabledFiltersArray];
  }
  else
  {
    uint64_t v13 = objc_opt_new();
  }
  id v14 = (void *)v13;
  v18[3] = v13;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

  return v15;
}

- (ICASFolderCreationApproach)folderCreationApproach
{
  return self->_folderCreationApproach;
}

- (NSNumber)countOfTags
{
  return self->_countOfTags;
}

- (ICASFilterCondition)filterCondition
{
  return self->_filterCondition;
}

- (NSArray)enabledFiltersArray
{
  return self->_enabledFiltersArray;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledFiltersArray, 0);
  objc_storeStrong((id *)&self->_filterCondition, 0);
  objc_storeStrong((id *)&self->_countOfTags, 0);
  objc_storeStrong((id *)&self->_folderCreationApproach, 0);
}

@end