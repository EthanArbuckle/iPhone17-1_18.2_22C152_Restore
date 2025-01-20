@interface SUUIVerticalLockupCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (double)maximumPerspectiveHeightForSize:(CGSize)a3;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SUUIVerticalLockupCollectionViewCell)initWithFrame:(CGRect)a3;
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

@implementation SUUIVerticalLockupCollectionViewCell

- (SUUIVerticalLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SUUIVerticalLockupCollectionViewCell;
  v3 = -[SUUICollectionViewCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(SUUIVerticalLockupCollectionViewCell *)v3 contentView];
    v6 = [SUUIVerticalLockupView alloc];
    [v5 bounds];
    uint64_t v7 = -[SUUIVerticalLockupView initWithFrame:](v6, "initWithFrame:");
    lockupView = v4->_lockupView;
    v4->_lockupView = (SUUIVerticalLockupView *)v7;

    [v5 addSubview:v4->_lockupView];
  }
  return v4;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  lockupView = self->_lockupView;
  v6 = [v4 backgroundColor];
  [(SUUIViewReuseView *)lockupView setBackgroundColor:v6];

  v13.receiver = self;
  v13.super_class = (Class)SUUIVerticalLockupCollectionViewCell;
  [(SUUICollectionViewCell *)&v13 applyLayoutAttributes:v4];
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
  [(SUUIVerticalLockupView *)self->_lockupView setOpacityOfViewsOtherThanProductImageView:v9];
  [(SUUIVerticalLockupView *)self->_lockupView setZoomingImageAlpha:v10];
  [(SUUIVerticalLockupView *)self->_lockupView setZoomingImageWidth:v8];
}

+ (double)maximumPerspectiveHeightForSize:(CGSize)a3
{
  +[SUUIVerticalLockupView maximumPerspectiveHeightForSize:](SUUIVerticalLockupView, "maximumPerspectiveHeightForSize:", a3.width, a3.height);
  return result;
}

- (void)setPerspectiveTargetView:(id)a3
{
  lockupView = self->_lockupView;
  id v4 = a3;
  [(SUUIVerticalLockupView *)lockupView setPerspectiveTargetView:v4];
}

- (void)setVanishingPoint:(CGPoint)a3
{
}

- (void)updateForChangedDistanceFromVanishingPoint
{
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return +[SUUIVerticalLockupView prefetchResourcesForViewElement:a3 reason:a4 context:a5];
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  +[SUUIVerticalLockupView preferredSizeForViewElement:a3 context:a4];
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  +[SUUIVerticalLockupView sizeThatFitsWidth:a4 viewElement:a5 context:a3];
  result.height = v6;
  result.width = v5;
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
  return [(SUUIVerticalLockupView *)self->_lockupView setImage:a3 forArtworkRequest:a4 context:a5];
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return [(SUUIVerticalLockupView *)self->_lockupView updateWithItemState:a3 context:a4 animated:a5];
}

- (id)viewForElementIdentifier:(id)a3
{
  return [(SUUIVerticalLockupView *)self->_lockupView viewForElementIdentifier:a3];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIVerticalLockupCollectionViewCell;
  [(SUUICollectionViewCell *)&v5 layoutSubviews];
  lockupView = self->_lockupView;
  double v4 = [(SUUIVerticalLockupCollectionViewCell *)self contentView];
  [v4 bounds];
  -[SUUIVerticalLockupView setFrame:](lockupView, "setFrame:");
}

