@interface CKRecord
@end

@implementation CKRecord

uint64_t __59__CKRecord_PKAdditions__pk_encryptedArrayOfClasses_forKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        if (objc_opt_isKindOfClass())
        {
          uint64_t v14 = 1;
          goto LABEL_13;
        }
        v8 = PKLogFacilityTypeGetObject(0xEuLL);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = objc_opt_class();
          v11 = *(void **)(a1 + 32);
          uint64_t v10 = *(void *)(a1 + 40);
          id v12 = v9;
          v13 = [v11 description];
          *(_DWORD *)buf = 138412802;
          v22 = v9;
          __int16 v23 = 2112;
          uint64_t v24 = v10;
          __int16 v25 = 2112;
          v26 = v13;
          _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Wrong class in encrypted array: %@, for key %@, expected classes: %@", buf, 0x20u);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v27 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 0;
LABEL_13:

  return v14;
}

uint64_t __39__CKRecord_PKAdditions__pk_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@: '%@', ", a2, a3];
}

void __32__CKRecord_PKAdditions__pk_hash__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v9 coordinate];
    double v4 = v3;
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v5 safelyAddObject:v6];

    v7 = *(void **)(a1 + 32);
    v8 = [NSNumber numberWithDouble:v4];
    [v7 safelyAddObject:v8];
  }
  else
  {
    [*(id *)(a1 + 32) safelyAddObject:v9];
  }
}

@end