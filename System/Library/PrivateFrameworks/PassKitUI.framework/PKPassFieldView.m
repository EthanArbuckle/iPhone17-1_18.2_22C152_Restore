@interface PKPassFieldView
+ (id)newViewForField:(id)a3 fieldTemplate:(id)a4;
- (BOOL)_shouldDisplayLabel;
- (CGSize)_resizeMultiLineValueFontForAvailableSize:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKDiffView)diffView;
- (PKPassColorProfile)colorProfile;
- (PKPassField)field;
- (PKPassFieldTemplate)fieldTemplate;
- (PKPassFieldView)initWithField:(id)a3 fieldTemplate:(id)a4;
- (UILabel)labelLabel;
- (UILabel)valueLabel;
- (id)_labelAttributedStringForColorProfile:(id)a3;
- (id)_labelColorFromColorProfile:(id)a3;
- (id)_valueAttributedStringForColorProfile:(id)a3;
- (id)_valueColorFromColorProfile:(id)a3;
- (id)description;
- (void)invalidateCachedFieldSize;
- (void)layoutSubviews;
- (void)presentDiff:(id)a3 inView:(id)a4 completion:(id)a5;
- (void)setColorProfile:(id)a3;
- (void)setColorProfile:(id)a3 background:(int64_t)a4;
- (void)setDiffView:(id)a3;
- (void)setField:(id)a3;
- (void)setFieldTemplate:(id)a3;
- (void)updateVibrancyFiltersFromColorProfile:(id)a3;
@end

@implementation PKPassFieldView

