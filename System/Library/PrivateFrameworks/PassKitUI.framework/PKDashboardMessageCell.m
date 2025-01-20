@interface PKDashboardMessageCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKDashboardMessageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (PKDashboardMessageView)dashboardMessageView;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation PKDashboardMessageCell

- (PKDashboardMessageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PKDashboardMessageCell;
  v4 = [(PKDashboardMessageCell *)&v11 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [PKDashboardMessageView alloc];
    v6 = [(PKDashboardMessageCell *)v4 contentView];
    [v6 bounds];
    uint64_t v7 = -[PKDashboardMessageView initWithFrame:](v5, "initWithFrame:");
    dashboardMessageView = v4->_dashboardMessageView;
    v4->_dashboardMessageView = (PKDashboardMessageView *)v7;

    v9 = [(PKDashboardMessageCell *)v4 contentView];
    [v9 addSubview:v4->_dashboardMessageView];

    -[PKDashboardMessageCell setSeparatorInset:](v4, "setSeparatorInset:", 0.0, 14.0, 0.0, 0.0);
  }
  return v4;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKDashboardMessageCell;
  [(PKDashboardMessageCell *)&v5 layoutSubviews];
  dashboardMessageView = self->_dashboardMessageView;
  v4 = [(PKDashboardMessageCell *)self contentView];
  [v4 bounds];
  -[PKDashboardMessageView setFrame:](dashboardMessageView, "setFrame:");
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PKDashboardMessageCell;
  [(PKDashboardMessageCell *)&v3 prepareForReuse];
  [(PKDashboardMessageView *)self->_dashboardMessageView prepareForReuse];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKDashboardMessageView sizeThatFits:](self->_dashboardMessageView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (PKDashboardMessageView)dashboardMessageView
{
  return self->_dashboardMessageView;
}

- (void).cxx_destruct
{
}

@end