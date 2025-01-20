@interface PKMultiHyperlinkView
- (BOOL)_isLinkRangeValid:(_NSRange)a3;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)sources;
- (NSString)text;
- (PKMultiHyperlinkView)init;
- (PKMultiHyperlinkView)initWithFrame:(CGRect)a3;
- (UIColor)linkTextColor;
- (UIColor)textColor;
- (UIFont)textFont;
- (id)_rangesForTag:(id)a3 inText:(id)a4;
- (id)pk_childrenForAppearance;
- (int64_t)textAlignment;
- (void)_updateText;
- (void)layoutSubviews;
- (void)pk_applyAppearance:(id)a3;
- (void)setLinkTextColor:(id)a3;
- (void)setSources:(id)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
- (void)setTextFont:(id)a3;
@end

@implementation PKMultiHyperlinkView

- (void)pk_applyAppearance:(id)a3
{
  id v4 = [a3 footerHyperlinkColor];
  [(PKMultiHyperlinkView *)self setLinkTextColor:v4];
}

- (id)pk_childrenForAppearance
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (PKMultiHyperlinkView)init
{
  return -[PKMultiHyperlinkView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (PKMultiHyperlinkView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKMultiHyperlinkView;
  v3 = -[PKMultiHyperlinkView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4FB1DD8], "pkui_plainNonInteractiveTextViewWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    textView = v3->_textView;
    v3->_textView = (UITextView *)v4;

    [(UITextView *)v3->_textView setDelegate:v3];
    [(UITextView *)v3->_textView setSelectable:1];
    [(UITextView *)v3->_textView setUserInteractionEnabled:1];
    [(UITextView *)v3->_textView _setInteractiveTextSelectionDisabled:1];
    v3->_textAlignment = [(UITextView *)v3->_textView textAlignment];
    [(PKMultiHyperlinkView *)v3 addSubview:v3->_textView];
    [(PKMultiHyperlinkView *)v3 setAccessibilityIdentifier:*MEMORY[0x1E4F85680]];
  }
  return v3;
}

- (void)setText:(id)a3
{
  id v5 = a3;
  text = self->_text;
  v9 = (NSString *)v5;
  objc_super v7 = text;
  if (v7 == v9)
  {

    goto LABEL_9;
  }
  if (!v9 || !v7)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v9 isEqualToString:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_text, a3);
    [(PKMultiHyperlinkView *)self _updateText];
  }
LABEL_9:
}

- (void)setTextAlignment:(int64_t)a3
{
  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    [(PKMultiHyperlinkView *)self _updateText];
  }
}

- (void)setSources:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_sources, a3);
    [(PKMultiHyperlinkView *)self _updateText];
  }
}

- (void)setTextColor:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    [(PKMultiHyperlinkView *)self _updateText];
  }
}

- (void)setLinkTextColor:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_linkTextColor, a3);
    [(PKMultiHyperlinkView *)self _updateText];
  }
}

- (void)setTextFont:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_textFont, a3);
    [(PKMultiHyperlinkView *)self _updateText];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKMultiHyperlinkView;
  [(PKMultiHyperlinkView *)&v3 layoutSubviews];
  [(PKMultiHyperlinkView *)self bounds];
  -[PKMultiHyperlinkView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKMultiHyperlinkView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  int v9 = [(PKMultiHyperlinkView *)self _shouldReverseLayoutDirection];
  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", width, 1.79769313e308);
  double v11 = v10;
  if (!a4)
  {
    double v12 = x + width - width;
    if (!v9) {
      double v12 = x;
    }
    -[UITextView setFrame:](self->_textView, "setFrame:", v12, y, width, v10);
  }
  double v13 = width;
  double v14 = v11;
  result.height = v14;
  result.double width = v13;
  return result;
}

- (id)_rangesForTag:(id)a3 inText:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = [NSString stringWithFormat:@"[%@]", v5];
  v21 = v5;
  BOOL v8 = [NSString stringWithFormat:@"[/%@]", v5];
  unint64_t v9 = [v6 rangeOfString:v7];
  uint64_t v11 = v10;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    do
    {
      objc_msgSend(v6, "replaceCharactersInRange:withString:", v9, v11, &stru_1EF1B5B50);
      unint64_t v14 = [v6 rangeOfString:v8];
      uint64_t v11 = 0;
      uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
      if (v14 != 0x7FFFFFFFFFFFFFFFLL && v14 > v9)
      {
        uint64_t v16 = v13;
        v17 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v9, v14 - v9);
        [v12 addObject:v17];

        objc_msgSend(v6, "replaceCharactersInRange:withString:", v14, v16, &stru_1EF1B5B50);
        uint64_t v15 = [v6 rangeOfString:v7];
        uint64_t v11 = v18;
      }
      unint64_t v9 = v15;
    }
    while (v15 != 0x7FFFFFFFFFFFFFFFLL);
  }
  v19 = (void *)[v12 copy];

  return v19;
}

