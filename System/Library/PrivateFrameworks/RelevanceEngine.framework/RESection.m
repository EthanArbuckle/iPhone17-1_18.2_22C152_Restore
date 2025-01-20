@interface RESection
- (BOOL)containsElementWithId:(id)a3;
- (NSArray)allElements;
- (NSArray)elements;
- (NSString)name;
- (REMLElementComparator)comparator;
- (RESection)initWithSectionDescriptor:(id)a3 comparator:(id)a4;
- (RESectionDelegate)delegate;
- (id)_createSectionForGroup:(id)a3;
- (id)_groupForIdentifier:(id)a3;
- (id)_groupIdentifierForElement:(id)a3;
- (id)elementIdAtIndex:(unint64_t)a3;
- (id)section:(id)a3 groupForIdentifier:(id)a4;
- (int64_t)_compareElement:(id)a3 toElement:(id)a4 level:(unint64_t)a5;
- (int64_t)_mappedIndexFromIndex:(int64_t)a3;
- (int64_t)count;
- (int64_t)indexOfElementWithId:(id)a3;
- (int64_t)maximumElements;
- (int64_t)visibleCount;
- (void)_addElement:(id)a3 forceHidden:(BOOL)a4;
- (void)_performOrEnqueueBlock:(id)a3;
- (void)_removeElementWithId:(id)a3;
- (void)_removeSection:(id)a3;
- (void)_updateElementWithId:(id)a3 withNewFeatureSet:(id)a4 forceHidden:(BOOL)a5;
- (void)addElement:(id)a3 forceHidden:(BOOL)a4;
- (void)performBatchUpdates:(id)a3;
- (void)removeElementWithId:(id)a3;
- (void)sectionDidUpdateContentOrder:(id)a3;
- (void)setComparator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMaximumElements:(int64_t)a3;
- (void)updateElementWithId:(id)a3 withNewFeatureSet:(id)a4 forceHidden:(BOOL)a5;
@end

@implementation RESection

- (void)setDelegate:(id)a3
{
}

- (RESection)initWithSectionDescriptor:(id)a3 comparator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v34.receiver = self;
  v34.super_class = (Class)RESection;
  v9 = [(RESection *)&v34 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_descriptor, a3);
    uint64_t v11 = [v8 copy];
    comparator = v10->_comparator;
    v10->_comparator = (REMLElementComparator *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    elements = v10->_elements;
    v10->_elements = (NSMutableDictionary *)v13;

    uint64_t v15 = [MEMORY[0x263EFF9C0] set];
    hiddenElements = v10->_hiddenElements;
    v10->_hiddenElements = (NSMutableSet *)v15;

    v10->_allowsSubsections = [v7 allowsSubsections];
    uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
    subsections = v10->_subsections;
    v10->_subsections = (NSMutableDictionary *)v17;

    uint64_t v19 = [MEMORY[0x263EFF980] array];
    batchBlocks = v10->_batchBlocks;
    v10->_batchBlocks = (NSMutableArray *)v19;

    v21 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "comparisonLevels"));
    objc_initWeak(&location, v10);
    char v22 = [v7 invertRanking];
    for (i = 0; (unint64_t)i < [v8 comparisonLevels]; ++i)
    {
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __50__RESection_initWithSectionDescriptor_comparator___block_invoke;
      v30[3] = &unk_2644BDEB0;
      objc_copyWeak(v31, &location);
      char v32 = v22;
      v31[1] = i;
      v24 = (void *)MEMORY[0x223C31700](v30);
      [v21 addObject:v24];

      objc_destroyWeak(v31);
    }
    v25 = -[REElementQueue initWithMaximumRelevantElementsCount:comparators:]([REElementQueue alloc], "initWithMaximumRelevantElementsCount:comparators:", [v7 maxElementCount], v21);
    queue = v10->_queue;
    v10->_queue = v25;

    unint64_t v27 = [(_RESectionDescriptor *)v10->_descriptor maxElementCount];
    if (v27 >= 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v28 = v27;
    }
    [(RESection *)v10 setMaximumElements:v28];
    objc_destroyWeak(&location);
  }
  return v10;
}

- (void)setMaximumElements:(int64_t)a3
{
}

