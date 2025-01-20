@interface SUUIRedeemTextField
- (BOOL)backdropBackground;
- (BOOL)suppressBorder;
- (CGRect)editingRectForBounds:(CGRect)a3;
- (CGRect)placeholderRectForBounds:(CGRect)a3;
- (CGRect)textRectForBounds:(CGRect)a3;
- (SUUIRedeemTextField)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBackdropBackground:(BOOL)a3;
- (void)setSuppressBorder:(BOOL)a3;
@end

@implementation SUUIRedeemTextField

- (SUUIRedeemTextField)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)SUUIRedeemTextField;
  v3 = -[SUUIRedeemTextField initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263F82EB8]) initWithPrivateStyle:10060];
    backdropView = v3->_backdropView;
    v3->_backdropView = (UIView *)v4;

    [(UIView *)v3->_backdropView setHidden:1];
    [(SUUIRedeemTextField *)v3 insertSubview:v3->_backdropView atIndex:0];
    v6 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    bottomBorderView = v3->_bottomBorderView;
    v3->_bottomBorderView = v6;

    v8 = v3->_bottomBorderView;
    v9 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)v8 setBackgroundColor:v9];

    [(SUUIRedeemTextField *)v3 addSubview:v3->_bottomBorderView];
    v10 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    topBorderView = v3->_topBorderView;
    v3->_topBorderView = v10;

    v12 = v3->_topBorderView;
    v13 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)v12 setBackgroundColor:v13];

    [(SUUIRedeemTextField *)v3 addSubview:v3->_topBorderView];
    v3->_backdropBackground = 0;
    v14 = [MEMORY[0x263F825C8] whiteColor];
    [(SUUIRedeemTextField *)v3 setBackgroundColor:v14];

    [(SUUIRedeemTextField *)v3 setOpaque:1];
  }
  return v3;
}

- (void)setBackdropBackground:(BOOL)a3
{
  if (self->_backdropBackground != a3)
  {
    BOOL v3 = a3;
    self->_backdropBackground = a3;
    backdropView = self->_backdropView;
    if (a3)
    {
      [(UIView *)backdropView setHidden:0];
      [MEMORY[0x263F825C8] clearColor];
    }
    else
    {
      [(UIView *)backdropView setHidden:1];
      [MEMORY[0x263F825C8] whiteColor];
    v6 = };
    [(SUUIRedeemTextField *)self setBackgroundColor:v6];

    [(SUUIRedeemTextField *)self setOpaque:!v3];
  }
}

- (void)setSuppressBorder:(BOOL)a3
{
  BOOL v3 = a3;
  self->_suppressBorder = a3;
  -[UIView setHidden:](self->_bottomBorderView, "setHidden:");
  topBorderView = self->_topBorderView;
  [(UIView *)topBorderView setHidden:v3];
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)SUUIRedeemTextField;
  -[SUUIRedeemTextField editingRectForBounds:](&v8, sel_editingRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v6 = width + -30.0;
  double v7 = 15.0;
  result.size.height = v5;
  result.size.double width = v6;
  result.origin.y = v4;
  result.origin.x = v7;
  return result;
}

- (CGRect)placeholderRectForBounds:(CGRect)a3
{
  double width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)SUUIRedeemTextField;
  -[SUUIRedeemTextField placeholderRectForBounds:](&v8, sel_placeholderRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v6 = width + -30.0;
  double v7 = 15.0;
  result.size.height = v5;
  result.size.double width = v6;
  result.origin.y = v4;
  result.origin.x = v7;
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  double width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)SUUIRedeemTextField;
  -[SUUIRedeemTextField textRectForBounds:](&v8, sel_textRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v6 = width + -30.0;
  double v7 = 15.0;
  result.size.height = v5;
  result.size.double width = v6;
  result.origin.y = v4;
  result.origin.x = v7;
  return result;
}

- (void)layoutSubviews
{
  [(SUUIRedeemTextField *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = [MEMORY[0x263F82B60] mainScreen];
  [v7 scale];
  double v9 = 1.0 / v8;

  -[UIView setFrame:](self->_bottomBorderView, "setFrame:", 0.0, v6 - v9, v4, v9);
  -[UIView setFrame:](self->_topBorderView, "setFrame:", 0.0, 0.0, v4, v9);
  v10.receiver = self;
  v10.super_class = (Class)SUUIRedeemTextField;
  [(SUUIRedeemTextField *)&v10 layoutSubviews];
}

- (BOOL)backdropBackground
{
  return self->_backdropBackground;
}

- (BOOL)suppressBorder
{
  return self->_suppressBorder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_topBorderView, 0);
  objc_storeStrong((id *)&self->_bottomBorderView, 0);
}

@end