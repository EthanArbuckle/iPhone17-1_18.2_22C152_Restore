@interface PPSPredicateUtilities
+ (id)constantValueForLeftExpression:(id)a3 inPredicate:(id)a4;
+ (id)constantValueForLeftKeyPath:(id)a3 inPredicate:(id)a4;
+ (id)keyPathsAndValuesForPredicate:(id)a3;
+ (id)predicateByRemovingSubpredicateWithLeftExpression:(id)a3 fromPredicate:(id)a4;
+ (id)predicateByRemovingSubpredicateWithLeftKeyPath:(id)a3 fromPredicate:(id)a4;
+ (id)predicateByReplacingNilWithEmptyString:(id)a3;
+ (id)predicateForStartTimestamp:(double)a3 endTimestamp:(double)a4 withKeyPath:(id)a5;
+ (id)subpredicateForPredicate:(id)a3 withLeftExpression:(id)a4;
+ (id)subpredicateForPredicate:(id)a3 withLeftKeyPath:(id)a4;
+ (id)subpredicatesForPredicate:(id)a3 withLeftExpression:(id)a4;
+ (id)subpredicatesForPredicate:(id)a3 withLeftKeyPath:(id)a4;
@end

@implementation PPSPredicateUtilities

+ (id)constantValueForLeftExpression:(id)a3 inPredicate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(id)objc_opt_class() subpredicateForPredicate:v5 withLeftExpression:v6];

  if (v7
    && ([v7 rightExpression],
        v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 expressionType],
        v8,
        !v9))
  {
    v11 = [v7 rightExpression];
    v10 = [v11 constantValue];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)constantValueForLeftKeyPath:(id)a3 inPredicate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_class();
  v8 = [MEMORY[0x263F087F0] expressionForKeyPath:v6];

  uint64_t v9 = [v7 constantValueForLeftExpression:v8 inPredicate:v5];

  return v9;
}

+ (id)keyPathsAndValuesForPredicate:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = [v4 leftExpression];
    if ([v5 expressionType] == 3)
    {
      id v6 = [v5 keyPath];
      v7 = [(id)objc_opt_class() constantValueForLeftKeyPath:v6 inPredicate:v4];
      v8 = [NSDictionary dictionaryWithObject:v7 forKey:v6];
      uint64_t v9 = (void *)[v8 mutableCopy];
    }
    else
    {
      uint64_t v9 = 0;
    }
LABEL_16:

    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    uint64_t v9 = objc_opt_new();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = objc_msgSend(v4, "subpredicates", 0);
    uint64_t v10 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v5);
          }
          v14 = [(id)objc_opt_class() keyPathsAndValuesForPredicate:*(void *)(*((void *)&v16 + 1) + 8 * i)];
          if (v14) {
            [v9 addEntriesFromDictionary:v14];
          }
        }
        uint64_t v11 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
    goto LABEL_16;
  }
  uint64_t v9 = 0;
LABEL_18:

  return v9;
}

+ (id)predicateByReplacingNilWithEmptyString:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (!v3)
  {
    id v8 = 0;
    goto LABEL_28;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v10 = v3;
    id v8 = v10;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_28;
    }
    uint64_t v11 = [v10 compoundPredicateType];
    uint64_t v12 = [MEMORY[0x263EFF980] array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v13 = objc_msgSend(v8, "subpredicates", 0);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = [(id)objc_opt_class() predicateByReplacingNilWithEmptyString:*(void *)(*((void *)&v25 + 1) + 8 * i)];
          [v12 addObject:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v15);
    }

    if (v11)
    {
      if (v11 == 2)
      {
        uint64_t v19 = [MEMORY[0x263F08730] orPredicateWithSubpredicates:v12];
      }
      else
      {
        if (v11 != 1)
        {
          uint64_t v23 = 0;
          goto LABEL_27;
        }
        uint64_t v19 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v12];
      }
      uint64_t v23 = v19;
    }
    else
    {
      uint64_t v21 = (void *)MEMORY[0x263F08730];
      v22 = [v12 objectAtIndexedSubscript:0];
      uint64_t v23 = [v21 notPredicateWithSubpredicate:v22];
    }
