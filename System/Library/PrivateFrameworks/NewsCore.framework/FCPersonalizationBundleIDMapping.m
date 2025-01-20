@interface FCPersonalizationBundleIDMapping
+ (BOOL)supportsSecureCoding;
+ (id)decendingSpecificityBundleIDsForBundleID:(id)a3;
- (FCPersonalizationBundleIDMapping)init;
- (FCPersonalizationBundleIDMapping)initWithCoder:(id)a3;
- (FCPersonalizationBundleIDMapping)initWithPBBundleIDMapping:(id)a3;
- (NSDictionary)bundleIDMapping;
- (id)jsonEncodableObject;
- (id)tagScoresForBundleID:(id)a3;
- (unint64_t)count;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIDMapping:(id)a3;
@end

@implementation FCPersonalizationBundleIDMapping

void __62__FCPersonalizationBundleIDMapping_initWithPBBundleIDMapping___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 bundleId];

  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "bundleID.bundleId");
    *(_DWORD *)buf = 136315906;
    v14 = "-[FCPersonalizationBundleIDMapping initWithPBBundleIDMapping:]_block_invoke_2";
    __int16 v15 = 2080;
    v16 = "FCPersonalizationBundleIDMapping.m";
    __int16 v17 = 1024;
    int v18 = 76;
    __int16 v19 = 2114;
    v20 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = (void *)MEMORY[0x1E4F1C9E8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__FCPersonalizationBundleIDMapping_initWithPBBundleIDMapping___block_invoke_22;
  v11[3] = &unk_1E5B4BF78;
  id v12 = v3;
  id v6 = v3;
  v7 = objc_msgSend(v5, "fc_dictionary:", v11);
  v8 = *(void **)(a1 + 32);
  v9 = [v6 bundleId];
  [v8 setObject:v7 forKeyedSubscript:v9];
}

void __62__FCPersonalizationBundleIDMapping_initWithPBBundleIDMapping___block_invoke_22(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 channelTags];
  id v6 = (void *)v5;
  uint64_t v7 = MEMORY[0x1E4F1CBF0];
  if (v5) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = MEMORY[0x1E4F1CBF0];
  }
  v9 = +[FCPersonalizationMappingUtilities scoredTagsDictionaryFromScoredTags:v8];
  [v4 setObject:v9 forKeyedSubscript:@"channels"];

  uint64_t v10 = [*(id *)(a1 + 32) topicTags];
  v11 = (void *)v10;
  if (v10) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = v7;
  }
  v13 = +[FCPersonalizationMappingUtilities scoredTagsDictionaryFromScoredTags:v12];
  [v4 setObject:v13 forKeyedSubscript:@"topics"];

  uint64_t v14 = [*(id *)(a1 + 32) sectionTags];
  id v17 = (id)v14;
  if (v14) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = v7;
  }
  v16 = +[FCPersonalizationMappingUtilities scoredTagsDictionaryFromScoredTags:v15];
  [v4 setObject:v16 forKeyedSubscript:@"sections"];
}

- (FCPersonalizationBundleIDMapping)initWithPBBundleIDMapping:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FCPersonalizationBundleIDMapping;
  id v6 = [(FCPersonalizationBundleIDMapping *)&v14 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pbBundleIDMapping, a3);
    uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__FCPersonalizationBundleIDMapping_initWithPBBundleIDMapping___block_invoke;
    v12[3] = &unk_1E5B4BF78;
    id v13 = v5;
    uint64_t v9 = objc_msgSend(v8, "fc_dictionary:", v12);
    bundleIDMapping = v7->_bundleIDMapping;
    v7->_bundleIDMapping = (NSDictionary *)v9;
  }
  return v7;
}

void __62__FCPersonalizationBundleIDMapping_initWithPBBundleIDMapping___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) bundleIds];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__FCPersonalizationBundleIDMapping_initWithPBBundleIDMapping___block_invoke_2;
  v16[3] = &unk_1E5B55E88;
  id v5 = v3;
  id v17 = v5;
  [v4 enumerateObjectsUsingBlock:v16];

  if (NFInternalBuild())
  {
    id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v7 = [v6 stringForKey:@"personalization_bundle_id_mapping_additions"];

    if ([v7 length])
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F28D90];
      uint64_t v9 = [v7 dataUsingEncoding:4];
      id v15 = 0;
      uint64_t v10 = [v8 JSONObjectWithData:v9 options:4 error:&v15];
      id v11 = v15;

      if (v11 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"expected nil value for '%s'", "error");
        *(_DWORD *)buf = 136315906;
        __int16 v19 = "-[FCPersonalizationBundleIDMapping initWithPBBundleIDMapping:]_block_invoke_2";
        __int16 v20 = 2080;
        uint64_t v21 = "FCPersonalizationBundleIDMapping.m";
        __int16 v22 = 1024;
        int v23 = 120;
        __int16 v24 = 2114;
        v25 = v12;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __62__FCPersonalizationBundleIDMapping_initWithPBBundleIDMapping___block_invoke_32;
      v13[3] = &unk_1E5B4F600;
      id v14 = v5;
      [v10 enumerateKeysAndObjectsUsingBlock:v13];
    }
  }
}

+ (id)decendingSpecificityBundleIDsForBundleID:(id)a3
{
  id v3 = a3;
  id v4 = [v3 componentsSeparatedByString:@"."];
  id v5 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __77__FCPersonalizationBundleIDMapping_decendingSpecificityBundleIDsForBundleID___block_invoke;
  id v14 = &unk_1E5B501A0;
  id v15 = v4;
  id v16 = v3;
  id v6 = v3;
  id v7 = v4;
  uint64_t v8 = objc_msgSend(v5, "fc_array:", &v11);
  uint64_t v9 = objc_msgSend(v8, "fc_arrayByReversingObjects", v11, v12, v13, v14);

  return v9;
}

