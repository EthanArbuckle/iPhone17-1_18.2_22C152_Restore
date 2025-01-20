@interface SBHPageManagementCellViewController
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isEditing;
- (BOOL)isUserInteractionEnabled;
- (BOOL)scalesListView;
- (BOOL)showsSquareCorners;
- (BOOL)wantsCaptureOnlyBackgroundView;
- (CGPoint)snapshotViewCenter;
- (CGRect)visibleBounds;
- (MTMaterialView)listBackgroundView;
- (MTMaterialView)toggleButtonBackgroundView;
- (SBFolder)folder;
- (SBHPageManagementCellViewController)initWithListView:(id)a3 listBackgroundView:(id)a4 toggleButtonBackgroundView:(id)a5 folder:(id)a6 metrics:(SBHPageManagementCellMetrics *)a7 toggleButtonAllowed:(BOOL)a8;
- (SBHPageManagementCellViewControllerDelegate)delegate;
- (SBIconImageInfo)iconImageInfo;
- (SBIconListView)listView;
- (UIBezierPath)snapshotViewVisiblePath;
- (UIGestureRecognizer)tapGestureRecognizer;
- (UIView)snapshotView;
- (double)continuousCornerRadius;
- (double)toggleButtonAlpha;
- (id)backgroundViewProvider;
- (id)listHighlightView;
- (void)cancelGestures;
- (void)cleanUpListView;
- (void)listViewTapped:(id)a3;
- (void)loadView;
- (void)setBackgroundViewProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setIconImageInfo:(SBIconImageInfo *)a3;
- (void)setListHighlighted:(BOOL)a3;
- (void)setScalesListView:(BOOL)a3;
- (void)setShowsSquareCorners:(BOOL)a3;
- (void)setToggleButtonAlpha:(double)a3;
@end

@implementation SBHPageManagementCellViewController

- (SBHPageManagementCellViewController)initWithListView:(id)a3 listBackgroundView:(id)a4 toggleButtonBackgroundView:(id)a5 folder:(id)a6 metrics:(SBHPageManagementCellMetrics *)a7 toggleButtonAllowed:(BOOL)a8
{
  id v29 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v30.receiver = self;
  v30.super_class = (Class)SBHPageManagementCellViewController;
  v18 = [(SBHPageManagementCellViewController *)&v30 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_listView, a3);
    objc_storeStrong((id *)&v19->_listBackgroundView, a4);
    objc_storeStrong((id *)&v19->_toggleButtonBackgroundView, a5);
    objc_storeStrong((id *)&v19->_folder, a6);
    long long v20 = *(_OWORD *)&a7->foregroundInsets.bottom;
    CGSize fullListViewSize = a7->fullListViewSize;
    CGSize scaledListViewSize = a7->scaledListViewSize;
    *(_OWORD *)&v19->_metrics.foregroundInsets.top = *(_OWORD *)&a7->foregroundInsets.top;
    *(_OWORD *)&v19->_metrics.foregroundInsets.bottom = v20;
    v19->_metrics.CGSize fullListViewSize = fullListViewSize;
    v19->_metrics.CGSize scaledListViewSize = scaledListViewSize;
    long long v24 = *(_OWORD *)&a7->backgroundInsets.bottom;
    long long v23 = *(_OWORD *)&a7->listViewVerticalPositionAdjustment;
    long long v25 = *(_OWORD *)&a7->backgroundInsets.top;
    v19->_metrics.toggleButtonVerticalMargin = a7->toggleButtonVerticalMargin;
    *(_OWORD *)&v19->_metrics.backgroundInsets.bottom = v24;
    *(_OWORD *)&v19->_metrics.listViewVerticalPositionAdjustment = v23;
    *(_OWORD *)&v19->_metrics.backgroundInsets.top = v25;
    v19->_toggleButtonAllowed = a8;
    v26 = [[SBHPageManagementListTapGestureRecognizer alloc] initWithTarget:v19 action:sel_listViewTapped_];
    tapGestureRecognizer = v19->_tapGestureRecognizer;
    v19->_tapGestureRecognizer = &v26->super;

    [(UIGestureRecognizer *)v19->_tapGestureRecognizer setDelegate:v19];
  }

  return v19;
}

