@interface SUScriptNavigationSimulator
+ (BOOL)transitioning;
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
+ (void)startTransition;
+ (void)stopTransition;
- (NSMutableArray)enqueuedTransitions;
- (SUScriptNavigationSimulator)initWithNavigationController:(id)a3;
- (UINavigationController)navigationController;
- (WebScriptObject)transitionCallback;
- (id)_className;
- (id)_popHandler;
- (id)scriptAttributeKeys;
- (int64_t)_relativeIndexFromIndex:(int64_t)a3;
- (int64_t)indexCount;
- (int64_t)initialIndex;
- (int64_t)lastVisibleIndex;
- (int64_t)visibleIndex;
- (void)_callCallbackWithWithTransition:(id)a3;
- (void)_enqueueLoadingState:(id)a3;
- (void)_handlePopFromIndex:(int64_t)a3 toIndex:(int64_t)a4;
- (void)_startNextTransition;
- (void)popToViewAtIndex:(int64_t)a3 completion:(id)a4;
- (void)popViewWithCompletion:(id)a3;
- (void)pushViewWithCompletion:(id)a3;
- (void)setEnqueuedTransitions:(id)a3;
- (void)setIndexCount:(int64_t)a3;
- (void)setInitialIndex:(int64_t)a3;
- (void)setLastVisibleIndex:(int64_t)a3;
- (void)setNavigationController:(id)a3;
- (void)setTransitionCallback:(id)a3;
- (void)setVisibleIndex:(int64_t)a3;
@end

@implementation SUScriptNavigationSimulator

- (SUScriptNavigationSimulator)initWithNavigationController:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUScriptNavigationSimulator;
  v5 = [(SUScriptObject *)&v14 init];
  v6 = v5;
  if (!v5) {
    goto LABEL_7;
  }
  if (!v4) {
    goto LABEL_9;
  }
  objc_storeWeak((id *)&v5->_navigationController, v4);
  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  enqueuedTransitions = v6->_enqueuedTransitions;
  v6->_enqueuedTransitions = v7;

  v9 = [v4 viewControllers];
  v6->_initialIndex = [v9 count] - 1;

  if (v6->_initialIndex < 0)
  {
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  v10 = [v4 viewControllers];
  v11 = [v10 objectAtIndexedSubscript:v6->_initialIndex];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_9;
  }
  if (v11)
  {
    v12 = [(SUScriptNavigationSimulator *)v6 _popHandler];
    [(SUScriptNavigationSimulator *)v11 setPopHandler:v12];

LABEL_7:
    v11 = v6;
  }
LABEL_10:

  return v11;
}

+ (BOOL)transitioning
{
  return _transitionCount > 0;
}

+ (void)startTransition
{
}

+ (void)stopTransition
{
}

- (WebScriptObject)transitionCallback
{
  [(SUScriptObject *)self lock];
  v3 = self->_transitionCallback;
  [(SUScriptObject *)self unlock];

  return v3;
}

- (int64_t)indexCount
{
  return [(SUScriptNavigationSimulator *)self visibleIndex] + 1;
}

- (int64_t)visibleIndex
{
  v3 = [(SUScriptNavigationSimulator *)self navigationController];
  id v4 = [v3 viewControllers];
  uint64_t v5 = [v4 count] - 1;

  return [(SUScriptNavigationSimulator *)self _relativeIndexFromIndex:v5];
}

- (void)setTransitionCallback:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = (WebScriptObject *)a3;
  [(SUScriptObject *)self lock];
  uint64_t v5 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    v7 &= 2u;
  }
  if (!v7) {
    goto LABEL_9;
  }
  *(_DWORD *)v13 = 138543618;
  *(void *)&v13[4] = objc_opt_class();
  *(_WORD *)&v13[12] = 2114;
  *(void *)&v13[14] = v4;
  id v9 = *(id *)&v13[4];
  LODWORD(v12) = 22;
  v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, v13, v12, *(_OWORD *)v13, *(void *)&v13[16], v14);
    free(v10);
    SSFileLog();
LABEL_9:
  }
  transitionCallback = self->_transitionCallback;
  self->_transitionCallback = v4;

  [(SUScriptObject *)self unlock];
}

- (void)setIndexCount:(int64_t)a3
{
  v3 = (void *)MEMORY[0x263F1FA90];
  id v4 = [NSString stringWithFormat:@"%@ is readonly", @"indexCount"];
  [v3 throwException:v4];
}

- (void)setVisibleIndex:(int64_t)a3
{
  v3 = (void *)MEMORY[0x263F1FA90];
  id v4 = [NSString stringWithFormat:@"%@ is readonly", @"visibleIndex"];
  [v3 throwException:v4];
}

- (void)popViewWithCompletion:(id)a3
{
  id v4 = a3;
  [(SUScriptNavigationSimulator *)self popToViewAtIndex:[(SUScriptNavigationSimulator *)self visibleIndex] - 1 completion:v4];
}