- (id)_labelColorFromColorProfile:(id)a3
{
  id v4 = a3;
  if (![v4 supportsAutomaticLabelVibrancy]
    || ([(PKPassFieldTemplate *)self->_fieldTemplate automaticVibrantLabelColor],
        (v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v5 = [v4 labelColorOverStrip:self->_background == 1];
  }

  return v5;
}

- (void)updateVibrancyFiltersFromColorProfile:(id)a3
{
  id v16 = a3;
  id v4 = [(PKPassFieldTemplate *)self->_fieldTemplate automaticVibrantLabelBlendMode];
  v5 = [(PKPassFieldTemplate *)self->_fieldTemplate automaticVibrantValueBlendMode];
  int v6 = [v16 supportsAutomaticLabelVibrancy];
  if (v6)
  {
    id v7 = v4;
    v8 = [(PKPassField *)self->_field value];

    if (!v8 && [(PKPassFieldTemplate *)self->_fieldTemplate preferredSingleStyle] == 2)
    {
      id v9 = v5;

      id v7 = v9;
    }
    v10 = [(UILabel *)self->_labelLabel layer];
    [v10 setCompositingFilter:v7];
  }
  if ([v16 supportsAutomaticForegroundVibrancy])
  {
    id v11 = v5;
    v12 = [(PKPassField *)self->_field label];

    if (!v12 && [(PKPassFieldTemplate *)self->_fieldTemplate preferredSingleStyle] == 1)
    {
      id v13 = v4;

      id v11 = v13;
    }
    v14 = [(UILabel *)self->_valueLabel layer];
    [v14 setCompositingFilter:v11];

    int v6 = 1;
  }
  v15 = [(PKPassFieldView *)self layer];
  [v15 setAllowsGroupBlending:v6 ^ 1u];
}

- (id)_valueColorFromColorProfile:(id)a3
{
  id v4 = a3;
  if (![v4 supportsAutomaticForegroundVibrancy]
    || ([(PKPassFieldTemplate *)self->_fieldTemplate automaticVibrantValueColor],
        (v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v5 = [v4 foregroundColorOverStrip:self->_background == 1];
  }

  return v5;
}

- (PKPassField)field
{
  return self->_field;
}

- (void)layoutSubviews
{
  v53.receiver = self;
  v53.super_class = (Class)PKPassFieldView;
  [(PKPassFieldView *)&v53 layoutSubviews];
  [(PKPassFieldView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  double v10 = v9;
  BOOL v11 = [(PKPassFieldTemplate *)self->_fieldTemplate valueSignificant];
  BOOL v12 = [(PKPassFieldView *)self _shouldDisplayLabel];
  [(PKPassFieldTemplate *)self->_fieldTemplate verticalPadding];
  double v14 = v13;
  if (v11)
  {
    [(UILabel *)self->_valueLabel frame];
    CGFloat rect = fmax(v10, v25);
    PKSizeAlignedInRect();
    CGFloat v26 = v8;
    double v27 = v4;
    double v28 = v14;
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    -[UILabel setFrame:](self->_valueLabel, "setFrame:");
    v56.origin.x = v30;
    double v14 = v28;
    CGFloat v4 = v27;
    CGFloat v8 = v26;
    v56.origin.y = v32;
    v56.size.width = v34;
    v56.size.height = v36;
    CGFloat v37 = v14 + CGRectGetMaxY(v56);
    v57.origin.x = v4;
    v57.origin.y = v6;
    v57.size.width = v26;
    v57.size.height = rect;
    double v10 = CGRectGetMaxY(v57) - v37;
    CGFloat v6 = v37;
    if (!v12)
    {
LABEL_3:
      if (v11) {
        return;
      }
      goto LABEL_4;
    }
  }
  else if (!v12)
  {
    goto LABEL_3;
  }
  [(UILabel *)self->_labelLabel frame];
  CGFloat v39 = fmax(v10, v38);
  PKSizeAlignedInRect();
  CGFloat v41 = v40;
  CGFloat recta = v8;
  double v42 = v4;
  double v43 = v14;
  CGFloat v45 = v44;
  CGFloat v47 = v46;
  CGFloat v49 = v48;
  -[UILabel setFrame:](self->_labelLabel, "setFrame:");
  v58.origin.x = v41;
  v58.origin.y = v45;
  v58.size.width = v47;
  v58.size.height = v49;
  CGFloat v50 = v43 + CGRectGetMaxY(v58);
  CGFloat v4 = v42;
  CGFloat v8 = recta;
  v59.origin.x = v4;
  v59.origin.y = v6;
  v59.size.width = recta;
  v59.size.height = v39;
  double v10 = CGRectGetMaxY(v59) - v50;
  CGFloat v6 = v50;
  if (v11) {
    return;
  }
LABEL_4:
  [(UILabel *)self->_valueLabel frame];
  CGFloat v16 = fmax(v10, v15);
  PKSizeAlignedInRect();
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  -[UILabel setFrame:](self->_valueLabel, "setFrame:");
  v54.origin.x = v18;
  v54.origin.y = v20;
  v54.size.width = v22;
  v54.size.height = v24;
  CGRectGetMaxY(v54);
  v55.origin.x = v4;
  v55.origin.y = v6;
  v55.size.width = v8;
  v55.size.height = v16;
  CGRectGetMaxY(v55);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (self->_needsRecalculation)
  {
    double height = a3.height;
    double width = a3.width;
    CGFloat v6 = [(PKPassFieldView *)self _labelAttributedStringForColorProfile:self->_colorProfile];
    if ([(PKPassFieldView *)self _shouldDisplayLabel])
    {
      [(UILabel *)self->_labelLabel setAttributedText:v6];
      [(UILabel *)self->_labelLabel sizeToFit];
      [(UILabel *)self->_labelLabel frame];
      double v8 = v7;
      double v10 = v9;
    }
    else
    {
      double v8 = *MEMORY[0x1E4F1DB30];
      double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      [(PKPassFieldTemplate *)self->_fieldTemplate setVerticalPadding:0.0];
    }
    valueLabel = self->_valueLabel;
    BOOL v12 = [(PKPassFieldView *)self _valueAttributedStringForColorProfile:self->_colorProfile];
    [(UILabel *)valueLabel setAttributedText:v12];

    [(UILabel *)self->_valueLabel sizeToFit];
    [(UILabel *)self->_valueLabel frame];
    double v14 = v13;
    double v16 = v15;
    [(PKPassFieldTemplate *)self->_fieldTemplate verticalPadding];
    double v18 = height - v10 - v17;
    if (v14 > width && [(PKPassFieldTemplate *)self->_fieldTemplate valueCanWrap])
    {
      double v19 = [(UILabel *)self->_valueLabel attributedText];
      objc_msgSend(v19, "boundingRectWithSize:options:context:", 1, 0, width, 3.40282347e38);
      unint64_t v21 = v20;
      unint64_t v23 = v22;

      v24.n128_u64[0] = v21;
      v25.n128_u64[0] = v23;
      PKSizeCeilToPixel(v24, v25, v26);
      if (v28 > v18) {
        -[PKPassFieldView _resizeMultiLineValueFontForAvailableSize:](self, "_resizeMultiLineValueFontForAvailableSize:", width, v18);
      }
      double v14 = v27;
      double v16 = v28;
    }
    -[UILabel setFrame:](self->_labelLabel, "setFrame:", 0.0, 0.0, v8, v10);
    if (v16 >= v18) {
      double v29 = v18;
    }
    else {
      double v29 = v16;
    }
    -[UILabel setFrame:](self->_valueLabel, "setFrame:", 0.0, 0.0, v14, v29);
    if (v8 <= v14) {
      double v30 = v14;
    }
    else {
      double v30 = v8;
    }
    [(PKPassFieldTemplate *)self->_fieldTemplate verticalPadding];
    self->_cachedSize.double width = v30;
    self->_cachedSize.double height = v10 + v16 + v31;
    self->_needsRecalculation = 0;
  }
  double v32 = self->_cachedSize.width;
  double v33 = self->_cachedSize.height;
  result.double height = v33;
  result.double width = v32;
  return result;
}

- (id)_labelAttributedStringForColorProfile:(id)a3
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PKPassField *)self->_field label];
  if (!v5)
  {
    double v18 = 0;
    goto LABEL_16;
  }
  CGFloat v6 = (void *)v5;
  uint64_t v7 = [(PKPassField *)self->_field textAlignment];
  if (v7 == 4) {
    uint64_t v7 = [(PKPassFieldTemplate *)self->_fieldTemplate textAlignment];
  }
  double v8 = [MEMORY[0x1E4FB0848] defaultParagraphStyle];
  double v9 = (void *)[v8 mutableCopy];

  [v9 setAlignment:v7];
  [v9 setLineBreakMode:4];
  double v10 = [(PKPassFieldView *)self _labelColorFromColorProfile:v4];
  BOOL v11 = [(PKPassField *)self->_field value];

  if (!v11 && [(PKPassFieldTemplate *)self->_fieldTemplate preferredSingleStyle] == 2)
  {
    uint64_t v12 = [(PKPassFieldView *)self _valueColorFromColorProfile:v4];

    double v10 = (void *)v12;
  }
  uint64_t v13 = *MEMORY[0x1E4FB0738];
  v21[0] = *MEMORY[0x1E4FB0700];
  v21[1] = v13;
  v22[0] = v10;
  v22[1] = v9;
  v21[2] = *MEMORY[0x1E4FB06F8];
  double v14 = [(PKPassFieldTemplate *)self->_fieldTemplate labelFont];
  v22[2] = v14;
  double v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];

  int64_t v16 = [(PKPassFieldTemplate *)self->_fieldTemplate labelCaseStyle];
  if (v16 == 2)
  {
    uint64_t v17 = objc_msgSend(v6, "pk_capitalizedStringForPreferredLocale");
  }
  else
  {
    if (v16 != 1 && (v16 || self->_background == 1)) {
      goto LABEL_15;
    }
    uint64_t v17 = objc_msgSend(v6, "pk_uppercaseStringForPreferredLocale");
  }
  double v19 = (void *)v17;

  CGFloat v6 = v19;
LABEL_15:
  double v18 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6 attributes:v15];

LABEL_16:

  return v18;
}

- (id)_valueAttributedStringForColorProfile:(id)a3
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PKPassField *)self->_field value];
  if (v5)
  {
    uint64_t v6 = [(PKPassField *)self->_field textAlignment];
    if (v6 == 4) {
      uint64_t v6 = [(PKPassFieldTemplate *)self->_fieldTemplate textAlignment];
    }
    if ([(PKPassFieldTemplate *)self->_fieldTemplate valueCanWrap]) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = 4;
    }
    double v8 = [MEMORY[0x1E4FB0848] defaultParagraphStyle];
    double v9 = (void *)[v8 mutableCopy];

    [v9 setAlignment:v6];
    [v9 setLineBreakMode:v7];
    double v10 = [(PKPassFieldView *)self _valueColorFromColorProfile:v4];
    BOOL v11 = [(PKPassField *)self->_field label];

    if (!v11 && [(PKPassFieldTemplate *)self->_fieldTemplate preferredSingleStyle] == 1)
    {
      uint64_t v12 = [(PKPassFieldView *)self _labelColorFromColorProfile:v4];

      double v10 = (void *)v12;
    }
    uint64_t v13 = *MEMORY[0x1E4FB0738];
    v18[0] = *MEMORY[0x1E4FB0700];
    v18[1] = v13;
    v19[0] = v10;
    v19[1] = v9;
    v18[2] = *MEMORY[0x1E4FB06F8];
    double v14 = [(PKPassFieldTemplate *)self->_fieldTemplate valueFont];
    v19[2] = v14;
    double v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];

    int64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:v15];
  }
  else
  {
    int64_t v16 = 0;
  }

  return v16;
}

