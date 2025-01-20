@interface SUUISectionHeaderCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SUUISectionHeaderCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setBackgroundColor:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
@end

@implementation SUUISectionHeaderCollectionViewCell

- (SUUISectionHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SUUISectionHeaderCollectionViewCell;
  v3 = -[SUUICollectionViewCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(SUUISectionHeaderCollectionViewCell *)v3 contentView];
    v6 = [SUUISectionHeaderView alloc];
    [v5 bounds];
    uint64_t v7 = -[SUUISectionHeaderView initWithFrame:](v6, "initWithFrame:");
    headerView = v4->_headerView;
    v4->_headerView = (SUUISectionHeaderView *)v7;

    [v5 addSubview:v4->_headerView];
  }
  return v4;
}

- (void)applyLayoutAttributes:(id)a3
{
  headerView = self->_headerView;
  v5 = (void *)MEMORY[0x263F825C8];
  id v6 = a3;
  uint64_t v7 = [v5 clearColor];
  [(SUUIViewReuseView *)headerView setBackgroundColor:v7];

  v8.receiver = self;
  v8.super_class = (Class)SUUISectionHeaderCollectionViewCell;
  [(SUUICollectionViewCell *)&v8 applyLayoutAttributes:v6];
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return +[SUUISectionHeaderView prefetchResourcesForViewElement:a3 reason:a4 context:a5];
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  +[SUUISectionHeaderView preferredSizeForViewElement:a3 context:a4];
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  +[SUUISectionHeaderView sizeThatFitsWidth:a4 viewElement:a5 context:a3];
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
  return [(SUUISectionHeaderView *)self->_headerView setImage:a3 forArtworkRequest:a4 context:a5];
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return [(SUUISectionHeaderView *)self->_headerView updateWithItemState:a3 context:a4 animated:a5];
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SUUISectionHeaderCollectionViewCell;
  [(SUUICollectionViewCell *)&v5 layoutSubviews];
  headerView = self->_headerView;
  double v4 = [(SUUISectionHeaderCollectionViewCell *)self contentView];
  [v4 bounds];
  -[SUUISectionHeaderView setFrame:](headerView, "setFrame:");
}

- (void)setBackgroundColor:(id)a3
{
  headerView = self->_headerView;
  id v5 = a3;
  [(SUUIViewReuseView *)headerView setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUISectionHeaderCollectionViewCell;
  [(SUUICollectionViewCell *)&v6 setBackgroundColor:v5];
}

- (void).cxx_destruct
{
}

@end