- (void)loadView
{
  v3 = [(SBHPageManagementCellViewController *)self listView];
  v4 = [SBHPageManagementCellView alloc];
  v5 = [(SBHPageManagementCellViewController *)self listBackgroundView];
  v6 = [(SBHPageManagementCellViewController *)self toggleButtonBackgroundView];
  v7 = [(SBHPageManagementCellViewController *)self folder];
  BOOL toggleButtonAllowed = self->_toggleButtonAllowed;
  long long v9 = *(_OWORD *)&self->_metrics.backgroundInsets.bottom;
  v13[4] = *(_OWORD *)&self->_metrics.backgroundInsets.top;
  v13[5] = v9;
  v13[6] = *(_OWORD *)&self->_metrics.listViewVerticalPositionAdjustment;
  double toggleButtonVerticalMargin = self->_metrics.toggleButtonVerticalMargin;
  CGSize scaledListViewSize = self->_metrics.scaledListViewSize;
  v13[0] = self->_metrics.fullListViewSize;
  v13[1] = scaledListViewSize;
  long long v11 = *(_OWORD *)&self->_metrics.foregroundInsets.bottom;
  v13[2] = *(_OWORD *)&self->_metrics.foregroundInsets.top;
  v13[3] = v11;
  v12 = [(SBHPageManagementCellView *)v4 initWithListView:v3 listBackgroundView:v5 toggleButtonBackgroundView:v6 folder:v7 metrics:v13 toggleButtonAllowed:toggleButtonAllowed];

  [v3 addGestureRecognizer:self->_tapGestureRecognizer];
  [(SBHPageManagementCellViewController *)self setView:v12];
}

- (void)listViewTapped:(id)a3
{
  id v21 = a3;
  v4 = [(SBHPageManagementCellViewController *)self listBackgroundView];
  [v21 locationInView:v4];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  [v4 bounds];
  v23.x = v6;
  v23.y = v8;
  BOOL v9 = CGRectContainsPoint(v24, v23);
  v10 = [(SBHPageManagementCellViewController *)self delegate];
  long long v11 = v10;
  if (v10) {
    int v12 = [v10 pageManagementCellViewControllerCanReceiveTap:self];
  }
  else {
    int v12 = 1;
  }
  uint64_t v13 = [v21 state];
  if ((unint64_t)(v13 - 1) < 2)
  {
    if (v11) {
      int v16 = [v11 pageManagementCellViewControllerShouldSuppressHighlight:self] ^ 1;
    }
    else {
      int v16 = 0;
    }
    unsigned int v20 = v12 & v16;
    if (v9) {
      uint64_t v15 = v20;
    }
    else {
      uint64_t v15 = 0;
    }
    v14 = self;
    goto LABEL_19;
  }
  if ((unint64_t)(v13 - 4) < 2)
  {
    v14 = self;
    uint64_t v15 = 0;
LABEL_19:
    [(SBHPageManagementCellViewController *)v14 setListHighlighted:v15];
    goto LABEL_20;
  }
  if (v13 == 3)
  {
    [(SBHPageManagementCellViewController *)self setListHighlighted:0];
    id v17 = [(SBHPageManagementCellViewController *)self listView];
    v18 = [v17 model];
    char v19 = [v18 isHidden];
    if ((v9 & v12) == 1 && (v19 & 1) == 0) {
      [v11 pageManagementCellViewControllerDidReceiveTap:self];
    }
  }
LABEL_20:
}

- (BOOL)scalesListView
{
  v2 = [(SBHPageManagementCellViewController *)self pageManagementCellView];
  char v3 = [v2 scalesListView];

  return v3;
}

- (void)setScalesListView:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBHPageManagementCellViewController *)self pageManagementCellView];
  [v4 setScalesListView:v3];
}

- (double)toggleButtonAlpha
{
  v2 = [(SBHPageManagementCellViewController *)self pageManagementCellView];
  [v2 toggleButtonAlpha];
  double v4 = v3;

  return v4;
}

- (void)setToggleButtonAlpha:(double)a3
{
  id v4 = [(SBHPageManagementCellViewController *)self pageManagementCellView];
  [v4 setToggleButtonAlpha:a3];
}

- (id)listHighlightView
{
  v2 = [(SBHPageManagementCellViewController *)self pageManagementCellView];
  double v3 = [v2 listHighlightView];

  return v3;
}

- (void)setListHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBHPageManagementCellViewController *)self pageManagementCellView];
  [v4 setListHighlighted:v3];
}

- (void)cancelGestures
{
  id v4 = [(SBHPageManagementCellViewController *)self tapGestureRecognizer];
  [v4 setEnabled:0];
  [v4 setEnabled:1];
  BOOL v3 = [(SBHPageManagementCellViewController *)self pageManagementCellView];
  [v3 setListHighlighted:0];
}