- (void)setBackgroundColor:(id)a3
{
  lockupView = self->_lockupView;
  id v5 = a3;
  [(SUUIViewReuseView *)lockupView setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIVerticalLockupCollectionViewCell;
  [(SUUICollectionViewCell *)&v6 setBackgroundColor:v5];
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIVerticalLockupCollectionViewCell;
  [(SUUICollectionViewCell *)&v4 setHighlighted:a3];
  [(SUUIVerticalLockupCollectionViewCell *)self _reloadHighlightImageView];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIVerticalLockupCollectionViewCell;
  [(SUUICollectionViewCell *)&v4 setSelected:a3];
  [(SUUIVerticalLockupCollectionViewCell *)self _reloadHighlightImageView];
}

- (void)_reloadHighlightImageView
{
  if (([(SUUIVerticalLockupCollectionViewCell *)self isHighlighted] & 1) != 0
    || [(SUUIVerticalLockupCollectionViewCell *)self isSelected])
  {
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__54;
    lockupView = self->_lockupView;
    v32 = __Block_byref_object_dispose__54;
    id v33 = 0;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __65__SUUIVerticalLockupCollectionViewCell__reloadHighlightImageView__block_invoke;
    v27[3] = &unk_265406000;
    v27[4] = &v28;
    [(SUUIViewReuseView *)lockupView enumerateExistingViewsForReuseIdentifier:0x270504C90 usingBlock:v27];
    objc_super v4 = (void *)v29[5];
    if (v4) {
      goto LABEL_5;
    }
    id v5 = self->_lockupView;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __65__SUUIVerticalLockupCollectionViewCell__reloadHighlightImageView__block_invoke_2;
    v26[3] = &unk_265406000;
    v26[4] = &v28;
    [(SUUIViewReuseView *)v5 enumerateExistingViewsForReuseIdentifier:0x2704FA030 usingBlock:v26];
    objc_super v4 = (void *)v29[5];
    if (v4)
    {
LABEL_5:
      highlightImageView = self->_highlightImageView;
      if (!highlightImageView)
      {
        double v7 = objc_alloc_init(SUUIImageView);
        double v8 = self->_highlightImageView;
        self->_highlightImageView = v7;

        [(SUUIImageView *)self->_highlightImageView setAlpha:0.300000012];
        double v9 = self->_highlightImageView;
        double v10 = [MEMORY[0x263F825C8] clearColor];
        [(SUUIImageView *)v9 setBackgroundColor:v10];

        highlightImageView = self->_highlightImageView;
        objc_super v4 = (void *)v29[5];
      }
      [v4 bounds];
      -[SUUIImageView setBounds:](highlightImageView, "setBounds:");
      double v11 = self->_highlightImageView;
      [(id)v29[5] center];
      -[SUUIImageView setCenter:](v11, "setCenter:");
      double v12 = self->_highlightImageView;
      objc_super v13 = [(id)v29[5] image];
      v14 = [MEMORY[0x263F825C8] blackColor];
      v15 = [v13 _flatImageWithColor:v14];
      [(SUUIImageView *)v12 setImage:v15];

      v16 = self->_highlightImageView;
      v17 = (void *)v29[5];
      if (v17) {
        [v17 transform];
      }
      else {
        memset(v25, 0, sizeof(v25));
      }
      [(SUUIImageView *)v16 setTransform:v25];
      [(SUUIVerticalLockupView *)self->_lockupView insertSubview:self->_highlightImageView aboveSubview:v29[5]];
    }
    _Block_object_dispose(&v28, 8);
  }
  else
  {
    v18 = self->_highlightImageView;
    if (v18)
    {
      v19 = v18;
      v20 = self->_highlightImageView;
      self->_highlightImageView = 0;

      [MEMORY[0x263F158F8] begin];
      v21 = (void *)MEMORY[0x263F158F8];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __65__SUUIVerticalLockupCollectionViewCell__reloadHighlightImageView__block_invoke_3;
      v23[3] = &unk_265400980;
      v24 = v19;
      v22 = v19;
      [v21 setCompletionBlock:v23];
      [(SUUIImageView *)v22 setAlpha:0.0];
      [MEMORY[0x263F158F8] commit];
    }
  }
}

void __65__SUUIVerticalLockupCollectionViewCell__reloadHighlightImageView__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 1;
}

void __65__SUUIVerticalLockupCollectionViewCell__reloadHighlightImageView__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 1;
}

uint64_t __65__SUUIVerticalLockupCollectionViewCell__reloadHighlightImageView__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockupView, 0);
  objc_storeStrong((id *)&self->_highlightImageView, 0);
}

@end