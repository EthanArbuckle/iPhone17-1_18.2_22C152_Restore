@interface SBHPageManagementCellView
- (BOOL)hasCleanedUpListView;
- (BOOL)isListHighlighted;
- (BOOL)scalesListView;
- (MTMaterialView)listBackgroundView;
- (MTMaterialView)toggleButtonBackgroundView;
- (SBFolder)folder;
- (SBHPageManagementCellView)initWithListView:(id)a3 listBackgroundView:(id)a4 toggleButtonBackgroundView:(id)a5 folder:(id)a6 metrics:(SBHPageManagementCellMetrics *)a7 toggleButtonAllowed:(BOOL)a8;
- (SBHPageManagementCheckbox)toggleButton;
- (SBIconImageInfo)iconImageInfo;
- (SBIconListView)listView;
- (UIView)listHighlightView;
- (double)toggleButtonAlpha;
- (void)_togglePageHidden:(id)a3;
- (void)cleanUpListView;
- (void)folder:(id)a3 listHiddenDidChange:(id)a4;
- (void)iconListHiddenDidChange:(id)a3;
- (void)layoutSubviews;
- (void)setHasCleanedUpListView:(BOOL)a3;
- (void)setIconImageInfo:(SBIconImageInfo *)a3;
- (void)setListHighlighted:(BOOL)a3;
- (void)setScalesListView:(BOOL)a3;
- (void)setToggleButtonAlpha:(double)a3;
@end

@implementation SBHPageManagementCellView

- (SBHPageManagementCellView)initWithListView:(id)a3 listBackgroundView:(id)a4 toggleButtonBackgroundView:(id)a5 folder:(id)a6 metrics:(SBHPageManagementCellMetrics *)a7 toggleButtonAllowed:(BOOL)a8
{
  BOOL v8 = a8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  v44.receiver = self;
  v44.super_class = (Class)SBHPageManagementCellView;
  v19 = [(SBHPageManagementCellView *)&v44 init];
  v20 = v19;
  if (v19)
  {
    id v43 = v17;
    objc_storeStrong((id *)&v19->_listView, a3);
    objc_storeStrong((id *)&v20->_listBackgroundView, a4);
    objc_storeStrong((id *)&v20->_folder, a6);
    v20->_scalesListView = 1;
    long long v22 = *(_OWORD *)&a7->backgroundInsets.bottom;
    long long v21 = *(_OWORD *)&a7->listViewVerticalPositionAdjustment;
    long long v23 = *(_OWORD *)&a7->backgroundInsets.top;
    v20->_metrics.toggleButtonVerticalMargin = a7->toggleButtonVerticalMargin;
    *(_OWORD *)&v20->_metrics.backgroundInsets.bottom = v22;
    *(_OWORD *)&v20->_metrics.listViewVerticalPositionAdjustment = v21;
    *(_OWORD *)&v20->_metrics.backgroundInsets.top = v23;
    CGSize fullListViewSize = a7->fullListViewSize;
    CGSize scaledListViewSize = a7->scaledListViewSize;
    long long v26 = *(_OWORD *)&a7->foregroundInsets.bottom;
    *(_OWORD *)&v20->_metrics.foregroundInsets.top = *(_OWORD *)&a7->foregroundInsets.top;
    *(_OWORD *)&v20->_metrics.foregroundInsets.bottom = v26;
    v20->_metrics.CGSize fullListViewSize = fullListViewSize;
    v20->_metrics.CGSize scaledListViewSize = scaledListViewSize;
    if (v16) {
      [(SBHPageManagementCellView *)v20 addSubview:v16];
    }
    v27 = [v15 model];
    int v28 = [v27 isHidden];
    v29 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    listHighlightView = v20->_listHighlightView;
    v20->_listHighlightView = v29;

    v31 = v20->_listHighlightView;
    v32 = [MEMORY[0x1E4FB1618] colorWithWhite:0.274509804 alpha:1.0];
    [(UIView *)v31 setBackgroundColor:v32];

    v33 = [(UIView *)v20->_listHighlightView layer];
    [v33 setCompositingFilter:*MEMORY[0x1E4F3A018]];

    [(UIView *)v20->_listHighlightView setAlpha:0.0];
    [(SBHPageManagementCellView *)v20 addSubview:v20->_listHighlightView];
    if (v15)
    {
      double v34 = 0.5;
      if (!v28) {
        double v34 = 1.0;
      }
      [v15 setAlpha:v34];
      [(SBHPageManagementCellView *)v20 addSubview:v15];
    }
    if (v8)
    {
      v35 = [SBHPageManagementCheckbox alloc];
      uint64_t v36 = -[SBHPageManagementCheckbox initWithFrame:checkboxDiameter:backgroundView:](v35, "initWithFrame:checkboxDiameter:backgroundView:", v43, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), a7->toggleButtonDiameter);
      toggleButton = v20->_toggleButton;
      v20->_toggleButton = (SBHPageManagementCheckbox *)v36;

      [(SBHPageManagementCheckbox *)v20->_toggleButton setSelected:v28 ^ 1u animated:0];
      v38 = v20->_toggleButton;
      if (v28) {
        uint64_t v39 = 1;
      }
      else {
        uint64_t v39 = [v18 hasMultipleVisibleNonTrailingEmptyLists];
      }
      [(SBHPageManagementCheckbox *)v38 setEnabled:v39];
      -[SBHPageManagementCheckbox setHidden:](v20->_toggleButton, "setHidden:", [v18 isTrailingEmptyList:v27]);
      [(SBHPageManagementCheckbox *)v20->_toggleButton addTarget:v20 action:sel__togglePageHidden_ forControlEvents:0x2000];
      [(SBHPageManagementCellView *)v20 addSubview:v20->_toggleButton];
    }
    v40 = [(SBHPageManagementCellView *)v20 layer];
    [v40 setAllowsGroupBlending:0];

    [(SBHPageManagementCellView *)v20 setAutoresizesSubviews:0];
    [v18 addFolderObserver:v20];
    v41 = [v15 model];
    [v41 addListObserver:v20];

    [(SBHPageManagementCellView *)v20 setAccessibilityIdentifier:@"page container"];
    id v17 = v43;
  }

  return v20;
}

