@interface NSCompoundPredicate(PPSSQLitePredicate)
- (id)pps_sqlPredicateForSelect;
@end

@implementation NSCompoundPredicate(PPSSQLitePredicate)

- (id)pps_sqlPredicateForSelect
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = [a1 subpredicates];
  v3 = (void *)[v2 count];

  if (v3)
  {
    uint64_t v4 = [a1 compoundPredicateType];
    if (!v4)
    {
      v14 = [a1 subpredicates];
      v15 = [v14 objectAtIndexedSubscript:0];
      v6 = objc_msgSend(v15, "pps_sqlPredicateForSelect");

      if (!v6)
      {
        v3 = 0;
        goto LABEL_19;
      }
      uint64_t v13 = +[PPSSQLiteCompoundPredicate negatedPredicate:v6];
LABEL_18:
      v3 = (void *)v13;
LABEL_19:

      goto LABEL_21;
    }
    uint64_t v5 = v4;
    v6 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v7 = objc_msgSend(a1, "subpredicates", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "pps_sqlPredicateForSelect");
          if (v12) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    if (v5 == 2)
    {
      uint64_t v13 = +[PPSSQLiteCompoundPredicate predicateMatchingAnyPredicates:v6];
      goto LABEL_18;
    }
    if (v5 == 1)
    {
      uint64_t v13 = +[PPSSQLiteCompoundPredicate predicateMatchingAllPredicates:v6];
      goto LABEL_18;
    }

    v3 = 0;
  }
LABEL_21:
  return v3;
}

@end