uint64_t __50__RESection_initWithSectionDescriptor_comparator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = (id *)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  v9 = WeakRetained;
  if (*(unsigned char *)(a1 + 48))
  {
    id v10 = v6;
    id v11 = v7;
  }
  else
  {
    id v10 = v7;
    id v11 = v6;
  }
  uint64_t v12 = [WeakRetained _compareElement:v10 toElement:v11 level:*(void *)(a1 + 40)];

  return v12;
}

- (void)setComparator:(id)a3
{
  if (self->_comparator != a3)
  {
    id v4 = a3;
    v5 = RELogForDomain(6);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[RESection setComparator:]((uint64_t)self, v5, v6, v7, v8, v9, v10, v11);
    }

    uint64_t v12 = (REMLElementComparator *)[v4 copy];
    comparator = self->_comparator;
    self->_comparator = v12;

    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __27__RESection_setComparator___block_invoke;
    v21[3] = &unk_2644BC660;
    v21[4] = self;
    [(RESection *)self performBatchUpdates:v21];
    v14 = RELogForDomain(6);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[RESection setComparator:]((uint64_t)self, v14, v15, v16, v17, v18, v19, v20);
    }
  }
}

void __27__RESection_setComparator___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) copy];
  v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) copy];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __27__RESection_setComparator___block_invoke_2;
  v9[3] = &unk_2644BDED8;
  v9[4] = *(void *)(a1 + 32);
  [v2 enumerateKeysAndObjectsUsingBlock:v9];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __27__RESection_setComparator___block_invoke_3;
  v6[3] = &unk_2644BDF00;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  [v2 enumerateKeysAndObjectsUsingBlock:v6];
}

uint64_t __27__RESection_setComparator___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeElementWithId:a2];
}

void __27__RESection_setComparator___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  objc_msgSend(*(id *)(a1 + 40), "addElement:forceHidden:", v6, objc_msgSend(v5, "containsObject:", a2));
}

- (int64_t)_compareElement:(id)a3 toElement:(id)a4 level:(unint64_t)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(NSMutableDictionary *)self->_subsections objectForKeyedSubscript:v8];
  uint64_t v11 = [(NSMutableDictionary *)self->_subsections objectForKeyedSubscript:v9];
  uint64_t v12 = v11;
  if (!self->_allowsSubsections)
  {
LABEL_9:
    uint64_t v20 = 0;
    goto LABEL_10;
  }
  if (!v10)
  {
    if (v11)
    {
      if (![v11 visibleCount])
      {
        int64_t v18 = 1;
        goto LABEL_33;
      }
      uint64_t v19 = 0;
LABEL_19:
      elements = self->_elements;
      v24 = [v12 elementIdAtIndex:0];
      uint64_t v20 = [(NSMutableDictionary *)elements objectForKeyedSubscript:v24];

      if (v19) {
        goto LABEL_22;
      }
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v13 = [v10 visibleCount];
  uint64_t v14 = v13;
  if (!v12)
  {
    if (!v13)
    {
      int64_t v18 = -1;
      goto LABEL_33;
    }
LABEL_18:
    v21 = self->_elements;
    char v22 = [v10 elementIdAtIndex:0];
    uint64_t v19 = [(NSMutableDictionary *)v21 objectForKeyedSubscript:v22];

    if (v12) {
      goto LABEL_19;
    }
    uint64_t v20 = 0;
    if (v19) {
      goto LABEL_22;
    }
LABEL_10:
    uint64_t v19 = [(NSMutableDictionary *)self->_elements objectForKeyedSubscript:v8];
LABEL_22:
    if (!v20)
    {
      uint64_t v20 = [(NSMutableDictionary *)self->_elements objectForKeyedSubscript:v9];
    }
    uint64_t v25 = [(REMLElementComparator *)self->_comparator compareElement:v19 toElement:v20 level:a5];
    v26 = REStringFromRankingOrder(v25);
    unint64_t v27 = RELogForDomain(6);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v31 = [v19 identifier];
      [v20 identifier];
      *(_DWORD *)buf = 138412802;
      v33 = v26;
      __int16 v34 = 2112;
      v35 = v31;
      v37 = __int16 v36 = 2112;
      v30 = (void *)v37;
      _os_log_debug_impl(&dword_21E6E6000, v27, OS_LOG_TYPE_DEBUG, "Comparator (%@) [%@] to [%@]", buf, 0x20u);
    }
    if (v25 == -1) {
      uint64_t v28 = -1;
    }
    else {
      uint64_t v28 = 0;
    }
    if (v25 == 1) {
      int64_t v18 = 1;
    }
    else {
      int64_t v18 = v28;
    }

    goto LABEL_33;
  }
  uint64_t v15 = [v12 visibleCount];
  if (!(v14 | v15))
  {
    uint64_t v16 = [v10 name];
    uint64_t v17 = [v12 name];
    int64_t v18 = [v16 compare:v17];

    goto LABEL_33;
  }
  if (v14) {
    int64_t v18 = 1;
  }
  else {
    int64_t v18 = -1;
  }
  if (v14 && v15) {
    goto LABEL_18;
  }
LABEL_33:

  return v18;
}

