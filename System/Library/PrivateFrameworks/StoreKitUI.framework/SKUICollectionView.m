@interface SKUICollectionView
- (CGRect)bounds;
- (SKUICollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (SKUIIndexBarControl)indexBarControl;
- (UIRefreshControl)refreshControl;
- (double)overrideBoundsWidth;
- (id)collectionViewLayout;
- (void)_updateIndexBarControlFrame;
- (void)_updateShowsScrollIndicators;
- (void)layoutSubviews;
- (void)setCollectionViewLayout:(id)a3 animated:(BOOL)a4;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setIndexBarControl:(id)a3;
- (void)setOverrideBoundsWidth:(double)a3;
- (void)setRefreshControl:(id)a3;
- (void)setShowsHorizontalScrollIndicator:(BOOL)a3;
- (void)setShowsVerticalScrollIndicator:(BOOL)a3;
@end

@implementation SKUICollectionView

- (SKUICollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUICollectionView initWithFrame:collectionViewLayout:]();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUICollectionView;
  v10 = -[SKUICollectionView initWithFrame:collectionViewLayout:](&v13, sel_initWithFrame_collectionViewLayout_, v9, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    v10->_externalShowsHorizontalScrollIndicator = [(SKUICollectionView *)v10 showsHorizontalScrollIndicator];
    v11->_externalShowsVerticalScrollIndicator = [(SKUICollectionView *)v11 showsVerticalScrollIndicator];
    [(SKUICollectionView *)v11 setPrefetchingEnabled:0];
    [(SKUICollectionView *)v11 _setContentInsetAdjustmentBehavior:101];
  }

  return v11;
}

- (id)collectionViewLayout
{
  pendingCollectionViewLayout = self->_pendingCollectionViewLayout;
  if (pendingCollectionViewLayout)
  {
    v3 = pendingCollectionViewLayout;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SKUICollectionView;
    v3 = [(SKUICollectionView *)&v5 collectionViewLayout];
  }

  return v3;
}

- (void)setCollectionViewLayout:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  p_pendingCollectionViewLayout = &self->_pendingCollectionViewLayout;
  objc_storeStrong((id *)&self->_pendingCollectionViewLayout, a3);
  id v8 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SKUICollectionView;
  [(SKUICollectionView *)&v10 setCollectionViewLayout:v8 animated:v4];
  id v9 = *p_pendingCollectionViewLayout;
  *p_pendingCollectionViewLayout = 0;
}

- (void)setDelegate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SKUICollectionView;
  id v4 = a3;
  [(SKUICollectionView *)&v6 setDelegate:v4];
  char v5 = objc_opt_respondsToSelector();

  self->_delegateWantsWillLayoutSubviews = v5 & 1;
}

- (CGRect)bounds
{
  v7.receiver = self;
  v7.super_class = (Class)SKUICollectionView;
  [(SKUICollectionView *)&v7 bounds];
  if (self->_overrideBoundsWidth > 0.00000011920929) {
    double overrideBoundsWidth = self->_overrideBoundsWidth;
  }
  result.size.double height = v6;
  result.size.double width = overrideBoundsWidth;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)layoutSubviews
{
  if (self->_delegateWantsWillLayoutSubviews)
  {
    double v3 = [(SKUICollectionView *)self delegate];
    [v3 skuiCollectionViewWillLayoutSubviews:self];
  }
  if (self->_refreshControl) {
    -[SKUICollectionView sendSubviewToBack:](self, "sendSubviewToBack:");
  }
  v4.receiver = self;
  v4.super_class = (Class)SKUICollectionView;
  [(SKUICollectionView *)&v4 layoutSubviews];
  [(SKUICollectionView *)self _updateIndexBarControlFrame];
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SKUICollectionView;
  -[SKUICollectionView setContentOffset:animated:](&v5, sel_setContentOffset_animated_, a4, a3.x, a3.y);
  [(SKUICollectionView *)self _updateIndexBarControlFrame];
}

- (void)setShowsHorizontalScrollIndicator:(BOOL)a3
{
  if (self->_externalShowsHorizontalScrollIndicator != a3)
  {
    self->_externalShowsHorizontalScrollIndicator = a3;
    [(SKUICollectionView *)self _updateShowsScrollIndicators];
  }
}

- (void)setShowsVerticalScrollIndicator:(BOOL)a3
{
  if (self->_externalShowsVerticalScrollIndicator != a3)
  {
    self->_externalShowsVerticalScrollIndicator = a3;
    [(SKUICollectionView *)self _updateShowsScrollIndicators];
  }
}

