@interface REUIRelevanceEngineController
- (BOOL)_isElementHidden:(id)a3;
- (BOOL)_sectionHasContent:(id)a3;
- (BOOL)allowsLocationUse;
- (BOOL)elementIsAvailable:(id)a3;
- (BOOL)isDataSourceEnabled:(id)a3;
- (BOOL)relevanceEngine:(id)a3 isElementAtPathVisible:(id)a4;
- (BOOL)wantsIdealizedContent;
- (BOOL)wantsLiveDataSources;
- (NSArray)sectionOrder;
- (NSSet)disabledDataSources;
- (RERelevanceEngine)engine;
- (REUIRelevanceEngineController)initWithRelevanceEngine:(id)a3;
- (REUIRelevanceEngineController)initWithRelevanceEngine:(id)a3 sectionOrder:(id)a4;
- (REUIRelevanceEngineControllerDelegate)delegate;
- (REUITrainingContext)trainingContext;
- (double)maximumNegativeDwellTime;
- (double)minimumPositiveDwellTime;
- (id)_contentAtIndexPath:(id)a3;
- (id)_contentForElement:(id)a3;
- (id)_controllerIndexPathForEngineIndexPath:(id)a3;
- (id)_engineIndexPathForControllerIndexPath:(id)a3;
- (id)_indexPathForElementWithIdentifier:(id)a3;
- (id)_indexPathForSectionPath:(id)a3;
- (id)_sectionAtIndex:(int64_t)a3;
- (id)_sectionPathForIndexPath:(id)a3;
- (id)_sectionSupportingNoContentElements;
- (id)actionAtIndexPath:(id)a3;
- (id)contentAtIndexPath:(id)a3;
- (id)elementAtIndexPath:(id)a3;
- (id)elementIdentifierAtIndexPath:(id)a3;
- (id)elementsOrdered:(unint64_t)a3 relativeToElement:(id)a4;
- (id)generateDiffableSnapshot;
- (id)identifierForElementAtIndexPath:(id)a3;
- (id)indexPathForElementWithIdentifier:(id)a3;
- (id)interactionTypeForElement:(id)a3;
- (id)metadataForElementWithIdentifier:(id)a3;
- (id)predictedContentForSectionAtIndex:(unint64_t)a3 atDate:(id)a4 limit:(int64_t)a5;
- (id)predictedElementsForSectionAtIndex:(unint64_t)a3 atDate:(id)a4 limit:(int64_t)a5;
- (id)predictionForElementAtIndexPath:(id)a3;
- (int64_t)_indexForSection:(id)a3;
- (unint64_t)_numberOfItemsInSectionAtIndex:(unint64_t)a3;
- (unint64_t)numberOfItemsInSectionAtIndex:(unint64_t)a3;
- (unint64_t)numberOfSections;
- (unint64_t)onScreenElementCount;
- (void)_enumerateEngineElementsInSection:(unint64_t)a3 withOptions:(unint64_t)a4 usingBlock:(id)a5;
- (void)_enumerateEngineElementsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)_loadNewRelevanceEngine:(id)a3 withCompletion:(id)a4;
- (void)_performBatchUpdateUsingBlock:(id)a3 completion:(id)a4;
- (void)_performOperations:(id)a3 toSection:(unint64_t)a4;
- (void)_performOrEnqueueOperation:(id)a3;
- (void)_setElement:(id)a3 atIndexPath:(id)a4 hidden:(BOOL)a5;
- (void)dealloc;
- (void)elemenAtIndexPathDidDisplay:(id)a3;
- (void)elementAtIndexPathDidEndDisplay:(id)a3;
- (void)elementAtIndexPathWasSelected:(id)a3;
- (void)makeCurrent;
- (void)relevanceEngine:(id)a3 didInsertElement:(id)a4 atPath:(id)a5;
- (void)relevanceEngine:(id)a3 didMoveElement:(id)a4 fromPath:(id)a5 toPath:(id)a6;
- (void)relevanceEngine:(id)a3 didReloadElement:(id)a4 atPath:(id)a5;
- (void)relevanceEngine:(id)a3 didRemoveElement:(id)a4 atPath:(id)a5;
- (void)relevanceEngine:(id)a3 performBatchUpdateBlock:(id)a4 completion:(id)a5;
- (void)relevanceEngineDidBeginUpdatingRelevance:(id)a3;
- (void)relevanceEngineDidFinishUpdatingRelevance:(id)a3;
- (void)resignCurrent;
- (void)setAllowsLocationUse:(BOOL)a3;
- (void)setDataSource:(id)a3 enabled:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setMaximumNegativeDwellTime:(double)a3;
- (void)setMinimumPositiveDwellTime:(double)a3;
- (void)setOnScreenElementCount:(unint64_t)a3;
- (void)setWantsIdealizedContent:(BOOL)a3;
- (void)setWantsLiveDataSources:(BOOL)a3;
@end

@implementation REUIRelevanceEngineController

- (REUIRelevanceEngineController)initWithRelevanceEngine:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v6 = objc_msgSend(v4, "configuration", 0);
  v7 = [v6 sectionDescriptors];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v13 = [v12 historicSectionDescriptor];
        v14 = v13;
        if (v13)
        {
          v15 = [v13 name];
          [v5 addObject:v15];
        }
        v16 = [v12 name];
        [v5 addObject:v16];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  v17 = (void *)[v5 copy];
  v18 = [(REUIRelevanceEngineController *)self initWithRelevanceEngine:v4 sectionOrder:v17];

  return v18;
}

- (REUIRelevanceEngineController)initWithRelevanceEngine:(id)a3 sectionOrder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)REUIRelevanceEngineController;
  uint64_t v8 = [(REUIRelevanceEngineController *)&v33 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    sectionOrder = v8->_sectionOrder;
    v8->_sectionOrder = (NSArray *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    sectionNameOrdering = v8->_sectionNameOrdering;
    v8->_sectionNameOrdering = (NSMutableDictionary *)v11;

    v13 = v8->_sectionOrder;
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __70__REUIRelevanceEngineController_initWithRelevanceEngine_sectionOrder___block_invoke;
    v31[3] = &unk_2644B7968;
    v14 = v8;
    v32 = v14;
    [(NSArray *)v13 enumerateObjectsUsingBlock:v31];
    uint64_t v15 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    currentElementStates = v14->_currentElementStates;
    v14->_currentElementStates = (NSMutableDictionary *)v15;

    v17 = objc_alloc_init(_REUIControllerTrainingContext);
    trainingContext = v14->_trainingContext;
    v14->_trainingContext = v17;

    [(_REUIControllerTrainingContext *)v14->_trainingContext setDelegate:v14];
    [v6 addTrainingContext:v14->_trainingContext];
    v19 = (RERelevanceEnginePreferences *)objc_alloc_init(MEMORY[0x263F62D88]);
    preferences = v14->_preferences;
    v14->_preferences = v19;

    [v6 setPreferences:v14->_preferences forObject:v14];
    *(_DWORD *)&v14->_isShowingContentElements = 0;
    [(REUIRelevanceEngineController *)v14 setMinimumPositiveDwellTime:1.5];
    [(REUIRelevanceEngineController *)v14 setMaximumNegativeDwellTime:0.5];
    [(REUIRelevanceEngineController *)v14 setOnScreenElementCount:3];
    long long v21 = [MEMORY[0x263EFF980] array];
    if ([(NSArray *)v8->_sectionOrder count])
    {
      unint64_t v22 = 0;
      do
      {
        long long v23 = [MEMORY[0x263F089C8] indexSet];
        [v21 addObject:v23];

        ++v22;
      }
      while (v22 < [(NSArray *)v8->_sectionOrder count]);
    }
    uint64_t v24 = [v21 copy];
    hiddenIndices = v14->_hiddenIndices;
    v14->_hiddenIndices = (NSArray *)v24;

    uint64_t v26 = [MEMORY[0x263EFF9C0] set];
    hiddenBundleIdentifiers = v14->_hiddenBundleIdentifiers;
    v14->_hiddenBundleIdentifiers = (NSMutableSet *)v26;

    uint64_t v28 = [MEMORY[0x263EFF980] array];
    pendingOperations = v14->_pendingOperations;
    v14->_pendingOperations = (NSMutableArray *)v28;

    [(REUIRelevanceEngineController *)v14 _loadNewRelevanceEngine:v6 withCompletion:0];
  }

  return v8;
}