- (void)popToViewAtIndex:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v6 = 0;
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__SUScriptNavigationSimulator_popToViewAtIndex_completion___block_invoke;
  v13[3] = &unk_264812290;
  id v14 = v6;
  v15 = self;
  id v7 = v6;
  v8 = (void *)MEMORY[0x22A680AE0](v13);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__SUScriptNavigationSimulator_popToViewAtIndex_completion___block_invoke_2;
  block[3] = &unk_264812FD8;
  id v11 = v8;
  int64_t v12 = a3;
  block[4] = self;
  id v9 = v8;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __59__SUScriptNavigationSimulator_popToViewAtIndex_completion___block_invoke(uint64_t a1)
{
  v2 = [[SUScriptFunction alloc] initWithScriptObject:*(void *)(a1 + 32)];
  [(SUScriptFunction *)v2 setThisObject:*(void *)(a1 + 40)];
  [(SUScriptFunction *)v2 callWithArguments:0];
  [(SUScriptFunction *)v2 setThisObject:0];
}

void __59__SUScriptNavigationSimulator_popToViewAtIndex_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) navigationController];
  v3 = [v2 viewControllers];
  uint64_t v4 = [v3 count];

  uint64_t v5 = *(void *)(a1 + 48) + [*(id *)(a1 + 32) initialIndex];
  if (v5 >= v4)
  {
    v25 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v25();
    return;
  }
  id v6 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  id v9 = [v6 OSLogObject];
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    v8 &= 2u;
  }
  if (!v8) {
    goto LABEL_10;
  }
  int v43 = 138543362;
  id v44 = (id)objc_opt_class();
  id v10 = v44;
  LODWORD(v35) = 12;
  v34 = &v43;
  id v11 = (void *)_os_log_send_and_compose_impl();

  if (v11)
  {
    id v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v43, v35);
    free(v11);
    v34 = (int *)v9;
    SSFileLog();
LABEL_10:
  }
  if ((v5 & 0x8000000000000000) == 0)
  {
    int64_t v12 = [*(id *)(a1 + 32) navigationController];
    v13 = [v12 viewControllers];
    id v14 = [v13 objectAtIndexedSubscript:v5];

    [MEMORY[0x263F158F8] begin];
    v15 = (void *)MEMORY[0x263F158F8];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __59__SUScriptNavigationSimulator_popToViewAtIndex_completion___block_invoke_28;
    v36[3] = &unk_264812FB0;
    id v37 = *(id *)(a1 + 40);
    [v15 setCompletionBlock:v36];
    v16 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v17 = [v16 shouldLog];
    if ([v16 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    v19 = objc_msgSend(v16, "OSLogObject", v34);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      v18 &= 2u;
    }
    if (v18)
    {
      v20 = objc_opt_class();
      int v43 = 138543362;
      id v44 = v20;
      id v21 = v20;
      LODWORD(v35) = 12;
      v22 = (void *)_os_log_send_and_compose_impl();

      if (!v22)
      {
LABEL_21:

        v23 = [*(id *)(a1 + 32) navigationController];
        id v24 = (id)[v23 popToViewController:v14 animated:1];

        [MEMORY[0x263F158F8] commit];
        return;
      }
      v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v22, 4, &v43, v35);
      free(v22);
      SSFileLog();
    }

    goto LABEL_21;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v26 = [*(id *)(a1 + 32) navigationController];
  v27 = [v26 viewControllers];

  uint64_t v28 = [v27 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v39;
    while (2)
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v39 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && ([v32 bridgedNavigation])
        {

          v27 = [*(id *)(a1 + 32) navigationController];
          id v33 = (id)[v27 popToViewController:0 animated:1];
          goto LABEL_36;
        }
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v29) {
        continue;
      }
      break;
    }
  }
LABEL_36:

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __59__SUScriptNavigationSimulator_popToViewAtIndex_completion___block_invoke_28(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)pushViewWithCompletion:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v4 = 0;
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__SUScriptNavigationSimulator_pushViewWithCompletion___block_invoke;
  v10[3] = &unk_264812290;
  id v11 = v4;
  int64_t v12 = self;
  id v5 = v4;
  id v6 = (void *)MEMORY[0x22A680AE0](v10);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__SUScriptNavigationSimulator_pushViewWithCompletion___block_invoke_2;
  v8[3] = &unk_264812420;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

void __54__SUScriptNavigationSimulator_pushViewWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [[SUScriptFunction alloc] initWithScriptObject:*(void *)(a1 + 32)];
  [(SUScriptFunction *)v2 setThisObject:*(void *)(a1 + 40)];
  [(SUScriptFunction *)v2 callWithArguments:0];
  [(SUScriptFunction *)v2 setThisObject:0];
}

