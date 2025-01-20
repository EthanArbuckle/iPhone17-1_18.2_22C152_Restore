@interface PPSSubmissionRecord
- (BOOL)isExpedited;
- (BOOL)isValid;
- (NSDictionary)contextDictionary;
- (NSString)fileType;
- (NSString)issueCategory;
- (NSString)issueDescription;
- (NSString)recordType;
- (NSString)targetContainer;
- (NSURL)filePath;
- (id)description;
- (void)cleanup;
- (void)setContextDictionary:(id)a3;
- (void)setFilePath:(id)a3;
- (void)setFileType:(id)a3;
- (void)setIsExpedited:(BOOL)a3;
- (void)setIssueCategory:(id)a3;
- (void)setIssueDescription:(id)a3;
- (void)setRecordType:(id)a3;
- (void)setTargetContainer:(id)a3;
@end

@implementation PPSSubmissionRecord

- (void)cleanup
{
  if (+[PLDefaults BOOLForKey:@"PLSubmissionCleanup" ifNotSet:1])
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    v3 = [(PPSSubmissionRecord *)self filePath];
    [v4 removeItemAtURL:v3 error:0];
  }
}

- (id)description
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = NSString;
  v5 = [(PPSSubmissionRecord *)self filePath];
  v6 = [v4 stringWithFormat:@"filePath='%@'", v5];
  [v3 addObject:v6];

  v7 = NSString;
  v8 = [(PPSSubmissionRecord *)self fileType];
  v9 = [v7 stringWithFormat:@"fileType='%@'", v8];
  [v3 addObject:v9];

  v10 = NSString;
  v11 = [(PPSSubmissionRecord *)self issueCategory];
  v12 = [v10 stringWithFormat:@"issueCategory='%@'", v11];
  [v3 addObject:v12];

  v13 = NSString;
  v14 = [(PPSSubmissionRecord *)self issueDescription];
  v15 = [v13 stringWithFormat:@"issueDescription='%@'", v14];
  [v3 addObject:v15];

  v16 = NSString;
  v17 = [(PPSSubmissionRecord *)self recordType];
  v18 = [v16 stringWithFormat:@"recordType='%@'", v17];
  [v3 addObject:v18];

  v19 = NSString;
  v20 = [(PPSSubmissionRecord *)self targetContainer];
  v21 = [v19 stringWithFormat:@"targetContainer='%@'", v20];
  [v3 addObject:v21];

  v22 = [(PPSSubmissionRecord *)self contextDictionary];
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  v30 = __34__PPSSubmissionRecord_description__block_invoke;
  v31 = &unk_1E62540E8;
  id v32 = v3;
  id v23 = v3;
  [v22 enumerateKeysAndObjectsUsingBlock:&v28];

  v24 = NSString;
  v25 = [v23 componentsJoinedByString:@","];
  v26 = [v24 stringWithFormat:@"<PPSSubmissionRecord: %@>", v25, v28, v29, v30, v31];

  return v26;
}

void __34__PPSSubmissionRecord_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  [NSString stringWithFormat:@"%@='%@'", a2, a3];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 addObject:v4];
}

- (BOOL)isValid
{
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [(PPSSubmissionRecord *)self filePath];
  v5 = [v4 path];
  int v6 = [v3 fileExistsAtPath:v5];

  if (!v6) {
    return 0;
  }
  v7 = [(PPSSubmissionRecord *)self fileType];
  if (v7)
  {
    v8 = [(PPSSubmissionRecord *)self issueCategory];
    if (v8)
    {
      v9 = [(PPSSubmissionRecord *)self recordType];
      if (v9)
      {
        v10 = [(PPSSubmissionRecord *)self targetContainer];
        BOOL v11 = v10 != 0;
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (NSDictionary)contextDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContextDictionary:(id)a3
{
}

- (NSURL)filePath
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFilePath:(id)a3
{
}

- (NSString)fileType
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFileType:(id)a3
{
}

- (NSString)issueCategory
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIssueCategory:(id)a3
{
}

- (NSString)issueDescription
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIssueDescription:(id)a3
{
}

- (BOOL)isExpedited
{
  return self->_isExpedited;
}

- (void)setIsExpedited:(BOOL)a3
{
  self->_isExpedited = a3;
}

- (NSString)recordType
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRecordType:(id)a3
{
}

- (NSString)targetContainer
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTargetContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetContainer, 0);
  objc_storeStrong((id *)&self->_recordType, 0);
  objc_storeStrong((id *)&self->_issueDescription, 0);
  objc_storeStrong((id *)&self->_issueCategory, 0);
  objc_storeStrong((id *)&self->_fileType, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_contextDictionary, 0);
}

@end