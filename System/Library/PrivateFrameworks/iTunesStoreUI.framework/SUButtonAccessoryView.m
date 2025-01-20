@interface SUButtonAccessoryView
- (SUButtonAccessoryView)initWithDefaultSize;
- (SUGradientButton)button;
- (void)dealloc;
- (void)layoutSubviews;
@end

@implementation SUButtonAccessoryView

- (SUButtonAccessoryView)initWithDefaultSize
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "bounds");

  return -[SUButtonAccessoryView initWithFrame:](self, "initWithFrame:", 0.0, 0.0);
}

- (void)dealloc
{
  self->_button = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUButtonAccessoryView;
  [(SUButtonAccessoryView *)&v3 dealloc];
}

- (SUGradientButton)button
{
  button = self->_button;
  if (!button)
  {
    v4 = objc_alloc_init(SUGradientButton);
    self->_button = v4;
    v5 = (void *)[(SUGradientButton *)v4 titleLabel];
    objc_msgSend(v5, "setFont:", objc_msgSend(MEMORY[0x263F1C658], "boldSystemFontOfSize:", 17.0));
    [(SUGradientButton *)self->_button sizeToFit];
    button = self->_button;
  }
  if ((SUButtonAccessoryView *)[(SUGradientButton *)button superview] != self) {
    [(SUButtonAccessoryView *)self addSubview:self->_button];
  }
  return self->_button;
}

- (void)layoutSubviews
{
  button = self->_button;
  if (button)
  {
    [(SUGradientButton *)button frame];
    double v5 = v4;
    [(SUButtonAccessoryView *)self bounds];
    v7 = self->_button;
    double v8 = v6 + -9.0 + -9.0;
    -[SUGradientButton setFrame:](v7, "setFrame:", 9.0, 16.0, v8, v5);
  }
}

@end