- (id)_groupForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(RESection *)self delegate];
  id v6 = [v5 section:self groupForIdentifier:v4];

  return v6;
}

- (id)_groupIdentifierForElement:(id)a3
{
  if (self->_allowsSubsections)
  {
    id v4 = [a3 featureMap];
    id v5 = +[REFeature groupFeature];
    id v6 = [v4 featureValueForFeature:v5];

    if (v6)
    {
      id v7 = [v6 stringValue];
      if ([v7 length])
      {
        id v8 = [(NSMutableDictionary *)self->_subsections objectForKeyedSubscript:v7];

        if (v8
          || ([(RESection *)self _groupForIdentifier:v7],
              id v9 = (id)objc_claimAutoreleasedReturnValue(),
              v9,
              v9))
        {
          id v9 = v7;
        }
      }
      else
      {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (id)_createSectionForGroup:(id)a3
{
  v3 = 0;
  if (a3 && self->_allowsSubsections)
  {
    id v5 = a3;
    id v6 = objc_alloc_init(RESectionDescriptor);
    -[RESectionDescriptor setMaxElementCount:](v6, "setMaxElementCount:", [v5 maxElementCount]);
    id v7 = [v5 groupIdentifier];
    [(RESectionDescriptor *)v6 setName:v7];

    id v8 = [[_RESectionDescriptor alloc] initWithSectionDescriptor:v6];
    v3 = [[RESection alloc] initWithSectionDescriptor:v8 comparator:self->_comparator];
    v3->_allowsSubsections = 0;
    [(RESection *)v3 setDelegate:self];
    subsections = self->_subsections;
    uint64_t v10 = [v5 groupIdentifier];

    [(NSMutableDictionary *)subsections setObject:v3 forKeyedSubscript:v10];
  }
  return v3;
}

- (void)_removeSection:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_allowsSubsections)
  {
    id v8 = v4;
    id v6 = [(NSMutableDictionary *)self->_subsections objectForKeyedSubscript:v4];
    id v7 = v6;
    if (v6)
    {
      [v6 setDelegate:0];
      [(NSMutableDictionary *)self->_subsections removeObjectForKey:v8];
    }

    id v5 = v8;
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (NSString)name
{
  return [(_RESectionDescriptor *)self->_descriptor name];
}

- (int64_t)count
{
  BOOL allowsSubsections = self->_allowsSubsections;
  int64_t v4 = [(REElementQueue *)self->_queue count];
  int64_t v5 = v4;
  if (!allowsSubsections) {
    return v4;
  }
  if (!v4) {
    return 0;
  }
  uint64_t v6 = 0;
  int64_t v7 = 0;
  do
  {
    subsections = self->_subsections;
    id v9 = [(REElementQueue *)self->_queue elementAtIndex:v6];
    uint64_t v10 = [(NSMutableDictionary *)subsections objectForKeyedSubscript:v9];

    if (v10) {
      uint64_t v11 = [v10 count];
    }
    else {
      uint64_t v11 = 1;
    }
    v7 += v11;

    ++v6;
  }
  while (v5 != v6);
  return v7;
}

- (int64_t)visibleCount
{
  BOOL allowsSubsections = self->_allowsSubsections;
  int64_t v4 = [(REElementQueue *)self->_queue visibleCount];
  int64_t v5 = v4;
  if (!allowsSubsections) {
    return v4;
  }
  if (!v4) {
    return 0;
  }
  uint64_t v6 = 0;
  int64_t v7 = 0;
  do
  {
    subsections = self->_subsections;
    id v9 = [(REElementQueue *)self->_queue elementAtIndex:v6];
    uint64_t v10 = [(NSMutableDictionary *)subsections objectForKeyedSubscript:v9];

    if (v10) {
      uint64_t v11 = [v10 visibleCount];
    }
    else {
      uint64_t v11 = 1;
    }
    v7 += v11;

    ++v6;
  }
  while (v5 != v6);
  return v7;
}

- (int64_t)maximumElements
{
  return [(REElementQueue *)self->_queue maximumRelevantElementsCount];
}

- (NSArray)allElements
{
  return (NSArray *)[(NSMutableDictionary *)self->_elements allKeys];
}

- (void)addElement:(id)a3 forceHidden:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __36__RESection_addElement_forceHidden___block_invoke;
  v8[3] = &unk_2644BDF28;
  v8[4] = self;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  [(RESection *)self _performOrEnqueueBlock:v8];
}

uint64_t __36__RESection_addElement_forceHidden___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addElement:*(void *)(a1 + 40) forceHidden:*(unsigned __int8 *)(a1 + 48)];
}

- (void)_addElement:(id)a3 forceHidden:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = v6;
  if (v4)
  {
    hiddenElements = self->_hiddenElements;
    id v9 = [v6 identifier];
    [(NSMutableSet *)hiddenElements addObject:v9];
  }
  BOOL v10 = [(RESection *)self _groupIdentifierForElement:v7];
  if (v10)
  {
    uint64_t v11 = RELogForDomain(6);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v25 = @"NO";
      *(_DWORD *)unint64_t v27 = 138413058;
      *(void *)&v27[4] = self;
      if (v4) {
        uint64_t v25 = @"YES";
      }
      *(_WORD *)&v27[12] = 2112;
      *(void *)&v27[14] = v7;
      __int16 v28 = 2112;
      v29 = v25;
      __int16 v30 = 2112;
      v31 = v10;
      _os_log_debug_impl(&dword_21E6E6000, v11, OS_LOG_TYPE_DEBUG, "%@ add element %@ forceHidden %@ to subsection %@", v27, 0x2Au);
    }

    uint64_t v12 = [(NSMutableDictionary *)self->_subsections objectForKeyedSubscript:v10];
    if (v12) {
      goto LABEL_10;
    }
    uint64_t v13 = [(RESection *)self _groupForIdentifier:v10];
    uint64_t v14 = [(RESection *)self _createSectionForGroup:v13];
    if (v14)
    {
      uint64_t v12 = (void *)v14;
      [(REElementQueue *)self->_queue addElement:v10 hidden:1];
      uint64_t v15 = RELogForDomain(6);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[RESection _addElement:forceHidden:]();
      }

LABEL_10:
      elements = self->_elements;
      uint64_t v17 = objc_msgSend(v7, "identifier", *(_OWORD *)v27);
      [(NSMutableDictionary *)elements setValue:v7 forKey:v17];

      [v12 addElement:v7 forceHidden:v4];
      goto LABEL_21;
    }
    int64_t v18 = RELogForDomain(6);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[RESection _addElement:forceHidden:]();
    }

    uint64_t v19 = RELogForDomain(6);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[RESection _addElement:forceHidden:]();
    }
  }
  uint64_t v20 = RELogForDomain(6);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v26 = @"NO";
    *(_DWORD *)unint64_t v27 = 138412802;
    *(void *)&v27[4] = self;
    *(_WORD *)&v27[12] = 2112;
    if (v4) {
      v26 = @"YES";
    }
    *(void *)&v27[14] = v7;
    __int16 v28 = 2112;
    v29 = v26;
    _os_log_debug_impl(&dword_21E6E6000, v20, OS_LOG_TYPE_DEBUG, "%@ add element %@ forceHidden %@", v27, 0x20u);
  }

  BOOL v21 = v4 || [(REMLElementComparator *)self->_comparator shouldHideElement:v7];
  char v22 = self->_elements;
  v23 = objc_msgSend(v7, "identifier", *(void *)v27, *(void *)&v27[8]);
  [(NSMutableDictionary *)v22 setValue:v7 forKey:v23];

  queue = self->_queue;
  uint64_t v12 = [v7 identifier];
  [(REElementQueue *)queue addElement:v12 hidden:v21];