void __54__SUScriptNavigationSimulator_pushViewWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) navigationController];
  v3 = [v2 topViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 embeddedViewController];
    id v5 = [*(id *)(a1 + 32) navigationController];
    id v6 = [v5 viewControllers];
    id v7 = (char *)[v6 count];

    unint64_t v8 = 0x263F7B000uLL;
    id v9 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    int64_t v12 = [v9 OSLogObject];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      v11 &= 2u;
    }
    if (v11)
    {
      *(_DWORD *)location = 138543874;
      *(void *)&location[4] = objc_opt_class();
      __int16 v33 = 2048;
      v34 = v7 - 1;
      __int16 v35 = 2048;
      v36 = v7;
      id v13 = *(id *)&location[4];
      LODWORD(v27) = 32;
      v26 = location;
      id v14 = (void *)_os_log_send_and_compose_impl();

      unint64_t v8 = 0x263F7B000;
      if (v14)
      {
        objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, location, v27);
        v15 = (unsigned char *)objc_claimAutoreleasedReturnValue();
        free(v14);
        v26 = v15;
        SSFileLog();
      }
    }
    else
    {
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [*(id *)(v8 + 504) sharedConfig];
      int v17 = [(SUSnapshotViewController *)v16 shouldLog];
      if ([(SUSnapshotViewController *)v16 shouldLogToDisk]) {
        int v18 = v17 | 2;
      }
      else {
        int v18 = v17;
      }
      v19 = [(SUSnapshotViewController *)v16 OSLogObject];
      if (!os_log_type_enabled(&v19->super.super.super.super, OS_LOG_TYPE_DEFAULT)) {
        v18 &= 2u;
      }
      if (v18)
      {
        v20 = objc_opt_class();
        *(_DWORD *)location = 138543874;
        *(void *)&location[4] = v20;
        __int16 v33 = 2048;
        v34 = v7 - 1;
        __int16 v35 = 2048;
        v36 = v7;
        id v21 = v20;
        LODWORD(v27) = 32;
        v22 = (void *)_os_log_send_and_compose_impl();

        if (!v22)
        {
LABEL_22:

          goto LABEL_23;
        }
        objc_msgSend(NSString, "stringWithCString:encoding:", v22, 4, location, v27);
        v19 = (SUNavigationContainerViewController *)objc_claimAutoreleasedReturnValue();
        free(v22);
        SSFileLog();
      }
    }
    else
    {
      v16 = [[SUSnapshotViewController alloc] initWithOriginal:v4];
      [v3 setEmbeddedViewController:v16 animated:0 completion:0];
      v19 = [[SUNavigationContainerViewController alloc] initWithChildViewController:v4];
      -[SUNavigationContainerViewController setBridgedNavigation:](v19, "setBridgedNavigation:", [v3 bridgedNavigation]);
      v23 = [*(id *)(a1 + 32) _popHandler];
      [(SUNavigationContainerViewController *)v19 setPopHandler:v23];

      objc_initWeak((id *)location, *(id *)(a1 + 32));
      id v24 = [SUScriptNavigationTransition alloc];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __54__SUScriptNavigationSimulator_pushViewWithCompletion___block_invoke_31;
      v28[3] = &unk_264813050;
      objc_copyWeak(v31, (id *)location);
      v31[1] = v7 - 1;
      v31[2] = v7;
      id v29 = v3;
      id v30 = *(id *)(a1 + 40);
      v25 = [(SUScriptNavigationTransition *)v24 initWithContainer:v19 finishBlock:v28];
      [(SUScriptNavigationTransition *)v25 setFromIndex:v7 - 1];
      [(SUScriptNavigationTransition *)v25 setToIndex:v7];
      [*(id *)(a1 + 32) _enqueueLoadingState:v25];

      objc_destroyWeak(v31);
      objc_destroyWeak((id *)location);
    }

    goto LABEL_22;
  }
LABEL_23:
}

void __54__SUScriptNavigationSimulator_pushViewWithCompletion___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  int v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    v9 &= 2u;
  }
  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    int64_t v12 = objc_opt_class();
    uint64_t v13 = *(void *)(a1 + 56);
    uint64_t v14 = *(void *)(a1 + 64);
    int v26 = 138543874;
    uint64_t v27 = v12;
    __int16 v28 = 2048;
    uint64_t v29 = v13;
    __int16 v30 = 2048;
    uint64_t v31 = v14;
    id v15 = v12;
    LODWORD(v20) = 32;
    v16 = (void *)_os_log_send_and_compose_impl();

    if (v16)
    {
      int v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v26, v20);
      free(v16);
      SSFileLog();
    }
  }
  else
  {
  }
  int v18 = [*(id *)(a1 + 32) appearancePromise];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __54__SUScriptNavigationSimulator_pushViewWithCompletion___block_invoke_32;
  v21[3] = &unk_264813028;
  objc_copyWeak(&v24, (id *)(a1 + 48));
  long long v25 = *(_OWORD *)(a1 + 56);
  id v23 = *(id *)(a1 + 40);
  id v19 = v6;
  id v22 = v19;
  [v18 addFinishBlock:v21];

  objc_destroyWeak(&v24);
}

void __54__SUScriptNavigationSimulator_pushViewWithCompletion___block_invoke_32(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__SUScriptNavigationSimulator_pushViewWithCompletion___block_invoke_2_33;
  block[3] = &unk_264813000;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  long long v6 = *(_OWORD *)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v5);
}

