@interface SUUIActivityIndicatorCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SUUIActivityIndicatorCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setBackgroundColor:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
@end

@implementation SUUIActivityIndicatorCollectionViewCell

- (SUUIActivityIndicatorCollectionViewCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SUUIActivityIndicatorCollectionViewCell;
  v3 = -[SUUICollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(SUUIActivityIndicatorView);
    indicatorView = v3->_indicatorView;
    v3->_indicatorView = v4;

    v6 = [(SUUIActivityIndicatorCollectionViewCell *)v3 contentView];
    [v6 addSubview:v3->_indicatorView];
  }
  return v3;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return +[SUUIActivityIndicatorView prefetchResourcesForViewElement:a3 reason:a4 context:a5];
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  +[SUUIActivityIndicatorView preferredSizeForViewElement:a3 context:a4];
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  +[SUUIActivityIndicatorView sizeThatFitsWidth:a4 viewElement:a5 context:a3];
  result.height = v6;
  result.width = v5;
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
    [(SUUIActivityIndicatorCollectionViewCell *)self setNeedsLayout];
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return [(SUUIActivityIndicatorView *)self->_indicatorView setImage:a3 forArtworkRequest:a4 context:a5];
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return [(SUUIActivityIndicatorView *)self->_indicatorView updateWithItemState:a3 context:a4 animated:a5];
}

- (id)viewForElementIdentifier:(id)a3
{
  return [(SUUIActivityIndicatorView *)self->_indicatorView viewForElementIdentifier:a3];
}

- (void)applyLayoutAttributes:(id)a3
{
  indicatorView = self->_indicatorView;
  id v5 = a3;
  double v6 = [v5 backgroundColor];
  [(SUUIViewReuseView *)indicatorView setBackgroundColor:v6];

  v7.receiver = self;
  v7.super_class = (Class)SUUIActivityIndicatorCollectionViewCell;
  [(SUUICollectionViewCell *)&v7 applyLayoutAttributes:v5];
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)SUUIActivityIndicatorCollectionViewCell;
  [(SUUICollectionViewCell *)&v11 layoutSubviews];
  v3 = [(SUUIActivityIndicatorCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  -[SUUIActivityIndicatorView sizeThatFits:](self->_indicatorView, "sizeThatFits:", v5, v7);
  double v9 = v8;
  *(float *)&double v8 = (v5 - v8) * 0.5;
  *(float *)&double v10 = v7 * 0.5 - v10;
  -[SUUIActivityIndicatorView setFrame:](self->_indicatorView, "setFrame:", floorf(*(float *)&v8), floorf(*(float *)&v10), v9);
}

- (void)setBackgroundColor:(id)a3
{
  indicatorView = self->_indicatorView;
  id v5 = a3;
  [(SUUIViewReuseView *)indicatorView setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIActivityIndicatorCollectionViewCell;
  [(SUUICollectionViewCell *)&v6 setBackgroundColor:v5];
}

- (void).cxx_destruct
{
}

@end