- (void)setIndexBarControl:(id)a3
{
  objc_super v5 = (SKUIIndexBarControl *)a3;
  p_indexBarControl = &self->_indexBarControl;
  indexBarControl = self->_indexBarControl;
  id v8 = v5;
  if (indexBarControl != v5)
  {
    if ([(SKUIIndexBarControl *)indexBarControl isDescendantOfView:self]) {
      [(SKUIIndexBarControl *)*p_indexBarControl removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_indexBarControl, a3);
    [(SKUICollectionView *)self _updateShowsScrollIndicators];
    [(SKUICollectionView *)self setNeedsLayout];
    objc_super v5 = *p_indexBarControl;
  }
  if (v5 && ([(SKUIIndexBarControl *)v5 isDescendantOfView:self] & 1) == 0)
  {
    [(SKUICollectionView *)self addSubview:*p_indexBarControl];
    [(SKUICollectionView *)self setNeedsLayout];
  }
}

- (void)setRefreshControl:(id)a3
{
  objc_super v5 = (UIRefreshControl *)a3;
  refreshControl = self->_refreshControl;
  if (refreshControl != v5)
  {
    objc_super v7 = v5;
    if (refreshControl) {
      [(UIRefreshControl *)refreshControl removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_refreshControl, a3);
    refreshControl = (UIRefreshControl *)[(SKUICollectionView *)self _addContentSubview:self->_refreshControl atBack:1];
    objc_super v5 = v7;
  }

  MEMORY[0x1F41817F8](refreshControl, v5);
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SKUICollectionView;
  -[SKUICollectionView setContentInset:](&v3, sel_setContentInset_, a3.top, a3.left, a3.bottom, a3.right);
}

- (void)_updateIndexBarControlFrame
{
  [(SKUICollectionView *)self bounds];
  double v4 = v3;
  CGFloat rect_24 = v5;
  CGFloat v37 = v3;
  double v6 = v5;
  double v8 = v7;
  CGFloat rect_8 = v9;
  CGFloat rect_16 = v7;
  double v10 = v9;
  [(SKUICollectionView *)self contentInset];
  double v12 = v4 + v11;
  double v14 = v6 + v13;
  double v16 = v8 - (v11 + v15);
  double v18 = v10 - (v13 + v17);
  [(SKUIIndexBarControl *)self->_indexBarControl frame];
  CGFloat v20 = v19;
  CGFloat rect = v19;
  CGFloat v22 = v21;
  v39.origin.double x = v12;
  v39.origin.double y = v14;
  v39.size.double width = v16;
  v39.size.double height = v18;
  CGFloat v23 = CGRectGetWidth(v39) * 0.25;
  v40.origin.double x = v12;
  v40.origin.double y = v14;
  v40.size.double width = v16;
  v40.size.double height = v18;
  double Height = CGRectGetHeight(v40);
  -[SKUIIndexBarControl sizeThatFits:](self->_indexBarControl, "sizeThatFits:", v23, Height);
  CGFloat v26 = v25;
  v41.size.double height = v27;
  v41.origin.double x = v20;
  v41.origin.double y = v22;
  v41.size.double width = v26;
  double v28 = CGRectGetHeight(v41);
  if (v28 >= Height) {
    double Height = v28;
  }
  v42.origin.double x = v12;
  v42.origin.double y = v14;
  v42.size.double width = v16;
  v42.size.double height = v18;
  double MaxX = CGRectGetMaxX(v42);
  v43.origin.double x = rect;
  v43.origin.double y = v22;
  v43.size.double width = v26;
  v43.size.double height = Height;
  CGFloat v30 = MaxX - CGRectGetWidth(v43);
  v44.origin.double x = v12;
  v44.origin.double y = v14;
  v44.size.double width = v16;
  v44.size.double height = v18;
  CGFloat MinY = CGRectGetMinY(v44);
  indexBarControl = self->_indexBarControl;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v30, MinY, v26, Height, v37, rect_24, rect_16, rect_8);

  -[SKUIIndexBarControl setFrame:](indexBarControl, "setFrame:");
}

- (void)_updateShowsScrollIndicators
{
  if (self->_indexBarControl)
  {
    v7.receiver = self;
    v7.super_class = (Class)SKUICollectionView;
    [(SKUICollectionView *)&v7 setShowsHorizontalScrollIndicator:0];
    v6.receiver = self;
    v6.super_class = (Class)SKUICollectionView;
    -[SKUICollectionView setShowsVerticalScrollIndicator:](&v6, sel_setShowsVerticalScrollIndicator_, 0, v4.receiver, v4.super_class);
  }
  else
  {
    BOOL externalShowsHorizontalScrollIndicator = self->_externalShowsHorizontalScrollIndicator;
    v5.receiver = self;
    v5.super_class = (Class)SKUICollectionView;
    [(SKUICollectionView *)&v5 setShowsHorizontalScrollIndicator:externalShowsHorizontalScrollIndicator];
    -[SKUICollectionView setShowsVerticalScrollIndicator:](&v4, sel_setShowsVerticalScrollIndicator_, self->_externalShowsVerticalScrollIndicator, self, SKUICollectionView);
  }
}

- (double)overrideBoundsWidth
{
  return self->_overrideBoundsWidth;
}

- (void)setOverrideBoundsWidth:(double)a3
{
  self->_double overrideBoundsWidth = a3;
}

- (UIRefreshControl)refreshControl
{
  return self->_refreshControl;
}

- (SKUIIndexBarControl)indexBarControl
{
  return self->_indexBarControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexBarControl, 0);
  objc_storeStrong((id *)&self->_refreshControl, 0);

  objc_storeStrong((id *)&self->_pendingCollectionViewLayout, 0);
}

- (void)initWithFrame:collectionViewLayout:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUICollectionView initWithFrame:collectionViewLayout:]";
}

@end