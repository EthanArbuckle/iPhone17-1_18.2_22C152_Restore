@interface PKIconTextLabel
- (BOOL)hasContent;
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSAttributedString)text;
- (PKIconTextLabel)init;
- (PKIconTextLabel)initWithAttributedText:(id)a3 icon:(id)a4;
- (PKIconTextLabel)initWithText:(id)a3 icon:(id)a4;
- (UIColor)textColor;
- (UIFont)textFont;
- (UIImage)icon;
- (id)initFrame:(CGRect)a3;
- (unint64_t)iconAlignment;
- (void)_updateView;
- (void)layoutSubviews;
- (void)setIcon:(id)a3;
- (void)setIconAlignment:(unint64_t)a3;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTextFont:(id)a3;
@end

@implementation PKIconTextLabel

- (PKIconTextLabel)init
{
  return -[PKIconTextLabel initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (id)initFrame:(CGRect)a3
{
  return -[PKIconTextLabel initWithText:icon:](self, "initWithText:icon:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKIconTextLabel)initWithText:(id)a3 icon:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    v7 = (objc_class *)MEMORY[0x1E4F28B18];
    id v8 = a4;
    v9 = (void *)[[v7 alloc] initWithString:v6];
    v10 = [(PKIconTextLabel *)self initWithAttributedText:v9 icon:v8];

    v11 = v10;
  }
  else
  {
    id v12 = a4;
    v13 = [(PKIconTextLabel *)self initWithAttributedText:0 icon:v12];

    v11 = v13;
  }

  return v11;
}

- (PKIconTextLabel)initWithAttributedText:(id)a3 icon:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKIconTextLabel;
  id v8 = -[PKIconTextLabel initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v9 = v8;
  if (v8)
  {
    [(PKIconTextLabel *)v8 setText:v6];
    [(PKIconTextLabel *)v9 setIcon:v7];
  }

  return v9;
}

- (void)setText:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_text, a3);
    [(PKIconTextLabel *)self _updateView];
  }
}

- (void)setTextColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_textColor != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_textColor, a3);
    [(PKIconTextLabel *)self _updateView];
    id v5 = v6;
  }
}

- (void)setTextFont:(id)a3
{
  id v5 = (UIFont *)a3;
  if (self->_textFont != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_textFont, a3);
    [(PKIconTextLabel *)self _updateView];
    id v5 = v6;
  }
}

- (void)setIcon:(id)a3
{
  id v5 = (UIImage *)a3;
  if (self->_icon != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_icon, a3);
    [(PKIconTextLabel *)self _updateView];
    id v5 = v6;
  }
}

- (void)setIconAlignment:(unint64_t)a3
{
  if (self->_iconAlignment != a3)
  {
    self->_iconAlignment = a3;
    [(PKIconTextLabel *)self setNeedsLayout];
  }
}

