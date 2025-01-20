@interface ContinuousReadingPreviewView
- (BOOL)canShowContentView;
- (BOOL)isPrefetchingDisabled;
- (BOOL)isPreviewingNextDocument;
- (CGSize)contentViewSize;
- (ContinuousReadingBannerView)bannerView;
- (ContinuousReadingItem)continuousReadingItem;
- (ContinuousReadingPreviewView)initWithContinuousReadingItem:(id)a3 previewingNextDocument:(BOOL)a4;
- (ContinuousReadingPreviewView)initWithFrame:(CGRect)a3;
- (UIImage)documentSnapshot;
- (UILabel)headerLabel;
- (UIView)contentBackgroundView;
- (UIView)headerView;
- (WKWebView)contentView;
- (double)headerHeight;
- (double)rubberBandingHeight;
- (void)_layOutContentView;
- (void)_layOutHeader;
- (void)layoutSubviews;
- (void)replaceContentViewWithItsSnapshot;
- (void)setBannerTheme:(id)a3 animated:(BOOL)a4;
- (void)setBannerView:(id)a3;
- (void)setContentBackgroundView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setContentViewSize:(CGSize)a3;
- (void)setDocumentSnapshot:(id)a3;
- (void)setHeaderLabel:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setPrefetchingDisabled:(BOOL)a3;
@end

@implementation ContinuousReadingPreviewView

- (ContinuousReadingPreviewView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (ContinuousReadingPreviewView)initWithContinuousReadingItem:(id)a3 previewingNextDocument:(BOOL)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ContinuousReadingPreviewView;
  v8 = -[ContinuousReadingPreviewView initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_continuousReadingItem, a3);
    v9->_previewingNextDocument = a4;
    v10 = [(ContinuousReadingPreviewView *)v9 headerView];
    [(ContinuousReadingPreviewView *)v9 addSubview:v10];

    v11 = [(ContinuousReadingPreviewView *)v9 bannerView];
    [(ContinuousReadingPreviewView *)v9 addSubview:v11];

    v12 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(ContinuousReadingPreviewView *)v9 setBackgroundColor:v12];

    v13 = v9;
  }

  return v9;
}

- (double)headerHeight
{
  v2 = [(ContinuousReadingPreviewView *)self bannerView];
  [v2 layoutIfNeeded];
  double v3 = headerLabelHeight();
  [v2 titleRect];
  double v4 = ceil(v3 + CGRectGetMinY(v6) * 1.5);

  return v4;
}

- (double)rubberBandingHeight
{
  [(ContinuousReadingPreviewView *)self headerHeight];
  double v4 = v3;
  v5 = [(ContinuousReadingPreviewView *)self bannerView];
  [v5 bounds];
  double v6 = v4 + CGRectGetHeight(v8);

  return v6;
}