- (void)_updateText
{
  v78[1] = *MEMORY[0x1E4F143B8];
  double v3 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28F0], (void *)*MEMORY[0x1E4FB2798], 0x8000, 0);
  textColor = self->_textColor;
  if (textColor)
  {
    id v5 = textColor;
  }
  else
  {
    id v5 = [MEMORY[0x1E4FB1D30] _defaultTextColorForTableViewStyle:1 isSectionHeader:0];
  }
  id v6 = v5;
  objc_super v7 = (void *)[(NSString *)self->_text mutableCopy];
  BOOL v8 = [(PKMultiHyperlinkView *)self _rangesForTag:@"indent" inText:v7];
  unint64_t v9 = [(PKMultiHyperlinkView *)self _rangesForTag:@"secondary" inText:v7];
  uint64_t v10 = *MEMORY[0x1E4FB0700];
  uint64_t v77 = *MEMORY[0x1E4FB0700];
  v78[0] = v6;
  v55 = v6;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:&v77 count:1];
  v59 = v7;
  v56 = v3;
  id v12 = PKAttributedStringByParsingEmphasisInString(v7, v3, v11);
  uint64_t v13 = (void *)[v12 mutableCopy];

  id v14 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v14 setHeadIndent:15.0];
  [v14 setFirstLineHeadIndent:0.0];
  [v14 setParagraphSpacing:2.0];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v15 = v8;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v68 objects:v76 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v69;
    uint64_t v19 = *MEMORY[0x1E4FB0738];
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v69 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v21 = [*(id *)(*((void *)&v68 + 1) + 8 * i) rangeValue];
        objc_msgSend(v13, "addAttribute:value:range:", v19, v14, v21, v22);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v68 objects:v76 count:16];
    }
    while (v17);
  }
  v57 = self;

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v23 = v9;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v64 objects:v75 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v65;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v65 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v64 + 1) + 8 * j);
        v29 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        uint64_t v30 = [v28 rangeValue];
        objc_msgSend(v13, "addAttribute:value:range:", v10, v29, v30, v31);
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v64 objects:v75 count:16];
    }
    while (v25);
  }
  uint64_t v52 = v10;
  v53 = v15;
  v54 = v14;
  v51 = v23;

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v32 = v57;
  obuint64_t j = v57->_sources;
  uint64_t v33 = [(NSArray *)obj countByEnumeratingWithState:&v60 objects:v74 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v61;
    uint64_t v36 = *MEMORY[0x1E4FB0720];
    uint64_t v37 = *MEMORY[0x1E4FB0808];
    do
    {
      for (uint64_t k = 0; k != v34; ++k)
      {
        if (*(void *)v61 != v35) {
          objc_enumerationMutation(obj);
        }
        v39 = *(void **)(*((void *)&v60 + 1) + 8 * k);
        v40 = [v39 linkText];
        uint64_t v41 = [v39 linkRange];
        uint64_t v43 = v42;
        if ([v40 length])
        {
          uint64_t v41 = [v59 rangeOfString:v40];
          uint64_t v43 = v44;
        }
        if (-[PKMultiHyperlinkView _isLinkRangeValid:](v32, "_isLinkRangeValid:", v41, v43))
        {
          v45 = [MEMORY[0x1E4F1CB10] URLWithString:&stru_1EF1B5B50];
          objc_msgSend(v13, "addAttribute:value:range:", v36, v45, v41, v43);

          v32 = v57;
          objc_msgSend(v13, "addAttribute:value:range:", v37, MEMORY[0x1E4F1CC28], v41, v43);
        }
      }
      uint64_t v34 = [(NSArray *)obj countByEnumeratingWithState:&v60 objects:v74 count:16];
    }
    while (v34);
  }

  textFont = v32->_textFont;
  if (textFont) {
    objc_msgSend(v13, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], textFont, 0, objc_msgSend(v59, "length"));
  }
  [(UITextView *)v32->_textView setAttributedText:v13];
  textView = v32->_textView;
  uint64_t v72 = v52;
  linkTextColor = v32->_linkTextColor;
  v49 = linkTextColor;
  if (!linkTextColor)
  {
    v49 = [MEMORY[0x1E4FB1618] linkColor];
  }
  v73 = v49;
  v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
  [(UITextView *)textView setLinkTextAttributes:v50];

  if (!linkTextColor) {
  [(UITextView *)v57->_textView setTextAlignment:v57->_textAlignment];
  }
  [(PKMultiHyperlinkView *)v57 setNeedsLayout];
}

- (BOOL)_isLinkRangeValid:(_NSRange)a3
{
  return a3.location != 0x7FFFFFFFFFFFFFFFLL
      && a3.length != 0
      && a3.location + a3.length <= [(NSString *)self->_text length];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = self->_sources;
  uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v14 = [v13 linkText];
        NSUInteger v15 = [v13 linkRange];
        NSUInteger v17 = v16;
        if ([v14 length])
        {
          uint64_t v18 = [v24 text];
          NSUInteger v15 = [v18 rangeOfString:v14];
          NSUInteger v17 = v19;
        }
        v31.NSUInteger location = v15;
        v31.NSUInteger length = v17;
        v32.NSUInteger location = location;
        v32.NSUInteger length = length;
        if (NSIntersectionRange(v31, v32).length)
        {
          uint64_t v20 = [v13 action];
          uint64_t v21 = (void *)v20;
          if (v20) {
            (*(void (**)(uint64_t))(v20 + 16))(v20);
          }
        }
      }
      uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v10);
  }

  return 0;
}

- (NSString)text
{
  return self->_text;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIColor)linkTextColor
{
  return self->_linkTextColor;
}

- (UIFont)textFont
{
  return self->_textFont;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (NSArray)sources
{
  return self->_sources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_textFont, 0);
  objc_storeStrong((id *)&self->_linkTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end