void __70__REUIRelevanceEngineController_initWithRelevanceEngine_sectionOrder___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = NSNumber;
  id v6 = a2;
  id v7 = [v5 numberWithUnsignedInteger:a3];
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v7 forKeyedSubscript:v6];
}

- (void)dealloc
{
  [(RERelevanceEngine *)self->_engine removeTrainingContext:self->_trainingContext];
  [(RERelevanceEngine *)self->_engine removeObserver:self];
  [(RERelevanceEngine *)self->_engine removePreferencesForObject:self];
  v3.receiver = self;
  v3.super_class = (Class)REUIRelevanceEngineController;
  [(REUIRelevanceEngineController *)&v3 dealloc];
}

- (id)_sectionAtIndex:(int64_t)a3
{
  if (a3 < 0 || [(NSArray *)self->_sectionOrder count] <= a3) {
    RERaiseInternalException();
  }
  sectionOrder = self->_sectionOrder;

  return [(NSArray *)sectionOrder objectAtIndexedSubscript:a3];
}

- (int64_t)_indexForSection:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_sectionNameOrdering objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v8 = v4;
    RERaiseInternalException();
  }
  int64_t v6 = objc_msgSend(v5, "integerValue", v8);

  return v6;
}

- (id)_sectionPathForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = -[REUIRelevanceEngineController _sectionAtIndex:](self, "_sectionAtIndex:", [v4 section]);
  uint64_t v6 = [v4 item];

  id v7 = [MEMORY[0x263F62D98] sectionPathWithSectionName:v5 element:v6];

  return v7;
}

- (id)_indexPathForSectionPath:(id)a3
{
  id v4 = a3;
  v5 = [v4 sectionName];
  int64_t v6 = [(REUIRelevanceEngineController *)self _indexForSection:v5];

  uint64_t v7 = [v4 element];
  id v8 = (void *)MEMORY[0x263F088C8];

  return (id)[v8 indexPathForItem:v7 inSection:v6];
}

- (id)_controllerIndexPathForEngineIndexPath:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [v4 section];
    uint64_t v6 = [v4 item];

    uint64_t v7 = [(NSArray *)self->_hiddenIndices objectAtIndexedSubscript:v5];
    if ([v7 containsIndex:v6])
    {
      id v8 = 0;
    }
    else
    {
      uint64_t v9 = objc_msgSend(v7, "countOfIndexesInRange:", 0, v6);
      id v8 = [MEMORY[0x263F088C8] indexPathForItem:v6 - v9 inSection:v5];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_engineIndexPathForControllerIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 section];
  uint64_t v6 = [v4 item];
  uint64_t v7 = [(NSArray *)self->_hiddenIndices objectAtIndexedSubscript:v5];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __72__REUIRelevanceEngineController__engineIndexPathForControllerIndexPath___block_invoke;
  v13[3] = &unk_2644B79B8;
  id v8 = v7;
  id v14 = v8;
  uint64_t v9 = (uint64_t (**)(void, void))MEMORY[0x223C2D7E0](v13);
  for (uint64_t i = v9[2](v9, 0); v6; --v6)
    i += v9[2](v9, i + 1) + 1;
  uint64_t v11 = [MEMORY[0x263F088C8] indexPathForItem:i inSection:v5];

  return v11;
}

uint64_t __72__REUIRelevanceEngineController__engineIndexPathForControllerIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  if (![*(id *)(a1 + 32) containsIndex:a2]) {
    return 0;
  }
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3010000000;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v11 = "";
  id v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__REUIRelevanceEngineController__engineIndexPathForControllerIndexPath___block_invoke_2;
  v7[3] = &unk_2644B7990;
  v7[4] = &v8;
  objc_msgSend(v4, "enumerateRangesInRange:options:usingBlock:", a2, 0x7FFFFFFFFFFFFFFFLL, 0, v7);
  uint64_t v5 = v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __72__REUIRelevanceEngineController__engineIndexPathForControllerIndexPath___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v4 = *(void *)(*(void *)(result + 32) + 8);
  *(void *)(v4 + 32) = a2;
  *(void *)(v4 + 40) = a3;
  *a4 = 1;
  return result;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(_WORD *)&self->_delegateCallbacks = *(_WORD *)&self->_delegateCallbacks & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      __int16 v5 = 2;
    }
    else {
      __int16 v5 = 0;
    }
    *(_WORD *)&self->_delegateCallbacks = *(_WORD *)&self->_delegateCallbacks & 0xFFFD | v5;
    if (objc_opt_respondsToSelector()) {
      __int16 v6 = 4;
    }
    else {
      __int16 v6 = 0;
    }
    *(_WORD *)&self->_delegateCallbacks = *(_WORD *)&self->_delegateCallbacks & 0xFFFB | v6;
    if (objc_opt_respondsToSelector()) {
      __int16 v7 = 8;
    }
    else {
      __int16 v7 = 0;
    }
    *(_WORD *)&self->_delegateCallbacks = *(_WORD *)&self->_delegateCallbacks & 0xFFF7 | v7;
    if (objc_opt_respondsToSelector()) {
      __int16 v8 = 16;
    }
    else {
      __int16 v8 = 0;
    }
    *(_WORD *)&self->_delegateCallbacks = *(_WORD *)&self->_delegateCallbacks & 0xFFEF | v8;
    if (objc_opt_respondsToSelector()) {
      __int16 v9 = 32;
    }
    else {
      __int16 v9 = 0;
    }
    *(_WORD *)&self->_delegateCallbacks = *(_WORD *)&self->_delegateCallbacks & 0xFFDF | v9;
    if (objc_opt_respondsToSelector()) {
      __int16 v10 = 64;
    }
    else {
      __int16 v10 = 0;
    }
    *(_WORD *)&self->_delegateCallbacks = *(_WORD *)&self->_delegateCallbacks & 0xFFBF | v10;
    if (objc_opt_respondsToSelector()) {
      __int16 v11 = 128;
    }
    else {
      __int16 v11 = 0;
    }
    *(_WORD *)&self->_delegateCallbacks = *(_WORD *)&self->_delegateCallbacks & 0xFF7F | v11;
    if (objc_opt_respondsToSelector()) {
      __int16 v12 = 256;
    }
    else {
      __int16 v12 = 0;
    }
    *(_WORD *)&self->_delegateCallbacks = *(_WORD *)&self->_delegateCallbacks & 0xFEFF | v12;
  }
}

- (unint64_t)numberOfSections
{
  return [(NSArray *)self->_sectionOrder count];
}

- (unint64_t)numberOfItemsInSectionAtIndex:(unint64_t)a3
{
  uint64_t v4 = [(REUIRelevanceEngineController *)self _sectionAtIndex:a3];
  __int16 v5 = [(NSMutableDictionary *)self->_currentElementStates objectForKeyedSubscript:v4];
  unint64_t v6 = [v5 count];

  return v6;
}

- (unint64_t)_numberOfItemsInSectionAtIndex:(unint64_t)a3
{
  engine = self->_engine;
  unint64_t v6 = -[REUIRelevanceEngineController _sectionAtIndex:](self, "_sectionAtIndex:");
  unint64_t v7 = [(RERelevanceEngine *)engine numberOfElementsInSection:v6];

  __int16 v8 = [(NSArray *)self->_hiddenIndices objectAtIndexedSubscript:a3];
  if ([v8 count] <= v7) {
    unint64_t v9 = v7 - [v8 count];
  }
  else {
    unint64_t v9 = 0;
  }

  return v9;
}

- (id)elementAtIndexPath:(id)a3
{
  uint64_t v4 = [(REUIRelevanceEngineController *)self _engineIndexPathForControllerIndexPath:a3];
  __int16 v5 = [(REUIRelevanceEngineController *)self _sectionPathForIndexPath:v4];
  unint64_t v6 = [(RERelevanceEngine *)self->_engine elementAtPath:v5];

  return v6;
}

- (id)contentAtIndexPath:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  __int16 v5 = -[REUIRelevanceEngineController _sectionAtIndex:](self, "_sectionAtIndex:", [v4 section]);
  unint64_t v6 = [v4 row];
  unint64_t v7 = [(NSMutableDictionary *)self->_currentElementStates objectForKeyedSubscript:v5];
  unint64_t v8 = [v7 count];

  if (v6 >= v8)
  {
    __int16 v11 = 0;
  }
  else
  {
    unint64_t v9 = [(NSMutableDictionary *)self->_currentElementStates objectForKeyedSubscript:v5];
    __int16 v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v4, "row"));

    __int16 v11 = [v10 content];
  }

  return v11;
}

