@interface CKRecord(PKAdditions)
+ (id)pk_recordWithSystemFieldsData:()PKAdditions;
- (id)_arrayFromStringValue:()PKAdditions;
- (id)description;
- (id)pk_arrayForKey:()PKAdditions;
- (id)pk_copyRecordForNewRecordZone:()PKAdditions;
- (id)pk_dataForKey:()PKAdditions;
- (id)pk_dateForKey:()PKAdditions;
- (id)pk_decimalNumberForKey:()PKAdditions;
- (id)pk_description;
- (id)pk_dictionaryForKey:()PKAdditions;
- (id)pk_encryptedArrayOfClasses:()PKAdditions forKey:;
- (id)pk_encryptedDataForKey:()PKAdditions;
- (id)pk_encryptedDateForKey:()PKAdditions;
- (id)pk_encryptedDecimalNumberForKey:()PKAdditions;
- (id)pk_encryptedDictionaryForKey:()PKAdditions;
- (id)pk_encryptedLocationForKey:()PKAdditions;
- (id)pk_encryptedNumberForKey:()PKAdditions;
- (id)pk_encryptedObjectForKey:()PKAdditions ofClass:;
- (id)pk_encryptedStringForKey:()PKAdditions;
- (id)pk_encryptedUUIDForKey:()PKAdditions;
- (id)pk_encryptedUrlForKey:()PKAdditions;
- (id)pk_locationForKey:()PKAdditions;
- (id)pk_numberForKey:()PKAdditions;
- (id)pk_objectForKey:()PKAdditions ofClass:;
- (id)pk_participantWithEmailAddress:()PKAdditions;
- (id)pk_participantWithLookupInfo:()PKAdditions;
- (id)pk_participantWithPhoneNumber:()PKAdditions;
- (id)pk_participantWithRecipientHandle:()PKAdditions;
- (id)pk_referenceForKey:()PKAdditions;
- (id)pk_share;
- (id)pk_stringForKey:()PKAdditions;
- (id)pk_systemFieldsData;
- (id)pk_urlForKey:()PKAdditions;
- (uint64_t)_copyArray:()PKAdditions forNewRecordZone:;
- (uint64_t)_copyReference:()PKAdditions forNewRecordZone:;
- (uint64_t)pk_BOOLForKey:()PKAdditions;
- (uint64_t)pk_encryptedBoolForKey:()PKAdditions;
- (uint64_t)pk_encryptedIntForKey:()PKAdditions;
- (uint64_t)pk_encryptedIntegerForKey:()PKAdditions;
- (uint64_t)pk_encryptedUint64ForKey:()PKAdditions;
- (uint64_t)pk_encryptedUnsignedIntegerForKey:()PKAdditions;
- (uint64_t)pk_hash;
- (uint64_t)pk_intForKey:()PKAdditions;
- (uint64_t)pk_integerForKey:()PKAdditions;
- (uint64_t)pk_isPass;
- (uint64_t)pk_isPassCatalog;
- (uint64_t)pk_isRemoteAsset;
- (uint64_t)pk_uint64ForKey:()PKAdditions;
- (uint64_t)pk_unsignedIntegerForKey:()PKAdditions;
@end

@implementation CKRecord(PKAdditions)

- (id)pk_encryptedStringForKey:()PKAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "pk_encryptedObjectForKey:ofClass:", v4, objc_opt_class());

  return v5;
}

- (id)pk_encryptedUUIDForKey:()PKAdditions
{
  v1 = objc_msgSend(a1, "pk_encryptedStringForKey:");
  if (v1) {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v1];
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (id)pk_encryptedNumberForKey:()PKAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "pk_encryptedObjectForKey:ofClass:", v4, objc_opt_class());

  return v5;
}

- (id)pk_encryptedDateForKey:()PKAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "pk_encryptedObjectForKey:ofClass:", v4, objc_opt_class());

  return v5;
}

- (id)pk_encryptedDataForKey:()PKAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "pk_encryptedObjectForKey:ofClass:", v4, objc_opt_class());

  return v5;
}

- (id)pk_encryptedLocationForKey:()PKAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "pk_encryptedObjectForKey:ofClass:", v4, objc_opt_class());

  return v5;
}

