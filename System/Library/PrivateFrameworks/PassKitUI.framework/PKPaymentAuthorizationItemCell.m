@interface PKPaymentAuthorizationItemCell
- (BOOL)isCentered;
- (BOOL)showsDisclosure;
- (BOOL)showsSeparator;
- (NSAttributedString)label;
- (NSString)accessibilityLabel;
- (PKPaymentAuthorizationItemCell)initWithLayout:(id)a3 reuseIdentifier:(id)a4;
- (UIImage)labelImage;
- (id)_applyStylingToValueString:(id)a3 defaultColor:(id)a4;
- (id)_createValueView;
- (id)addValue:(id)a3;
- (id)addValue:(id)a3 type:(unint64_t)a4;
- (id)colorForValueType:(unint64_t)a3;
- (void)_createSubviews;
- (void)dealloc;
- (void)prepareForReuse;
- (void)setAccessibilityLabel:(id)a3;
- (void)setCentered:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setLabelImage:(id)a3;
- (void)setShowsDisclosure:(BOOL)a3;
- (void)setShowsSeparator:(BOOL)a3;
- (void)updateConstraints;
@end

@implementation PKPaymentAuthorizationItemCell

- (PKPaymentAuthorizationItemCell)initWithLayout:(id)a3 reuseIdentifier:(id)a4
{
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentAuthorizationItemCell;
  v8 = [(PKPaymentAuthorizationItemCell *)&v16 initWithStyle:0 reuseIdentifier:a4];
  v9 = v8;
  if (v8)
  {
    [(PKPaymentAuthorizationItemCell *)v8 setSelectionStyle:0];
    v10 = [MEMORY[0x1E4FB1618] clearColor];
    [(PKPaymentAuthorizationItemCell *)v9 setBackgroundColor:v10];

    objc_storeStrong((id *)&v9->_layout, a3);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    valueViews = v9->_valueViews;
    v9->_valueViews = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    constraints = v9->_constraints;
    v9->_constraints = v13;

    v9->_constraintsDirty = 1;
    v9->_showsDisclosure = 1;
    v9->_showsSeparator = 1;
    [(PKPaymentAuthorizationItemCell *)v9 _createSubviews];
  }

  return v9;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKPaymentAuthorizationItemCell;
  [(PKPaymentAuthorizationItemCell *)&v2 dealloc];
}

- (void)prepareForReuse
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentAuthorizationItemCell;
  [(PKTableViewCell *)&v12 prepareForReuse];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_constraints];
  [(NSMutableArray *)self->_constraints removeAllObjects];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = self->_valueViews;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "removeFromSuperview", (void)v8);
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_valueViews removeAllObjects];
  [(PKPaymentAuthorizationItemCell *)self setShowsDisclosure:1];
  [(PKPaymentAuthorizationItemCell *)self setShowsSeparator:1];
}

