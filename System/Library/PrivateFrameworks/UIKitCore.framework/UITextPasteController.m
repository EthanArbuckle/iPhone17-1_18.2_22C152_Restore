@interface UITextPasteController
+ (id)combineAttributedStrings:(id)a3 addingSeparation:(BOOL)a4;
- (BOOL)_pasteDelegateHandlesPasting;
- (BOOL)shouldMatchStyleForItem:(id)a3;
- (UITextPasteConfigurationSupporting_Internal)supportingView;
- (UITextPasteController)initWithSupportingView:(id)a3;
- (id)_clampRange:(id)a3;
- (id)_combineItemAttributedStrings:(id)a3 forRange:(id)a4;
- (id)beginDroppingItems:(id)a3 toSelectedRange:(id)a4 progressSupport:(id)a5 animated:(BOOL)a6;
- (id)beginDroppingItems:(id)a3 toSelectedRange:(id)a4 progressSupport:(id)a5 animated:(BOOL)a6 delegate:(id)a7;
- (id)beginPastingItems:(id)a3 toRange:(id)a4;
- (id)beginPastingItems:(id)a3 toRange:(id)a4 delegate:(id)a5 matchesTextStyles:(BOOL)a6;
- (void)_executePasteForSession:(id)a3;
- (void)_performPasteOfAttributedString:(id)a3 toRange:(id)a4 forSession:(id)a5 completion:(id)a6;
- (void)_restorePasteResultForSession:(id)a3;
- (void)_transformTextPasteItem:(id)a3;
- (void)coordinator:(id)a3 endPastingItems:(id)a4;
- (void)setSupportingView:(id)a3;
@end

@implementation UITextPasteController

- (UITextPasteController)initWithSupportingView:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UITextPasteController;
  v5 = [(UITextPasteController *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_supportingView, v4);
    uint64_t v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    sessions = v6->_sessions;
    v6->_sessions = (NSMapTable *)v7;
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_supportingView);
  objc_storeStrong((id *)&self->_sessions, 0);
}

- (id)beginDroppingItems:(id)a3 toSelectedRange:(id)a4 progressSupport:(id)a5 animated:(BOOL)a6
{
  return [(UITextPasteController *)self beginDroppingItems:a3 toSelectedRange:a4 progressSupport:a5 animated:a6 delegate:0];
}

- (id)beginDroppingItems:(id)a3 toSelectedRange:(id)a4 progressSupport:(id)a5 animated:(BOOL)a6 delegate:(id)a7
{
  BOOL v43 = a6;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  obuint64_t j = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_supportingView);
  v15 = [WeakRetained _inputController];
  v16 = [v15 typingAttributes];
  uint64_t v17 = [v16 copy];
  v18 = (void *)v17;
  v19 = (void *)MEMORY[0x1E4F1CC08];
  if (v17) {
    v19 = (void *)v17;
  }
  id v51 = v19;

  v20 = [[UITextPasteCoordinator alloc] initWithDelegate:self];
  v21 = objc_opt_new();
  [v21 setController:self];
  [v21 setCoordinator:v20];
  v47 = v11;
  [v21 setRange:v11];
  v46 = v12;
  [v21 setProgressSupport:v12];
  v45 = v13;
  [v21 setDelegate:v13];
  v22 = self;
  [(NSMapTable *)self->_sessions setObject:v21 forKey:v20];
  id v23 = objc_loadWeakRetained((id *)&self->_supportingView);
  objc_opt_class();
  v44 = v21;
  location = (id *)&self->_supportingView;
  if (objc_opt_respondsToSelector())
  {
    id v24 = objc_loadWeakRetained((id *)&self->_supportingView);
    v25 = (objc_class *)[(id)objc_opt_class() _textPasteItemClass];
  }
  else
  {
    v25 = (objc_class *)objc_opt_class();
  }

  v26 = objc_opt_new();
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obja = obj;
  uint64_t v27 = [obja countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v57 != v29) {
          objc_enumerationMutation(obja);
        }
        v31 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        v32 = (void *)[[v25 alloc] initWithTextPasteCoordinator:v20];
        v33 = [v31 itemProvider];
        [v32 setItemProvider:v33];

        v34 = [v31 localObject];
        [v32 setLocalObject:v34];

        [v32 setDefaultAttributes:v51];
        objc_msgSend(v32, "setForcesDefaultAttributes:", -[UITextPasteController shouldMatchStyleForItem:](v22, "shouldMatchStyleForItem:", v32));
        id v35 = objc_loadWeakRetained(location);
        v36 = [v35 _implicitPasteConfigurationClasses];
        [v32 setSupportedPasteConfigurationClasses:v36];

        [(UITextPasteCoordinator *)v20 addItem:v32];
        [v26 addObject:v32];
      }
      uint64_t v28 = [obja countByEnumeratingWithState:&v56 objects:v61 count:16];
    }
    while (v28);
  }

  [v44 setOriginalItems:v26];
  if (v43) {
    [v44 animationStarted];
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v37 = v26;
  uint64_t v38 = [v37 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v53 != v40) {
          objc_enumerationMutation(v37);
        }
        [(UITextPasteController *)v22 _transformTextPasteItem:*(void *)(*((void *)&v52 + 1) + 8 * j)];
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v39);
  }

  return v44;
}