- (id)pk_encryptedDecimalNumberForKey:()PKAdditions
{
  v1 = objc_msgSend(a1, "pk_encryptedStringForKey:");
  if (v1)
  {
    v2 = [MEMORY[0x1E4F28C28] decimalNumberWithString:v1];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)pk_encryptedUrlForKey:()PKAdditions
{
  v1 = objc_msgSend(a1, "pk_encryptedStringForKey:");
  if (v1)
  {
    v2 = [MEMORY[0x1E4F1CB10] URLWithString:v1];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)pk_encryptedDictionaryForKey:()PKAdditions
{
  v1 = objc_msgSend(a1, "pk_encryptedStringForKey:");
  v2 = PKDictionaryFromJSONString(v1);

  return v2;
}

- (id)pk_encryptedArrayOfClasses:()PKAdditions forKey:
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(a1, "pk_encryptedStringForKey:", v7);
  v9 = [a1 _arrayFromStringValue:v8];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__CKRecord_PKAdditions__pk_encryptedArrayOfClasses_forKey___block_invoke;
  v14[3] = &unk_1E56DD550;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  v12 = objc_msgSend(v9, "pk_objectsPassingTest:", v14);

  return v12;
}

- (uint64_t)pk_encryptedBoolForKey:()PKAdditions
{
  v1 = objc_msgSend(a1, "pk_encryptedNumberForKey:");
  v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 BOOLValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)pk_encryptedIntegerForKey:()PKAdditions
{
  v1 = objc_msgSend(a1, "pk_encryptedNumberForKey:");
  v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 integerValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)pk_encryptedIntForKey:()PKAdditions
{
  v1 = objc_msgSend(a1, "pk_encryptedNumberForKey:");
  v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 intValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)pk_encryptedUint64ForKey:()PKAdditions
{
  v1 = objc_msgSend(a1, "pk_encryptedNumberForKey:");
  v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 unsignedLongLongValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)pk_encryptedUnsignedIntegerForKey:()PKAdditions
{
  v1 = objc_msgSend(a1, "pk_encryptedNumberForKey:");
  v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 unsignedIntegerValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)pk_encryptedObjectForKey:()PKAdditions ofClass:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [a1 encryptedValues];
  v8 = [v7 objectForKey:v6];

  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
  }
  else
  {
    if (v8)
    {
      id v10 = PKLogFacilityTypeGetObject(9uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412802;
        id v14 = (id)objc_opt_class();
        __int16 v15 = 2112;
        id v16 = v6;
        __int16 v17 = 2112;
        uint64_t v18 = a4;
        id v11 = v14;
        _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "CKRecord Error: unexpected class type \"%@\" for key %@. Expected class type: %@", (uint8_t *)&v13, 0x20u);
      }
    }
    id v9 = 0;
  }

  return v9;
}

- (id)pk_stringForKey:()PKAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "pk_objectForKey:ofClass:", v4, objc_opt_class());

  return v5;
}

- (id)pk_numberForKey:()PKAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "pk_objectForKey:ofClass:", v4, objc_opt_class());

  return v5;
}

- (id)pk_dateForKey:()PKAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "pk_objectForKey:ofClass:", v4, objc_opt_class());

  return v5;
}

- (id)pk_dataForKey:()PKAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "pk_objectForKey:ofClass:", v4, objc_opt_class());

  return v5;
}

- (id)pk_locationForKey:()PKAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "pk_objectForKey:ofClass:", v4, objc_opt_class());

  return v5;
}