- (void)_createSubviews
{
  id v39 = [(PKPaymentAuthorizationItemCell *)self contentView];
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  labelView = self->_labelView;
  self->_labelView = v3;

  [(UILabel *)self->_labelView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_labelView setOpaque:0];
  [(UILabel *)self->_labelView setNumberOfLines:0];
  [(UILabel *)self->_labelView setLineBreakMode:0];
  LODWORD(v5) = 1.0;
  [(UILabel *)self->_labelView _setHyphenationFactor:v5];
  uint64_t v6 = self->_labelView;
  id v7 = PKConstrainedAuthorizationViewCellLabelSmallFont((void *)*MEMORY[0x1E4FB2790], 0);
  [(UILabel *)v6 setFont:v7];

  long long v8 = self->_labelView;
  long long v9 = PKAuthorizationViewLabelColor();
  [(UILabel *)v8 setTextColor:v9];

  LODWORD(v10) = 1148846080;
  [(UILabel *)self->_labelView setContentCompressionResistancePriority:1 forAxis:v10];
  [v39 addSubview:self->_labelView];
  long long v11 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
  labelImageView = self->_labelImageView;
  self->_labelImageView = v11;

  [(UIImageView *)self->_labelImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_labelImageView setOpaque:0];
  [(UIImageView *)self->_labelImageView setAccessibilityIgnoresInvertColors:1];
  LODWORD(v13) = 1132068864;
  [(UIImageView *)self->_labelImageView setContentHuggingPriority:1 forAxis:v13];
  LODWORD(v14) = 1132068864;
  [(UIImageView *)self->_labelImageView setContentHuggingPriority:0 forAxis:v14];
  [v39 addSubview:self->_labelImageView];
  v15 = UIImageGetTableNext();
  objc_super v16 = [MEMORY[0x1E4FB1618] systemBlueColor];
  v17 = [v15 _flatImageWithColor:v16];
  v18 = [v17 imageFlippedForRightToLeftLayoutDirection];

  v19 = UIImageGetTableNextSelected();
  v20 = [MEMORY[0x1E4FB1618] systemBlueColor];
  v21 = [v19 _flatImageWithColor:v20];
  v22 = [v21 imageFlippedForRightToLeftLayoutDirection];

  id v23 = objc_alloc(MEMORY[0x1E4FB1838]);
  double v24 = *MEMORY[0x1E4F1DB28];
  double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v27 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v28 = (UIImageView *)objc_msgSend(v23, "initWithFrame:", *MEMORY[0x1E4F1DB28], v25, v26, v27);
  arrowView = self->_arrowView;
  self->_arrowView = v28;

  [(UIImageView *)self->_arrowView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_arrowView setContentMode:4];
  [(UIImageView *)self->_arrowView setImage:v18];
  [(UIImageView *)self->_arrowView setHighlightedImage:v22];
  [v39 addSubview:self->_arrowView];
  v30 = PKUIImageNamed(@"Payment_AlertAccessory");
  v31 = objc_msgSend(MEMORY[0x1E4FB1618], "pkui_osloErrorColor");
  v32 = [v30 _flatImageWithColor:v31];

  v33 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v24, v25, v26, v27);
  alertView = self->_alertView;
  self->_alertView = v33;

  [(UIImageView *)self->_alertView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_alertView setContentMode:4];
  [(UIImageView *)self->_alertView setImage:v32];
  [v39 addSubview:self->_alertView];
  v35 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  separatorView = self->_separatorView;
  self->_separatorView = v35;

  [(UIView *)self->_separatorView setTranslatesAutoresizingMaskIntoConstraints:0];
  v37 = self->_separatorView;
  v38 = PKAuthorizationSeparatorColor();
  [(UIView *)v37 setBackgroundColor:v38];

  [v39 addSubview:self->_separatorView];
}

- (id)_createValueView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v4) = 1132068864;
  [v3 setContentCompressionResistancePriority:0 forAxis:v4];
  LODWORD(v5) = 1148846080;
  [v3 setContentCompressionResistancePriority:1 forAxis:v5];
  LODWORD(v6) = 1148846080;
  [v3 setContentHuggingPriority:1 forAxis:v6];
  [v3 setNumberOfLines:0];
  [v3 setOpaque:0];
  [(NSMutableArray *)self->_valueViews addObject:v3];
  id v7 = [(PKPaymentAuthorizationItemCell *)self contentView];
  [v7 addSubview:v3];

  return v3;
}

- (id)_applyStylingToValueString:(id)a3 defaultColor:(id)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  double v6 = (void *)[a3 mutableCopy];
  uint64_t v7 = [v6 length];
  v18[0] = *MEMORY[0x1E4FB06F8];
  long long v8 = PKConstrainedAuthorizationViewCellLabelSmallFont((void *)*MEMORY[0x1E4FB2790], 0);
  v18[1] = *MEMORY[0x1E4FB0700];
  v19[0] = v8;
  v19[1] = v5;
  long long v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  objc_msgSend(v6, "addAttributes:range:", v9, 0, v7);

  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __74__PKPaymentAuthorizationItemCell__applyStylingToValueString_defaultColor___block_invoke;
  objc_super v16 = &unk_1E59CEDC8;
  id v17 = v6;
  id v10 = v6;
  objc_msgSend(v10, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0, &v13);
  long long v11 = objc_msgSend(v10, "copy", v13, v14, v15, v16);

  return v11;
}