- (void)setContentView:(id)a3
{
  v5 = (WKWebView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  v13 = v5;
  if (contentView != v5)
  {
    [(WKWebView *)contentView removeFromSuperview];
    objc_storeStrong((id *)&self->_contentView, a3);
    if (*p_contentView)
    {
      if (!self->_contentBackgroundView)
      {
        CGRect v8 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        contentBackgroundView = self->_contentBackgroundView;
        self->_contentBackgroundView = v8;

        v10 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
        [(UIView *)self->_contentBackgroundView setBackgroundColor:v10];

        [(ContinuousReadingPreviewView *)self insertSubview:self->_contentBackgroundView belowSubview:*p_contentView];
      }
      -[ContinuousReadingPreviewView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:");
      [(WKWebView *)*p_contentView frame];
      self->_contentViewSize.width = v11;
      self->_contentViewSize.height = v12;
      [(ContinuousReadingPreviewView *)self setNeedsLayout];
    }
  }
}

- (UIView)headerView
{
  if (self->_previewingNextDocument)
  {
    headerView = self->_headerView;
    if (!headerView)
    {
      [(ContinuousReadingPreviewView *)self bounds];
      double Width = CGRectGetWidth(v18);
      [(ContinuousReadingPreviewView *)self headerHeight];
      double v6 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, Width, v5);
      id v7 = self->_headerView;
      self->_headerView = v6;

      [(UIView *)self->_headerView setOpaque:1];
      CGRect v8 = self->_headerView;
      v9 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
      [(UIView *)v8 setBackgroundColor:v9];

      [(UIView *)self->_headerView setAutoresizingMask:34];
      v10 = self->_headerView;
      CGFloat v11 = [(ContinuousReadingPreviewView *)self headerLabel];
      [(UIView *)v10 addSubview:v11];

      CGFloat v12 = +[ContinuousReadingBannerView makeHairlineSeparator];
      headerHairline = self->_headerHairline;
      self->_headerHairline = v12;

      [(UIView *)self->_headerHairline frame];
      v14 = self->_headerHairline;
      _SFRoundRectToPixels();
      -[UIView setFrame:](v14, "setFrame:");
      [(UIView *)self->_headerView addSubview:self->_headerHairline];
      headerView = self->_headerView;
    }
    objc_super v15 = headerView;
  }
  else
  {
    objc_super v15 = 0;
  }
  return v15;
}

- (ContinuousReadingBannerView)bannerView
{
  bannerView = self->_bannerView;
  if (!bannerView)
  {
    double v4 = [ContinuousReadingBannerView alloc];
    double v5 = [(ContinuousReadingPreviewView *)self continuousReadingItem];
    double v6 = [(ContinuousReadingBannerView *)v4 initWithContinuousReadingItem:v5];
    id v7 = self->_bannerView;
    self->_bannerView = v6;

    CGRect v8 = self->_bannerView;
    v9 = [(ContinuousReadingPreviewView *)self headerView];
    [v9 frame];
    double MaxY = CGRectGetMaxY(v14);
    [(ContinuousReadingPreviewView *)self bounds];
    -[ContinuousReadingBannerView setFrame:](v8, "setFrame:", 0.0, MaxY);

    bannerView = self->_bannerView;
  }
  CGFloat v11 = bannerView;
  return v11;
}

- (UILabel)headerLabel
{
  headerLabel = self->_headerLabel;
  if (!headerLabel)
  {
    double v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    double v5 = self->_headerLabel;
    self->_headerLabel = v4;

    double v6 = self->_headerLabel;
    id v7 = [MEMORY[0x1E4FB08E0] defaultFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UILabel *)v6 setFont:v7];

    CGRect v8 = self->_headerLabel;
    v9 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v8 setTextColor:v9];

    v10 = self->_headerLabel;
    CGFloat v11 = _WBSLocalizedString();
    [(UILabel *)v10 setText:v11];

    headerLabel = self->_headerLabel;
  }
  CGFloat v12 = headerLabel;
  return v12;
}

- (BOOL)canShowContentView
{
  double v3 = [(ContinuousReadingPreviewView *)self contentView];
  BOOL v4 = v3 || self->_snapshotView || [(ContinuousReadingPreviewView *)self isPrefetchingDisabled];

  return v4;
}

- (void)setDocumentSnapshot:(id)a3
{
  double v5 = (UIImage *)a3;
  if (self->_documentSnapshot != v5)
  {
    CGRect v14 = v5;
    objc_storeStrong((id *)&self->_documentSnapshot, a3);
    snapshotView = self->_snapshotView;
    if (self->_documentSnapshot)
    {
      if (!snapshotView)
      {
        double v7 = *MEMORY[0x1E4F1DAD8];
        double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        [(UIImage *)v14 size];
        CGFloat v11 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v7, v8, v9, v10);
        CGFloat v12 = self->_snapshotView;
        self->_snapshotView = v11;

        [(ContinuousReadingPreviewView *)self insertSubview:self->_snapshotView above:self->_contentView];
        [(ContinuousReadingPreviewView *)self layoutIfNeeded];
        snapshotView = self->_snapshotView;
      }
      [(UIImageView *)snapshotView setImage:v14];
    }
    else
    {
      [(UIImageView *)snapshotView removeFromSuperview];
      v13 = self->_snapshotView;
      self->_snapshotView = 0;
    }
    double v5 = v14;
  }
}

- (void)replaceContentViewWithItsSnapshot
{
  contentView = self->_contentView;
  if (contentView)
  {
    [(WKWebView *)contentView bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    v14.width = v8;
    v14.height = v10;
    UIGraphicsBeginImageContext(v14);
    -[WKWebView drawViewHierarchyInRect:afterScreenUpdates:](self->_contentView, "drawViewHierarchyInRect:afterScreenUpdates:", 0, v5, v7, v9, v11);
    UIGraphicsGetImageFromCurrentImageContext();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    [(ContinuousReadingPreviewView *)self setDocumentSnapshot:v12];
  }
}

- (void)setContentViewSize:(CGSize)a3
{
  if (self->_contentViewSize.width != a3.width || self->_contentViewSize.height != a3.height)
  {
    self->_contentViewSize = a3;
    [(ContinuousReadingPreviewView *)self setNeedsLayout];
  }
}

- (void)setBannerTheme:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    double v11 = __56__ContinuousReadingPreviewView_setBannerTheme_animated___block_invoke;
    id v12 = &unk_1E6D77D90;
    v13 = self;
    id v14 = v6;
    uint64_t v7 = MEMORY[0x1E4E42950](&v9);
    CGFloat v8 = (void *)v7;
    if (v4) {
      objc_msgSend(MEMORY[0x1E4FB1EB0], "_animateUsingDefaultTimingWithOptions:animations:completion:", 50331648, v7, 0, v9, v10, v11, v12, v13);
    }
    else {
      (*(void (**)(uint64_t))(v7 + 16))(v7);
    }
  }
}

