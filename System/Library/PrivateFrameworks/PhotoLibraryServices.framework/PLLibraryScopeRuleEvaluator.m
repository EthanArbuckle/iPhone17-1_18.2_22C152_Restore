@interface PLLibraryScopeRuleEvaluator
- (NSArray)rules;
- (PLLibraryScopeRuleEvaluator)initWithRules:(id)a3 andInterpreter:(id)a4;
- (PLLibraryScopeRuleInterpreter)interpreter;
- (id)description;
- (id)evaluateObjects:(id)a3 withResultEnumerationBlock:(id)a4;
- (void)setInterpreter:(id)a3;
- (void)setRules:(id)a3;
@end

@implementation PLLibraryScopeRuleEvaluator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interpreter, 0);
  objc_storeStrong((id *)&self->_rules, 0);
}

- (void)setInterpreter:(id)a3
{
}

- (PLLibraryScopeRuleInterpreter)interpreter
{
  return self->_interpreter;
}

- (void)setRules:(id)a3
{
}

- (NSArray)rules
{
  return self->_rules;
}

- (id)evaluateObjects:(id)a3 withResultEnumerationBlock:(id)a4
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v46 = (void (**)(id, void, uint64_t, void *))a4;
  v40 = v6;
  v52 = (void *)[v6 mutableCopy];
  id v47 = [MEMORY[0x1E4F1CA80] set];
  v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  v49 = self;
  obuint64_t j = [(PLLibraryScopeRuleEvaluator *)self rules];
  uint64_t v43 = [obj countByEnumeratingWithState:&v69 objects:v78 count:16];
  if (v43)
  {
    uint64_t v42 = *(void *)v70;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v70 != v42) {
        objc_enumerationMutation(obj);
      }
      uint64_t v44 = v8;
      v9 = *(void **)(*((void *)&v69 + 1) + 8 * v8);
      context = (void *)MEMORY[0x19F38D3B0]();
      v10 = [v9 allConditions];
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v48 = v10;
      uint64_t v11 = [v48 countByEnumeratingWithState:&v65 objects:v77 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        id v50 = *(id *)v66;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(id *)v66 != v50) {
              objc_enumerationMutation(v48);
            }
            v14 = *(void **)(*((void *)&v65 + 1) + 8 * i);
            v15 = (void *)MEMORY[0x19F38D3B0]();
            v16 = [(PLLibraryScopeRuleEvaluator *)v49 interpreter];
            v17 = [v16 evaluateObjects:v52 forCondition:v14];

            if ([v17 count])
            {
              int v18 = [v14 criteria];
              if (v18 == 2)
              {
                [v47 minusSet:v17];
                [v52 minusSet:v17];
              }
              else if (v18 == 1)
              {
                [v47 unionSet:v17];
              }
              long long v63 = 0u;
              long long v64 = 0u;
              long long v61 = 0u;
              long long v62 = 0u;
              id v19 = v17;
              uint64_t v20 = [v19 countByEnumeratingWithState:&v61 objects:v76 count:16];
              if (v20)
              {
                uint64_t v21 = v20;
                uint64_t v22 = *(void *)v62;
                do
                {
                  for (uint64_t j = 0; j != v21; ++j)
                  {
                    if (*(void *)v62 != v22) {
                      objc_enumerationMutation(v19);
                    }
                    [v7 setObject:v14 forKey:*(void *)(*((void *)&v61 + 1) + 8 * j)];
                  }
                  uint64_t v21 = [v19 countByEnumeratingWithState:&v61 objects:v76 count:16];
                }
                while (v21);
              }
            }
          }
          uint64_t v12 = [v48 countByEnumeratingWithState:&v65 objects:v77 count:16];
        }
        while (v12);
      }

      uint64_t v24 = [v52 count];
      if (!v24) {
        break;
      }
      uint64_t v8 = v44 + 1;
      if (v44 + 1 == v43)
      {
        uint64_t v43 = [obj countByEnumeratingWithState:&v69 objects:v78 count:16];
        if (v43) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  [v52 minusSet:v47];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v51 = [v7 keyEnumerator];
  uint64_t v25 = [v51 countByEnumeratingWithState:&v57 objects:v75 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v58;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v58 != v27) {
          objc_enumerationMutation(v51);
        }
        uint64_t v29 = *(void *)(*((void *)&v57 + 1) + 8 * k);
        v30 = [v7 objectForKey:v29];
        uint64_t v31 = [v30 criteria];
        v74 = v30;
        v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
        v46[2](v46, v29, v31, v32);
      }
      uint64_t v26 = [v51 countByEnumeratingWithState:&v57 objects:v75 count:16];
    }
    while (v26);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v33 = v52;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v53 objects:v73 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v54;
    v37 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t m = 0; m != v35; ++m)
      {
        if (*(void *)v54 != v36) {
          objc_enumerationMutation(v33);
        }
        v46[2](v46, *(void *)(*((void *)&v53 + 1) + 8 * m), 0, v37);
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v53 objects:v73 count:16];
    }
    while (v35);
  }

  return v47;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)PLLibraryScopeRuleEvaluator;
  v4 = [(PLLibraryScopeRuleEvaluator *)&v9 description];
  v5 = [(PLLibraryScopeRuleEvaluator *)self interpreter];
  id v6 = [(PLLibraryScopeRuleEvaluator *)self rules];
  v7 = [v3 stringWithFormat:@"%@ - interpreter: %@ rules: %@", v4, v5, v6];

  return v7;
}

- (PLLibraryScopeRuleEvaluator)initWithRules:(id)a3 andInterpreter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PLLibraryScopeRuleEvaluator;
  uint64_t v8 = [(PLLibraryScopeRuleEvaluator *)&v11 init];
  objc_super v9 = v8;
  if (v8)
  {
    [(PLLibraryScopeRuleEvaluator *)v8 setRules:v6];
    [(PLLibraryScopeRuleEvaluator *)v9 setInterpreter:v7];
  }

  return v9;
}

@end