- (void)cleanUpListView
{
  [(SBIconListView *)self->_listView removeGestureRecognizer:self->_tapGestureRecognizer];
  id v3 = [(SBHPageManagementCellViewController *)self pageManagementCellView];
  [v3 cleanUpListView];
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
    p_iconImageInfo->size.width = v10;
    p_iconImageInfo->size.height = v9;
    p_iconImageInfo->scale = v8;
    p_iconImageInfo->continuousCornerRadius = v7;
    id v13 = [(SBHPageManagementCellViewController *)self pageManagementCellView];
    objc_msgSend(v13, "setIconImageInfo:", v10, v9, v8, v7);
  }
}

- (CGRect)visibleBounds
{
  v2 = [(SBHPageManagementCellViewController *)self view];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (double)continuousCornerRadius
{
  return 0.0;
}

- (BOOL)isUserInteractionEnabled
{
  return 0;
}

- (UIView)snapshotView
{
  double v3 = [(SBHPageManagementCellViewController *)self delegate];
  [(SBHPageManagementCellViewController *)self iconImageInfo];
  double v5 = v4;
  id v6 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [(MTMaterialView *)self->_listBackgroundView frame];
  double v7 = objc_msgSend(v6, "initWithFrame:", 0.0, 0.0);
  [v7 _setContinuousCornerRadius:v5];
  double v8 = [v3 backgroundViewForSnapshotForPageManagementCellViewController:self];
  [v7 bounds];
  objc_msgSend(v8, "setFrame:");
  [v8 _setContinuousCornerRadius:v5];
  [v7 addSubview:v8];
  double v9 = [(SBIconListView *)self->_listView snapshotView];
  listView = self->_listView;
  if (listView) {
    [(SBIconListView *)listView transform];
  }
  else {
    memset(v12, 0, sizeof(v12));
  }
  [v9 setTransform:v12];
  [(SBIconListView *)self->_listView center];
  objc_msgSend(v9, "setCenter:");
  [v7 addSubview:v9];

  return (UIView *)v7;
}

- (CGPoint)snapshotViewCenter
{
  [(MTMaterialView *)self->_listBackgroundView center];
  result.y = v3;
  result.x = v2;
  return result;
}

- (UIBezierPath)snapshotViewVisiblePath
{
  [(SBHPageManagementCellViewController *)self iconImageInfo];
  [(MTMaterialView *)self->_listBackgroundView frame];
  double v3 = (void *)MEMORY[0x1E4FB14C0];
  return (UIBezierPath *)objc_msgSend(v3, "bezierPathWithRoundedRect:cornerRadius:");
}

- (BOOL)wantsCaptureOnlyBackgroundView
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  double v2 = [(SBHPageManagementCellViewController *)self listView];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__SBHPageManagementCellViewController_wantsCaptureOnlyBackgroundView__block_invoke;
  v4[3] = &unk_1E6AB0700;
  v4[4] = &v5;
  [v2 enumerateIconViewsUsingBlock:v4];

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

void __69__SBHPageManagementCellViewController_wantsCaptureOnlyBackgroundView__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 backgroundViewGroupNameBase];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5 = a3;
  id v6 = [(SBHPageManagementCellViewController *)self tapGestureRecognizer];

  return v6 == v5;
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (BOOL)showsSquareCorners
{
  return self->_showsSquareCorners;
}

- (void)setShowsSquareCorners:(BOOL)a3
{
  self->_showsSquareCorners = a3;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (SBIconListView)listView
{
  return self->_listView;
}

- (MTMaterialView)listBackgroundView
{
  return self->_listBackgroundView;
}

- (MTMaterialView)toggleButtonBackgroundView
{
  return self->_toggleButtonBackgroundView;
}

- (SBFolder)folder
{
  return self->_folder;
}

- (SBHPageManagementCellViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHPageManagementCellViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)backgroundViewProvider
{
  return self->_backgroundViewProvider;
}

- (void)setBackgroundViewProvider:(id)a3
{
}

- (UIGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong(&self->_backgroundViewProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_folder, 0);
  objc_storeStrong((id *)&self->_toggleButtonBackgroundView, 0);
  objc_storeStrong((id *)&self->_listBackgroundView, 0);
  objc_storeStrong((id *)&self->_listView, 0);
}

@end