void __54__SUScriptNavigationSimulator_pushViewWithCompletion___block_invoke_2_33(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    uint64_t v20 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v21 = [v20 shouldLog];
    if ([v20 shouldLogToDisk]) {
      int v22 = v21 | 2;
    }
    else {
      int v22 = v21;
    }
    id v23 = [v20 OSLogObject];
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      v22 &= 2u;
    }
    if (v22)
    {
      id v24 = objc_loadWeakRetained(v2);
      long long v25 = objc_opt_class();
      uint64_t v26 = *(void *)(a1 + 56);
      uint64_t v27 = *(void *)(a1 + 64);
      int v33 = 138543874;
      v34 = v25;
      __int16 v35 = 2048;
      uint64_t v36 = v26;
      __int16 v37 = 2048;
      uint64_t v38 = v27;
      id v28 = v25;
      LODWORD(v30) = 32;
      uint64_t v29 = (void *)_os_log_send_and_compose_impl();

      if (!v29)
      {
LABEL_21:

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        goto LABEL_22;
      }
      id v23 = objc_msgSend(NSString, "stringWithCString:encoding:", v29, 4, &v33, v30);
      free(v29);
      SSFileLog();
    }

    goto LABEL_21;
  }
  id v4 = [*(id *)(a1 + 32) embeddedViewController];
  id v5 = [v4 view];
  [v5 setNeedsLayout];

  long long v6 = [*(id *)(a1 + 32) embeddedViewController];
  id v7 = [v6 view];
  [v7 layoutIfNeeded];

  [MEMORY[0x263F158F8] begin];
  int v8 = (void *)MEMORY[0x263F158F8];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __54__SUScriptNavigationSimulator_pushViewWithCompletion___block_invoke_34;
  id v31[3] = &unk_264812FB0;
  id v32 = *(id *)(a1 + 40);
  [v8 setCompletionBlock:v31];
  int v9 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  int64_t v12 = [v9 OSLogObject];
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
    v11 &= 2u;
  }
  if (!v11) {
    goto LABEL_10;
  }
  id v13 = objc_loadWeakRetained(v2);
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v16 = *(void *)(a1 + 64);
  int v33 = 138543874;
  v34 = v14;
  __int16 v35 = 2048;
  uint64_t v36 = v15;
  __int16 v37 = 2048;
  uint64_t v38 = v16;
  id v17 = v14;
  LODWORD(v30) = 32;
  int v18 = (void *)_os_log_send_and_compose_impl();

  if (v18)
  {
    int64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v33, v30);
    free(v18);
    SSFileLog();
LABEL_10:
  }
  id v19 = [WeakRetained navigationController];
  [v19 pushViewController:*(void *)(a1 + 32) animated:1];

  [MEMORY[0x263F158F8] commit];
  [WeakRetained setLastVisibleIndex:*(void *)(a1 + 64)];

LABEL_22:
}

uint64_t __54__SUScriptNavigationSimulator_pushViewWithCompletion___block_invoke_34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_enqueueLoadingState:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v34 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v4 = [(SUScriptNavigationSimulator *)self enqueuedTransitions];
  unint64_t v5 = [v4 count];

  if (v5 >= 2)
  {
    unint64_t v6 = 1;
    while (1)
    {
      id v7 = [(SUScriptNavigationSimulator *)self enqueuedTransitions];
      int v8 = [v7 objectAtIndexedSubscript:v6];

      [v8 setStatus:2];
      int v9 = [(SUScriptNavigationSimulator *)self enqueuedTransitions];
      [v9 removeObjectAtIndex:v6];

      int v10 = [MEMORY[0x263F7B1F8] sharedConfig];
      int v11 = [v10 shouldLog];
      if ([v10 shouldLogToDisk]) {
        int v12 = v11 | 2;
      }
      else {
        int v12 = v11;
      }
      id v13 = [v10 OSLogObject];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        int v14 = v12;
      }
      else {
        int v14 = v12 & 2;
      }
      if (!v14) {
        goto LABEL_12;
      }
      uint64_t v15 = objc_opt_class();
      id v16 = v15;
      uint64_t v17 = [v8 fromIndex];
      uint64_t v18 = [v8 toIndex];
      int v35 = 138543874;
      uint64_t v36 = v15;
      __int16 v37 = 2048;
      uint64_t v38 = v17;
      __int16 v39 = 2048;
      uint64_t v40 = v18;
      LODWORD(v33) = 32;
      id v32 = &v35;
      id v19 = (void *)_os_log_send_and_compose_impl();

      if (v19) {
        break;
      }
LABEL_13:

      ++v6;
      uint64_t v20 = [(SUScriptNavigationSimulator *)self enqueuedTransitions];
      unint64_t v21 = [v20 count];

      if (v6 >= v21) {
        goto LABEL_14;
      }
    }
    id v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, &v35, v33);
    free(v19);
    id v32 = (int *)v13;
    SSFileLog();
LABEL_12:

    goto LABEL_13;
  }