- (void)setField:(id)a3
{
  double v9 = (PKPassField *)a3;
  if (self->_field != v9)
  {
    objc_storeStrong((id *)&self->_field, a3);
    labelLabel = self->_labelLabel;
    uint64_t v6 = [(PKPassField *)v9 label];
    [(UILabel *)labelLabel setText:v6];

    valueLabel = self->_valueLabel;
    double v8 = [(PKPassField *)v9 value];
    [(UILabel *)valueLabel setText:v8];

    [(PKPassFieldView *)self invalidateCachedFieldSize];
  }
}

- (PKPassFieldView)initWithField:(id)a3 fieldTemplate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKPassFieldView;
  double v8 = [(PKPassFieldView *)&v18 init];
  if (v8)
  {
    double v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    labelLabel = v8->_labelLabel;
    v8->_labelLabel = v9;

    BOOL v11 = v8->_labelLabel;
    uint64_t v12 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v11 setBackgroundColor:v12];

    [(UILabel *)v8->_labelLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85658]];
    [(PKPassFieldView *)v8 addSubview:v8->_labelLabel];
    uint64_t v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    valueLabel = v8->_valueLabel;
    v8->_valueLabel = v13;

    double v15 = v8->_valueLabel;
    int64_t v16 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v15 setBackgroundColor:v16];

    [(UILabel *)v8->_valueLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85B58]];
    [(PKPassFieldView *)v8 addSubview:v8->_valueLabel];
    [(PKPassFieldView *)v8 setField:v6];
    [(PKPassFieldView *)v8 setFieldTemplate:v7];
    [(PKPassFieldView *)v8 invalidateCachedFieldSize];
    [(PKPassFieldView *)v8 setAccessibilityIdentifier:*MEMORY[0x1E4F85570]];
  }

  return v8;
}

