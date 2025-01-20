@interface NSCompoundPredicate
- (id)passd_sqlPredicateForSelect;
@end

@implementation NSCompoundPredicate

- (id)passd_sqlPredicateForSelect
{
  v3 = [(NSCompoundPredicate *)self subpredicates];
  id v4 = [v3 count];

  if (v4)
  {
    NSCompoundPredicateType v5 = [(NSCompoundPredicate *)self compoundPredicateType];
    if (v5 == NSNotPredicateType)
    {
      v15 = [(NSCompoundPredicate *)self subpredicates];
      v16 = [v15 objectAtIndexedSubscript:0];
      objc_msgSend(v16, "passd_sqlPredicateForSelect");
      id v7 = (id)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        id v4 = 0;
        goto LABEL_19;
      }
      uint64_t v14 = +[SQLiteCompoundPredicate negatedPredicate:v7];
LABEL_18:
      id v4 = (id)v14;
LABEL_19:

      goto LABEL_21;
    }
    NSCompoundPredicateType v6 = v5;
    id v7 = objc_alloc_init((Class)NSMutableArray);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v8 = [(NSCompoundPredicate *)self subpredicates];
    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "passd_sqlPredicateForSelect");
          if (v13) {
            [v7 addObject:v13];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    if (v6 == NSOrPredicateType)
    {
      uint64_t v14 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v7];
      goto LABEL_18;
    }
    if (v6 == NSAndPredicateType)
    {
      uint64_t v14 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v7];
      goto LABEL_18;
    }

    id v4 = 0;
  }
LABEL_21:
  return v4;
}

@end