- (BOOL)shouldMatchStyleForItem:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend(a3, "itemProvider", 0);
  id v4 = [v3 registeredTypeIdentifiers];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) isEqualToString:@"com.apple.sticker"])
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (id)beginPastingItems:(id)a3 toRange:(id)a4
{
  return [(UITextPasteController *)self beginPastingItems:a3 toRange:a4 delegate:0 matchesTextStyles:0];
}

- (id)beginPastingItems:(id)a3 toRange:(id)a4 delegate:(id)a5 matchesTextStyles:(BOOL)a6
{
  BOOL v47 = a6;
  v61[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_supportingView);
  long long v13 = [WeakRetained _inputController];
  long long v14 = [v13 typingAttributes];
  uint64_t v15 = [v14 copy];
  uint64_t v16 = (void *)v15;
  uint64_t v17 = (void *)MEMORY[0x1E4F1CC08];
  v49 = (void *)MEMORY[0x1E4F1CC08];
  if (v15) {
    uint64_t v17 = (void *)v15;
  }
  id v48 = v17;

  id v18 = objc_loadWeakRetained((id *)&self->_supportingView);
  BOOL v19 = +[UITextInputController _shouldUseStandardTextScaling:v18];

  if (v19)
  {
    uint64_t v60 = *(void *)off_1E52D2270;
    v61[0] = &unk_1ED3F6D80;
    v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:&v60 count:1];
  }
  v20 = [[UITextPasteCoordinator alloc] initWithDelegate:self];
  v21 = objc_opt_new();
  [v21 setController:self];
  [v21 setCoordinator:v20];
  [v21 setRange:v10];
  [v21 setProgressSupport:0];
  [v21 setDelegate:v11];
  v42 = v21;
  [(NSMapTable *)self->_sessions setObject:v21 forKey:v20];
  v22 = objc_opt_new();
  id v23 = objc_loadWeakRetained((id *)&self->_supportingView);
  objc_opt_class();
  v44 = v11;
  v45 = v10;
  BOOL v43 = self;
  p_supportingView = &self->_supportingView;
  if (objc_opt_respondsToSelector())
  {
    id v25 = v9;
    id v26 = objc_loadWeakRetained((id *)&self->_supportingView);
    uint64_t v27 = (objc_class *)[(id)objc_opt_class() _textPasteItemClass];

    id v9 = v25;
  }
  else
  {
    uint64_t v27 = (objc_class *)objc_opt_class();
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = v9;
  uint64_t v28 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v55 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = *(void *)(*((void *)&v54 + 1) + 8 * i);
        v33 = (void *)[[v27 alloc] initWithTextPasteCoordinator:v20];
        [v33 setItemProvider:v32];
        [v33 setDefaultAttributes:v48];
        id v34 = objc_loadWeakRetained((id *)p_supportingView);
        id v35 = [v34 _implicitPasteConfigurationClasses];
        [v33 setSupportedPasteConfigurationClasses:v35];

        [v33 setForcesDefaultAttributes:v47];
        if ([v49 count]) {
          [v33 setDocumentOptions:v49];
        }
        [(UITextPasteCoordinator *)v20 addItem:v33];
        [v22 addObject:v33];
      }
      uint64_t v29 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
    }
    while (v29);
  }

  [v42 setOriginalItems:v22];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v36 = v22;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v38; ++j)
      {
        if (*(void *)v51 != v39) {
          objc_enumerationMutation(v36);
        }
        [(UITextPasteController *)v43 _transformTextPasteItem:*(void *)(*((void *)&v50 + 1) + 8 * j)];
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v50 objects:v58 count:16];
    }
    while (v38);
  }

  return v42;
}

