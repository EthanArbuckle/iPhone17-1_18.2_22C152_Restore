@interface PKOneTimeCodeDigitFieldView
+ (id)codeEntryFont;
- (BOOL)isPrimary;
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)text;
- (PKOneTimeCodeDigitFieldView)initWithIndex:(int64_t)a3;
- (unint64_t)highligtType;
- (void)_updateLayer;
- (void)layoutSubviews;
- (void)setHighligtType:(unint64_t)a3;
- (void)setPrimary:(BOOL)a3;
- (void)setText:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKOneTimeCodeDigitFieldView

- (PKOneTimeCodeDigitFieldView)initWithIndex:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PKOneTimeCodeDigitFieldView;
  v4 = -[PKOneTimeCodeDigitFieldView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v5 = v4;
  if (v4)
  {
    -[PKOneTimeCodeDigitFieldView setLayoutMargins:](v4, "setLayoutMargins:", 8.0, 8.0, 8.0, 8.0);
    v6 = [(PKOneTimeCodeDigitFieldView *)v5 layer];
    [v6 setCornerRadius:8.0];
    [v6 setMasksToBounds:0];
    objc_msgSend(v6, "setShadowOffset:", 0.0, 1.0);
    LODWORD(v7) = 1.0;
    [v6 setShadowOpacity:v7];
    [v6 setBorderWidth:PKUIScreenScale()];
    [(PKOneTimeCodeDigitFieldView *)v5 _updateLayer];
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    label = v5->_label;
    v5->_label = v8;

    v10 = v5->_label;
    v11 = [(id)objc_opt_class() codeEntryFont];
    [(UILabel *)v10 setFont:v11];

    [(UILabel *)v5->_label setTextAlignment:1];
    [(UILabel *)v5->_label setClipsToBounds:0];
    [(PKOneTimeCodeDigitFieldView *)v5 addSubview:v5->_label];
    [(PKOneTimeCodeDigitFieldView *)v5 setAccessibilityTraits:*MEMORY[0x1E4FB2570]];
    [(PKOneTimeCodeDigitFieldView *)v5 setIsAccessibilityElement:1];
    v12 = objc_msgSend(NSString, "stringWithFormat:", @"PKOneTimeCodeDigitFieldView.%ld", a3);
    [(PKOneTimeCodeDigitFieldView *)v5 setAccessibilityLabel:v12];
  }
  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKOneTimeCodeDigitFieldView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKOneTimeCodeDigitFieldView;
  [(PKOneTimeCodeDigitFieldView *)&v3 layoutSubviews];
  [(PKOneTimeCodeDigitFieldView *)self bounds];
  -[PKOneTimeCodeDigitFieldView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  [(UILabel *)self->_label frame];
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", width, height);
  PKRectCenteredIntegralRect();
  double v9 = v8;
  double v11 = v10;
  if (!a4) {
    -[UILabel setFrame:](self->_label, "setFrame:");
  }
  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)setHighligtType:(unint64_t)a3
{
  if (self->_highligtType != a3)
  {
    self->_highligtType = a3;
    double v4 = (void *)MEMORY[0x1E4FB2590];
    if (a3 != 1) {
      double v4 = (void *)MEMORY[0x1E4FB2570];
    }
    [(PKOneTimeCodeDigitFieldView *)self setAccessibilityTraits:*v4];
    [(PKOneTimeCodeDigitFieldView *)self _updateLayer];
    [(PKOneTimeCodeDigitFieldView *)self setNeedsLayout];
  }
}

- (void)setText:(id)a3
{
  id v5 = a3;
  text = self->_text;
  double v9 = (NSString *)v5;
  double v7 = text;
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
    [(UILabel *)self->_label setText:self->_text];
    [(PKOneTimeCodeDigitFieldView *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKOneTimeCodeDigitFieldView;
  [(PKOneTimeCodeDigitFieldView *)&v10 traitCollectionDidChange:v4];
  uint64_t v5 = [(PKOneTimeCodeDigitFieldView *)self traitCollection];
  v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      double v7 = [v4 preferredContentSizeCategory];
      BOOL v8 = [v6 preferredContentSizeCategory];
      NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory(v7, v8);

      if (v9)
      {
        [(PKOneTimeCodeDigitFieldView *)self _updateLayer];
        [(PKOneTimeCodeDigitFieldView *)self setNeedsLayout];
      }
    }
  }
}

- (void)_updateLayer
{
  objc_super v3 = [(PKOneTimeCodeDigitFieldView *)self traitCollection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__PKOneTimeCodeDigitFieldView__updateLayer__block_invoke;
  v4[3] = &unk_1E59CA7D0;
  v4[4] = self;
  PKUIPerformWithEffectiveTraitCollection(v3, v4);
}

void __43__PKOneTimeCodeDigitFieldView__updateLayer__block_invoke(uint64_t a1)
{
  id v11 = [*(id *)(a1 + 32) layer];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 432);
  switch(v3)
  {
    case 2:
      uint64_t v4 = [MEMORY[0x1E4FB1618] redColor];
      goto LABEL_6;
    case 1:
      uint64_t v5 = [MEMORY[0x1E4FB1618] linkColor];
      uint64_t v6 = [MEMORY[0x1E4FB1618] colorWithRed:0.781 green:0.873 blue:0.985 alpha:1.0];
      goto LABEL_8;
    case 0:
      uint64_t v4 = [MEMORY[0x1E4FB1618] separatorColor];
LABEL_6:
      uint64_t v5 = (void *)v4;
      uint64_t v6 = [MEMORY[0x1E4FB1618] clearColor];
LABEL_8:
      double v7 = (void *)v6;
      uint64_t v2 = *(void *)(a1 + 32);
      goto LABEL_10;
  }
  double v7 = 0;
  uint64_t v5 = 0;
LABEL_10:
  if (*(unsigned char *)(v2 + 416)) {
    double v8 = 6.0;
  }
  else {
    double v8 = 0.0;
  }
  id v9 = v5;
  objc_msgSend(v11, "setBorderColor:", objc_msgSend(v9, "CGColor"));
  id v10 = v7;
  objc_msgSend(v11, "setShadowColor:", objc_msgSend(v10, "CGColor"));
  [v11 setShadowRadius:v8];
}

+ (id)codeEntryFont
{
  return PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2988], (void *)*MEMORY[0x1E4FB2788], 2, 32);
}

- (NSString)text
{
  return self->_text;
}

- (BOOL)isPrimary
{
  return self->_primary;
}

- (void)setPrimary:(BOOL)a3
{
  self->_primary = a3;
}

- (unint64_t)highligtType
{
  return self->_highligtType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end