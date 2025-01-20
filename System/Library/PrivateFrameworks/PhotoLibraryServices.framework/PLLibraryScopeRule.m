@interface PLLibraryScopeRule
+ (id)_dictionaryOfArrayOfSingleQueriesToCriteriaFromRuleQuery:(id)a3 parentQuery:(id)a4;
+ (id)_knownConditionClasses;
+ (id)_rulesFromQuery:(id)a3;
+ (id)dataForLibraryScopeRules:(id)a3;
+ (id)libraryScopeRulesForLibraryScopeRulesData:(id)a3;
+ (id)queryForLibraryScopeRules:(id)a3;
- (NSMutableArray)unknownConditions;
- (PLLibraryScopeConditionDateRange)dateRangeCondition;
- (PLLibraryScopeConditionPerson)personCondition;
- (PLLibraryScopeRule)initWithQuery:(id)a3;
- (id)allConditions;
- (id)backingPredicateInPhotoLibrary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)query;
- (void)addCondition:(id)a3;
- (void)removeConditionOfType:(Class)a3;
@end

@implementation PLLibraryScopeRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownConditions, 0);
  objc_storeStrong((id *)&self->_personCondition, 0);
  objc_storeStrong((id *)&self->_dateRangeCondition, 0);
}

- (NSMutableArray)unknownConditions
{
  return self->_unknownConditions;
}

- (PLLibraryScopeConditionPerson)personCondition
{
  return self->_personCondition;
}

- (PLLibraryScopeConditionDateRange)dateRangeCondition
{
  return self->_dateRangeCondition;
}

- (id)backingPredicateInPhotoLibrary:(id)a3
{
  id v4 = a3;
  v5 = [(PLLibraryScopeRule *)self query];

  if (v5)
  {
    v6 = [(PLLibraryScopeRule *)self query];
    v7 = objc_opt_new();
    v8 = +[PLQueryHandler predicateForQuery:v6 inLibrary:v4 changeDetectionCriteria:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)query
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(PLLibraryScopeRule *)self allConditions];
  v5 = objc_msgSend(v4, "_pl_map:", &__block_literal_global_37);
  [v3 addObjectsFromArray:v5];

  v6 = [(NSMutableArray *)self->_unknownConditions _pl_map:&__block_literal_global_40];
  [v3 addObjectsFromArray:v6];

  if ((unint64_t)[v3 count] < 2)
  {
    if ([v3 count] == 1)
    {
      v12 = (void *)MEMORY[0x1E4F8B9A8];
      v13 = [v3 firstObject];
      id v14 = objc_alloc_init(MEMORY[0x1E4F8B9A0]);
      v11 = [v12 orCombineFirstQuery:v13 secondQuery:v14];
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v7 = [v3 firstObject];
    if ((unint64_t)[v3 count] < 2)
    {
      v11 = v7;
    }
    else
    {
      unint64_t v8 = 1;
      do
      {
        v9 = (void *)MEMORY[0x1E4F8B9A8];
        v10 = [v3 objectAtIndexedSubscript:v8];
        v11 = [v9 orCombineFirstQuery:v7 secondQuery:v10];

        ++v8;
        v7 = v11;
      }
      while ([v3 count] > v8);
    }
  }

  return v11;
}

uint64_t __27__PLLibraryScopeRule_query__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 query];
}

uint64_t __27__PLLibraryScopeRule_query__block_invoke(uint64_t a1, void *a2)
{
  return [a2 query];
}

- (id)description
{
  id v3 = [(PLLibraryScopeRule *)self allConditions];
  id v4 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PLLibraryScopeRule;
  v5 = [(PLLibraryScopeRule *)&v8 description];
  v6 = [v4 stringWithFormat:@"%@ - Containing %lu conditions", v5, objc_msgSend(v3, "count")];

  return v6;
}

- (void)removeConditionOfType:(Class)a3
{
  if ((Class)objc_opt_class() == a3)
  {
    dateRangeCondition = self->_dateRangeCondition;
    self->_dateRangeCondition = 0;
  }
  else if ((Class)objc_opt_class() == a3)
  {
    dateRangeCondition = self->_personCondition;
    self->_personCondition = 0;
  }
  else
  {
    if ((Class)objc_opt_class() != a3) {
      return;
    }
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    dateRangeCondition = self->_unknownConditions;
    self->_unknownConditions = v6;
  }
}

- (void)addCondition:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    p_dateRangeCondition = (id *)&self->_dateRangeCondition;
LABEL_5:
    objc_storeStrong(p_dateRangeCondition, a3);
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    p_dateRangeCondition = (id *)&self->_personCondition;
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(NSMutableArray *)self->_unknownConditions addObject:v6];
  }
LABEL_6:
}

- (id)allConditions
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(PLLibraryScopeRule *)self dateRangeCondition];
  objc_msgSend(v3, "_pl_addNonNilObject:", v4);

  v5 = [(PLLibraryScopeRule *)self personCondition];
  objc_msgSend(v3, "_pl_addNonNilObject:", v5);

  id v6 = (void *)[v3 copy];
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(PLLibraryScopeRule *)self query];
  id v6 = (void *)[v4 initWithQuery:v5];

  return v6;
}

