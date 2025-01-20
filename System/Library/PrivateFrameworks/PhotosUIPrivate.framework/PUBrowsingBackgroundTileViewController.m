@interface PUBrowsingBackgroundTileViewController
- (BOOL)_needsUpdateColor;
- (BOOL)shouldDisplayEmptyPlaceholder;
- (CGRect)_emptyPlaceholderFrame;
- (CGRect)_emptyPlaceholderFrameForLayoutInfo:(id)a3;
- (NSString)emptyPlaceholderCustomSubtitle;
- (NSString)emptyPlaceholderCustomTitle;
- (PUBrowsingBackgroundTileViewController)initWithReuseIdentifier:(id)a3;
- (PUBrowsingViewModel)viewModel;
- (UIColor)backgroundColorOverride;
- (UIContentUnavailableView)_emptyPlaceholderView;
- (UIVisualEffect)visualEffect;
- (UIVisualEffectView)_backgroundBlurView;
- (id)_nextColorUpdateAnimatorBlock;
- (void)_invalidateColor;
- (void)_invalidateColorWithAnimatorBlock:(id)a3;
- (void)_setBackgroundBlurView:(id)a3;
- (void)_setEmptyPlaceholderFrame:(CGRect)a3;
- (void)_setEmptyPlaceholderView:(id)a3;
- (void)_setNeedsUpdateColor:(BOOL)a3;
- (void)_setNextColorUpdateAnimatorBlock:(id)a3;
- (void)_updateBackgroundBlurViewAnimated:(BOOL)a3;
- (void)_updateColorIfNeeded;
- (void)_updateEmptyPlaceholderAnimated:(BOOL)a3;
- (void)applyLayoutInfo:(id)a3;
- (void)becomeReusable;
- (void)setBackgroundColorOverride:(id)a3;
- (void)setEmptyPlaceholderCustomSubtitle:(id)a3;
- (void)setEmptyPlaceholderCustomTitle:(id)a3;
- (void)setShouldDisplayEmptyPlaceholder:(BOOL)a3;
- (void)setViewModel:(id)a3;
- (void)setVisualEffect:(id)a3;
- (void)viewDidLoad;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUBrowsingBackgroundTileViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__backgroundBlurView, 0);
  objc_storeStrong((id *)&self->__emptyPlaceholderView, 0);
  objc_storeStrong(&self->__nextColorUpdateAnimatorBlock, 0);
  objc_storeStrong((id *)&self->_emptyPlaceholderCustomSubtitle, 0);
  objc_storeStrong((id *)&self->_emptyPlaceholderCustomTitle, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_visualEffect, 0);
  objc_storeStrong((id *)&self->_backgroundColorOverride, 0);
}

- (void)_setBackgroundBlurView:(id)a3
{
}

- (UIVisualEffectView)_backgroundBlurView
{
  return self->__backgroundBlurView;
}

