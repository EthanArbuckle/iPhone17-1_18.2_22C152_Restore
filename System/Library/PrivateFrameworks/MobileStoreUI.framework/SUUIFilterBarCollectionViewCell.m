@interface SUUIFilterBarCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SUUIFilterBarCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setBackgroundColor:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
@end

@implementation SUUIFilterBarCollectionViewCell

- (SUUIFilterBarCollectionViewCell)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SUUIFilterBarCollectionViewCell;
  v3 = -[SUUIViewReuseCollectionViewCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(SUUIFilterBarCollectionViewCell *)v3 contentView];
    v6 = [SUUIFilterBarView alloc];
    [v5 bounds];
    uint64_t v7 = -[SUUIFilterBarView initWithFrame:](v6, "initWithFrame:");
    filterBarView = v4->_filterBarView;
    v4->_filterBarView = (SUUIFilterBarView *)v7;

    [v5 addSubview:v4->_filterBarView];
  }
  return v4;
}

- (void)applyLayoutAttributes:(id)a3
{
  filterBarView = self->_filterBarView;
  id v5 = a3;
  v6 = [v5 backgroundColor];
  [(SUUIViewReuseView *)filterBarView setBackgroundColor:v6];

  v7.receiver = self;
  v7.super_class = (Class)SUUIFilterBarCollectionViewCell;
  [(SUUIViewReuseCollectionViewCell *)&v7 applyLayoutAttributes:v5];
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return +[SUUIFilterBarView prefetchResourcesForViewElement:a3 reason:a4 context:a5];
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  +[SUUIFilterBarView preferredSizeForViewElement:a3 context:a4];
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  +[SUUIFilterBarView sizeThatFitsWidth:a4 viewElement:a5 context:a3];
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
  return [(SUUIFilterBarView *)self->_filterBarView setImage:a3 forArtworkRequest:a4 context:a5];
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return [(SUUIFilterBarView *)self->_filterBarView updateWithItemState:a3 context:a4 animated:a5];
}

- (id)viewForElementIdentifier:(id)a3
{
  return [(SUUIFilterBarView *)self->_filterBarView viewForElementIdentifier:a3];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIFilterBarCollectionViewCell;
  [(SUUICollectionViewCell *)&v5 layoutSubviews];
  filterBarView = self->_filterBarView;
  double v4 = [(SUUIFilterBarCollectionViewCell *)self contentView];
  [v4 bounds];
  -[SUUIFilterBarView setFrame:](filterBarView, "setFrame:");
}

- (void)setBackgroundColor:(id)a3
{
  filterBarView = self->_filterBarView;
  id v5 = a3;
  [(SUUIViewReuseView *)filterBarView setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIFilterBarCollectionViewCell;
  [(SUUIViewReuseCollectionViewCell *)&v6 setBackgroundColor:v5];
}

- (void).cxx_destruct
{
}

@end