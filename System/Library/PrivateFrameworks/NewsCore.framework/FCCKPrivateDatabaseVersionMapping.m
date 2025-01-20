@interface FCCKPrivateDatabaseVersionMapping
+ (FCCKPrivateDatabaseVersionMapping)mappingWithBaseValues:(id)a3 V2Changes:(id)a4 V3Changes:(id)a5 V4Changes:(id)a6;
- (BOOL)containsValuePassingTest:(id)a3;
- (FCCKPrivateDatabaseVersionMapping)initWithBaseValues:(id)a3 V2Changes:(id)a4 V3Changes:(id)a5 V4Changes:(id)a6;
- (NSArray)baseValues;
- (NSDictionary)V2Changes;
- (NSDictionary)V3Changes;
- (NSDictionary)V4Changes;
- (NSDictionary)forwardMapToV2;
- (NSDictionary)forwardMapToV3;
- (NSDictionary)forwardMapToV4;
- (NSDictionary)reverseMap;
- (id)allValuesForVersion:(int64_t)a3;
- (id)allValuesModifiedFromVersion:(int64_t)a3 toVersion:(int64_t)a4;
- (id)mapValue:(id)a3 toVersion:(int64_t)a4;
- (id)mappingByTransformingValuesWithBlock:(id)a3;
@end

@implementation FCCKPrivateDatabaseVersionMapping

- (BOOL)containsValuePassingTest:(id)a3
{
  id v4 = a3;
  v5 = [(FCCKPrivateDatabaseVersionMapping *)self baseValues];
  if (objc_msgSend(v5, "fc_containsObjectPassingTest:", v4))
  {
    char v6 = 1;
  }
  else
  {
    v7 = [(FCCKPrivateDatabaseVersionMapping *)self V2Changes];
    v8 = [v7 allValues];
    if (objc_msgSend(v8, "fc_containsObjectPassingTest:", v4))
    {
      char v6 = 1;
    }
    else
    {
      v9 = [(FCCKPrivateDatabaseVersionMapping *)self V3Changes];
      v10 = [v9 allValues];
      if (objc_msgSend(v10, "fc_containsObjectPassingTest:", v4))
      {
        char v6 = 1;
      }
      else
      {
        v11 = [(FCCKPrivateDatabaseVersionMapping *)self V4Changes];
        v12 = [v11 allValues];
        char v6 = objc_msgSend(v12, "fc_containsObjectPassingTest:", v4);
      }
    }
  }
  return v6;
}

- (NSArray)baseValues
{
  return self->_baseValues;
}

- (NSDictionary)V2Changes
{
  return self->_V2Changes;
}

- (NSDictionary)V4Changes
{
  return self->_V4Changes;
}

- (NSDictionary)V3Changes
{
  return self->_V3Changes;
}

void __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_7(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_8;
  v18[3] = &unk_1E5B54168;
  id v5 = v3;
  id v19 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v18];
  char v6 = (void *)a1[5];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_9;
  v16[3] = &unk_1E5B54168;
  id v7 = v5;
  id v17 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v16];
  v8 = (void *)a1[6];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_10;
  v14[3] = &unk_1E5B54168;
  id v9 = v7;
  id v15 = v9;
  [v8 enumerateKeysAndObjectsUsingBlock:v14];
  v10 = (void *)a1[7];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_11;
  v12[3] = &unk_1E5B4E468;
  id v13 = v9;
  id v11 = v9;
  [v10 enumerateObjectsUsingBlock:v12];
}

void __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_5(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_6;
  v6[3] = &unk_1E5B4E468;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
  [v5 addEntriesFromDictionary:a1[5]];
  [v5 addEntriesFromDictionary:a1[6]];
  [v5 addEntriesFromDictionary:a1[7]];
}

void __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_4;
  v6[3] = &unk_1E5B4E468;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
  [v5 addEntriesFromDictionary:a1[5]];
  [v5 addEntriesFromDictionary:a1[6]];
}

void __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_2;
  v6[3] = &unk_1E5B4E468;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
  [v5 addEntriesFromDictionary:*(void *)(a1 + 40)];
}

void __74__FCCKPrivateDatabaseVersionMapping_mappingByTransformingValuesWithBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) V4Changes];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__FCCKPrivateDatabaseVersionMapping_mappingByTransformingValuesWithBlock___block_invoke_6;
  v6[3] = &unk_1E5B59128;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

void __74__FCCKPrivateDatabaseVersionMapping_mappingByTransformingValuesWithBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) V3Changes];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__FCCKPrivateDatabaseVersionMapping_mappingByTransformingValuesWithBlock___block_invoke_4;
  v6[3] = &unk_1E5B59128;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

void __74__FCCKPrivateDatabaseVersionMapping_mappingByTransformingValuesWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) V2Changes];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__FCCKPrivateDatabaseVersionMapping_mappingByTransformingValuesWithBlock___block_invoke_2;
  v6[3] = &unk_1E5B59128;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

uint64_t __57__FCCKPrivateDatabaseVersionMapping_allValuesForVersion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) mapValue:a2 toVersion:*(void *)(a1 + 40)];
}

