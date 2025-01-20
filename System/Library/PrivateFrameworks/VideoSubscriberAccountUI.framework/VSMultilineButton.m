@interface VSMultilineButton
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (VSMultilineButton)initWithCoder:(id)a3;
- (VSMultilineButton)initWithFrame:(CGRect)a3;
- (void)_updateTitleTextColor;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation VSMultilineButton

- (VSMultilineButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VSMultilineButton;
  v3 = -[VSMultilineButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    commonInit(v3);
  }
  return v4;
}

- (VSMultilineButton)initWithCoder:(id)a3
{
  id v4 = a3;
  VSRequireKeyedCoder();
  v7.receiver = self;
  v7.super_class = (Class)VSMultilineButton;
  v5 = [(VSMultilineButton *)&v7 initWithCoder:v4];

  if (v5) {
    commonInit(v5);
  }
  return v5;
}

- (void)dealloc
{
  VSRequireMainThread();
  v3.receiver = self;
  v3.super_class = (Class)VSMultilineButton;
  [(VSMultilineButton *)&v3 dealloc];
}

- (void)_updateTitleTextColor
{
  id v3 = [(VSMultilineButton *)self tintColor];
  [(VSMultilineButton *)self setTitleColor:v3 forState:0];
}

- (CGSize)intrinsicContentSize
{
  [(VSMultilineButton *)self layoutMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(VSMultilineButton *)self titleLabel];
  [v11 intrinsicContentSize];
  double v13 = v12;
  double v15 = v14;

  double v16 = v4 + v8 + v15;
  double v17 = v6 + v10 + v13;
  result.height = v16;
  result.width = v17;
  return result;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)VSMultilineButton;
  [(VSMultilineButton *)&v6 layoutSubviews];
  double v3 = [(VSMultilineButton *)self titleLabel];
  [v3 frame];
  [v3 setPreferredMaxLayoutWidth:v4];
  v5.receiver = self;
  v5.super_class = (Class)VSMultilineButton;
  [(VSMultilineButton *)&v5 layoutSubviews];
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VSMultilineButton;
  [(VSMultilineButton *)&v4 setHighlighted:a3];
  [(VSMultilineButton *)self setNeedsDisplay];
}

- (void)drawRect:(CGRect)a3
{
  if ([(VSMultilineButton *)self isHighlighted])
  {
    objc_super v4 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.200000003];
    [v4 set];

    objc_super v5 = (void *)MEMORY[0x263F1C478];
    [(VSMultilineButton *)self bounds];
    objc_msgSend(v5, "bezierPathWithRoundedRect:cornerRadius:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v6 fill];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  objc_super v5 = [(VSMultilineButton *)self titleLabel];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)VSMultilineButton;
  [(VSMultilineButton *)&v3 tintColorDidChange];
  [(VSMultilineButton *)self _updateTitleTextColor];
}

@end