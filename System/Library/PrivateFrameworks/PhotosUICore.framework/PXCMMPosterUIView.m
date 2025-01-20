@interface PXCMMPosterUIView
- (BOOL)isActionInProgress;
- (BOOL)needsBannerView;
- (CGSize)_performLayoutInWidth:(double)a3 updateSubviewFrames:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)bannerHeadline;
- (NSString)bannerSubheadline;
- (NSString)dateString;
- (NSString)locationString;
- (NSString)statusString;
- (PXCMMPosterBannerView)bannerView;
- (PXCMMPosterUIView)initWithFrame:(CGRect)a3;
- (UIColor)opaqueAncestorBackgroundColor;
- (double)cornerRadius;
- (id)_fontDescriptorWithTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4;
- (int64_t)selectedCount;
- (int64_t)totalCount;
- (unint64_t)cornersToRound;
- (void)_updateBannerActionButton;
- (void)_updateBannerTitles;
- (void)_updateBannerView;
- (void)_updateCorners;
- (void)layoutSubviews;
- (void)setActionButtonWithType:(int64_t)a3 actionBlock:(id)a4;
- (void)setActionInProgress:(BOOL)a3;
- (void)setAsset:(id)a3 mediaProvider:(id)a4;
- (void)setBannerHeadline:(id)a3;
- (void)setBannerHeadline:(id)a3 boldRange:(_NSRange)a4;
- (void)setBannerSubheadline:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setCornersToRound:(unint64_t)a3;
- (void)setDateString:(id)a3;
- (void)setLocationString:(id)a3;
- (void)setNeedsBannerView:(BOOL)a3;
- (void)setOpaqueAncestorBackgroundColor:(id)a3;
- (void)setSelectedCount:(int64_t)a3;
- (void)setStatusString:(id)a3;
- (void)setTotalCount:(int64_t)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation PXCMMPosterUIView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opaqueAncestorBackgroundColor, 0);
  objc_storeStrong((id *)&self->_bannerSubheadline, 0);
  objc_storeStrong((id *)&self->_bannerHeadline, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong(&self->_actionButtonAction, 0);
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_roundedCornerOverlayView, 0);
}

- (BOOL)isActionInProgress
{
  return self->_actionInProgress;
}

- (int64_t)totalCount
{
  return self->_totalCount;
}

- (int64_t)selectedCount
{
  return self->_selectedCount;
}

- (PXCMMPosterBannerView)bannerView
{
  return self->_bannerView;
}

- (BOOL)needsBannerView
{
  return self->_needsBannerView;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (unint64_t)cornersToRound
{
  return self->_cornersToRound;
}

- (UIColor)opaqueAncestorBackgroundColor
{
  return self->_opaqueAncestorBackgroundColor;
}

- (NSString)bannerSubheadline
{
  return self->_bannerSubheadline;
}

- (NSString)bannerHeadline
{
  return self->_bannerHeadline;
}

- (id)_fontDescriptorWithTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  v6 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory(v6))
  {
    v7 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v6];
    v8 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:v5 compatibleWithTraitCollection:v7];
    v9 = v8;
    if (v4)
    {
      uint64_t v10 = objc_msgSend(v8, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v8, "symbolicTraits") | v4);

      v9 = (void *)v10;
    }
  }
  else
  {
    v9 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:v5 addingSymbolicTraits:v4 options:2];
  }

  return v9;
}

- (void)_updateCorners
{
  [(PXCMMPosterUIView *)self cornerRadius];
  double v4 = v3;
  unint64_t v5 = [(PXCMMPosterUIView *)self cornersToRound];
  roundedCornerOverlayView = self->_roundedCornerOverlayView;
  if (v4 <= 0.0 || v5 == 0)
  {
    [(PXRoundedCornerOverlayView *)roundedCornerOverlayView removeFromSuperview];
    v8 = self->_roundedCornerOverlayView;
    self->_roundedCornerOverlayView = 0;
  }
  else
  {
    if (!roundedCornerOverlayView)
    {
      v9 = [PXRoundedCornerOverlayView alloc];
      [(PXCMMPosterUIView *)self bounds];
      uint64_t v10 = -[PXRoundedCornerOverlayView initWithFrame:](v9, "initWithFrame:");
      v11 = self->_roundedCornerOverlayView;
      self->_roundedCornerOverlayView = v10;

      [(PXCMMPosterUIView *)self addSubview:self->_roundedCornerOverlayView];
      roundedCornerOverlayView = self->_roundedCornerOverlayView;
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __35__PXCMMPosterUIView__updateCorners__block_invoke;
    v12[3] = &unk_1E5DB9F30;
    *(double *)&v12[5] = v4;
    v12[4] = self;
    v12[6] = v5;
    [(PXRoundedCornerOverlayView *)roundedCornerOverlayView performChanges:v12];
  }
}

void __35__PXCMMPosterUIView__updateCorners__block_invoke(double *a1, void *a2)
{
  double v3 = a1[5];
  id v6 = a2;
  [v6 setCornerRadius:v3];
  [v6 setOverlayColor:*(void *)(*((void *)a1 + 4) + 504)];
  double v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v6 setBackgroundColor:v4];

  unint64_t v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v5 scale];
  objc_msgSend(v6, "setDisplayScale:");

  [v6 setCornersToRound:*((void *)a1 + 6)];
}

