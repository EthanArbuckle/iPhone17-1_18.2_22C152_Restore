@interface HomeActionFooterCell
- (HomeActionFooterCell)initWithFrame:(CGRect)a3;
- (HomeActionFooterViewModel)viewModel;
- (void)prepareForReuse;
- (void)setViewModel:(id)a3;
@end

@implementation HomeActionFooterCell

- (HomeActionFooterCell)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)HomeActionFooterCell;
  v3 = -[HomeActionFooterCell initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(HomeActionFooterCell *)v3 _mapsui_resetLayoutMargins];
    [(HomeActionFooterCell *)v4 setEdgesPreservingSuperviewLayoutMargins:10];
    v5 = [(HomeActionFooterCell *)v4 contentView];
    [v5 _mapsui_resetLayoutMarginsWithPreservesSuperview:1];

    v6 = -[HomeActionFooterContentView initWithFrame:]([HomeActionFooterContentView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    footerView = v4->_footerView;
    v4->_footerView = v6;

    [(HomeActionFooterContentView *)v4->_footerView setPreservesSuperviewLayoutMargins:1];
    v8 = [(HomeActionFooterCell *)v4 contentView];
    [v8 addSubview:v4->_footerView];

    id v9 = objc_alloc((Class)MUEdgeLayout);
    v10 = v4->_footerView;
    v11 = [(HomeActionFooterCell *)v4 contentView];
    id v12 = [v9 initWithItem:v10 container:v11];

    [v12 activate];
  }
  return v4;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)HomeActionFooterCell;
  [(HomeActionFooterCell *)&v3 prepareForReuse];
  [(HomeActionFooterContentView *)self->_footerView rebuildContentIfNeeded];
}

- (HomeActionFooterViewModel)viewModel
{
  return [(HomeActionFooterContentView *)self->_footerView viewModel];
}

- (void)setViewModel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end