- (id)pk_decimalNumberForKey:()PKAdditions
{
  v1 = objc_msgSend(a1, "pk_stringForKey:");
  if (v1)
  {
    v2 = [MEMORY[0x1E4F28C28] decimalNumberWithString:v1];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)pk_urlForKey:()PKAdditions
{
  v1 = objc_msgSend(a1, "pk_stringForKey:");
  if (v1)
  {
    v2 = [MEMORY[0x1E4F1CB10] URLWithString:v1];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)pk_dictionaryForKey:()PKAdditions
{
  v1 = objc_msgSend(a1, "pk_stringForKey:");
  v2 = PKDictionaryFromJSONString(v1);

  return v2;
}

- (id)pk_arrayForKey:()PKAdditions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 objectForKey:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [a1 _arrayFromStringValue:v5];
LABEL_5:
    id v7 = v6;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    goto LABEL_5;
  }
  v8 = PKLogFacilityTypeGetObject(9uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = (id)objc_opt_class();
    __int16 v13 = 2112;
    id v14 = v4;
    id v9 = v12;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "CKRecord Error: unexpected class type \"%@\" for key %@ as array. Expected string or array", (uint8_t *)&v11, 0x16u);
  }
  id v7 = 0;
LABEL_9:

  return v7;
}

- (uint64_t)pk_BOOLForKey:()PKAdditions
{
  v1 = objc_msgSend(a1, "pk_numberForKey:");
  v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 BOOLValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)pk_integerForKey:()PKAdditions
{
  v1 = objc_msgSend(a1, "pk_numberForKey:");
  v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 integerValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)pk_intForKey:()PKAdditions
{
  v1 = objc_msgSend(a1, "pk_numberForKey:");
  v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 intValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)pk_uint64ForKey:()PKAdditions
{
  v1 = objc_msgSend(a1, "pk_numberForKey:");
  v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 unsignedLongLongValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)pk_unsignedIntegerForKey:()PKAdditions
{
  v1 = objc_msgSend(a1, "pk_numberForKey:");
  v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 unsignedIntegerValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)pk_referenceForKey:()PKAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "pk_objectForKey:ofClass:", v4, objc_opt_class());

  return v5;
}

- (id)pk_objectForKey:()PKAdditions ofClass:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [a1 objectForKey:v6];
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
  }
  else
  {
    if (v7)
    {
      id v9 = PKLogFacilityTypeGetObject(9uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412802;
        id v13 = (id)objc_opt_class();
        __int16 v14 = 2112;
        id v15 = v6;
        __int16 v16 = 2112;
        uint64_t v17 = a4;
        id v10 = v13;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "CKRecord Error: unexpected class type \"%@\" for key %@. Expected class type: %@", (uint8_t *)&v12, 0x20u);
      }
    }
    id v8 = 0;
  }

  return v8;
}

- (id)pk_description
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), a1];
  uint64_t v3 = [a1 recordID];
  id v4 = [v3 recordName];
  [v2 appendFormat:@"recordName: '%@', ", v4];

  v5 = [a1 recordID];
  id v6 = [v5 zoneID];
  id v7 = [v6 zoneName];
  [v2 appendFormat:@"zoneName: '%@', ", v7];

  id v8 = [a1 creationDate];
  [v2 appendFormat:@"createdDate: '%@', ", v8];

  id v9 = [a1 recordChangeTag];
  [v2 appendFormat:@"recordChangeTag: '%@', ", v9];

  id v10 = [a1 creatorUserRecordID];
  [v2 appendFormat:@"creatorUserRecordID: '%@', ", v10];

  int v11 = [a1 creationDate];
  [v2 appendFormat:@"creationDate: '%@', ", v11];

  int v12 = [a1 lastModifiedUserRecordID];
  [v2 appendFormat:@"lastModifiedUserRecordID: '%@', ", v12];

  id v13 = [a1 modificationDate];
  [v2 appendFormat:@"modificationDate: '%@', ", v13];

  __int16 v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "pk_hash"));
  [v2 appendFormat:@"pk_hash: '%@', ", v14];

  [v2 appendFormat:@"values: { "];
  id v15 = [a1 values];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __39__CKRecord_PKAdditions__pk_description__block_invoke;
  v33[3] = &unk_1E56E5750;
  id v16 = v2;
  id v34 = v16;
  [v15 enumerateKeysAndObjectsUsingBlock:v33];

  [v16 appendFormat:@"},"];
  [v16 appendString:@" encryptedValues: { "];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v17 = a1;
  uint64_t v18 = [a1 encryptedValues];
  uint64_t v19 = [v18 allKeys];

  id obj = v19;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        v25 = [v17 encryptedValues];
        v26 = [v25 objectForKey:v24];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v16 appendFormat:@"%@: '%@', ", v24, @"<large data blob>"];
        }
        else {
          [v16 appendFormat:@"%@: '%@', ", v24, v26];
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v21);
  }

  [v16 appendFormat:@"}"];
  [v16 appendFormat:@">"];

  return v16;
}

