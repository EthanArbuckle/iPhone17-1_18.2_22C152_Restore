@interface SDPommesSynonyms
- (BOOL)_loadSynonymsFromFile:(id)a3 isFirstPass:(BOOL)a4 isDate:(BOOL)a5 error:(id *)a6;
- (SDPommesSynonyms)init;
- (id)_cleanWord:(id)a3 unacceptableCharSet:(id)a4;
- (id)generateDateSynonymsFromToken:(id)a3 previousToken:(id)a4 isOrdinalToken:(BOOL *)a5;
- (id)getDateSynonymsForWord:(id)a3;
- (id)getFirstPassSynonymsForWord:(id)a3;
- (id)getSecondPassSynonymsForWord:(id)a3;
- (void)loadDateSynonymDictionary;
- (void)loadFirstPassSynonymDictionary;
- (void)loadSecondPassSynonymDictionary;
@end

@implementation SDPommesSynonyms

- (SDPommesSynonyms)init
{
  v5.receiver = self;
  v5.super_class = (Class)SDPommesSynonyms;
  v2 = [(SDPommesSynonyms *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(SDPommesSynonyms *)v2 loadFirstPassSynonymDictionary];
    [(SDPommesSynonyms *)v3 loadSecondPassSynonymDictionary];
    [(SDPommesSynonyms *)v3 loadDateSynonymDictionary];
  }
  return v3;
}

- (id)getFirstPassSynonymsForWord:(id)a3
{
  return [(NSDictionary *)self->firstPassSynonymDictionary objectForKeyedSubscript:a3];
}

- (id)getSecondPassSynonymsForWord:(id)a3
{
  return [(NSDictionary *)self->secondPassSynonymDictionary objectForKeyedSubscript:a3];
}

- (id)getDateSynonymsForWord:(id)a3
{
  return [(NSDictionary *)self->dateSynonymDictionary objectForKeyedSubscript:a3];
}

- (id)_cleanWord:(id)a3 unacceptableCharSet:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length] && objc_msgSend(v5, "rangeOfCharacterFromSet:", v6) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = [v5 localizedLowercaseString];
    v8 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    v9 = [v7 stringByTrimmingCharactersInSet:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_loadSynonymsFromFile:(id)a3 isFirstPass:(BOOL)a4 isDate:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v10 = a3;
  v11 = (NSDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v52 = 4;
  v12 = (void *)[[NSString alloc] initWithContentsOfFile:v10 usedEncoding:&v52 error:a6];
  v13 = v12;
  if (*a6)
  {
    v47 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      -[SDPommesSynonyms _loadSynonymsFromFile:isFirstPass:isDate:error:]();
    }
LABEL_4:
    BOOL v14 = 0;
    goto LABEL_35;
  }
  if (![v12 length])
  {
    v47 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      -[SDPommesSynonyms _loadSynonymsFromFile:isFirstPass:isDate:error:]();
    }
    goto LABEL_4;
  }
  BOOL v39 = v7;
  BOOL v40 = v8;
  v47 = uint64_t v42 = (uint64_t)v10;
  v15 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@","];
  v16 = [MEMORY[0x263F08708] newlineCharacterSet];
  v41 = v13;
  v17 = [v13 componentsSeparatedByCharactersInSet:v16];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v17;
  uint64_t v18 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v49;
    v43 = v15;
    v44 = v11;
    do
    {
      uint64_t v21 = 0;
      uint64_t v45 = v19;
      do
      {
        if (*(void *)v49 != v20) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v48 + 1) + 8 * v21);
        v23 = (void *)MEMORY[0x223C480D0]();
        v24 = [v22 componentsSeparatedByCharactersInSet:v15];
        if ((unint64_t)[v24 count] >= 2)
        {
          v25 = [v24 objectAtIndexedSubscript:0];
          v26 = [(SDPommesSynonyms *)self _cleanWord:v25 unacceptableCharSet:v47];

          if ([v26 length])
          {
            v27 = [(NSDictionary *)v11 objectForKey:v26];
            uint64_t v28 = [v27 count];

            if (!v28)
            {
              v29 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v24, "count") - 1);
              if ((unint64_t)[v24 count] >= 2)
              {
                unint64_t v30 = 1;
                do
                {
                  v31 = [v24 objectAtIndexedSubscript:v30];
                  v32 = [(SDPommesSynonyms *)self _cleanWord:v31 unacceptableCharSet:v47];

                  if ([v32 length]) {
                    [v29 addObject:v32];
                  }

                  ++v30;
                }
                while (v30 < [v24 count]);
              }
              v11 = v44;
              if ([v29 count]) {
                [(NSDictionary *)v44 setValue:v29 forKey:v26];
              }

              v15 = v43;
            }
          }

          uint64_t v19 = v45;
        }

        ++v21;
      }
      while (v21 != v19);
      uint64_t v19 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v19);
  }

  if (v40)
  {
    p_firstPassSynonymDictionary = &self->firstPassSynonymDictionary;
    v34 = v11;
  }
  else
  {
    v35 = v11;
    if (v39) {
      p_firstPassSynonymDictionary = &self->dateSynonymDictionary;
    }
    else {
      p_firstPassSynonymDictionary = &self->secondPassSynonymDictionary;
    }
  }
  v13 = v41;
  id v10 = (id)v42;
  v36 = *p_firstPassSynonymDictionary;
  *p_firstPassSynonymDictionary = v11;

  v37 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
    -[SDPommesSynonyms _loadSynonymsFromFile:isFirstPass:isDate:error:](v11, v42, v37);
  }

  BOOL v14 = 1;
