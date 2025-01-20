@interface PXTranscriptBubbleViewController
- (BOOL)_requiresResizeForCurrentSize:(CGSize)a3;
- (CGSize)_contentViewSizeThatFits:(CGSize)a3;
- (CGSize)contentSizeThatFits:(CGSize)a3;
- (PXTranscriptBubbleDelegate)delegate;
- (UIView)contentView;
- (UIView)targetContentView;
- (void)_resizeTimeoutForRequestID:(int64_t)a3;
- (void)_scheduleContentViewUpdate;
- (void)_switchToPendingTargetViewIfNecessary;
- (void)setContentView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTargetContentView:(id)a3;
- (void)transitionToContentView:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PXTranscriptBubbleViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetContentView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (UIView)targetContentView
{
  return self->_targetContentView;
}

- (void)setContentView:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setDelegate:(id)a3
{
}

- (PXTranscriptBubbleDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXTranscriptBubbleDelegate *)WeakRetained;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)PXTranscriptBubbleViewController;
  [(PXTranscriptBubbleViewController *)&v6 viewDidLoad];
  v3 = [(PXTranscriptBubbleViewController *)self contentView];

  if (v3)
  {
    v4 = [(PXTranscriptBubbleViewController *)self view];
    v5 = [(PXTranscriptBubbleViewController *)self contentView];
    [v4 addSubview:v5];
  }
}

- (void)viewDidLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)PXTranscriptBubbleViewController;
  [(PXTranscriptBubbleViewController *)&v7 viewDidLayoutSubviews];
  v3 = [(PXTranscriptBubbleViewController *)self contentView];
  if (v3)
  {
    BOOL isReadyForDisplay = self->_isReadyForDisplay;

    if (!isReadyForDisplay)
    {
      v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v5 bounds];

      objc_super v6 = [(PXTranscriptBubbleViewController *)self view];
      [v6 bounds];

      PXSizeApproximatelyEqualToSize();
    }
  }
}

void __57__PXTranscriptBubbleViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 1008) = 1;
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 bubbleDidBecomeReadyForDisplay:*(void *)(a1 + 32)];

  if (*(unsigned char *)(a1 + 40))
  {
    v3 = PLUIGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v7 = v4;
      _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "Requesting resize on initial display for %@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__PXTranscriptBubbleViewController_viewDidLayoutSubviews__block_invoke_10;
    block[3] = &unk_1E5DD36F8;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __57__PXTranscriptBubbleViewController_viewDidLayoutSubviews__block_invoke_10(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 requestResizeForBubble:*(void *)(a1 + 32)];
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)PXTranscriptBubbleViewController;
  [(PXTranscriptBubbleViewController *)&v13 viewWillLayoutSubviews];
  if (!self->_transitionInProgress)
  {
    v3 = [(PXTranscriptBubbleViewController *)self view];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    v12 = [(PXTranscriptBubbleViewController *)self contentView];
    objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
  }
}

- (void)_switchToPendingTargetViewIfNecessary
{
  v3 = [(PXTranscriptBubbleViewController *)self targetContentView];
  if (v3)
  {
    double v4 = [(PXTranscriptBubbleViewController *)self contentView];
    [(PXTranscriptBubbleViewController *)self setTargetContentView:0];
    objc_msgSend(v3, "setFrame:", 0.0, 0.0, self->_lastRequestedSize.width, self->_lastRequestedSize.height);
    [v3 setAlpha:0.0];
    double v5 = [(PXTranscriptBubbleViewController *)self view];
    [v5 addSubview:v3];

    self->_transitionInProgress = 1;
    double v6 = (void *)MEMORY[0x1E4FB1EB0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __73__PXTranscriptBubbleViewController__switchToPendingTargetViewIfNecessary__block_invoke;
    v11[3] = &unk_1E5DD32A8;
    id v12 = v4;
    id v13 = v3;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __73__PXTranscriptBubbleViewController__switchToPendingTargetViewIfNecessary__block_invoke_2;
    v8[3] = &unk_1E5DCE438;
    v8[4] = self;
    id v9 = v13;
    id v10 = v12;
    id v7 = v12;
    [v6 animateWithDuration:v11 animations:v8 completion:0.8];
  }
}

uint64_t __73__PXTranscriptBubbleViewController__switchToPendingTargetViewIfNecessary__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  id v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:1.0];
}

void __73__PXTranscriptBubbleViewController__switchToPendingTargetViewIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 976) = 0;
  [*(id *)(a1 + 32) setContentView:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) removeFromSuperview];
  id v2 = PLUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "PXTranscriptBubbleViewController %@: Transitioned to new contentView", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_resizeTimeoutForRequestID:(int64_t)a3
{
  if (self->_lastResizeRequestID == a3)
  {
    int v4 = [(PXTranscriptBubbleViewController *)self targetContentView];

    if (v4)
    {
      uint64_t v5 = PLUIGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v6 = 0;
        _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "PXTranscriptBubbleViewController: Never received size update after requestResize. Forcing UI update. UI may appear truncated", v6, 2u);
      }

      [(PXTranscriptBubbleViewController *)self _switchToPendingTargetViewIfNecessary];
    }
  }
}