LABEL_14:
  int v22 = objc_msgSend(MEMORY[0x263F7B1F8], "sharedConfig", v32);
  int v23 = [v22 shouldLog];
  if ([v22 shouldLogToDisk]) {
    v23 |= 2u;
  }
  id v24 = [v22 OSLogObject];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
    int v25 = v23;
  }
  else {
    int v25 = v23 & 2;
  }
  if (!v25) {
    goto LABEL_22;
  }
  uint64_t v26 = objc_opt_class();
  id v27 = v26;
  id v28 = [(SUScriptNavigationSimulator *)self enqueuedTransitions];
  uint64_t v29 = [v28 count];
  int v35 = 138543618;
  uint64_t v36 = v26;
  __int16 v37 = 2048;
  uint64_t v38 = v29;
  LODWORD(v33) = 22;
  uint64_t v30 = (void *)_os_log_send_and_compose_impl();

  if (v30)
  {
    id v24 = objc_msgSend(NSString, "stringWithCString:encoding:", v30, 4, &v35, v33);
    free(v30);
    SSFileLog();
LABEL_22:
  }
  uint64_t v31 = [(SUScriptNavigationSimulator *)self enqueuedTransitions];
  [v31 addObject:v34];

  [(SUScriptNavigationSimulator *)self _startNextTransition];
}

- (void)_handlePopFromIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  unint64_t v6 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  int v9 = [v6 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    int v10 = v8;
  }
  else {
    int v10 = v8 & 2;
  }
  if (v10)
  {
    *(_DWORD *)location = 138543874;
    *(void *)&location[4] = objc_opt_class();
    __int16 v56 = 2048;
    int64_t v57 = a3;
    __int16 v58 = 2048;
    int64_t v59 = a4;
    id v11 = *(id *)&location[4];
    LODWORD(v46) = 32;
    uint64_t v45 = location;
    int v12 = (void *)_os_log_send_and_compose_impl();

    if (v12)
    {
      objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, location, v46);
      id v13 = (unsigned char *)objc_claimAutoreleasedReturnValue();
      free(v12);
      uint64_t v45 = v13;
      SSFileLog();
    }
  }
  else
  {
  }
  unint64_t v14 = [(SUScriptNavigationSimulator *)self initialIndex];
  uint64_t v15 = [(SUScriptNavigationSimulator *)self navigationController];
  id v16 = [v15 viewControllers];
  BOOL v17 = v14 < [v16 count];

  if (v17)
  {
    do
    {
      uint64_t v18 = [(SUScriptNavigationSimulator *)self navigationController];
      id v19 = [v18 viewControllers];
      uint64_t v20 = [v19 objectAtIndexedSubscript:v14];

      unint64_t v21 = [v20 view];
      int v22 = [v21 layer];
      [v22 removeAllAnimations];

      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      int v23 = [v20 childViewControllers];
      uint64_t v24 = [v23 countByEnumeratingWithState:&v50 objects:v54 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v51 != v25) {
              objc_enumerationMutation(v23);
            }
            id v27 = [*(id *)(*((void *)&v50 + 1) + 8 * i) view];
            id v28 = [v27 layer];
            [v28 removeAllAnimations];
          }
          uint64_t v24 = [v23 countByEnumeratingWithState:&v50 objects:v54 count:16];
        }
        while (v24);
      }

      uint64_t v29 = [(SUScriptNavigationSimulator *)self navigationController];
      uint64_t v30 = [v29 viewControllers];
      unint64_t v31 = [v30 count];

      ++v14;
    }
    while (v14 < v31);
  }
  id v32 = [(SUScriptNavigationSimulator *)self navigationController];
  uint64_t v33 = [v32 viewControllers];

  if (a4 < 0 || [v33 count] <= (unint64_t)a4)
  {
    id v34 = 0;
  }
  else
  {
    id v34 = [v33 objectAtIndexedSubscript:a4];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __int16 v37 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v38 = [v37 shouldLog];
    if ([v37 shouldLogToDisk]) {
      int v39 = v38 | 2;
    }
    else {
      int v39 = v38;
    }
    uint64_t v40 = [v37 OSLogObject];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
      int v41 = v39;
    }
    else {
      int v41 = v39 & 2;
    }
    if (v41)
    {
      v42 = objc_opt_class();
      *(_DWORD *)location = 138543874;
      *(void *)&location[4] = v42;
      __int16 v56 = 2048;
      int64_t v57 = a3;
      __int16 v58 = 2048;
      int64_t v59 = a4;
      id v43 = v42;
      LODWORD(v46) = 32;
      id v44 = (void *)_os_log_send_and_compose_impl();

      if (!v44)
      {
LABEL_36:

        goto LABEL_37;
      }
      uint64_t v40 = objc_msgSend(NSString, "stringWithCString:encoding:", v44, 4, location, v46);
      free(v44);
      SSFileLog();
    }

    goto LABEL_36;
  }
  objc_initWeak((id *)location, self);
  int v35 = [SUScriptNavigationTransition alloc];
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __59__SUScriptNavigationSimulator__handlePopFromIndex_toIndex___block_invoke;
  v48[3] = &unk_2648130A0;
  objc_copyWeak(v49, (id *)location);
  v49[1] = (id)a3;
  v49[2] = (id)a4;
  uint64_t v36 = [(SUScriptNavigationTransition *)v35 initWithContainer:v34 finishBlock:v48];
  [(SUScriptNavigationTransition *)v36 setFromIndex:a3];
  [(SUScriptNavigationTransition *)v36 setToIndex:a4];
  [(SUScriptNavigationSimulator *)self _enqueueLoadingState:v36];

  objc_destroyWeak(v49);
  objc_destroyWeak((id *)location);
