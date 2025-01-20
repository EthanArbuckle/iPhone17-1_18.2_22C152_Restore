@interface SFDialogTextView
- (CGSize)intrinsicContentSize;
- (NSString)message;
- (SFDialogTextView)initWithCoder:(id)a3;
- (SFDialogTextView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)contentInsets;
- (UIFont)messageFont;
- (void)_updateFontStyling;
- (void)_updateText;
- (void)_updateTextContainerInset;
- (void)flashScrollIndicators;
- (void)layoutSubviews;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setMessage:(id)a3;
- (void)setPreferredMaxLayoutWidth:(double)a3;
- (void)setTitle:(id)a3;
@end

@implementation SFDialogTextView

- (SFDialogTextView)initWithFrame:(CGRect)a3
{
  v31[4] = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)SFDialogTextView;
  v3 = -[SFDialogTextView initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    message = v3->_message;
    v3->_message = (NSString *)&stru_1EDA07C28;

    v6 = (UITextView *)objc_alloc_init(MEMORY[0x1E4FB1DD8]);
    textView = v4->_textView;
    v4->_textView = v6;

    [(UITextView *)v4->_textView setAdjustsFontForContentSizeCategory:1];
    [(UITextView *)v4->_textView setAlwaysBounceVertical:0];
    [(UITextView *)v4->_textView setAlwaysBounceHorizontal:0];
    [(UITextView *)v4->_textView setBackgroundColor:0];
    [(UITextView *)v4->_textView setEditable:0];
    [(UITextView *)v4->_textView setKeyboardDismissMode:2];
    v8 = [MEMORY[0x1E4FB1618] labelColor];
    [(UITextView *)v4->_textView setTextColor:v8];

    [(UITextView *)v4->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextView *)v4->_textView setTextAlignment:4];
    [(SFDialogTextView *)v4 _updateFontStyling];
    [(SFDialogTextView *)v4 addSubview:v4->_textView];
    v25 = (void *)MEMORY[0x1E4F28DC8];
    v29 = [(UITextView *)v4->_textView centerXAnchor];
    v28 = [(SFDialogTextView *)v4 centerXAnchor];
    v27 = [v29 constraintEqualToAnchor:v28];
    v31[0] = v27;
    v26 = [(UITextView *)v4->_textView centerYAnchor];
    v9 = [(SFDialogTextView *)v4 centerYAnchor];
    v10 = [v26 constraintEqualToAnchor:v9];
    v31[1] = v10;
    v11 = [(UITextView *)v4->_textView widthAnchor];
    v12 = [(SFDialogTextView *)v4 widthAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v31[2] = v13;
    v14 = [(UITextView *)v4->_textView heightAnchor];
    v15 = [(SFDialogTextView *)v4 heightAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v31[3] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
    [v25 activateConstraints:v17];

    v18 = [(SFDialogTextView *)v4 layer];
    uint64_t v19 = newGradientLayer(0);
    topGradient = v4->_topGradient;
    v4->_topGradient = (CAGradientLayer *)v19;

    [v18 addSublayer:v4->_topGradient];
    uint64_t v21 = newGradientLayer(1);
    bottomGradient = v4->_bottomGradient;
    v4->_bottomGradient = (CAGradientLayer *)v21;

    [v18 addSublayer:v4->_bottomGradient];
    v23 = v4;
  }
  return v4;
}

- (SFDialogTextView)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFDialogTextView;
  return [(SFDialogTextView *)&v4 initWithCoder:a3];
}

- (CGSize)intrinsicContentSize
{
  double preferredMaxLayoutWidth = self->_preferredMaxLayoutWidth;
  if (preferredMaxLayoutWidth <= 0.0) {
    double preferredMaxLayoutWidth = 1.79769313e308;
  }
  [(UITextView *)self->_textView sizeThatFits:preferredMaxLayoutWidth];
  double v4 = ceil(v3);
  double v6 = ceil(v5);
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)SFDialogTextView;
  [(SFDialogTextView *)&v23 layoutSubviews];
  [(SFDialogTextView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(SFDialogTextView *)self contentInsets];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  uint64_t v19 = [MEMORY[0x1E4F39CF8] disableActions];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  v20 = gradientLayerColors(0);
  [(CAGradientLayer *)self->_topGradient setColors:v20];

  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  -[CAGradientLayer setFrame:](self->_topGradient, "setFrame:", v14, 0.0, CGRectGetWidth(v24) - v14 - v18, v12);
  uint64_t v21 = gradientLayerColors(1);
  [(CAGradientLayer *)self->_bottomGradient setColors:v21];

  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  CGFloat v22 = CGRectGetHeight(v25) - v16;
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  -[CAGradientLayer setFrame:](self->_bottomGradient, "setFrame:", v14, v22, CGRectGetWidth(v26) - v14 - v18, v16);
  [MEMORY[0x1E4F39CF8] setDisableActions:v19];
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
  }
  [(SFDialogTextView *)self _updateTextContainerInset];
  [(SFDialogTextView *)self invalidateIntrinsicContentSize];

  [(SFDialogTextView *)self setNeedsLayout];
}