- (CGRect)_emptyPlaceholderFrame
{
  double x = self->__emptyPlaceholderFrame.origin.x;
  double y = self->__emptyPlaceholderFrame.origin.y;
  double width = self->__emptyPlaceholderFrame.size.width;
  double height = self->__emptyPlaceholderFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_setEmptyPlaceholderView:(id)a3
{
}

- (UIContentUnavailableView)_emptyPlaceholderView
{
  return self->__emptyPlaceholderView;
}

- (void)_setNextColorUpdateAnimatorBlock:(id)a3
{
}

- (id)_nextColorUpdateAnimatorBlock
{
  return self->__nextColorUpdateAnimatorBlock;
}

- (void)_setNeedsUpdateColor:(BOOL)a3
{
  self->__needsUpdateColor = a3;
}

- (BOOL)_needsUpdateColor
{
  return self->__needsUpdateColor;
}

- (void)setEmptyPlaceholderCustomSubtitle:(id)a3
{
}

- (NSString)emptyPlaceholderCustomSubtitle
{
  return self->_emptyPlaceholderCustomSubtitle;
}

- (void)setEmptyPlaceholderCustomTitle:(id)a3
{
}

- (NSString)emptyPlaceholderCustomTitle
{
  return self->_emptyPlaceholderCustomTitle;
}

- (PUBrowsingViewModel)viewModel
{
  return self->_viewModel;
}

- (BOOL)shouldDisplayEmptyPlaceholder
{
  return self->_shouldDisplayEmptyPlaceholder;
}

- (UIVisualEffect)visualEffect
{
  return self->_visualEffect;
}

- (UIColor)backgroundColorOverride
{
  return self->_backgroundColorOverride;
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([v6 chromeVisibilityDidChange])
  {
    v7 = [(PUBrowsingBackgroundTileViewController *)self backgroundColorOverride];

    if (!v7)
    {
      v8 = PUBackgroundColorAnimatorBlockForChromeAnimation(v9);
      [(PUBrowsingBackgroundTileViewController *)self _invalidateColorWithAnimatorBlock:v8];
    }
  }
  if ([v6 assetsDataSourceDidChange])
  {
    [(PUBrowsingBackgroundTileViewController *)self _updateEmptyPlaceholderAnimated:1];
    [(PUBrowsingBackgroundTileViewController *)self _updateBackgroundBlurViewAnimated:1];
  }
}

- (void)_updateBackgroundBlurViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(PUTileViewController *)self isViewLoaded]) {
    return;
  }
  v5 = [(PUBrowsingBackgroundTileViewController *)self visualEffect];

  id v6 = [(PUBrowsingBackgroundTileViewController *)self _backgroundBlurView];

  if (!v5)
  {
    if (!v6) {
      return;
    }
    v17 = [(PUBrowsingBackgroundTileViewController *)self _backgroundBlurView];
    v18 = v17;
    if (v3)
    {
      v19 = (void *)MEMORY[0x1E4FB1EB0];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __76__PUBrowsingBackgroundTileViewController__updateBackgroundBlurViewAnimated___block_invoke_2;
      v28[3] = &unk_1E5F2ED10;
      id v29 = v17;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __76__PUBrowsingBackgroundTileViewController__updateBackgroundBlurViewAnimated___block_invoke_3;
      v26[3] = &unk_1E5F2CEE8;
      id v27 = v29;
      [v19 _animateUsingDefaultTimingWithOptions:0 animations:v28 completion:v26];
    }
    else
    {
      [v17 removeFromSuperview];
    }
    [(PUBrowsingBackgroundTileViewController *)self _setBackgroundBlurView:0];
    goto LABEL_15;
  }
  if (!v6)
  {
    id v20 = objc_alloc(MEMORY[0x1E4FB1F00]);
    v21 = [(PUBrowsingBackgroundTileViewController *)self visualEffect];
    v18 = (void *)[v20 initWithEffect:v21];

    v22 = [(PUTileViewController *)self view];
    [v22 bounds];
    objc_msgSend(v18, "setFrame:");

    [v18 setAutoresizingMask:18];
    [v18 setNeedsUpdateConstraints];
    [(PUBrowsingBackgroundTileViewController *)self _setBackgroundBlurView:v18];
    v23 = [(PUTileViewController *)self view];
    [v23 addSubview:v18];

    if (v3)
    {
      [v18 setAlpha:0.0];
      v24 = (void *)MEMORY[0x1E4FB1EB0];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __76__PUBrowsingBackgroundTileViewController__updateBackgroundBlurViewAnimated___block_invoke;
      v30[3] = &unk_1E5F2ED10;
      id v31 = v18;
      [v24 _animateUsingDefaultTimingWithOptions:0 animations:v30 completion:0];
    }
LABEL_15:

    return;
  }
  v7 = [(PUBrowsingBackgroundTileViewController *)self _backgroundBlurView];

  if (v7)
  {
    id v25 = [(PUTileViewController *)self view];
    [v25 bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    v16 = [(PUBrowsingBackgroundTileViewController *)self _backgroundBlurView];
    objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);
  }
}