LABEL_35:

  return v14;
}

- (void)loadFirstPassSynonymDictionary
{
}

- (void)loadSecondPassSynonymDictionary
{
}

- (void)loadDateSynonymDictionary
{
}

- (id)generateDateSynonymsFromToken:(id)a3 previousToken:(id)a4 isOrdinalToken:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [MEMORY[0x263EFF980] array];
  if (generateDateSynonymsFromToken_previousToken_isOrdinalToken__onceToken != -1) {
    dispatch_once(&generateDateSynonymsFromToken_previousToken_isOrdinalToken__onceToken, &__block_literal_global_4);
  }
  v11 = [(SDPommesSynonyms *)self getDateSynonymsForWord:v8];
  if (v11) {
    [v10 addObjectsFromArray:v11];
  }
  int v12 = [(id)generateDateSynonymsFromToken_previousToken_isOrdinalToken__ordinalIndicators containsObject:v8];
  if (v9 && v12)
  {
    *a5 = 1;
    [v10 addObject:v9];
  }

  return v10;
}

uint64_t __79__SDPommesSynonyms_generateDateSynonymsFromToken_previousToken_isOrdinalToken___block_invoke()
{
  generateDateSynonymsFromToken_previousToken_isOrdinalToken__ordinalIndicators = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"st", @"nd", @"rd", @"th", 0);
  return MEMORY[0x270F9A758]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->dateSynonymDictionary, 0);
  objc_storeStrong((id *)&self->secondPassSynonymDictionary, 0);
  objc_storeStrong((id *)&self->firstPassSynonymDictionary, 0);
}

- (void)_loadSynonymsFromFile:isFirstPass:isDate:error:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21F1CE000, v0, v1, "Empty synonym file: %@.", v2, v3, v4, v5, v6);
}

- (void)_loadSynonymsFromFile:(NSObject *)a3 isFirstPass:isDate:error:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [a1 count];
  OUTLINED_FUNCTION_1_1();
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_21F1CE000, a3, OS_LOG_TYPE_ERROR, "Loaded %lu synonyms from file: %@.", v5, 0x16u);
}

- (void)_loadSynonymsFromFile:isFirstPass:isDate:error:.cold.3()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_21F1CE000, v1, OS_LOG_TYPE_ERROR, "Failed to read synonym file: %@ with error: %@.", v2, 0x16u);
}

@end