- (id)indexPathForElementWithIdentifier:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  __int16 v5 = self->_currentElementStates;
  uint64_t v21 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v21)
  {
    uint64_t v6 = *(void *)v30;
    long long v23 = self;
    uint64_t v24 = v5;
    uint64_t v20 = *(void *)v30;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(v5);
        }
        uint64_t v8 = *(void *)(*((void *)&v29 + 1) + 8 * v7);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v22 = v8;
        unint64_t v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_currentElementStates, "objectForKeyedSubscript:");
        uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = 0;
          uint64_t v13 = *(void *)v26;
          while (2)
          {
            uint64_t v14 = 0;
            uint64_t v15 = v12 + v11;
            do
            {
              if (*(void *)v26 != v13) {
                objc_enumerationMutation(v9);
              }
              v16 = [*(id *)(*((void *)&v25 + 1) + 8 * v14) identifier];
              char v17 = [v16 isEqualToString:v4];

              if (v17)
              {
                v18 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", v12 + v14, -[REUIRelevanceEngineController _indexForSection:](v23, "_indexForSection:", v22));

                __int16 v5 = v24;
                goto LABEL_19;
              }
              ++v14;
            }
            while (v11 != v14);
            uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
            uint64_t v12 = v15;
            if (v11) {
              continue;
            }
            break;
          }
        }

        ++v7;
        uint64_t v6 = v20;
        self = v23;
        __int16 v5 = v24;
      }
      while (v7 != v21);
      v18 = 0;
      uint64_t v21 = [(NSMutableDictionary *)v24 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v21);
  }
  else
  {
    v18 = 0;
  }
LABEL_19:

  return v18;
}

- (id)generateDiffableSnapshot
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  objc_super v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_sectionOrder;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v17 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v9 = v17;
        uint64_t v10 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v17, 1, (void)v13);
        [v3 appendSectionsWithIdentifiers:v10];

        uint64_t v11 = [(NSMutableDictionary *)self->_currentElementStates objectForKeyedSubscript:v9];
        [v3 appendItemsWithIdentifiers:v11];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_contentAtIndexPath:(id)a3
{
  id v4 = [(REUIRelevanceEngineController *)self _elementAtIndexPath:a3];
  uint64_t v5 = [(REUIRelevanceEngineController *)self _contentForElement:v4];

  return v5;
}

- (id)actionAtIndexPath:(id)a3
{
  objc_super v3 = [(REUIRelevanceEngineController *)self elementAtIndexPath:a3];
  id v4 = [v3 action];

  return v4;
}

- (id)identifierForElementAtIndexPath:(id)a3
{
  objc_super v3 = [(REUIRelevanceEngineController *)self elementAtIndexPath:a3];
  id v4 = [v3 identifier];

  return v4;
}

- (id)predictionForElementAtIndexPath:(id)a3
{
  id v4 = [(REUIRelevanceEngineController *)self _engineIndexPathForControllerIndexPath:a3];
  uint64_t v5 = [(REUIRelevanceEngineController *)self _sectionPathForIndexPath:v4];
  uint64_t v6 = [(RERelevanceEngine *)self->_engine predictionForElementAtPath:v5];

  return v6;
}

- (id)elementIdentifierAtIndexPath:(id)a3
{
  objc_super v3 = [(REUIRelevanceEngineController *)self elementAtIndexPath:a3];
  id v4 = [v3 identifier];

  return v4;
}

- (id)_indexPathForElementWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy_;
  uint64_t v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  long long v13 = __68__REUIRelevanceEngineController__indexPathForElementWithIdentifier___block_invoke;
  long long v14 = &unk_2644B79E0;
  id v5 = v4;
  id v15 = v5;
  long long v16 = &v17;
  [(REUIRelevanceEngineController *)self _enumerateEngineElementsWithOptions:0 usingBlock:&v11];
  if (v18[5])
  {
    uint64_t v6 = -[REUIRelevanceEngineController _controllerIndexPathForEngineIndexPath:](self, "_controllerIndexPathForEngineIndexPath:", v11, v12, v13, v14);
    uint64_t v7 = (void *)v18[5];
    v18[5] = v6;

    uint64_t v8 = (void *)v18[5];
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  _Block_object_dispose(&v17, 8);

  return v9;
}

void __68__REUIRelevanceEngineController__indexPathForElementWithIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  uint64_t v6 = [a3 identifier];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (id)metadataForElementWithIdentifier:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = [(REUIRelevanceEngineController *)self indexPathForElementWithIdentifier:v4];

  if (v5)
  {
    uint64_t v6 = -[REUIRelevanceEngineController _sectionAtIndex:](self, "_sectionAtIndex:", [v5 section]);
    int v7 = [(NSMutableDictionary *)self->_currentElementStates objectForKeyedSubscript:v6];
    id v8 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v5, "row"));

    if (v8)
    {
      uint64_t v12 = @"REMetadataBundleIdentifierKey";
      id v9 = [v8 bundleIdentifier];
      v13[0] = v9;
      uint64_t v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (NSSet)disabledDataSources
{
  v2 = (void *)[(NSMutableSet *)self->_hiddenBundleIdentifiers copy];

  return (NSSet *)v2;
}

- (BOOL)isDataSourceEnabled:(id)a3
{
  return [(NSMutableSet *)self->_hiddenBundleIdentifiers containsObject:a3] ^ 1;
}

- (void)setDataSource:(id)a3 enabled:(BOOL)a4
{
  int v4 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = [(REUIRelevanceEngineController *)self isDataSourceEnabled:v6];
  id v8 = RELogForDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = @"disabled";
    *(_DWORD *)buf = 138412802;
    long long v16 = self;
    __int16 v17 = 2112;
    if (v4) {
      id v9 = @"enabled";
    }
    v18 = v9;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_21E651000, v8, OS_LOG_TYPE_DEFAULT, "%@ %@ %@", buf, 0x20u);
  }

  if (v7 != v4)
  {
    if (v4) {
      [(NSMutableSet *)self->_hiddenBundleIdentifiers removeObject:v6];
    }
    engine = self->_engine;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __55__REUIRelevanceEngineController_setDataSource_enabled___block_invoke;
    v12[3] = &unk_2644B7A30;
    v12[4] = self;
    id v11 = v6;
    id v13 = v11;
    char v14 = v4;
    [(REUIRelevanceEngineController *)self relevanceEngine:engine performBatchUpdateBlock:v12 completion:&__block_literal_global];
    if ((v4 & 1) == 0) {
      [(NSMutableSet *)self->_hiddenBundleIdentifiers addObject:v11];
    }
    [(RERelevanceEnginePreferences *)self->_preferences setDisabledDataSourceIdentifiers:self->_hiddenBundleIdentifiers];
  }
}

void __55__REUIRelevanceEngineController_setDataSource_enabled___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__REUIRelevanceEngineController_setDataSource_enabled___block_invoke_2;
  v5[3] = &unk_2644B7A08;
  v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  char v8 = *(unsigned char *)(a1 + 48);
  [v2 _enumerateEngineElementsWithOptions:0 usingBlock:v5];
}

void __55__REUIRelevanceEngineController_setDataSource_enabled___block_invoke_2(uint64_t a1, void *a2, void *a3, int a4)
{
  id v11 = a2;
  id v7 = a3;
  char v8 = [v7 bundleIdentifier];
  if ([v8 isEqualToString:*(void *)(a1 + 32)])
  {
    char v9 = [*(id *)(a1 + 40) _isElementHidden:v7];

    if ((v9 & 1) == 0)
    {
      int v10 = *(unsigned __int8 *)(a1 + 48);
      if (v10 == a4) {
        [*(id *)(a1 + 40) _setElement:v7 atIndexPath:v11 hidden:v10 == 0];
      }
    }
  }
  else
  {
  }
}

- (void)setAllowsLocationUse:(BOOL)a3
{
  if (self->_allowsLocationUse != a3)
  {
    self->_allowsLocationUse = a3;
    unint64_t v4 = [(RERelevanceEnginePreferences *)self->_preferences mode] & 0xFFFFFFFFFFFFFFFELL | a3;
    preferences = self->_preferences;
    [(RERelevanceEnginePreferences *)preferences setMode:v4];
  }
}

