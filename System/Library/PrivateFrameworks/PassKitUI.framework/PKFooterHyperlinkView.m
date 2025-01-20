@interface PKFooterHyperlinkView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSAttributedString)attributedText;
- (PKFooterHyperlinkView)initWithReuseIdentifier:(id)a3;
- (UIColor)linkTextColor;
- (id)action;
- (id)addFooterStyleAttributes:(id)a3;
- (id)text;
- (void)layoutSubviews;
- (void)setAction:(id)a3;
- (void)setAttributedText:(id)a3;
- (void)setLinkTextColor:(id)a3;
- (void)setText:(id)a3;
@end

@implementation PKFooterHyperlinkView

- (PKFooterHyperlinkView)initWithReuseIdentifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKFooterHyperlinkView;
  v3 = [(PKFooterHyperlinkView *)&v8 initWithReuseIdentifier:a3];
  if (v3)
  {
    v4 = objc_alloc_init(PKHyperlinkTextView);
    textView = v3->_textView;
    v3->_textView = v4;

    [(PKFooterHyperlinkView *)v3 setAccessibilityIdentifier:*MEMORY[0x1E4F855A8]];
    v6 = [(PKFooterHyperlinkView *)v3 contentView];
    [v6 addSubview:v3->_textView];
  }
  return v3;
}

- (id)action
{
  return [(PKHyperlinkTextView *)self->_textView action];
}

- (void)setAction:(id)a3
{
}

- (NSAttributedString)attributedText
{
  return (NSAttributedString *)[(PKHyperlinkTextView *)self->_textView attributedText];
}

- (void)setAttributedText:(id)a3
{
  id v4 = [(PKFooterHyperlinkView *)self addFooterStyleAttributes:a3];
  [(PKHyperlinkTextView *)self->_textView setAttributedText:v4];
}

- (UIColor)linkTextColor
{
  return [(PKHyperlinkTextView *)self->_textView linkForegroundColor];
}

- (void)setLinkTextColor:(id)a3
{
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)PKFooterHyperlinkView;
  [(PKFooterHyperlinkView *)&v22 layoutSubviews];
  v3 = [(PKFooterHyperlinkView *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  int v12 = [v3 _shouldReverseLayoutDirection];
  [v3 layoutMargins];
  double v14 = v5 + v13;
  double v15 = v7 + 0.0;
  double v17 = v9 - (v13 + v16);
  -[PKHyperlinkTextView sizeThatFits:](self->_textView, "sizeThatFits:", v17, v11);
  double v20 = v19;
  double v21 = v14 + v17 - v19;
  if (!v12) {
    double v21 = v14;
  }
  -[PKHyperlinkTextView setFrame:](self->_textView, "setFrame:", v21, v15, v20, v18);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4 = [(PKFooterHyperlinkView *)self contentView];
  [v4 layoutMargins];
  double v6 = v5;
  double v8 = v7;
  [v4 frame];
  double v10 = v9 - (v6 + v8);
  -[PKHyperlinkTextView sizeThatFits:](self->_textView, "sizeThatFits:", v10, 1.79769313e308);
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (id)addFooterStyleAttributes:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = (id)[v3 mutableCopy];
    double v5 = (void *)MEMORY[0x1E4F1CA60];
    v12[0] = *MEMORY[0x1E4FB06F8];
    double v6 = [(id)objc_opt_class() _defaultFontForTableViewStyle:1 isSectionHeader:0];
    v13[0] = v6;
    v12[1] = *MEMORY[0x1E4FB0700];
    double v7 = [(id)objc_opt_class() _defaultTextColorForTableViewStyle:1 isSectionHeader:0];
    v13[1] = v7;
    double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
    double v9 = [v5 dictionaryWithDictionary:v8];

    double v10 = objc_msgSend(v3, "attributesAtIndex:longestEffectiveRange:inRange:", 0, 0, 0, objc_msgSend(v3, "length"));
    [v9 addEntriesFromDictionary:v10];
    objc_msgSend(v4, "addAttributes:range:", v9, 0, objc_msgSend(v3, "length"));
  }
  else
  {
    id v4 = v3;
  }

  return v4;
}

- (id)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end