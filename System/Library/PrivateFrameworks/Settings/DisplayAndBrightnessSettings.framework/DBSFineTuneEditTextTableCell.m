@interface DBSFineTuneEditTextTableCell
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation DBSFineTuneEditTextTableCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)DBSFineTuneEditTextTableCell;
  [(PSEditableTableCell *)&v43 refreshCellContentsWithSpecifier:v4];
  v5 = [MEMORY[0x263F82438] sharedApplication];
  BOOL v6 = [v5 userInterfaceLayoutDirection] != 1;

  v7 = [(PSEditableTableCell *)self textField];
  [v7 setTextAlignment:2 * v6];
  v8 = [MEMORY[0x263F5FBC0] appearance];
  v9 = [v8 altTextColor];
  v10 = [(DBSFineTuneEditTextTableCell *)self _accessibilityHigherContrastTintColorForColor:v9];
  [v7 setTextColor:v10];

  v11 = (void *)MEMORY[0x263F81708];
  v12 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [v12 pointSize];
  v13 = objc_msgSend(v11, "monospacedDigitSystemFontOfSize:weight:");
  [v7 setFont:v13];

  uint64_t v41 = *MEMORY[0x263F60038];
  v14 = objc_msgSend(v4, "objectForKeyedSubscript:");
  [v14 doubleValue];
  self->_minValue = v15;

  uint64_t v16 = *MEMORY[0x263F60030];
  v42 = v4;
  v17 = [v4 objectForKeyedSubscript:*MEMORY[0x263F60030]];
  [v17 doubleValue];
  self->_maxValue = v18;

  self->_valueValid = 0;
  v19 = [v7 text];
  uint64_t v20 = [v19 length];

  if (v20)
  {
    id v21 = objc_alloc_init(MEMORY[0x263F08A30]);
    [v21 setNumberStyle:1];
    v22 = [v7 text];
    v23 = [v21 numberFromString:v22];
    [v23 doubleValue];
    double v25 = v24;

    BOOL v26 = self->_minValue + -0.000001 < v25;
    if (self->_maxValue + 0.000001 <= v25) {
      BOOL v26 = 0;
    }
    self->_valueValid = v26;
  }
  else
  {
    self->_valueValid = 1;
  }
  id v27 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v27 setNumberStyle:1];
  if (self->_maxValue >= 1.0)
  {
    [v27 setMinimumFractionDigits:1];
    [v27 setMaximumFractionDigits:1];
    [v27 setRoundingMode:2];
  }
  else
  {
    [v27 setMinimumIntegerDigits:1];
    [v27 setMaximumIntegerDigits:1];
    [v27 setMinimumFractionDigits:4];
    [v27 setMaximumFractionDigits:4];
  }
  v28 = [v42 objectForKeyedSubscript:v41];
  v29 = [v27 stringFromNumber:v28];

  v30 = [v42 objectForKeyedSubscript:v16];
  v31 = [v27 stringFromNumber:v30];

  v32 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  validationLabel = self->_validationLabel;
  self->_validationLabel = v32;

  v34 = [v7 font];
  [(UILabel *)self->_validationLabel setFont:v34];

  v35 = NSString;
  v36 = DBS_LocalizedStringForFineTune(@"VALIDATION_MESSAGE");
  v37 = objc_msgSend(v35, "stringWithFormat:", v36, v29, v31);
  [(UILabel *)self->_validationLabel setText:v37];

  v38 = [v7 textColor];
  [(UILabel *)self->_validationLabel setTextColor:v38];

  [(UILabel *)self->_validationLabel setHidden:0];
  v39 = [v42 identifier];
  if (([v39 isEqual:@"MEASURED_WHITE_POINT_X"] & 1) != 0
    || ([v39 isEqual:@"MEASURED_WHITE_POINT_Y"] & 1) != 0
    || ([v39 isEqual:@"MEASURED_LUMINANCE"] & 1) != 0)
  {
    BOOL v40 = 1;
LABEL_13:
    self->_hideIfValid = v40;
    goto LABEL_14;
  }
  if (([v39 isEqual:@"TARGET_WHITE_POINT_X"] & 1) != 0
    || ([v39 isEqual:@"TARGET_WHITE_POINT_Y"] & 1) != 0
    || [v39 isEqual:@"TARGET_LUMINANCE"])
  {
    BOOL v40 = 0;
    goto LABEL_13;
  }
