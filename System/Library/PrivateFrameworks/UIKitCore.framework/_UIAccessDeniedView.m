@interface _UIAccessDeniedView
- (NSString)message;
- (NSString)title;
- (_UIAccessDeniedView)initWithFrame:(CGRect)a3;
- (id)_textColor;
- (void)layoutSubviews;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation _UIAccessDeniedView

- (_UIAccessDeniedView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_UIAccessDeniedView;
  v3 = -[UIView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor whiteColor];
    [(UIView *)v3 setBackgroundColor:v4];

    uint64_t v5 = _UINSLocalizedStringWithDefaultValue(@"This app does not have access to your photos or videos.", @"This app does not have access to your photos or videos.");
    title = v3->_title;
    v3->_title = (NSString *)v5;

    uint64_t v7 = _UINSLocalizedStringWithDefaultValue(@"You can enable access in Privacy Settings.", @"You can enable access in Privacy Settings.");
    message = v3->_message;
    v3->_message = (NSString *)v7;
  }
  return v3;
}

- (void)setTitle:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    v4 = (NSString *)[v6 copy];
    title = self->_title;
    self->_title = v4;

    [(UILabel *)self->_titleLabel setText:self->_title];
    [(UIView *)self setNeedsLayout];
  }
}

- (void)setMessage:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_message, "isEqualToString:"))
  {
    v4 = (NSString *)[v6 copy];
    message = self->_message;
    self->_message = v4;

    [(UILabel *)self->_messageLabel setText:self->_message];
    [(UIView *)self setNeedsLayout];
  }
}

- (id)_textColor
{
  return +[UIColor colorWithRed:0.5 green:0.533 blue:0.584 alpha:1.0];
}

- (void)layoutSubviews
{
  v45.receiver = self;
  v45.super_class = (Class)_UIAccessDeniedView;
  [(UIView *)&v45 layoutSubviews];
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v44 = v9;
  if (!self->_titleLabel)
  {
    objc_super v10 = objc_alloc_init(UILabel);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v10;

    v12 = self->_titleLabel;
    v13 = [(_UIAccessDeniedView *)self title];
    [(UILabel *)v12 setText:v13];

    v14 = self->_titleLabel;
    [off_1E52D39B8 defaultFontSize];
    v15 = objc_msgSend(off_1E52D39B8, "boldSystemFontOfSize:");
    [(UILabel *)v14 setFont:v15];

    v16 = self->_titleLabel;
    v17 = [(_UIAccessDeniedView *)self _textColor];
    [(UILabel *)v16 setTextColor:v17];

    [(UILabel *)self->_titleLabel setTextAlignment:1];
    [(UILabel *)self->_titleLabel setNumberOfLines:0];
    [(UILabel *)self->_titleLabel setLineBreakMode:4];
    [(UIView *)self addSubview:self->_titleLabel];
  }
  if (!self->_messageLabel)
  {
    v18 = objc_alloc_init(UILabel);
    messageLabel = self->_messageLabel;
    self->_messageLabel = v18;

    v20 = self->_messageLabel;
    v21 = [(_UIAccessDeniedView *)self message];
    [(UILabel *)v20 setText:v21];

    v22 = self->_messageLabel;
    v23 = [off_1E52D39B8 systemFontOfSize:15.0];
    [(UILabel *)v22 setFont:v23];

    v24 = self->_messageLabel;
    v25 = [(_UIAccessDeniedView *)self _textColor];
    [(UILabel *)v24 setTextColor:v25];

    [(UILabel *)self->_messageLabel setTextAlignment:1];
    [(UILabel *)self->_messageLabel setNumberOfLines:0];
    [(UILabel *)self->_messageLabel setLineBreakMode:4];
    [(UIView *)self addSubview:self->_messageLabel];
  }
  lockView = self->_lockView;
  if (!lockView)
  {
    v27 = _UIImageWithName(@"UIAccessDeniedViewLock.png");
    v28 = [[UIImageView alloc] initWithImage:v27];
    v29 = self->_lockView;
    self->_lockView = v28;

    [(UIView *)self addSubview:self->_lockView];
    lockView = self->_lockView;
  }
  [(UIView *)lockView frame];
  double width = v46.size.width;
  v46.origin.double x = round((v8 - v46.size.width) * 0.5);
  double x = v46.origin.x;
  double height = v46.size.height;
  CGFloat v31 = v4 + 12.0;
  v46.origin.y = v6;
  CGFloat v32 = CGRectGetMaxY(v46) + 18.0;
  CGFloat v33 = v8 + -24.0;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v33, 40.0);
  double v35 = v34;
  CGFloat v36 = v32 + v34 + 6.0;
  -[UILabel sizeThatFits:](self->_messageLabel, "sizeThatFits:", v33, 40.0);
  double v38 = v37;
  v47.origin.double x = v31;
  v47.origin.y = v36;
  v47.size.double width = v33;
  v47.size.double height = v38;
  double v39 = round((v44 - CGRectGetMaxY(v47)) * 0.5);
  CGFloat v40 = v32 + v39;
  CGFloat v41 = v36 + v39;
  -[UIImageView setFrame:](self->_lockView, "setFrame:", x, v6 + v39, width, height);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v31, v40, v33, v35);
  -[UILabel setFrame:](self->_messageLabel, "setFrame:", v31, v41, v33, v38);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_lockView, 0);
}

@end