LABEL_21:
}

- (void)removeElementWithId:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__RESection_removeElementWithId___block_invoke;
  v6[3] = &unk_2644BC688;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(RESection *)self _performOrEnqueueBlock:v6];
}

uint64_t __33__RESection_removeElementWithId___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeElementWithId:*(void *)(a1 + 40)];
}

- (void)_removeElementWithId:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_elements objectForKeyedSubscript:v4];
  id v6 = [(RESection *)self _groupIdentifierForElement:v5];
  if (v6)
  {
    id v7 = RELogForDomain(6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 138412802;
      uint64_t v14 = self;
      __int16 v15 = 2112;
      id v16 = v4;
      __int16 v17 = 2112;
      int64_t v18 = v6;
      _os_log_debug_impl(&dword_21E6E6000, v7, OS_LOG_TYPE_DEBUG, "%@ remove element %@ from subsection %@", (uint8_t *)&v13, 0x20u);
    }

    id v8 = [(NSMutableDictionary *)self->_subsections objectForKeyedSubscript:v6];
    if (v8)
    {
      id v9 = v8;
      [v8 removeElementWithId:v4];
      [(NSMutableDictionary *)self->_elements removeObjectForKey:v4];
      [(NSMutableSet *)self->_hiddenElements removeObject:v4];
      if (![v9 count])
      {
        [(REElementQueue *)self->_queue removeElement:v6];
        [(NSMutableDictionary *)self->_subsections removeObjectForKey:v6];
        BOOL v10 = RELogForDomain(6);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          -[RESection _removeElementWithId:]();
        }
      }
      goto LABEL_16;
    }
    uint64_t v11 = RELogForDomain(6);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[RESection _addElement:forceHidden:]();
    }
  }
  uint64_t v12 = RELogForDomain(6);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[RESection _removeElementWithId:]();
  }

  [(REElementQueue *)self->_queue removeElement:v4];
  [(NSMutableDictionary *)self->_elements removeObjectForKey:v4];
  [(NSMutableSet *)self->_hiddenElements removeObject:v4];