LABEL_14:
  [(DBSFineTuneEditTextTableCell *)self addSubview:self->_validationLabel];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x263F08A30]);
  BOOL v12 = 1;
  [v11 setNumberStyle:1];
  v13 = [v11 groupingSeparator];
  v14 = [v11 decimalSeparator];
  double v15 = [v9 text];
  uint64_t v16 = objc_msgSend(v15, "stringByReplacingCharactersInRange:withString:", location, length, v10);

  if (([v16 isEqualToString:v14] & 1) == 0)
  {
    id v40 = v9;
    if ([v16 length])
    {
      v17 = [v16 componentsSeparatedByString:v13];
      uint64_t v18 = [v17 count];

      v19 = [v16 stringByReplacingOccurrencesOfString:v13 withString:&stru_26E931C58];
      uint64_t v20 = [v11 numberFromString:v19];
      if (!v20)
      {
        BOOL v12 = 0;
LABEL_27:

        id v9 = v40;
        goto LABEL_28;
      }
      uint64_t v21 = v18 - 1;
      if ([v19 containsString:v14])
      {
        uint64_t v37 = v18 - 1;
        uint64_t v22 = [v16 rangeOfString:v14];
        double v24 = [v16 substringFromIndex:v22 + v23];
        char v38 = [v24 containsString:v13];
        unint64_t v39 = [v19 length];

        BOOL v12 = 0;
        if (v39 > 6 || (v38 & 1) != 0 || v37 > 1) {
          goto LABEL_27;
        }
      }
      else
      {
        BOOL v12 = 0;
        if ((unint64_t)[v19 length] > 4 || v21 > 1) {
          goto LABEL_27;
        }
      }
      [v20 doubleValue];
      double v25 = v26;
    }
    else
    {
      double v25 = 0.0;
    }
    BOOL v28 = self->_minValue + -0.000001 < v25 && self->_maxValue + 0.000001 > v25 || [v16 length] == 0;
    self->_valueValid = v28;
    [(DBSFineTuneEditTextTableCell *)self setNeedsLayout];
    [(DBSFineTuneEditTextTableCell *)self layoutIfNeeded];
    v29 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FD60]);
    id WeakRetained = objc_loadWeakRetained(v29);
    v31 = WeakRetained;
    v32 = (uint64_t *)((char *)self + (int)*MEMORY[0x263F5FD68]);
    if (*v32) {
      uint64_t v33 = *v32;
    }
    else {
      uint64_t v33 = 0;
    }
    v34 = (void (*)(void *, uint64_t, void *, void *))[WeakRetained methodForSelector:v33];

    v19 = objc_loadWeakRetained(v29);
    if (*v32) {
      uint64_t v35 = *v32;
    }
    else {
      uint64_t v35 = 0;
    }
    uint64_t v20 = [(PSTableCell *)self specifier];
    v34(v19, v35, v16, v20);
    BOOL v12 = 1;
    goto LABEL_27;
  }
LABEL_28:

  return v12;
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)DBSFineTuneEditTextTableCell;
  [(PSEditableTableCell *)&v27 layoutSubviews];
  if (self->_valueValid)
  {
    v3 = [MEMORY[0x263F5FBC0] appearance];
    id v4 = [v3 altTextColor];
    v5 = [(DBSFineTuneEditTextTableCell *)self _accessibilityHigherContrastTintColorForColor:v4];
    [(UILabel *)self->_validationLabel setTextColor:v5];

    BOOL hideIfValid = self->_hideIfValid;
  }
  else
  {
    v7 = [MEMORY[0x263F825C8] systemRedColor];
    [(UILabel *)self->_validationLabel setTextColor:v7];

    BOOL hideIfValid = 0;
  }
  [(UILabel *)self->_validationLabel setHidden:hideIfValid];
  uint64_t v8 = [(DBSFineTuneEditTextTableCell *)self effectiveUserInterfaceLayoutDirection];
  [(UILabel *)self->_validationLabel frame];
  CGFloat v10 = v9;
  -[UILabel sizeThatFits:](self->_validationLabel, "sizeThatFits:", v11, v12);
  double v14 = v13;
  CGFloat v16 = v15;
  v17 = [(PSEditableTableCell *)self textField];
  [v17 frame];
  if (v8)
  {
    double v22 = 100.0;
  }
  else
  {
    CGFloat v18 = CGRectGetMaxX(*(CGRect *)&v18) - v14;
    double v22 = -100.0;
  }
  CGFloat v23 = v18 + v22;

  double v24 = [(PSEditableTableCell *)self textField];
  [v24 frame];
  double MidY = CGRectGetMidY(v28);

  v29.origin.x = v23;
  v29.origin.y = v10;
  v29.size.width = v14;
  v29.size.height = v16;
  CGFloat v26 = MidY - CGRectGetMidY(v29);
  v30.origin.x = v23;
  v30.origin.y = v10;
  v30.size.width = v14;
  v30.size.height = v16;
  CGRect v31 = CGRectOffset(v30, 0.0, v26);
  -[UILabel setFrame:](self->_validationLabel, "setFrame:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
}

- (void).cxx_destruct
{
}

@end