- (BOOL)hasContent
{
  return [(NSAttributedString *)self->_text length] || self->_icon != 0;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKIconTextLabel;
  [(PKIconTextLabel *)&v3 layoutSubviews];
  [(PKIconTextLabel *)self bounds];
  -[PKIconTextLabel _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKIconTextLabel _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if ([(PKIconTextLabel *)self _shouldReverseLayoutDirection]) {
    int v10 = 2;
  }
  else {
    int v10 = 0;
  }
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x4010000000;
  v54[3] = "";
  long long v55 = 0u;
  long long v56 = 0u;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x4010000000;
  v53[3] = "";
  *(CGFloat *)&v53[4] = x;
  *(CGFloat *)&v53[5] = y;
  *(double *)&v53[6] = width;
  *(double *)&v53[7] = height;
  -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", width, height);
  double v12 = v11;
  double v14 = v13;
  -[UIImageView sizeThatFits:](self->_iconView, "sizeThatFits:", width, height);
  double v16 = v15;
  double v18 = v17;
  double v19 = fmax(v14, v17);
  uint64_t v49 = 0;
  v50 = (double *)&v49;
  uint64_t v51 = 0x2020000000;
  double v52 = v12 + v15;
  uint64_t v43 = 0;
  v44 = (double *)&v43;
  uint64_t v45 = 0x4010000000;
  v46 = "";
  long long v20 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v47 = *MEMORY[0x1E4F1DB28];
  long long v48 = v20;
  uint64_t v37 = 0;
  v38 = (double *)&v37;
  uint64_t v39 = 0x4010000000;
  v40 = "";
  long long v41 = v47;
  long long v42 = v20;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__PKIconTextLabel__layoutWithBounds_isTemplateLayout___block_invoke;
  aBlock[3] = &unk_1E59D8018;
  *(double *)&aBlock[6] = v12;
  *(double *)&aBlock[7] = v14;
  aBlock[4] = v53;
  aBlock[5] = &v43;
  *(double *)&aBlock[8] = v19;
  int v35 = v10;
  int v36 = v10;
  v21 = (void (**)(void))_Block_copy(aBlock);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __54__PKIconTextLabel__layoutWithBounds_isTemplateLayout___block_invoke_2;
  v31[3] = &unk_1E59D8040;
  *(double *)&v31[6] = v16;
  *(double *)&v31[7] = v18;
  v31[4] = v53;
  v31[5] = &v37;
  int v32 = v10;
  int v33 = v10;
  v22 = (void (**)(void))_Block_copy(v31);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __54__PKIconTextLabel__layoutWithBounds_isTemplateLayout___block_invoke_3;
  v29[3] = &unk_1E59D8068;
  *(double *)&v29[7] = v16;
  *(double *)&v29[8] = v18;
  *(double *)&v29[9] = v12;
  *(double *)&v29[10] = v14;
  v29[4] = v53;
  v29[5] = v54;
  int v30 = v10;
  v29[6] = &v49;
  v23 = (void (**)(void))_Block_copy(v29);
  unint64_t iconAlignment = self->_iconAlignment;
  if (iconAlignment)
  {
    if (iconAlignment != 1) {
      goto LABEL_9;
    }
    v21[2](v21);
    v23[2](v23);
    v25 = v22;
  }
  else
  {
    v22[2](v22);
    v23[2](v23);
    v25 = v21;
  }
  ((void (*)(void))v25[2])();
LABEL_9:
  if (!a4)
  {
    -[UILabel setFrame:](self->_textLabel, "setFrame:", v44[4], v44[5], v44[6], v44[7]);
    -[UIImageView setFrame:](self->_iconView, "setFrame:", v38[4], v38[5], v38[6], v38[7]);
  }
  double v26 = v50[3];

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(v53, 8);
  _Block_object_dispose(v54, 8);
  double v27 = v26;
  double v28 = v19;
  result.double height = v28;
  result.double width = v27;
  return result;
}

uint64_t __54__PKIconTextLabel__layoutWithBounds_isTemplateLayout___block_invoke(uint64_t result)
{
  double v1 = *(double *)(result + 48);
  if (v1 > 0.0)
  {
    uint64_t v2 = result;
    double v3 = *(CGRect **)(*(void *)(result + 32) + 8);
    v9.origin.CGFloat x = v3[1].origin.x;
    v9.origin.CGFloat y = v3[1].origin.y;
    ++v3;
    v9.size.double width = v3->size.width;
    v9.size.double height = v3->size.height;
    CGRectDivide(v9, (CGRect *)(*(void *)(*(void *)(result + 40) + 8) + 32), v3, v1, *(CGRectEdge *)(result + 72));
    PKContentAlignmentMake();
    CGSize result = PKSizeAlignedInRect();
    double v4 = *(void **)(*(void *)(v2 + 40) + 8);
    v4[4] = v5;
    v4[5] = v6;
    v4[6] = v7;
    v4[7] = v8;
  }
  return result;
}

uint64_t __54__PKIconTextLabel__layoutWithBounds_isTemplateLayout___block_invoke_2(uint64_t result)
{
  double v1 = *(double *)(result + 48);
  if (v1 > 0.0)
  {
    uint64_t v2 = result;
    double v3 = *(CGRect **)(*(void *)(result + 32) + 8);
    v9.origin.CGFloat x = v3[1].origin.x;
    v9.origin.CGFloat y = v3[1].origin.y;
    ++v3;
    v9.size.double width = v3->size.width;
    v9.size.double height = v3->size.height;
    CGRectDivide(v9, (CGRect *)(*(void *)(*(void *)(result + 40) + 8) + 32), v3, v1, *(CGRectEdge *)(result + 64));
    PKContentAlignmentMake();
    CGSize result = PKSizeAlignedInRect();
    double v4 = *(void **)(*(void *)(v2 + 40) + 8);
    v4[4] = v5;
    v4[5] = v6;
    v4[6] = v7;
    v4[7] = v8;
  }
  return result;
}

void __54__PKIconTextLabel__layoutWithBounds_isTemplateLayout___block_invoke_3(uint64_t a1)
{
  if (*(double *)(a1 + 56) > 0.0 && *(double *)(a1 + 72) > 0.0)
  {
    uint64_t v2 = *(CGRect **)(*(void *)(a1 + 32) + 8);
    v3.origin.CGFloat x = v2[1].origin.x;
    v3.origin.CGFloat y = v2[1].origin.y;
    ++v2;
    v3.size.double width = v2->size.width;
    v3.size.double height = v2->size.height;
    CGRectDivide(v3, (CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), v2, 5.0, *(CGRectEdge *)(a1 + 88));
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24)
                                                                + 5.0;
  }
}

- (void)_updateView
{
  text = self->_text;
  textLabel = self->_textLabel;
  if (text)
  {
    if (!textLabel)
    {
      uint64_t v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      uint64_t v6 = self->_textLabel;
      self->_textLabel = v5;

      [(UILabel *)self->_textLabel setNumberOfLines:0];
      [(PKIconTextLabel *)self addSubview:self->_textLabel];
      textLabel = self->_textLabel;
    }
    [(UILabel *)textLabel setFont:self->_textFont];
    [(UILabel *)self->_textLabel setTextColor:self->_textColor];
    [(UILabel *)self->_textLabel setAttributedText:self->_text];
  }
  else
  {
    [(UILabel *)textLabel removeFromSuperview];
    uint64_t v7 = self->_textLabel;
    self->_textLabel = 0;
  }
  icon = self->_icon;
  iconView = self->_iconView;
  if (icon)
  {
    if (!iconView)
    {
      int v10 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      double v11 = self->_iconView;
      self->_iconView = v10;

      [(PKIconTextLabel *)self addSubview:self->_iconView];
      iconView = self->_iconView;
      icon = self->_icon;
    }
    [(UIImageView *)iconView setImage:icon];
  }
  else
  {
    [(UIImageView *)iconView removeFromSuperview];
    double v12 = self->_iconView;
    self->_iconView = 0;
  }

  [(PKIconTextLabel *)self setNeedsLayout];
}

- (NSAttributedString)text
{
  return self->_text;
}

- (UIFont)textFont
{
  return self->_textFont;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (unint64_t)iconAlignment
{
  return self->_iconAlignment;
}

- (UIImage)icon
{
  return self->_icon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_textFont, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_iconView, 0);

  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end