+ (id)combineAttributedStrings:(id)a3 addingSeparation:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((unint64_t)[v5 count] < 2)
  {
    if ([v5 count] == 1)
    {
      uint64_t v17 = [v5 firstObject];
    }
    else
    {
      uint64_t v17 = objc_opt_new();
    }
    uint64_t v16 = (void *)v17;
  }
  else
  {
    uint64_t v6 = objc_opt_new();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v19 = v5;
    id v7 = v5;
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
          uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          if (v4 && [v6 length])
          {
            id v13 = objc_alloc(MEMORY[0x1E4F28B18]);
            long long v14 = objc_msgSend(v6, "attributesAtIndex:effectiveRange:", objc_msgSend(v6, "length") - 1, 0);
            uint64_t v15 = (void *)[v13 initWithString:@" " attributes:v14];

            [v6 appendAttributedString:v15];
          }
          [v6 appendAttributedString:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }

    uint64_t v16 = (void *)[v6 copy];
    id v5 = v19;
  }

  return v16;
}

- (void)coordinator:(id)a3 endPastingItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__208;
  long long v20 = __Block_byref_object_dispose__208;
  id v21 = 0;
  uint64_t v8 = self->_sessions;
  objc_sync_enter(v8);
  uint64_t v9 = [(NSMapTable *)self->_sessions objectForKey:v6];
  uint64_t v10 = [v9 range];
  id v11 = (void *)v17[5];
  v17[5] = v10;

  objc_sync_exit(v8);
  if (v17[5])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__UITextPasteController_coordinator_endPastingItems___block_invoke;
    v12[3] = &unk_1E52E9B00;
    uint64_t v15 = &v16;
    v12[4] = self;
    id v13 = v7;
    id v14 = v9;
    dispatch_async(MEMORY[0x1E4F14428], v12);
  }
  _Block_object_dispose(&v16, 8);
}

void __53__UITextPasteController_coordinator_endPastingItems___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _clampRange:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [*(id *)(a1 + 32) _combineItemAttributedStrings:*(void *)(a1 + 40) forRange:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  if (v5)
  {
    id v6 = v5;
    [*(id *)(a1 + 48) setPasteResult:v5];
    [*(id *)(a1 + 32) _executePasteForSession:*(void *)(a1 + 48)];
    id v5 = v6;
  }
}

- (void)_executePasteForSession:(id)a3
{
  id v4 = a3;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("TextPasteCoordinator", &_MergedGlobals_1269);
  id v6 = *(id *)(CategoryCachedImpl + 8);
  os_signpost_id_t v7 = os_signpost_id_generate(*(os_log_t *)(CategoryCachedImpl + 8));
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1853B0000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v7, "ExecutePasteForSession", "", buf, 2u);
  }

  *(void *)buf = 0;
  id v19 = buf;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__208;
  long long v22 = __Block_byref_object_dispose__208;
  id v23 = [v4 range];
  if (*((void *)v19 + 5)
    && ([v4 pasteResult], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__UITextPasteController__executePasteForSession___block_invoke;
    block[3] = &unk_1E530B040;
    id v13 = v4;
    id v14 = self;
    id v15 = v8;
    uint64_t v16 = buf;
    os_signpost_id_t v17 = v7;
    uint64_t v9 = v8;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    uint64_t v10 = *(id *)(__UILogGetCategoryCachedImpl("TextPasteCoordinator", &qword_1EB264828) + 8);
    uint64_t v9 = v10;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)id v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v9, OS_SIGNPOST_INTERVAL_END, v7, "ExecutePasteForSession", "", v11, 2u);
    }
  }

  _Block_object_dispose(buf, 8);
}

void __49__UITextPasteController__executePasteForSession___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 textPasteSessionWillBeginPasting:*(void *)(a1 + 32)];
  }
  uint64_t v3 = [*(id *)(a1 + 40) _clampRange:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void **)(a1 + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__UITextPasteController__executePasteForSession___block_invoke_2;
  v13[3] = &unk_1E530B018;
  id v14 = v2;
  id v10 = v8;
  uint64_t v11 = *(void *)(a1 + 40);
  id v15 = v10;
  uint64_t v16 = v11;
  uint64_t v17 = *(void *)(a1 + 64);
  id v12 = v2;
  [v9 _performPasteOfAttributedString:v6 toRange:v7 forSession:v10 completion:v13];
}

