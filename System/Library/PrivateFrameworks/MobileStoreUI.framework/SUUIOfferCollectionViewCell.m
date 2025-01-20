@interface SUUIOfferCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SUUIOfferCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setBackgroundColor:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
@end

@implementation SUUIOfferCollectionViewCell

- (SUUIOfferCollectionViewCell)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SUUIOfferCollectionViewCell;
  v3 = -[SUUICollectionViewCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(SUUIOfferCollectionViewCell *)v3 contentView];
    v6 = [SUUIOfferView alloc];
    [v5 bounds];
    uint64_t v7 = -[SUUIOfferView initWithFrame:](v6, "initWithFrame:");
    offerView = v4->_offerView;
    v4->_offerView = (SUUIOfferView *)v7;

    [v5 addSubview:v4->_offerView];
  }
  return v4;
}

- (void)applyLayoutAttributes:(id)a3
{
  offerView = self->_offerView;
  id v5 = a3;
  v6 = [v5 backgroundColor];
  [(SUUIViewReuseView *)offerView setBackgroundColor:v6];

  v7.receiver = self;
  v7.super_class = (Class)SUUIOfferCollectionViewCell;
  [(SUUICollectionViewCell *)&v7 applyLayoutAttributes:v5];
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return +[SUUIOfferView prefetchResourcesForViewElement:a3 reason:a4 context:a5];
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  +[SUUIOfferView preferredSizeForViewElement:a3 context:a4];
  result.height = v5;
  result.width = v4;
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
  +[SUUIOfferView sizeThatFitsWidth:a4 viewElement:a5 context:a3];
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return [(SUUIOfferView *)self->_offerView setImage:a3 forArtworkRequest:a4 context:a5];
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return [(SUUIOfferView *)self->_offerView updateWithItemState:a3 context:a4 animated:a5];
}

- (id)viewForElementIdentifier:(id)a3
{
  return [(SUUIOfferView *)self->_offerView viewForElementIdentifier:a3];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIOfferCollectionViewCell;
  [(SUUICollectionViewCell *)&v5 layoutSubviews];
  offerView = self->_offerView;
  double v4 = [(SUUIOfferCollectionViewCell *)self contentView];
  [v4 bounds];
  -[SUUIOfferView setFrame:](offerView, "setFrame:");
}

- (void)setBackgroundColor:(id)a3
{
  offerView = self->_offerView;
  id v5 = a3;
  [(SUUIViewReuseView *)offerView setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIOfferCollectionViewCell;
  [(SUUICollectionViewCell *)&v6 setBackgroundColor:v5];
}

- (void).cxx_destruct
{
}

@end