- (void)layoutSubviews
{
  v44.receiver = self;
  v44.super_class = (Class)SBHPageManagementCellView;
  [(SBHPageManagementCellView *)&v44 layoutSubviews];
  [(SBHPageManagementCellView *)self iconImageInfo];
  CGFloat v4 = v3;
  uint64_t v29 = v6;
  uint64_t v30 = v5;
  p_metrics = &self->_metrics;
  double toggleButtonDiameter = self->_metrics.toggleButtonDiameter;
  double toggleButtonVerticalMargin = self->_metrics.toggleButtonVerticalMargin;
  CGFloat rect = v9;
  if ([(SBHPageManagementCellView *)self scalesListView])
  {
    double listViewVerticalPositionAdjustment = self->_metrics.listViewVerticalPositionAdjustment;
    double width = p_metrics->fullListViewSize.width;
    double height = self->_metrics.fullListViewSize.height;
    double v14 = self->_metrics.scaledListViewSize.width;
    double v13 = self->_metrics.scaledListViewSize.height;
  }
  else
  {
    double width = p_metrics->fullListViewSize.width;
    double height = self->_metrics.fullListViewSize.height;
    double listViewVerticalPositionAdjustment = 0.0;
    double v13 = height;
    double v14 = p_metrics->fullListViewSize.width;
  }
  memset(&remainder, 0, sizeof(remainder));
  memset(&slice, 0, sizeof(slice));
  v45.origin.x = 0.0;
  v45.origin.y = 0.0;
  v45.size.double width = v4;
  v45.size.double height = rect;
  CGRectDivide(v45, &slice, &remainder, toggleButtonDiameter + toggleButtonVerticalMargin, CGRectMaxYEdge);
  if ([(SBHPageManagementCellView *)self hasCleanedUpListView])
  {
    id v15 = 0;
  }
  else
  {
    id v15 = [(SBHPageManagementCellView *)self listView];
  }
  memset(&v41, 0, sizeof(v41));
  CGAffineTransformMakeScale(&v41, v14 / width, v13 / height);
  double v16 = v14 * 0.5 + (CGRectGetWidth(remainder) - v14) * 0.5;
  objc_msgSend(v15, "setBounds:", 0.0, 0.0, width, height);
  objc_msgSend(v15, "setCenter:", v16, listViewVerticalPositionAdjustment + v13 * 0.5);
  CGAffineTransform v40 = v41;
  [v15 setTransform:&v40];
  id v17 = [(SBHPageManagementCellView *)self listBackgroundView];
  double v18 = remainder.size.width;
  double v19 = remainder.size.height;
  UIRectGetCenter();
  double v21 = v20;
  double v23 = v22;
  objc_msgSend(v17, "setBounds:", 0.0, 0.0, v18, v19);
  objc_msgSend(v17, "setCenter:", v21, v23);
  v24 = [(SBHPageManagementCellView *)self listHighlightView];
  objc_msgSend(v24, "setBounds:", 0.0, 0.0, v18, v19);
  objc_msgSend(v24, "setCenter:", v21, v23);
  v25 = (void *)MEMORY[0x1E4FB1EB0];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __43__SBHPageManagementCellView_layoutSubviews__block_invoke;
  v33[3] = &unk_1E6AAEE98;
  CGFloat v36 = v4;
  CGFloat v37 = rect;
  uint64_t v38 = v30;
  uint64_t v39 = v29;
  id v34 = v17;
  id v35 = v24;
  id v26 = v24;
  id v27 = v17;
  [v25 performWithoutAnimation:v33];
  int v28 = [(SBHPageManagementCellView *)self toggleButton];
  objc_msgSend(v28, "setBounds:", 0.0, 0.0, toggleButtonDiameter, toggleButtonDiameter);
  v46.origin.x = 0.0;
  v46.origin.y = 0.0;
  v46.size.double width = v18;
  v46.size.double height = v19;
  objc_msgSend(v28, "setCenter:", v21, toggleButtonDiameter * 0.5 + toggleButtonVerticalMargin + v23 + CGRectGetHeight(v46) * 0.5);
}

