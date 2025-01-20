@interface SLRegexMatcher
- (NSArray)regexMatchingRules;
- (NSArray)replaceStrings;
- (SLRegexMatcher)initWithConfigFile:(id)a3;
- (id)applyPreprocessingOnUtt:(id)a3;
- (void)_compileRegexRulesForPatterns:(id)a3;
- (void)setRegexMatchingRules:(id)a3;
- (void)setReplaceStrings:(id)a3;
@end

@implementation SLRegexMatcher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceStrings, 0);
  objc_storeStrong((id *)&self->_regexMatchingRules, 0);
}

- (void)setReplaceStrings:(id)a3
{
}

- (NSArray)replaceStrings
{
  return self->_replaceStrings;
}

- (void)setRegexMatchingRules:(id)a3
{
}

- (NSArray)regexMatchingRules
{
  return self->_regexMatchingRules;
}

- (id)applyPreprocessingOnUtt:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__112;
  v15 = __Block_byref_object_dispose__113;
  id v16 = (id)[v4 mutableCopy];
  regexMatchingRules = self->_regexMatchingRules;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __42__SLRegexMatcher_applyPreprocessingOnUtt___block_invoke;
  v10[3] = &unk_2644FFDF8;
  v10[4] = self;
  v10[5] = &v11;
  [(NSArray *)regexMatchingRules enumerateObjectsUsingBlock:v10];
  v6 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[SLRegexMatcher applyPreprocessingOnUtt:]";
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_21EFF4000, v6, OS_LOG_TYPE_DEFAULT, "%s Input to regex: %@", buf, 0x16u);
    v6 = SLLogContextFacilityCoreSpeech;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)v12[5];
    *(_DWORD *)buf = 136315394;
    v18 = "-[SLRegexMatcher applyPreprocessingOnUtt:]";
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_21EFF4000, v6, OS_LOG_TYPE_DEFAULT, "%s Output of regex: %@", buf, 0x16u);
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __42__SLRegexMatcher_applyPreprocessingOnUtt___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v6 = a2;
  uint64_t v7 = [v5 length];
  id v8 = [*(id *)(*(void *)(a1 + 32) + 16) objectAtIndexedSubscript:a3];
  objc_msgSend(v6, "replaceMatchesInString:options:range:withTemplate:", v5, 0, 0, v7, v8);
}

- (void)_compileRegexRulesForPatterns:(id)a3
{
  id v4 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__112;
  v17[4] = __Block_byref_object_dispose__113;
  id v18 = 0;
  v5 = [MEMORY[0x263EFF980] array];
  id v6 = [MEMORY[0x263EFF980] array];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __48__SLRegexMatcher__compileRegexRulesForPatterns___block_invoke;
  v13[3] = &unk_2644FFDD0;
  id v16 = v17;
  uint64_t v7 = v5;
  v14 = v7;
  id v8 = v6;
  v15 = v8;
  [v4 enumerateObjectsUsingBlock:v13];
  regexMatchingRules = self->_regexMatchingRules;
  self->_regexMatchingRules = v7;
  v10 = v7;

  replaceStrings = self->_replaceStrings;
  self->_replaceStrings = v8;
  v12 = v8;

  _Block_object_dispose(v17, 8);
}

void __48__SLRegexMatcher__compileRegexRulesForPatterns___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"patternMatch"];
  v5 = [v3 objectForKeyedSubscript:@"replaceWith"];

  if ([v4 length])
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v6 + 40);
    uint64_t v7 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v4 options:1 error:&obj];
    objc_storeStrong((id *)(v6 + 40), obj);
    id v8 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v8) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v7 == 0;
    }
    if (v9 || v5 == 0)
    {
      uint64_t v11 = (void *)SLLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v12 = v11;
        uint64_t v13 = [v8 localizedDescription];
        *(_DWORD *)buf = 136315650;
        v17 = "-[SLRegexMatcher _compileRegexRulesForPatterns:]_block_invoke";
        __int16 v18 = 2112;
        __int16 v19 = v4;
        __int16 v20 = 2112;
        uint64_t v21 = v13;
        _os_log_error_impl(&dword_21EFF4000, v12, OS_LOG_TYPE_ERROR, "%s Unable to decode pattern %@ with err %@", buf, 0x20u);
      }
    }
    else
    {
      [*(id *)(a1 + 32) addObject:v7];
      [*(id *)(a1 + 40) addObject:v5];
    }
  }
  else
  {
    v14 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[SLRegexMatcher _compileRegexRulesForPatterns:]_block_invoke";
      _os_log_error_impl(&dword_21EFF4000, v14, OS_LOG_TYPE_ERROR, "%s Empty pattern, ignore", buf, 0xCu);
    }
  }
}

- (SLRegexMatcher)initWithConfigFile:(id)a3
{
  v25[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SLRegexMatcher;
  v5 = [(SLRegexMatcher *)&v19 init];
  if (!v5) {
    goto LABEL_12;
  }
  if (SLLogInitIfNeeded_once != -1) {
    dispatch_once(&SLLogInitIfNeeded_once, &__block_literal_global);
  }
  uint64_t v6 = [MEMORY[0x263F38060] decodeJsonFromFile:v4];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = [v6 objectForKeyedSubscript:@"rules"];

    if (v8)
    {
LABEL_11:
      v15 = [v7 objectForKeyedSubscript:@"rules"];
      [(SLRegexMatcher *)v5 _compileRegexRulesForPatterns:v15];

LABEL_12:
      v14 = v5;
      goto LABEL_13;
    }
  }
  BOOL v9 = [NSString stringWithFormat:@"Missing config for regex matcher %@", v7];
  v10 = (void *)MEMORY[0x263F087E8];
  v24 = @"reason";
  v25[0] = v9;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
  v12 = [v10 errorWithDomain:@"com.apple.sl" code:115 userInfo:v11];

  if (!v12)
  {

    goto LABEL_11;
  }
  uint64_t v13 = (void *)SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    v17 = v13;
    __int16 v18 = [v12 localizedDescription];
    *(_DWORD *)buf = 136315394;
    uint64_t v21 = "-[SLRegexMatcher initWithConfigFile:]";
    __int16 v22 = 2112;
    v23 = v18;
    _os_log_error_impl(&dword_21EFF4000, v17, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }
  v14 = 0;
LABEL_13:

  return v14;
}

@end