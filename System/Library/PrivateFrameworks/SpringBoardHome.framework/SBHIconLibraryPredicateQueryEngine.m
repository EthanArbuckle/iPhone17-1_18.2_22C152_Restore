@interface SBHIconLibraryPredicateQueryEngine
- (void)_processingQueue_teardownQueryContext:(id)a3;
- (void)executeQuery:(id)a3;
@end

@implementation SBHIconLibraryPredicateQueryEngine

- (void)executeQuery:(id)a3
{
  id v4 = a3;
  v5 = [(SBHIconLibraryAbstractQueryEngine *)self iconModel];
  v6 = [v5 leafIcons];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__SBHIconLibraryPredicateQueryEngine_executeQuery___block_invoke;
  v17[3] = &unk_1E6AAE078;
  id v7 = v5;
  id v18 = v7;
  v8 = objc_msgSend(v6, "bs_filter:", v17);

  objc_initWeak(&location, self);
  v9 = [(SBHIconLibraryAbstractQueryEngine *)self processingQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__SBHIconLibraryPredicateQueryEngine_executeQuery___block_invoke_2;
  v12[3] = &unk_1E6AAE0A0;
  objc_copyWeak(&v15, &location);
  v12[4] = self;
  id v13 = v4;
  id v14 = v8;
  id v10 = v8;
  id v11 = v4;
  dispatch_async(v9, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

uint64_t __51__SBHIconLibraryPredicateQueryEngine_executeQuery___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isIconVisible:v3]) {
    uint64_t IsLeafIconAndNotWidgetIcon = _SBIconIsLeafIconAndNotWidgetIcon(v3);
  }
  else {
    uint64_t IsLeafIconAndNotWidgetIcon = 0;
  }

  return IsLeafIconAndNotWidgetIcon;
}

void __51__SBHIconLibraryPredicateQueryEngine_executeQuery___block_invoke_2(id *a1)
{
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 7);
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v10 = WeakRetained;
    char v4 = objc_msgSend(WeakRetained, "_processingQueue_isIconModelReloading");
    id v3 = v10;
    if ((v4 & 1) == 0)
    {
      id v5 = objc_loadWeakRetained(v10 + 8);
      if (v5)
      {
        v6 = v5;
        objc_msgSend(a1[4], "_processingQueue_teardownQueryContext:", v5);
      }
      id v7 = [[SBHIconLibraryQueryContext alloc] initWithQuery:a1[5]];
      objc_storeWeak(v10 + 8, v7);
      objc_msgSend(v10, "_processingQueue_startNewQueryContext:", v7);
      v8 = [a1[5] predicate];
      v9 = [a1[6] filteredSetUsingPredicate:v8];
      objc_msgSend(a1[4], "_processingQueue_addIcons:iconLibraryQueryContext:notifyDelegate:", v9, v7, 1);

      id v3 = v10;
    }
  }
}

- (void)_processingQueue_teardownQueryContext:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentlyRunningQueryContext);

  if (WeakRetained == v4) {
    objc_storeWeak((id *)&self->_currentlyRunningQueryContext, 0);
  }
  v6.receiver = self;
  v6.super_class = (Class)SBHIconLibraryPredicateQueryEngine;
  [(SBHIconLibraryAbstractQueryEngine *)&v6 _processingQueue_teardownQueryContext:v4];
}

- (void).cxx_destruct
{
}

@end