- (void)setWantsLiveDataSources:(BOOL)a3
{
  if (self->_wantsLiveDataSources != a3)
  {
    BOOL v3 = a3;
    self->_wantsLiveDataSources = a3;
    unint64_t v5 = [(RERelevanceEnginePreferences *)self->_preferences mode] & 0xFFFFFFFFFFFFFFFDLL;
    uint64_t v6 = 2;
    if (!v3) {
      uint64_t v6 = 0;
    }
    preferences = self->_preferences;
    [(RERelevanceEnginePreferences *)preferences setMode:v5 | v6];
  }
}

- (REUITrainingContext)trainingContext
{
  return (REUITrainingContext *)self->_trainingContext;
}

- (void)makeCurrent
{
  [(REUIRelevanceEngineController *)self setWantsLiveDataSources:1];
  trainingContext = self->_trainingContext;

  [(RETrainingContext *)trainingContext becomeCurrent];
}

- (void)resignCurrent
{
  [(REUIRelevanceEngineController *)self setWantsLiveDataSources:0];
  if ([(REUITrainingContext *)self->_trainingContext resetsWhenResignsCurrent])
  {
    trainingContext = self->_trainingContext;
    [(REUITrainingContext *)trainingContext resetContext];
  }
}

- (id)predictedContentForSectionAtIndex:(unint64_t)a3 atDate:(id)a4 limit:(int64_t)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v6 = [(REUIRelevanceEngineController *)self predictedElementsForSectionAtIndex:a3 atDate:a4 limit:a5];
  id v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = -[REUIRelevanceEngineController _contentForElement:](self, "_contentForElement:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  char v14 = (void *)[v7 copy];

  return v14;
}

- (id)predictedElementsForSectionAtIndex:(unint64_t)a3 atDate:(id)a4 limit:(int64_t)a5
{
  id v8 = a4;
  if ((unint64_t)a5 >= 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v9 = a5;
  }
  uint64_t v10 = (void *)MEMORY[0x263EFF980];
  unint64_t v11 = [(REUIRelevanceEngineController *)self _numberOfItemsInSectionAtIndex:a3];
  if (v9 >= v11) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = v9;
  }
  id v13 = [v10 arrayWithCapacity:v12];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __81__REUIRelevanceEngineController_predictedElementsForSectionAtIndex_atDate_limit___block_invoke;
  v18[3] = &unk_2644B7A78;
  id v20 = v8;
  unint64_t v21 = v9;
  id v19 = v13;
  id v14 = v8;
  id v15 = v13;
  [(REUIRelevanceEngineController *)self _enumerateEngineElementsInSection:a3 withOptions:0 usingBlock:v18];
  long long v16 = (void *)[v15 copy];

  return v16;
}

void __81__REUIRelevanceEngineController_predictedElementsForSectionAtIndex_atDate_limit___block_invoke(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ((unint64_t)[*(id *)(a1 + 32) count] < *(void *)(a1 + 48) && (a4 & 1) == 0)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v17 = v6;
    id v7 = [v6 relevanceProviders];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      while (2)
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          unint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v13 = v12;
            id v14 = [v13 irrelevantDate];
            id v15 = [v14 laterDate:*(void *)(a1 + 40)];
            char v16 = [v15 isEqualToDate:*(void *)(a1 + 40)];

            if (v16)
            {

              id v6 = v17;
              goto LABEL_14;
            }
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    id v6 = v17;
    [*(id *)(a1 + 32) addObject:v17];
  }
LABEL_14:
}

- (void)_loadNewRelevanceEngine:(id)a3 withCompletion:(id)a4
{
  id v6 = (RERelevanceEngine *)a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v9 = self->_engine;
  uint64_t v10 = [v8 dictionary];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __72__REUIRelevanceEngineController__loadNewRelevanceEngine_withCompletion___block_invoke;
  v22[3] = &unk_2644B7AA0;
  id v11 = v10;
  id v23 = v11;
  [(REUIRelevanceEngineController *)self _enumerateEngineElementsWithOptions:0 usingBlock:v22];
  [(RERelevanceEngine *)v9 removeObserver:self];
  engine = self->_engine;
  self->_engine = v6;
  id v13 = v6;

  [(RERelevanceEngine *)self->_engine addObserver:self];
  id v14 = self->_engine;
  id v18 = v7;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __72__REUIRelevanceEngineController__loadNewRelevanceEngine_withCompletion___block_invoke_2;
  v19[3] = &unk_2644B7B10;
  id v20 = v11;
  long long v21 = self;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __72__REUIRelevanceEngineController__loadNewRelevanceEngine_withCompletion___block_invoke_5;
  v17[3] = &unk_2644B7B38;
  id v15 = v7;
  id v16 = v11;
  [(REUIRelevanceEngineController *)self relevanceEngine:v14 performBatchUpdateBlock:v19 completion:v17];
}

uint64_t __72__REUIRelevanceEngineController__loadNewRelevanceEngine_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

void __72__REUIRelevanceEngineController__loadNewRelevanceEngine_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) allKeys];
  BOOL v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_52];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v10 = *(void **)(a1 + 40);
        id v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
        unint64_t v12 = [v10 _contentForElement:v11];

        id v13 = [*(id *)(a1 + 40) delegate];
        [v13 engineController:*(void *)(a1 + 40) didRemoveContent:v12 atIndexPath:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);
  }

  uint64_t v14 = *(void *)(a1 + 40);
  id v15 = *(void **)(v14 + 32);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __72__REUIRelevanceEngineController__loadNewRelevanceEngine_withCompletion___block_invoke_4;
  v23[3] = &unk_2644B7AE8;
  v23[4] = v14;
  [v15 enumerateObjectsUsingBlock:v23];
  if ([*(id *)(a1 + 40) numberOfSections])
  {
    unint64_t v16 = 0;
    do
    {
      uint64_t v17 = [*(id *)(a1 + 40) _numberOfItemsInSectionAtIndex:v16];
      if (v17)
      {
        uint64_t v18 = v17;
        for (uint64_t j = 0; j != v18; ++j)
        {
          id v20 = [MEMORY[0x263F088C8] indexPathForItem:j inSection:v16];
          long long v21 = [*(id *)(a1 + 40) _contentAtIndexPath:v20];
          id v22 = [*(id *)(a1 + 40) delegate];
          [v22 engineController:*(void *)(a1 + 40) didInsertContent:v21 atIndexPath:v20];
        }
      }
      ++v16;
    }
    while (v16 < [*(id *)(a1 + 40) numberOfSections]);
  }
}

uint64_t __72__REUIRelevanceEngineController__loadNewRelevanceEngine_withCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

void __72__REUIRelevanceEngineController__loadNewRelevanceEngine_withCompletion___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v13 = a2;
  [v13 removeAllIndexes];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 88) objectAtIndexedSubscript:a3];
  [*(id *)(*(void *)(a1 + 32) + 16) setObject:MEMORY[0x263EFFA68] forKeyedSubscript:v5];
  uint64_t v6 = [*(id *)(a1 + 32) _sectionSupportingNoContentElements];
  if ([v5 isEqualToString:v6]) {
    *(unsigned char *)(*(void *)(a1 + 32) + 72) = [*(id *)(a1 + 32) _sectionHasContent:v6];
  }
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 80) numberOfElementsInSection:v5];
  uint64_t v8 = [MEMORY[0x263EFF980] array];
  if (v7)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F62D98]) initWithSectionName:v5 element:i];
      id v11 = [*(id *)(*(void *)(a1 + 32) + 80) elementAtPath:v10];
      if ([*(id *)(a1 + 32) _isElementHidden:v11]) {
        [v13 addIndex:i];
      }
      else {
        [v8 addObject:v11];
      }
    }
  }
  unint64_t v12 = (void *)[v8 copy];
  [*(id *)(*(void *)(a1 + 32) + 16) setObject:v12 forKeyedSubscript:v5];
}

uint64_t __72__REUIRelevanceEngineController__loadNewRelevanceEngine_withCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_sectionSupportingNoContentElements
{
  return (id)*MEMORY[0x263F62DC0];
}

- (BOOL)_sectionHasContent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSArray *)self->_hiddenIndices objectAtIndexedSubscript:[(REUIRelevanceEngineController *)self _indexForSection:v4]];
  uint64_t v6 = [(RERelevanceEngine *)self->_engine numberOfElementsInSection:v4];
  if (v6)
  {
    unint64_t v7 = v6;
    uint64_t v8 = 0;
    BOOL v9 = 1;
    do
    {
      if (([v5 containsIndex:v8] & 1) == 0)
      {
        uint64_t v10 = [MEMORY[0x263F62D98] sectionPathWithSectionName:v4 element:v8];
        id v11 = [(RERelevanceEngine *)self->_engine elementAtPath:v10];
        int v12 = [v11 isNoContentElement];

        if (!v12) {
          break;
        }
      }
      BOOL v9 = ++v8 < v7;
    }
    while (v7 != v8);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_contentForElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_wantsIdealizedContent)
  {
    uint64_t v6 = [v4 idealizedContent];
    unint64_t v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [v5 content];
    }
    BOOL v9 = v8;
  }
  else
  {
    BOOL v9 = [v4 content];
  }

  return v9;
}

