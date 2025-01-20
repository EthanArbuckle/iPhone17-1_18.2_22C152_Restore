@interface _LTEtiquetteSanitizer
- (_LTEtiquetteSanitizer)initWithModelURL:(id)a3 language:(id)a4;
- (_LTEtiquetteSanitizer)initWithReplacementTokenDictionary:(id)a3 language:(id)a4;
- (id)matchesForString:(id)a3;
- (id)replacementStringForString:(id)a3 forToken:(id)a4;
- (id)sanitizedStringForString:(id)a3;
- (id)stringByReplacingMatches:(id)a3 inString:(id)a4;
- (id)treeForReplacementTokens:(id)a3;
@end

@implementation _LTEtiquetteSanitizer

- (_LTEtiquetteSanitizer)initWithReplacementTokenDictionary:(id)a3 language:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(_LTEtiquetteSanitizer *)self init];
  v9 = v8;
  if (v8)
  {
    uint64_t v10 = [(_LTEtiquetteSanitizer *)v8 treeForReplacementTokens:v6];
    replacementTree = v9->_replacementTree;
    v9->_replacementTree = (NSDictionary *)v10;

    objc_storeStrong((id *)&v9->_locale, a4);
    v12 = v9;
  }

  return v9;
}

- (_LTEtiquetteSanitizer)initWithModelURL:(id)a3 language:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [a3 URLByAppendingPathComponent:@"etiquette.json"];
  v8 = replacementDictionaryForEtiquetteFileAtURL(v7);
  if (v8)
  {
    v9 = _LTOSLogEtiquetteSanitizer();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v12 = 138543362;
      v13 = v7;
      _os_log_impl(&dword_2600DC000, v9, OS_LOG_TYPE_INFO, "Creating etiquette sanitizer with URL: %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  uint64_t v10 = [(_LTEtiquetteSanitizer *)self initWithReplacementTokenDictionary:v8 language:v6];

  return v10;
}

- (id)treeForReplacementTokens:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  v5 = [v3 dictionary];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50___LTEtiquetteSanitizer_treeForReplacementTokens___block_invoke;
  v8[3] = &unk_265546EE0;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

- (id)matchesForString:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v24 = a3;
  objc_initWeak(&location, self);
  id v4 = [MEMORY[0x263EFF980] array];
  v5 = [MEMORY[0x263EFF980] array];
  id v6 = [MEMORY[0x263EFF980] array];
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__4;
  v35[4] = __Block_byref_object_dispose__4;
  id v36 = 0;
  id v7 = [v24 lowercaseString];
  uint64_t v8 = [v24 length];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __42___LTEtiquetteSanitizer_matchesForString___block_invoke;
  v29[3] = &unk_265546F08;
  v23 = &v34;
  objc_copyWeak(&v34, &location);
  id v9 = v5;
  id v30 = v9;
  v33 = v35;
  id v10 = v4;
  id v31 = v10;
  id v11 = v6;
  id v32 = v11;
  objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, 2, v29);

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v12);
        }
        v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "node", v23);
        v18 = [v17 objectForKeyedSubscript:@"TOKEN"];
        [v16 setToken:v18];

        v19 = [v16 token];

        if (v19) {
          [v10 addObject:v16];
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v38 count:16];
    }
    while (v13);
  }

  v20 = v32;
  id v21 = v10;

  objc_destroyWeak(v23);
  _Block_object_dispose(v35, 8);

  objc_destroyWeak(&location);
  return v21;
}

- (id)replacementStringForString:(id)a3 forToken:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[v6 mutableCopy];
  unint64_t v8 = [v5 length];
  unint64_t v9 = [v6 length];

  if (v8 >= v9) {
    unint64_t v10 = v9;
  }
  else {
    unint64_t v10 = v8;
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61___LTEtiquetteSanitizer_replacementStringForString_forToken___block_invoke;
  v13[3] = &unk_265546F30;
  id v11 = v7;
  id v14 = v11;
  objc_msgSend(v5, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 2, v13);

  return v11;
}

- (id)stringByReplacingMatches:(id)a3 inString:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void *)[a4 mutableCopy];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v14 = [v13 range];
        v16 = objc_msgSend(v7, "substringWithRange:", v14, v15);
        v17 = [v13 token];
        v18 = [(_LTEtiquetteSanitizer *)self replacementStringForString:v16 forToken:v17];

        uint64_t v19 = [v18 length];
        v10 += v19 - [v16 length];
        uint64_t v20 = [v13 range];
        objc_msgSend(v7, "replaceCharactersInRange:withString:", v20 + v10, v21, v18);
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  v22 = (void *)[v7 copy];
  return v22;
}

- (id)sanitizedStringForString:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(_LTEtiquetteSanitizer *)self matchesForString:v4];
  if ([v5 count])
  {
    id v6 = [(_LTEtiquetteSanitizer *)self stringByReplacingMatches:v5 inString:v4];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = _LTOSLogEtiquetteSanitizer();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    locale = self->_locale;
    uint64_t v9 = v7;
    uint64_t v10 = [(NSLocale *)locale localeIdentifier];
    int v12 = 138740483;
    uint64_t v13 = v6;
    __int16 v14 = 2117;
    id v15 = v4;
    __int16 v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_2600DC000, v9, OS_LOG_TYPE_INFO, "sanitizedString '%{sensitive}@' forString '%{sensitive}@' locale: %{public}@", (uint8_t *)&v12, 0x20u);
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_replacementTree, 0);
}

@end