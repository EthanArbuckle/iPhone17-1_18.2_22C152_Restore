@interface SULoadingView
- (SULoadingView)initWithFrame:(CGRect)a3;
- (UIColor)activityIndicatorColor;
- (UIColor)textColor;
- (UIColor)textShadowColor;
- (id)newProgressIndicator;
- (id)newTextLabel;
- (int64_t)activityIndicatorStyle;
- (void)_setupSubviews;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setActivityIndicatorColor:(id)a3;
- (void)setActivityIndicatorStyle:(int64_t)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setTextColor:(id)a3;
- (void)setTextShadowColor:(id)a3;
- (void)sizeToFit;
@end

@implementation SULoadingView

- (SULoadingView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SULoadingView;
  v3 = -[SULoadingView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_activityIndicatorStyle = 100;
    v3->_textColor = (UIColor *)(id)[MEMORY[0x263F1C550] secondaryLabelColor];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SULoadingView;
  [(SULoadingView *)&v3 dealloc];
}

- (void)layoutSubviews
{
  [(SULoadingView *)self _setupSubviews];
  [(SULoadingView *)self addSubview:self->_label];
  [(SULoadingView *)self addSubview:self->_progressIndicator];
  [(SULoadingView *)self bounds];
  double v4 = v3;
  [(UILabel *)self->_label frame];
  double v6 = v5;
  double v8 = v7;
  [(UIActivityIndicatorView *)self->_progressIndicator frame];
  double v11 = v9 + v10 + 4.0;
  label = self->_label;
  double v13 = floor((v4 - v8) * 0.5);

  -[UILabel setFrame:](label, "setFrame:", v11, v13, v6, v8);
}

- (void)sizeToFit
{
  [(SULoadingView *)self _setupSubviews];
  [(UILabel *)self->_label frame];
  [(UIActivityIndicatorView *)self->_progressIndicator frame];
  [(SULoadingView *)self frame];

  -[SULoadingView setFrame:](self, "setFrame:");
}

- (id)newProgressIndicator
{
  double v3 = (void *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:self->_activityIndicatorStyle];
  [v3 setColor:self->_activityIndicatorColor];
  [v3 startAnimating];
  return v3;
}

- (id)newTextLabel
{
  id v3 = objc_alloc_init(MEMORY[0x263F1C768]);
  [v3 setBackgroundColor:0];
  objc_msgSend(v3, "setHighlightedTextColor:", objc_msgSend(MEMORY[0x263F1C550], "whiteColor"));
  [v3 setOpaque:0];
  objc_msgSend(v3, "setFont:", objc_msgSend(MEMORY[0x263F1C658], "systemFontOfSize:", 14.0));
  if (self->_textShadowColor)
  {
    objc_msgSend(v3, "setShadowColor:");
    objc_msgSend(v3, "setShadowOffset:", 0.0, 1.0);
  }
  objc_msgSend(v3, "setText:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"LOADING", &stru_26DB8C5F8, 0));
  [v3 setTextColor:self->_textColor];
  return v3;
}

- (void)setActivityIndicatorColor:(id)a3
{
  activityIndicatorColor = self->_activityIndicatorColor;
  if (activityIndicatorColor != a3)
  {

    double v6 = (UIColor *)a3;
    self->_activityIndicatorColor = v6;
    progressIndicator = self->_progressIndicator;
    [(UIActivityIndicatorView *)progressIndicator setColor:v6];
  }
}

- (void)setActivityIndicatorStyle:(int64_t)a3
{
  self->_activityIndicatorStyle = a3;
  -[UIActivityIndicatorView setActivityIndicatorViewStyle:](self->_progressIndicator, "setActivityIndicatorViewStyle:");
}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    if (a3 == 1) {
      uint64_t v4 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.5];
    }
    else {
      uint64_t v4 = [MEMORY[0x263F1C550] whiteColor];
    }
    [(SULoadingView *)self setTextShadowColor:v4];
  }
}

- (void)setTextColor:(id)a3
{
  textColor = self->_textColor;
  if (textColor != a3)
  {

    self->_textColor = (UIColor *)a3;
    label = self->_label;
    [(UILabel *)label setTextColor:a3];
  }
}

- (void)setTextShadowColor:(id)a3
{
  textShadowColor = self->_textShadowColor;
  if (textShadowColor != a3)
  {

    self->_textShadowColor = (UIColor *)a3;
    label = self->_label;
    [(UILabel *)label setShadowColor:a3];
  }
}

- (void)_setupSubviews
{
  if (!self->_label)
  {
    id v3 = [(SULoadingView *)self newTextLabel];
    self->_label = v3;
    [(UILabel *)v3 sizeToFit];
  }
  if (!self->_progressIndicator) {
    self->_progressIndicator = (UIActivityIndicatorView *)[(SULoadingView *)self newProgressIndicator];
  }
}

- (UIColor)activityIndicatorColor
{
  return self->_activityIndicatorColor;
}

- (int64_t)activityIndicatorStyle
{
  return self->_activityIndicatorStyle;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIColor)textShadowColor
{
  return self->_textShadowColor;
}

@end