- (id)mapValue:(id)a3 toVersion:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(FCCKPrivateDatabaseVersionMapping *)self reverseMap];
  id v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    id v9 = v8;
    v10 = v9;
    switch(a4)
    {
      case 0:
        self = (FCCKPrivateDatabaseVersionMapping *)v9;
        break;
      case 1:
        id v11 = [(FCCKPrivateDatabaseVersionMapping *)self forwardMapToV2];
        goto LABEL_8;
      case 2:
        id v11 = [(FCCKPrivateDatabaseVersionMapping *)self forwardMapToV3];
        goto LABEL_8;
      case 3:
        id v11 = [(FCCKPrivateDatabaseVersionMapping *)self forwardMapToV4];
LABEL_8:
        v12 = v11;
        uint64_t v13 = [v11 objectForKeyedSubscript:v10];
        v14 = (void *)v13;
        if (v13) {
          id v15 = (void *)v13;
        }
        else {
          id v15 = v6;
        }
        self = v15;

        break;
      default:
        break;
    }
  }
  else
  {
    self = (FCCKPrivateDatabaseVersionMapping *)v6;
  }
  return self;
}

- (NSDictionary)reverseMap
{
  return self->_reverseMap;
}

- (NSDictionary)forwardMapToV4
{
  return self->_forwardMapToV4;
}

- (NSDictionary)forwardMapToV3
{
  return self->_forwardMapToV3;
}

- (NSDictionary)forwardMapToV2
{
  return self->_forwardMapToV2;
}

uint64_t __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a2];
}

uint64_t __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a2];
}

uint64_t __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a2];
}

uint64_t __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_11(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a2];
}

uint64_t __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a3];
}

uint64_t __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a3];
}

void __74__FCCKPrivateDatabaseVersionMapping_mappingByTransformingValuesWithBlock___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  id v7 = a2;
  v6(v5, a3);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = *(void **)(a1 + 32);
  id v9 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  [v8 setObject:v10 forKeyedSubscript:v9];
}

void __74__FCCKPrivateDatabaseVersionMapping_mappingByTransformingValuesWithBlock___block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  id v7 = a2;
  v6(v5, a3);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = *(void **)(a1 + 32);
  id v9 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  [v8 setObject:v10 forKeyedSubscript:v9];
}

void __74__FCCKPrivateDatabaseVersionMapping_mappingByTransformingValuesWithBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  id v7 = a2;
  v6(v5, a3);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = *(void **)(a1 + 32);
  id v9 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  [v8 setObject:v10 forKeyedSubscript:v9];
}

void __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) containsObject:a2] & 1) == 0
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"versioned changes should be keyed by base value"];
    int v3 = 136315906;
    id v4 = "-[FCCKPrivateDatabaseVersionMapping initWithBaseValues:V2Changes:V3Changes:V4Changes:]_block_invoke";
    __int16 v5 = 2080;
    id v6 = "FCCKPrivateDatabaseVersionMapping.m";
    __int16 v7 = 1024;
    int v8 = 55;
    __int16 v9 = 2114;
    id v10 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v3, 0x26u);
  }
}

uint64_t __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a3];
}

+ (FCCKPrivateDatabaseVersionMapping)mappingWithBaseValues:(id)a3 V2Changes:(id)a4 V3Changes:(id)a5 V4Changes:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [[FCCKPrivateDatabaseVersionMapping alloc] initWithBaseValues:v12 V2Changes:v11 V3Changes:v10 V4Changes:v9];

  return v13;
}

- (FCCKPrivateDatabaseVersionMapping)initWithBaseValues:(id)a3 V2Changes:(id)a4 V3Changes:(id)a5 V4Changes:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v63.receiver = self;
  v63.super_class = (Class)FCCKPrivateDatabaseVersionMapping;
  id v15 = [(FCCKPrivateDatabaseVersionMapping *)&v63 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_baseValues, a3);
    objc_storeStrong((id *)&v16->_V2Changes, a4);
    objc_storeStrong((id *)&v16->_V3Changes, a5);
    objc_storeStrong((id *)&v16->_V4Changes, a6);
    id v17 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke;
    aBlock[3] = &unk_1E5B54168;
    id v62 = v17;
    id v42 = v17;
    v41 = _Block_copy(aBlock);
    [v12 enumerateKeysAndObjectsUsingBlock:v41];
    [v13 enumerateKeysAndObjectsUsingBlock:v41];
    [v14 enumerateKeysAndObjectsUsingBlock:v41];
    v18 = (void *)MEMORY[0x1E4F1CA60];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_6;
    v58[3] = &unk_1E5B4CDC0;
    id v19 = v11;
    id v59 = v19;
    id v20 = v12;
    id v60 = v20;
    uint64_t v21 = objc_msgSend(v18, "fc_dictionary:", v58);
    forwardMapToV2 = v16->_forwardMapToV2;
    v16->_forwardMapToV2 = (NSDictionary *)v21;

    v23 = (void *)MEMORY[0x1E4F1CA60];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_3;
    v54[3] = &unk_1E5B51198;
    id v24 = v19;
    id v55 = v24;
    id v25 = v20;
    id v56 = v25;
    id v26 = v13;
    id v57 = v26;
    uint64_t v27 = objc_msgSend(v23, "fc_dictionary:", v54);
    forwardMapToV3 = v16->_forwardMapToV3;
    v16->_forwardMapToV3 = (NSDictionary *)v27;

    id v43 = v11;
    v29 = (void *)MEMORY[0x1E4F1CA60];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_5;
    v49[3] = &unk_1E5B4BFA0;
    id v30 = v24;
    id v50 = v30;
    id v31 = v25;
    id v51 = v31;
    id v32 = v26;
    id v52 = v32;
    id v33 = v14;
    id v53 = v33;
    uint64_t v34 = objc_msgSend(v29, "fc_dictionary:", v49);
    forwardMapToV4 = v16->_forwardMapToV4;
    v16->_forwardMapToV4 = (NSDictionary *)v34;

    v36 = (void *)MEMORY[0x1E4F1CA60];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_7;
    v44[3] = &unk_1E5B4BFA0;
    id v45 = v33;
    id v46 = v32;
    id v47 = v31;
    id v48 = v30;
    v37 = v36;
    id v11 = v43;
    uint64_t v38 = objc_msgSend(v37, "fc_dictionary:", v44);
    reverseMap = v16->_reverseMap;
    v16->_reverseMap = (NSDictionary *)v38;
  }
  return v16;
}

