@interface HKSPDictionaryDiff
- (BOOL)equalDictionaries;
- (HKSPDictionaryDiff)initWithOriginalDictionary:(id)a3 updatedDictionary:(id)a4 keysToDiff:(id)a5;
- (NSDictionary)updatedProperties;
- (NSSet)removedKeys;
@end

@implementation HKSPDictionaryDiff

- (HKSPDictionaryDiff)initWithOriginalDictionary:(id)a3 updatedDictionary:(id)a4 keysToDiff:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v35.receiver = self;
  v35.super_class = (Class)HKSPDictionaryDiff;
  v11 = [(HKSPDictionaryDiff *)&v35 init];
  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __78__HKSPDictionaryDiff_initWithOriginalDictionary_updatedDictionary_keysToDiff___block_invoke;
    v31[3] = &unk_1E5D33898;
    id v14 = v10;
    id v32 = v14;
    id v15 = v8;
    id v33 = v15;
    id v34 = v12;
    id v16 = v12;
    objc_msgSend(v9, "na_each:", v31);
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __78__HKSPDictionaryDiff_initWithOriginalDictionary_updatedDictionary_keysToDiff___block_invoke_2;
    v27 = &unk_1E5D33898;
    id v28 = v14;
    id v29 = v9;
    id v30 = v13;
    id v17 = v13;
    objc_msgSend(v15, "na_each:", &v24);
    uint64_t v18 = objc_msgSend(v16, "copy", v24, v25, v26, v27);
    updatedProperties = v11->_updatedProperties;
    v11->_updatedProperties = (NSDictionary *)v18;

    uint64_t v20 = [v17 copy];
    removedKeys = v11->_removedKeys;
    v11->_removedKeys = (NSSet *)v20;

    v22 = v11;
  }

  return v11;
}

void __78__HKSPDictionaryDiff_initWithOriginalDictionary_updatedDictionary_keysToDiff___block_invoke(id *a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if ([a1[4] containsObject:v8])
  {
    v6 = [a1[5] objectForKeyedSubscript:v8];
    char v7 = NAEqualObjects();

    if ((v7 & 1) == 0) {
      [a1[6] setObject:v5 forKeyedSubscript:v8];
    }
  }
}

void __78__HKSPDictionaryDiff_initWithOriginalDictionary_updatedDictionary_keysToDiff___block_invoke_2(id *a1, void *a2)
{
  id v4 = a2;
  if (objc_msgSend(a1[4], "containsObject:"))
  {
    v3 = [a1[5] objectForKeyedSubscript:v4];

    if (!v3) {
      [a1[6] addObject:v4];
    }
  }
}

- (BOOL)equalDictionaries
{
  return ![(NSDictionary *)self->_updatedProperties count] && [(NSSet *)self->_removedKeys count] == 0;
}

- (NSDictionary)updatedProperties
{
  return self->_updatedProperties;
}

- (NSSet)removedKeys
{
  return self->_removedKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedKeys, 0);
  objc_storeStrong((id *)&self->_updatedProperties, 0);
}

@end