- (void)_scheduleContentViewUpdate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PXTranscriptBubbleViewController *)self targetContentView];

  if (v3)
  {
    int v4 = [(PXTranscriptBubbleViewController *)self view];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;

    BOOL v9 = -[PXTranscriptBubbleViewController _requiresResizeForCurrentSize:](self, "_requiresResizeForCurrentSize:", v6, v8);
    id v10 = PLUIGetLog();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        v19 = self;
        _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, "Requesting resize on content view change for %@", buf, 0xCu);
      }

      id v12 = (void *)(self->_lastResizeRequestID + 1);
      self->_lastResizeRequestID = (int64_t)v12;
      id v13 = [(PXTranscriptBubbleViewController *)self delegate];
      [v13 requestResizeForBubble:self];

      objc_initWeak((id *)buf, self);
      dispatch_time_t v14 = dispatch_time(0, 3000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__PXTranscriptBubbleViewController__scheduleContentViewUpdate__block_invoke;
      block[3] = &unk_1E5DD0260;
      objc_copyWeak(v17, (id *)buf);
      v17[1] = v12;
      dispatch_after(v14, MEMORY[0x1E4F14428], block);
      objc_destroyWeak(v17);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        v19 = self;
        _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, "Skipping resize on content view change for %@", buf, 0xCu);
      }

      self->_lastRequestedSize.width = v6;
      self->_lastRequestedSize.height = v8;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __62__PXTranscriptBubbleViewController__scheduleContentViewUpdate__block_invoke_5;
      v15[3] = &unk_1E5DD36F8;
      v15[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], v15);
    }
  }
}

void __62__PXTranscriptBubbleViewController__scheduleContentViewUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resizeTimeoutForRequestID:*(void *)(a1 + 40)];
}

uint64_t __62__PXTranscriptBubbleViewController__scheduleContentViewUpdate__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _switchToPendingTargetViewIfNecessary];
}

- (void)transitionToContentView:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = [(PXTranscriptBubbleViewController *)self targetContentView];

    if (v5)
    {
      double v6 = PLUIGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "PXTranscriptBubbleViewController: attempting to transition to a new target view while waiting on a transition. This likely indicates a bug or will lead to visual glitches", buf, 2u);
      }
    }
    double v7 = PLUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "PXTranscriptBubbleViewController: Transitioning to new content view", v10, 2u);
    }

    double v8 = [(PXTranscriptBubbleViewController *)self contentView];

    if (v8)
    {
      [(PXTranscriptBubbleViewController *)self setTargetContentView:v4];
    }
    else
    {
      [(PXTranscriptBubbleViewController *)self setContentView:v4];
      BOOL v9 = [(PXTranscriptBubbleViewController *)self viewIfLoaded];
      [v9 addSubview:v4];
    }
  }
}

- (void)setTargetContentView:(id)a3
{
  double v5 = (UIView *)a3;
  if (self->_targetContentView != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_targetContentView, a3);
    [(PXTranscriptBubbleViewController *)self _scheduleContentViewUpdate];
    double v5 = v6;
  }
}

- (BOOL)_requiresResizeForCurrentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  -[PXTranscriptBubbleViewController _contentViewSizeThatFits:](self, "_contentViewSizeThatFits:");
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  BOOL v10 = vabdd_f64(v8, height) > 10.0;
  BOOL v11 = vabdd_f64(v6, width) > 10.0 || v10;
  id v12 = PLUIGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (v11) {
      id v13 = @"Wants resize";
    }
    else {
      id v13 = @"Skipping resize";
    }
    v26.double width = width;
    v26.double height = height;
    dispatch_time_t v14 = NSStringFromCGSize(v26);
    v27.double width = v7;
    v27.double height = v9;
    v15 = NSStringFromCGSize(v27);
    int v17 = 138413058;
    v18 = v13;
    __int16 v19 = 2112;
    uint64_t v20 = self;
    __int16 v21 = 2112;
    v22 = v14;
    __int16 v23 = 2112;
    v24 = v15;
    _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "%@ for %@. Current size: %@. Target size: %@", (uint8_t *)&v17, 0x2Au);
  }
  return v11;
}

- (CGSize)_contentViewSizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(PXTranscriptBubbleViewController *)self targetContentView];

  if (v6)
  {
    CGFloat v7 = [(PXTranscriptBubbleViewController *)self targetContentView];
LABEL_5:
    CGFloat v9 = v7;
    objc_msgSend(v7, "sizeThatFits:", width, height);
    double v11 = v10;
    double v13 = v12;

    double v14 = v11;
    double v15 = v13;
    goto LABEL_9;
  }
  double v8 = [(PXTranscriptBubbleViewController *)self contentView];

  if (v8)
  {
    CGFloat v7 = [(PXTranscriptBubbleViewController *)self contentView];
    goto LABEL_5;
  }
  v16 = PLUIGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17[0] = 0;
    _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_ERROR, "Unexpected request for transcript bubble content size with no view", (uint8_t *)v17, 2u);
  }

  -[PXTranscriptBubbleViewController workaroundSizeForSize:](self, "workaroundSizeForSize:", width, height);
LABEL_9:
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (CGSize)contentSizeThatFits:(CGSize)a3
{
  -[PXTranscriptBubbleViewController _contentViewSizeThatFits:](self, "_contentViewSizeThatFits:", a3.width, a3.height);
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  self->_lastRequestedSize.double width = v4;
  self->_lastRequestedSize.double height = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PXTranscriptBubbleViewController_contentSizeThatFits___block_invoke;
  block[3] = &unk_1E5DD35E0;
  *(CGFloat *)&void block[5] = v4;
  *(CGFloat *)&block[6] = v6;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

uint64_t __56__PXTranscriptBubbleViewController_contentSizeThatFits___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PLSharingGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSStringFromCGSize(*(CGSize *)(a1 + 40));
    int v5 = 138412290;
    CGFloat v6 = v3;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "Provided Messages with new size %@. Updating content view", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 32) _switchToPendingTargetViewIfNecessary];
}

@end