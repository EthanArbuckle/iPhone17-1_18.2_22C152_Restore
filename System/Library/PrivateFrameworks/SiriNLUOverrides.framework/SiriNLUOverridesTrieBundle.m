@interface SiriNLUOverridesTrieBundle
+ (id)buildPatternTrieLookupKey:(id)a3 locale:(id)a4 overrideNamespace:(int64_t)a5;
+ (id)getTrieURLs:(id)a3;
- (id)fetchOverrideId:(id)a3;
- (id)fetchOverrideIdArray:(id)a3;
- (id)fetchRegexRuleIds:(id)a3 overrideNamespace:(int64_t)a4;
- (id)fetchRuleId:(id)a3 locale:(id)a4 overrideNamespace:(int64_t)a5;
- (id)fetchSerializedNluRequestRule:(id)a3;
- (id)fetchSerializedUserParse:(id)a3;
- (id)init:(id)a3;
- (unint64_t)fetchOverrideTimeStamp:(id)a3;
@end

@implementation SiriNLUOverridesTrieBundle

- (id)fetchRuleId:(id)a3 locale:(id)a4 overrideNamespace:(int64_t)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  v11 = +[SiriNLUOverridesTrieBundle buildPatternTrieLookupKey:v9 locale:v8 overrideNamespace:a5];

  v12 = OverridesLogContext;
  if (os_log_type_enabled((os_log_t)OverridesLogContext, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[SiriNLUOverridesTrieBundle fetchRuleId:locale:overrideNamespace:]";
    __int16 v24 = 2112;
    v25 = v11;
    _os_log_debug_impl(&dword_225623000, v12, OS_LOG_TYPE_DEBUG, "%s TrieOverrides: Starting to fetch rule Id for lookup key:%@", buf, 0x16u);
  }
  patternTrie = self->patternTrie;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __67__SiriNLUOverridesTrieBundle_fetchRuleId_locale_overrideNamespace___block_invoke;
  v19[3] = &unk_264720BA0;
  id v20 = v11;
  id v14 = v10;
  id v21 = v14;
  id v15 = v11;
  [(SiriNLUMarisaTrie *)patternTrie lookupKey:v15 resultBlock:v19];
  v16 = v21;
  id v17 = v14;

  return v17;
}

+ (id)buildPatternTrieLookupKey:(id)a3 locale:(id)a4 overrideNamespace:(int64_t)a5
{
  return (id)[NSString stringWithFormat:@"__%ld__+%@+%@", a5, a4, a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->overrideTimeStampTrie, 0);
  objc_storeStrong((id *)&self->userParseTrie, 0);
  objc_storeStrong((id *)&self->overrideIdTrie, 0);
  objc_storeStrong((id *)&self->patternTrie, 0);
  objc_storeStrong((id *)&self->ruleTrie, 0);
}