uint64_t __43__SBHPageManagementCellView_layoutSubviews__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setContinuousCornerRadius:*(double *)(a1 + 72)];
  v2 = *(void **)(a1 + 40);
  double v3 = *(double *)(a1 + 72);
  return [v2 _setContinuousCornerRadius:v3];
}

- (void)setScalesListView:(BOOL)a3
{
  if (self->_scalesListView != a3)
  {
    self->_scalesListView = a3;
    [(SBHPageManagementCellView *)self setNeedsLayout];
  }
}

- (void)setToggleButtonAlpha:(double)a3
{
  id v4 = [(SBHPageManagementCellView *)self toggleButton];
  [v4 setAlpha:a3];
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  double v10 = v3;
  p_iconImageInfo = &self->_iconImageInfo;
  if (!SBIconImageInfoEqualToIconImageInfo(v3, v4, v5, v6, self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius))
  {
    p_iconImageInfo->size.double width = v10;
    p_iconImageInfo->size.double height = v9;
    p_iconImageInfo->scale = v8;
    p_iconImageInfo->continuousCornerRadius = v7;
    [(SBHPageManagementCellView *)self setNeedsLayout];
  }
}

- (void)setListHighlighted:(BOOL)a3
{
  if (self->_listHighlighted != a3)
  {
    BOOL v3 = a3;
    self->_listHighlighted = a3;
    double v4 = [(SBHPageManagementCellView *)self listHighlightView];
    double v5 = v4;
    if (v3)
    {
      [v4 setAlpha:0.5];
    }
    else
    {
      double v6 = (void *)MEMORY[0x1E4FB1EB0];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __48__SBHPageManagementCellView_setListHighlighted___block_invoke;
      v7[3] = &unk_1E6AAC810;
      id v8 = v4;
      [v6 animateWithDuration:2 delay:v7 options:0 animations:0.2 completion:0.0];
    }
  }
}

