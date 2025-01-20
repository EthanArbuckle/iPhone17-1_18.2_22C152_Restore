@interface VUITransactionButton
- (BOOL)isWaitingForTransactionToStart;
- (BOOL)monitorTransaction;
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (NSSet)transactionIDs;
- (NSString)textContentTitleBackup;
- (VUICircularProgress)progressIndicator;
- (VUITransactionButton)initWithType:(unint64_t)a3 interfaceStyle:(unint64_t)a4;
- (id)_carouselView;
- (void)_addProgressIndicatorWithFrame:(CGRect)a3;
- (void)_buttonTapped:(id)a3 eventName:(id)a4;
- (void)_handleTransactionDidFinishNotification:(id)a3;
- (void)_handleTransactionDidStartNotification:(id)a3;
- (void)_layoutProgressIndicatorIfNeeded;
- (void)_registerForTransactionNotification;
- (void)_unregisterTransactionNotifications;
- (void)_updateProgressIndicatorTintColor:(id)a3;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setMonitorTransaction:(BOOL)a3;
- (void)setProgressIndicator:(id)a3;
- (void)setTextContentTitleBackup:(id)a3;
- (void)setTransactionIDs:(id)a3;
- (void)setWaitingForTransactionToStart:(BOOL)a3;
@end

@implementation VUITransactionButton

- (VUITransactionButton)initWithType:(unint64_t)a3 interfaceStyle:(unint64_t)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)VUITransactionButton;
  v4 = [(VUIButton *)&v15 initWithType:a3 interfaceStyle:a4];
  if (v4)
  {
    objc_initWeak(&location, v4);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __52__VUITransactionButton_initWithType_interfaceStyle___block_invoke;
    v12[3] = &unk_1E6DF4400;
    objc_copyWeak(&v13, &location);
    [(VUIButton *)v4 setSelectActionHandler:v12];
    v5 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    transactionIDs = v4->_transactionIDs;
    v4->_transactionIDs = v5;

    objc_initWeak(&from, v4);
    v16[0] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__VUITransactionButton_initWithType_interfaceStyle___block_invoke_2;
    v9[3] = &unk_1E6DF4CB0;
    objc_copyWeak(&v10, &from);
    [(VUITransactionButton *)v4 vui_registerForTraitChanges:v7 withHandler:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&from);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __52__VUITransactionButton_initWithType_interfaceStyle___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _buttonTapped:v3 eventName:@"select"];
}

void __52__VUITransactionButton_initWithType_interfaceStyle___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained progressIndicator];
  if (v1) {
    [WeakRetained _updateProgressIndicatorTintColor:v1];
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"VUIPurchaseOrSubscribeRequestDidStartNotification" object:0];

  [(VUITransactionButton *)self _unregisterTransactionNotifications];
  v4.receiver = self;
  v4.super_class = (Class)VUITransactionButton;
  [(VUITransactionButton *)&v4 dealloc];
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  v11.receiver = self;
  v11.super_class = (Class)VUITransactionButton;
  -[VUIButton vui_layoutSubviews:computationOnly:](&v11, sel_vui_layoutSubviews_computationOnly_, a4, a3.width, a3.height);
  double v6 = v5;
  double v8 = v7;
  [(VUITransactionButton *)self _layoutProgressIndicatorIfNeeded];
  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)setTransactionIDs:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }
  p_transactionIDs = &self->_transactionIDs;
  objc_storeStrong((id *)&self->_transactionIDs, v5);
  if (!v4) {

  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v7 = *p_transactionIDs;
  uint64_t v8 = [(NSSet *)v7 countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        if (+[VUIActionCommerceTransaction isTransactionInProgressForBuyParams:](VUIActionCommerceTransaction, "isTransactionInProgressForBuyParams:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15))
        {
          uint64_t v8 = 1;
          goto LABEL_15;
        }
      }
      uint64_t v8 = [(NSSet *)v7 countByEnumeratingWithState:&v15 objects:v25 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  objc_super v11 = VUIDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [(NSSet *)*p_transactionIDs count];
    *(_DWORD *)buf = 134218496;
    v20 = self;
    __int16 v21 = 1024;
    int v22 = v8;
    __int16 v23 = 2048;
    uint64_t v24 = v12;
    _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "VUITransactionButton <%p>: anyTransactionsInProgress=%d, [_transactionIds count]=%lu", buf, 0x1Cu);
  }

  [(VUITransactionButton *)self setMonitorTransaction:v8];
  if ((v8 & 1) == 0 && [(NSSet *)*p_transactionIDs count])
  {
    id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 removeObserver:self name:@"VUIPurchaseOrSubscribeRequestDidStartNotification" object:0];

    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:self selector:sel__handleTransactionDidStartNotification_ name:@"VUIPurchaseOrSubscribeRequestDidStartNotification" object:0];
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VUITransactionButton;
  [(VUITransactionButton *)&v11 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  double v7 = [v6 nextFocusedItem];
  if (v7 == self)
  {

LABEL_5:
    double v10 = [(VUITransactionButton *)self progressIndicator];
    [(VUITransactionButton *)self _updateProgressIndicatorTintColor:v10];

    goto LABEL_6;
  }
  uint64_t v8 = v7;
  uint64_t v9 = [v6 previouslyFocusedItem];

  if (v9 == self) {
    goto LABEL_5;
  }
LABEL_6:
}

- (void)setMonitorTransaction:(BOOL)a3
{
  if (self->_monitorTransaction != a3)
  {
    self->_monitorTransaction = a3;
    if (a3)
    {
      double v4 = *MEMORY[0x1E4F1DB28];
      double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      [(VUIButton *)self imageMaxWidth];
      double v7 = v6;
      [(VUIButton *)self imageMaxHeight];
      -[VUITransactionButton _addProgressIndicatorWithFrame:](self, "_addProgressIndicatorWithFrame:", v4, v5, v7, v8);
      [(VUITransactionButton *)self _registerForTransactionNotification];
      uint64_t v9 = [(VUITransactionButton *)self _carouselView];
      id v12 = v9;
      uint64_t v10 = 2;
    }
    else
    {
      objc_super v11 = [(VUITransactionButton *)self progressIndicator];
      objc_msgSend(v11, "vui_removeFromSuperView");

      [(VUITransactionButton *)self setProgressIndicator:0];
      uint64_t v9 = [(VUITransactionButton *)self _carouselView];
      id v12 = v9;
      uint64_t v10 = 0;
    }
    [v9 setScrollMode:v10];
  }
}

- (id)_carouselView
{
  id v3 = [(VUITransactionButton *)self superview];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v5 = [(VUITransactionButton *)self superview];
    if (v5)
    {
      do
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        uint64_t v6 = [v5 superview];

        double v5 = (void *)v6;
      }
      while (v6);
    }
  }
  else
  {
    double v5 = 0;
  }
  return v5;
}

