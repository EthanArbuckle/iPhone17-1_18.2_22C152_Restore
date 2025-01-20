@interface PKDiscoveryTextBlockShelfView
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKDiscoveryTextBlockShelfView)initWithShelf:(id)a3;
- (id)_attributedStringForBody:(id)a3 lede:(id)a4 headerline:(id)a5;
- (id)_textColorForBody;
- (id)_textColorForHeaderline;
- (id)_textColorForLede;
- (id)_uiFontTextStyle;
- (void)layoutSubviews;
@end

@implementation PKDiscoveryTextBlockShelfView

- (PKDiscoveryTextBlockShelfView)initWithShelf:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKDiscoveryTextBlockShelfView;
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v10 = -[PKDiscoveryShelfView initWithFrame:](&v25, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v7, v8, v9);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_shelf, a3);
    v12 = [v5 localizedBody];
    v13 = [v5 localizedLede];
    v14 = [v5 localizedSectionHeaderLine];
    v15 = -[PKNoHighlightTextView initWithFrame:]([PKNoHighlightTextView alloc], "initWithFrame:", v6, v7, v8, v9);
    textView = v11->_textView;
    v11->_textView = &v15->super;

    -[UITextView setTextContainerInset:](v11->_textView, "setTextContainerInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    v17 = v11->_textView;
    v18 = [MEMORY[0x1E4FB1618] clearColor];
    [(UITextView *)v17 setBackgroundColor:v18];

    v19 = v11->_textView;
    v20 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UITextView *)v19 setTextColor:v20];

    v21 = [(UITextView *)v11->_textView textContainer];
    [v21 setLineFragmentPadding:0.0];

    [(UITextView *)v11->_textView setEditable:0];
    [(UITextView *)v11->_textView setScrollEnabled:0];
    [(UITextView *)v11->_textView setDelegate:v11];
    uint64_t v22 = [(PKDiscoveryTextBlockShelfView *)v11 _attributedStringForBody:v12 lede:v13 headerline:v14];
    attributedText = v11->_attributedText;
    v11->_attributedText = (NSAttributedString *)v22;

    [(UITextView *)v11->_textView setAttributedText:v11->_attributedText];
    [(PKDiscoveryTextBlockShelfView *)v11 addSubview:v11->_textView];
  }
  return v11;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  return 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PKDiscoveryShelfView *)self contentInsets];
  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", width - (v6 + v7), height);
  double v9 = width;
  result.double height = v8;
  result.double width = v9;
  return result;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)PKDiscoveryTextBlockShelfView;
  [(PKDiscoveryTextBlockShelfView *)&v15 layoutSubviews];
  [(PKDiscoveryTextBlockShelfView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(PKDiscoveryShelfView *)self contentInsets];
  -[UITextView setFrame:](self->_textView, "setFrame:", v4 + v14, v6 + v11, v8 - (v14 + v12), v10 - (v11 + v13));
}

- (id)_attributedStringForBody:(id)a3 lede:(id)a4 headerline:(id)a5
{
  v39[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = (uint64_t *)MEMORY[0x1E4FB0700];
  if (v8)
  {
    v38[0] = *MEMORY[0x1E4FB06F8];
    double v12 = [(PKDiscoveryTextBlockShelfView *)self _uiFontTextStyle];
    double v13 = PKFontForDefaultDesign(v12, 0);
    double v14 = v11;
    v38[1] = *v11;
    v39[0] = v13;
    objc_super v15 = [(PKDiscoveryTextBlockShelfView *)self _textColorForBody];
    v39[1] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];

    v17 = PKAttributedStringByParsingLinksInString();
    v18 = (void *)[v17 mutableCopy];
  }
  else
  {
    double v14 = (uint64_t *)MEMORY[0x1E4FB0700];
    v18 = 0;
  }
  if (v9)
  {
    v19 = [(PKDiscoveryTextBlockShelfView *)self _uiFontTextStyle];
    v20 = PKFontForDefaultDesign(v19, 0, 2, 0);

    uint64_t v21 = *v14;
    v36[0] = *MEMORY[0x1E4FB06F8];
    v36[1] = v21;
    v37[0] = v20;
    uint64_t v22 = [(PKDiscoveryTextBlockShelfView *)self _textColorForLede];
    v37[1] = v22;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];

    v24 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v9 attributes:v23];
    if (v18) {
      [v18 insertAttributedString:v24 atIndex:0];
    }
    else {
      v18 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v24];
    }
  }
  if (v10)
  {
    objc_super v25 = [(PKDiscoveryTextBlockShelfView *)self _uiFontTextStyle];
    v26 = PKFontForDefaultDesign(v25, 0, 2, 0);

    uint64_t v27 = *v14;
    v34[0] = *MEMORY[0x1E4FB06F8];
    v34[1] = v27;
    v35[0] = v26;
    v28 = [(PKDiscoveryTextBlockShelfView *)self _textColorForHeaderline];
    v35[1] = v28;
    v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];

    if (v18)
    {
      id v30 = objc_alloc(MEMORY[0x1E4F28B18]);
      v31 = [NSString stringWithFormat:@"%@\n", v10];
      v32 = (void *)[v30 initWithString:v31 attributes:v29];

      [v18 insertAttributedString:v32 atIndex:0];
    }
    else
    {
      v18 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v10 attributes:v29];
    }
  }

  return v18;
}

- (id)_textColorForBody
{
  if ((unint64_t)[(PKDiscoveryTextBlockShelf *)self->_shelf style] > 1)
  {
    v2 = 0;
  }
  else
  {
    v2 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }

  return v2;
}

- (id)_textColorForLede
{
  uint64_t v2 = [(PKDiscoveryTextBlockShelf *)self->_shelf style];
  if (v2 == 1)
  {
    double v3 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  else if (v2)
  {
    double v3 = 0;
  }
  else
  {
    double v3 = [MEMORY[0x1E4FB1618] labelColor];
  }

  return v3;
}

- (id)_textColorForHeaderline
{
  uint64_t v2 = [(PKDiscoveryTextBlockShelf *)self->_shelf style];
  if (v2 == 1)
  {
    double v3 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  else if (v2)
  {
    double v3 = 0;
  }
  else
  {
    double v3 = [MEMORY[0x1E4FB1618] labelColor];
  }

  return v3;
}

- (id)_uiFontTextStyle
{
  id v3 = (id)*MEMORY[0x1E4FB2998];
  if ([(PKDiscoveryTextBlockShelf *)self->_shelf style] == 1)
  {
    id v4 = (id)*MEMORY[0x1E4FB28E0];

    id v3 = v4;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_shelf, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end