uint64_t __48__SBHPageManagementCellView_setListHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

- (void)cleanUpListView
{
  BOOL v3 = [(SBHPageManagementCellView *)self listView];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v4;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v3 setTransform:v5];
  [(SBHPageManagementCellView *)self setHasCleanedUpListView:1];
}

- (void)_togglePageHidden:(id)a3
{
  id v9 = [(SBHPageManagementCellView *)self listView];
  long long v4 = [v9 model];
  double v5 = [(SBHPageManagementCellView *)self folder];
  int v6 = [v5 hasMultipleVisibleNonTrailingEmptyLists];
  uint64_t v7 = v6 & ~[v4 isHidden];
  [v4 setHidden:v7];
  if (v7 == 1)
  {
    id v8 = [MEMORY[0x1E4FA5E78] sharedInstance];
    [v8 emitEvent:57];
  }
}

- (void)iconListHiddenDidChange:(id)a3
{
  int v4 = [a3 isHidden];
  double v5 = [(SBHPageManagementCellView *)self listView];
  double v6 = 1.0;
  uint64_t v7 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v11 = 3221225472;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  v12 = __53__SBHPageManagementCellView_iconListHiddenDidChange___block_invoke;
  double v13 = &unk_1E6AAC838;
  if (v4) {
    double v6 = 0.5;
  }
  id v14 = v5;
  double v15 = v6;
  id v8 = v5;
  [v7 animateWithDuration:2 delay:&v10 options:0 animations:0.3 completion:0.0];
  id v9 = [(SBHPageManagementCellView *)self toggleButton];
  [v9 setSelected:v4 ^ 1u];
}

uint64_t __53__SBHPageManagementCellView_iconListHiddenDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (void)folder:(id)a3 listHiddenDidChange:(id)a4
{
  id v5 = a3;
  id v10 = [(SBHPageManagementCellView *)self toggleButton];
  double v6 = [(SBHPageManagementCellView *)self listView];
  uint64_t v7 = [v6 model];
  int v8 = [v7 isHidden];
  unsigned int v9 = [v5 hasMultipleVisibleNonTrailingEmptyLists];

  [v10 setEnabled:v8 | v9];
}

- (SBIconListView)listView
{
  return self->_listView;
}

- (MTMaterialView)listBackgroundView
{
  return self->_listBackgroundView;
}

- (UIView)listHighlightView
{
  return self->_listHighlightView;
}

- (MTMaterialView)toggleButtonBackgroundView
{
  return self->_toggleButtonBackgroundView;
}

- (SBFolder)folder
{
  return self->_folder;
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (BOOL)scalesListView
{
  return self->_scalesListView;
}

- (SBHPageManagementCheckbox)toggleButton
{
  return self->_toggleButton;
}

- (BOOL)isListHighlighted
{
  return self->_listHighlighted;
}

- (BOOL)hasCleanedUpListView
{
  return self->_hasCleanedUpListView;
}

- (void)setHasCleanedUpListView:(BOOL)a3
{
  self->_hasCleanedUpListView = a3;
}

- (double)toggleButtonAlpha
{
  return self->_toggleButtonAlpha;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleButton, 0);
  objc_storeStrong((id *)&self->_folder, 0);
  objc_storeStrong((id *)&self->_toggleButtonBackgroundView, 0);
  objc_storeStrong((id *)&self->_listHighlightView, 0);
  objc_storeStrong((id *)&self->_listBackgroundView, 0);
  objc_storeStrong((id *)&self->_listView, 0);
}

@end