- (CGSize)_performLayoutInWidth:(double)a3 updateSubviewFrames:(BOOL)a4
{
  [(PXUpdater *)self->_updater updateIfNeeded];
  id v6 = [(PXCMMPosterUIView *)self traitCollection];
  [v6 displayScale];

  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = a3;
  v11.size.height = 1.79769313e308;
  double Width = CGRectGetWidth(v11);
  v8 = [(PXCMMPosterUIView *)self window];
  v9 = [v8 screen];
  +[PXPhotosDetailsHeaderTileWidget preferredHeaderContentHeightForWidth:v9 screen:Width];

  PXSizeRoundToPixel();
}

- (void)willMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXCMMPosterUIView;
  -[PXCMMPosterUIView willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (a3) {
    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateBannerActionButton];
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PXCMMPosterUIView;
  [(PXCMMPosterUIView *)&v4 layoutSubviews];
  [(PXCMMPosterUIView *)self bounds];
  [(PXCMMPosterUIView *)self _performLayoutInWidth:1 updateSubviewFrames:v3];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PXCMMPosterUIView _performLayoutInWidth:updateSubviewFrames:](self, "_performLayoutInWidth:updateSubviewFrames:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_updateBannerView
{
  bannerView = self->_bannerView;
  if (self->_needsBannerView)
  {
    if (!bannerView)
    {
      double v4 = [PXCMMPosterBannerView alloc];
      objc_super v5 = -[PXCMMPosterBannerView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      id v6 = self->_bannerView;
      self->_bannerView = v5;

      v7 = self->_bannerView;
      headerView = self->_headerView;
      [(PXCMMPosterUIView *)self insertSubview:v7 aboveSubview:headerView];
    }
  }
  else if (bannerView)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __38__PXCMMPosterUIView__updateBannerView__block_invoke;
    v10[3] = &unk_1E5DD36F8;
    v10[4] = self;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __38__PXCMMPosterUIView__updateBannerView__block_invoke_2;
    v9[3] = &unk_1E5DD2188;
    v9[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v10 animations:v9 completion:0.25];
  }
}

uint64_t __38__PXCMMPosterUIView__updateBannerView__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 440) frame];
  v2 = *(void **)(*(void *)(a1 + 32) + 440);
  return objc_msgSend(v2, "setFrame:");
}

void __38__PXCMMPosterUIView__updateBannerView__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 440) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 440);
  *(void *)(v2 + 440) = 0;
}

- (void)_updateBannerActionButton
{
  uint64_t v3 = [(PXCMMPosterUIView *)self selectedCount];
  double v4 = _Block_copy(self->_actionButtonAction);
  objc_super v5 = v4;
  int64_t actionButtonType = self->_actionButtonType;
  if (actionButtonType == 2)
  {
    id v10 = v4;
    v7 = PXLocalizedStringFromTable(@"PXCMMSaveButtonTitle", @"PhotosUICore");
    if (v3 >= 1) {
      goto LABEL_4;
    }
    goto LABEL_6;
  }
  if (actionButtonType == 1)
  {
    id v10 = v4;
    v7 = PXLocalizedStringFromTable(@"PXCMMNextButtonTitle", @"PhotosUICore");
    if (v3 > 0)
    {
LABEL_4:
      id actionButtonAction = self->_actionButtonAction;
LABEL_7:
      v9 = _Block_copy(actionButtonAction);

      objc_super v5 = v9;
      goto LABEL_9;
    }
LABEL_6:
    id actionButtonAction = 0;
    goto LABEL_7;
  }
  v7 = 0;
LABEL_9:
  id v11 = v5;
  [(PXCMMPosterBannerView *)self->_bannerView setActionButtonWithTitle:v7 actionBlock:v5];
}

