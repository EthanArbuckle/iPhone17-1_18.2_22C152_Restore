@interface ICQUITipHostCell
+ (int64_t)cellStyle;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIView)tipView;
- (void)_setupContentViewToHostTip;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setTipView:(id)a3;
@end

@implementation ICQUITipHostCell

+ (int64_t)cellStyle
{
  return 0;
}

- (void)_setupContentViewToHostTip
{
  v3 = [(PSTableCell *)self titleLabel];
  [v3 setText:&stru_26DFF2C90];

  id v4 = [MEMORY[0x263F825C8] clearColor];
  [(ICQUITipHostCell *)self setBackgroundColor:v4];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICQUITipHostCell;
  id v4 = a3;
  [(PSTableCell *)&v7 refreshCellContentsWithSpecifier:v4];
  [(ICQUITipHostCell *)self _setupContentViewToHostTip];
  v5 = [v4 propertyForKey:@"ICQUITipView"];

  tipView = self->_tipView;
  self->_tipView = v5;

  [(ICQUITipHostCell *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UIView sizeThatFits:](self->_tipView, "sizeThatFits:", a3.width, 1.79769313e308);
  double v5 = v4 + 0.0;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)ICQUITipHostCell;
  [(PSTableCell *)&v8 layoutSubviews];
  if (self->_tipView)
  {
    double v3 = [(ICQUITipHostCell *)self contentView];
    [v3 frame];
    double v5 = v4;
    v6 = [(ICQUITipHostCell *)self contentView];
    [v6 frame];
    -[UIView setFrame:](self->_tipView, "setFrame:", 0.0, 0.0, v5);

    objc_super v7 = [(ICQUITipHostCell *)self contentView];
    [v7 addSubview:self->_tipView];
  }
}

- (UIView)tipView
{
  return self->_tipView;
}

- (void)setTipView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end