void __56__ContinuousReadingPreviewView_setBannerTheme_animated___block_invoke(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) headerView];
  v2 = [*(id *)(a1 + 40) traitCollection];
  [v9 _setLocalOverrideTraitCollection:v2];

  double v3 = [*(id *)(a1 + 40) themeColor];
  if (v3)
  {
    [v9 setBackgroundColor:v3];
  }
  else
  {
    BOOL v4 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
    [v9 setBackgroundColor:v4];
  }
  double v5 = [*(id *)(a1 + 40) separatorColor];
  id v6 = v5;
  if (!v5)
  {
    id v6 = +[ContinuousReadingBannerView hairlineColor];
  }
  [*(id *)(*(void *)(a1 + 32) + 416) setBackgroundColor:v6];
  if (!v5) {

  }
  uint64_t v7 = *(void *)(a1 + 40);
  CGFloat v8 = [*(id *)(a1 + 32) bannerView];
  [v8 setTheme:v7];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)ContinuousReadingPreviewView;
  [(ContinuousReadingPreviewView *)&v5 layoutSubviews];
  [(ContinuousReadingPreviewView *)self safeAreaInsets];
  -[ContinuousReadingBannerView setTopHairlineInsets:](self->_bannerView, "setTopHairlineInsets:", 0.0, fmax(v3, 15.0), 0.0, fmax(v4, 15.0));
  if (self->_previewingNextDocument) {
    [(ContinuousReadingPreviewView *)self _layOutHeader];
  }
  [(ContinuousReadingPreviewView *)self _layOutContentView];
}

- (void)_layOutHeader
{
  double v3 = [(ContinuousReadingPreviewView *)self headerView];
  [v3 bounds];

  headerLabelHeight();
  [(ContinuousReadingPreviewView *)self safeAreaInsets];
  double v4 = [(ContinuousReadingPreviewView *)self bannerView];
  [v4 titleRect];
  CGRectGetMinY(v15);

  _SFRoundRectToPixels();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = [(ContinuousReadingPreviewView *)self headerLabel];
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);
}

- (void)_layOutContentView
{
  [(ContinuousReadingPreviewView *)self bounds];
  double v4 = v3;
  _SFRoundFloatToPixels();
  double v6 = v5;
  if (self->_previewingNextDocument)
  {
    [(ContinuousReadingBannerView *)self->_bannerView frame];
    double MaxY = CGRectGetMaxY(v13);
    double height = self->_contentViewSize.height;
  }
  else
  {
    double height = self->_contentViewSize.height;
    double MaxY = -height;
  }
  -[WKWebView setFrame:](self->_contentView, "setFrame:", v6, MaxY, self->_contentViewSize.width, height);
  -[UIView setFrame:](self->_contentBackgroundView, "setFrame:", 0.0, MaxY, v4, self->_contentViewSize.height);
  snapshotView = self->_snapshotView;
  [(UIImageView *)snapshotView frame];
  double Width = CGRectGetWidth(v14);
  [(UIImageView *)self->_snapshotView frame];
  double v11 = CGRectGetHeight(v15);
  -[UIImageView setFrame:](snapshotView, "setFrame:", v6, MaxY, Width, v11);
}

- (ContinuousReadingItem)continuousReadingItem
{
  return self->_continuousReadingItem;
}

- (WKWebView)contentView
{
  return self->_contentView;
}

- (void)setBannerView:(id)a3
{
}

- (BOOL)isPrefetchingDisabled
{
  return self->_prefetchingDisabled;
}

- (void)setPrefetchingDisabled:(BOOL)a3
{
  self->_prefetchingDisabled = a3;
}

- (BOOL)isPreviewingNextDocument
{
  return self->_previewingNextDocument;
}

- (UIImage)documentSnapshot
{
  return self->_documentSnapshot;
}

- (CGSize)contentViewSize
{
  double width = self->_contentViewSize.width;
  double height = self->_contentViewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setHeaderView:(id)a3
{
}

- (UIView)contentBackgroundView
{
  return self->_contentBackgroundView;
}

- (void)setContentBackgroundView:(id)a3
{
}

- (void)setHeaderLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_contentBackgroundView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_documentSnapshot, 0);
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_continuousReadingItem, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_headerHairline, 0);
  objc_storeStrong((id *)&self->_bannerTheme, 0);
}

@end