void __74__PKPaymentAuthorizationItemCell__applyStylingToValueString_defaultColor___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v42[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *MEMORY[0x1E4F87988];
  id v8 = a2;
  long long v9 = [v8 PKNumberForKey:v7];
  id v10 = [v8 PKNumberForKey:*MEMORY[0x1E4F879A8]];
  long long v11 = [v8 objectForKey:*MEMORY[0x1E4F87998]];
  objc_super v12 = [v8 PKDictionaryForKey:*MEMORY[0x1E4F87990]];

  if ([v9 BOOLValue])
  {
    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v41 = *MEMORY[0x1E4FB06F8];
    uint64_t v14 = PKConstrainedAuthorizationViewCellLabelSmallFont((void *)*MEMORY[0x1E4FB2790], 1);
    v42[0] = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
    objc_msgSend(v13, "addAttributes:range:", v15, a3, a4);
  }
  if ([v10 BOOLValue])
  {
    objc_super v16 = *(void **)(a1 + 32);
    uint64_t v39 = *MEMORY[0x1E4FB0700];
    id v17 = PKAuthorizationViewLabelColor();
    v40 = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    objc_msgSend(v16, "addAttributes:range:", v18, a3, a4);
  }
  if (!v12)
  {
    if (!v11) {
      goto LABEL_22;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_22;
    }
    id v23 = [MEMORY[0x1E4FB1818] imageWithData:v11];
    if (!v23) {
      goto LABEL_22;
    }
    goto LABEL_17;
  }
  v19 = v11;
  uint64_t v20 = a3;
  v21 = [v12 objectForKey:*MEMORY[0x1E4F879B0]];
  v22 = [v12 objectForKey:*MEMORY[0x1E4F879A0]];
  if (!v21)
  {
LABEL_15:
    id v23 = 0;
    goto LABEL_16;
  }
  objc_opt_class();
  id v23 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0 && v22)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v24 = (void *)MEMORY[0x1E4FB1818];
      [v21 floatValue];
      id v23 = [v24 imageWithData:v22 scale:v25];
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_16:

  a3 = v20;
  long long v11 = v19;
  if (!v23) {
    goto LABEL_22;
  }
LABEL_17:
  v36 = v11;
  uint64_t v26 = a3;
  BOOL v27 = UIAccessibilityDarkerSystemColorsEnabled();
  if (v27)
  {
    uint64_t v28 = [v23 imageWithRenderingMode:2];

    id v23 = (void *)v28;
  }
  v29 = (void *)[objc_alloc(MEMORY[0x1E4FB0870]) initWithData:0 ofType:0];
  [v29 setImage:v23];
  v30 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v29];
  objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withAttributedString:", v26, a4, v30);
  if (v27)
  {
    v31 = *(void **)(a1 + 32);
    uint64_t v37 = *MEMORY[0x1E4FB0700];
    v32 = PKAuthorizationViewLabelColor();
    v38 = v32;
    uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    uint64_t v34 = a4;
    v35 = (void *)v33;
    objc_msgSend(v31, "addAttributes:range:", v33, v26, v34);
  }
  long long v11 = v36;
LABEL_22:
}

- (NSAttributedString)label
{
  return [(UILabel *)self->_labelView attributedText];
}

- (void)setLabel:(id)a3
{
  [(UILabel *)self->_labelView setAttributedText:a3];
  [(UILabel *)self->_labelView setHidden:0];
  [(UIImageView *)self->_labelImageView setImage:0];
  [(UIImageView *)self->_labelImageView setHidden:1];
  self->_constraintsDirty = 1;

  [(PKPaymentAuthorizationItemCell *)self setNeedsUpdateConstraints];
}

