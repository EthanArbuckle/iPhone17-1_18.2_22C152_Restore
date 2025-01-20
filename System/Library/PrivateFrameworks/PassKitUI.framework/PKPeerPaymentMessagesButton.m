@interface PKPeerPaymentMessagesButton
+ (CGSize)referenceSize;
- (BOOL)showsActivityIndicator;
- (CGSize)imageSize;
- (PKPeerPaymentMessagesButton)init;
- (PKPeerPaymentMessagesButton)initWithFrame:(CGRect)a3;
- (PKPeerPaymentMessagesButton)initWithFrame:(CGRect)a3 usePlatterColor:(BOOL)a4;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setShowsActivityIndicator:(BOOL)a3;
@end

@implementation PKPeerPaymentMessagesButton

+ (CGSize)referenceSize
{
  double v2 = 44.0;
  double v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (PKPeerPaymentMessagesButton)init
{
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(id)objc_opt_class() referenceSize];

  return -[PKPeerPaymentMessagesButton initWithFrame:](self, "initWithFrame:", v3, v4, v5, v6);
}

- (PKPeerPaymentMessagesButton)initWithFrame:(CGRect)a3
{
  double v4 = *MEMORY[0x1E4F1DAD8];
  double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(id)objc_opt_class() referenceSize];

  return -[PKPeerPaymentMessagesButton initWithFrame:usePlatterColor:](self, "initWithFrame:usePlatterColor:", 1, v4, v5, v6, v7);
}

- (PKPeerPaymentMessagesButton)initWithFrame:(CGRect)a3 usePlatterColor:(BOOL)a4
{
  BOOL v4 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPeerPaymentMessagesButton;
  double v5 = -[PKPeerPaymentMessagesButton initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = +[PKPeerPaymentTheme platterPressedColor];
      highlightedBackgroundColor = v5->_highlightedBackgroundColor;
      v5->_highlightedBackgroundColor = (UIColor *)v6;

      +[PKPeerPaymentTheme platterColor];
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4FB1618] clearColor];
      v10 = v5->_highlightedBackgroundColor;
      v5->_highlightedBackgroundColor = (UIColor *)v9;

      [MEMORY[0x1E4FB1618] clearColor];
    uint64_t v8 = };
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (UIColor *)v8;

    [(PKPeerPaymentMessagesButton *)v5 setHighlighted:0];
    v12 = [(PKPeerPaymentMessagesButton *)v5 imageView];
    [v12 setContentMode:1];
  }
  return v5;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentMessagesButton;
  -[PKPeerPaymentMessagesButton setHighlighted:](&v6, sel_setHighlighted_);
  uint64_t v5 = 1;
  if (v3) {
    uint64_t v5 = 0;
  }
  [(PKPeerPaymentMessagesButton *)self setBackgroundColor:*(Class *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR___PKPeerPaymentMessagesButton__highlightedBackgroundColor[v5])];
}

- (void)setImageSize:(CGSize)a3
{
  if (self->_imageSize.width != a3.width || self->_imageSize.height != a3.height)
  {
    self->_imageSize = a3;
    [(PKPeerPaymentMessagesButton *)self setNeedsLayout];
  }
}

- (void)setShowsActivityIndicator:(BOOL)a3
{
  self->_showsActivityIndicator = a3;
  spinner = self->_spinner;
  if (a3)
  {
    double v5 = 0.0;
    if (!spinner)
    {
      objc_super v6 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
      double v7 = self->_spinner;
      self->_spinner = v6;

      uint64_t v8 = self->_spinner;
      uint64_t v9 = [MEMORY[0x1E4FB1618] whiteColor];
      [(UIActivityIndicatorView *)v8 setColor:v9];

      [(UIActivityIndicatorView *)self->_spinner startAnimating];
      [(PKPeerPaymentMessagesButton *)self addSubview:self->_spinner];
    }
  }
  else
  {
    double v5 = 1.0;
    if (spinner)
    {
      [(UIActivityIndicatorView *)spinner removeFromSuperview];
      v10 = self->_spinner;
      self->_spinner = 0;
    }
  }
  v11 = [(PKPeerPaymentMessagesButton *)self titleLabel];
  [v11 setAlpha:v5];

  [(PKPeerPaymentMessagesButton *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentMessagesButton;
  [(PKPeerPaymentMessagesButton *)&v8 layoutSubviews];
  [(PKPeerPaymentMessagesButton *)self bounds];
  UIRectGetCenter();
  spinner = self->_spinner;
  if (spinner) {
    -[UIActivityIndicatorView setCenter:](spinner, "setCenter:", v3, v4);
  }
  if (self->_imageSize.width != *MEMORY[0x1E4F1DB30]
    || self->_imageSize.height != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    double v7 = [(PKPeerPaymentMessagesButton *)self imageView];
    UIRectCenteredAboutPoint();
    objc_msgSend(v7, "setFrame:");
  }
}

- (BOOL)showsActivityIndicator
{
  return self->_showsActivityIndicator;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, 0);

  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end