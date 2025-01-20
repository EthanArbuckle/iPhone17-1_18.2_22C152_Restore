@interface FCPersonalizationWhitelist
+ (BOOL)supportsSecureCoding;
- (FCPersonalizationWhitelist)init;
- (FCPersonalizationWhitelist)initWithCoder:(id)a3;
- (FCPersonalizationWhitelist)initWithPBPersonalizationWhitelist:(id)a3;
- (NSDictionary)defaultTags;
- (NSDictionary)optionalTags;
- (NSDictionary)whitelist;
- (NSSet)portraitDisabledTagIDs;
- (id)jsonEncodableObject;
- (unint64_t)count;
- (void)encodeWithCoder:(id)a3;
- (void)setPortraitDisabledTagIDs:(id)a3;
- (void)setWhitelist:(id)a3;
@end

@implementation FCPersonalizationWhitelist

- (FCPersonalizationWhitelist)initWithPBPersonalizationWhitelist:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FCPersonalizationWhitelist;
  v6 = [(FCPersonalizationWhitelist *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pbWhitelist, a3);
    v8 = (void *)MEMORY[0x1E4F1C9E8];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __65__FCPersonalizationWhitelist_initWithPBPersonalizationWhitelist___block_invoke;
    v17[3] = &unk_1E5B4BF78;
    id v9 = v5;
    id v18 = v9;
    uint64_t v10 = objc_msgSend(v8, "fc_dictionary:", v17);
    whitelist = v7->_whitelist;
    v7->_whitelist = (NSDictionary *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    v13 = [v9 disabledPortraitTags];
    uint64_t v14 = [v12 setWithArray:v13];
    portraitDisabledTagIDs = v7->_portraitDisabledTagIDs;
    v7->_portraitDisabledTagIDs = (NSSet *)v14;
  }
  return v7;
}

void __65__FCPersonalizationWhitelist_initWithPBPersonalizationWhitelist___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) defaultTags];
  id v5 = (void *)v4;
  uint64_t v6 = MEMORY[0x1E4F1CBF0];
  if (v4) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = MEMORY[0x1E4F1CBF0];
  }
  v8 = +[FCPersonalizationMappingUtilities scoredTagsDictionaryFromScoredTags:v7];
  [v3 setObject:v8 forKeyedSubscript:@"defaultTags"];

  uint64_t v9 = [*(id *)(a1 + 32) optionalTags];
  uint64_t v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v6;
  }
  v12 = +[FCPersonalizationMappingUtilities scoredTagsDictionaryFromScoredTags:v11];
  [v3 setObject:v12 forKeyedSubscript:@"optionalTags"];

  if (NFInternalBuild())
  {
    v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v14 = [v13 stringForKey:@"personalization_whitelist_additions"];

    if ([v14 length])
    {
      v15 = (void *)MEMORY[0x1E4F28D90];
      v16 = [v14 dataUsingEncoding:4];
      id v27 = 0;
      v17 = [v15 JSONObjectWithData:v16 options:4 error:&v27];
      id v18 = v27;

      if (v18 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"expected nil value for '%s'", "error");
        *(_DWORD *)buf = 136315906;
        v29 = "-[FCPersonalizationWhitelist initWithPBPersonalizationWhitelist:]_block_invoke";
        __int16 v30 = 2080;
        v31 = "FCPersonalizationWhitelist.m";
        __int16 v32 = 1024;
        int v33 = 73;
        __int16 v34 = 2114;
        v35 = v23;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
      objc_super v19 = (void *)MEMORY[0x1E4F1C9E8];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __65__FCPersonalizationWhitelist_initWithPBPersonalizationWhitelist___block_invoke_16;
      v24[3] = &unk_1E5B4CDC0;
      id v20 = v3;
      id v25 = v20;
      id v26 = v17;
      id v21 = v17;
      v22 = objc_msgSend(v19, "fc_dictionary:", v24);
      [v20 setObject:v22 forKeyedSubscript:@"optionalTags"];
    }
  }
}

void __65__FCPersonalizationWhitelist_initWithPBPersonalizationWhitelist___block_invoke_16(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 objectForKeyedSubscript:@"optionalTags"];
  [v4 addEntriesFromDictionary:v5];

  objc_msgSend(MEMORY[0x1E4F1C9E8], "fc_dictionaryWithKeys:valueBlock:", *(void *)(a1 + 40), &__block_literal_global_56);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 addEntriesFromDictionary:v6];
}

void *__65__FCPersonalizationWhitelist_initWithPBPersonalizationWhitelist___block_invoke_2()
{
  return &unk_1EF8D7C38;
}

- (FCPersonalizationWhitelist)init
{
  return [(FCPersonalizationWhitelist *)self initWithPBPersonalizationWhitelist:0];
}

- (NSDictionary)defaultTags
{
  return (NSDictionary *)[(NSDictionary *)self->_whitelist objectForKeyedSubscript:@"defaultTags"];
}

- (NSDictionary)optionalTags
{
  return (NSDictionary *)[(NSDictionary *)self->_whitelist objectForKeyedSubscript:@"optionalTags"];
}

- (unint64_t)count
{
  id v3 = [(FCPersonalizationWhitelist *)self defaultTags];
  uint64_t v4 = [v3 count];
  id v5 = [(FCPersonalizationWhitelist *)self optionalTags];
  unint64_t v6 = [v5 count] + v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCPersonalizationWhitelist)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"whiteList"];

  unint64_t v6 = [(FCPersonalizationWhitelist *)self initWithPBPersonalizationWhitelist:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  pbWhitelist = self->_pbWhitelist;
  if (pbWhitelist) {
    [a3 encodeObject:pbWhitelist forKey:@"whiteList"];
  }
}

- (id)jsonEncodableObject
{
  v2 = [(FCPersonalizationWhitelist *)self whitelist];
  id v3 = objc_msgSend(v2, "fc_jsonEncodableDictionary");

  return v3;
}

- (NSSet)portraitDisabledTagIDs
{
  return self->_portraitDisabledTagIDs;
}

- (void)setPortraitDisabledTagIDs:(id)a3
{
}

- (NSDictionary)whitelist
{
  return self->_whitelist;
}

- (void)setWhitelist:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whitelist, 0);
  objc_storeStrong((id *)&self->_portraitDisabledTagIDs, 0);
  objc_storeStrong((id *)&self->_pbWhitelist, 0);
}

@end