- (UIImage)labelImage
{
  return [(UIImageView *)self->_labelImageView image];
}

- (void)setLabelImage:(id)a3
{
  [(UIImageView *)self->_labelImageView setImage:a3];
  [(UIImageView *)self->_labelImageView setHidden:0];
  [(UIImageView *)self->_labelImageView sizeToFit];
  [(UILabel *)self->_labelView setText:0];
  [(UILabel *)self->_labelView setHidden:1];
  self->_constraintsDirty = 1;

  [(PKPaymentAuthorizationItemCell *)self setNeedsUpdateConstraints];
}

- (void)setAccessibilityLabel:(id)a3
{
  labelImageView = self->_labelImageView;
  id v5 = a3;
  [(UIImageView *)labelImageView setAccessibilityLabel:v5];
  [(UILabel *)self->_labelView setAccessibilityLabel:v5];
}

- (void)setShowsDisclosure:(BOOL)a3
{
  if (((!self->_showsDisclosure ^ a3) & 1) == 0)
  {
    self->_showsDisclosure = a3;
    [(UIImageView *)self->_arrowView setHidden:!a3];
    self->_constraintsDirty = 1;
    [(PKPaymentAuthorizationItemCell *)self setNeedsUpdateConstraints];
  }
}

- (void)setShowsSeparator:(BOOL)a3
{
  if (((!self->_showsSeparator ^ a3) & 1) == 0)
  {
    self->_showsSeparator = a3;
    [(UIView *)self->_separatorView setHidden:!a3];
    self->_constraintsDirty = 1;
    [(PKPaymentAuthorizationItemCell *)self setNeedsUpdateConstraints];
  }
}

- (id)colorForValueType:(unint64_t)a3
{
  if (a3 == 2)
  {
    id v3 = PKAuthorizationViewLabelColor();
  }
  else if (a3 == 1)
  {
    id v3 = PKAuthorizationViewPlaceholderValueLabelColor();
  }
  else if (a3)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = PKAuthorizationViewValueLabelColor();
  }

  return v3;
}

- (id)addValue:(id)a3
{
  return [(PKPaymentAuthorizationItemCell *)self addValue:a3 type:0];
}

- (id)addValue:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(PKPaymentAuthorizationItemCell *)self _createValueView];
  id v8 = [(PKPaymentAuthorizationItemCell *)self colorForValueType:a4];
  long long v9 = [(PKPaymentAuthorizationItemCell *)self _applyStylingToValueString:v6 defaultColor:v8];

  [v7 setAttributedText:v9];
  BOOL v10 = 1;
  if (a4 != 1) {
    BOOL v10 = !self->_showsDisclosure;
  }
  [(UIImageView *)self->_arrowView setHidden:v10];
  [(UIImageView *)self->_alertView setHidden:a4 != 1];
  self->_constraintsDirty = 1;
  [(PKPaymentAuthorizationItemCell *)self setNeedsUpdateConstraints];

  return v7;
}

- (void)setCentered:(BOOL)a3
{
  if (((!self->_centered ^ a3) & 1) == 0)
  {
    self->_centered = a3;
    self->_constraintsDirty = 1;
    [(PKPaymentAuthorizationItemCell *)self setNeedsUpdateConstraints];
  }
}

