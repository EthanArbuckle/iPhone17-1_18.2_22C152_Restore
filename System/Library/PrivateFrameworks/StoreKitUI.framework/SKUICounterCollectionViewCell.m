@interface SKUICounterCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SKUICounterCollectionViewCell)initWithFrame:(CGRect)a3;
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

@implementation SKUICounterCollectionViewCell

- (SKUICounterCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUICounterCollectionViewCell initWithFrame:]();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUICounterCollectionViewCell;
  v8 = -[SKUICollectionViewCell initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = [SKUICounterView alloc];
    [(SKUICounterCollectionViewCell *)v8 bounds];
    uint64_t v10 = -[SKUIViewReuseView initWithFrame:](v9, "initWithFrame:");
    counterView = v8->_counterView;
    v8->_counterView = (SKUICounterView *)v10;

    v12 = [(SKUICounterCollectionViewCell *)v8 contentView];
    [v12 addSubview:v8->_counterView];
  }
  return v8;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
  -[SKUICounterView setContentInset:](self->_counterView, "setContentInset:");
}

- (void)applyLayoutAttributes:(id)a3
{
  counterView = self->_counterView;
  id v5 = a3;
  v6 = [v5 backgroundColor];
  [(SKUIViewReuseView *)counterView setBackgroundColor:v6];

  v7.receiver = self;
  v7.super_class = (Class)SKUICounterCollectionViewCell;
  [(SKUICollectionViewCell *)&v7 applyLayoutAttributes:v5];
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return +[SKUICounterView prefetchResourcesForViewElement:a3 reason:a4 context:a5];
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
  result.double height = v13;
  result.double width = v12;
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
  +[SKUICounterView sizeThatFitsWidth:a4 viewElement:a5 context:a3];
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return [(SKUICounterView *)self->_counterView setImage:a3 forArtworkRequest:a4 context:a5];
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return [(SKUICounterView *)self->_counterView updateWithItemState:a3 context:a4 animated:a5];
}

- (id)viewForElementIdentifier:(id)a3
{
  return [(SKUICounterView *)self->_counterView viewForElementIdentifier:a3];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SKUICounterCollectionViewCell;
  [(SKUICollectionViewCell *)&v5 layoutSubviews];
  counterView = self->_counterView;
  v4 = [(SKUICounterCollectionViewCell *)self contentView];
  [v4 bounds];
  -[SKUICounterView setFrame:](counterView, "setFrame:");
}

- (void)setBackgroundColor:(id)a3
{
  counterView = self->_counterView;
  id v5 = a3;
  [(SKUIViewReuseView *)counterView setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SKUICounterCollectionViewCell;
  [(SKUICollectionViewCell *)&v6 setBackgroundColor:v5];
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUICounterCollectionViewCell;
  [(SKUICollectionViewCell *)&v4 setHighlighted:a3];
  [(SKUICounterCollectionViewCell *)self _reloadHighlightImageView];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUICounterCollectionViewCell;
  [(SKUICollectionViewCell *)&v4 setSelected:a3];
  [(SKUICounterCollectionViewCell *)self _reloadHighlightImageView];
}

- (void)_reloadHighlightImageView
{
  if (([(SKUICounterCollectionViewCell *)self isHighlighted] & 1) != 0
    || [(SKUICounterCollectionViewCell *)self isSelected])
  {
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__97;
    counterView = self->_counterView;
    v32 = __Block_byref_object_dispose__97;
    id v33 = 0;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __58__SKUICounterCollectionViewCell__reloadHighlightImageView__block_invoke;
    v27[3] = &unk_1E64241F8;
    v27[4] = &v28;
    [(SKUIViewReuseView *)counterView enumerateExistingViewsForReuseIdentifier:0x1F1C94728 usingBlock:v27];
    objc_super v4 = (void *)v29[5];
    if (v4) {
      goto LABEL_5;
    }
    id v5 = self->_counterView;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __58__SKUICounterCollectionViewCell__reloadHighlightImageView__block_invoke_2;
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
        double v8 = self->_highlightImageView;
        self->_highlightImageView = v7;

        [(SKUIImageView *)self->_highlightImageView setAlpha:0.300000012];
        double v9 = self->_highlightImageView;
        double v10 = [MEMORY[0x1E4FB1618] clearColor];
        [(SKUIImageView *)v9 setBackgroundColor:v10];

        highlightImageView = self->_highlightImageView;
        objc_super v4 = (void *)v29[5];
      }
      [v4 bounds];
      -[SKUIImageView setBounds:](highlightImageView, "setBounds:");
      double v11 = self->_highlightImageView;
      [(id)v29[5] center];
      -[SKUIImageView setCenter:](v11, "setCenter:");
      double v12 = self->_highlightImageView;
      double v13 = [(id)v29[5] image];
      objc_super v14 = [MEMORY[0x1E4FB1618] blackColor];
      v15 = [v13 _flatImageWithColor:v14];
      [(SKUIImageView *)v12 setImage:v15];

      v16 = self->_highlightImageView;
      v17 = (void *)v29[5];
      if (v17) {
        [v17 transform];
      }
      else {
        memset(v25, 0, sizeof(v25));
      }
      [(SKUIImageView *)v16 setTransform:v25];
      [(SKUICounterView *)self->_counterView insertSubview:self->_highlightImageView aboveSubview:v29[5]];
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

      [MEMORY[0x1E4F39CF8] begin];
      v21 = (void *)MEMORY[0x1E4F39CF8];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __58__SKUICounterCollectionViewCell__reloadHighlightImageView__block_invoke_3;
      v23[3] = &unk_1E6422020;
      v24 = v19;
      v22 = v19;
      [v21 setCompletionBlock:v23];
      [(SKUIImageView *)v22 setAlpha:0.0];
      [MEMORY[0x1E4F39CF8] commit];
    }
  }
}

void __58__SKUICounterCollectionViewCell__reloadHighlightImageView__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 1;
}

void __58__SKUICounterCollectionViewCell__reloadHighlightImageView__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 1;
}

uint64_t __58__SKUICounterCollectionViewCell__reloadHighlightImageView__block_invoke_3(uint64_t a1)
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

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUICounterCollectionViewCell initWithFrame:]";
}

@end