- (void)_enumerateEngineElementsInSection:(unint64_t)a3 withOptions:(unint64_t)a4 usingBlock:(id)a5
{
  id v8 = a5;
  if (v8 && self->_engine)
  {
    BOOL v9 = [(NSArray *)self->_hiddenIndices objectAtIndexedSubscript:a3];
    uint64_t v10 = (void *)MEMORY[0x263F088D0];
    engine = self->_engine;
    int v12 = [(REUIRelevanceEngineController *)self _sectionAtIndex:a3];
    id v13 = objc_msgSend(v10, "indexSetWithIndexesInRange:", 0, -[RERelevanceEngine numberOfElementsInSection:](engine, "numberOfElementsInSection:", v12));

    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __90__REUIRelevanceEngineController__enumerateEngineElementsInSection_withOptions_usingBlock___block_invoke;
    v15[3] = &unk_2644B7B60;
    unint64_t v18 = a3;
    v15[4] = self;
    id v16 = v9;
    id v17 = v8;
    id v14 = v9;
    [v13 enumerateIndexesWithOptions:a4 usingBlock:v15];
  }
}

void __90__REUIRelevanceEngineController__enumerateEngineElementsInSection_withOptions_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v8 = [MEMORY[0x263F088C8] indexPathForItem:a2 inSection:*(void *)(a1 + 56)];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = (void *)v4[10];
  uint64_t v6 = [v4 _sectionPathForIndexPath:v8];
  unint64_t v7 = [v5 elementAtPath:v6];

  [*(id *)(a1 + 40) containsIndex:a2];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_enumerateEngineElementsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  unint64_t v7 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, -[NSArray count](self->_sectionOrder, "count"));
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __80__REUIRelevanceEngineController__enumerateEngineElementsWithOptions_usingBlock___block_invoke;
  v9[3] = &unk_2644B7B88;
  id v10 = v6;
  unint64_t v11 = a3;
  v9[4] = self;
  id v8 = v6;
  [v7 enumerateIndexesWithOptions:a3 usingBlock:v9];
}

uint64_t __80__REUIRelevanceEngineController__enumerateEngineElementsWithOptions_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _enumerateEngineElementsInSection:a2 withOptions:*(void *)(a1 + 48) usingBlock:*(void *)(a1 + 40)];
}

- (void)_setElement:(id)a3 atIndexPath:(id)a4 hidden:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v9 = [(REUIRelevanceEngineController *)self _sectionPathForIndexPath:a4];
  id v11 = (id)v9;
  if (v5) {
    +[REUIRelevanceEngineControllerUpdateOperation hideElement:v8 atPath:v9];
  }
  else {
  id v10 = +[REUIRelevanceEngineControllerUpdateOperation showElement:v8 atPath:v9];
  }

  [(REUIRelevanceEngineController *)self _performOrEnqueueOperation:v10];
}

- (BOOL)_isElementHidden:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 bundleIdentifier];
  if ([(REUIRelevanceEngineController *)self isDataSourceEnabled:v5])
  {
    if (self->_isShowingContentElements) {
      char v6 = [v4 isNoContentElement];
    }
    else {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (void)_performOrEnqueueOperation:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (self->_performingBatch)
  {
    [(NSMutableArray *)self->_pendingOperations addObject:v4];
  }
  else
  {
    BOOL v5 = [v4 path];
    char v6 = [v5 sectionName];
    int64_t v7 = [(REUIRelevanceEngineController *)self _indexForSection:v6];

    v9[0] = v4;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
    [(REUIRelevanceEngineController *)self _performOperations:v8 toSection:v7];
  }
}

- (void)_performBatchUpdateUsingBlock:(id)a3 completion:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  char v6 = (void (**)(void))a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __74__REUIRelevanceEngineController__performBatchUpdateUsingBlock_completion___block_invoke;
  v42[3] = &unk_2644B7B38;
  id v8 = v7;
  id v43 = v8;
  uint64_t v9 = (void (**)(void))MEMORY[0x223C2D7E0](v42);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v11 = WeakRetained;
  if ((*(_WORD *)&self->_delegateCallbacks & 1) != 0 && WeakRetained)
  {
    id v32 = WeakRetained;
    self->_performingBatch = 1;
    if (v6) {
      v6[2](v6);
    }
    objc_super v33 = v9;
    v34 = v6;
    id v31 = v8;
    self->_performingBatch = 0;
    int v12 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", &self->_delegate);
    id v13 = (void *)[(NSMutableArray *)self->_pendingOperations copy];
    long long v30 = self;
    [(NSMutableArray *)self->_pendingOperations removeAllObjects];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v39;
      char v18 = 1;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v39 != v17) {
            objc_enumerationMutation(v14);
          }
          id v20 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          long long v21 = [v20 path];
          id v22 = [v21 sectionName];

          id v23 = [v12 objectForKeyedSubscript:v22];

          if (!v23)
          {
            long long v24 = [MEMORY[0x263EFF980] array];
            [v12 setObject:v24 forKeyedSubscript:v22];
          }
          if ([v20 type] && objc_msgSend(v20, "type") != 4
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            char v18 = 0;
          }
          long long v25 = [v12 objectForKeyedSubscript:v22];
          [v25 addObject:v20];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v16);
    }
    else
    {
      char v18 = 1;
    }

    if ([v12 count] && objc_msgSend(v14, "count"))
    {
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __74__REUIRelevanceEngineController__performBatchUpdateUsingBlock_completion___block_invoke_2;
      v35[3] = &unk_2644B7B10;
      id v36 = v12;
      v37 = v30;
      uint64_t v26 = MEMORY[0x223C2D7E0](v35);
      long long v27 = (void *)v26;
      uint64_t v9 = v33;
      char v6 = v34;
      id v11 = v32;
      if (v18 & 1) == 0 && (*(_WORD *)&v30->_delegateCallbacks)
      {
        id v28 = objc_loadWeakRetained(location);
        id v8 = v31;
        [v28 engineController:v30 performBatchUpdateBlock:v27 completion:v31];
      }
      else
      {
        (*(void (**)(uint64_t))(v26 + 16))(v26);
        id v8 = v31;
        if (v33) {
          v33[2](v33);
        }
      }
    }
    else
    {
      uint64_t v9 = v33;
      char v6 = v34;
      id v8 = v31;
      id v11 = v32;
      if (v33) {
        v33[2](v33);
      }
    }
  }
  else
  {
    if (v6) {
      v6[2](v6);
    }
    if (v9) {
      v9[2](v9);
    }
  }
}

uint64_t __74__REUIRelevanceEngineController__performBatchUpdateUsingBlock_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __74__REUIRelevanceEngineController__performBatchUpdateUsingBlock_completion___block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __74__REUIRelevanceEngineController__performBatchUpdateUsingBlock_completion___block_invoke_3;
  v3[3] = &unk_2644B7BB0;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateKeysAndObjectsUsingBlock:v3];
}

void __74__REUIRelevanceEngineController__performBatchUpdateUsingBlock_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v5 = *(void **)(a1 + 32);
  id v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_performOperations:toSection:", v6, objc_msgSend(v5, "_indexForSection:", a2));
}

- (void)_performOperations:(id)a3 toSection:(unint64_t)a4
{
  uint64_t v128 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  BOOL v5 = [MEMORY[0x263F089C8] indexSet];
  v96 = [MEMORY[0x263F089C8] indexSet];
  id v6 = [MEMORY[0x263EFF9A0] dictionary];
  v94 = [MEMORY[0x263EFF9A0] dictionary];
  v90 = [MEMORY[0x263EFF9C0] set];
  v88 = [MEMORY[0x263EFF9C0] set];
  v86 = [MEMORY[0x263EFF9C0] set];
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v119 objects:v127 count:16];
  v92 = v5;
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v120;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v120 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v119 + 1) + 8 * i);
        int v12 = [v11 path];
        uint64_t v13 = [v12 element];

        id v14 = [v11 element];
        uint64_t v15 = [v14 identifier];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v16 = [v11 updateType];
          if (v16 == 1)
          {
            [v96 addIndex:v13];
            uint64_t v17 = [v11 element];
            char v18 = [NSNumber numberWithUnsignedInteger:v13];
            long long v19 = v94;
          }
          else
          {
            if (v16 != 2) {
              goto LABEL_12;
            }
            [v5 addIndex:v13];
            uint64_t v17 = [v11 element];
            char v18 = [NSNumber numberWithUnsignedInteger:v13];
            long long v19 = v6;
          }
          [v19 setObject:v17 forKeyedSubscript:v18];

          BOOL v5 = v92;
        }