LABEL_37:
}

void __59__SUScriptNavigationSimulator__handlePopFromIndex_toIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  int v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    v7 &= 2u;
  }
  if (!v7) {
    goto LABEL_9;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v10 = objc_opt_class();
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  int v21 = 138543874;
  int v22 = v10;
  __int16 v23 = 2048;
  uint64_t v24 = v11;
  __int16 v25 = 2048;
  uint64_t v26 = v12;
  id v13 = v10;
  LODWORD(v16) = 32;
  unint64_t v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    int v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v21, v16);
    free(v14);
    SSFileLog();
LABEL_9:
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__SUScriptNavigationSimulator__handlePopFromIndex_toIndex___block_invoke_37;
  block[3] = &unk_264813078;
  objc_copyWeak(&v19, (id *)(a1 + 32));
  long long v20 = *(_OWORD *)(a1 + 40);
  id v18 = v4;
  id v15 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v19);
}

void __59__SUScriptNavigationSimulator__handlePopFromIndex_toIndex___block_invoke_37(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (!WeakRetained)
  {
    int v6 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v20 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v21 = v20 | 2;
    }
    else {
      int v21 = v20;
    }
    BOOL v17 = [v6 OSLogObject];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      v21 &= 2u;
    }
    if (!v21) {
      goto LABEL_22;
    }
    id v22 = objc_loadWeakRetained(v2);
    __int16 v23 = objc_opt_class();
    uint64_t v24 = *(void *)(a1 + 48);
    uint64_t v25 = *(void *)(a1 + 56);
    *(_DWORD *)uint64_t v29 = 138543874;
    *(void *)&v29[4] = v23;
    *(_WORD *)&v29[12] = 2048;
    *(void *)&v29[14] = v24;
    *(_WORD *)&v29[22] = 2048;
    uint64_t v30 = v25;
    id v26 = v23;
    LODWORD(v28) = 32;
    uint64_t v27 = (void *)_os_log_send_and_compose_impl();

    if (v27)
    {
      BOOL v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v27, 4, v29, v28, *(void *)v29, *(_OWORD *)&v29[8], v30);
      free(v27);
      SSFileLog();
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5 == [WeakRetained lastVisibleIndex])
  {
    int v6 = [*(id *)(a1 + 32) embeddedViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v7 = [MEMORY[0x263F7B1F8] sharedConfig];
      int v8 = [v7 shouldLog];
      if ([v7 shouldLogToDisk]) {
        int v9 = v8 | 2;
      }
      else {
        int v9 = v8;
      }
      int v10 = [v7 OSLogObject];
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        v9 &= 2u;
      }
      if (v9)
      {
        id v11 = objc_loadWeakRetained(v2);
        uint64_t v12 = objc_opt_class();
        uint64_t v13 = *(void *)(a1 + 48);
        uint64_t v14 = *(void *)(a1 + 56);
        *(_DWORD *)uint64_t v29 = 138543874;
        *(void *)&v29[4] = v12;
        *(_WORD *)&v29[12] = 2048;
        *(void *)&v29[14] = v13;
        *(_WORD *)&v29[22] = 2048;
        uint64_t v30 = v14;
        id v15 = v12;
        LODWORD(v28) = 32;
        uint64_t v16 = (void *)_os_log_send_and_compose_impl();

        if (!v16)
        {
LABEL_13:

          BOOL v17 = [v6 originalViewController];
          id v18 = [v17 view];
          [v18 setNeedsLayout];

          id v19 = [v17 view];
          [v19 layoutIfNeeded];

          [*(id *)(a1 + 32) setEmbeddedViewController:v17 animated:0 completion:0];
LABEL_22:

          goto LABEL_23;
        }
        int v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, v29, v28, *(_OWORD *)v29, *(void *)&v29[16], v30);
        free(v16);
        SSFileLog();
      }

      goto LABEL_13;
    }
LABEL_23:
  }
}

- (id)_popHandler
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__SUScriptNavigationSimulator__popHandler__block_invoke;
  v5[3] = &unk_2648130C8;
  v5[4] = self;
  v2 = (void *)MEMORY[0x22A680AE0](v5, a2);
  id v3 = (void *)MEMORY[0x22A680AE0]();

  return v3;
}

void __42__SUScriptNavigationSimulator__popHandler__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 lastVisibleIndex];
  int v6 = [*(id *)(a1 + 32) navigationController];
  int v7 = [v6 viewControllers];
  uint64_t v8 = [v7 indexOfObject:v4];

  if (v8 != 0x7FFFFFFFFFFFFFFFLL && v8 != v5)
  {
    [*(id *)(a1 + 32) setLastVisibleIndex:v8];
    int v10 = *(void **)(a1 + 32);
    [v10 _handlePopFromIndex:v5 toIndex:v8];
  }
}

