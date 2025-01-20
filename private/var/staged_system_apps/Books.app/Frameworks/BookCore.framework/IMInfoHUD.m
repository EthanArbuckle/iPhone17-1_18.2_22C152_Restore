@interface IMInfoHUD
- (CGRect)anchorRect;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UILabel)textLabel;
- (UIView)backgroundView;
- (id)_backgroundView;
- (void)dealloc;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAnchorRect:(CGRect)a3;
- (void)setBackgroundView:(id)a3;
- (void)setTextLabel:(id)a3;
@end

@implementation IMInfoHUD

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (self->_textLabel == a6)
  {
    [(IMInfoHUD *)self setNeedsLayout];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)IMInfoHUD;
    -[IMInfoHUD observeValueForKeyPath:ofObject:change:context:](&v6, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)dealloc
{
  [(UILabel *)self->_textLabel removeObserver:self forKeyPath:@"text"];
  v3.receiver = self;
  v3.super_class = (Class)IMInfoHUD;
  [(IMInfoHUD *)&v3 dealloc];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v4 = [(IMInfoHUD *)self superview];
  [v4 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  v31.origin.CGFloat x = v6;
  v31.origin.CGFloat y = v8;
  v31.size.CGFloat width = v10;
  v31.size.CGFloat height = v12;
  CGRect v32 = CGRectInset(v31, 20.0, 20.0);
  CGFloat x = v32.origin.x;
  CGFloat y = v32.origin.y;
  CGFloat width = v32.size.width;
  CGFloat height = v32.size.height;
  CGRect v33 = CGRectInset(v32, 10.0, 5.0);
  double v17 = v33.size.width;
  double v18 = v33.size.height;
  v19 = [(IMInfoHUD *)self textLabel];
  [v19 sizeThatFits:v17, v18];
  double v21 = v20;
  double v23 = v22;

  double v24 = v21 + 20.0;
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  double v25 = CGRectGetWidth(v34);
  if (v24 >= v25) {
    double v24 = v25;
  }
  double v26 = v23 + 10.0;
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  double v27 = CGRectGetHeight(v35);
  if (v26 >= v27) {
    double v28 = v27;
  }
  else {
    double v28 = v26;
  }
  double v29 = v24;
  result.CGFloat height = v28;
  result.CGFloat width = v29;
  return result;
}

- (void)layoutSubviews
{
  [(IMInfoHUD *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[IMInfoHUD sizeThatFits:](self, "sizeThatFits:", v7, v9);
  double v12 = v11;
  double v14 = v13;
  id v21 = [(IMInfoHUD *)self _backgroundView];
  v23.origin.CGFloat x = v4;
  v23.origin.CGFloat y = v6;
  v23.size.CGFloat width = v8;
  v23.size.CGFloat height = v10;
  double v15 = round((CGRectGetWidth(v23) - v12) * 0.5);
  v24.origin.CGFloat x = v4;
  v24.origin.CGFloat y = v6;
  v24.size.CGFloat width = v8;
  v24.size.CGFloat height = v10;
  double v16 = round((CGRectGetHeight(v24) - v14) * 0.5);
  [v21 setFrame:v15, v16, v12, v14];
  double v17 = [(IMInfoHUD *)self textLabel];
  double v18 = [(IMInfoHUD *)self textLabel];
  [v18 setFrame:CGRectMake(v15 + 10.0, v16 + 5.0, v12 + -20.0, v14 + -10.0)];

  v19 = [v17 text];
  BOOL v20 = [v19 length] == 0;

  [v21 setHidden:v20];
  [v17 setHidden:v20];
}

- (UILabel)textLabel
{
  textLabel = self->_textLabel;
  if (!textLabel)
  {
    CGFloat v4 = [(UILabel *)[objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height]];
    double v5 = self->_textLabel;
    self->_textLabel = v4;

    CGFloat v6 = +[UIFont systemFontOfSize:17.0];
    [(UILabel *)self->_textLabel setFont:v6];

    [(UILabel *)self->_textLabel setTextAlignment:1];
    double v7 = +[UIColor blackColor];
    [(UILabel *)self->_textLabel setTextColor:v7];

    CGFloat v8 = +[UIColor clearColor];
    [(UILabel *)self->_textLabel setBackgroundColor:v8];

    [(UILabel *)self->_textLabel setNumberOfLines:0];
    [(UILabel *)self->_textLabel setLineBreakMode:0];
    [(UILabel *)self->_textLabel addObserver:self forKeyPath:@"text" options:0 context:self->_textLabel];
    [(IMInfoHUD *)self addSubview:self->_textLabel];
    textLabel = self->_textLabel;
  }

  return textLabel;
}

- (id)_backgroundView
{
  backgroundView = self->_backgroundView;
  if (!backgroundView)
  {
    CGFloat v4 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    double v5 = self->_backgroundView;
    self->_backgroundView = v4;

    [(UIView *)self->_backgroundView setContentMode:0];
    [(UIView *)self->_backgroundView setAutoresizingMask:18];
    id v6 = +[UIColor colorWithWhite:1.0 alpha:0.9];
    id v7 = [v6 CGColor];
    CGFloat v8 = [(UIView *)self->_backgroundView layer];
    [v8 setBackgroundColor:v7];

    double v9 = [(UIView *)self->_backgroundView layer];
    [v9 setCornerRadius:5.0];

    CGFloat v10 = [(UIView *)self->_backgroundView layer];
    [v10 setMasksToBounds:1];

    [(IMInfoHUD *)self insertSubview:self->_backgroundView atIndex:0];
    backgroundView = self->_backgroundView;
  }

  return backgroundView;
}

- (void)setTextLabel:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (CGRect)anchorRect
{
  double x = self->_anchorRect.origin.x;
  double y = self->_anchorRect.origin.y;
  double width = self->_anchorRect.size.width;
  double height = self->_anchorRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAnchorRect:(CGRect)a3
{
  self->_anchorRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end