LABEL_16:
}

- (void)updateElementWithId:(id)a3 withNewFeatureSet:(id)a4 forceHidden:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__RESection_updateElementWithId_withNewFeatureSet_forceHidden___block_invoke;
  v12[3] = &unk_2644BDF50;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  BOOL v15 = a5;
  id v10 = v9;
  id v11 = v8;
  [(RESection *)self _performOrEnqueueBlock:v12];
}

uint64_t __63__RESection_updateElementWithId_withNewFeatureSet_forceHidden___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateElementWithId:*(void *)(a1 + 40) withNewFeatureSet:*(void *)(a1 + 48) forceHidden:*(unsigned __int8 *)(a1 + 56)];
}

- (void)_updateElementWithId:(id)a3 withNewFeatureSet:(id)a4 forceHidden:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (__CFString *)a4;
  id v10 = [(NSMutableDictionary *)self->_elements objectForKeyedSubscript:v8];
  id v11 = (void *)[v10 copy];

  uint64_t v12 = [(RESection *)self _groupIdentifierForElement:v11];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __64__RESection__updateElementWithId_withNewFeatureSet_forceHidden___block_invoke;
  v25[3] = &unk_2644BC8F8;
  id v13 = v11;
  id v26 = v13;
  [(__CFString *)v9 enumerateFeaturesUsingBlock:v25];
  id v14 = [(RESection *)self _groupIdentifierForElement:v13];
  if (v12 == v14)
  {
  }
  else
  {
    char v15 = [(__CFString *)v12 isEqual:v14];

    if ((v15 & 1) == 0)
    {
      id v16 = RELogForDomain(6);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413058;
        __int16 v28 = self;
        __int16 v29 = 2112;
        id v30 = v8;
        __int16 v31 = 2112;
        uint64_t v32 = v12;
        __int16 v33 = 2112;
        __int16 v34 = v14;
        _os_log_debug_impl(&dword_21E6E6000, v16, OS_LOG_TYPE_DEBUG, "%@ trying to change group of element %@ from %@ to %@", buf, 0x2Au);
      }

      [(RESection *)self removeElementWithId:v8];
      __int16 v17 = [[REMLElement alloc] initWithIdentifier:v8 featureMap:v9];
      [(RESection *)self addElement:v17 forceHidden:v5];

      goto LABEL_18;
    }
  }
  [(NSMutableDictionary *)self->_elements setObject:v13 forKeyedSubscript:v8];
  hiddenElements = self->_hiddenElements;
  if (v5) {
    [(NSMutableSet *)hiddenElements addObject:v8];
  }
  else {
    [(NSMutableSet *)hiddenElements removeObject:v8];
  }
  uint64_t v19 = RELogForDomain(6);
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
  if (v14)
  {
    if (v20)
    {
      v23 = @"NO";
      *(_DWORD *)buf = 138413314;
      __int16 v28 = self;
      if (v5) {
        v23 = @"YES";
      }
      __int16 v29 = 2112;
      id v30 = v8;
      __int16 v31 = 2112;
      uint64_t v32 = v9;
      __int16 v33 = 2112;
      __int16 v34 = v23;
      __int16 v35 = 2112;
      __int16 v36 = v14;
      _os_log_debug_impl(&dword_21E6E6000, v19, OS_LOG_TYPE_DEBUG, "%@ update element %@ with feature set %@ forceHidden %@ to subsection %@", buf, 0x34u);
    }

    BOOL v21 = [(NSMutableDictionary *)self->_subsections objectForKeyedSubscript:v14];
    [v21 updateElementWithId:v8 withNewFeatureSet:v9 forceHidden:v5];
  }
  else
  {
    if (v20)
    {
      v24 = @"NO";
      *(_DWORD *)buf = 138413058;
      __int16 v28 = self;
      if (v5) {
        v24 = @"YES";
      }
      __int16 v29 = 2112;
      id v30 = v8;
      __int16 v31 = 2112;
      uint64_t v32 = v9;
      __int16 v33 = 2112;
      __int16 v34 = v24;
      _os_log_debug_impl(&dword_21E6E6000, v19, OS_LOG_TYPE_DEBUG, "%@ update element %@ with feature set %@ forceHidden %@", buf, 0x2Au);
    }

    BOOL v22 = v5 || [(REMLElementComparator *)self->_comparator shouldHideElement:v13];
    [(REElementQueue *)self->_queue updatePositionForElement:v8 hidden:v22];
  }