- (id)init:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  +[SiriNLUOverridesLogging SiriNLUOverridesLogInitIfNeeded];
  v33.receiver = self;
  v33.super_class = (Class)SiriNLUOverridesTrieBundle;
  v5 = [(SiriNLUOverridesTrieBundle *)&v33 init];
  if (v5)
  {
    v6 = +[SiriNLUOverridesTrieBundle getTrieURLs:v4];
    v7 = OverridesLogContext;
    if (os_log_type_enabled((os_log_t)OverridesLogContext, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[SiriNLUOverridesTrieBundle init:]";
      __int16 v36 = 2112;
      v37 = v6;
      _os_log_debug_impl(&dword_225623000, v7, OS_LOG_TYPE_DEBUG, "%s TrieOverrides: Reading Overrrides trie from %@", buf, 0x16u);
    }
    id v8 = [SiriNLUMarisaTrie alloc];
    id v9 = [v6 objectAtIndexedSubscript:0];
    uint64_t v10 = [(SiriNLUMarisaTrie *)v8 initWithURL:v9];
    ruleTrie = v5->ruleTrie;
    v5->ruleTrie = (SiriNLUMarisaTrie *)v10;

    v12 = [SiriNLUMarisaTrie alloc];
    v13 = [v6 objectAtIndexedSubscript:1];
    uint64_t v14 = [(SiriNLUMarisaTrie *)v12 initWithURL:v13];
    patternTrie = v5->patternTrie;
    v5->patternTrie = (SiriNLUMarisaTrie *)v14;

    v16 = [SiriNLUMarisaTrie alloc];
    id v17 = [v6 objectAtIndexedSubscript:2];
    uint64_t v18 = [(SiriNLUMarisaTrie *)v16 initWithURL:v17];
    overrideIdTrie = v5->overrideIdTrie;
    v5->overrideIdTrie = (SiriNLUMarisaTrie *)v18;

    id v20 = [SiriNLUMarisaTrie alloc];
    id v21 = [v6 objectAtIndexedSubscript:3];
    uint64_t v22 = [(SiriNLUMarisaTrie *)v20 initWithURL:v21];
    userParseTrie = v5->userParseTrie;
    v5->userParseTrie = (SiriNLUMarisaTrie *)v22;

    __int16 v24 = [SiriNLUMarisaTrie alloc];
    v25 = [v6 objectAtIndexedSubscript:4];
    uint64_t v26 = [(SiriNLUMarisaTrie *)v24 initWithURL:v25];
    overrideTimeStampTrie = v5->overrideTimeStampTrie;
    v5->overrideTimeStampTrie = (SiriNLUMarisaTrie *)v26;

    if (v5->ruleTrie && v5->patternTrie && v5->overrideIdTrie && v5->userParseTrie && v5->overrideTimeStampTrie)
    {
      v28 = OverridesLogContext;
      if (os_log_type_enabled((os_log_t)OverridesLogContext, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v35 = "-[SiriNLUOverridesTrieBundle init:]";
        _os_log_impl(&dword_225623000, v28, OS_LOG_TYPE_INFO, "%s TrieOverrides: Successfully initialized", buf, 0xCu);
      }
      v29 = v5;
    }
    else
    {
      v30 = OverridesLogContext;
      if (os_log_type_enabled((os_log_t)OverridesLogContext, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v35 = "-[SiriNLUOverridesTrieBundle init:]";
        _os_log_error_impl(&dword_225623000, v30, OS_LOG_TYPE_ERROR, "%s [ERR]: TrieOverrides: Failing to init without required assets", buf, 0xCu);
      }
      v29 = 0;
    }
  }
  else
  {
    v31 = OverridesLogContext;
    if (os_log_type_enabled((os_log_t)OverridesLogContext, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v35 = "-[SiriNLUOverridesTrieBundle init:]";
      _os_log_error_impl(&dword_225623000, v31, OS_LOG_TYPE_ERROR, "%s [ERR]: TrieOverrides: Unable to initialized for unknown reasons", buf, 0xCu);
    }
    v29 = 0;
  }

  return v29;
}

+ (id)getTrieURLs:(id)a3
{
  id v3 = a3;
  id v15 = [v3 stringByAppendingPathComponent:@"rule_id_to_serialized_rule.trie"];
  id v4 = [v3 stringByAppendingPathComponent:@"pattern_to_rule_id.trie"];
  v5 = [v3 stringByAppendingPathComponent:@"rule_id_to_override_id.trie"];
  v6 = [v3 stringByAppendingPathComponent:@"override_id_to_serialized_parse.trie"];
  v7 = [v3 stringByAppendingPathComponent:@"override_id_to_timestamp.trie"];

  id v8 = [NSURL fileURLWithPath:v15];
  id v9 = [NSURL fileURLWithPath:v4];
  uint64_t v10 = [NSURL fileURLWithPath:v5];
  v11 = [NSURL fileURLWithPath:v6];
  v12 = [NSURL fileURLWithPath:v7];
  v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v8, v9, v10, v11, v12, 0);

  return v13;
}

- (id)fetchRegexRuleIds:(id)a3 overrideNamespace:(int64_t)a4
{
  return [(SiriNLUOverridesTrieBundle *)self fetchRuleId:@"__REGEX__" locale:a3 overrideNamespace:a4];
}

void __67__SiriNLUOverridesTrieBundle_fetchRuleId_locale_overrideNamespace___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
    [*(id *)(a1 + 40) addObject:v4];
  }
  else
  {
    v5 = OverridesLogContext;
    if (os_log_type_enabled((os_log_t)OverridesLogContext, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 136315394;
      id v8 = "-[SiriNLUOverridesTrieBundle fetchRuleId:locale:overrideNamespace:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_error_impl(&dword_225623000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: PatternTrie returns nil binary for lookup key:%@, exit early from the callback to prevent crash", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (id)fetchSerializedNluRequestRule:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  ruleTrie = self->ruleTrie;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__SiriNLUOverridesTrieBundle_fetchSerializedNluRequestRule___block_invoke;
  v9[3] = &unk_264720B78;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [(SiriNLUMarisaTrie *)ruleTrie lookupKey:v6 resultBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __60__SiriNLUOverridesTrieBundle_fetchSerializedNluRequestRule___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    v5 = OverridesLogContext;
    if (os_log_type_enabled((os_log_t)OverridesLogContext, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 136315394;
      id v8 = "-[SiriNLUOverridesTrieBundle fetchSerializedNluRequestRule:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_error_impl(&dword_225623000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: SerializedRuleTrie returns nil binary for ruleId:%@, exit early from the callback to prevent crash", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (id)fetchOverrideId:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [(SiriNLUOverridesTrieBundle *)self fetchOverrideIdArray:a3];
  if ([v3 count])
  {
    id v4 = [v3 lastObject];
    if ((unint64_t)[v3 count] >= 2)
    {
      v5 = (void *)OverridesLogContext;
      if (os_log_type_enabled((os_log_t)OverridesLogContext, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = v5;
        int v9 = 136315650;
        uint64_t v10 = "-[SiriNLUOverridesTrieBundle fetchOverrideId:]";
        __int16 v11 = 2048;
        uint64_t v12 = [v3 count];
        __int16 v13 = 2112;
        uint64_t v14 = v4;
        _os_log_error_impl(&dword_225623000, v6, OS_LOG_TYPE_ERROR, "%s [ERR]: OverrrideId has multiple values (length:%lu), possibly mal-formed data, returning the last one from the array. OverrideId returned:%@. ", (uint8_t *)&v9, 0x20u);
      }
    }
  }
  else
  {
    int v7 = OverridesLogContext;
    if (os_log_type_enabled((os_log_t)OverridesLogContext, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      uint64_t v10 = "-[SiriNLUOverridesTrieBundle fetchOverrideId:]";
      _os_log_impl(&dword_225623000, v7, OS_LOG_TYPE_INFO, "%s [WARN]: OverrideId not found, returning nil", (uint8_t *)&v9, 0xCu);
    }
    id v4 = 0;
  }

  return v4;
}

- (id)fetchOverrideIdArray:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  overrideIdTrie = self->overrideIdTrie;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __51__SiriNLUOverridesTrieBundle_fetchOverrideIdArray___block_invoke;
  v12[3] = &unk_264720BA0;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  [(SiriNLUMarisaTrie *)overrideIdTrie lookupKey:v8 resultBlock:v12];
  int v9 = v14;
  id v10 = v7;

  return v10;
}

void __51__SiriNLUOverridesTrieBundle_fetchOverrideIdArray___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
    [*(id *)(a1 + 40) addObject:v4];
  }
  else
  {
    v5 = OverridesLogContext;
    if (os_log_type_enabled((os_log_t)OverridesLogContext, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 136315394;
      id v8 = "-[SiriNLUOverridesTrieBundle fetchOverrideIdArray:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_error_impl(&dword_225623000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: OverrideIdTrie returns nil binary for ruleId:%@, exit early from the callback to prevent crash", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (id)fetchSerializedUserParse:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  userParseTrie = self->userParseTrie;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__SiriNLUOverridesTrieBundle_fetchSerializedUserParse___block_invoke;
  v9[3] = &unk_264720B78;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [(SiriNLUMarisaTrie *)userParseTrie lookupKey:v6 resultBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __55__SiriNLUOverridesTrieBundle_fetchSerializedUserParse___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    v5 = OverridesLogContext;
    if (os_log_type_enabled((os_log_t)OverridesLogContext, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 136315394;
      id v8 = "-[SiriNLUOverridesTrieBundle fetchSerializedUserParse:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_error_impl(&dword_225623000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: UserParseTrie returns nil binary for overrideId:%@, exit early  from the callback to prevent crash", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (unint64_t)fetchOverrideTimeStamp:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 0;
  overrideTimeStampTrie = self->overrideTimeStampTrie;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__SiriNLUOverridesTrieBundle_fetchOverrideTimeStamp___block_invoke;
  v9[3] = &unk_264720BC8;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = v13;
  uint64_t v12 = &v15;
  [(SiriNLUMarisaTrie *)overrideTimeStampTrie lookupKey:v6 resultBlock:v9];
  unint64_t v7 = v16[3];

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v15, 8);

  return v7;
}

void __53__SiriNLUOverridesTrieBundle_fetchOverrideTimeStamp___block_invoke(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
    {
      [v3 getBytes:*(void *)(a1[6] + 8) + 24 length:8];
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
      goto LABEL_9;
    }
    uint64_t v5 = OverridesLogContext;
    if (os_log_type_enabled((os_log_t)OverridesLogContext, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      uint64_t v12 = "-[SiriNLUOverridesTrieBundle fetchOverrideTimeStamp:]_block_invoke";
      id v6 = "%s [ERR]: OverrideId has multiple time stamps! Possibly mal-formed data, exit early from the callback and wil"
           "l return the first value looked up";
      unint64_t v7 = v5;
      uint32_t v8 = 12;
LABEL_7:
      _os_log_error_impl(&dword_225623000, v7, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v11, v8);
    }
  }
  else
  {
    uint64_t v9 = OverridesLogContext;
    if (os_log_type_enabled((os_log_t)OverridesLogContext, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = a1[4];
      int v11 = 136315394;
      uint64_t v12 = "-[SiriNLUOverridesTrieBundle fetchOverrideTimeStamp:]_block_invoke";
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      id v6 = "%s [ERR]: TimeStampTrie returns nil binary for overrideId:%@, exit early  from the callback to prevent crash";
      unint64_t v7 = v9;
      uint32_t v8 = 22;
      goto LABEL_7;
    }
  }
LABEL_9:
}

@end