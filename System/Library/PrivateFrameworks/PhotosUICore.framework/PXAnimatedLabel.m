@interface PXAnimatedLabel
- (CGSize)intrinsicContentSize;
- (NSLayoutConstraint)counterWidthConstraint;
- (NSString)text;
- (PXAnimatedCounter)counter;
- (PXAnimatedLabel)initWithCoder:(id)a3;
- (PXAnimatedLabel)initWithFrame:(CGRect)a3;
- (UIFont)font;
- (UILabel)label;
- (void)_updateConstraintsForText;
- (void)commonInit;
- (void)layoutSubviews;
- (void)setCounter:(id)a3;
- (void)setFont:(id)a3;
- (void)setLabel:(id)a3;
- (void)setText:(id)a3;
- (void)setText:(id)a3 withAnimationStyle:(int64_t)a4 completionBlock:(id)a5;
@end

@implementation PXAnimatedLabel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_counterWidthConstraint, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_counter, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_font, 0);
}

- (NSLayoutConstraint)counterWidthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 440, 1);
}

- (void)setLabel:(id)a3
{
}

- (UILabel)label
{
  return (UILabel *)objc_getProperty(self, a2, 432, 1);
}

- (void)setCounter:(id)a3
{
}

- (PXAnimatedCounter)counter
{
  return (PXAnimatedCounter *)objc_getProperty(self, a2, 424, 1);
}

- (NSString)text
{
  return self->_text;
}

- (UIFont)font
{
  return self->_font;
}

- (void)_updateConstraintsForText
{
  id v7 = [(PXAnimatedLabel *)self counter];
  v3 = [(PXAnimatedLabel *)self text];
  if ([v3 rangeOfDigits] || !objc_msgSend(v3, "containsDigits"))
  {
    [v7 setHidden:1];
    double v5 = 0.0;
  }
  else
  {
    [v7 setHidden:0];
    objc_msgSend(v7, "requiredSizeForNumber:", objc_msgSend(v3, "digits"));
    *(float *)&double v4 = v4;
    double v5 = ceilf(*(float *)&v4);
  }
  v6 = [(PXAnimatedLabel *)self counterWidthConstraint];
  [v6 setConstant:v5];
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
  id v5 = a3;
  v6 = [(PXAnimatedLabel *)self label];
  [v6 setFont:v5];

  id v7 = [(PXAnimatedLabel *)self counter];
  [v7 setFont:v5];
}

- (void)setText:(id)a3 withAnimationStyle:(int64_t)a4 completionBlock:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  [(PXAnimatedLabel *)self layoutIfNeeded];
  v11 = [(PXAnimatedLabel *)self text];
  objc_storeStrong((id *)&self->_text, a3);
  v50 = [(PXAnimatedLabel *)self label];
  v12 = [(PXAnimatedLabel *)self counter];
  double v13 = *MEMORY[0x1E4F1DB30];
  double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  int v15 = [v9 containsDigits];
  uint64_t v16 = [v9 digits];
  double v17 = v14;
  double v18 = v13;
  if ([v11 containsDigits])
  {
    objc_msgSend(v12, "requiredSizeForNumber:", objc_msgSend(v12, "number"));
    double v18 = v19;
    double v17 = v20;
  }
  if (v15)
  {
    [v12 requiredSizeForNumber:v16];
    double v13 = v21;
    double v14 = v22;
  }
  uint64_t v23 = [v11 stringByRemovingDigits];
  uint64_t v24 = [v9 stringByRemovingDigits];
  v46 = v12;
  uint64_t v47 = v16;
  int64_t v44 = a4;
  int v45 = v15;
  v48 = v9;
  if ([v9 rangeOfDigits])
  {
    int v43 = 0;
    v25 = v11;
  }
  else
  {
    int v26 = [v9 containsDigits];
    int v43 = v26;
    if (v26) {
      v25 = (void *)v23;
    }
    else {
      v25 = v11;
    }
    if (v26) {
      id v9 = (id)v24;
    }
  }
  id v27 = v25;
  id v28 = v9;
  int v29 = [v28 isEqualToString:v27];
  int v30 = v29;
  BOOL v31 = v18 == v13 && v17 == v14;
  v49 = (void *)v24;
  if (!v31)
  {
    v32 = (void *)v23;
    v33 = v11;
    v34 = (void (**)(void, void))v10;
    v35 = v27;
    int v36 = [v28 isEqualToString:v27];
    if (!v30) {
      goto LABEL_20;
    }
LABEL_19:
    v37 = [v50 text];
    char v38 = [v37 isEqualToString:v28];

    if (v38) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  v35 = v27;
  v32 = (void *)v23;
  v33 = v11;
  v34 = (void (**)(void, void))v10;
  int v36 = 0;
  if (v29) {
    goto LABEL_19;
  }
LABEL_20:
  [v50 setText:v28];
LABEL_21:
  if (v36)
  {
    v39 = v46;
    if ([v46 preferredAnimationStyleForNumber:v47] == 1)
    {
      [(PXAnimatedLabel *)self _updateConstraintsForText];
      [(PXAnimatedLabel *)self layoutIfNeeded];
      v40 = v34;
      v41 = v33;
      if (v45)
      {
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __62__PXAnimatedLabel_setText_withAnimationStyle_completionBlock___block_invoke;
        v53[3] = &unk_1E5DCD158;
        v53[4] = self;
        v54 = v40;
        [v46 setNumber:v47 animated:v44 != 0 completionBlock:v53];
        v42 = v54;
LABEL_30:
      }
    }
    else
    {
      v40 = v34;
      v41 = v33;
      if (v45)
      {
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __62__PXAnimatedLabel_setText_withAnimationStyle_completionBlock___block_invoke_2;
        v51[3] = &unk_1E5DCD158;
        v51[4] = self;
        v52 = v40;
        [v46 setNumber:v47 animated:v44 != 0 completionBlock:v51];
        v42 = v52;
        goto LABEL_30;
      }
    }
  }
  else
  {
    v40 = v34;
    v41 = v33;
    v39 = v46;
    if ((v45 & v43) == 1)
    {
      [v46 setNumber:v47 animated:v44 != 0];
      [(PXAnimatedLabel *)self invalidateIntrinsicContentSize];
      if (v40) {
        v40[2](v40, 1);
      }
    }
  }
}

