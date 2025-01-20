@interface ML3AllCompoundPredicate
+ (BOOL)supportsSecureCoding;
+ (id)predicateByFlatteningAllCompoundPredicate:(id)a3;
+ (id)predicateByMergingContainmentPredicatesAllCompoundPredicate:(id)a3;
- (id)compoundOperatorJoiner;
@end

@implementation ML3AllCompoundPredicate

- (id)compoundOperatorJoiner
{
  return @" AND ";
}

+ (id)predicateByMergingContainmentPredicatesAllCompoundPredicate:(id)a3
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  v3 = +[ML3AllCompoundPredicate predicateByFlatteningAllCompoundPredicate:a3];
  v4 = [MEMORY[0x1E4F1CA48] array];
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v75 = [MEMORY[0x1E4F1CA60] dictionary];
  v72 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  v69 = v3;
  v6 = [v3 predicates];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v92 objects:v97 count:16];
  v77 = v4;
  if (!v7)
  {
    char v76 = 0;
    goto LABEL_54;
  }
  uint64_t v8 = v7;
  char v76 = 0;
  uint64_t v9 = *(void *)v93;
  v82 = v6;
  v71 = v5;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v93 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v92 + 1) + 8 * v10);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = [v11 property];
        int v13 = [v12 isEqualToString:@"media_type"];

        if (v13)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_42;
          }
          id v14 = v11;
          int v15 = [v14 comparison];
          v16 = [v14 value];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ((v15 - 3) < 4 || v15 == 1)
            {
              v17 = [v14 property];
              v18 = [v75 objectForKeyedSubscript:v17];

              unint64_t v80 = (unint64_t)v18;
              if (v18) {
                uint64_t v73 = [v18 unsignedLongLongValue];
              }
              else {
                uint64_t v73 = 0x8000000000000000;
              }
              v19 = [v14 property];
              uint64_t v20 = [v72 objectForKeyedSubscript:v19];

              v21 = (void *)v20;
              if (v20) {
                uint64_t v22 = [(id)v20 unsignedLongLongValue];
              }
              else {
                uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
              }
              BOOL v23 = (v80 | v20) != 0;
              if ((v15 - 3) > 1)
              {
                v4 = v77;
                if ((v15 - 5) > 1)
                {
                  if (v15 != 1) {
                    goto LABEL_40;
                  }
                  v78 = v21;
                  uint64_t v70 = v22;
                  uint64_t v33 = [v16 unsignedLongLongValue];
                  if (v73 <= v33) {
                    uint64_t v34 = v33;
                  }
                  else {
                    uint64_t v34 = v73;
                  }
                  v35 = [NSNumber numberWithLongLong:v34];
                  [v14 property];
                  v36 = BOOL v74 = v23;
                  [v75 setObject:v35 forKeyedSubscript:v36];

                  BOOL v23 = v74;
                  v31 = NSNumber;
                  if (v70 >= v33) {
                    uint64_t v32 = v33;
                  }
                  else {
                    uint64_t v32 = v70;
                  }
                }
                else
                {
                  v78 = v21;
                  uint64_t v29 = v22;
                  uint64_t v30 = [v16 unsignedLongLongValue] - (v15 == 5);
                  v31 = NSNumber;
                  if (v29 >= v30) {
                    uint64_t v32 = v30;
                  }
                  else {
                    uint64_t v32 = v29;
                  }
                }
                v27 = [v31 numberWithLongLong:v32];
                v28 = [v14 property];
                [v72 setObject:v27 forKeyedSubscript:v28];
                goto LABEL_39;
              }
              v78 = v21;
              uint64_t v24 = [v16 unsignedLongLongValue];
              if (v15 == 3) {
                uint64_t v25 = v24 + 1;
              }
              else {
                uint64_t v25 = v24;
              }
              if (v73 <= v25) {
                uint64_t v26 = v25;
              }
              else {
                uint64_t v26 = v73;
              }
              v27 = [NSNumber numberWithLongLong:v26];
              v28 = [v14 property];
              [v75 setObject:v27 forKeyedSubscript:v28];
              v4 = v77;
LABEL_39:

              [v4 addObject:v14];
              v21 = v78;
LABEL_40:
              v76 |= v23;

              v5 = v71;
            }
            else
            {
              v4 = v77;
            }

            v6 = v82;
LABEL_42:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_48;
            }
            id v37 = v11;
            v38 = [v37 property];
            v16 = [v5 objectForKeyedSubscript:v38];

            v39 = [v37 values];
            v40 = v39;
            if (v16)
            {
              [v16 intersectSet:v39];
              char v76 = 1;
            }
            else
            {
              v41 = (void *)[v39 mutableCopy];
              v42 = [v37 property];
              [v5 setObject:v41 forKeyedSubscript:v42];

              v4 = v77;
              v6 = v82;
            }

            [v4 addObject:v37];
          }
          else
          {
            v6 = v82;
          }
        }
      }
LABEL_48:
      ++v10;
    }
    while (v8 != v10);
    uint64_t v43 = [v6 countByEnumeratingWithState:&v92 objects:v97 count:16];
    uint64_t v8 = v43;
  }
  while (v43);
