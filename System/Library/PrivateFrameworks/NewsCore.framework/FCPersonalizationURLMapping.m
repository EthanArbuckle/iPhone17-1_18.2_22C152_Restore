@interface FCPersonalizationURLMapping
+ (BOOL)supportsSecureCoding;
+ (id)domainForURL:(id)a3;
- (FCPersonalizationURLMapping)init;
- (FCPersonalizationURLMapping)initWithCoder:(id)a3;
- (FCPersonalizationURLMapping)initWithPBURLMapping:(id)a3;
- (NSDictionary)urlMappingByDomain;
- (id)jsonEncodableObject;
- (id)popularityForURL:(id)a3;
- (id)tagScoresForURL:(id)a3;
- (unint64_t)count;
- (void)encodeWithCoder:(id)a3;
- (void)setUrlMappingByDomain:(id)a3;
@end

@implementation FCPersonalizationURLMapping

void __52__FCPersonalizationURLMapping_initWithPBURLMapping___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6 = [[FCPersonalizationURLDomainMapping alloc] initWithPBURLMappingDomain:v3];
  v4 = *(void **)(a1 + 32);
  v5 = [v3 domain];

  [v4 setObject:v6 forKeyedSubscript:v5];
}

void __52__FCPersonalizationURLMapping_initWithPBURLMapping___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) domains];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__FCPersonalizationURLMapping_initWithPBURLMapping___block_invoke_2;
  v6[3] = &unk_1E5B569F0;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

- (FCPersonalizationURLMapping)initWithPBURLMapping:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FCPersonalizationURLMapping;
  v6 = [(FCPersonalizationURLMapping *)&v14 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pbURLMapping, a3);
    v8 = (void *)MEMORY[0x1E4F1C9E8];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __52__FCPersonalizationURLMapping_initWithPBURLMapping___block_invoke;
    v12[3] = &unk_1E5B4BF78;
    id v13 = v5;
    uint64_t v9 = objc_msgSend(v8, "fc_dictionary:", v12);
    urlMappingByDomain = v7->_urlMappingByDomain;
    v7->_urlMappingByDomain = (NSDictionary *)v9;
  }
  return v7;
}

- (FCPersonalizationURLMapping)init
{
  return [(FCPersonalizationURLMapping *)self initWithPBURLMapping:0];
}

- (unint64_t)count
{
  v2 = [(FCPersonalizationURLMapping *)self urlMappingByDomain];
  unint64_t v3 = [v2 count];

  return v3;
}

+ (id)domainForURL:(id)a3
{
  id v3 = a3;
  v4 = [[FCPersonalizationDecomposedURL alloc] initWithURLString:v3];

  id v5 = [(FCPersonalizationDecomposedURL *)v4 domain];

  return v5;
}

- (id)tagScoresForURL:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [[FCPersonalizationDecomposedURL alloc] initWithURLString:v4];
  v6 = [(FCPersonalizationURLMapping *)self urlMappingByDomain];
  id v7 = [(FCPersonalizationDecomposedURL *)v5 domain];
  v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    *(void *)v35 = 0;
    *(void *)&v35[8] = v35;
    *(void *)&v35[16] = 0x3032000000;
    v36 = __Block_byref_object_copy__45;
    v37 = __Block_byref_object_dispose__45;
    id v38 = [v8 tagsForPath:@"/"];
    if (!*(void *)(*(void *)&v35[8] + 40))
    {
      uint64_t v9 = MEMORY[0x1E4F14500];
      id v10 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v20 = (void *)[[NSString alloc] initWithFormat:@"There should be path tags for the default path"];
        *(_DWORD *)v32 = 136315906;
        *(void *)&v32[4] = "-[FCPersonalizationURLMapping tagScoresForURL:]";
        *(_WORD *)&v32[12] = 2080;
        *(void *)&v32[14] = "FCPersonalizationURLMapping.m";
        *(_WORD *)&v32[22] = 1024;
        LODWORD(v33) = 277;
        WORD2(v33) = 2114;
        *(void *)((char *)&v33 + 6) = v20;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v32, 0x26u);
      }
    }
    *(void *)v32 = 0;
    *(void *)&v32[8] = v32;
    *(void *)&v32[16] = 0x3032000000;
    *(void *)&long long v33 = __Block_byref_object_copy__45;
    *((void *)&v33 + 1) = __Block_byref_object_dispose__45;
    id v34 = 0;
    v11 = [(FCPersonalizationDecomposedURL *)v5 paths];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __47__FCPersonalizationURLMapping_tagScoresForURL___block_invoke;
    v22[3] = &unk_1E5B4E238;
    id v23 = v8;
    v24 = v35;
    v25 = v32;
    [v11 enumerateObjectsUsingBlock:v22];

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __47__FCPersonalizationURLMapping_tagScoresForURL___block_invoke_2;
    v21[3] = &unk_1E5B55BD0;
    v21[4] = v35;
    v12 = objc_msgSend(MEMORY[0x1E4F1C9E8], "fc_dictionary:", v21);
    id v13 = FCProgressivePersonalizationLog;
    if (os_log_type_enabled((os_log_t)FCProgressivePersonalizationLog, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = *(void *)(*(void *)&v32[8] + 40);
      *(_DWORD *)buf = 138412802;
      id v27 = v4;
      __int16 v28 = 2112;
      uint64_t v29 = v14;
      __int16 v30 = 2112;
      v31 = v12;
      _os_log_impl(&dword_1A460D000, v13, OS_LOG_TYPE_DEBUG, "URL String %@ with matching path %@ mapped to %@", buf, 0x20u);
    }

    _Block_object_dispose(v32, 8);
    _Block_object_dispose(v35, 8);
  }
  else
  {
    v15 = (void *)FCProgressivePersonalizationLog;
    if (os_log_type_enabled((os_log_t)FCProgressivePersonalizationLog, OS_LOG_TYPE_DEBUG))
    {
      v16 = v15;
      v17 = [(FCPersonalizationDecomposedURL *)v5 domain];
      v18 = [(FCPersonalizationDecomposedURL *)v5 paths];
      *(_DWORD *)v35 = 138412802;
      *(void *)&v35[4] = v4;
      *(_WORD *)&v35[12] = 2112;
      *(void *)&v35[14] = v17;
      *(_WORD *)&v35[22] = 2112;
      v36 = v18;
      _os_log_impl(&dword_1A460D000, v16, OS_LOG_TYPE_DEBUG, "Failed to find mapping for URL String %@ with domain %@ and paths %@", v35, 0x20u);
    }
    v12 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v12;
}