- (void)_updateTextContainerInset
{
  -[UITextView setTextContainerInset:](self->_textView, "setTextContainerInset:", self->_contentInsets.top, self->_contentInsets.left, self->_contentInsets.bottom, self->_contentInsets.right);
  id v3 = [(UITextView *)self->_textView textContainer];
  [v3 setLineFragmentPadding:0.0];
}

- (void)_updateText
{
  v32[3] = *MEMORY[0x1E4F143B8];
  if (![(NSString *)self->_title length] && ![(NSString *)self->_message length])
  {
    [(UITextView *)self->_textView setFont:self->_messageFont];
    textView = self->_textView;
    CGRect v24 = &stru_1EDA07C28;
LABEL_15:
    [(UITextView *)textView setText:v24];
    return;
  }
  if (![(NSString *)self->_title length] || [(NSString *)self->_message length])
  {
    if ([(NSString *)self->_title length] || ![(NSString *)self->_message length])
    {
      -[UITextView setFont:](self->_textView, "setFont:", self->_messageFont, 440);
      if (!self->_titleParagraphStyle)
      {
        id v3 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
        CGFloat v4 = (void *)[v3 mutableCopy];

        [v4 setParagraphSpacing:8.0];
        double v5 = (NSParagraphStyle *)[v4 copy];
        titleParagraphStyle = self->_titleParagraphStyle;
        self->_titleParagraphStyle = v5;
      }
      id v7 = objc_alloc_init(MEMORY[0x1E4F28E48]);
      id v8 = objc_alloc(MEMORY[0x1E4F28B18]);
      double v9 = [(NSString *)self->_title stringByAppendingString:@"\n"];
      titleFont = self->_titleFont;
      uint64_t v12 = *MEMORY[0x1E4FB0738];
      v30[0] = *MEMORY[0x1E4FB06F8];
      uint64_t v10 = v30[0];
      v30[1] = v12;
      double v13 = self->_titleParagraphStyle;
      v32[0] = titleFont;
      v32[1] = v13;
      uint64_t v31 = *MEMORY[0x1E4FB0700];
      uint64_t v14 = v31;
      double v15 = [MEMORY[0x1E4FB1618] labelColor];
      v32[2] = v15;
      double v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v30 count:3];
      double v17 = (void *)[v8 initWithString:v9 attributes:v16];
      [v7 appendAttributedString:v17];

      id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
      message = self->_message;
      messageFontWithTitle = self->_messageFontWithTitle;
      v28[1] = v14;
      v29[0] = messageFontWithTitle;
      v28[0] = v10;
      uint64_t v21 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      v29[1] = v21;
      CGFloat v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
      objc_super v23 = (void *)[v18 initWithString:message attributes:v22];
      [v7 appendAttributedString:v23];

      [*(id *)&v26[(void)self] setAttributedText:v7];
      return;
    }
    [(UITextView *)self->_textView setFont:self->_messageFont];
    CGRect v24 = (__CFString *)self->_message;
    textView = self->_textView;
    goto LABEL_15;
  }
  [(UITextView *)self->_textView setFont:self->_titleFont];
  [(UITextView *)self->_textView setText:self->_title];
  id v27 = [MEMORY[0x1E4FB1618] labelColor];
  -[UITextView setTextColor:](self->_textView, "setTextColor:");
}

- (void)setTitle:(id)a3
{
  double v5 = (NSString *)a3;
  title = self->_title;
  if (title != v5)
  {
    id v8 = v5;
    BOOL v7 = [(NSString *)title isEqualToString:v5];
    double v5 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_title, a3);
      [(SFDialogTextView *)self _updateText];
      [(SFDialogTextView *)self invalidateIntrinsicContentSize];
      double v5 = v8;
    }
  }
}

- (void)setMessage:(id)a3
{
  double v5 = (NSString *)a3;
  message = self->_message;
  if (message != v5)
  {
    id v8 = v5;
    BOOL v7 = [(NSString *)message isEqualToString:v5];
    double v5 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_message, a3);
      [(SFDialogTextView *)self _updateText];
      [(SFDialogTextView *)self invalidateIntrinsicContentSize];
      double v5 = v8;
    }
  }
}

- (void)setPreferredMaxLayoutWidth:(double)a3
{
  if (self->_preferredMaxLayoutWidth != a3)
  {
    self->_double preferredMaxLayoutWidth = a3;
    [(SFDialogTextView *)self invalidateIntrinsicContentSize];
  }
}

- (void)_updateFontStyling
{
  uint64_t v3 = *MEMORY[0x1E4FB28C8];
  CGFloat v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  messageFont = self->_messageFont;
  self->_messageFont = v4;

  CGFloat v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v3];
  messageFontWithTitle = self->_messageFontWithTitle;
  self->_messageFontWithTitle = v6;

  id v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  titleFont = self->_titleFont;
  self->_titleFont = v8;

  [(SFDialogTextView *)self _updateText];
}

- (void)flashScrollIndicators
{
}

- (NSString)message
{
  return self->_message;
}

- (UIFont)messageFont
{
  return self->_messageFont;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageFont, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_bottomGradient, 0);
  objc_storeStrong((id *)&self->_topGradient, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_titleParagraphStyle, 0);
  objc_storeStrong((id *)&self->_messageFontWithTitle, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end