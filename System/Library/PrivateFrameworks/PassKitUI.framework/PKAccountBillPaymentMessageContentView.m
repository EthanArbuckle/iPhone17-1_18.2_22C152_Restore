@interface PKAccountBillPaymentMessageContentView
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSAttributedString)attributedMessage;
- (NSString)message;
- (NSString)systemImage;
- (PKAccountBillPaymentMessageContentView)initWithFrame:(CGRect)a3;
- (id)_messageFont;
- (id)imageView;
- (id)messageTextView;
- (void)layoutSubviews;
- (void)setAttributedMessage:(id)a3;
- (void)setMessage:(id)a3;
- (void)setSystemImage:(id)a3;
@end

@implementation PKAccountBillPaymentMessageContentView

- (PKAccountBillPaymentMessageContentView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKAccountBillPaymentMessageContentView;
  v3 = -[PKAccountBillPaymentMessageContentView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [(PKAccountBillPaymentMessageContentView *)v3 setBackgroundColor:v4];

    [(PKAccountBillPaymentMessageContentView *)v3 setUserInteractionEnabled:1];
    v5 = [(PKAccountBillPaymentMessageContentView *)v3 layer];
    [v5 setCornerRadius:14.0];
    [v5 setCornerCurve:*MEMORY[0x1E4F39EA8]];
  }
  return v3;
}

- (void)setSystemImage:(id)a3
{
  p_systemImage = (id *)&self->_systemImage;
  id v10 = a3;
  if ((objc_msgSend(*p_systemImage, "isEqualToString:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_systemImage, a3);
    if (*p_systemImage)
    {
      imageView = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB2788], 2, 0);
      objc_super v7 = [MEMORY[0x1E4FB1830] configurationWithFont:imageView scale:-1];
      v8 = [MEMORY[0x1E4FB1818] systemImageNamed:v10 withConfiguration:v7];
      v9 = [(PKAccountBillPaymentMessageContentView *)self imageView];
      [v9 setImage:v8];
    }
    else
    {
      [(UIImageView *)self->_imageView removeFromSuperview];
      imageView = self->_imageView;
      self->_imageView = 0;
    }

    [(PKAccountBillPaymentMessageContentView *)self setNeedsLayout];
  }
}

- (void)setMessage:(id)a3
{
  p_message = &self->_message;
  id v8 = a3;
  if (!-[NSString isEqualToString:](*p_message, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_message, a3);
    attributedMessage = self->_attributedMessage;
    self->_attributedMessage = 0;

    if ([(NSString *)*p_message length])
    {
      messageTextView = [(PKAccountBillPaymentMessageContentView *)self messageTextView];
      [messageTextView setText:v8];
    }
    else
    {
      [(UITextView *)self->_messageTextView removeFromSuperview];
      messageTextView = self->_messageTextView;
      self->_messageTextView = 0;
    }

    [(PKAccountBillPaymentMessageContentView *)self setNeedsLayout];
  }
}

- (void)setAttributedMessage:(id)a3
{
  p_attributedMessage = &self->_attributedMessage;
  id v14 = a3;
  if (!-[NSAttributedString isEqualToAttributedString:](*p_attributedMessage, "isEqualToAttributedString:"))
  {
    objc_storeStrong((id *)&self->_attributedMessage, a3);
    message = self->_message;
    self->_message = 0;

    if ([(NSAttributedString *)*p_attributedMessage length])
    {
      messageTextView = (UITextView *)[v14 mutableCopy];
      uint64_t v8 = [v14 length];
      uint64_t v9 = *MEMORY[0x1E4FB06F8];
      id v10 = [(PKAccountBillPaymentMessageContentView *)self _messageFont];
      -[UITextView addAttribute:value:range:](messageTextView, "addAttribute:value:range:", v9, v10, 0, v8);

      uint64_t v11 = *MEMORY[0x1E4FB0700];
      v12 = [MEMORY[0x1E4FB1618] labelColor];
      -[UITextView addAttribute:value:range:](messageTextView, "addAttribute:value:range:", v11, v12, 0, v8);

      v13 = [(PKAccountBillPaymentMessageContentView *)self messageTextView];
      [v13 setAttributedText:messageTextView];
    }
    else
    {
      [(UITextView *)self->_messageTextView removeFromSuperview];
      messageTextView = self->_messageTextView;
      self->_messageTextView = 0;
    }

    [(PKAccountBillPaymentMessageContentView *)self setNeedsLayout];
  }
}

