@interface PXActionRecord
- (NSString)publicDescription;
- (NSString)sourceIdentifier;
- (NSString)variant;
- (PXActionRecord)init;
- (PXActionRecord)initWithSourceIdentifier:(id)a3 assetCount:(int64_t)a4;
- (PXActionRecord)initWithSourceIdentifier:(id)a3 assetCount:(int64_t)a4 userConfirmation:(int64_t)a5;
- (PXActionRecord)initWithSourceIdentifier:(id)a3 variant:(id)a4 assetCount:(int64_t)a5 userConfirmation:(int64_t)a6;
- (id)withUserConfirmation:(int64_t)a3 assetCount:(int64_t)a4;
- (id)withVariant:(id)a3;
- (int64_t)assetCount;
- (int64_t)userConfirmation;
@end

@implementation PXActionRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variant, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
}

- (int64_t)userConfirmation
{
  return self->_userConfirmation;
}

- (int64_t)assetCount
{
  return self->_assetCount;
}

- (NSString)variant
{
  return self->_variant;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (id)withUserConfirmation:(int64_t)a3 assetCount:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(PXActionRecord *)self assetCount] != a4)
  {
    v7 = PLUIActionsGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = PXActionUserConfirmationDescription(a3);
      int v14 = 134218498;
      int64_t v15 = a4;
      __int16 v16 = 2114;
      v17 = v8;
      __int16 v18 = 2114;
      v19 = self;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "asset count (%ti) mismatch when changing user confirmation (%{public}@) of %{public}@", (uint8_t *)&v14, 0x20u);
    }
  }
  id v9 = objc_alloc((Class)objc_opt_class());
  v10 = [(PXActionRecord *)self sourceIdentifier];
  v11 = [(PXActionRecord *)self variant];
  v12 = (void *)[v9 initWithSourceIdentifier:v10 variant:v11 assetCount:a4 userConfirmation:a3];

  return v12;
}

- (id)withVariant:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(PXActionRecord *)self sourceIdentifier];
  v7 = objc_msgSend(v5, "initWithSourceIdentifier:variant:assetCount:userConfirmation:", v6, v4, -[PXActionRecord assetCount](self, "assetCount"), -[PXActionRecord userConfirmation](self, "userConfirmation"));

  return v7;
}

- (NSString)publicDescription
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = NSString;
  id v5 = [(PXActionRecord *)self sourceIdentifier];
  v6 = [v4 stringWithFormat:@"source: %@", v5];
  [v3 addObject:v6];

  v7 = [(PXActionRecord *)self variant];

  if (v7)
  {
    v8 = NSString;
    id v9 = [(PXActionRecord *)self variant];
    v10 = [v8 stringWithFormat:@"variant: %@", v9];
    [v3 addObject:v10];
  }
  if ([(PXActionRecord *)self assetCount] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = objc_msgSend(NSString, "stringWithFormat:", @"assetCount: %ti", -[PXActionRecord assetCount](self, "assetCount"));
    [v3 addObject:v11];
  }
  v12 = NSString;
  v13 = PXActionUserConfirmationDescription([(PXActionRecord *)self userConfirmation]);
  int v14 = [v12 stringWithFormat:@"userConfirmation: %@", v13];
  [v3 addObject:v14];

  int64_t v15 = NSString;
  __int16 v16 = [v3 componentsJoinedByString:@", "];
  v17 = [v15 stringWithFormat:@"{%@}", v16];

  return (NSString *)v17;
}

- (PXActionRecord)initWithSourceIdentifier:(id)a3 variant:(id)a4 assetCount:(int64_t)a5 userConfirmation:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PXActionRecord;
  v12 = [(PXActionRecord *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    sourceIdentifier = v12->_sourceIdentifier;
    v12->_sourceIdentifier = (NSString *)v13;

    uint64_t v15 = [v11 copy];
    variant = v12->_variant;
    v12->_variant = (NSString *)v15;

    v12->_assetCount = a5;
    v12->_userConfirmation = a6;
  }

  return v12;
}

- (PXActionRecord)initWithSourceIdentifier:(id)a3 assetCount:(int64_t)a4 userConfirmation:(int64_t)a5
{
  return [(PXActionRecord *)self initWithSourceIdentifier:a3 variant:0 assetCount:a4 userConfirmation:a5];
}

- (PXActionRecord)initWithSourceIdentifier:(id)a3 assetCount:(int64_t)a4
{
  return [(PXActionRecord *)self initWithSourceIdentifier:a3 assetCount:a4 userConfirmation:0];
}

- (PXActionRecord)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXActionRecord.m", 46, @"%s is not available as initializer", "-[PXActionRecord init]");

  abort();
}

@end