void __49__UITextPasteController__executePasteForSession___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) textPasteSessionDidEndPasting:*(void *)(a1 + 40)];
  }
  if (v3 && [*(id *)(a1 + 40) isAnimating])
  {
    if (objc_opt_respondsToSelector())
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 16));
      [WeakRetained layoutIfNeeded];

      [*(id *)(a1 + 32) textPasteSessionWillHidePasteResult:*(void *)(a1 + 40)];
    }
    id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 16));
    [v5 addInvisibleRange:v3];

    [*(id *)(a1 + 40) setHiddenRange:v3];
  }
  else
  {
    uint64_t v6 = *(void **)(*(void *)(a1 + 48) + 8);
    uint64_t v7 = [*(id *)(a1 + 40) coordinator];
    [v6 removeObjectForKey:v7];
  }
  uint64_t v8 = *(id *)(__UILogGetCategoryCachedImpl("TextPasteCoordinator", &_block_invoke___s_category_9)+ 8);
  uint64_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 56);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1853B0000, v9, OS_SIGNPOST_INTERVAL_END, v10, "ExecutePasteForSession", "", v11, 2u);
  }
}

- (void)_restorePasteResultForSession:(id)a3
{
  id v11 = a3;
  if (v11)
  {
    uint64_t v4 = [v11 hiddenRange];

    if (v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_supportingView);
      uint64_t v6 = [v11 hiddenRange];
      [WeakRetained removeInvisibleRange:v6];

      uint64_t v7 = [v11 delegate];
      if (objc_opt_respondsToSelector())
      {
        id v8 = objc_loadWeakRetained((id *)&self->_supportingView);
        [v8 layoutIfNeeded];

        [v7 textPasteSessionDidRevealPasteResult:v11];
      }
      sessions = self->_sessions;
      os_signpost_id_t v10 = [v11 coordinator];
      [(NSMapTable *)sessions removeObjectForKey:v10];
    }
  }
}

- (BOOL)_pasteDelegateHandlesPasting
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_supportingView);
  id v3 = [WeakRetained pasteDelegate];
  char v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

- (id)_clampRange:(id)a3
{
  id v4 = a3;
  id v5 = [v4 start];
  uint64_t v6 = [v4 end];
  p_supportingView = &self->_supportingView;
  id v8 = objc_loadWeakRetained((id *)p_supportingView);
  uint64_t v9 = [v8 endOfDocument];
  uint64_t v10 = [v8 comparePosition:v5 toPosition:v9];

  BOOL v11 = v10 == 1;
  if (v10 == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)p_supportingView);
    uint64_t v13 = [WeakRetained endOfDocument];

    id v5 = (void *)v13;
  }
  id v14 = objc_loadWeakRetained((id *)p_supportingView);
  id v15 = [v14 beginningOfDocument];
  uint64_t v16 = [v14 comparePosition:v5 toPosition:v15];

  if (v16 == -1)
  {
    id v17 = objc_loadWeakRetained((id *)p_supportingView);
    uint64_t v18 = [v17 beginningOfDocument];

    BOOL v11 = 1;
    id v5 = (void *)v18;
  }
  id v19 = objc_loadWeakRetained((id *)p_supportingView);
  uint64_t v20 = [v19 endOfDocument];
  uint64_t v21 = [v19 comparePosition:v6 toPosition:v20];

  if (v21 == 1)
  {
    id v22 = objc_loadWeakRetained((id *)p_supportingView);
    uint64_t v23 = [v22 endOfDocument];

    BOOL v11 = 1;
    uint64_t v6 = (void *)v23;
  }
  id v24 = objc_loadWeakRetained((id *)p_supportingView);
  uint64_t v25 = [v24 comparePosition:v6 toPosition:v5];

  if (v25 == -1 || v11)
  {
    BOOL v26 = v25 == -1;
    if (v25 == -1) {
      uint64_t v27 = v6;
    }
    else {
      uint64_t v27 = v5;
    }
    if (v26) {
      uint64_t v6 = v5;
    }
    id v28 = objc_loadWeakRetained((id *)p_supportingView);
    uint64_t v29 = [v28 textRangeFromPosition:v27 toPosition:v6];

    id v5 = v27;
    id v4 = (id)v29;
  }

  return v4;
}

- (void)_transformTextPasteItem:(id)a3
{
  id v14 = a3;
  p_supportingView = &self->_supportingView;
  id WeakRetained = objc_loadWeakRetained((id *)p_supportingView);
  uint64_t v6 = [WeakRetained pasteDelegate];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    id v8 = objc_loadWeakRetained((id *)p_supportingView);
    uint64_t v9 = [v8 pasteDelegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)p_supportingView);
      id v12 = [v11 pasteDelegate];
      id v13 = objc_loadWeakRetained((id *)p_supportingView);
      [v12 textPasteConfigurationSupporting:v13 transformPasteItem:v14];

      goto LABEL_6;
    }
  }
  else
  {
  }
  [v14 setDefaultResult];
LABEL_6:
}