- (id)messageTextView
{
  messageTextView = self->_messageTextView;
  if (!messageTextView)
  {
    objc_msgSend(MEMORY[0x1E4FB1DD8], "pkui_plainNonInteractiveTextViewWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v4 = (UITextView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_messageTextView;
    self->_messageTextView = v4;

    [(UITextView *)self->_messageTextView setDelegate:self];
    -[UITextView setTextContainerInset:](self->_messageTextView, "setTextContainerInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [(UITextView *)self->_messageTextView setEditable:0];
    [(UITextView *)self->_messageTextView setSelectable:1];
    [(UITextView *)self->_messageTextView _setInteractiveTextSelectionDisabled:1];
    [(UITextView *)self->_messageTextView setUserInteractionEnabled:1];
    v6 = self->_messageTextView;
    objc_super v7 = [(PKAccountBillPaymentMessageContentView *)self _messageFont];
    [(UITextView *)v6 setFont:v7];

    uint64_t v8 = self->_messageTextView;
    uint64_t v9 = [MEMORY[0x1E4FB1618] labelColor];
    [(UITextView *)v8 setTextColor:v9];

    [(PKAccountBillPaymentMessageContentView *)self addSubview:self->_messageTextView];
    messageTextView = self->_messageTextView;
  }

  return messageTextView;
}

- (id)imageView
{
  imageView = self->_imageView;
  if (!imageView)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    v5 = self->_imageView;
    self->_imageView = v4;

    v6 = self->_imageView;
    objc_super v7 = [MEMORY[0x1E4FB1618] labelColor];
    [(UIImageView *)v6 setTintColor:v7];

    [(PKAccountBillPaymentMessageContentView *)self addSubview:self->_imageView];
    imageView = self->_imageView;
  }

  return imageView;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKAccountBillPaymentMessageContentView;
  [(PKAccountBillPaymentMessageContentView *)&v3 layoutSubviews];
  [(PKAccountBillPaymentMessageContentView *)self bounds];
  -[PKAccountBillPaymentMessageContentView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKAccountBillPaymentMessageContentView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double width = a3.size.width;
  memset(&v22, 0, sizeof(v22));
  double v7 = a3.origin.x + 16.0;
  double v8 = a3.origin.y + 10.0;
  remainder.origin.x = a3.origin.x + 16.0;
  remainder.origin.y = a3.origin.y + 10.0;
  double v9 = a3.size.height + -20.0;
  remainder.size.double width = a3.size.width + -32.0;
  remainder.size.height = a3.size.height + -20.0;
  if ([(PKAccountBillPaymentMessageContentView *)self _shouldReverseLayoutDirection])CGRectEdge v10 = CGRectMaxXEdge; {
  else
  }
    CGRectEdge v10 = CGRectMinXEdge;
  imageView = self->_imageView;
  double v12 = 0.0;
  double v13 = 0.0;
  if (imageView)
  {
    -[UIImageView sizeThatFits:](imageView, "sizeThatFits:", width + -32.0, v9);
    CGFloat v15 = v14;
    double v13 = v16;
    v25.origin.x = v7;
    v25.origin.y = v8;
    v25.size.double width = width + -32.0;
    v25.size.height = v9;
    CGRectDivide(v25, &v22, &remainder, v15, v10);
    PKSizeAlignedInRect();
    if (!a4) {
      -[UIImageView setFrame:](self->_imageView, "setFrame:");
    }
    CGRectDivide(remainder, &v22, &remainder, 16.0, v10);
  }
  messageTextView = self->_messageTextView;
  if (messageTextView)
  {
    -[UITextView sizeThatFits:](messageTextView, "sizeThatFits:", remainder.size.width, remainder.size.height);
    double v12 = v18;
    CGRectDivide(remainder, &v22, &remainder, v19, v10);
    if (!a4) {
      -[UITextView setFrame:](self->_messageTextView, "setFrame:", *(_OWORD *)&v22.origin, *(_OWORD *)&v22.size);
    }
  }
  double v20 = fmax(v12, v13) + 0.0 + 20.0;
  double v21 = width;
  result.height = v20;
  result.double width = v21;
  return result;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  return a6 == 0;
}

- (id)_messageFont
{
  return PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2950], (void *)*MEMORY[0x1E4FB2788], 0x8000, 0);
}

- (NSString)systemImage
{
  return self->_systemImage;
}

- (NSString)message
{
  return self->_message;
}

- (NSAttributedString)attributedMessage
{
  return self->_attributedMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_systemImage, 0);
  objc_storeStrong((id *)&self->_messageTextView, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end