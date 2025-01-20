@interface PGTitleSpecPublicEventArgument
+ (id)_cleanUpEventName:(id)a3;
+ (id)argumentWithPublicEventType:(unint64_t)a3;
+ (id)argumentWithPublicEventType:(unint64_t)a3 shouldUseLongPublicEventTitle:(BOOL)a4;
- (BOOL)shouldUseLongPublicEventTitle;
- (PGTitleSpecPublicEventArgument)initWithPublicEventType:(unint64_t)a3;
- (PGTitleSpecPublicEventArgument)initWithPublicEventType:(unint64_t)a3 shouldUseLongPublicEventTitle:(BOOL)a4;
- (id)_commonPublicEventNodeForMomentNodes:(id)a3;
- (id)_generateTitleWithBusinessNameForPublicEventNode:(id)a3;
- (id)_generateTitleWithCategoryNameForPublicEventNode:(id)a3;
- (id)_generateTitleWithEventNameForPublicEventNode:(id)a3;
- (id)_generateTitleWithPerformerNamesForPublicEventNode:(id)a3;
- (id)_resolvedStringWithMomentNodes:(id)a3 argumentEvaluationContext:(id)a4;
- (id)_resolvedStringWithMomentNodes:(id)a3 features:(id)a4 argumentEvaluationContext:(id)a5;
- (id)_resolvedStringWithPublicEventNode:(id)a3 inMomentNodes:(id)a4;
- (unint64_t)type;
@end

@implementation PGTitleSpecPublicEventArgument

- (BOOL)shouldUseLongPublicEventTitle
{
  return self->_shouldUseLongPublicEventTitle;
}

- (unint64_t)type
{
  return self->_type;
}

- (id)_generateTitleWithCategoryNameForPublicEventNode:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 preciseLocalizedCategoryNames];
  if ([v4 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      v8 = 0;
      uint64_t v9 = *(void *)v19;
      unint64_t v10 = -1;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v5);
          }
          v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          unint64_t v13 = objc_msgSend(v12, "length", (void)v18);
          if (v13 - 1 <= 0x19 && v13 < v10)
          {
            unint64_t v15 = v13;
            id v16 = v12;

            v8 = v16;
            unint64_t v10 = v15;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_generateTitleWithPerformerNamesForPublicEventNode:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __85__PGTitleSpecPublicEventArgument__generateTitleWithPerformerNamesForPublicEventNode___block_invoke;
  v18[3] = &unk_1E68E5DD0;
  v18[4] = &v19;
  [v3 enumeratePublicEventCategoryNodesUsingBlock:v18];
  if (!*((unsigned char *)v20 + 24))
  {
    uint64_t v9 = 0;
    goto LABEL_15;
  }
  v4 = [v3 performers];
  if ([v4 count])
  {
    id v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:0 ascending:1 selector:sel_localizedCompare_];
    v23[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    uint64_t v7 = [v4 sortedArrayUsingDescriptors:v6];

    uint64_t v8 = [v7 count];
    if (v8 == 3)
    {
      unint64_t v10 = [v7 objectAtIndexedSubscript:0];
      v11 = [v7 objectAtIndexedSubscript:1];
      v12 = [v7 objectAtIndexedSubscript:2];
      unint64_t v13 = NSString;
      v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      unint64_t v15 = [v14 localizedStringForKey:@"PGMemoryPublicEventTitleFormatWithPeformer %@ secondPerformer %@ thirdPerformer %@" value:@"PGMemoryPublicEventTitleFormatWithPeformer %@ secondPerformer %@ thirdPerformer %@" table:@"Localizable"];
      uint64_t v9 = objc_msgSend(v13, "localizedStringWithFormat:", v15, v10, v11, v12);
    }
    else
    {
      if (v8 != 2)
      {
        if (v8 == 1)
        {
          uint64_t v9 = [v7 objectAtIndexedSubscript:0];
        }
        else
        {
          uint64_t v9 = 0;
        }
        goto LABEL_13;
      }
      unint64_t v10 = [v7 objectAtIndexedSubscript:0];
      v11 = [v7 objectAtIndexedSubscript:1];
      id v16 = NSString;
      v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v14 = [v12 localizedStringForKey:@"PGMemoryPublicEventTitleFormatWithPeformer %@ otherPerformer %@" value:@"PGMemoryPublicEventTitleFormatWithPeformer %@ otherPerformer %@" table:@"Localizable"];
      uint64_t v9 = objc_msgSend(v16, "localizedStringWithFormat:", v14, v10, v11);
    }

LABEL_13:
    goto LABEL_14;
  }
  uint64_t v9 = 0;
LABEL_14:

LABEL_15:
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __85__PGTitleSpecPublicEventArgument__generateTitleWithPerformerNamesForPublicEventNode___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v11 = [a2 label];
  id v5 = [MEMORY[0x1E4F76D68] nightLife];
  if ([v11 isEqualToString:v5])
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = a1 + 32;
    *(unsigned char *)(*(void *)(v7 + 8) + 24) = 1;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F76D68] musicConcerts];
    char v9 = [v11 isEqualToString:v8];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v6 = a1 + 32;
    *(unsigned char *)(*(void *)(v10 + 8) + 24) = v9;
  }
  *a3 = *(unsigned char *)(*(void *)(*(void *)v6 + 8) + 24);
}