void __77__FCPersonalizationBundleIDMapping_decendingSpecificityBundleIDsForBundleID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__FCPersonalizationBundleIDMapping_decendingSpecificityBundleIDsForBundleID___block_invoke_2;
  v6[3] = &unk_1E5B55E60;
  id v7 = v3;
  id v8 = v4;
  id v9 = *(id *)(a1 + 40);
  id v5 = v3;
  [v8 enumerateObjectsUsingBlock:v6];
}

void __77__FCPersonalizationBundleIDMapping_decendingSpecificityBundleIDsForBundleID___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "fc_subarrayUpToIndex:inclusive:", a3, 1);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [v8 componentsJoinedByString:@"."];
    [v4 addObject:v5];
  }
  else if ([*(id *)(a1 + 40) count] == 1)
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 48);
    [v6 addObject:v7];
  }
}

void __62__FCPersonalizationBundleIDMapping_initWithPBBundleIDMapping___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"expected nil value for '%s'", "bundleIDsDict[extraBundleID]");
    *(_DWORD *)buf = 136315906;
    uint64_t v12 = "-[FCPersonalizationBundleIDMapping initWithPBBundleIDMapping:]_block_invoke";
    __int16 v13 = 2080;
    id v14 = "FCPersonalizationBundleIDMapping.m";
    __int16 v15 = 1024;
    int v16 = 128;
    __int16 v17 = 2114;
    int v18 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v9 = objc_msgSend(v5, "fc_dictionaryByTransformingValuesWithBlock:", &__block_literal_global_92);
  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v7];
}

uint64_t __62__FCPersonalizationBundleIDMapping_initWithPBBundleIDMapping___block_invoke_34(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E4F1C9E8], "fc_dictionaryWithKeys:valueBlock:", a2, &__block_literal_global_39_0);
}

void *__62__FCPersonalizationBundleIDMapping_initWithPBBundleIDMapping___block_invoke_2_36()
{
  return &unk_1EF8D7E78;
}

- (FCPersonalizationBundleIDMapping)init
{
  return [(FCPersonalizationBundleIDMapping *)self initWithPBBundleIDMapping:0];
}

- (unint64_t)count
{
  v2 = [(FCPersonalizationBundleIDMapping *)self bundleIDMapping];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)tagScoresForBundleID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1C9E8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__FCPersonalizationBundleIDMapping_tagScoresForBundleID___block_invoke;
  v9[3] = &unk_1E5B4CDC0;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "fc_dictionary:", v9);

  return v7;
}

void __57__FCPersonalizationBundleIDMapping_tagScoresForBundleID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [(id)objc_opt_class() decendingSpecificityBundleIDsForBundleID:*(void *)(a1 + 40)];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__FCPersonalizationBundleIDMapping_tagScoresForBundleID___block_invoke_2;
  v9[3] = &unk_1E5B55EF0;
  id v5 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v6 = v3;
  id v11 = v6;
  [v4 enumerateObjectsUsingBlock:v9];
  if (![v6 count])
  {
    if ([v4 count])
    {
      id v7 = FCProgressivePersonalizationLog;
      if (os_log_type_enabled((os_log_t)FCProgressivePersonalizationLog, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        uint64_t v13 = v8;
        __int16 v14 = 2112;
        __int16 v15 = v4;
        _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEBUG, "Failed to find mapping for bundle ID %@ with decending IDs %@", buf, 0x16u);
      }
    }
  }
}

void __57__FCPersonalizationBundleIDMapping_tagScoresForBundleID___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) bundleIDMapping];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) bundleIDMapping];
    id v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__FCPersonalizationBundleIDMapping_tagScoresForBundleID___block_invoke_3;
    v9[3] = &unk_1E5B4F600;
    id v10 = *(id *)(a1 + 48);
    [v5 enumerateKeysAndObjectsUsingBlock:v9];

    id v6 = FCProgressivePersonalizationLog;
    if (os_log_type_enabled((os_log_t)FCProgressivePersonalizationLog, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEBUG, "BundleID %@ Mapped to %@", buf, 0x16u);
    }
  }
}

void __57__FCPersonalizationBundleIDMapping_tagScoresForBundleID___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "fc_dictionaryByMergingDictionary:withValueCombiner:", a3, &__block_literal_global_44_0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 addEntriesFromDictionary:v4];
}

uint64_t __57__FCPersonalizationBundleIDMapping_tagScoresForBundleID___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  [a2 doubleValue];
  double v7 = v6;
  [v5 doubleValue];
  double v9 = v8;

  return [v4 numberWithDouble:v7 + v9];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCPersonalizationBundleIDMapping)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIDMapping"];

  double v6 = [(FCPersonalizationBundleIDMapping *)self initWithPBBundleIDMapping:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  pbBundleIDMapping = self->_pbBundleIDMapping;
  if (pbBundleIDMapping) {
    [a3 encodeObject:pbBundleIDMapping forKey:@"bundleIDMapping"];
  }
}

- (id)jsonEncodableObject
{
  v2 = [(FCPersonalizationBundleIDMapping *)self bundleIDMapping];
  id v3 = objc_msgSend(v2, "fc_jsonEncodableDictionary");

  return v3;
}

- (NSDictionary)bundleIDMapping
{
  return self->_bundleIDMapping;
}

- (void)setBundleIDMapping:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIDMapping, 0);
  objc_storeStrong((id *)&self->_pbBundleIDMapping, 0);
}

@end