@interface SignpostSupportSubsystemCategoryFilter
- (BOOL)_wantsNotSubsystem;
- (BOOL)matchesSubsystem:(id)a3 category:(id)a4;
- (BOOL)passesSubsystem:(id)a3 category:(id)a4;
- (NSMutableDictionary)subsystemsDict;
- (id)_initWithEntries:(id)a3;
- (id)_predicateEquivalent;
- (id)_subpredicatesForSubsystems;
- (id)debugDescription;
- (unint64_t)_compoundPredicateType;
- (void)_fixupToSupportFramerateCalculation;
- (void)addEntry:(id)a3;
- (void)addFilter:(id)a3;
- (void)addSubsystem:(id)a3 category:(id)a4;
@end

@implementation SignpostSupportSubsystemCategoryFilter

- (BOOL)matchesSubsystem:(id)a3 category:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(SignpostSupportSubsystemCategoryFilter *)self subsystemsDict];
  v9 = [v8 objectForKeyedSubscript:v7];

  if (v9)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];

    if (v9 == v10) {
      char v11 = 1;
    }
    else {
      char v11 = [v9 containsObject:v6];
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (NSMutableDictionary)subsystemsDict
{
  return self->_subsystemsDict;
}

- (void).cxx_destruct
{
}

- (id)_predicateEquivalent
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(SignpostSupportSubsystemCategoryFilter *)self _subpredicatesForSubsystems];
  if ([(SignpostSupportSubsystemCategoryFilter *)self _wantsNotSubsystem])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(MEMORY[0x1E4F28BA0], "notPredicateWithSubpredicate:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = v3;
  }
  char v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28BA0]), "initWithType:subpredicates:", -[SignpostSupportSubsystemCategoryFilter _compoundPredicateType](self, "_compoundPredicateType"), v4);

  return v11;
}

- (id)_subpredicatesForSubsystems
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F1CA48] array];
  v26 = self;
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v3 = [(SignpostSupportSubsystemCategoryFilter *)self subsystemsDict];
  id v4 = [v3 allKeys];

  obuint64_t j = v4;
  uint64_t v28 = [v4 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v28)
  {
    uint64_t v25 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v35 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v7 = [(SignpostSupportSubsystemCategoryFilter *)v26 subsystemsDict];
        uint64_t v8 = [v7 objectForKeyedSubscript:v6];

        v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"subsystem == %@", v6];
        v10 = [MEMORY[0x1E4F1CA98] null];

        if (v8 == v10)
        {
          id v22 = v9;
        }
        else
        {
          v29 = v9;
          id v11 = v8;
          v12 = [MEMORY[0x1E4F1CA48] array];
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v13 = v11;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v39 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v31;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v31 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"category == %@", *(void *)(*((void *)&v30 + 1) + 8 * j)];
                [v12 addObject:v18];
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v39 count:16];
            }
            while (v15);
          }

          v19 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v12];
          v20 = (void *)MEMORY[0x1E4F28BA0];
          v9 = v29;
          v38[0] = v29;
          v38[1] = v19;
          v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
          id v22 = [v20 andPredicateWithSubpredicates:v21];
        }
        [v27 addObject:v22];
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v28);
  }

  return v27;
}

- (void)addSubsystem:(id)a3 category:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[SignpostSupportSubsystemCategoryFilterEntry alloc] initWithSubsystem:v7 category:v6];

  [(SignpostSupportSubsystemCategoryFilter *)self addEntry:v8];
}

- (void)addEntry:(id)a3
{
  id v17 = a3;
  id v4 = [(SignpostSupportSubsystemCategoryFilter *)self subsystemsDict];

  if (!v4)
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
    subsystemsDict = self->_subsystemsDict;
    self->_subsystemsDict = v5;
  }
  id v7 = v17;
  if (v17)
  {
    uint64_t v8 = [v17 category];

    if (v8)
    {
      v9 = [(SignpostSupportSubsystemCategoryFilter *)self subsystemsDict];
      v10 = [v17 subsystem];
      id v11 = [v9 objectForKeyedSubscript:v10];

      id v12 = [MEMORY[0x1E4F1CA98] null];

      if (v11 == v12)
      {
LABEL_11:

        id v7 = v17;
        goto LABEL_12;
      }
      id v11 = v11;
      id v13 = v11;
      if (!v11)
      {
        id v13 = [MEMORY[0x1E4F1CA80] set];
        uint64_t v14 = [(SignpostSupportSubsystemCategoryFilter *)self subsystemsDict];
        uint64_t v15 = [v17 subsystem];
        [v14 setObject:v13 forKeyedSubscript:v15];
      }
      uint64_t v16 = [v17 category];
      [v13 addObject:v16];
    }
    else
    {
      id v11 = [MEMORY[0x1E4F1CA98] null];
      id v13 = [(SignpostSupportSubsystemCategoryFilter *)self subsystemsDict];
      uint64_t v16 = [v17 subsystem];
      [v13 setObject:v11 forKeyedSubscript:v16];
    }

    goto LABEL_11;
  }
