@interface SKUISectionHeaderCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SKUISectionHeaderCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setBackgroundColor:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
@end

@implementation SKUISectionHeaderCollectionViewCell

- (SKUISectionHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUISectionHeaderCollectionViewCell initWithFrame:]();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUISectionHeaderCollectionViewCell;
  v8 = -[SKUICollectionViewCell initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    v10 = [(SKUISectionHeaderCollectionViewCell *)v8 contentView];
    v11 = [SKUISectionHeaderView alloc];
    [v10 bounds];
    uint64_t v12 = -[SKUISectionHeaderView initWithFrame:](v11, "initWithFrame:");
    headerView = v9->_headerView;
    v9->_headerView = (SKUISectionHeaderView *)v12;

    [v10 addSubview:v9->_headerView];
  }
  return v9;
}

- (void)applyLayoutAttributes:(id)a3
{
  headerView = self->_headerView;
  v5 = (void *)MEMORY[0x1E4FB1618];
  id v6 = a3;
  v7 = [v5 clearColor];
  [(SKUIViewReuseView *)headerView setBackgroundColor:v7];

  v8.receiver = self;
  v8.super_class = (Class)SKUISectionHeaderCollectionViewCell;
  [(SKUICollectionViewCell *)&v8 applyLayoutAttributes:v6];
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return +[SKUISectionHeaderView prefetchResourcesForViewElement:a3 reason:a4 context:a5];
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  +[SKUISectionHeaderView preferredSizeForViewElement:a3 context:a4];
  result.double height = v5;
  result.double width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  +[SKUISectionHeaderView sizeThatFitsWidth:a4 viewElement:a5 context:a3];
  result.double height = v6;
  result.double width = v5;
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
  return [(SKUISectionHeaderView *)self->_headerView setImage:a3 forArtworkRequest:a4 context:a5];
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return [(SKUISectionHeaderView *)self->_headerView updateWithItemState:a3 context:a4 animated:a5];
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SKUISectionHeaderCollectionViewCell;
  [(SKUICollectionViewCell *)&v5 layoutSubviews];
  headerView = self->_headerView;
  double v4 = [(SKUISectionHeaderCollectionViewCell *)self contentView];
  [v4 bounds];
  -[SKUISectionHeaderView setFrame:](headerView, "setFrame:");
}

- (void)setBackgroundColor:(id)a3
{
  headerView = self->_headerView;
  id v5 = a3;
  [(SKUIViewReuseView *)headerView setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SKUISectionHeaderCollectionViewCell;
  [(SKUICollectionViewCell *)&v6 setBackgroundColor:v5];
}

- (void).cxx_destruct
{
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISectionHeaderCollectionViewCell initWithFrame:]";
}

@end