- (void)updateConstraints
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  if (!self->_constraintsDirty)
  {
    v135.receiver = self;
    v135.super_class = (Class)PKPaymentAuthorizationItemCell;
    [(PKPaymentAuthorizationItemCell *)&v135 updateConstraints];
    return;
  }
  self->_constraintsDirty = 0;
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_constraints];
  [(NSMutableArray *)self->_constraints removeAllObjects];
  int v122 = [(PKPaymentAuthorizationItemCell *)self _shouldReverseLayoutDirection];
  id v3 = [(PKPaymentAuthorizationItemCell *)self contentView];
  [(PKPaymentAuthorizationLayout *)self->_layout contentHorizontalMargin];
  double v5 = v4;
  id v6 = PKConstrainedAuthorizationViewCellLabelSmallFont((void *)*MEMORY[0x1E4FB2790], 0);
  [v6 _bodyLeading];

  uint64_t v7 = [v3 leadingAnchor];
  double v8 = -v5;
  long long v9 = [v3 trailingAnchor];
  id v126 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  constraints = self->_constraints;
  long long v11 = [(UIView *)self->_separatorView heightAnchor];
  objc_super v12 = [v11 constraintEqualToConstant:PKUIPixelLength()];
  [(NSMutableArray *)constraints addObject:v12];

  uint64_t v13 = self->_constraints;
  uint64_t v14 = [(UIView *)self->_separatorView bottomAnchor];
  v15 = [v3 bottomAnchor];
  objc_super v16 = [v14 constraintEqualToAnchor:v15];
  [(NSMutableArray *)v13 addObject:v16];

  id v17 = self->_constraints;
  v18 = [(UIView *)self->_separatorView leadingAnchor];
  v128 = v7;
  v19 = [v7 constraintEqualToAnchor:v18 constant:-v5];
  [(NSMutableArray *)v17 addObject:v19];

  uint64_t v20 = self->_constraints;
  v21 = [(UIView *)self->_separatorView trailingAnchor];
  v22 = [v21 constraintEqualToAnchor:v9 constant:0.0];
  [(NSMutableArray *)v20 addObject:v22];

  id v23 = [(UIImageView *)self->_arrowView centerYAnchor];
  double v24 = self->_constraints;
  float v25 = [(UIImageView *)self->_arrowView trailingAnchor];
  v129 = v9;
  uint64_t v26 = [v25 constraintEqualToAnchor:v9 constant:-v5];
  [(NSMutableArray *)v24 addObject:v26];

  BOOL v27 = self->_constraints;
  v124 = v3;
  uint64_t v28 = [v3 centerYAnchor];
  v29 = [v23 constraintEqualToAnchor:v28];
  [(NSMutableArray *)v27 addObject:v29];

  v30 = self->_constraints;
  v31 = [(UIImageView *)self->_alertView centerXAnchor];
  v32 = [(UIImageView *)self->_arrowView centerXAnchor];
  uint64_t v33 = [v31 constraintEqualToAnchor:v32];
  [(NSMutableArray *)v30 addObject:v33];

  uint64_t v34 = self->_constraints;
  v35 = [(UIImageView *)self->_alertView centerYAnchor];
  v36 = [v35 constraintEqualToAnchor:v23];
  [(NSMutableArray *)v34 addObject:v36];

  if (![(UIImageView *)self->_arrowView isHidden]
    || ([(UIImageView *)self->_alertView isHidden] & 1) == 0)
  {
    uint64_t v37 = [(UIImageView *)self->_arrowView leadingAnchor];

    v129 = (void *)v37;
  }

  uint64_t v125 = [(NSMutableArray *)self->_valueViews count];
  v38 = [(UILabel *)self->_labelView attributedText];
  if (v38)
  {
    BOOL v39 = 1;
  }
  else
  {
    v40 = [(UIImageView *)self->_labelImageView image];
    BOOL v39 = v40 != 0;
  }
  if (!v125)
  {
    BOOL v42 = 0;
LABEL_16:
    BOOL centered = self->_centered;
    goto LABEL_17;
  }
  uint64_t v41 = [(NSMutableArray *)self->_valueViews indexOfObjectPassingTest:&__block_literal_global_220];
  BOOL v42 = v41 != 0x7FFFFFFFFFFFFFFFLL;
  if (v41 == 0x7FFFFFFFFFFFFFFFLL || !v39) {
    goto LABEL_16;
  }
  BOOL centered = 0;
  BOOL v42 = 1;
