@interface WFHyperlinkFooterView
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)text;
- (NSURL)URL;
- (SEL)action;
- (UIEdgeInsets)textInsets;
- (WFHyperlinkFooterView)init;
- (_NSRange)linkRange;
- (double)preferredHeightForWidth:(double)a3;
- (id)target;
- (void)_linkify;
- (void)layoutSubviews;
- (void)setAction:(SEL)a3;
- (void)setLinkRange:(_NSRange)a3;
- (void)setTarget:(id)a3;
- (void)setText:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation WFHyperlinkFooterView

- (WFHyperlinkFooterView)init
{
  v2 = -[WFHyperlinkFooterView initWithFrame:](self, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v2)
  {
    v3 = (UITextView *)objc_alloc_init(MEMORY[0x263F1CAC8]);
    textView = v2->_textView;
    v2->_textView = v3;

    v5 = [MEMORY[0x263F1C550] clearColor];
    [(UITextView *)v2->_textView setBackgroundColor:v5];

    [(UITextView *)v2->_textView setShowsVerticalScrollIndicator:0];
    [(UITextView *)v2->_textView setEditable:0];
    [(UITextView *)v2->_textView setSelectable:1];
    [(UITextView *)v2->_textView setScrollEnabled:0];
    [(UITextView *)v2->_textView _setInteractiveTextSelectionDisabled:1];
    [(WFHyperlinkFooterView *)v2 addSubview:v2->_textView];
  }
  return v2;
}

- (void)_linkify
{
  NSUInteger v3 = [(NSString *)self->_text length];
  id v13 = (id)[objc_alloc(MEMORY[0x263F089B8]) initWithString:self->_text];
  uint64_t v4 = *MEMORY[0x263F814F0];
  v5 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
  objc_msgSend(v13, "addAttribute:value:range:", v4, v5, 0, v3);

  uint64_t v6 = *MEMORY[0x263F81500];
  v7 = [MEMORY[0x263F1C550] systemGrayColor];
  objc_msgSend(v13, "addAttribute:value:range:", v6, v7, 0, v3);

  v8 = [MEMORY[0x263F1C550] defaultHyperLinkColor];
  p_linkRange = &self->_linkRange;
  objc_msgSend(v13, "addAttribute:value:range:", v6, v8, self->_linkRange.location, self->_linkRange.length);

  uint64_t v10 = *MEMORY[0x263F81520];
  URL = self->_URL;
  v12 = URL;
  if (!URL)
  {
    v12 = [NSURL URLWithString:&stru_26D9BFD58];
  }
  objc_msgSend(v13, "addAttribute:value:range:", v10, v12, p_linkRange->location, self->_linkRange.length);
  if (!URL) {

  }
  objc_msgSend(v13, "addAttribute:value:range:", *MEMORY[0x263F815F8], MEMORY[0x263EFFA80], p_linkRange->location, self->_linkRange.length);
  [(UITextView *)self->_textView setAttributedText:v13];
  [(UITextView *)self->_textView setDelegate:self];
}

- (UIEdgeInsets)textInsets
{
  double v2 = 0.0;
  double v3 = 12.0;
  double v4 = 0.0;
  double v5 = 12.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)WFHyperlinkFooterView;
  [(WFHyperlinkFooterView *)&v16 layoutSubviews];
  [(WFHyperlinkFooterView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  [(WFHyperlinkFooterView *)self textInsets];
  double v10 = v4 + v9;
  double v12 = v6 + v11;
  double v14 = v8 - (v9 + v13);
  [(UITextView *)self->_textView frame];
  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", v14, 1.79769313e308);
  -[UITextView setFrame:](self->_textView, "setFrame:", v10, v12, v14, v15);
}

- (void)setText:(id)a3
{
  double v5 = (NSString *)a3;
  p_text = &self->_text;
  if (self->_text != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_text, a3);
    [(UITextView *)self->_textView setText:v7];
    if (self->_linkRange.length) {
      [(WFHyperlinkFooterView *)self _linkify];
    }
    p_text = (NSString **)[(WFHyperlinkFooterView *)self setNeedsLayout];
  }
  MEMORY[0x270F9A790](p_text);
}

- (NSString)text
{
  return self->_text;
}

- (void)setLinkRange:(_NSRange)a3
{
  self->_linkRange = a3;
  if (self->_text) {
    [(WFHyperlinkFooterView *)self _linkify];
  }
}

- (_NSRange)linkRange
{
  p_linkRange = &self->_linkRange;
  NSUInteger location = self->_linkRange.location;
  NSUInteger length = p_linkRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setURL:(id)a3
{
  double v5 = (NSURL *)a3;
  p_URL = &self->_URL;
  if (self->_URL != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_URL, a3);
    [(WFHyperlinkFooterView *)self setNeedsLayout];
    p_URL = (NSURL **)[(WFHyperlinkFooterView *)self _linkify];
    double v5 = v7;
  }
  MEMORY[0x270F9A758](p_URL, v5);
}

- (NSURL)URL
{
  return self->_URL;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  double v5 = [(WFHyperlinkFooterView *)self text];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    [(WFHyperlinkFooterView *)self textInsets];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v15 = width - (v9 + v13);
    -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", v15, 1.79769313e308);
    double v16 = v14 + v10 + v15;
    double v18 = v12 + v8 + v17;
  }
  else
  {
    double v16 = *MEMORY[0x263F001B0];
    double v18 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  result.height = v18;
  result.double width = v16;
  return result;
}

- (double)preferredHeightForWidth:(double)a3
{
  -[WFHyperlinkFooterView sizeThatFits:](self, "sizeThatFits:", a3, 1.79769313e308);
  return v3;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  double v7 = [(WFHyperlinkFooterView *)self target];
  if (v7)
  {
    double v8 = [(WFHyperlinkFooterView *)self action];
    double v9 = self;
    id v10 = v7;
    double v11 = (void (*)(id, const char *, WFHyperlinkFooterView *))[v10 methodForSelector:v8];
    double v12 = [v10 methodSignatureForSelector:v8];
    uint64_t v13 = [v12 methodReturnLength];

    if (v9) {
      v11(v10, v8, v9);
    }
    else {
    double v14 = ((void (*)(id, const char *))v11)(v10, v8);
    }

    if (v13) {
      double v15 = v14;
    }
    else {
      double v15 = 0;
    }
    id v16 = v15;
  }
  return v7 == 0;
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (SEL)action
{
  if (self->_action) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (void)setAction:(SEL)a3
{
  if (a3) {
    double v3 = a3;
  }
  else {
    double v3 = 0;
  }
  self->_action = v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end