- (void)_layoutProgressIndicatorIfNeeded
{
  [(VUITransactionButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(VUIButton *)self padding];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  uint64_t v19 = [(VUITransactionButton *)self progressIndicator];
  id v36 = (id)v19;
  if (v19)
  {
    double v20 = v4 + v14;
    double v21 = v6 + v12;
    double v22 = v8 - (v14 + v18);
    double v23 = v10 - (v12 + v16);
    uint64_t v24 = [(VUITransactionButton *)self progressIndicator];
    [v24 frame];

    double v25 = v22;
    double v26 = v23;
    if ([(VUIButton *)self buttonType] != 1)
    {
      [(VUIButton *)self imageMaxWidth];
      double v25 = v22;
      if (v27 > 0.0)
      {
        [(VUIButton *)self imageMaxWidth];
        double v25 = v28;
      }
      [(VUIButton *)self imageMaxHeight];
      if (v29 <= 0.0)
      {
        double v26 = v23;
      }
      else
      {
        [(VUIButton *)self imageMaxHeight];
        double v26 = v30;
      }
    }
    [(VUITransactionButton *)self vui_bringSubviewToFront:v36];
    v31 = [(VUITransactionButton *)self progressIndicator];
    objc_msgSend(v31, "setFrame:", v20 + (v22 - v25) * 0.5, v21 + (v23 - v26) * 0.5, v25, v26);

    uint64_t v19 = (uint64_t)v36;
  }
  BOOL v32 = v19 != 0;
  v33 = [(VUIButton *)self textContentView];
  [v33 setHidden:v32];

  v34 = [(VUIButton *)self subtitleContentView];
  [v34 setHidden:v32];

  v35 = [(VUIButton *)self imageView];
  [v35 setHidden:v32];
}

- (void)_buttonTapped:(id)a3 eventName:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(VUITransactionButton *)self isWaitingForTransactionToStart]
    || [(VUITransactionButton *)self monitorTransaction])
  {
    double v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      BOOL v9 = [(VUITransactionButton *)self isWaitingForTransactionToStart];
      __int16 v10 = 1024;
      BOOL v11 = [(VUITransactionButton *)self monitorTransaction];
      _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring transaction button tap. isWaitingForTransactionToStart %d, monitorTransaction %d", buf, 0xEu);
    }
  }
  else
  {
    [(VUITransactionButton *)self setWaitingForTransactionToStart:1];
    double v6 = [(VUIButton *)self selectActionHandler];

    if (v6)
    {
      double v7 = [(VUIButton *)self selectActionHandler];
      v7[2](v7, self);
    }
  }
}

- (void)_updateProgressIndicatorTintColor:(id)a3
{
  id v7 = a3;
  double v4 = [(VUIButton *)self textContentView];
  double v5 = [v4 textLayout];
  double v6 = [v5 color];

  if (!v6)
  {
    double v6 = [(VUITransactionButton *)self vuiTintColor];
  }
  [v7 setVuiTintColor:v6];
}

