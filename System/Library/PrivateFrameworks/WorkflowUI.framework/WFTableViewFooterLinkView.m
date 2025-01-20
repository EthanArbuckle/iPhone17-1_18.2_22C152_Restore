@interface WFTableViewFooterLinkView
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (NSString)text;
- (NSURL)URL;
- (UITextView)textView;
- (WFTableViewFooterLinkView)initWithReuseIdentifier:(id)a3;
- (WFTableViewFooterLinkViewDelegate)delegate;
- (_NSRange)linkRange;
- (void)setDelegate:(id)a3;
- (void)setText:(id)a3 URL:(id)a4;
- (void)setText:(id)a3 URL:(id)a4 linkRange:(_NSRange)a5;
- (void)tintColorDidChange;
- (void)updateLinkColor;
@end

@implementation WFTableViewFooterLinkView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (UITextView)textView
{
  return self->_textView;
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

- (NSURL)URL
{
  return self->_URL;
}

- (NSString)text
{
  return self->_text;
}

- (void)setDelegate:(id)a3
{
}

- (WFTableViewFooterLinkViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFTableViewFooterLinkViewDelegate *)WeakRetained;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7 = a4;
  v8 = [(WFTableViewFooterLinkView *)self delegate];
  char v9 = objc_opt_respondsToSelector();
  if (v9) {
    [v8 footerLinkView:self didTapURL:v7];
  }

  return (v9 & 1) == 0;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)WFTableViewFooterLinkView;
  [(WFTableViewFooterLinkView *)&v3 tintColorDidChange];
  [(WFTableViewFooterLinkView *)self updateLinkColor];
}

- (void)updateLinkColor
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = *MEMORY[0x263F81500];
  objc_super v3 = [(WFTableViewFooterLinkView *)self tintColor];
  v7[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v5 = [(WFTableViewFooterLinkView *)self textView];
  [v5 setLinkTextAttributes:v4];
}

- (void)setText:(id)a3 URL:(id)a4 linkRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v9 = a3;
  id v10 = a4;
  v11 = (NSString *)[v9 copy];
  text = self->_text;
  self->_text = v11;

  objc_storeStrong((id *)&self->_URL, a4);
  self->_linkRange.NSUInteger location = location;
  self->_linkRange.NSUInteger length = length;
  id v13 = v10;
  v14 = (objc_class *)MEMORY[0x263F089B8];
  id v22 = v9;
  v15 = (void *)[[v14 alloc] initWithString:v22];
  v16 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
  v17 = [MEMORY[0x263F825C8] colorWithRed:0.42745098 green:0.42745098 blue:0.447058824 alpha:1.0];
  uint64_t v18 = [v22 length];

  objc_msgSend(v15, "addAttribute:value:range:", *MEMORY[0x263F814F0], v16, 0, v18);
  objc_msgSend(v15, "addAttribute:value:range:", *MEMORY[0x263F81500], v17, 0, v18);
  uint64_t v19 = *MEMORY[0x263F81520];
  if (v13)
  {
    objc_msgSend(v15, "addAttribute:value:range:", *MEMORY[0x263F81520], v13, location, length);
  }
  else
  {
    v20 = [NSURL URLWithString:&stru_26E1A5FC0];
    objc_msgSend(v15, "addAttribute:value:range:", v19, v20, location, length);
  }
  objc_msgSend(v15, "addAttribute:value:range:", *MEMORY[0x263F815F8], MEMORY[0x263EFFA80], location, length);

  v21 = [(WFTableViewFooterLinkView *)self textView];
  [v21 setAttributedText:v15];
}

- (void)setText:(id)a3 URL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[WFTableViewFooterLinkView setText:URL:linkRange:](self, "setText:URL:linkRange:", v7, v6, 0, [v7 length]);
}

- (WFTableViewFooterLinkView)initWithReuseIdentifier:(id)a3
{
  v29[4] = *MEMORY[0x263EF8340];
  v28.receiver = self;
  v28.super_class = (Class)WFTableViewFooterLinkView;
  objc_super v3 = [(WFTableViewFooterLinkView *)&v28 initWithReuseIdentifier:a3];
  if (v3)
  {
    v4 = (UITextView *)objc_alloc_init(MEMORY[0x263F82D60]);
    [(UITextView *)v4 setAdjustsFontForContentSizeCategory:1];
    [(UITextView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = [MEMORY[0x263F825C8] clearColor];
    [(UITextView *)v4 setBackgroundColor:v5];

    [(UITextView *)v4 setShowsVerticalScrollIndicator:0];
    [(UITextView *)v4 setEditable:0];
    [(UITextView *)v4 setSelectable:1];
    [(UITextView *)v4 setScrollEnabled:0];
    id v6 = [(UITextView *)v4 textContainer];
    [v6 setLineFragmentPadding:0.0];

    [(UITextView *)v4 setDelegate:v3];
    textView = v3->_textView;
    v3->_textView = v4;
    v8 = v4;

    [(WFTableViewFooterLinkView *)v3 updateLinkColor];
    id v9 = [(WFTableViewFooterLinkView *)v3 contentView];
    [v9 addSubview:v8];
    v20 = (void *)MEMORY[0x263F08938];
    v27 = [(UITextView *)v8 topAnchor];
    v26 = [v9 topAnchor];
    v25 = [v27 constraintEqualToAnchor:v26 constant:0.0];
    v29[0] = v25;
    v23 = [(UITextView *)v8 leadingAnchor];
    v24 = [v9 layoutMarginsGuide];
    id v22 = [v24 leadingAnchor];
    v21 = [v23 constraintEqualToAnchor:v22 constant:0.0];
    v29[1] = v21;
    uint64_t v19 = [(UITextView *)v8 trailingAnchor];
    id v10 = [v9 layoutMarginsGuide];
    v11 = [v10 trailingAnchor];
    v12 = [v19 constraintEqualToAnchor:v11 constant:0.0];
    v29[2] = v12;
    id v13 = [(UITextView *)v8 bottomAnchor];
    v14 = [v9 bottomAnchor];
    v15 = [v13 constraintEqualToAnchor:v14 constant:0.0];
    v29[3] = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:4];
    [v20 activateConstraints:v16];

    v17 = v3;
  }

  return v3;
}

@end