- (id)_generateTitleWithBusinessNameForPublicEventNode:(id)a3
{
  id v3 = [a3 businessNode];
  v4 = [v3 name];

  return v4;
}

- (id)_generateTitleWithEventNameForPublicEventNode:(id)a3
{
  id v3 = [a3 name];
  v4 = [(id)objc_opt_class() _cleanUpEventName:v3];
  if ([v4 length]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)_commonPublicEventNodeForMomentNodes:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  obuint64_t j = v3;
  uint64_t v40 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v40)
  {
    unint64_t v5 = 0;
    uint64_t v39 = *(void *)v52;
    do
    {
      uint64_t v6 = 0;
      do
      {
        unint64_t v42 = v5;
        if (*(void *)v52 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v41 = v6;
        uint64_t v7 = *(void **)(*((void *)&v51 + 1) + 8 * v6);
        uint64_t v8 = [v7 numberOfAssets];
        char v9 = [v7 publicEventNodes];
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v47 objects:v58 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v48;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v48 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v47 + 1) + 8 * i);
              unint64_t v15 = [v4 objectForKey:v14];
              id v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "unsignedIntegerValue") + v8);
              [v4 setObject:v16 forKey:v14];
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v47 objects:v58 count:16];
          }
          while (v11);
        }
        unint64_t v5 = v8 + v42;

        uint64_t v6 = v41 + 1;
      }
      while (v41 + 1 != v40);
      uint64_t v40 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
    }
    while (v40);
    double v17 = (double)v5;
  }
  else
  {
    double v17 = 0.0;
  }

  long long v18 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v19 = [v4 keyEnumerator];
  long long v20 = [v19 allObjects];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v21 = v20;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v43 objects:v57 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v44 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v43 + 1) + 8 * j);
        v27 = [v4 objectForKey:v26];
        [v27 doubleValue];
        if (v28 / v17 >= 0.75) {
          [v18 addObject:v26];
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v43 objects:v57 count:16];
    }
    while (v23);
  }

  if ([v18 count] == 1)
  {
    v29 = [v18 anyObject];
    v30 = [v29 categories];
    v31 = +[PGGraphPublicEventNode unsupportedCategoriesForTitles];
    int v32 = [v30 intersectsSet:v31];

    if (v32)
    {
      v33 = +[PGLogging sharedLogging];
      v34 = [v33 loggingConnection];

      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = [v29 name];
        *(_DWORD *)buf = 138412290;
        v56 = v35;
        _os_log_impl(&dword_1D1805000, v34, OS_LOG_TYPE_INFO, "Public event node has an unsupported category for titles \"%@\"", buf, 0xCu);
      }
      id v36 = 0;
    }
    else
    {
      id v36 = v29;
    }
  }
  else
  {
    id v36 = 0;
  }

  return v36;
}