- (void)_addProgressIndicatorWithFrame:(CGRect)a3
{
  if (!self->_progressIndicator)
  {
    double v6 = -[VUICircularProgress initWithFrame:]([VUICircularProgress alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    double v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(VUICircularProgress *)v6 setVuiBackgroundColor:v4];

    double v5 = [(VUICircularProgress *)v6 vuiLayer];
    [v5 removeAllAnimations];

    [(VUICircularProgress *)v6 setUserInteractionEnabled:0];
    [(VUITransactionButton *)self _updateProgressIndicatorTintColor:v6];
    [(VUICircularProgress *)v6 setIndeterminate:1];
    [(VUITransactionButton *)self vui_addSubview:v6 oldView:0];
    [(VUITransactionButton *)self setProgressIndicator:v6];
  }
}

- (void)_registerForTransactionNotification
{
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleTransactionDidFinishNotification_ name:@"VUISubscribeRequestDidFinishNotification" object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__handleTransactionDidFinishNotification_ name:@"VUIPurchaseRequestDidFinishNotification" object:0];
}

- (void)_unregisterTransactionNotifications
{
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"VUISubscribeRequestDidFinishNotification" object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:@"VUIPurchaseRequestDidFinishNotification" object:0];
}

- (void)_handleTransactionDidStartNotification:(id)a3
{
  id v4 = [a3 userInfo];
  double v5 = [v4 objectForKeyedSubscript:@"TransactionID"];

  if ([v5 length])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63__VUITransactionButton__handleTransactionDidStartNotification___block_invoke;
    v6[3] = &unk_1E6DF3F68;
    v6[4] = self;
    id v7 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void __63__VUITransactionButton__handleTransactionDidStartNotification___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) transactionIDs];
  int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = VUIDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 134217984;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUITransactionButton <%p>: setMonitorTransaction=YES", (uint8_t *)&v6, 0xCu);
    }

    [*(id *)(a1 + 32) setMonitorTransaction:1];
    [*(id *)(a1 + 32) setWaitingForTransactionToStart:0];
  }
}

- (void)_handleTransactionDidFinishNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  int v6 = [v5 objectForKeyedSubscript:@"TransactionID"];

  if ([v6 length])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__VUITransactionButton__handleTransactionDidFinishNotification___block_invoke;
    block[3] = &unk_1E6DF45D8;
    block[4] = self;
    id v8 = v6;
    id v9 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __64__VUITransactionButton__handleTransactionDidFinishNotification___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) transactionIDs];
  int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if (v3)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = objc_msgSend(*(id *)(a1 + 32), "transactionIDs", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          if (+[VUIActionCommerceTransaction isTransactionInProgressForBuyParams:*(void *)(*((void *)&v16 + 1) + 8 * v8)])
          {

            __int16 v10 = VUIDefaultLogObject();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v14 = *(void *)(a1 + 32);
              *(_DWORD *)buf = 134217984;
              uint64_t v21 = v14;
              _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "VUITransactionButton <%p>: one or many transactions still running, do not hide indicator", buf, 0xCu);
            }
            goto LABEL_19;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    id v9 = [*(id *)(a1 + 48) userInfo];
    __int16 v10 = [v9 objectForKeyedSubscript:@"Error"];

    BOOL v11 = VUIDefaultLogObject();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        uint64_t v13 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134217984;
        uint64_t v21 = v13;
        _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "VUITransactionButton <%p>: allTransactionsFinished & there's an error -> hide indicator", buf, 0xCu);
      }

      [*(id *)(a1 + 32) setMonitorTransaction:0];
    }
    else
    {
      if (v12)
      {
        uint64_t v15 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134217984;
        uint64_t v21 = v15;
        _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "VUITransactionButton <%p>: allTransactionsFinished successfully, do not hide indicator, just wait for page refreshing", buf, 0xCu);
      }
    }
LABEL_19:
  }
}

- (NSSet)transactionIDs
{
  return self->_transactionIDs;
}

- (BOOL)isWaitingForTransactionToStart
{
  return self->_waitingForTransactionToStart;
}

- (void)setWaitingForTransactionToStart:(BOOL)a3
{
  self->_waitingForTransactionToStart = a3;
}

- (BOOL)monitorTransaction
{
  return self->_monitorTransaction;
}

- (VUICircularProgress)progressIndicator
{
  return self->_progressIndicator;
}

- (void)setProgressIndicator:(id)a3
{
}

- (NSString)textContentTitleBackup
{
  return self->_textContentTitleBackup;
}

- (void)setTextContentTitleBackup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textContentTitleBackup, 0);
  objc_storeStrong((id *)&self->_progressIndicator, 0);
  objc_storeStrong((id *)&self->_transactionIDs, 0);
}

@end