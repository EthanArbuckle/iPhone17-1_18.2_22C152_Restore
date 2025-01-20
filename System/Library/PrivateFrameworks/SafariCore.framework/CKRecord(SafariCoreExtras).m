@interface CKRecord(SafariCoreExtras)
- (BOOL)safari_hasAtLeastOneChangedField;
- (_WBSCKRecordSystemEncoder)safari_systemFieldsEncoder;
- (id)safari_arrayForKey:()SafariCoreExtras;
- (id)safari_dataForKey:()SafariCoreExtras;
- (id)safari_dateForKey:()SafariCoreExtras;
- (id)safari_encodedSystemFieldsData;
- (id)safari_encryptedDataForKey:()SafariCoreExtras;
- (id)safari_initWithEncodedRecordData:()SafariCoreExtras;
- (id)safari_numberForKey:()SafariCoreExtras;
- (id)safari_referenceForKey:()SafariCoreExtras;
- (id)safari_stringForKey:()SafariCoreExtras;
- (uint64_t)safari_BOOLForKey:()SafariCoreExtras;
- (uint64_t)safari_isInPrivateDatabase;
@end

@implementation CKRecord(SafariCoreExtras)

- (id)safari_initWithEncodedRecordData:()SafariCoreExtras
{
  v10[4] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    v10[0] = 0;
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v4 error:v10];
    id v6 = v10[0];
    if (v6)
    {
      v7 = WBS_LOG_CHANNEL_PREFIXKeyedArchiver();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CKRecord(SafariCoreExtras) safari_initWithEncodedRecordData:](v7, v6);
      }
    }
    a1 = (id)[a1 initWithCoder:v5];

    id v8 = a1;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (_WBSCKRecordSystemEncoder)safari_systemFieldsEncoder
{
  v1 = [[_WBSCKRecordSystemEncoder alloc] initWithRecord:a1];
  return v1;
}

- (id)safari_encodedSystemFieldsData
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [a1 encodeSystemFieldsWithCoder:v2];
  v3 = [v2 encodedData];

  return v3;
}

- (BOOL)safari_hasAtLeastOneChangedField
{
  v1 = [a1 changedKeys];
  BOOL v2 = [v1 count] != 0;

  return v2;
}

- (uint64_t)safari_BOOLForKey:()SafariCoreExtras
{
  v1 = objc_msgSend(a1, "safari_numberForKey:");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (id)safari_stringForKey:()SafariCoreExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)safari_numberForKey:()SafariCoreExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)safari_dataForKey:()SafariCoreExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)safari_dateForKey:()SafariCoreExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)safari_arrayForKey:()SafariCoreExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)safari_encryptedDataForKey:()SafariCoreExtras
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "safari_encryptedValues");
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)safari_referenceForKey:()SafariCoreExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (uint64_t)safari_isInPrivateDatabase
{
  v1 = [a1 recordID];
  uint64_t v2 = objc_msgSend(v1, "safari_isInPrivateDatabase");

  return v2;
}

- (void)safari_initWithEncodedRecordData:()SafariCoreExtras .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Failed to read encoded record data with exception: %{public}@", buf, 0xCu);
}

- (void)safari_initWithEncodedRecordData:()SafariCoreExtras .cold.2(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1B728F000, v3, OS_LOG_TYPE_ERROR, "Failed to initialize reading from encoded record data: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end