LABEL_54:

  v88[0] = MEMORY[0x1E4F143A8];
  v88[1] = 3221225472;
  v88[2] = __87__ML3AllCompoundPredicate_predicateByMergingContainmentPredicatesAllCompoundPredicate___block_invoke;
  v88[3] = &unk_1E5FB4688;
  id v83 = v75;
  id v89 = v83;
  id v79 = v72;
  id v90 = v79;
  id v91 = v5;
  id v81 = v91;
  [v91 enumerateKeysAndObjectsUsingBlock:v88];
  if (v76)
  {
    v44 = [MEMORY[0x1E4F1CA48] array];
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    v45 = [v69 predicates];
    uint64_t v46 = [v45 countByEnumeratingWithState:&v84 objects:v96 count:16];
    if (!v46) {
      goto LABEL_84;
    }
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v85;
    while (1)
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v85 != v48) {
          objc_enumerationMutation(v45);
        }
        v50 = *(void **)(*((void *)&v84 + 1) + 8 * i);
        if (![v4 containsObject:v50]
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          [v44 addObject:v50];
          continue;
        }
        v51 = [v50 property];
        v52 = [v83 objectForKeyedSubscript:v51];
        v53 = v52;
        if (v52) {
          uint64_t v54 = [v52 unsignedLongLongValue];
        }
        else {
          uint64_t v54 = 0x8000000000000000;
        }
        v55 = [v79 objectForKeyedSubscript:v51];
        v56 = v55;
        if (v55) {
          uint64_t v57 = [v55 unsignedLongLongValue];
        }
        else {
          uint64_t v57 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (v54 <= v57)
        {
          if (v57 == v54)
          {
            v59 = v51;
            v60 = v56;
            uint64_t v61 = 1;
          }
          else
          {
            if (v54 != 0x8000000000000000)
            {
              v62 = +[ML3ComparisonPredicate predicateWithProperty:v51 value:v53 comparison:4];
              [v44 addObject:v62];
            }
            if (v57 == 0x7FFFFFFFFFFFFFFFLL) {
              goto LABEL_79;
            }
            v59 = v51;
            v60 = v56;
            uint64_t v61 = 6;
          }
          uint64_t v58 = +[ML3ComparisonPredicate predicateWithProperty:v59 value:v60 comparison:v61];
        }
        else
        {
          uint64_t v58 = +[ML3TruthPredicate falsePredicate];
        }
        v63 = (void *)v58;
        [v44 addObject:v58];

LABEL_79:
        v64 = [v81 objectForKeyedSubscript:v51];
        if ([v64 count])
        {
          v65 = +[ML3ContainmentPredicate predicateWithProperty:v51 values:v64];
          [v44 addObject:v65];
        }
        [v83 removeObjectForKey:v51];
        [v79 removeObjectForKey:v51];
        [v81 removeObjectForKey:v51];

        v4 = v77;
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v84 objects:v96 count:16];
      if (!v47)
      {
LABEL_84:

        id v66 = +[ML3CompoundPredicate predicateMatchingPredicates:v44];

        v67 = v69;
        goto LABEL_86;
      }
    }
  }
  v67 = v69;
  id v66 = v69;
LABEL_86:

  return v66;
}

void __87__ML3AllCompoundPredicate_predicateByMergingContainmentPredicatesAllCompoundPredicate___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1[4] objectForKeyedSubscript:v3];
  uint64_t v5 = [a1[5] objectForKeyedSubscript:v3];
  v6 = (void *)v5;
  if (v4 | v5)
  {
    if (v4)
    {
      uint64_t v7 = [(id)v4 unsignedLongLongValue];
      if (v6)
      {
LABEL_4:
        uint64_t v8 = [v6 unsignedLongLongValue];
LABEL_7:
        uint64_t v9 = [a1[6] objectForKeyedSubscript:v3];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __87__ML3AllCompoundPredicate_predicateByMergingContainmentPredicatesAllCompoundPredicate___block_invoke_2;
        v11[3] = &__block_descriptor_48_e22_B24__0__NSNumber_8_B16l;
        v11[4] = v7;
        v11[5] = v8;
        uint64_t v10 = [v9 objectsPassingTest:v11];
        [a1[6] setObject:v10 forKeyedSubscript:v3];

        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v7 = 0x8000000000000000;
      if (v5) {
        goto LABEL_4;
      }
    }
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_7;
  }
LABEL_8:
}

BOOL __87__ML3AllCompoundPredicate_predicateByMergingContainmentPredicatesAllCompoundPredicate___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 unsignedLongLongValue];
  return v3 >= *(void *)(a1 + 32) && v3 <= *(void *)(a1 + 40);
}

+ (id)predicateByFlatteningAllCompoundPredicate:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = objc_msgSend(v4, "predicates", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = [a1 predicateByFlatteningAllCompoundPredicate:v11];
          int v13 = [v12 predicates];
          [v5 addObjectsFromArray:v13];
        }
        else
        {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  id v14 = +[ML3CompoundPredicate predicateMatchingPredicates:v5];

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end