LABEL_12:
}

- (BOOL)passesSubsystem:(id)a3 category:(id)a4
{
  return 0;
}

- (BOOL)_wantsNotSubsystem
{
  return 0;
}

- (void)_fixupToSupportFramerateCalculation
{
  if (![(SignpostSupportSubsystemCategoryFilter *)self passesSubsystem:@"com.apple.SkyLight" category:@"performance_instrumentation"])
  {
    [(SignpostSupportSubsystemCategoryFilter *)self _forceInclusionOfSubsystem:@"com.apple.SkyLight" category:@"performance_instrumentation"];
  }
}

- (unint64_t)_compoundPredicateType
{
  return 1;
}

- (id)_initWithEntries:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    v18.receiver = self;
    v18.super_class = (Class)SignpostSupportSubsystemCategoryFilter;
    id v6 = [(SignpostSupportSubsystemCategoryFilter *)&v18 init];
    if (v6)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v15;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            -[SignpostSupportSubsystemCategoryFilter addEntry:](v6, "addEntry:", *(void *)(*((void *)&v14 + 1) + 8 * v11++), (void)v14);
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
        }
        while (v9);
      }
    }
    self = v6;
    id v12 = self;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)addFilter:(id)a3
{
  id v4 = [a3 subsystemsDict];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__SignpostSupportSubsystemCategoryFilter_addFilter___block_invoke;
  v5[3] = &unk_1E5B40098;
  v5[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

void __52__SignpostSupportSubsystemCategoryFilter_addFilter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) subsystemsDict];

  if (!v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(v8 + 8);
    *(void *)(v8 + 8) = v7;
  }
  id v10 = [MEMORY[0x1E4F1CA98] null];

  if (v10 == v5)
  {
    id v12 = [MEMORY[0x1E4F1CA98] null];
    long long v15 = [*(id *)(a1 + 32) subsystemsDict];
    [v15 setObject:v12 forKeyedSubscript:v17];
  }
  else
  {
    uint64_t v11 = [*(id *)(a1 + 32) subsystemsDict];
    id v12 = [v11 objectForKeyedSubscript:v17];

    id v13 = [MEMORY[0x1E4F1CA98] null];

    if (v12 == v13) {
      goto LABEL_10;
    }
    id v12 = v12;
    id v14 = v5;
    long long v15 = v12;
    if (!v12)
    {
      long long v15 = [MEMORY[0x1E4F1CA80] set];
      long long v16 = [*(id *)(a1 + 32) subsystemsDict];
      [v16 setObject:v15 forKeyedSubscript:v17];
    }
    [v15 unionSet:v14];
  }
LABEL_10:
}

- (id)debugDescription
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"%@", v5];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v21 = self;
  obuint64_t j = self->_subsystemsDict;
  uint64_t v22 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v22)
  {
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        [v6 appendString:@"\n\t"];
        [v6 appendString:v8];
        uint64_t v9 = [(SignpostSupportSubsystemCategoryFilter *)v21 subsystemsDict];
        id v10 = [v9 objectForKeyedSubscript:v8];

        uint64_t v11 = [MEMORY[0x1E4F1CA98] null];

        if (v10 == v11)
        {
          [v6 appendString:@" *"];
        }
        else
        {
          id v12 = v10;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v24;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v24 != v15) {
                  objc_enumerationMutation(v12);
                }
                id v17 = [NSString stringWithFormat:@"\n\t\t%@", *(void *)(*((void *)&v23 + 1) + 8 * j)];
                [v6 appendString:v17];
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }
            while (v14);
          }
        }
      }
      uint64_t v22 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v22);
  }

  return v6;
}

@end