- (PLLibraryScopeRule)initWithQuery:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PLLibraryScopeRule *)self init];
  if (v5)
  {
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unknownConditions = v5->_unknownConditions;
    v5->_unknownConditions = v6;

    id v22 = v4;
    [(id)objc_opt_class() _dictionaryOfArrayOfSingleQueriesToCriteriaFromRuleQuery:v4 parentQuery:0];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v24 = long long v33 = 0u;
    obuint64_t j = [v24 allKeys];
    uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v25 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v12 = [v11 firstObject];
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          v13 = [(id)objc_opt_class() _knownConditionClasses];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v27;
            while (2)
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v27 != v16) {
                  objc_enumerationMutation(v13);
                }
                v18 = *(void **)(*((void *)&v26 + 1) + 8 * j);
                if ([v12 hasKey]
                  && objc_msgSend(v18, "supportsQueryKey:", objc_msgSend(v12, "key")))
                {
                  v19 = [v24 objectForKeyedSubscript:v11];
                  v20 = objc_msgSend(v18, "conditionWithSingleQueries:criteria:", v11, objc_msgSend(v19, "unsignedIntegerValue"));
                  [(PLLibraryScopeRule *)v5 addCondition:v20];

                  goto LABEL_18;
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }
LABEL_18:
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v9);
    }

    id v4 = v22;
  }

  return v5;
}

+ (id)_rulesFromQuery:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v4 hasFirst]
    && [v4 hasConjunction]
    && [v4 conjunction] == 1)
  {
    id v6 = [v4 first];
    v7 = [a1 _rulesFromQuery:v6];
    [v5 addObjectsFromArray:v7];
  }
  if ([v4 hasSecond]
    && [v4 hasConjunction]
    && [v4 conjunction] == 1)
  {
    uint64_t v8 = [v4 second];
    uint64_t v9 = [a1 _rulesFromQuery:v8];
    [v5 addObjectsFromArray:v9];
  }
  if ([v4 hasConjunction] && !objc_msgSend(v4, "conjunction"))
  {
    v10 = [[PLLibraryScopeRule alloc] initWithQuery:v4];
    [v5 addObject:v10];
  }
  return v5;
}

+ (id)dataForLibraryScopeRules:(id)a3
{
  id v3 = [a1 queryForLibraryScopeRules:a3];
  id v4 = +[PLQueryHandler dataFromQuery:v3];

  return v4;
}

+ (id)queryForLibraryScopeRules:(id)a3
{
  id v3 = a3;
  id v4 = [v3 firstObject];
  id v5 = [v4 query];

  if ((unint64_t)[v3 count] < 2)
  {
    v10 = v5;
  }
  else
  {
    unint64_t v6 = 1;
    do
    {
      v7 = (void *)MEMORY[0x1E4F8B9A8];
      uint64_t v8 = [v3 objectAtIndexedSubscript:v6];
      uint64_t v9 = [v8 query];
      v10 = [v7 andCombineFirstQuery:v5 secondQuery:v9];

      ++v6;
      id v5 = v10;
    }
    while ([v3 count] > v6);
  }

  return v10;
}

+ (id)libraryScopeRulesForLibraryScopeRulesData:(id)a3
{
  id v4 = +[PLQueryHandler constructQueryFromData:a3];
  if (v4)
  {
    id v5 = [a1 _rulesFromQuery:v4];
  }
  else
  {
    unint64_t v6 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Empty query returned from library scope rules data", v8, 2u);
    }

    id v5 = 0;
  }

  return v5;
}

+ (id)_dictionaryOfArrayOfSingleQueriesToCriteriaFromRuleQuery:(id)a3 parentQuery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  if ([v6 hasFirst]
    && [v6 hasConjunction]
    && (![v6 conjunction] || objc_msgSend(v6, "conjunction") == 2))
  {
    uint64_t v9 = [v6 first];
    v10 = [a1 _dictionaryOfArrayOfSingleQueriesToCriteriaFromRuleQuery:v9 parentQuery:v6];
    [v8 addEntriesFromDictionary:v10];
  }
  if ([v6 hasSecond]
    && [v6 hasConjunction]
    && (![v6 conjunction] || objc_msgSend(v6, "conjunction") == 2))
  {
    v11 = [v6 second];
    v12 = [a1 _dictionaryOfArrayOfSingleQueriesToCriteriaFromRuleQuery:v11 parentQuery:v6];
    [v8 addEntriesFromDictionary:v12];
  }
  v13 = [v6 singleQueries];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    unsigned __int8 v15 = 1;
    if ([v7 hasConjunction])
    {
      if ([v7 conjunction] == 2) {
        unsigned __int8 v15 = 2;
      }
      else {
        unsigned __int8 v15 = 1;
      }
    }
    uint64_t v16 = [NSNumber numberWithUnsignedChar:v15];
    v17 = [v6 singleQueries];
    [v8 setObject:v16 forKey:v17];
  }
  return v8;
}

+ (id)_knownConditionClasses
{
  if (_knownConditionClasses_onceToken != -1) {
    dispatch_once(&_knownConditionClasses_onceToken, &__block_literal_global_38259);
  }
  v2 = (void *)_knownConditionClasses_knownClasses;
  return v2;
}

void __44__PLLibraryScopeRule__knownConditionClasses__block_invoke()
{
  v2[3] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:3];
  v1 = (void *)_knownConditionClasses_knownClasses;
  _knownConditionClasses_knownClasses = v0;
}

@end