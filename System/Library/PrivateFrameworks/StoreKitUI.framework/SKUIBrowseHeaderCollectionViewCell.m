@interface SKUIBrowseHeaderCollectionViewCell
- (NSString)title;
- (SKUIBrowseHeaderCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)setTitle:(id)a3;
@end

@implementation SKUIBrowseHeaderCollectionViewCell

- (SKUIBrowseHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIBrowseHeaderCollectionViewCell initWithFrame:]();
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUIBrowseHeaderCollectionViewCell;
  v8 = -[SKUICollectionViewCell initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    v10 = [(SKUIBrowseHeaderCollectionViewCell *)v8 contentView];
    v11 = [MEMORY[0x1E4FB1618] colorWithWhite:0.94 alpha:1.0];
    [v10 setBackgroundColor:v11];

    [(SKUIBrowseHeaderCollectionViewCell *)v9 setUserInteractionEnabled:0];
    v12 = objc_alloc_init(SKUIGroupedHeaderView);
    headerView = v9->_headerView;
    v9->_headerView = v12;

    [(SKUIGroupedHeaderView *)v9->_headerView setAutoresizingMask:18];
    v14 = v9->_headerView;
    v15 = [(SKUIBrowseHeaderCollectionViewCell *)v9 contentView];
    [v15 bounds];
    -[SKUIGroupedHeaderView setFrame:](v14, "setFrame:");

    v16 = [(SKUIBrowseHeaderCollectionViewCell *)v9 contentView];
    [v16 addSubview:v9->_headerView];
  }
  return v9;
}

- (NSString)title
{
  return [(SKUIGroupedHeaderView *)self->_headerView title];
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIBrowseHeaderCollectionViewCell initWithFrame:]";
}

@end