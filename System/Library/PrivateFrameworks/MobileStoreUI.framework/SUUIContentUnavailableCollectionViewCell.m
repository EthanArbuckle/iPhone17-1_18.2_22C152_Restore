@interface SUUIContentUnavailableCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SUUIContentUnavailableCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setBackgroundColor:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
@end

@implementation SUUIContentUnavailableCollectionViewCell

- (SUUIContentUnavailableCollectionViewCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SUUIContentUnavailableCollectionViewCell;
  v3 = -[SUUICollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(SUUIContentUnavailableView);
    contentUnavailableView = v3->_contentUnavailableView;
    v3->_contentUnavailableView = v4;

    v6 = [(SUUIContentUnavailableCollectionViewCell *)v3 contentView];
    [v6 addSubview:v3->_contentUnavailableView];
  }
  return v3;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return +[SUUIContentUnavailableView prefetchResourcesForViewElement:a3 reason:a4 context:a5];
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  +[SUUIContentUnavailableView preferredSizeForViewElement:a3 context:a4];
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  +[SUUIContentUnavailableView sizeThatFitsWidth:a4 viewElement:a5 context:a3];
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
    [(SUUIContentUnavailableCollectionViewCell *)self setNeedsLayout];
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return [(SUUIContentUnavailableView *)self->_contentUnavailableView setImage:a3 forArtworkRequest:a4 context:a5];
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return [(SUUIContentUnavailableView *)self->_contentUnavailableView updateWithItemState:a3 context:a4 animated:a5];
}

- (id)viewForElementIdentifier:(id)a3
{
  return [(SUUIContentUnavailableView *)self->_contentUnavailableView viewForElementIdentifier:a3];
}

- (void)applyLayoutAttributes:(id)a3
{
  contentUnavailableView = self->_contentUnavailableView;
  id v5 = a3;
  double v6 = [v5 backgroundColor];
  [(SUUIViewReuseView *)contentUnavailableView setBackgroundColor:v6];

  v7.receiver = self;
  v7.super_class = (Class)SUUIContentUnavailableCollectionViewCell;
  [(SUUICollectionViewCell *)&v7 applyLayoutAttributes:v5];
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)SUUIContentUnavailableCollectionViewCell;
  [(SUUICollectionViewCell *)&v9 layoutSubviews];
  contentUnavailableView = self->_contentUnavailableView;
  double v4 = [(SUUIContentUnavailableCollectionViewCell *)self contentView];
  [v4 bounds];
  -[SUUIContentUnavailableView setFrame:](contentUnavailableView, "setFrame:", v5 + self->_contentInset.left, v6 + self->_contentInset.top, v7 - (self->_contentInset.left + self->_contentInset.right), v8 - (self->_contentInset.top + self->_contentInset.bottom));
}

- (void)setBackgroundColor:(id)a3
{
  contentUnavailableView = self->_contentUnavailableView;
  id v5 = a3;
  [(SUUIViewReuseView *)contentUnavailableView setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIContentUnavailableCollectionViewCell;
  [(SUUICollectionViewCell *)&v6 setBackgroundColor:v5];
}

- (void).cxx_destruct
{
}

@end