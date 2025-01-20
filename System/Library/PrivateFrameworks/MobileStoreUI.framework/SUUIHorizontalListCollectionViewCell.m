@interface SUUIHorizontalListCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SUUIHorizontalListCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)contentInset;
- (id)viewForElementIdentifier:(id)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setBackgroundColor:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
@end

@implementation SUUIHorizontalListCollectionViewCell

- (SUUIHorizontalListCollectionViewCell)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SUUIHorizontalListCollectionViewCell;
  v3 = -[SUUICollectionViewCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [SUUIHorizontalListView alloc];
    [(SUUIHorizontalListCollectionViewCell *)v3 bounds];
    uint64_t v5 = -[SUUIHorizontalListView initWithFrame:](v4, "initWithFrame:");
    horizontalList = v3->_horizontalList;
    v3->_horizontalList = (SUUIHorizontalListView *)v5;

    v7 = [(SUUIHorizontalListCollectionViewCell *)v3 contentView];
    [v7 addSubview:v3->_horizontalList];
  }
  return v3;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
  -[SUUIHorizontalListView setContentInset:](self->_horizontalList, "setContentInset:");
}

- (void)applyLayoutAttributes:(id)a3
{
  horizontalList = self->_horizontalList;
  id v5 = a3;
  v6 = [v5 backgroundColor];
  [(SUUIViewReuseView *)horizontalList setBackgroundColor:v6];

  v7.receiver = self;
  v7.super_class = (Class)SUUIHorizontalListCollectionViewCell;
  [(SUUICollectionViewCell *)&v7 applyLayoutAttributes:v5];
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return +[SUUIHorizontalListView prefetchResourcesForViewElement:a3 reason:a4 context:a5];
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
  +[SUUIHorizontalListView sizeThatFitsWidth:a4 viewElement:a5 context:a3];
  result.height = v6;
  result.width = v5;
  return result;
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return [(SUUIHorizontalListView *)self->_horizontalList setImage:a3 forArtworkRequest:a4 context:a5];
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return [(SUUIHorizontalListView *)self->_horizontalList updateWithItemState:a3 context:a4 animated:a5];
}

- (id)viewForElementIdentifier:(id)a3
{
  return [(SUUIHorizontalListView *)self->_horizontalList viewForElementIdentifier:a3];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIHorizontalListCollectionViewCell;
  [(SUUICollectionViewCell *)&v5 layoutSubviews];
  horizontalList = self->_horizontalList;
  v4 = [(SUUIHorizontalListCollectionViewCell *)self contentView];
  [v4 bounds];
  -[SUUIHorizontalListView setFrame:](horizontalList, "setFrame:");
}

- (void)setBackgroundColor:(id)a3
{
  horizontalList = self->_horizontalList;
  id v5 = a3;
  [(SUUIViewReuseView *)horizontalList setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIHorizontalListCollectionViewCell;
  [(SUUICollectionViewCell *)&v6 setBackgroundColor:v5];
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
}

@end