LABEL_12:
        uint64_t v20 = [v11 type];
        switch(v20)
        {
          case 1:
            [v5 addIndex:v13];
            long long v30 = [v11 element];
            id v31 = [NSNumber numberWithUnsignedInteger:v13];
            [v6 setObject:v30 forKeyedSubscript:v31];

            id v23 = v88;
            break;
          case 3:
            [v86 addObject:v15];
            [v5 addIndex:v13];
            long long v24 = [v11 element];
            long long v25 = [NSNumber numberWithUnsignedInteger:v13];
            [v6 setObject:v24 forKeyedSubscript:v25];

            uint64_t v26 = [v11 movedToPath];
            uint64_t v27 = [v26 element];

            [v96 addIndex:v27];
            id v28 = [v11 element];
            uint64_t v29 = [NSNumber numberWithUnsignedInteger:v27];
            [v94 setObject:v28 forKeyedSubscript:v29];

            goto LABEL_19;
          case 2:
            [v96 addIndex:v13];
            long long v21 = [v11 element];
            id v22 = [NSNumber numberWithUnsignedInteger:v13];
            [v94 setObject:v21 forKeyedSubscript:v22];

            id v23 = v90;
            break;
          default:
            goto LABEL_19;
        }
        [v23 addObject:v15];
LABEL_19:
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v119 objects:v127 count:16];
    }
    while (v8);
  }

  id v32 = [MEMORY[0x263EFF9A0] dictionary];
  unint64_t v33 = a4;
  v34 = [(NSArray *)self->_hiddenIndices objectAtIndexedSubscript:a4];
  v111[0] = MEMORY[0x263EF8330];
  v111[1] = 3221225472;
  v111[2] = __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke;
  v111[3] = &unk_2644B7BD8;
  unint64_t v118 = a4;
  id v83 = v6;
  id v112 = v83;
  v113 = self;
  id v35 = v86;
  id v114 = v35;
  id v36 = v32;
  id v115 = v36;
  id v37 = v34;
  id v116 = v37;
  id v89 = v88;
  id v117 = v89;
  [v5 enumerateIndexesWithOptions:2 usingBlock:v111];
  v103[0] = MEMORY[0x263EF8330];
  v103[1] = 3221225472;
  v103[2] = __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke_58;
  v103[3] = &unk_2644B7BD8;
  unint64_t v110 = a4;
  id v95 = v94;
  id v104 = v95;
  id v87 = v35;
  id v105 = v87;
  id v91 = v90;
  id v106 = v91;
  v107 = self;
  id v38 = v37;
  id v108 = v38;
  id v82 = v36;
  id v109 = v82;
  [v96 enumerateIndexesUsingBlock:v103];
  long long v39 = [(REUIRelevanceEngineController *)self _sectionSupportingNoContentElements];
  long long v40 = [(REUIRelevanceEngineController *)self _sectionAtIndex:a4];
  LODWORD(v37) = [v40 isEqualToString:v39];

  if (v37)
  {
    BOOL v41 = [(REUIRelevanceEngineController *)self _sectionHasContent:v39];
    if (self->_isShowingContentElements != v41)
    {
      BOOL v42 = v41;
      self->_isShowingContentElements = v41;
      id v43 = RELogForDomain();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        v44 = @"no content";
        if (v42) {
          v44 = @"content";
        }
        *(_DWORD *)buf = 134218242;
        v124 = self;
        __int16 v125 = 2114;
        v126 = v44;
        _os_log_impl(&dword_21E651000, v43, OS_LOG_TYPE_INFO, "%p Showing %{public}@ state.", buf, 0x16u);
      }

      if (v42) {
        uint64_t v45 = 2;
      }
      else {
        uint64_t v45 = 0;
      }
      v46 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, -[RERelevanceEngine numberOfElementsInSection:](self->_engine, "numberOfElementsInSection:", v39));
      v98[0] = MEMORY[0x263EF8330];
      v98[1] = 3221225472;
      v98[2] = __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke_65;
      v98[3] = &unk_2644B7C00;
      id v99 = v39;
      v100 = self;
      id v101 = v38;
      BOOL v102 = v42;
      [v46 enumerateIndexesWithOptions:v45 usingBlock:v98];
    }
  }
  v47 = [(REUIRelevanceEngineController *)self _sectionAtIndex:a4];
  v48 = [(NSMutableDictionary *)self->_currentElementStates objectForKeyedSubscript:v47];
  uint64_t v49 = [v48 copy];
  v50 = (void *)v49;
  v51 = (void *)MEMORY[0x263EFFA68];
  if (v49) {
    v51 = (void *)v49;
  }
  id v52 = v51;

  unint64_t v53 = [(REUIRelevanceEngineController *)self _numberOfItemsInSectionAtIndex:a4];
  v54 = [MEMORY[0x263EFF980] arrayWithCapacity:v53];
  if (v53)
  {
    for (uint64_t j = 0; j != v53; ++j)
    {
      v56 = [MEMORY[0x263F088C8] indexPathForItem:j inSection:v33];
      v57 = [(REUIRelevanceEngineController *)self elementAtIndexPath:v56];
      [v54 addObject:v57];

      unint64_t v33 = a4;
    }
  }
  v58 = (void *)[v54 copy];
  [(NSMutableDictionary *)self->_currentElementStates setObject:v58 forKeyedSubscript:v47];

  v59 = RELogForDomain();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
  {
    v60 = NSStringFromSelector(sel_identifier);
    v61 = [v52 valueForKeyPath:v60];
    v62 = [v61 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 134218242;
    v124 = self;
    __int16 v125 = 2114;
    v126 = v62;
    _os_log_impl(&dword_21E651000, v59, OS_LOG_TYPE_INFO, "%p Performing operations with original content: %{public}@", buf, 0x16u);

    unint64_t v33 = a4;
  }

  v63 = RELogForDomain();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
  {
    v64 = NSStringFromSelector(sel_identifier);
    v65 = [v54 valueForKeyPath:v64];
    v66 = [v65 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 134218242;
    v124 = self;
    __int16 v125 = 2114;
    v126 = v66;
    _os_log_impl(&dword_21E651000, v63, OS_LOG_TYPE_INFO, "%p Performing operations with current content: %{public}@", buf, 0x16u);

    unint64_t v33 = a4;
  }

  v67 = [MEMORY[0x263F62D38] diffFromElements:v52 toElements:v54 equalComparator:&__block_literal_global_75 hashGenerator:&__block_literal_global_78 changeComparator:&__block_literal_global_80];
  v68 = RELogForDomain();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG)) {
    -[REUIRelevanceEngineController _performOperations:toSection:]((uint64_t)self, v68, v69, v70, v71, v72, v73, v74);
  }

  v97[0] = MEMORY[0x263EF8330];
  v97[1] = 3221225472;
  v97[2] = __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke_81;
  v97[3] = &unk_2644B7C68;
  v97[4] = self;
  v97[5] = v33;
  [v67 enumerateOperationsUsingBlock:v97];
  v75 = RELogForDomain();
  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG)) {
    -[REUIRelevanceEngineController _performOperations:toSection:]((uint64_t)self, v75, v76, v77, v78, v79, v80, v81);
  }
}