LABEL_17:
  v127 = [v124 topAnchor];
  [(PKPaymentAuthorizationLayout *)self->_layout valueLeftMargin];
  double v46 = v45;
  labelView = self->_labelView;
  if (centered)
  {
    [(UILabel *)labelView setTextAlignment:1];
    CreateViewXCenteringConstraints(self->_constraints, self->_labelView, v128, v129, -v5, -v5);
  }
  else
  {
    if (v122) {
      uint64_t v48 = 0;
    }
    else {
      uint64_t v48 = 2;
    }
    [(UILabel *)labelView setTextAlignment:v48];
    v49 = self->_constraints;
    v50 = [(UILabel *)self->_labelView leadingAnchor];
    v51 = [v128 constraintEqualToAnchor:v50 constant:-v5];
    [(NSMutableArray *)v49 addObject:v51];

    v52 = self->_constraints;
    v53 = [(UILabel *)self->_labelView trailingAnchor];
    v54 = [v53 constraintEqualToAnchor:v128 constant:v46 - v5];
    [(NSMutableArray *)v52 addObject:v54];
  }
  v55 = self->_constraints;
  v56 = [(UILabel *)self->_labelView firstBaselineAnchor];
  PKFloatCeilToPixel();
  v57 = objc_msgSend(v56, "constraintEqualToAnchor:constant:", v127);
  [(NSMutableArray *)v55 addObject:v57];

  v58 = [(UILabel *)self->_labelView lastBaselineAnchor];
  [v126 addObject:v58];

  if (v42)
  {
    v59 = [(NSMutableArray *)self->_valueViews objectAtIndexedSubscript:0];
  }
  else
  {
    v59 = self->_labelView;
  }
  v60 = v59;
  v61 = self->_constraints;
  v62 = [(UIImageView *)self->_labelImageView topAnchor];
  v63 = [(UILabel *)v60 firstBaselineAnchor];
  v123 = v60;
  v64 = [(UILabel *)v60 font];
  [v64 capHeight];
  PKFloatCeilToPixel();
  v65 = objc_msgSend(v62, "constraintEqualToAnchor:constant:", v63);
  [(NSMutableArray *)v61 addObject:v65];

  v66 = self->_constraints;
  if (centered)
  {
    CreateViewXCenteringConstraints(self->_constraints, self->_labelImageView, v128, v129, -v5, -v5);
  }
  else
  {
    v67 = [(UIImageView *)self->_labelImageView trailingAnchor];
    v68 = [(UILabel *)self->_labelView trailingAnchor];
    v69 = [v67 constraintEqualToAnchor:v68];
    [(NSMutableArray *)v66 addObject:v69];
  }
  v70 = [(UIImageView *)self->_labelImageView image];
  [v70 size];
  if (v70 && (double v73 = v71, v71 > 0.0) && (v74 = v72, v72 > 0.0) && (v75 = v46 - v5 - v5, v75 > 0.0))
  {
    v76 = [(UIImageView *)self->_labelImageView widthAnchor];
    v77 = [(UIImageView *)self->_labelImageView heightAnchor];
    v78 = self->_constraints;
    v79 = [v76 constraintEqualToAnchor:v77 multiplier:v73 / v74];
    [(NSMutableArray *)v78 addObject:v79];

    v80 = self->_constraints;
    v81 = [v76 constraintLessThanOrEqualToConstant:v75];
    [(NSMutableArray *)v80 addObject:v81];

    v82 = self->_constraints;
    v83 = [v77 constraintLessThanOrEqualToConstant:40.0];
    [(NSMutableArray *)v82 addObject:v83];

    v84 = [(UIImageView *)self->_labelImageView bottomAnchor];
    [v126 addObject:v84];
  }
  else
  {
    v85 = self->_constraints;
    v86 = [(UIImageView *)self->_labelImageView widthAnchor];
    v87 = [v86 constraintEqualToConstant:0.0];
    [(NSMutableArray *)v85 addObject:v87];

    v88 = self->_constraints;
    v76 = [(UIImageView *)self->_labelImageView heightAnchor];
    v77 = [v76 constraintEqualToConstant:0.0];
    [(NSMutableArray *)v88 addObject:v77];
  }

  uint64_t v89 = [(UILabel *)self->_labelView topAnchor];
  v90 = (void *)v89;
  if (v125)
  {
    for (uint64_t i = 0; i != v125; ++i)
    {
      v92 = [(NSMutableArray *)self->_valueViews objectAtIndexedSubscript:i];
      v93 = v92;
      if (centered)
      {
        [v92 setTextAlignment:1];
        CreateViewXCenteringConstraints(self->_constraints, v93, v128, v129, v8, v8);
      }
      else
      {
        [v92 setTextAlignment:4];
        v94 = self->_constraints;
        v95 = [v93 leadingAnchor];
        v96 = [v128 constraintEqualToAnchor:v95 constant:-v46];
        [(NSMutableArray *)v94 addObject:v96];

        v97 = self->_constraints;
        v98 = [v93 trailingAnchor];
        v99 = [v98 constraintLessThanOrEqualToAnchor:v129 constant:v8];
        [(NSMutableArray *)v97 addObject:v99];
      }
      v100 = self->_constraints;
      v101 = [v93 topAnchor];
      v102 = [v101 constraintEqualToAnchor:v90];
      [(NSMutableArray *)v100 addObject:v102];

      v103 = [v93 bottomAnchor];

      if (v125 - 1 == i)
      {
        v104 = [v93 lastBaselineAnchor];
        [v126 addObject:v104];
      }
      v90 = v103;
    }
  }
  else
  {
    v103 = (void *)v89;
  }

  if ([(UIView *)self->_separatorView isHidden]) {
    [v124 bottomAnchor];
  }
  else {
  v105 = [(UIView *)self->_separatorView topAnchor];
  }
  PKFloatCeilToPixel();
  double v107 = v106;
  long long v131 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  id v108 = v126;
  uint64_t v109 = [v108 countByEnumeratingWithState:&v131 objects:v136 count:16];
  if (v109)
  {
    uint64_t v110 = v109;
    v111 = 0;
    double v112 = -v107;
    uint64_t v113 = *(void *)v132;
    do
    {
      uint64_t v114 = 0;
      v115 = v111;
      do
      {
        if (*(void *)v132 != v113) {
          objc_enumerationMutation(v108);
        }
        v111 = [*(id *)(*((void *)&v131 + 1) + 8 * v114) constraintLessThanOrEqualToAnchor:v105 constant:v112];

        LODWORD(v116) = 1148829696;
        [v111 setPriority:v116];
        [(NSMutableArray *)self->_constraints addObject:v111];
        ++v114;
        v115 = v111;
      }
      while (v110 != v114);
      uint64_t v110 = [v108 countByEnumeratingWithState:&v131 objects:v136 count:16];
    }
    while (v110);
  }
  v117 = [v124 heightAnchor];
  v118 = self->_constraints;
  v119 = [v117 constraintGreaterThanOrEqualToConstant:44.0];
  [(NSMutableArray *)v118 addObject:v119];

  v120 = [v117 constraintEqualToConstant:0.0];
  LODWORD(v121) = 1148813312;
  [v120 setPriority:v121];
  [(NSMutableArray *)self->_constraints addObject:v120];
  [MEMORY[0x1E4F28DC8] activateConstraints:self->_constraints];
  v130.receiver = self;
  v130.super_class = (Class)PKPaymentAuthorizationItemCell;
  [(PKPaymentAuthorizationItemCell *)&v130 updateConstraints];
}

BOOL __51__PKPaymentAuthorizationItemCell_updateConstraints__block_invoke(uint64_t a1, void *a2)
{
  objc_super v2 = [a2 attributedText];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (BOOL)showsDisclosure
{
  return self->_showsDisclosure;
}

- (BOOL)showsSeparator
{
  return self->_showsSeparator;
}

- (BOOL)isCentered
{
  return self->_centered;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_labelImageView, 0);
  objc_storeStrong((id *)&self->_alertView, 0);
  objc_storeStrong((id *)&self->_arrowView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_valueViews, 0);
  objc_storeStrong((id *)&self->_labelView, 0);

  objc_storeStrong((id *)&self->_layout, 0);
}

@end