- (void)_startNextTransition
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v3 = [(SUScriptNavigationSimulator *)self enqueuedTransitions];
  id v4 = [v3 firstObject];

  if (v4 && ![v4 status])
  {
    [v4 setStatus:1];
    objc_initWeak(location, self);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __51__SUScriptNavigationSimulator__startNextTransition__block_invoke;
    v13[3] = &unk_2648130F0;
    objc_copyWeak(&v14, location);
    [v4 addFinishBlock:v13];
    [(SUScriptNavigationSimulator *)self _callCallbackWithWithTransition:v4];
    objc_destroyWeak(&v14);
    objc_destroyWeak(location);
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    uint64_t v8 = [v5 OSLogObject];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      v7 &= 2u;
    }
    if (v7)
    {
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = (id)objc_opt_class();
      id v9 = *(id *)((char *)location + 4);
      LODWORD(v12) = 12;
      int v10 = (void *)_os_log_send_and_compose_impl();

      if (v10)
      {
        id v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, location, v12);
        free(v10);
        SSFileLog();
      }
    }
    else
    {
    }
  }
}

void __51__SUScriptNavigationSimulator__startNextTransition__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__SUScriptNavigationSimulator__startNextTransition__block_invoke_2;
  v5[3] = &unk_264812730;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v7);
}

void __51__SUScriptNavigationSimulator__startNextTransition__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained enqueuedTransitions];
  [v2 removeObject:*(void *)(a1 + 32)];

  [WeakRetained _startNextTransition];
}

- (void)_callCallbackWithWithTransition:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  uint64_t v8 = [v5 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    int v9 = v7;
  }
  else {
    int v9 = v7 & 2;
  }
  if (v9)
  {
    int v10 = objc_opt_class();
    id v11 = v10;
    uint64_t v12 = [v4 fromIndex];
    uint64_t v13 = [v4 toIndex];
    id v14 = [(SUScriptNavigationSimulator *)self transitionCallback];
    int v37 = 138544130;
    int v38 = v10;
    __int16 v39 = 2048;
    uint64_t v40 = v12;
    __int16 v41 = 2048;
    uint64_t v42 = v13;
    __int16 v43 = 2114;
    id v44 = v14;
    LODWORD(v33) = 42;
    id v32 = &v37;
    id v15 = (void *)_os_log_send_and_compose_impl();

    if (!v15) {
      goto LABEL_11;
    }
    uint64_t v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v37, v33);
    free(v15);
    id v32 = (int *)v8;
    SSFileLog();
  }

LABEL_11:
  uint64_t v16 = [(SUScriptNavigationSimulator *)self transitionCallback];

  if (!v16)
  {
    __int16 v23 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v24 = [v23 shouldLog];
    if ([v23 shouldLogToDisk]) {
      int v25 = v24 | 2;
    }
    else {
      int v25 = v24;
    }
    id v26 = objc_msgSend(v23, "OSLogObject", v32);
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      v25 &= 2u;
    }
    if (v25)
    {
      uint64_t v27 = objc_opt_class();
      id v28 = v27;
      uint64_t v29 = [v4 fromIndex];
      uint64_t v30 = [v4 toIndex];
      int v37 = 138543874;
      int v38 = v27;
      __int16 v39 = 2048;
      uint64_t v40 = v29;
      __int16 v41 = 2048;
      uint64_t v42 = v30;
      LODWORD(v33) = 32;
      uint64_t v31 = (void *)_os_log_send_and_compose_impl();

      if (!v31)
      {
LABEL_22:

        [(SUScriptObject *)self dispatchEvent:v4 forName:@"simulatorWillTransition"];
        goto LABEL_23;
      }
      id v26 = objc_msgSend(NSString, "stringWithCString:encoding:", v31, 4, &v37, v33);
      free(v31);
      SSFileLog();
    }

    goto LABEL_22;
  }
  BOOL v17 = [SUScriptFunction alloc];
  id v18 = [(SUScriptNavigationSimulator *)self transitionCallback];
  id v19 = [(SUScriptFunction *)v17 initWithScriptObject:v18];

  [(SUScriptFunction *)v19 setThisObject:self];
  int v20 = objc_msgSend(NSNumber, "numberWithInteger:", -[SUScriptNavigationSimulator _relativeIndexFromIndex:](self, "_relativeIndexFromIndex:", objc_msgSend(v4, "fromIndex")));
  v36[0] = v20;
  int v21 = objc_msgSend(NSNumber, "numberWithInteger:", -[SUScriptNavigationSimulator _relativeIndexFromIndex:](self, "_relativeIndexFromIndex:", objc_msgSend(v4, "toIndex")));
  v36[1] = v21;
  v36[2] = v4;
  id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:3];

  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __63__SUScriptNavigationSimulator__callCallbackWithWithTransition___block_invoke;
  v34[3] = &unk_264813118;
  v34[4] = self;
  id v35 = v4;
  [(SUScriptFunction *)v19 callWithArguments:v22 completionBlock:v34];
  [(SUScriptFunction *)v19 setThisObject:0];

