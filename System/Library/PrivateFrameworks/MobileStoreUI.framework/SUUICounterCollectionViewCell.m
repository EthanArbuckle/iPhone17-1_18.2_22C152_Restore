@interface SUUICounterCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SUUICounterCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)contentInset;
- (id)viewForElementIdentifier:(id)a3;
- (void)_reloadHighlightImageView;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setBackgroundColor:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation SUUICounterCollectionViewCell

- (SUUICounterCollectionViewCell)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SUUICounterCollectionViewCell;
  v3 = -[SUUICollectionViewCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [SUUICounterView alloc];
    [(SUUICounterCollectionViewCell *)v3 bounds];
    uint64_t v5 = -[SUUIViewReuseView initWithFrame:](v4, "initWithFrame:");
    counterView = v3->_counterView;
    v3->_counterView = (SUUICounterView *)v5;

    v7 = [(SUUICounterCollectionViewCell *)v3 contentView];
    [v7 addSubview:v3->_counterView];
  }
  return v3;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
  -[SUUICounterView setContentInset:](self->_counterView, "setContentInset:");
}

- (void)applyLayoutAttributes:(id)a3
{
  counterView = self->_counterView;
  id v5 = a3;
  v6 = [v5 backgroundColor];
  [(SUUIViewReuseView *)counterView setBackgroundColor:v6];

  v7.receiver = self;
  v7.super_class = (Class)SUUICounterCollectionViewCell;
  [(SUUICollectionViewCell *)&v7 applyLayoutAttributes:v5];
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return +[SUUICounterView prefetchResourcesForViewElement:a3 reason:a4 context:a5];
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 defaultItemWidthForViewElement:v7];
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  +[SUUICounterView sizeThatFitsWidth:a4 viewElement:a5 context:a3];
  result.height = v6;
  result.width = v5;
  return result;
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return [(SUUICounterView *)self->_counterView setImage:a3 forArtworkRequest:a4 context:a5];
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return [(SUUICounterView *)self->_counterView updateWithItemState:a3 context:a4 animated:a5];
}

- (id)viewForElementIdentifier:(id)a3
{
  return [(SUUICounterView *)self->_counterView viewForElementIdentifier:a3];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SUUICounterCollectionViewCell;
  [(SUUICollectionViewCell *)&v5 layoutSubviews];
  counterView = self->_counterView;
  v4 = [(SUUICounterCollectionViewCell *)self contentView];
  [v4 bounds];
  -[SUUICounterView setFrame:](counterView, "setFrame:");
}

- (void)setBackgroundColor:(id)a3
{
  counterView = self->_counterView;
  id v5 = a3;
  [(SUUIViewReuseView *)counterView setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUICounterCollectionViewCell;
  [(SUUICollectionViewCell *)&v6 setBackgroundColor:v5];
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUICounterCollectionViewCell;
  [(SUUICollectionViewCell *)&v4 setHighlighted:a3];
  [(SUUICounterCollectionViewCell *)self _reloadHighlightImageView];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUICounterCollectionViewCell;
  [(SUUICollectionViewCell *)&v4 setSelected:a3];
  [(SUUICounterCollectionViewCell *)self _reloadHighlightImageView];
}

- (void)_reloadHighlightImageView
{
  if (([(SUUICounterCollectionViewCell *)self isHighlighted] & 1) != 0
    || [(SUUICounterCollectionViewCell *)self isSelected])
  {
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__52;
    counterView = self->_counterView;
    v32 = __Block_byref_object_dispose__52;
    id v33 = 0;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __58__SUUICounterCollectionViewCell__reloadHighlightImageView__block_invoke;
    v27[3] = &unk_265406000;
    v27[4] = &v28;
    [(SUUIViewReuseView *)counterView enumerateExistingViewsForReuseIdentifier:0x270504C90 usingBlock:v27];
    objc_super v4 = (void *)v29[5];
    if (v4) {
      goto LABEL_5;
    }
    id v5 = self->_counterView;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __58__SUUICounterCollectionViewCell__reloadHighlightImageView__block_invoke_2;
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
        id v7 = objc_alloc_init(SUUIImageView);
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
      double v13 = [(id)v29[5] image];
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
      [(SUUICounterView *)self->_counterView insertSubview:self->_highlightImageView aboveSubview:v29[5]];
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
      v23[2] = __58__SUUICounterCollectionViewCell__reloadHighlightImageView__block_invoke_3;
      v23[3] = &unk_265400980;
      v24 = v19;
      v22 = v19;
      [v21 setCompletionBlock:v23];
      [(SUUIImageView *)v22 setAlpha:0.0];
      [MEMORY[0x263F158F8] commit];
    }
  }
}

void __58__SUUICounterCollectionViewCell__reloadHighlightImageView__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 1;
}

void __58__SUUICounterCollectionViewCell__reloadHighlightImageView__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 1;
}

uint64_t __58__SUUICounterCollectionViewCell__reloadHighlightImageView__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightImageView, 0);
  objc_storeStrong((id *)&self->_counterView, 0);
}

@end