LABEL_18:
}

void __64__RESection__updateElementWithId_withNewFeatureSet_forceHidden___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 featureMap];
  [v6 setValue:a3 forFeature:v5];
}

- (void)_performOrEnqueueBlock:(id)a3
{
  if (self->_performingBatch)
  {
    batchBlocks = self->_batchBlocks;
    id v5 = (id)MEMORY[0x223C31700](a3, a2);
    -[NSMutableArray addObject:](batchBlocks, "addObject:");
  }
  else
  {
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    id v5 = [(RESection *)self delegate];
    [v5 sectionDidUpdateContentOrder:self];
  }
}

- (void)performBatchUpdates:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  self->_performingBatch = 1;
  if (v4) {
    (*((void (**)(id))v4 + 2))(v4);
  }
  self->_performingBatch = 0;
  if ([(NSMutableArray *)self->_batchBlocks count])
  {
    queue = self->_queue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __33__RESection_performBatchUpdates___block_invoke;
    v8[3] = &unk_2644BC660;
    v8[4] = self;
    [(REElementQueue *)queue performBatchUpdates:v8];
    [(NSMutableArray *)self->_batchBlocks removeAllObjects];
    id v7 = [(RESection *)self delegate];
    [v7 sectionDidUpdateContentOrder:self];
  }
}

void __33__RESection_performBatchUpdates___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(*(void *)(a1 + 32) + 64);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (BOOL)containsElementWithId:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_elements objectForKeyedSubscript:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (int64_t)indexOfElementWithId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_elements objectForKeyedSubscript:v4];

  if (!v5) {
    goto LABEL_11;
  }
  queue = self->_queue;
  if (!self->_subsections)
  {
    int64_t v10 = [(REElementQueue *)queue indexOfElement:v4];
    goto LABEL_15;
  }
  uint64_t v7 = [(REElementQueue *)queue visibleCount];
  if (v7 >= 1)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    int64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = [(REElementQueue *)self->_queue elementAtIndex:v9];
      if ([v11 isEqualToString:v4]) {
        break;
      }
      uint64_t v12 = [(NSMutableDictionary *)self->_subsections objectForKeyedSubscript:v11];
      id v13 = v12;
      if (v12)
      {
        uint64_t v14 = [v12 indexOfElementWithId:v4];
        if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v10 += v14;

          break;
        }
        uint64_t v15 = [v13 visibleCount];
      }
      else
      {
        uint64_t v15 = 1;
      }
      v10 += v15;

      if (v8 == ++v9) {
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_15:

  return v10;
}