- (id)description
{
  if (PKTransactionDebugDetailsEnabled())
  {
    v2 = objc_msgSend(a1, "pk_description");
  }
  else
  {
    v4.receiver = a1;
    v4.super_class = (Class)&off_1EE2D8560;
    v2 = objc_msgSendSuper2(&v4, sel_description);
  }
  return v2;
}

- (uint64_t)pk_hash
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = [a1 recordID];
  [v2 safelyAddObject:v3];

  objc_super v4 = [a1 recordType];
  [v2 safelyAddObject:v4];

  v5 = [a1 creationDate];
  [v2 safelyAddObject:v5];

  id v6 = [a1 creatorUserRecordID];
  [v2 safelyAddObject:v6];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __32__CKRecord_PKAdditions__pk_hash__block_invoke;
  aBlock[3] = &unk_1E56E5778;
  id v7 = v2;
  id v35 = v7;
  id v8 = (void (**)(void *, void *))_Block_copy(aBlock);
  id v9 = [a1 encryptedValues];
  id v10 = [v9 allKeys];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v37 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v31;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [v9 objectForKey:*(void *)(*((void *)&v30 + 1) + 8 * v14)];
        v8[2](v8, v15);

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v37 count:16];
    }
    while (v12);
  }
  id v16 = [a1 valuesByKey];
  uint64_t v17 = [v16 allKeys];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v18 = v17;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = objc_msgSend(v16, "objectForKey:", *(void *)(*((void *)&v26 + 1) + 8 * v22), (void)v26);
        v8[2](v8, v23);

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v20);
  }

  uint64_t v24 = PKCombinedHash(17, v7);
  return v24;
}

- (id)pk_copyRecordForNewRecordZone:()PKAdditions
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  uint64_t v4 = [v40 zoneID];
  v5 = [a1 recordID];
  uint64_t v6 = [v5 recordName];

  v37 = (void *)v6;
  uint64_t v38 = (void *)v4;
  uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v6 zoneID:v4];
  id v8 = objc_alloc(MEMORY[0x1E4F1A2D8]);
  id v9 = [a1 recordType];
  uint64_t v36 = (void *)v7;
  id v10 = (void *)[v8 initWithRecordType:v9 recordID:v7];

  v39 = a1;
  uint64_t v11 = [a1 encryptedValues];
  uint64_t v12 = [v10 encryptedValues];
  uint64_t v13 = [v11 allKeys];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v46 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v19 = [v11 objectForKey:v18];
        [v12 setObject:v19 forKey:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v15);
  }
  id v34 = v12;
  id v35 = v11;
  uint64_t v20 = [v39 valuesByKey];
  id v33 = v10;
  uint64_t v21 = [v10 valuesByKey];
  uint64_t v22 = [v20 allKeys];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v23 = v22;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v42 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void *)(*((void *)&v41 + 1) + 8 * j);
        long long v29 = [v20 objectForKey:v28];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v30 = [v39 _copyReference:v29 forNewRecordZone:v40];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_18;
          }
          uint64_t v30 = [v39 _copyArray:v29 forNewRecordZone:v40];
        }
        long long v31 = (void *)v30;

        long long v29 = v31;
LABEL_18:
        [v21 setObject:v29 forKey:v28];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v25);
  }

  return v33;
}

- (id)pk_participantWithRecipientHandle:()PKAdditions
{
  id v4 = a3;
  if ([v4 containsString:@"@"]) {
    objc_msgSend(a1, "pk_participantWithEmailAddress:", v4);
  }
  else {
  v5 = objc_msgSend(a1, "pk_participantWithPhoneNumber:", v4);
  }

  return v5;
}

- (id)pk_participantWithEmailAddress:()PKAdditions
{
  id v4 = (objc_class *)MEMORY[0x1E4F1A488];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithEmailAddress:v5];

  uint64_t v7 = objc_msgSend(a1, "pk_participantWithLookupInfo:", v6);

  return v7;
}

