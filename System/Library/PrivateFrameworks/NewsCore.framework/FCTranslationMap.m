@interface FCTranslationMap
- (FCTranslationMap)initWithPBTranslationMap:(id)a3 resourceID:(id)a4;
- (NSDictionary)favoriteTranslationMap;
- (NSDictionary)topicTranslationMap;
- (NSString)resourceID;
- (id)favoriteTranslationForTagID:(id)a3;
- (id)topicTranslationForTagID:(id)a3;
- (void)setFavoriteTranslationMap:(id)a3;
- (void)setResourceID:(id)a3;
- (void)setTopicTranslationMap:(id)a3;
@end

@implementation FCTranslationMap

- (FCTranslationMap)initWithPBTranslationMap:(id)a3 resourceID:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)FCTranslationMap;
  v8 = [(FCTranslationMap *)&v27 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    resourceID = v8->_resourceID;
    v8->_resourceID = (NSString *)v9;

    v11 = (void *)MEMORY[0x1E4F1C9E8];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __56__FCTranslationMap_initWithPBTranslationMap_resourceID___block_invoke;
    v25[3] = &unk_1E5B4BF78;
    id v12 = v6;
    id v26 = v12;
    uint64_t v13 = objc_msgSend(v11, "fc_dictionary:", v25);
    topicTranslationMap = v8->_topicTranslationMap;
    v8->_topicTranslationMap = (NSDictionary *)v13;

    v15 = FCTranslationLog;
    if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v8->_topicTranslationMap;
      *(_DWORD *)buf = 138412290;
      v29 = v16;
      _os_log_impl(&dword_1A460D000, v15, OS_LOG_TYPE_DEFAULT, "Parsed topic translation map %@", buf, 0xCu);
    }
    v17 = (void *)MEMORY[0x1E4F1C9E8];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __56__FCTranslationMap_initWithPBTranslationMap_resourceID___block_invoke_7;
    v23[3] = &unk_1E5B4BF78;
    id v24 = v12;
    uint64_t v18 = objc_msgSend(v17, "fc_dictionary:", v23);
    favoriteTranslationMap = v8->_favoriteTranslationMap;
    v8->_favoriteTranslationMap = (NSDictionary *)v18;

    v20 = FCTranslationLog;
    if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v8->_favoriteTranslationMap;
      *(_DWORD *)buf = 138412290;
      v29 = v21;
      _os_log_impl(&dword_1A460D000, v20, OS_LOG_TYPE_DEFAULT, "Parsed favorites translation map %@", buf, 0xCu);
    }
  }
  return v8;
}

void __56__FCTranslationMap_initWithPBTranslationMap_resourceID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) topicLanguageBuckets];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__FCTranslationMap_initWithPBTranslationMap_resourceID___block_invoke_2;
  v6[3] = &unk_1E5B57598;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

void __56__FCTranslationMap_initWithPBTranslationMap_resourceID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[FCTopicTranslation alloc] initWithLanguageBucket:v3];
  id v5 = [v3 values];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__FCTranslationMap_initWithPBTranslationMap_resourceID___block_invoke_3;
  v8[3] = &unk_1E5B55EF0;
  id v9 = *(id *)(a1 + 32);
  id v10 = v3;
  v11 = v4;
  id v6 = v4;
  id v7 = v3;
  [v5 enumerateObjectsUsingBlock:v8];
}

void __56__FCTranslationMap_initWithPBTranslationMap_resourceID___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];

  if (v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = (void *)[[NSString alloc] initWithFormat:@"Given the same foreign key in 2 buckets: %@", *(void *)(a1 + 40)];
    *(_DWORD *)buf = 136315906;
    id v7 = "-[FCTranslationMap initWithPBTranslationMap:resourceID:]_block_invoke_3";
    __int16 v8 = 2080;
    id v9 = "FCTranslationMap.m";
    __int16 v10 = 1024;
    int v11 = 42;
    __int16 v12 = 2114;
    uint64_t v13 = v5;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  [*(id *)(a1 + 32) setObject:*(void *)(a1 + 48) forKeyedSubscript:v3];
}

void __56__FCTranslationMap_initWithPBTranslationMap_resourceID___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) favoritesLanguageBuckets];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__FCTranslationMap_initWithPBTranslationMap_resourceID___block_invoke_2_8;
  v6[3] = &unk_1E5B57598;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

void __56__FCTranslationMap_initWithPBTranslationMap_resourceID___block_invoke_2_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 values];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__FCTranslationMap_initWithPBTranslationMap_resourceID___block_invoke_3_9;
  v6[3] = &unk_1E5B50F30;
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

void __56__FCTranslationMap_initWithPBTranslationMap_resourceID___block_invoke_3_9(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 objectForKeyedSubscript:v4];

  if (v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = (void *)[[NSString alloc] initWithFormat:@"Given the same foreign key in 2 buckets: %@", *(void *)(a1 + 40)];
    *(_DWORD *)buf = 136315906;
    id v9 = "-[FCTranslationMap initWithPBTranslationMap:resourceID:]_block_invoke_3";
    __int16 v10 = 2080;
    int v11 = "FCTranslationMap.m";
    __int16 v12 = 1024;
    int v13 = 53;
    __int16 v14 = 2114;
    v15 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v6 = [*(id *)(a1 + 40) key];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v4];
}

- (id)topicTranslationForTagID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(FCTranslationMap *)self topicTranslationMap];
    id v6 = [v5 objectForKeyedSubscript:v4];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)favoriteTranslationForTagID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(FCTranslationMap *)self favoriteTranslationMap];
    id v6 = [v5 objectForKeyedSubscript:v4];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (NSString)resourceID
{
  return self->_resourceID;
}

- (void)setResourceID:(id)a3
{
}

- (NSDictionary)topicTranslationMap
{
  return self->_topicTranslationMap;
}

- (void)setTopicTranslationMap:(id)a3
{
}

- (NSDictionary)favoriteTranslationMap
{
  return self->_favoriteTranslationMap;
}

- (void)setFavoriteTranslationMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favoriteTranslationMap, 0);
  objc_storeStrong((id *)&self->_topicTranslationMap, 0);
  objc_storeStrong((id *)&self->_resourceID, 0);
}

@end