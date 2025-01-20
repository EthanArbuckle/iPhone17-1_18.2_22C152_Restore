@interface CKRecord(IC)
+ (CKRecordSystemFieldsTransformer)ic_systemFieldsValueTransformer;
+ (id)ic_assetKeyForKeyPrefix:()IC;
+ (id)ic_encryptedDataKeyForAssetKey:()IC;
+ (id)ic_encryptedKeyForKeyPrefix:()IC;
+ (uint64_t)ic_valueKeyForKeyPrefix:()IC;
- (BOOL)ic_hasMetadata;
- (BOOL)ic_shouldUseAssetForInlineableDataAsset:()IC approach:;
- (id)ic_copyWithUserFields:()IC;
- (id)ic_encryptedInlineableDataAssetForKeyPrefix:()IC;
- (id)ic_inlineableDataAssetForKeyPrefix:()IC;
- (id)ic_loggingDescription;
- (uint64_t)databaseScope;
- (uint64_t)ic_isOwnedByCurrentUser;
- (void)ic_inlineDataAssetForKeyPrefix:()IC;
- (void)ic_inlineEncryptedDataAssetForKeyPrefix:()IC;
- (void)ic_setEncryptedInlineableDataAsset:()IC forKeyPrefix:approach:;
- (void)ic_setInlineableDataAsset:()IC forKeyPrefix:approach:;
@end

@implementation CKRecord(IC)

+ (CKRecordSystemFieldsTransformer)ic_systemFieldsValueTransformer
{
  uint64_t v0 = objc_opt_class();
  if (v0 != objc_opt_class()) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"[self class] == [CKRecord class]", "+[CKRecord(IC) ic_systemFieldsValueTransformer]", 1, 0, @"-ic_systemFieldsValueTransformer must be overridden, and must not call super: %@", objc_opt_class() functionName simulateCrash showAlert format];
  }
  v1 = objc_alloc_init(CKRecordSystemFieldsTransformer);
  return v1;
}

- (id)ic_loggingDescription
{
  v2 = (void *)MEMORY[0x1E4F28E78];
  v3 = [a1 recordType];
  v4 = [a1 recordID];
  v5 = objc_msgSend(v4, "ic_loggingDescriptionIncludingBrackets:", 0);
  v6 = [v2 stringWithFormat:@"<%@ %@", v3, v5];

  v7 = [a1 recordChangeTag];
  [v6 appendFormat:@" changeTag=%@", v7];

  v8 = [a1 parent];
  v9 = [v8 recordID];
  uint64_t v10 = [v9 recordName];
  v11 = (void *)v10;
  if (v10) {
    v12 = (__CFString *)v10;
  }
  else {
    v12 = @"nil";
  }
  [v6 appendFormat:@" parent=%@", v12];

  v13 = [a1 creationDate];
  uint64_t v14 = objc_msgSend(v13, "ic_iso8601Date");
  v15 = (void *)v14;
  if (v14) {
    v16 = (__CFString *)v14;
  }
  else {
    v16 = @"nil";
  }
  [v6 appendFormat:@" created=%@", v16];

  v17 = [a1 creatorUserRecordID];
  uint64_t v18 = [v17 recordName];
  v19 = (void *)v18;
  if (v18) {
    v20 = (__CFString *)v18;
  }
  else {
    v20 = @"nil";
  }
  [v6 appendFormat:@" creator=%@", v20];

  v21 = [a1 modificationDate];
  uint64_t v22 = objc_msgSend(v21, "ic_iso8601Date");
  v23 = (void *)v22;
  if (v22) {
    v24 = (__CFString *)v22;
  }
  else {
    v24 = @"nil";
  }
  [v6 appendFormat:@" modified=%@", v24];

  uint64_t v25 = [a1 modifiedByDevice];
  v26 = (void *)v25;
  if (v25) {
    v27 = (__CFString *)v25;
  }
  else {
    v27 = @"nil";
  }
  [v6 appendFormat:@" modifiedByDevice=%@", v27];

  v28 = [a1 share];

  if (v28)
  {
    v29 = [a1 share];
    v30 = [v29 recordID];
    v31 = [v30 recordName];
    [v6 appendFormat:@" share=%@", v31];
  }
  [v6 appendString:@">"];
  return v6;
}

- (uint64_t)databaseScope
{
  v1 = [a1 recordID];
  uint64_t v2 = [v1 databaseScope];

  return v2;
}

