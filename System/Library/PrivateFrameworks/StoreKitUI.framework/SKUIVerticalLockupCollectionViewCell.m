@interface SKUIVerticalLockupCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (double)maximumPerspectiveHeightForSize:(CGSize)a3;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SKUIVerticalLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)_reloadHighlightImageView;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setBackgroundColor:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setPerspectiveTargetView:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setVanishingPoint:(CGPoint)a3;
- (void)updateForChangedDistanceFromVanishingPoint;
@end

@implementation SKUIVerticalLockupCollectionViewCell

- (SKUIVerticalLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIVerticalLockupCollectionViewCell initWithFrame:]();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIVerticalLockupCollectionViewCell;
  v8 = -[SKUICollectionViewCell initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    v10 = [(SKUIVerticalLockupCollectionViewCell *)v8 contentView];
    v11 = [SKUIVerticalLockupView alloc];
    [v10 bounds];
    uint64_t v12 = -[SKUIVerticalLockupView initWithFrame:](v11, "initWithFrame:");
    lockupView = v9->_lockupView;
    v9->_lockupView = (SKUIVerticalLockupView *)v12;

    [v10 addSubview:v9->_lockupView];
  }
  return v9;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  lockupView = self->_lockupView;
  v6 = [v4 backgroundColor];
  [(SKUIViewReuseView *)lockupView setBackgroundColor:v6];

  v13.receiver = self;
  v13.super_class = (Class)SKUIVerticalLockupCollectionViewCell;
  [(SKUICollectionViewCell *)&v13 applyLayoutAttributes:v4];
  [v4 zoomingImageWidth];
  double v8 = v7;
  double v9 = 1.0;
  double v10 = 1.0;
  if (v7 > 0.00000011920929)
  {
    [v4 zoomingImageImposedAlphaOfOtherViews];
    double v9 = v11;
    [v4 zoomingImageAlpha];
    double v10 = v12;
  }
  [(SKUIVerticalLockupView *)self->_lockupView setOpacityOfViewsOtherThanProductImageView:v9];
  [(SKUIVerticalLockupView *)self->_lockupView setZoomingImageAlpha:v10];
  [(SKUIVerticalLockupView *)self->_lockupView setZoomingImageWidth:v8];
}

+ (double)maximumPerspectiveHeightForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKUIVerticalLockupCollectionViewCell maximumPerspectiveHeightForSize:]();
  }
  +[SKUIVerticalLockupView maximumPerspectiveHeightForSize:](SKUIVerticalLockupView, "maximumPerspectiveHeightForSize:", width, height);
  return result;
}

- (void)setPerspectiveTargetView:(id)a3
{
  lockupView = self->_lockupView;
  id v4 = a3;
  [(SKUIVerticalLockupView *)lockupView setPerspectiveTargetView:v4];
}

- (void)setVanishingPoint:(CGPoint)a3
{
}