void __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = [MEMORY[0x263F088C8] indexPathForItem:a2 inSection:*(void *)(a1 + 80)];
  BOOL v5 = *(void **)(a1 + 32);
  id v6 = [NSNumber numberWithUnsignedInteger:a2];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  uint64_t v8 = [v7 identifier];
  uint64_t v9 = [*(id *)(a1 + 40) _controllerIndexPathForEngineIndexPath:v4];
  if ([*(id *)(a1 + 48) containsObject:v8])
  {
    [*(id *)(a1 + 56) setObject:v9 forKeyedSubscript:v8];
    id v10 = RELogForDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      int v18 = 134218754;
      uint64_t v19 = v11;
      __int16 v20 = 2114;
      long long v21 = v8;
      __int16 v22 = 2114;
      id v23 = v9;
      __int16 v24 = 2114;
      long long v25 = v4;
      int v12 = "%p Removing (through move) %{public}@ at index path %{public}@ (mapped from %{public}@).";
      uint64_t v13 = v10;
      uint32_t v14 = 42;
LABEL_7:
      _os_log_impl(&dword_21E651000, v13, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v18, v14);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if ([*(id *)(a1 + 72) containsObject:v8])
  {
    id v10 = RELogForDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      int v18 = 134218242;
      uint64_t v19 = v15;
      __int16 v20 = 2114;
      long long v21 = v8;
      int v12 = "%p Removing %{public}@ (in removed elements).";
      uint64_t v13 = v10;
      uint32_t v14 = 22;
      goto LABEL_7;
    }
LABEL_8:

    objc_msgSend(*(id *)(a1 + 64), "shiftIndexesStartingAtIndex:by:", objc_msgSend(v4, "item") + 1, -1);
    goto LABEL_9;
  }
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 64), "addIndex:", objc_msgSend(v4, "item"));
    uint64_t v16 = RELogForDomain();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = *(void *)(a1 + 40);
      int v18 = 134218754;
      uint64_t v19 = v17;
      __int16 v20 = 2114;
      long long v21 = v8;
      __int16 v22 = 2114;
      id v23 = v9;
      __int16 v24 = 2114;
      long long v25 = v4;
      _os_log_impl(&dword_21E651000, v16, OS_LOG_TYPE_INFO, "%p Hiding %{public}@ at index path %{public}@ (mapped from %{public}@; path removed).",
        (uint8_t *)&v18,
        0x2Au);
    }
  }
LABEL_9:
}

void __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke_58(uint64_t a1, uint64_t a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = [MEMORY[0x263F088C8] indexPathForItem:a2 inSection:*(void *)(a1 + 80)];
  BOOL v5 = *(void **)(a1 + 32);
  id v6 = [NSNumber numberWithUnsignedInteger:a2];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  uint64_t v8 = [v7 identifier];
  if (([*(id *)(a1 + 40) containsObject:v8] & 1) != 0
    || [*(id *)(a1 + 48) containsObject:v8])
  {
    uint64_t v9 = RELogForDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke_58_cold_1(a1, (uint64_t)v8, v9);
    }

    objc_msgSend(*(id *)(a1 + 64), "shiftIndexesStartingAtIndex:by:", objc_msgSend(v4, "item"), 1);
  }
  id v10 = RELogForDomain();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(a1 + 56);
    int v17 = 134218242;
    uint64_t v18 = v11;
    __int16 v19 = 2114;
    __int16 v20 = v8;
    _os_log_impl(&dword_21E651000, v10, OS_LOG_TYPE_INFO, "%p Showing %{public}@.", (uint8_t *)&v17, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 64), "removeIndex:", objc_msgSend(v4, "item"));
  int v12 = [*(id *)(a1 + 56) _controllerIndexPathForEngineIndexPath:v4];
  if ([*(id *)(a1 + 40) containsObject:v8])
  {
    uint64_t v13 = [*(id *)(a1 + 72) objectForKeyedSubscript:v8];
    if (!v13)
    {
      uint32_t v14 = RELogForDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = *(void *)(a1 + 56);
        int v17 = 134219010;
        uint64_t v18 = v15;
        __int16 v19 = 2114;
        __int16 v20 = v8;
        __int16 v21 = 2114;
        __int16 v22 = 0;
        __int16 v23 = 2114;
        __int16 v24 = v12;
        __int16 v25 = 2114;
        uint64_t v26 = v4;
        _os_log_impl(&dword_21E651000, v14, OS_LOG_TYPE_INFO, "%p Ignoring move of %{public}@ from index path %{public}@ to index path %{public}@ (mapped from %{public}@).", (uint8_t *)&v17, 0x34u);
      }

      objc_msgSend(*(id *)(a1 + 64), "addIndex:", objc_msgSend(v4, "item"));
    }
LABEL_17:

    goto LABEL_18;
  }
  if ([*(id *)(a1 + 48) containsObject:v8]
    && [*(id *)(a1 + 56) _isElementHidden:v7])
  {
    objc_msgSend(*(id *)(a1 + 64), "addIndex:", objc_msgSend(v4, "item"));
    uint64_t v13 = RELogForDomain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = *(void *)(a1 + 56);
      int v17 = 134218754;
      uint64_t v18 = v16;
      __int16 v19 = 2114;
      __int16 v20 = v8;
      __int16 v21 = 2114;
      __int16 v22 = v12;
      __int16 v23 = 2114;
      __int16 v24 = v4;
      _os_log_impl(&dword_21E651000, v13, OS_LOG_TYPE_INFO, "%p Filtering %{public}@ at index path %{public}@ (mapped from %{public}@).", (uint8_t *)&v17, 0x2Au);
    }
    goto LABEL_17;
  }
LABEL_18:
}

void __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke_65(uint64_t a1, uint64_t a2)
{
  id v4 = [MEMORY[0x263F62D98] sectionPathWithSectionName:*(void *)(a1 + 32) element:a2];
  BOOL v5 = [*(id *)(*(void *)(a1 + 40) + 80) elementAtPath:v4];
  if ([v5 isNoContentElement]
    && *(unsigned __int8 *)(a1 + 56) != [*(id *)(a1 + 48) containsIndex:a2])
  {
    id v6 = *(void **)(a1 + 48);
    if (*(unsigned char *)(a1 + 56))
    {
      [v6 addIndex:a2];
      uint64_t v7 = RELogForDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke_65_cold_2(a1 + 40, v7, v8, v9, v10, v11, v12, v13);
      }
    }
    else
    {
      [v6 removeIndex:a2];
      uint64_t v7 = RELogForDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke_65_cold_1(a1 + 40, v7, v14, v15, v16, v17, v18, v19);
      }
    }
  }
}

uint64_t __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke_72(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = [a2 identifier];
  id v6 = [v4 identifier];

  uint64_t v7 = [v5 isEqualToString:v6];
  return v7;
}

uint64_t __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 identifier];
  uint64_t v3 = [v2 hash];

  return v3;
}

uint64_t __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:") ^ 1;
}

void __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke_81(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v9 = a3;
  uint64_t v10 = RELogForDomain();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v26 = *(void *)(a1 + 32);
    uint64_t v27 = REDiffOperationTypeDescription();
    id v28 = [v9 bundleIdentifier];
    int v29 = 134218498;
    uint64_t v30 = v26;
    __int16 v31 = 2114;
    id v32 = v27;
    __int16 v33 = 2114;
    v34 = v28;
    _os_log_debug_impl(&dword_21E651000, v10, OS_LOG_TYPE_DEBUG, "%p Performing %{public}@ operation on %{public}@.", (uint8_t *)&v29, 0x20u);
  }
  uint64_t v11 = [MEMORY[0x263F088C8] indexPathForItem:a4 inSection:*(void *)(a1 + 40)];
  uint64_t v12 = [MEMORY[0x263F088C8] indexPathForItem:a5 inSection:*(void *)(a1 + 40)];
  switch(a2)
  {
    case 0:
      uint64_t v13 = *(void *)(a1 + 32);
      __int16 v14 = *(_WORD *)(v13 + 24);
      if ((v14 & 0x100) != 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(v13 + 96));
        __int16 v25 = *(void **)(a1 + 32);
        uint64_t v17 = [v25 _contentForElement:v9];
        __int16 v22 = [v9 identifier];
        [WeakRetained engineController:v25 didReloadContent:v17 withIdentifier:v22];
        goto LABEL_16;
      }
      if ((v14 & 2) != 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(v13 + 96));
        uint64_t v16 = *(void **)(a1 + 32);
        uint64_t v17 = [v16 _contentForElement:v9];
        [WeakRetained engineController:v16 didReloadContent:v17 atIndexPath:v11];
        goto LABEL_17;
      }
      break;
    case 1:
      uint64_t v18 = *(void *)(a1 + 32);
      if ((*(_WORD *)(v18 + 24) & 8) != 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(v18 + 96));
        uint64_t v19 = *(void **)(a1 + 32);
        uint64_t v17 = [v19 _contentForElement:v9];
        [WeakRetained engineController:v19 didInsertContent:v17 atIndexPath:v11];
        goto LABEL_17;
      }
      break;
    case 2:
      id WeakRetained = [v9 identifier];
      if ([*(id *)(*(void *)(a1 + 32) + 64) isDisplayingElementWithIdentifier:WeakRetained])objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "elementWithIdentifierDidEndDisplay:", WeakRetained); {
      uint64_t v20 = *(void *)(a1 + 32);
      }
      if ((*(_WORD *)(v20 + 24) & 4) == 0) {
        goto LABEL_18;
      }
      uint64_t v17 = objc_loadWeakRetained((id *)(v20 + 96));
      __int16 v21 = *(void **)(a1 + 32);
      __int16 v22 = [v21 _contentForElement:v9];
      [v17 engineController:v21 didRemoveContent:v22 atIndexPath:v12];