LABEL_27:

    id v8 = (id)v23;
    goto LABEL_28;
  }
  id v4 = v3;
  id v5 = [v4 leftExpression];
  if ([v5 expressionType] == 3)
  {
    id v6 = [v5 keyPath];
    v7 = [(id)objc_opt_class() constantValueForLeftKeyPath:v6 inPredicate:v4];
    if (v7)
    {
      id v8 = v4;
    }
    else
    {
      v20 = [MEMORY[0x263F087F0] expressionForConstantValue:&stru_270709350];
      id v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F08720]), "initWithLeftExpression:rightExpression:modifier:type:options:", v5, v20, objc_msgSend(v4, "comparisonPredicateModifier"), objc_msgSend(v4, "predicateOperatorType"), objc_msgSend(v4, "options"));
    }
  }
  else
  {
    id v8 = 0;
  }

LABEL_28:
  return v8;
}

+ (id)predicateByRemovingSubpredicateWithLeftExpression:(id)a3 fromPredicate:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    id v8 = [v7 leftExpression];
    if ([v8 isEqual:v5]) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v7;
    }
    id v10 = v9;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v6;
      uint64_t v12 = [MEMORY[0x263EFF980] array];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      v13 = objc_msgSend(v11, "subpredicates", 0);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v21 != v16) {
              objc_enumerationMutation(v13);
            }
            long long v18 = [(id)objc_opt_class() predicateByRemovingSubpredicateWithLeftExpression:v5 fromPredicate:*(void *)(*((void *)&v20 + 1) + 8 * i)];
            if (v18) {
              [v12 addObject:v18];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v15);
      }

      if ([v12 count]) {
        id v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F08730]), "initWithType:subpredicates:", objc_msgSend(v11, "compoundPredicateType"), v12);
      }
      else {
        id v10 = 0;
      }
    }
    else
    {
      id v10 = 0;
    }
  }

  return v10;
}

+ (id)predicateByRemovingSubpredicateWithLeftKeyPath:(id)a3 fromPredicate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_class();
  id v8 = [MEMORY[0x263F087F0] expressionForKeyPath:v6];

  uint64_t v9 = [v7 predicateByRemovingSubpredicateWithLeftExpression:v8 fromPredicate:v5];

  return v9;
}

+ (id)predicateForStartTimestamp:(double)a3 endTimestamp:(double)a4 withKeyPath:(id)a5
{
  v15[2] = *MEMORY[0x263EF8340];
  id v7 = (void *)MEMORY[0x263F08A98];
  id v8 = a5;
  uint64_t v9 = objc_msgSend(v7, "predicateWithFormat:", @"(%K >= %lf)", v8, *(void *)&a3);
  id v10 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"(%K <= %lf)", v8, *(void *)&a4);

  id v11 = (void *)MEMORY[0x263F08730];
  v15[0] = v9;
  v15[1] = v10;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  v13 = [v11 andPredicateWithSubpredicates:v12];

  return v13;
}

+ (id)subpredicateForPredicate:(id)a3 withLeftExpression:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() subpredicatesForPredicate:v6 withLeftExpression:v5];

  if ([v7 count])
  {
    id v8 = [v7 objectAtIndex:0];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)subpredicateForPredicate:(id)a3 withLeftKeyPath:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_class();
  id v8 = [MEMORY[0x263F087F0] expressionForKeyPath:v5];

  uint64_t v9 = [v7 subpredicateForPredicate:v6 withLeftExpression:v8];

  return v9;
}

+ (id)subpredicatesForPredicate:(id)a3 withLeftExpression:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    id v8 = [v7 leftExpression];
    int v9 = [v8 isEqual:v6];

    if (v9)
    {
      id v10 = [MEMORY[0x263EFF8C0] arrayWithObject:v7];
      id v11 = (void *)[v10 mutableCopy];
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v5;
      id v11 = [MEMORY[0x263EFF980] array];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      v13 = objc_msgSend(v12, "subpredicates", 0);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v21 != v16) {
              objc_enumerationMutation(v13);
            }
            long long v18 = [(id)objc_opt_class() subpredicatesForPredicate:*(void *)(*((void *)&v20 + 1) + 8 * i) withLeftExpression:v6];
            [v11 addObjectsFromArray:v18];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v15);
      }
    }
    else
    {
      id v11 = 0;
    }
  }

  return v11;
}

+ (id)subpredicatesForPredicate:(id)a3 withLeftKeyPath:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_class();
  id v8 = [MEMORY[0x263F087F0] expressionForKeyPath:v5];

  int v9 = [v7 subpredicatesForPredicate:v6 withLeftExpression:v8];

  return v9;
}

@end