- (BOOL)ic_hasMetadata
{
  uint64_t v2 = [a1 creationDate];
  if (v2)
  {
    v3 = [a1 creatorUserRecordID];
    if (v3)
    {
      v4 = [a1 modificationDate];
      if (v4)
      {
        v5 = [a1 lastModifiedUserRecordID];
        BOOL v6 = v5 != 0;
      }
      else
      {
        BOOL v6 = 0;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (uint64_t)ic_isOwnedByCurrentUser
{
  v1 = [a1 recordID];
  uint64_t v2 = objc_msgSend(v1, "ic_isOwnedByCurrentUser");

  return v2;
}

+ (uint64_t)ic_valueKeyForKeyPrefix:()IC
{
  return objc_msgSend(a3, "ic_trimmedString");
}

+ (id)ic_assetKeyForKeyPrefix:()IC
{
  v3 = NSString;
  v4 = objc_msgSend(a3, "ic_trimmedString");
  v5 = [v3 stringWithFormat:@"%@Asset", v4];

  return v5;
}

+ (id)ic_encryptedKeyForKeyPrefix:()IC
{
  v3 = NSString;
  v4 = objc_msgSend(a3, "ic_trimmedString");
  v5 = [v3 stringWithFormat:@"%@Encrypted", v4];

  return v5;
}

+ (id)ic_encryptedDataKeyForAssetKey:()IC
{
  v4 = objc_msgSend(a3, "ic_stringWithoutSuffix:", @"Asset");
  v5 = objc_msgSend(a1, "ic_encryptedKeyForKeyPrefix:", v4);

  return v5;
}

- (BOOL)ic_shouldUseAssetForInlineableDataAsset:()IC approach:
{
  if (a4 == 1) {
    return 0;
  }
  unint64_t v5 = [a3 length];
  BOOL v6 = +[ICCloudConfiguration sharedConfiguration];
  BOOL v4 = v5 > [v6 maxInlineAssetSizeBytes];

  return v4;
}

- (id)ic_inlineableDataAssetForKeyPrefix:()IC
{
  id v4 = a3;
  objc_opt_class();
  unint64_t v5 = [a1 valuesByKey];
  BOOL v6 = objc_msgSend((id)objc_opt_class(), "ic_valueKeyForKeyPrefix:", v4);
  v7 = [v5 objectForKeyedSubscript:v6];
  v8 = ICCheckedDynamicCast();

  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    objc_opt_class();
    uint64_t v10 = [a1 valuesByKey];
    v11 = objc_msgSend((id)objc_opt_class(), "ic_assetKeyForKeyPrefix:", v4);
    v12 = [v10 objectForKeyedSubscript:v11];
    v13 = ICCheckedDynamicCast();

    if (v13)
    {
      id v9 = +[ICCloudSyncingObject dataForAsset:v13];
    }
    else
    {
      id v9 = 0;
    }
  }
  return v9;
}

- (void)ic_setInlineableDataAsset:()IC forKeyPrefix:approach:
{
  id v18 = a3;
  id v8 = a4;
  id v9 = objc_msgSend((id)objc_opt_class(), "ic_valueKeyForKeyPrefix:", v8);
  uint64_t v10 = objc_msgSend((id)objc_opt_class(), "ic_assetKeyForKeyPrefix:", v8);
  v11 = objc_msgSend((id)objc_opt_class(), "ic_encryptedKeyForKeyPrefix:", v8);

  if (objc_msgSend(a1, "ic_shouldUseAssetForInlineableDataAsset:approach:", v18, a5))
  {
    v12 = +[ICCloudSyncingObject assetForData:v18];
    v13 = [a1 valuesByKey];
    [v13 setObject:0 forKeyedSubscript:v9];

    uint64_t v14 = [a1 valuesByKey];
    [v14 setObject:v12 forKeyedSubscript:v10];

    v15 = [a1 encryptedValues];
    [v15 setObject:0 forKeyedSubscript:v11];
  }
  else
  {
    v16 = [a1 valuesByKey];
    [v16 setObject:v18 forKeyedSubscript:v9];

    v17 = [a1 valuesByKey];
    [v17 setObject:0 forKeyedSubscript:v10];

    v12 = [a1 encryptedValues];
    [v12 setObject:0 forKeyedSubscript:v11];
  }
}

- (id)ic_encryptedInlineableDataAssetForKeyPrefix:()IC
{
  id v4 = a3;
  objc_opt_class();
  unint64_t v5 = [a1 encryptedValues];
  BOOL v6 = objc_msgSend((id)objc_opt_class(), "ic_encryptedKeyForKeyPrefix:", v4);
  v7 = [v5 objectForKeyedSubscript:v6];
  id v8 = ICCheckedDynamicCast();

  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    objc_opt_class();
    uint64_t v10 = [a1 valuesByKey];
    v11 = objc_msgSend((id)objc_opt_class(), "ic_assetKeyForKeyPrefix:", v4);
    v12 = [v10 objectForKeyedSubscript:v11];
    v13 = ICCheckedDynamicCast();

    if (v13)
    {
      id v9 = +[ICCloudSyncingObject dataForAsset:v13];
    }
    else
    {
      id v9 = 0;
    }
  }
  return v9;
}

- (void)ic_setEncryptedInlineableDataAsset:()IC forKeyPrefix:approach:
{
  id v18 = a3;
  id v8 = a4;
  id v9 = objc_msgSend((id)objc_opt_class(), "ic_valueKeyForKeyPrefix:", v8);
  uint64_t v10 = objc_msgSend((id)objc_opt_class(), "ic_assetKeyForKeyPrefix:", v8);
  v11 = objc_msgSend((id)objc_opt_class(), "ic_encryptedKeyForKeyPrefix:", v8);

  if (objc_msgSend(a1, "ic_shouldUseAssetForInlineableDataAsset:approach:", v18, a5))
  {
    v12 = +[ICCloudSyncingObject assetForData:v18];
    v13 = [a1 valuesByKey];
    [v13 setObject:0 forKeyedSubscript:v9];

    uint64_t v14 = [a1 valuesByKey];
    [v14 setObject:v12 forKeyedSubscript:v10];

    v15 = [a1 encryptedValues];
    [v15 setObject:0 forKeyedSubscript:v11];
  }
  else
  {
    v16 = [a1 valuesByKey];
    [v16 setObject:0 forKeyedSubscript:v9];

    v17 = [a1 valuesByKey];
    [v17 setObject:0 forKeyedSubscript:v10];

    v12 = [a1 encryptedValues];
    [v12 setObject:v18 forKeyedSubscript:v11];
  }
}

- (void)ic_inlineDataAssetForKeyPrefix:()IC
{
  id v4 = a3;
  objc_msgSend((id)objc_opt_class(), "ic_valueKeyForKeyPrefix:", v4);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v5 = objc_msgSend((id)objc_opt_class(), "ic_assetKeyForKeyPrefix:", v4);
  BOOL v6 = objc_msgSend((id)objc_opt_class(), "ic_encryptedKeyForKeyPrefix:", v4);

  objc_opt_class();
  v7 = [a1 valuesByKey];
  id v8 = [v7 objectForKeyedSubscript:v5];
  id v9 = ICCheckedDynamicCast();

  if (v9)
  {
    uint64_t v10 = +[ICCloudSyncingObject dataForAsset:v9];
    v11 = [a1 valuesByKey];
    [v11 setObject:v10 forKeyedSubscript:v14];

    v12 = [a1 valuesByKey];
    [v12 setObject:0 forKeyedSubscript:v5];

    v13 = [a1 encryptedValues];
    [v13 setObject:0 forKeyedSubscript:v6];
  }
}

- (void)ic_inlineEncryptedDataAssetForKeyPrefix:()IC
{
  id v4 = a3;
  objc_msgSend((id)objc_opt_class(), "ic_valueKeyForKeyPrefix:", v4);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v5 = objc_msgSend((id)objc_opt_class(), "ic_assetKeyForKeyPrefix:", v4);
  BOOL v6 = objc_msgSend((id)objc_opt_class(), "ic_encryptedKeyForKeyPrefix:", v4);

  objc_opt_class();
  v7 = [a1 valuesByKey];
  id v8 = [v7 objectForKeyedSubscript:v5];
  id v9 = ICCheckedDynamicCast();

  if (v9)
  {
    uint64_t v10 = [a1 valuesByKey];
    [v10 setObject:0 forKeyedSubscript:v14];

    v11 = [a1 valuesByKey];
    [v11 setObject:0 forKeyedSubscript:v5];

    v12 = +[ICCloudSyncingObject dataForAsset:v9];
    v13 = [a1 encryptedValues];
    [v13 setObject:v12 forKeyedSubscript:v6];
  }
}

- (id)ic_copyWithUserFields:()IC
{
  v3 = (void *)[a1 copyWithZone:0 userFields:a3];
  return v3;
}

@end