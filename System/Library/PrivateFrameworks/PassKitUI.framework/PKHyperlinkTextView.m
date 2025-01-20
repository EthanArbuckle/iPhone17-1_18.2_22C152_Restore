@interface PKHyperlinkTextView
- (BOOL)isLinkUnderlined;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (PKHyperlinkTextView)initWithFrame:(CGRect)a3;
- (UIColor)linkForegroundColor;
- (id)action;
- (void)setAction:(id)a3;
- (void)setIsLinkUnderlined:(BOOL)a3;
- (void)setLinkForegroundColor:(id)a3;
- (void)updateLinkTextAttributes;
@end

@implementation PKHyperlinkTextView

- (void)setLinkForegroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_linkForegroundColor, a3);

  [(PKHyperlinkTextView *)self updateLinkTextAttributes];
}

- (void)setIsLinkUnderlined:(BOOL)a3
{
  self->_isLinkUnderlined = a3;
  [(PKHyperlinkTextView *)self updateLinkTextAttributes];
}

- (void)updateLinkTextAttributes
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = *MEMORY[0x1E4FB0700];
  linkForegroundColor = self->_linkForegroundColor;
  v4 = linkForegroundColor;
  if (!linkForegroundColor)
  {
    v4 = [MEMORY[0x1E4FB1618] linkColor];
  }
  v8[0] = v4;
  v7[1] = *MEMORY[0x1E4FB0808];
  v5 = [NSNumber numberWithBool:self->_isLinkUnderlined];
  v8[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  [(PKHyperlinkTextView *)self setLinkTextAttributes:v6];

  if (!linkForegroundColor) {
}
  }

- (PKHyperlinkTextView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKHyperlinkTextView;
  v3 = -[PKHyperlinkTextView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E4FB1DD8], "pkui_styleTextView:", v3);
    [(PKHyperlinkTextView *)v3 setEditable:0];
    [(PKHyperlinkTextView *)v3 setScrollEnabled:0];
    [(PKHyperlinkTextView *)v3 _setInteractiveTextSelectionDisabled:1];
    [(PKHyperlinkTextView *)v3 setDataDetectorTypes:2];
    [(PKHyperlinkTextView *)v3 setDelegate:v3];
    uint64_t v4 = [MEMORY[0x1E4FB1618] linkColor];
    linkForegroundColor = v3->_linkForegroundColor;
    v3->_linkForegroundColor = (UIColor *)v4;

    v3->_isLinkUnderlined = 0;
    [(PKHyperlinkTextView *)v3 updateLinkTextAttributes];
    [(PKHyperlinkTextView *)v3 setAccessibilityIdentifier:*MEMORY[0x1E4F85680]];
  }
  return v3;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7 = a4;
  v8 = [(PKHyperlinkTextView *)self action];

  if (v8)
  {
    v9 = [(PKHyperlinkTextView *)self action];
    ((void (**)(void, id))v9)[2](v9, v7);
  }
  return 0;
}

- (UIColor)linkForegroundColor
{
  return self->_linkForegroundColor;
}

- (BOOL)isLinkUnderlined
{
  return self->_isLinkUnderlined;
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);

  objc_storeStrong((id *)&self->_linkForegroundColor, 0);
}

@end