- (void)_updateBannerTitles
{
  -[PXCMMPosterBannerView setHeadline:boldRange:](self->_bannerView, "setHeadline:boldRange:", self->_bannerHeadline, self->_bannerHeadlineBoldRange.location, self->_bannerHeadlineBoldRange.length);
  bannerSubheadline = self->_bannerSubheadline;
  bannerView = self->_bannerView;
  [(PXCMMPosterBannerView *)bannerView setSubheadline:bannerSubheadline];
}

- (void)setActionInProgress:(BOOL)a3
{
  if (self->_actionInProgress != a3)
  {
    self->_actionInProgress = a3;
    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateBannerActionButton];
  }
}

- (void)setActionButtonWithType:(int64_t)a3 actionBlock:(id)a4
{
  self->_int64_t actionButtonType = a3;
  objc_super v5 = (void *)[a4 copy];
  id actionButtonAction = self->_actionButtonAction;
  self->_id actionButtonAction = v5;

  updater = self->_updater;
  [(PXUpdater *)updater setNeedsUpdateOf:sel__updateBannerActionButton];
}

- (void)setNeedsBannerView:(BOOL)a3
{
  if (self->_needsBannerView != a3)
  {
    self->_needsBannerView = a3;
    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateBannerView];
  }
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateCorners];
  }
}

- (void)setCornersToRound:(unint64_t)a3
{
  if (self->_cornersToRound != a3)
  {
    self->_cornersToRound = a3;
    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateCorners];
  }
}

- (void)setOpaqueAncestorBackgroundColor:(id)a3
{
  objc_super v5 = (UIColor *)a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXCMMPosterUIView.m", 159, @"Invalid parameter not satisfying: %@", @"opaqueAncestorBackgroundColor" object file lineNumber description];
  }
  id v6 = self->_opaqueAncestorBackgroundColor;
  if (v6 == v5)
  {
  }
  else
  {
    v7 = v6;
    char v8 = [(UIColor *)v6 isEqual:v5];

    if ((v8 & 1) == 0)
    {
      v9 = (UIColor *)[(UIColor *)v5 copy];
      opaqueAncestorBackgroundColor = self->_opaqueAncestorBackgroundColor;
      self->_opaqueAncestorBackgroundColor = v9;

      roundedCornerOverlayView = self->_roundedCornerOverlayView;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __54__PXCMMPosterUIView_setOpaqueAncestorBackgroundColor___block_invoke;
      v13[3] = &unk_1E5DBAB68;
      v13[4] = self;
      [(PXRoundedCornerOverlayView *)roundedCornerOverlayView performChanges:v13];
    }
  }
}

uint64_t __54__PXCMMPosterUIView_setOpaqueAncestorBackgroundColor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setOverlayColor:*(void *)(*(void *)(a1 + 32) + 504)];
}

- (void)setSelectedCount:(int64_t)a3
{
  if (self->_selectedCount != a3)
  {
    self->_selectedCount = a3;
    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateBannerTitles];
    updater = self->_updater;
    [(PXUpdater *)updater setNeedsUpdateOf:sel__updateBannerActionButton];
  }
}

- (void)setTotalCount:(int64_t)a3
{
  if (self->_totalCount != a3) {
    self->_totalCount = a3;
  }
}

- (void)setBannerSubheadline:(id)a3
{
  char v8 = (NSString *)a3;
  double v4 = self->_bannerSubheadline;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      id v6 = (NSString *)[(NSString *)v8 copy];
      bannerSubheadline = self->_bannerSubheadline;
      self->_bannerSubheadline = v6;

      [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateBannerTitles];
    }
  }
}

- (void)setBannerHeadline:(id)a3 boldRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v13 = (NSString *)a3;
  v7 = self->_bannerHeadline;
  if (v7 == v13)
  {

LABEL_5:
    if (self->_bannerHeadlineBoldRange.location == location && self->_bannerHeadlineBoldRange.length == length) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  char v8 = v7;
  BOOL v9 = [(NSString *)v7 isEqualToString:v13];

  if (v9) {
    goto LABEL_5;
  }
LABEL_9:
  id v11 = (NSString *)[(NSString *)v13 copy];
  bannerHeadline = self->_bannerHeadline;
  self->_bannerHeadline = v11;

  self->_bannerHeadlineBoldRange.NSUInteger location = location;
  self->_bannerHeadlineBoldRange.NSUInteger length = length;
  [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateBannerTitles];
LABEL_10:
}

