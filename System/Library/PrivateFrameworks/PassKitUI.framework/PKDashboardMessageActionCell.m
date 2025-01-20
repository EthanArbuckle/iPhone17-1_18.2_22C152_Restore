@interface PKDashboardMessageActionCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKDashboardMessageActionCell)initWithReuseIdentifier:(id)a3;
- (PKDashboardMessageActionCell)initWithSize:(CGSize)a3;
- (PKDashboardMessageActionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (PKDashboardMessageActionView)actionView;
- (void)_commonInit;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation PKDashboardMessageActionCell

- (PKDashboardMessageActionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PKDashboardMessageActionCell;
  v4 = [(PKDashboardMessageActionCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(PKDashboardMessageActionCell *)v4 _commonInit];
  }
  return v5;
}

- (PKDashboardMessageActionCell)initWithReuseIdentifier:(id)a3
{
  return [(PKDashboardMessageActionCell *)self initWithStyle:0 reuseIdentifier:a3];
}

- (PKDashboardMessageActionCell)initWithSize:(CGSize)a3
{
  return -[PKDashboardMessageActionCell initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
}

- (void)_commonInit
{
  v3 = [PKDashboardMessageActionView alloc];
  v4 = [(PKDashboardMessageActionCell *)self contentView];
  [v4 bounds];
  v5 = -[PKDashboardMessageActionView initWithFrame:](v3, "initWithFrame:");
  actionView = self->_actionView;
  self->_actionView = v5;

  id v7 = [(PKDashboardMessageActionCell *)self contentView];
  [v7 addSubview:self->_actionView];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKDashboardMessageActionCell;
  [(PKDashboardMessageActionCell *)&v5 layoutSubviews];
  actionView = self->_actionView;
  v4 = [(PKDashboardMessageActionCell *)self contentView];
  [v4 bounds];
  -[PKDashboardMessageActionView setFrame:](actionView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKDashboardMessageActionView sizeThatFits:](self->_actionView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PKDashboardMessageActionCell;
  [(PKDashboardMessageActionCell *)&v3 prepareForReuse];
  [(PKDashboardMessageActionView *)self->_actionView prepareForReuse];
}

- (PKDashboardMessageActionView)actionView
{
  return self->_actionView;
}

- (void).cxx_destruct
{
}

@end