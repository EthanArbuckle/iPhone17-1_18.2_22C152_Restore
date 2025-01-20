@interface HomeActionFooterView
- (HomeActionFooterView)initWithReuseIdentifier:(id)a3;
- (HomeActionFooterViewModel)viewModel;
- (void)prepareForReuse;
- (void)setViewModel:(id)a3;
@end

@implementation HomeActionFooterView

- (HomeActionFooterView)initWithReuseIdentifier:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)HomeActionFooterView;
  v3 = [(HomeActionFooterView *)&v19 initWithReuseIdentifier:a3];
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(HomeActionFooterView *)v3 setBackgroundColor:v4];

    id v5 = objc_alloc((Class)UIView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    id v9 = [v5 initWithFrame:CGRectZero.origin.x, y, width, height];
    [(HomeActionFooterView *)v3 setBackgroundView:v9];

    [(HomeActionFooterView *)v3 _mapsui_resetLayoutMarginsWithPreservesSuperview:1];
    v10 = [(HomeActionFooterView *)v3 contentView];
    [v10 _mapsui_resetLayoutMarginsWithPreservesSuperview:1];

    v11 = -[HomeActionFooterContentView initWithFrame:]([HomeActionFooterContentView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    footerView = v3->_footerView;
    v3->_footerView = v11;

    [(HomeActionFooterContentView *)v3->_footerView setPreservesSuperviewLayoutMargins:1];
    v13 = [(HomeActionFooterView *)v3 contentView];
    [v13 addSubview:v3->_footerView];

    id v14 = objc_alloc((Class)MUEdgeLayout);
    v15 = v3->_footerView;
    v16 = [(HomeActionFooterView *)v3 contentView];
    id v17 = [v14 initWithItem:v15 container:v16];

    [v17 activate];
  }
  return v3;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)HomeActionFooterView;
  [(HomeActionFooterView *)&v3 prepareForReuse];
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