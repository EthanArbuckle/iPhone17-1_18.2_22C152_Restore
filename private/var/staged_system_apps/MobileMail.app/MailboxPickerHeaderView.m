@interface MailboxPickerHeaderView
- (MailboxPickerHeaderView)init;
- (UILabel)titleLabel;
- (void)layoutSubviews;
@end

@implementation MailboxPickerHeaderView

- (MailboxPickerHeaderView)init
{
  v14.receiver = self;
  v14.super_class = (Class)MailboxPickerHeaderView;
  v2 = [(MailboxPickerHeaderView *)&v14 init];
  if (v2)
  {
    v3 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    titleLabel = v2->_titleLabel;
    v2->_titleLabel = v3;

    v5 = +[UIFontDescriptor defaultFontDescriptorWithTextStyle:UIFontTextStyleSubheadline1 addingSymbolicTraits:0x8000 options:0];
    v6 = v2->_titleLabel;
    v7 = +[UIFont fontWithDescriptor:v5 size:0.0];
    [(UILabel *)v6 setFont:v7];

    v8 = v2->_titleLabel;
    v9 = +[UIColor mailAccountCellTitleColor];
    [(UILabel *)v8 setTextColor:v9];

    v10 = v2->_titleLabel;
    v11 = +[UIColor clearColor];
    [(UILabel *)v10 setBackgroundColor:v11];

    v12 = [(MailboxPickerHeaderView *)v2 contentView];
    [v12 addSubview:v2->_titleLabel];
  }
  return v2;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)MailboxPickerHeaderView;
  [(MailboxPickerHeaderView *)&v18 layoutSubviews];
  v3 = [(UILabel *)self->_titleLabel text];

  if (v3)
  {
    [(UILabel *)self->_titleLabel sizeToFit];
    [(UILabel *)self->_titleLabel frame];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v12 = 16.0;
    if ([(MailboxPickerHeaderView *)self mf_prefersRightToLeftInterfaceLayout])
    {
      v13 = [(MailboxPickerHeaderView *)self contentView];
      [v13 bounds];
      double MaxX = CGRectGetMaxX(v19);
      v20.origin.x = v5;
      v20.origin.y = v7;
      v20.size.width = v9;
      v20.size.height = v11;
      double v12 = MaxX - CGRectGetWidth(v20) + -16.0;
    }
    v15 = [(UILabel *)self->_titleLabel font];
    [v15 _bodyLeading];
    UIRoundToViewScale();
    double v17 = v16 + -4.0;

    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v12, v17, v9, v11);
  }
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void).cxx_destruct
{
}

@end