void __47__FCPersonalizationURLMapping_tagScoresForURL___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  id v7 = objc_msgSend(*(id *)(a1 + 32), "tagsForPath:");

  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) tagsForPath:v11];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __47__FCPersonalizationURLMapping_tagScoresForURL___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__FCPersonalizationURLMapping_tagScoresForURL___block_invoke_3;
  v6[3] = &unk_1E5B4F600;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

void __47__FCPersonalizationURLMapping_tagScoresForURL___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__FCPersonalizationURLMapping_tagScoresForURL___block_invoke_4;
  v4[3] = &unk_1E5B56A18;
  id v5 = *(id *)(a1 + 32);
  [a3 enumerateKeysAndObjectsUsingBlock:v4];
}

void __47__FCPersonalizationURLMapping_tagScoresForURL___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];

  if (v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = (void *)[[NSString alloc] initWithFormat:@"Already have a score for tag %@", v5];
    *(_DWORD *)buf = 136315906;
    id v10 = "-[FCPersonalizationURLMapping tagScoresForURL:]_block_invoke_4";
    __int16 v11 = 2080;
    v12 = "FCPersonalizationURLMapping.m";
    __int16 v13 = 1024;
    int v14 = 293;
    __int16 v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (id)popularityForURL:(id)a3
{
  id v4 = a3;
  id v5 = [[FCPersonalizationDecomposedURL alloc] initWithURLString:v4];

  id v6 = [(FCPersonalizationURLMapping *)self urlMappingByDomain];
  id v7 = [(FCPersonalizationDecomposedURL *)v5 domain];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    uint64_t v9 = NSNumber;
    id v10 = [(FCPersonalizationURLMapping *)self urlMappingByDomain];
    __int16 v11 = [(FCPersonalizationDecomposedURL *)v5 domain];
    v12 = [v10 objectForKeyedSubscript:v11];
    [v12 averageSafariVisitsPerDay];
    __int16 v13 = objc_msgSend(v9, "numberWithDouble:");
  }
  else
  {
    __int16 v13 = 0;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCPersonalizationURLMapping)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"urlMapping"];

  id v6 = [(FCPersonalizationURLMapping *)self initWithPBURLMapping:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  pbURLMapping = self->_pbURLMapping;
  if (pbURLMapping) {
    [a3 encodeObject:pbURLMapping forKey:@"urlMapping"];
  }
}

- (id)jsonEncodableObject
{
  v2 = [(FCPersonalizationURLMapping *)self urlMappingByDomain];
  id v3 = objc_msgSend(v2, "fc_jsonEncodableDictionaryWithObjectHandler:arrayObjectHandler:dictionaryKeyHandler:dictionaryValueHandler:", &__block_literal_global_102, 0, 0, 0);

  return v3;
}

id __50__FCPersonalizationURLMapping_jsonEncodableObject__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (v2)
  {
    if (objc_opt_isKindOfClass()) {
      id v3 = v2;
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  id v4 = v3;

  id v5 = [v4 paths];

  return v5;
}

- (NSDictionary)urlMappingByDomain
{
  return self->_urlMappingByDomain;
}

- (void)setUrlMappingByDomain:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlMappingByDomain, 0);
  objc_storeStrong((id *)&self->_pbURLMapping, 0);
}

@end