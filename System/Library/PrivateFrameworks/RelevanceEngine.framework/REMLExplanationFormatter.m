@interface REMLExplanationFormatter
- (REMLExplanationFormatter)init;
- (id)descriptionFromExplanations:(id)a3;
- (unint64_t)style;
- (void)setStyle:(unint64_t)a3;
@end

@implementation REMLExplanationFormatter

- (REMLExplanationFormatter)init
{
  v4.receiver = self;
  v4.super_class = (Class)REMLExplanationFormatter;
  v2 = [(REMLExplanationFormatter *)&v4 init];
  if (v2) {
    v2->_style = REMLExplanationsEnabled();
  }
  return v2;
}

- (id)descriptionFromExplanations:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![v4 count])
  {
    v31 = &stru_26CFA57D0;
    goto LABEL_38;
  }
  v5 = [MEMORY[0x263EFF980] array];
  [MEMORY[0x263EFF9C0] set];
  v35 = id v33 = v4;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (!v7) {
    goto LABEL_19;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v41;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v41 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v40 + 1) + 8 * v10);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = v35;
LABEL_14:
        objc_msgSend(v12, "addObject:", v11, v33);
        goto LABEL_15;
      }
      if (![v5 count])
      {
LABEL_13:
        v12 = v5;
        goto LABEL_14;
      }
      uint64_t v13 = 0;
      while (1)
      {
        v14 = objc_msgSend(v5, "objectAtIndexedSubscript:", v13, v33);
        if ([v11 canCombineExplanationWithExplanation:v14]) {
          break;
        }

        if (++v13 >= (unint64_t)[v5 count]) {
          goto LABEL_13;
        }
      }
      v15 = [v11 explanationByCombiningWithExplanation:v14];

      [v5 setObject:v15 atIndexedSubscript:v13];
LABEL_15:
      ++v10;
    }
    while (v10 != v8);
    uint64_t v16 = [v6 countByEnumeratingWithState:&v40 objects:v45 count:16];
    uint64_t v8 = v16;
  }
  while (v16);
LABEL_19:

  v17 = +[_REMLFeatureExplanation combinedExplanationsFromExplanations:v35];
  v18 = [v17 allObjects];
  [v5 addObjectsFromArray:v18];

  if ([v5 count])
  {
    unint64_t v19 = 0;
    do
    {
      v20 = objc_msgSend(v5, "objectAtIndexedSubscript:", v19, v33);
      if (([v20 shouldProvideExplanation] & 1) == 0) {
        [v5 removeObjectAtIndex:v19--];
      }

      ++v19;
    }
    while (v19 < [v5 count]);
  }
  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_36, v33);
  v21 = [MEMORY[0x263F089D8] string];
  unint64_t v22 = [v5 count];
  unint64_t v23 = 5;
  if (!self->_style) {
    unint64_t v23 = 1;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  if (v22 >= v23) {
    unint64_t v24 = v23;
  }
  else {
    unint64_t v24 = v22;
  }
  long long v38 = 0uLL;
  long long v39 = 0uLL;
  v25 = objc_msgSend(v5, "subarrayWithRange:", 0, v24);
  uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v37 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = [*(id *)(*((void *)&v36 + 1) + 8 * i) explanationWithStyle:self->_style];
        [v21 appendString:v30];

        [v21 appendString:@"\n"];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v27);
  }

  v31 = (__CFString *)[v21 copy];
  id v4 = v34;
LABEL_38:

  return v31;
}

uint64_t __56__REMLExplanationFormatter_descriptionFromExplanations___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "rankExplanationToExplanation:");
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

@end