uint64_t __76__PUBrowsingBackgroundTileViewController__updateBackgroundBlurViewAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __76__PUBrowsingBackgroundTileViewController__updateBackgroundBlurViewAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __76__PUBrowsingBackgroundTileViewController__updateBackgroundBlurViewAnimated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)setVisualEffect:(id)a3
{
  id v5 = a3;
  if ((-[UIVisualEffect isEqual:](self->_visualEffect, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_visualEffect, a3);
    [(PUBrowsingBackgroundTileViewController *)self _updateBackgroundBlurViewAnimated:0];
  }
}

- (void)_updateEmptyPlaceholderAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(PUTileViewController *)self isViewLoaded]) {
    return;
  }
  if (![(PUBrowsingBackgroundTileViewController *)self shouldDisplayEmptyPlaceholder]) {
    goto LABEL_11;
  }
  id v5 = [(PUBrowsingBackgroundTileViewController *)self viewModel];
  id v6 = [v5 assetsDataSource];
  if (([v6 isEmpty] & 1) == 0)
  {

    goto LABEL_11;
  }
  [(PUBrowsingBackgroundTileViewController *)self _emptyPlaceholderFrame];
  BOOL IsNull = CGRectIsNull(v46);

  if (IsNull)
  {
LABEL_11:
    v18 = [(PUBrowsingBackgroundTileViewController *)self _emptyPlaceholderView];

    if (!v18) {
      return;
    }
    v19 = [(PUBrowsingBackgroundTileViewController *)self _emptyPlaceholderView];
    id v20 = v19;
    if (v3)
    {
      v21 = (void *)MEMORY[0x1E4FB1EB0];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __74__PUBrowsingBackgroundTileViewController__updateEmptyPlaceholderAnimated___block_invoke_2;
      v41[3] = &unk_1E5F2ED10;
      id v42 = v19;
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __74__PUBrowsingBackgroundTileViewController__updateEmptyPlaceholderAnimated___block_invoke_3;
      v39[3] = &unk_1E5F2CEE8;
      id v40 = v42;
      [v21 _animateUsingDefaultTimingWithOptions:0 animations:v41 completion:v39];
    }
    else
    {
      [v19 removeFromSuperview];
    }
    [(PUBrowsingBackgroundTileViewController *)self _setEmptyPlaceholderView:0];
    goto LABEL_16;
  }
  double v8 = [(PUBrowsingBackgroundTileViewController *)self _emptyPlaceholderView];

  if (!v8)
  {
    [(PUBrowsingBackgroundTileViewController *)self _emptyPlaceholderFrame];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    id v20 = [MEMORY[0x1E4FB1658] emptyConfiguration];
    v30 = [(PUBrowsingBackgroundTileViewController *)self emptyPlaceholderCustomTitle];
    if (v30)
    {
      [v20 setText:v30];
    }
    else
    {
      id v31 = PXPhotoKitLocalizedTitleForEmptyCollectionListFetchResult();
      [v20 setText:v31];
    }
    v32 = [(PUBrowsingBackgroundTileViewController *)self emptyPlaceholderCustomSubtitle];
    if (v32)
    {
      [v20 setSecondaryText:v32];
    }
    else
    {
      v33 = PXPhotoKitLocalizedMessageForEmptyCollectionListFetchResult();
      v34 = [v33 string];
      [v20 setSecondaryText:v34];
    }
    v35 = (void *)[objc_alloc(MEMORY[0x1E4FB1670]) initWithConfiguration:v20];
    objc_msgSend(v35, "setFrame:", v23, v25, v27, v29);
    [v35 setAutoresizingMask:18];
    [v35 setNeedsUpdateConstraints];
    [(PUBrowsingBackgroundTileViewController *)self _setEmptyPlaceholderView:v35];
    v36 = [(PUTileViewController *)self view];
    [v36 addSubview:v35];

    if (v3)
    {
      [v35 setAlpha:0.0];
      v37 = (void *)MEMORY[0x1E4FB1EB0];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __74__PUBrowsingBackgroundTileViewController__updateEmptyPlaceholderAnimated___block_invoke;
      v43[3] = &unk_1E5F2ED10;
      id v44 = v35;
      [v37 _animateUsingDefaultTimingWithOptions:0 animations:v43 completion:0];
    }
LABEL_16:

    return;
  }
  double v9 = [(PUBrowsingBackgroundTileViewController *)self _emptyPlaceholderView];

  if (v9)
  {
    [(PUBrowsingBackgroundTileViewController *)self _emptyPlaceholderFrame];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    id v38 = [(PUBrowsingBackgroundTileViewController *)self _emptyPlaceholderView];
    objc_msgSend(v38, "setFrame:", v11, v13, v15, v17);
  }
}

uint64_t __74__PUBrowsingBackgroundTileViewController__updateEmptyPlaceholderAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __74__PUBrowsingBackgroundTileViewController__updateEmptyPlaceholderAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __74__PUBrowsingBackgroundTileViewController__updateEmptyPlaceholderAnimated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (CGRect)_emptyPlaceholderFrameForLayoutInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(PUTileViewController *)self view];
  [v5 bounds];

  [v4 expandedRectInsets];
  PXEdgeInsetsAbsoluteValue();
  PXEdgeInsetsInsetRect();
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (void)_setEmptyPlaceholderFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_emptyPlaceholderFrame = &self->__emptyPlaceholderFrame;
  if (!CGRectEqualToRect(self->__emptyPlaceholderFrame, a3))
  {
    p_emptyPlaceholderFrame->origin.CGFloat x = x;
    p_emptyPlaceholderFrame->origin.CGFloat y = y;
    p_emptyPlaceholderFrame->size.CGFloat width = width;
    p_emptyPlaceholderFrame->size.CGFloat height = height;
    [(PUBrowsingBackgroundTileViewController *)self _updateEmptyPlaceholderAnimated:0];
  }
}

- (void)setShouldDisplayEmptyPlaceholder:(BOOL)a3
{
  if (self->_shouldDisplayEmptyPlaceholder != a3)
  {
    self->_shouldDisplayEmptyPlaceholder = a3;
    [(PUBrowsingBackgroundTileViewController *)self _updateEmptyPlaceholderAnimated:0];
  }
}