LABEL_23:
}

void __63__SUScriptNavigationSimulator__callCallbackWithWithTransition___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) == 0 || ![v3 BOOLValue])
  {
    int v10 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    uint64_t v13 = [v10 OSLogObject];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      v12 &= 2u;
    }
    if (v12)
    {
      *(_DWORD *)id v28 = 138543618;
      *(void *)&void v28[4] = objc_opt_class();
      *(_WORD *)&v28[12] = 2114;
      *(void *)&v28[14] = v3;
      id v14 = *(id *)&v28[4];
      LODWORD(v27) = 22;
      id v26 = v28;
      id v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15) {
        goto LABEL_22;
      }
      uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, v28, v27, *(void *)v28, *(_OWORD *)&v28[8]);
      free(v15);
      id v26 = v13;
      SSFileLog();
    }

LABEL_22:
    uint64_t v16 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v17 = [v16 shouldLog];
    if ([v16 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    id v19 = objc_msgSend(v16, "OSLogObject", v26);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      v18 &= 2u;
    }
    if (v18)
    {
      int v20 = objc_opt_class();
      int v21 = *(void **)(a1 + 40);
      id v22 = v20;
      uint64_t v23 = [v21 fromIndex];
      uint64_t v24 = [*(id *)(a1 + 40) toIndex];
      *(_DWORD *)id v28 = 138543874;
      *(void *)&void v28[4] = v20;
      *(_WORD *)&v28[12] = 2048;
      *(void *)&v28[14] = v23;
      *(_WORD *)&v28[22] = 2048;
      uint64_t v29 = v24;
      LODWORD(v27) = 32;
      int v25 = (void *)_os_log_send_and_compose_impl();

      if (!v25)
      {
LABEL_31:

        [*(id *)(a1 + 32) dispatchEvent:*(void *)(a1 + 40) forName:@"simulatorWillTransition"];
        goto LABEL_32;
      }
      id v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v25, 4, v28, v27);
      free(v25);
      SSFileLog();
    }

    goto LABEL_31;
  }
  id v4 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  int v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
    v6 &= 2u;
  }
  if (!v6) {
    goto LABEL_11;
  }
  *(_DWORD *)id v28 = 138543362;
  *(void *)&void v28[4] = objc_opt_class();
  id v8 = *(id *)&v28[4];
  LODWORD(v27) = 12;
  int v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    int v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, v28, v27, *(_OWORD *)v28);
    free(v9);
    SSFileLog();
LABEL_11:
  }
LABEL_32:
}

- (int64_t)_relativeIndexFromIndex:(int64_t)a3
{
  return a3 - [(SUScriptNavigationSimulator *)self initialIndex];
}

- (id)_className
{
  return @"iTunesNavigationSimulator";
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id v4 = a3;
  int v5 = [(id)__KeyMapping_10 objectForKey:v4];
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptNavigationSimulator;
    int v5 = objc_msgSendSuper2(&v7, sel_webScriptNameForKeyName_, v4);
  }

  return v5;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  int v5 = SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_7, 3);
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptNavigationSimulator;
    int v5 = objc_msgSendSuper2(&v7, sel_webScriptNameForSelector_, a3);
  }

  return v5;
}

- (id)scriptAttributeKeys
{
  v5.receiver = self;
  v5.super_class = (Class)SUScriptNavigationSimulator;
  v2 = [(SUScriptObject *)&v5 scriptAttributeKeys];
  id v3 = [(id)__KeyMapping_10 allKeys];
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_7 = (uint64_t)sel_popViewWithCompletion_;
    unk_2681B48B0 = @"popView";
    qword_2681B48B8 = (uint64_t)sel_popToViewAtIndex_completion_;
    unk_2681B48C0 = @"popToView";
    qword_2681B48C8 = (uint64_t)sel_pushViewWithCompletion_;
    unk_2681B48D0 = @"pushView";
    __KeyMapping_10 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"transitionCallback", @"visibleIndex", @"visibleIndex", @"indexCount", @"indexCount", 0);
    MEMORY[0x270F9A758]();
  }
}

- (int64_t)initialIndex
{
  return self->_initialIndex;
}

- (void)setInitialIndex:(int64_t)a3
{
  self->_initialIndex = a3;
}

- (int64_t)lastVisibleIndex
{
  return self->_lastVisibleIndex;
}

- (void)setLastVisibleIndex:(int64_t)a3
{
  self->_lastVisibleIndex = a3;
}

- (UINavigationController)navigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);

  return (UINavigationController *)WeakRetained;
}

- (void)setNavigationController:(id)a3
{
}

- (NSMutableArray)enqueuedTransitions
{
  return self->_enqueuedTransitions;
}

- (void)setEnqueuedTransitions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enqueuedTransitions, 0);
  objc_destroyWeak((id *)&self->_navigationController);

  objc_storeStrong((id *)&self->_transitionCallback, 0);
}

@end