- (void)setFieldTemplate:(id)a3
{
  double v8 = (PKPassFieldTemplate *)a3;
  if (self->_fieldTemplate != v8) {
    objc_storeStrong((id *)&self->_fieldTemplate, a3);
  }
  [(UILabel *)self->_labelLabel setHidden:[(PKPassFieldTemplate *)v8 suppressesLabel]];
  BOOL v5 = [(PKPassFieldTemplate *)v8 valueCanWrap];
  if (v5) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  if (v5) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 4;
  }
  [(UILabel *)self->_valueLabel setNumberOfLines:v6];
  [(UILabel *)self->_valueLabel setLineBreakMode:v7];
  [(PKPassFieldView *)self invalidateCachedFieldSize];
}

- (void)invalidateCachedFieldSize
{
  self->_needsRecalculation = 1;
}

- (BOOL)_shouldDisplayLabel
{
  if ([(PKPassFieldTemplate *)self->_fieldTemplate suppressesLabel])
  {
    LOBYTE(v3) = 0;
  }
  else if ([(PKPassFieldTemplate *)self->_fieldTemplate suppressesEmptyLabel])
  {
    id v4 = [(UILabel *)self->_labelLabel attributedText];
    BOOL v5 = [v4 string];
    int v3 = [v5 isEqualToString:@" "] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (UILabel)labelLabel
{
  return self->_labelLabel;
}

- (PKPassFieldTemplate)fieldTemplate
{
  return self->_fieldTemplate;
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setColorProfile:(id)a3 background:(int64_t)a4
{
  objc_storeStrong((id *)&self->_colorProfile, a3);
  id v7 = a3;
  self->_background = a4;
  [(PKPassFieldView *)self invalidateCachedFieldSize];
  [(PKPassFieldView *)self updateVibrancyFiltersFromColorProfile:v7];
}

+ (id)newViewForField:(id)a3 fieldTemplate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)[v6 viewSubclass];
  if (!v7) {
    id v7 = objc_opt_class();
  }
  id result = (id)[v7 isSubclassOfClass:objc_opt_class()];
  if (result)
  {
    double v9 = (void *)[objc_alloc((Class)v7) initWithField:v5 fieldTemplate:v6];

    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)description
{
  int v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [(PKPassFieldView *)self frame];
  objc_msgSend(v3, "appendFormat:", @"frame = (%g %g; %g %g); ", v4, v5, v6, v7);
  double v8 = [(UILabel *)self->_labelLabel text];
  uint64_t v9 = [v8 length];
  double v10 = (void *)MEMORY[0x1E4FB06F8];
  if (v9)
  {
    BOOL v11 = [(UILabel *)self->_labelLabel attributedText];
    uint64_t v12 = [v11 attribute:*v10 atIndex:0 effectiveRange:0];
    [v12 pointSize];
    uint64_t v14 = v13;

    if ((unint64_t)[v8 length] >= 0x1A)
    {
      uint64_t v15 = objc_msgSend(v8, "rangeOfComposedCharacterSequencesForRange:", 0, 25);
      uint64_t v17 = objc_msgSend(v8, "substringWithRange:", v15, v16);
      uint64_t v18 = [v17 stringByAppendingString:@"..."];

      double v8 = (void *)v18;
    }
    [v3 appendFormat:@"<label = '%@'; font-size: %g>; ", v8, v14];
  }
  double v19 = [(UILabel *)self->_valueLabel text];
  if ([v19 length])
  {
    unint64_t v20 = [(UILabel *)self->_valueLabel attributedText];
    unint64_t v21 = [v20 attribute:*v10 atIndex:0 effectiveRange:0];
    [v21 pointSize];
    uint64_t v23 = v22;

    if ((unint64_t)[v19 length] >= 0x1A)
    {
      uint64_t v24 = objc_msgSend(v19, "rangeOfComposedCharacterSequencesForRange:", 0, 25);
      __n128 v26 = objc_msgSend(v19, "substringWithRange:", v24, v25);
      uint64_t v27 = [v26 stringByAppendingString:@"..."];

      double v19 = (void *)v27;
    }
    [v3 appendFormat:@"<value = '%@'; font-size: %g>", v19, v23];
  }
  [v3 appendString:@">"];
  double v28 = [NSString stringWithString:v3];

  return v28;
}

- (void)setDiffView:(id)a3
{
  id v5 = a3;
  p_diffView = (id *)&self->_diffView;
  id v7 = *p_diffView;
  if (*p_diffView != v5)
  {
    id v8 = v5;
    if (v7) {
      [v7 removeFromSuperview];
    }
    objc_storeStrong(p_diffView, a3);
    id v5 = v8;
  }
}

- (void)presentDiff:(id)a3 inView:(id)a4 completion:(id)a5
{
  id v32 = a4;
  id v8 = (void (**)(void))a5;
  field = self->_field;
  id v10 = a3;
  BOOL v11 = [(PKPassField *)field key];
  int v12 = [v10 getHunkForKey:v11 oldValue:0 newValue:0 message:0];

  if (v12)
  {
    valueLabel = self->_valueLabel;
    [(UILabel *)valueLabel bounds];
    -[UILabel textRectForBounds:limitedToNumberOfLines:](valueLabel, "textRectForBounds:limitedToNumberOfLines:", 0);
    -[PKPassFieldView convertRect:fromView:](self, "convertRect:fromView:", self->_valueLabel);
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    [(UILabel *)self->_labelLabel frame];
    v37.origin.double x = v22;
    v37.origin.double y = v23;
    v37.size.double width = v24;
    v37.size.double height = v25;
    v34.origin.double x = v15;
    v34.origin.double y = v17;
    v34.size.double width = v19;
    v34.size.double height = v21;
    CGRect v35 = CGRectUnion(v34, v37);
    v35.origin.double x = v15;
    v35.size.double width = v19;
    CGRect v36 = CGRectInset(v35, -15.0, -15.0);
    double x = v36.origin.x;
    double y = v36.origin.y;
    double width = v36.size.width;
    double height = v36.size.height;
    double v30 = [PKDiffView alloc];
    objc_msgSend(v32, "convertRect:fromView:", self, x, y, width, height);
    double v31 = -[PKDiffView initWithFrame:](v30, "initWithFrame:");
    [v32 addSubview:v31];
    [(PKPassFieldView *)self setDiffView:v31];
    [(PKDiffView *)v31 performStrokeWithCompletion:v8];
  }
  else
  {
    [(PKPassFieldView *)self setDiffView:0];
    if (v8) {
      v8[2](v8);
    }
  }
}

- (CGSize)_resizeMultiLineValueFontForAvailableSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(PKPassFieldTemplate *)self->_fieldTemplate valueFont];
  [v6 xHeight];
  double v8 = v7;
  uint64_t v9 = [(PKPassFieldTemplate *)self->_fieldTemplate labelFont];
  [v9 xHeight];
  double v11 = v8 / v10;

  int v12 = [(PKPassFieldTemplate *)self->_fieldTemplate valueFont];
  [v12 pointSize];
  double v14 = v13;

  if (v11 <= 1.0)
  {
    double v26 = height;
    double v24 = width;
  }
  else
  {
    do
    {
      double v14 = v14 + -1.0;
      fieldTemplate = self->_fieldTemplate;
      double v16 = (void *)MEMORY[0x1E4FB08E0];
      CGFloat v17 = [(PKPassFieldTemplate *)fieldTemplate valueFont];
      double v18 = [v17 fontDescriptor];
      CGFloat v19 = [v16 fontWithDescriptor:v18 size:v14];
      [(PKPassFieldTemplate *)fieldTemplate setValueFont:v19];

      valueLabel = self->_valueLabel;
      CGFloat v21 = [(PKPassFieldView *)self _valueAttributedStringForColorProfile:self->_colorProfile];
      [(UILabel *)valueLabel setAttributedText:v21];

      CGFloat v22 = [(UILabel *)self->_valueLabel attributedText];
      objc_msgSend(v22, "boundingRectWithSize:options:context:", 1, 0, width, 3.40282347e38);
      double v24 = v23;
      double v26 = v25;

      if (v26 < height) {
        break;
      }
      uint64_t v27 = [(PKPassFieldTemplate *)self->_fieldTemplate valueFont];
      [v27 xHeight];
      double v29 = v28;
      double v30 = [(PKPassFieldTemplate *)self->_fieldTemplate labelFont];
      [v30 xHeight];
      double v32 = v29 / v31;
    }
    while (v32 > 1.0);
  }
  if (v24 <= width) {
    double v33 = v24;
  }
  else {
    double v33 = width;
  }
  double v34 = v26;
  result.double height = v34;
  result.double width = v33;
  return result;
}

- (PKPassColorProfile)colorProfile
{
  return self->_colorProfile;
}

- (void)setColorProfile:(id)a3
{
}

- (PKDiffView)diffView
{
  return self->_diffView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_labelLabel, 0);
  objc_storeStrong((id *)&self->_diffView, 0);
  objc_storeStrong((id *)&self->_colorProfile, 0);
  objc_storeStrong((id *)&self->_fieldTemplate, 0);

  objc_storeStrong((id *)&self->_field, 0);
}

@end