LABEL_16:

      goto LABEL_17;
    case 3:
      uint64_t v23 = *(void *)(a1 + 32);
      if ((*(_WORD *)(v23 + 24) & 0x10) != 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(v23 + 96));
        __int16 v24 = *(void **)(a1 + 32);
        uint64_t v17 = [v24 _contentForElement:v9];
        [WeakRetained engineController:v24 didMoveContent:v17 fromIndexPath:v12 toIndexPath:v11];
LABEL_17:

LABEL_18:
      }
      break;
    default:
      break;
  }
}

- (void)relevanceEngine:(id)a3 performBatchUpdateBlock:(id)a4 completion:(id)a5
{
}

- (void)relevanceEngine:(id)a3 didReloadElement:(id)a4 atPath:(id)a5
{
  id v6 = [MEMORY[0x263F62D70] reloadElement:a4 atPath:a5];
  [(REUIRelevanceEngineController *)self _performOrEnqueueOperation:v6];
}

- (void)relevanceEngine:(id)a3 didRemoveElement:(id)a4 atPath:(id)a5
{
  id v6 = [MEMORY[0x263F62D70] removeElement:a4 atPath:a5];
  [(REUIRelevanceEngineController *)self _performOrEnqueueOperation:v6];
}

- (void)relevanceEngine:(id)a3 didInsertElement:(id)a4 atPath:(id)a5
{
  id v6 = [MEMORY[0x263F62D70] insertElement:a4 atPath:a5];
  [(REUIRelevanceEngineController *)self _performOrEnqueueOperation:v6];
}

- (void)relevanceEngine:(id)a3 didMoveElement:(id)a4 fromPath:(id)a5 toPath:(id)a6
{
  id v7 = [MEMORY[0x263F62D70] moveElement:a4 fromPath:a5 toPath:a6];
  [(REUIRelevanceEngineController *)self _performOrEnqueueOperation:v7];
}

- (BOOL)relevanceEngine:(id)a3 isElementAtPathVisible:(id)a4
{
  BOOL v5 = [(REUIRelevanceEngineController *)self _indexPathForSectionPath:a4];
  id v6 = [(REUIRelevanceEngineController *)self _controllerIndexPathForEngineIndexPath:v5];

  if (v6 && (*(_WORD *)&self->_delegateCallbacks & 0x20) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = [WeakRetained engineController:self isElementAtIndexPathVisible:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)relevanceEngineDidBeginUpdatingRelevance:(id)a3
{
  if ((*(_WORD *)&self->_delegateCallbacks & 0x40) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained engineControllerDidBeginUpdatingRelevance:self];
  }
}

- (void)relevanceEngineDidFinishUpdatingRelevance:(id)a3
{
  if ((*(_WORD *)&self->_delegateCallbacks & 0x80) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained engineControllerDidFinishUpdatingRelevance:self];
  }
}

- (id)elementsOrdered:(unint64_t)a3 relativeToElement:(id)a4
{
  id v6 = [(REUIRelevanceEngineController *)self _indexPathForElementWithIdentifier:a4];
  char v7 = v6;
  if (a3)
  {
    if (a3 == 1) {
      unint64_t v8 = [v6 item];
    }
    else {
      unint64_t v8 = 0;
    }
    unint64_t v9 = 0;
  }
  else
  {
    unint64_t v9 = [v6 item] + 1;
    unint64_t v8 = -[REUIRelevanceEngineController _numberOfItemsInSectionAtIndex:](self, "_numberOfItemsInSectionAtIndex:", [v7 section]);
  }
  uint64_t v10 = [MEMORY[0x263EFF980] array];
  if (v9 < v8)
  {
    do
    {
      uint64_t v11 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", v9, objc_msgSend(v7, "section"));
      uint64_t v12 = [(REUIRelevanceEngineController *)self elementIdentifierAtIndexPath:v11];
      if (v12) {
        [v10 addObject:v12];
      }

      ++v9;
    }
    while (v8 != v9);
  }
  uint64_t v13 = (void *)[v10 copy];

  return v13;
}

- (BOOL)elementIsAvailable:(id)a3
{
  uint64_t v3 = [(REUIRelevanceEngineController *)self _indexPathForElementWithIdentifier:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)interactionTypeForElement:(id)a3
{
  BOOL v4 = [(REUIRelevanceEngineController *)self _indexPathForElementWithIdentifier:a3];
  BOOL v5 = [(REUIRelevanceEngineController *)self _contentAtIndexPath:v4];
  id v6 = [v5 objectForKey:*MEMORY[0x263F62DB8]];
  objc_opt_class();
  char v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    char v7 = 0;
  }
  if (v7) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = (void *)*MEMORY[0x263F62DD0];
  }
  id v9 = v8;

  return v9;
}

- (RERelevanceEngine)engine
{
  return self->_engine;
}

- (NSArray)sectionOrder
{
  return self->_sectionOrder;
}

- (REUIRelevanceEngineControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (REUIRelevanceEngineControllerDelegate *)WeakRetained;
}

- (BOOL)allowsLocationUse
{
  return self->_allowsLocationUse;
}

- (BOOL)wantsLiveDataSources
{
  return self->_wantsLiveDataSources;
}

- (BOOL)wantsIdealizedContent
{
  return self->_wantsIdealizedContent;
}

- (void)setWantsIdealizedContent:(BOOL)a3
{
  self->_wantsIdealizedContent = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sectionOrder, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_trainingContext, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_pendingOperations, 0);
  objc_storeStrong((id *)&self->_hiddenBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_hiddenIndices, 0);
  objc_storeStrong((id *)&self->_currentElementStates, 0);

  objc_storeStrong((id *)&self->_sectionNameOrdering, 0);
}

- (double)maximumNegativeDwellTime
{
  [(_REUIControllerTrainingContext *)self->_trainingContext maximumNegativeDwellTime];
  return result;
}

- (void)setMaximumNegativeDwellTime:(double)a3
{
}

- (double)minimumPositiveDwellTime
{
  [(_REUIControllerTrainingContext *)self->_trainingContext minimumPositiveDwellTime];
  return result;
}

- (void)setMinimumPositiveDwellTime:(double)a3
{
}

- (unint64_t)onScreenElementCount
{
  return [(_REUIControllerTrainingContext *)self->_trainingContext onScreenElementCount];
}

- (void)setOnScreenElementCount:(unint64_t)a3
{
}

- (void)elementAtIndexPathWasSelected:(id)a3
{
  id v4 = [(REUIRelevanceEngineController *)self elementIdentifierAtIndexPath:a3];
  [(REUITrainingContext *)self->_trainingContext selectElementWithIdentifier:v4];
}

- (void)elemenAtIndexPathDidDisplay:(id)a3
{
  uint64_t v4 = [(REUIRelevanceEngineController *)self elementIdentifierAtIndexPath:a3];
  if (v4) {
    [(REUITrainingContext *)self->_trainingContext elementWithIdentifierDidDisplay:v4];
  }

  MEMORY[0x270F9A758]();
}

- (void)elementAtIndexPathDidEndDisplay:(id)a3
{
  uint64_t v4 = [(REUIRelevanceEngineController *)self elementIdentifierAtIndexPath:a3];
  if (v4) {
    [(REUITrainingContext *)self->_trainingContext elementWithIdentifierDidEndDisplay:v4];
  }

  MEMORY[0x270F9A758]();
}

- (void)_performOperations:(uint64_t)a3 toSection:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_performOperations:(uint64_t)a3 toSection:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke_58_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 56);
  int v4 = 134218242;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_21E651000, log, OS_LOG_TYPE_DEBUG, "%p inserting element %@", (uint8_t *)&v4, 0x16u);
}

void __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke_65_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke_65_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end