- (id)elementIdAtIndex:(unint64_t)a3
{
  unint64_t v3 = a3;
  BOOL allowsSubsections = self->_allowsSubsections;
  queue = self->_queue;
  if (!allowsSubsections)
  {
    id v13 = [(REElementQueue *)queue elementAtIndex:a3];
    goto LABEL_15;
  }
  uint64_t v7 = [(REElementQueue *)queue visibleCount];
  if (v7 < 1)
  {
LABEL_10:
    id v13 = 0;
    goto LABEL_15;
  }
  uint64_t v8 = v7;
  uint64_t v9 = 0;
  while (1)
  {
    int64_t v10 = [(REElementQueue *)self->_queue elementAtIndex:v9];
    uint64_t v11 = [(NSMutableDictionary *)self->_subsections objectForKeyedSubscript:v10];
    uint64_t v12 = v11;
    if (!v11) {
      break;
    }
    if ([v11 visibleCount] > v3)
    {
      id v14 = [v12 elementIdAtIndex:v3];
      goto LABEL_14;
    }
    v3 -= [v12 visibleCount];
LABEL_9:

    if (v8 == ++v9) {
      goto LABEL_10;
    }
  }
  if (v3)
  {
    --v3;
    goto LABEL_9;
  }
  id v14 = v10;
LABEL_14:
  id v13 = v14;

LABEL_15:
  return v13;
}

- (int64_t)_mappedIndexFromIndex:(int64_t)a3
{
  if (!self->_allowsSubsections) {
    return a3;
  }
  if (a3 < 1) {
    return 0;
  }
  int64_t v5 = 0;
  for (uint64_t i = 0; i != a3; ++i)
  {
    uint64_t v7 = [(REElementQueue *)self->_queue elementAtIndex:i];
    uint64_t v8 = [(NSMutableDictionary *)self->_subsections objectForKeyedSubscript:v7];
    uint64_t v9 = v8;
    if (v8) {
      uint64_t v10 = [v8 visibleCount];
    }
    else {
      uint64_t v10 = 1;
    }
    v5 += v10;
  }
  return v5;
}

- (void)sectionDidUpdateContentOrder:(id)a3
{
  id v4 = a3;
  int64_t v5 = RELogForDomain(6);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[RESection sectionDidUpdateContentOrder:]((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __42__RESection_sectionDidUpdateContentOrder___block_invoke;
  v13[3] = &unk_2644BC688;
  v13[4] = self;
  id v14 = v4;
  id v12 = v4;
  [(RESection *)self _performOrEnqueueBlock:v13];
}

void __42__RESection_sectionDidUpdateContentOrder___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v3 = [*(id *)(a1 + 40) name];
  objc_msgSend(v2, "updatePositionForElement:hidden:", v3, objc_msgSend(*(id *)(a1 + 40), "visibleCount") == 0);
}

- (id)section:(id)a3 groupForIdentifier:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(RESection *)self delegate];
  uint64_t v7 = [v6 section:self groupForIdentifier:v5];

  return v7;
}

- (NSArray)elements
{
  return (NSArray *)[(NSMutableDictionary *)self->_elements allValues];
}

- (REMLElementComparator)comparator
{
  return self->_comparator;
}

- (RESectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RESectionDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_comparator, 0);
  objc_storeStrong((id *)&self->_batchBlocks, 0);
  objc_storeStrong((id *)&self->_subsections, 0);
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_hiddenElements, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

- (void)setComparator:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setComparator:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_addElement:forceHidden:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_21E6E6000, v0, v1, "%@ no subsections available for element %@");
}

- (void)_addElement:forceHidden:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_21E6E6000, v0, v1, "%@ not creating new subsection for identifier %@");
}

- (void)_addElement:forceHidden:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_21E6E6000, v0, v1, "%@ creating new subsection %@");
}

- (void)_removeElementWithId:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_21E6E6000, v0, v1, "%@ remove element %@");
}

- (void)_removeElementWithId:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_21E6E6000, v0, v1, "%@ removing empty subsection %@");
}

- (void)sectionDidUpdateContentOrder:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end