- (void)_updateColorIfNeeded
{
  if ([(PUBrowsingBackgroundTileViewController *)self _needsUpdateColor]
    && [(PUTileViewController *)self isViewLoaded])
  {
    [(PUBrowsingBackgroundTileViewController *)self _setNeedsUpdateColor:0];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__PUBrowsingBackgroundTileViewController__updateColorIfNeeded__block_invoke;
    aBlock[3] = &unk_1E5F2ED10;
    aBlock[4] = self;
    BOOL v3 = (void (**)(void))_Block_copy(aBlock);
    uint64_t v4 = [(PUBrowsingBackgroundTileViewController *)self _nextColorUpdateAnimatorBlock];
    id v5 = (void *)v4;
    if (v4) {
      (*(void (**)(uint64_t, void (**)(void), void))(v4 + 16))(v4, v3, 0);
    }
    else {
      v3[2](v3);
    }
  }
}

void __62__PUBrowsingBackgroundTileViewController__updateColorIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) backgroundColorOverride];
  if (!v2)
  {
    BOOL v3 = [*(id *)(a1 + 32) viewModel];
    char v4 = [v3 isChromeVisible];

    id v5 = +[PUInterfaceManager currentTheme];
    double v6 = v5;
    if (v4) {
      [v5 photoBrowserChromeVisibleBackgroundColor];
    }
    else {
    id v8 = [v5 photoBrowserChromeHiddenBackgroundColor];
    }

    uint64_t v2 = (uint64_t)v8;
  }
  id v9 = (id)v2;
  double v7 = [*(id *)(a1 + 32) view];
  [v7 setBackgroundColor:v9];
}

- (void)_invalidateColorWithAnimatorBlock:(id)a3
{
  id v4 = a3;
  [(PUBrowsingBackgroundTileViewController *)self _setNeedsUpdateColor:1];
  [(PUBrowsingBackgroundTileViewController *)self _setNextColorUpdateAnimatorBlock:v4];

  [(PUBrowsingBackgroundTileViewController *)self _updateColorIfNeeded];
}

- (void)_invalidateColor
{
}

- (void)setBackgroundColorOverride:(id)a3
{
  id v5 = (UIColor *)a3;
  double v6 = v5;
  if (self->_backgroundColorOverride != v5)
  {
    id v8 = v5;
    char v7 = -[UIColor isEqual:](v5, "isEqual:");
    double v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_backgroundColorOverride, a3);
      [(PUBrowsingBackgroundTileViewController *)self _invalidateColor];
      double v6 = v8;
    }
  }
}

- (void)becomeReusable
{
  v3.receiver = self;
  v3.super_class = (Class)PUBrowsingBackgroundTileViewController;
  [(PUTileViewController *)&v3 becomeReusable];
  [(PUBrowsingBackgroundTileViewController *)self setViewModel:0];
  [(PUBrowsingBackgroundTileViewController *)self setBackgroundColorOverride:0];
  [(PUBrowsingBackgroundTileViewController *)self setVisualEffect:0];
}

- (void)setViewModel:(id)a3
{
  id v5 = (PUBrowsingViewModel *)a3;
  viewModel = self->_viewModel;
  if (viewModel != v5)
  {
    char v7 = v5;
    [(PUBrowsingViewModel *)viewModel unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(PUBrowsingViewModel *)self->_viewModel registerChangeObserver:self];
    [(PUBrowsingBackgroundTileViewController *)self _invalidateColor];
    id v5 = v7;
  }
}

- (void)applyLayoutInfo:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PUBrowsingBackgroundTileViewController;
  id v4 = a3;
  [(PUTileViewController *)&v13 applyLayoutInfo:v4];
  -[PUBrowsingBackgroundTileViewController _emptyPlaceholderFrameForLayoutInfo:](self, "_emptyPlaceholderFrameForLayoutInfo:", v4, v13.receiver, v13.super_class);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  -[PUBrowsingBackgroundTileViewController _setEmptyPlaceholderFrame:](self, "_setEmptyPlaceholderFrame:", v6, v8, v10, v12);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PUBrowsingBackgroundTileViewController;
  [(PUTileViewController *)&v3 viewDidLoad];
  [(PUBrowsingBackgroundTileViewController *)self _updateColorIfNeeded];
  [(PUBrowsingBackgroundTileViewController *)self _updateEmptyPlaceholderAnimated:0];
  [(PUBrowsingBackgroundTileViewController *)self _updateBackgroundBlurViewAnimated:0];
}

- (PUBrowsingBackgroundTileViewController)initWithReuseIdentifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUBrowsingBackgroundTileViewController;
  CGRect result = [(PUTileController *)&v5 initWithReuseIdentifier:a3];
  if (result)
  {
    CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    result->__emptyPlaceholderFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    result->__emptyPlaceholderFrame.size = v4;
  }
  return result;
}

@end