- (id)pk_participantWithPhoneNumber:()PKAdditions
{
  id v4 = (objc_class *)MEMORY[0x1E4F1A488];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithPhoneNumber:v5];

  uint64_t v7 = objc_msgSend(a1, "pk_participantWithLookupInfo:", v6);

  return v7;
}

- (id)pk_participantWithLookupInfo:()PKAdditions
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(a1, "pk_share");
  uint64_t v6 = v5;
  if (v5)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v7 = objc_msgSend(v5, "participants", 0);
    id v8 = (id)[v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v12 = [v11 userIdentity];
          uint64_t v13 = [v12 lookupInfo];
          id v14 = v13;
          if (v4 && v13)
          {
            char v15 = [v13 isEqual:v4];

            if (v15) {
              goto LABEL_15;
            }
          }
          else
          {

            if (v14 == v4)
            {
LABEL_15:
              id v8 = v11;
              goto LABEL_16;
            }
          }
        }
        id v8 = (id)[v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)pk_share
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = a1;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (uint64_t)_copyReference:()PKAdditions forNewRecordZone:
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 recordID];
  id v8 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  uint64_t v9 = [v7 recordName];
  id v10 = [v5 zoneID];

  uint64_t v11 = (void *)[v8 initWithRecordName:v9 zoneID:v10];
  id v12 = objc_alloc(MEMORY[0x1E4F1A348]);
  uint64_t v13 = [v6 referenceAction];

  uint64_t v14 = [v12 initWithRecordID:v11 action:v13];
  return v14;
}

- (uint64_t)_copyArray:()PKAdditions forNewRecordZone:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(id *)(*((void *)&v18 + 1) + 8 * v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v15 = objc_msgSend(a1, "_copyReference:forNewRecordZone:", v14, v7, (void)v18);

          id v14 = (id)v15;
        }
        objc_msgSend(v8, "addObject:", v14, (void)v18);

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  uint64_t v16 = [v8 copy];
  return v16;
}

- (id)_arrayFromStringValue:()PKAdditions
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 dataUsingEncoding:4];
  if (v3)
  {
    id v8 = 0;
    id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v3 options:0 error:&v8];
    id v5 = v8;
    if (v5)
    {
      id v6 = PKLogFacilityTypeGetObject(9uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v10 = v5;
        _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Error decoding CloudKit string into an NSArray with error: %@", buf, 0xCu);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_9;
      }
    }
  }
  id v4 = 0;
LABEL_9:

  return v4;
}

- (uint64_t)pk_isPass
{
  v1 = [a1 recordType];
  id v2 = @"Pass";
  uint64_t v3 = v2;
  if (v1 == v2)
  {
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
    if (v1 && v2) {
      uint64_t v4 = [(__CFString *)v1 isEqualToString:v2];
    }
  }

  return v4;
}

- (uint64_t)pk_isPassCatalog
{
  v1 = [a1 recordType];
  id v2 = @"PassCatalog";
  uint64_t v3 = v2;
  if (v1 == v2)
  {
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
    if (v1 && v2) {
      uint64_t v4 = [(__CFString *)v1 isEqualToString:v2];
    }
  }

  return v4;
}

- (uint64_t)pk_isRemoteAsset
{
  v1 = [a1 recordType];
  id v2 = @"RemoteAsset";
  uint64_t v3 = v2;
  if (v1 == v2)
  {
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
    if (v1 && v2) {
      uint64_t v4 = [(__CFString *)v1 isEqualToString:v2];
    }
  }

  return v4;
}

+ (id)pk_recordWithSystemFieldsData:()PKAdditions
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F28DC0];
  id v4 = a3;
  uint64_t v8 = 0;
  id v5 = (void *)[[v3 alloc] initForReadingFromData:v4 error:&v8];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithCoder:v5];
  return v6;
}

- (id)pk_systemFieldsData
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [a1 encodeSystemFieldsWithCoder:v2];
  [v2 finishEncoding];
  uint64_t v3 = [v2 encodedData];

  return v3;
}

@end