- (id)_resolvedStringWithPublicEventNode:(id)a3 inMomentNodes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    switch(self->_type)
    {
      case 0uLL:
        uint64_t v8 = [(PGTitleSpecPublicEventArgument *)self _generateTitleWithEventNameForPublicEventNode:v6];
        goto LABEL_9;
      case 1uLL:
        uint64_t v8 = [(PGTitleSpecPublicEventArgument *)self _generateTitleWithBusinessNameForPublicEventNode:v6];
        goto LABEL_9;
      case 2uLL:
        uint64_t v8 = [(PGTitleSpecPublicEventArgument *)self _generateTitleWithPerformerNamesForPublicEventNode:v6];
        goto LABEL_9;
      case 3uLL:
        uint64_t v8 = [(PGTitleSpecPublicEventArgument *)self _generateTitleWithCategoryNameForPublicEventNode:v6];
LABEL_9:
        uint64_t v10 = (void *)v8;
        break;
      default:
        uint64_t v10 = 0;
        break;
    }
    unint64_t v11 = [v10 length];
    if (!v11) {
      goto LABEL_14;
    }
    unint64_t v12 = 45;
    if (!self->_shouldUseLongPublicEventTitle) {
      unint64_t v12 = 26;
    }
    if (v11 <= v12)
    {
      id v9 = v10;
      uint64_t v10 = v9;
    }
    else
    {
LABEL_14:
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
    uint64_t v10 = 0;
  }

  return v9;
}

- (id)_resolvedStringWithMomentNodes:(id)a3 features:(id)a4 argumentEvaluationContext:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 anyObject];
  uint64_t v10 = [v9 graph];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v16, "type", (void)v20) == 21)
        {
          long long v18 = [v16 nodeInGraph:v10];
          double v17 = [(PGTitleSpecPublicEventArgument *)self _resolvedStringWithPublicEventNode:v18 inMomentNodes:v7];

          goto LABEL_11;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  double v17 = 0;
LABEL_11:

  return v17;
}

- (id)_resolvedStringWithMomentNodes:(id)a3 argumentEvaluationContext:(id)a4
{
  id v5 = a3;
  id v6 = [(PGTitleSpecPublicEventArgument *)self _commonPublicEventNodeForMomentNodes:v5];
  id v7 = [(PGTitleSpecPublicEventArgument *)self _resolvedStringWithPublicEventNode:v6 inMomentNodes:v5];

  return v7;
}

- (PGTitleSpecPublicEventArgument)initWithPublicEventType:(unint64_t)a3 shouldUseLongPublicEventTitle:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PGTitleSpecPublicEventArgument;
  result = [(PGTitleSpecPublicEventArgument *)&v7 init];
  if (result)
  {
    result->_type = a3;
    result->_shouldUseLongPublicEventTitle = a4;
  }
  return result;
}

- (PGTitleSpecPublicEventArgument)initWithPublicEventType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PGTitleSpecPublicEventArgument;
  result = [(PGTitleSpecPublicEventArgument *)&v5 init];
  if (result)
  {
    result->_type = a3;
    result->_shouldUseLongPublicEventTitle = 0;
  }
  return result;
}

+ (id)_cleanUpEventName:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    v4 = objc_msgSend(v3, "pg_stringByRemovingParenthesesAndBrackets");
    objc_msgSend(v4, "pg_stringByRemovingDates");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = v3;
  }

  return v5;
}

+ (id)argumentWithPublicEventType:(unint64_t)a3 shouldUseLongPublicEventTitle:(BOOL)a4
{
  v4 = [[PGTitleSpecPublicEventArgument alloc] initWithPublicEventType:a3 shouldUseLongPublicEventTitle:a4];
  return v4;
}

+ (id)argumentWithPublicEventType:(unint64_t)a3
{
  id v3 = [[PGTitleSpecPublicEventArgument alloc] initWithPublicEventType:a3];
  return v3;
}

@end