uint64_t __62__PXAnimatedLabel_setText_withAnimationStyle_completionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidateIntrinsicContentSize];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __62__PXAnimatedLabel_setText_withAnimationStyle_completionBlock___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateConstraintsForText];
  [*(id *)(a1 + 32) layoutIfNeeded];
  [*(id *)(a1 + 32) invalidateIntrinsicContentSize];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)setText:(id)a3
{
  [(PXAnimatedLabel *)self setText:a3 withAnimationStyle:0 completionBlock:0];
  [(PXAnimatedLabel *)self _updateConstraintsForText];
  [(PXAnimatedLabel *)self invalidateIntrinsicContentSize];
}

- (CGSize)intrinsicContentSize
{
  v3 = [(PXAnimatedLabel *)self label];
  [v3 intrinsicContentSize];
  double v5 = v4;
  double v7 = v6;

  v8 = [(PXAnimatedLabel *)self counterWidthConstraint];
  [v8 constant];
  double v10 = v5 + v9;

  double v11 = v10;
  double v12 = v7;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXAnimatedLabel;
  [(PXAnimatedLabel *)&v3 layoutSubviews];
  [(PXAnimatedLabel *)self _updateConstraintsForText];
}

- (PXAnimatedLabel)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXAnimatedLabel;
  objc_super v3 = [(PXAnimatedLabel *)&v6 initWithCoder:a3];
  double v4 = v3;
  if (v3) {
    [(PXAnimatedLabel *)v3 commonInit];
  }
  return v4;
}

- (PXAnimatedLabel)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXAnimatedLabel;
  objc_super v3 = -[PXAnimatedLabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3) {
    [(PXAnimatedLabel *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  v48[11] = *MEMORY[0x1E4F143B8];
  objc_super v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(UILabel *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v4 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  [(UILabel *)v3 setText:v4];

  double v5 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)v3 setTextColor:v5];

  label = self->_label;
  self->_label = v3;
  double v7 = v3;

  v8 = [[PXAnimatedCounter alloc] initWithNumber:0];
  [(PXAnimatedCounter *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PXAnimatedCounter *)v8 setHidden:1];
  counter = self->_counter;
  self->_counter = v8;
  double v10 = v8;

  id v11 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v11 addSubview:v10];
  [v11 addSubview:v7];
  [(PXAnimatedLabel *)self addSubview:v11];
  double v12 = [(PXAnimatedCounter *)v10 widthAnchor];
  double v13 = [v12 constraintEqualToConstant:0.0];
  counterWidthConstraint = self->_counterWidthConstraint;
  self->_counterWidthConstraint = v13;

  v33 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v47 = [(PXAnimatedCounter *)v10 topAnchor];
  v46 = [v11 topAnchor];
  int v45 = [v47 constraintEqualToAnchor:v46];
  v48[0] = v45;
  int64_t v44 = [(PXAnimatedCounter *)v10 bottomAnchor];
  int v43 = [v11 bottomAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v48[1] = v42;
  v41 = [(PXAnimatedCounter *)v10 leadingAnchor];
  v40 = [v11 leadingAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v48[2] = v39;
  char v38 = [(PXAnimatedCounter *)v10 trailingAnchor];
  v37 = [(UILabel *)v7 leadingAnchor];
  int v36 = [v38 constraintEqualToAnchor:v37];
  v48[3] = v36;
  v35 = [(UILabel *)v7 trailingAnchor];
  v34 = [v11 trailingAnchor];
  v32 = [v35 constraintEqualToAnchor:v34];
  v48[4] = v32;
  BOOL v31 = [(UILabel *)v7 bottomAnchor];
  int v30 = [v11 bottomAnchor];
  int v29 = [v31 constraintEqualToAnchor:v30];
  v48[5] = v29;
  id v28 = [(UILabel *)v7 topAnchor];
  id v27 = [v11 topAnchor];
  int v26 = [v28 constraintEqualToAnchor:v27];
  v48[6] = v26;
  v25 = [v11 topAnchor];
  uint64_t v24 = [(PXAnimatedLabel *)self topAnchor];
  uint64_t v23 = [v25 constraintEqualToAnchor:v24];
  v48[7] = v23;
  int v15 = [v11 bottomAnchor];
  uint64_t v16 = [(PXAnimatedLabel *)self bottomAnchor];
  double v17 = [v15 constraintEqualToAnchor:v16];
  v48[8] = v17;
  double v18 = [v11 centerXAnchor];
  double v19 = [(PXAnimatedLabel *)self centerXAnchor];
  double v20 = [v18 constraintEqualToAnchor:v19];
  double v21 = self->_counterWidthConstraint;
  v48[9] = v20;
  v48[10] = v21;
  double v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:11];
  [v33 activateConstraints:v22];
}

@end