- (void)setBannerHeadline:(id)a3
{
}

- (void)setAsset:(id)a3 mediaProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(PXCMMPosterHeaderView *)self->_headerView viewModel];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__PXCMMPosterUIView_setAsset_mediaProvider___block_invoke;
  v11[3] = &unk_1E5DB9F08;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performChanges:v11];
}

void __44__PXCMMPosterUIView_setAsset_mediaProvider___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setAsset:v3];
  [v4 setMediaProvider:*(void *)(a1 + 40)];
}

- (void)setStatusString:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXCMMPosterHeaderView *)self->_headerView viewModel];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__PXCMMPosterUIView_setStatusString___block_invoke;
  v7[3] = &unk_1E5DB9EE0;
  id v8 = v4;
  id v6 = v4;
  [v5 performChanges:v7];
}

uint64_t __37__PXCMMPosterUIView_setStatusString___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setStatusString:*(void *)(a1 + 32)];
}

- (NSString)statusString
{
  uint64_t v2 = [(PXCMMPosterHeaderView *)self->_headerView viewModel];
  uint64_t v3 = [v2 statusString];

  return (NSString *)v3;
}

- (void)setDateString:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXCMMPosterHeaderView *)self->_headerView viewModel];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__PXCMMPosterUIView_setDateString___block_invoke;
  v7[3] = &unk_1E5DB9EE0;
  id v8 = v4;
  id v6 = v4;
  [v5 performChanges:v7];
}

uint64_t __35__PXCMMPosterUIView_setDateString___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSubtitle:*(void *)(a1 + 32)];
}

- (NSString)dateString
{
  uint64_t v2 = [(PXCMMPosterHeaderView *)self->_headerView viewModel];
  uint64_t v3 = [v2 subtitle];

  return (NSString *)v3;
}

- (void)setLocationString:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXCMMPosterHeaderView *)self->_headerView viewModel];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__PXCMMPosterUIView_setLocationString___block_invoke;
  v7[3] = &unk_1E5DB9EE0;
  id v8 = v4;
  id v6 = v4;
  [v5 performChanges:v7];
}

uint64_t __39__PXCMMPosterUIView_setLocationString___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setTitle:*(void *)(a1 + 32)];
}

- (NSString)locationString
{
  uint64_t v2 = [(PXCMMPosterHeaderView *)self->_headerView viewModel];
  uint64_t v3 = [v2 title];

  return (NSString *)v3;
}

- (PXCMMPosterUIView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PXCMMPosterUIView;
  uint64_t v3 = -[PXCMMPosterUIView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [v3 setBackgroundColor:v4];

    *(_OWORD *)(v3 + 408) = xmmword_1AB359BD0;
    *((void *)v3 + 64) = -1;
    BOOL v5 = [[PXCMMPosterHeaderView alloc] initWithPresentationStyle:0];
    id v6 = (void *)*((void *)v3 + 54);
    *((void *)v3 + 54) = v5;

    [v3 addSubview:*((void *)v3 + 54)];
    v3[480] = 1;
    id v7 = [PXCMMPosterBannerView alloc];
    uint64_t v8 = -[PXCMMPosterBannerView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v9 = (void *)*((void *)v3 + 55);
    *((void *)v3 + 55) = v8;

    [v3 addSubview:*((void *)v3 + 55)];
    *((void *)v3 + 56) = 0;
    uint64_t v10 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v3];
    id v11 = (void *)*((void *)v3 + 59);
    *((void *)v3 + 59) = v10;

    [*((id *)v3 + 59) setNeedsUpdateSelector:sel_setNeedsLayout];
    [*((id *)v3 + 59) addUpdateSelector:sel__updateBannerView];
    [*((id *)v3 + 59) addUpdateSelector:sel__updateBannerTitles];
    [*((id *)v3 + 59) addUpdateSelector:sel__updateBannerActionButton];
    [*((id *)v3 + 59) addUpdateSelector:sel__updateCorners];
    [*((id *)v3 + 59) setNeedsUpdateOf:sel__updateBannerActionButton];
  }
  return (PXCMMPosterUIView *)v3;
}

@end