- (void)updateForChangedDistanceFromVanishingPoint
{
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v9) {
        +[SKUIVerticalLockupCollectionViewCell prefetchResourcesForViewElement:reason:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  BOOL v17 = +[SKUIVerticalLockupView prefetchResourcesForViewElement:v7 reason:a4 context:v8];

  return v17;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v7) {
        +[SKUIVerticalLockupCollectionViewCell preferredSizeForViewElement:context:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  +[SKUIVerticalLockupView preferredSizeForViewElement:v5 context:v6];
  double v16 = v15;
  double v18 = v17;

  double v19 = v16;
  double v20 = v18;
  result.double height = v20;
  result.double width = v19;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v9) {
        +[SKUIVerticalLockupCollectionViewCell requestLayoutForViewElement:width:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  +[SKUIVerticalLockupView requestLayoutForViewElement:v7 width:v8 context:a4];
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v9) {
        +[SKUIVerticalLockupCollectionViewCell sizeThatFitsWidth:viewElement:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  +[SKUIVerticalLockupView sizeThatFitsWidth:v7 viewElement:v8 context:a3];
  double v18 = v17;
  double v20 = v19;

  double v21 = v18;
  double v22 = v20;
  result.double height = v22;
  result.double width = v21;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
}

- (void)setContentInset:(UIEdgeInsets)a3
{
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return [(SKUIVerticalLockupView *)self->_lockupView setImage:a3 forArtworkRequest:a4 context:a5];
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return [(SKUIVerticalLockupView *)self->_lockupView updateWithItemState:a3 context:a4 animated:a5];
}

- (id)viewForElementIdentifier:(id)a3
{
  return [(SKUIVerticalLockupView *)self->_lockupView viewForElementIdentifier:a3];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SKUIVerticalLockupCollectionViewCell;
  [(SKUICollectionViewCell *)&v5 layoutSubviews];
  lockupView = self->_lockupView;
  id v4 = [(SKUIVerticalLockupCollectionViewCell *)self contentView];
  [v4 bounds];
  -[SKUIVerticalLockupView setFrame:](lockupView, "setFrame:");
}

- (void)setBackgroundColor:(id)a3
{
  lockupView = self->_lockupView;
  id v5 = a3;
  [(SKUIViewReuseView *)lockupView setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SKUIVerticalLockupCollectionViewCell;
  [(SKUICollectionViewCell *)&v6 setBackgroundColor:v5];
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIVerticalLockupCollectionViewCell;
  [(SKUICollectionViewCell *)&v4 setHighlighted:a3];
  [(SKUIVerticalLockupCollectionViewCell *)self _reloadHighlightImageView];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIVerticalLockupCollectionViewCell;
  [(SKUICollectionViewCell *)&v4 setSelected:a3];
  [(SKUIVerticalLockupCollectionViewCell *)self _reloadHighlightImageView];
}

- (void)_reloadHighlightImageView
{
  if (([(SKUIVerticalLockupCollectionViewCell *)self isHighlighted] & 1) != 0
    || [(SKUIVerticalLockupCollectionViewCell *)self isSelected])
  {
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__7;
    lockupView = self->_lockupView;
    v32 = __Block_byref_object_dispose__7;
    id v33 = 0;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __65__SKUIVerticalLockupCollectionViewCell__reloadHighlightImageView__block_invoke;
    v27[3] = &unk_1E64241F8;
    v27[4] = &v28;
    [(SKUIViewReuseView *)lockupView enumerateExistingViewsForReuseIdentifier:0x1F1C94728 usingBlock:v27];
    objc_super v4 = (void *)v29[5];
    if (v4) {
      goto LABEL_5;
    }
    id v5 = self->_lockupView;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __65__SKUIVerticalLockupCollectionViewCell__reloadHighlightImageView__block_invoke_2;
    v26[3] = &unk_1E64241F8;
    v26[4] = &v28;
    [(SKUIViewReuseView *)v5 enumerateExistingViewsForReuseIdentifier:0x1F1C94948 usingBlock:v26];
    objc_super v4 = (void *)v29[5];
    if (v4)
    {
LABEL_5:
      highlightImageView = self->_highlightImageView;
      if (!highlightImageView)
      {
        id v7 = objc_alloc_init(SKUIImageView);
        id v8 = self->_highlightImageView;
        self->_highlightImageView = v7;

        [(SKUIImageView *)self->_highlightImageView setAlpha:0.300000012];
        BOOL v9 = self->_highlightImageView;
        uint64_t v10 = [MEMORY[0x1E4FB1618] clearColor];
        [(SKUIImageView *)v9 setBackgroundColor:v10];

        highlightImageView = self->_highlightImageView;
        objc_super v4 = (void *)v29[5];
      }
      [v4 bounds];
      -[SKUIImageView setBounds:](highlightImageView, "setBounds:");
      uint64_t v11 = self->_highlightImageView;
      [(id)v29[5] center];
      -[SKUIImageView setCenter:](v11, "setCenter:");
      uint64_t v12 = self->_highlightImageView;
      uint64_t v13 = [(id)v29[5] image];
      uint64_t v14 = [MEMORY[0x1E4FB1618] blackColor];
      uint64_t v15 = [v13 _flatImageWithColor:v14];
      [(SKUIImageView *)v12 setImage:v15];

      uint64_t v16 = self->_highlightImageView;
      double v17 = (void *)v29[5];
      if (v17) {
        [v17 transform];
      }
      else {
        memset(v25, 0, sizeof(v25));
      }
      [(SKUIImageView *)v16 setTransform:v25];
      [(SKUIVerticalLockupView *)self->_lockupView insertSubview:self->_highlightImageView aboveSubview:v29[5]];
    }
    _Block_object_dispose(&v28, 8);
  }
  else
  {
    double v18 = self->_highlightImageView;
    if (v18)
    {
      double v19 = v18;
      double v20 = self->_highlightImageView;
      self->_highlightImageView = 0;

      [MEMORY[0x1E4F39CF8] begin];
      double v21 = (void *)MEMORY[0x1E4F39CF8];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __65__SKUIVerticalLockupCollectionViewCell__reloadHighlightImageView__block_invoke_3;
      v23[3] = &unk_1E6422020;
      v24 = v19;
      double v22 = v19;
      [v21 setCompletionBlock:v23];
      [(SKUIImageView *)v22 setAlpha:0.0];
      [MEMORY[0x1E4F39CF8] commit];
    }
  }
}

void __65__SKUIVerticalLockupCollectionViewCell__reloadHighlightImageView__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 1;
}

void __65__SKUIVerticalLockupCollectionViewCell__reloadHighlightImageView__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 1;
}

uint64_t __65__SKUIVerticalLockupCollectionViewCell__reloadHighlightImageView__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockupView, 0);

  objc_storeStrong((id *)&self->_highlightImageView, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIVerticalLockupCollectionViewCell initWithFrame:]";
}

+ (void)maximumPerspectiveHeightForSize:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIVerticalLockupCollectionViewCell maximumPerspectiveHeightForSize:]";
}

+ (void)prefetchResourcesForViewElement:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)preferredSizeForViewElement:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)requestLayoutForViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 viewElement:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end