- (id)_combineItemAttributedStrings:(id)a3 forRange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_supportingView = &self->_supportingView;
  id WeakRetained = objc_loadWeakRetained((id *)p_supportingView);
  char v10 = [WeakRetained pasteDelegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)p_supportingView);
    id v13 = [v12 pasteDelegate];
    id v14 = objc_loadWeakRetained((id *)p_supportingView);
    id v15 = [v13 textPasteConfigurationSupporting:v14 combineItemAttributedStrings:v6 forRange:v7];

    if (![v15 length])
    {
      id v19 = 0;
      goto LABEL_8;
    }
    id v16 = objc_loadWeakRetained((id *)p_supportingView);
    id v17 = [v16 _attributedStringForInsertionOfAttributedString:v15];

    id v18 = v17;
    id v15 = v18;
LABEL_6:
    id v19 = v18;
LABEL_8:

    goto LABEL_10;
  }
  if ([v6 count])
  {
    id v15 = objc_loadWeakRetained((id *)p_supportingView);
    +[UITextPasteController combineAttributedStrings:addingSeparation:](UITextPasteController, "combineAttributedStrings:addingSeparation:", v6, [v15 smartInsertDeleteType] != 1);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  id v19 = 0;
LABEL_10:

  return v19;
}

- (void)_performPasteOfAttributedString:(id)a3 toRange:(id)a4 forSession:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v12 progressSupport];
  id v15 = v14;
  if (v14)
  {
    unint64_t v16 = [v14 _textPasteRangeBehavior];
    uint64_t v17 = (v16 >> 1) & 1;
    uint64_t v18 = (v16 >> 2) & 1;
  }
  else
  {
    LOBYTE(v18) = 0;
    LODWORD(v17) = 0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__UITextPasteController__performPasteOfAttributedString_toRange_forSession_completion___block_invoke;
  aBlock[3] = &unk_1E530B068;
  aBlock[4] = self;
  char v40 = v18;
  id v19 = v12;
  id v38 = v19;
  id v20 = v13;
  id v39 = v20;
  uint64_t v21 = (void (**)(void *, uint64_t, id))_Block_copy(aBlock);
  p_supportingView = &self->_supportingView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_supportingView);
  id v24 = WeakRetained;
  if (v17)
  {
    [WeakRetained setSelectedTextRange:v11];
  }
  else
  {
    uint64_t v25 = [WeakRetained selectedTextRange];

    if (!v25) {
      goto LABEL_9;
    }
    id v24 = objc_loadWeakRetained((id *)&self->_supportingView);
    uint64_t v26 = [v24 selectedTextRange];

    id v11 = (id)v26;
  }

LABEL_9:
  BOOL v27 = [(UITextPasteController *)self _pasteDelegateHandlesPasting];
  id v28 = objc_loadWeakRetained((id *)&self->_supportingView);
  uint64_t v29 = v28;
  if (v27)
  {
    uint64_t v30 = [v28 pasteDelegate];
    id v31 = objc_loadWeakRetained((id *)p_supportingView);
    uint64_t v32 = [v30 textPasteConfigurationSupporting:v31 performPasteOfAttributedString:v10 toRange:v11];

    v21[2](v21, v32, v10);
    id v11 = (id)v32;
  }
  else
  {
    v33 = [v28 _inputController];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __87__UITextPasteController__performPasteOfAttributedString_toRange_forSession_completion___block_invoke_2;
    v34[3] = &unk_1E530B090;
    id v35 = v19;
    id v36 = v21;
    [v33 _pasteAttributedString:v10 toRange:v11 completion:v34];
  }
}

void __87__UITextPasteController__performPasteOfAttributedString_toRange_forSession_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v14 = [*(id *)(a1 + 32) _clampRange:v5];

    if (*(unsigned char *)(a1 + 56))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
      [WeakRetained setSelectedTextRange:v14];
    }
    else
    {
      id WeakRetained = [v14 end];
      id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
      uint64_t v9 = [v8 textRangeFromPosition:WeakRetained toPosition:WeakRetained];
      id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
      [v10 setSelectedTextRange:v9];
    }
  }
  else
  {
    id v14 = 0;
  }
  id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    [v13 _pasteSessionDidFinish:*(void *)(a1 + 40)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __87__UITextPasteController__performPasteOfAttributedString_toRange_forSession_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) progressSupport];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) progressSupport];
    uint64_t v8 = [v7 _textPasteSelectableRangeForResult:v5 fromRange:v10];

    id v9 = (id)v8;
  }
  else
  {
    id v9 = v10;
  }
  id v11 = v9;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (UITextPasteConfigurationSupporting_Internal)supportingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_supportingView);
  return (UITextPasteConfigurationSupporting_Internal *)WeakRetained;
}

- (void)setSupportingView:(id)a3
{
}

@end