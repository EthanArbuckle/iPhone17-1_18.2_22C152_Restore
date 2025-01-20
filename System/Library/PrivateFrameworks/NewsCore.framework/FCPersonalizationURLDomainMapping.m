@interface FCPersonalizationURLDomainMapping
- (FCPersonalizationURLDomainMapping)initWithPBURLMappingDomain:(id)a3;
- (NSDictionary)paths;
- (double)averageSafariVisitsPerDay;
- (id)tagsForPath:(id)a3;
- (void)setAverageSafariVisitsPerDay:(double)a3;
- (void)setPaths:(id)a3;
@end

@implementation FCPersonalizationURLDomainMapping

- (FCPersonalizationURLDomainMapping)initWithPBURLMappingDomain:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FCPersonalizationURLDomainMapping;
  v5 = [(FCPersonalizationURLDomainMapping *)&v15 init];
  if (v5)
  {
    [v4 averageSafariVisitsPerDay];
    v5->_averageSafariVisitsPerDay = v6;
    v7 = [v4 domain];

    if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "domain.domain");
      *(_DWORD *)buf = 136315906;
      v17 = "-[FCPersonalizationURLDomainMapping initWithPBURLMappingDomain:]";
      __int16 v18 = 2080;
      v19 = "FCPersonalizationURLMapping.m";
      __int16 v20 = 1024;
      int v21 = 152;
      __int16 v22 = 2114;
      v23 = v12;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    v8 = (void *)MEMORY[0x1E4F1C9E8];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __64__FCPersonalizationURLDomainMapping_initWithPBURLMappingDomain___block_invoke;
    v13[3] = &unk_1E5B4BF78;
    id v14 = v4;
    uint64_t v9 = objc_msgSend(v8, "fc_dictionary:", v13);
    paths = v5->_paths;
    v5->_paths = (NSDictionary *)v9;
  }
  return v5;
}

void __64__FCPersonalizationURLDomainMapping_initWithPBURLMappingDomain___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 path];

  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "path.path");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCPersonalizationURLDomainMapping initWithPBURLMappingDomain:]_block_invoke_2";
    __int16 v17 = 2080;
    __int16 v18 = "FCPersonalizationURLMapping.m";
    __int16 v19 = 1024;
    int v20 = 162;
    __int16 v21 = 2114;
    __int16 v22 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__FCPersonalizationURLDomainMapping_initWithPBURLMappingDomain___block_invoke_60;
  v12[3] = &unk_1E5B56980;
  id v5 = v3;
  id v13 = v5;
  id v14 = *(id *)(a1 + 32);
  double v6 = __64__FCPersonalizationURLDomainMapping_initWithPBURLMappingDomain___block_invoke_60((uint64_t)v12);
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4F1C9E8];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__FCPersonalizationURLDomainMapping_initWithPBURLMappingDomain___block_invoke_2_61;
    v10[3] = &unk_1E5B4BF78;
    id v11 = v5;
    v8 = objc_msgSend(v7, "fc_dictionary:", v10);
    [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v6];
  }
}

id __64__FCPersonalizationURLDomainMapping_initWithPBURLMappingDomain___block_invoke_60(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) path];
  unint64_t v3 = [v2 length];

  id v4 = [*(id *)(a1 + 32) path];
  id v5 = v4;
  if (v3 >= 2)
  {
    double v6 = [v4 stringByTrimmingCharactersInSet:*(void *)(a1 + 40)];
    uint64_t v7 = [@"/" stringByAppendingString:v6];

    id v5 = (void *)v7;
  }
  return v5;
}

void __64__FCPersonalizationURLDomainMapping_initWithPBURLMappingDomain___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"/"];
  id v5 = [*(id *)(a1 + 32) paths];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__FCPersonalizationURLDomainMapping_initWithPBURLMappingDomain___block_invoke_2;
  v8[3] = &unk_1E5B569A8;
  id v9 = v4;
  id v10 = v3;
  id v6 = v3;
  id v7 = v4;
  [v5 enumerateObjectsUsingBlock:v8];
}

void __64__FCPersonalizationURLDomainMapping_initWithPBURLMappingDomain___block_invoke_2_61(uint64_t a1, void *a2)
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
  id v9 = +[FCPersonalizationMappingUtilities scoredTagsDictionaryFromScoredTags:v8];
  [v4 setObject:v9 forKeyedSubscript:@"channels"];

  uint64_t v10 = [*(id *)(a1 + 32) topicTags];
  id v11 = (void *)v10;
  if (v10) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = v7;
  }
  id v13 = +[FCPersonalizationMappingUtilities scoredTagsDictionaryFromScoredTags:v12];
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

- (id)tagsForPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FCPersonalizationURLDomainMapping *)self paths];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (double)averageSafariVisitsPerDay
{
  return self->_averageSafariVisitsPerDay;
}

- (void)setAverageSafariVisitsPerDay:(double)a3
{
  self->_averageSafariVisitsPerDay = a3;
}

- (NSDictionary)paths
{
  return self->_paths;
}

- (void)setPaths:(id)a3
{
}

- (void).cxx_destruct
{
}

@end