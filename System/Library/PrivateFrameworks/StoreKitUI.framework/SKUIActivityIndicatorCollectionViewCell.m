@interface SKUIActivityIndicatorCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SKUIActivityIndicatorCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setBackgroundColor:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
@end

@implementation SKUIActivityIndicatorCollectionViewCell

- (SKUIActivityIndicatorCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v8) {
        -[SKUIActivityIndicatorCollectionViewCell initWithFrame:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUIActivityIndicatorCollectionViewCell;
  v16 = -[SKUICollectionViewCell initWithFrame:](&v21, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    v17 = objc_alloc_init(SKUIActivityIndicatorView);
    indicatorView = v16->_indicatorView;
    v16->_indicatorView = v17;

    v19 = [(SKUIActivityIndicatorCollectionViewCell *)v16 contentView];
    [v19 addSubview:v16->_indicatorView];
  }
  return v16;
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
        +[SKUIActivityIndicatorCollectionViewCell prefetchResourcesForViewElement:reason:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  BOOL v17 = +[SKUIActivityIndicatorView prefetchResourcesForViewElement:v7 reason:a4 context:v8];

  return v17;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKUIActivityIndicatorCollectionViewCell preferredSizeForViewElement:context:]();
  }
  +[SKUIActivityIndicatorView preferredSizeForViewElement:v5 context:v6];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
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
        +[SKUIActivityIndicatorCollectionViewCell requestLayoutForViewElement:width:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  +[SKUIActivityIndicatorView requestLayoutForViewElement:v7 width:v8 context:a4];
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
        +[SKUIActivityIndicatorCollectionViewCell sizeThatFitsWidth:viewElement:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  +[SKUIActivityIndicatorView sizeThatFitsWidth:v7 viewElement:v8 context:a3];
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
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    [(SKUIActivityIndicatorCollectionViewCell *)self setNeedsLayout];
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return [(SKUIActivityIndicatorView *)self->_indicatorView setImage:a3 forArtworkRequest:a4 context:a5];
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return [(SKUIActivityIndicatorView *)self->_indicatorView updateWithItemState:a3 context:a4 animated:a5];
}

- (id)viewForElementIdentifier:(id)a3
{
  return [(SKUIActivityIndicatorView *)self->_indicatorView viewForElementIdentifier:a3];
}

- (void)applyLayoutAttributes:(id)a3
{
  indicatorView = self->_indicatorView;
  id v5 = a3;
  id v6 = [v5 backgroundColor];
  [(SKUIViewReuseView *)indicatorView setBackgroundColor:v6];

  v7.receiver = self;
  v7.super_class = (Class)SKUIActivityIndicatorCollectionViewCell;
  [(SKUICollectionViewCell *)&v7 applyLayoutAttributes:v5];
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)SKUIActivityIndicatorCollectionViewCell;
  [(SKUICollectionViewCell *)&v11 layoutSubviews];
  v3 = [(SKUIActivityIndicatorCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  -[SKUIActivityIndicatorView sizeThatFits:](self->_indicatorView, "sizeThatFits:", v5, v7);
  double v9 = v8;
  *(float *)&double v8 = (v5 - v8) * 0.5;
  *(float *)&double v10 = v7 * 0.5 - v10;
  -[SKUIActivityIndicatorView setFrame:](self->_indicatorView, "setFrame:", floorf(*(float *)&v8), floorf(*(float *)&v10), v9);
}

- (void)setBackgroundColor:(id)a3
{
  indicatorView = self->_indicatorView;
  id v5 = a3;
  [(SKUIViewReuseView *)indicatorView setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SKUIActivityIndicatorCollectionViewCell;
  [(SKUICollectionViewCell *)&v6 setBackgroundColor:v5];
}

- (void).cxx_destruct
{
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)prefetchResourcesForViewElement:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)preferredSizeForViewElement:context:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIActivityIndicatorCollectionViewCell preferredSizeForViewElement:context:]";
}

+ (void)requestLayoutForViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 viewElement:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end