- (id)allValuesForVersion:(int64_t)a3
{
  __int16 v5 = [(FCCKPrivateDatabaseVersionMapping *)self baseValues];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__FCCKPrivateDatabaseVersionMapping_allValuesForVersion___block_invoke;
  v8[3] = &unk_1E5B55358;
  v8[4] = self;
  v8[5] = a3;
  id v6 = objc_msgSend(v5, "fc_arrayByTransformingWithBlock:", v8);

  return v6;
}

- (id)mappingByTransformingValuesWithBlock:(id)a3
{
  id v4 = a3;
  __int16 v5 = [(FCCKPrivateDatabaseVersionMapping *)self baseValues];
  id v6 = objc_msgSend(v5, "fc_setByTransformingWithBlock:", v4);

  __int16 v7 = (void *)MEMORY[0x1E4F1C9E8];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __74__FCCKPrivateDatabaseVersionMapping_mappingByTransformingValuesWithBlock___block_invoke;
  v27[3] = &unk_1E5B54370;
  v27[4] = self;
  id v8 = v4;
  id v28 = v8;
  id v9 = objc_msgSend(v7, "fc_dictionary:", v27);
  id v10 = (void *)MEMORY[0x1E4F1C9E8];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __74__FCCKPrivateDatabaseVersionMapping_mappingByTransformingValuesWithBlock___block_invoke_3;
  v25[3] = &unk_1E5B54370;
  v25[4] = self;
  id v11 = v8;
  id v26 = v11;
  id v12 = objc_msgSend(v10, "fc_dictionary:", v25);
  id v13 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __74__FCCKPrivateDatabaseVersionMapping_mappingByTransformingValuesWithBlock___block_invoke_5;
  v22 = &unk_1E5B54370;
  v23 = self;
  id v24 = v11;
  id v14 = v11;
  id v15 = objc_msgSend(v13, "fc_dictionary:", &v19);
  v16 = objc_msgSend(v6, "allObjects", v19, v20, v21, v22, v23);
  id v17 = +[FCCKPrivateDatabaseVersionMapping mappingWithBaseValues:v16 V2Changes:v9 V3Changes:v12 V4Changes:v15];

  return v17;
}

id __56__FCCKPrivateDatabaseVersionMapping_mapValue_toVersion___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)allValuesModifiedFromVersion:(int64_t)a3 toVersion:(int64_t)a4
{
  __int16 v7 = [(FCCKPrivateDatabaseVersionMapping *)self baseValues];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__FCCKPrivateDatabaseVersionMapping_allValuesModifiedFromVersion_toVersion___block_invoke;
  v10[3] = &unk_1E5B594F0;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a4;
  id v8 = objc_msgSend(v7, "fc_setByTransformingWithBlock:", v10);

  return v8;
}

id __76__FCCKPrivateDatabaseVersionMapping_allValuesModifiedFromVersion_toVersion___block_invoke(uint64_t a1, void *a2)
{
  int v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v6 = [v3 mapValue:v5 toVersion:v4];
  __int16 v7 = [*(id *)(a1 + 32) mapValue:v5 toVersion:*(void *)(a1 + 48)];

  if ([v6 isEqual:v7]) {
    id v8 = 0;
  }
  else {
    id v8 = v6;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reverseMap, 0);
  objc_storeStrong((id *)&self->_forwardMapToV4, 0);
  objc_storeStrong((id *)&self->_forwardMapToV3, 0);
  objc_storeStrong((id *)&self->_forwardMapToV2, 0);
  objc_storeStrong((id *)&self->_V4Changes, 0);
  objc_storeStrong((id *)&self->_V3Changes, 0);
  objc_storeStrong((id *)&self->_V2Changes, 0);
  objc_storeStrong((id *)&self->_baseValues, 0);
}

@end