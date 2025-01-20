@interface PKPaymentSetupFieldCell
+ (double)minimumCellHeight;
+ (id)paymentSetupFieldCellForField:(id)a3 fromTableView:(id)a4;
+ (id)reuseIdentifier;
- (BOOL)becomeFirstResponder;
- (BOOL)canResignFirstResponder;
- (BOOL)hidePrediction;
- (BOOL)isEnabled;
- (BOOL)isShowingError;
- (BOOL)resignFirstResponder;
- (BOOL)shouldDrawFullWidthSeperator;
- (BOOL)shouldDrawSeperator;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldClear:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)usesCustomInputView;
- (CGRect)_separatorFrame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPaymentSetupField)paymentSetupField;
- (PKPaymentSetupFieldCell)init;
- (PKPaymentSetupFieldCell)initWithSetupField:(id)a3;
- (PKPaymentSetupFieldCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (PKPaymentSetupFieldCellDelegate)delegate;
- (UIColor)editableTextFieldCameraCapturedTextColor;
- (UIColor)editableTextFieldDisabledTextColor;
- (UIColor)editableTextFieldTextColor;
- (double)heightForWidth:(double)a3;
- (double)minimumTextLabelWidth;
- (id)editableTextField;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (id)pk_childrenForAppearance;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)_applyDefaultValues;
- (void)_configureKeyboardAccessories;
- (void)_editableTextFieldDidBeginEditing:(id)a3;
- (void)_editableTextFieldDidEndEditing:(id)a3;
- (void)_editableTextFieldValueChanged:(id)a3;
- (void)_keyboardAccessoryButtonTapped:(id)a3;
- (void)_paymentSetupFieldCurrentValueChangedNotification:(id)a3;
- (void)_pullCurrentValueFromField;
- (void)_pushCurrentValueToField;
- (void)_updateDisplay:(BOOL)a3;
- (void)_updateDisplayForFieldTypeDate:(id)a3;
- (void)_updateDisplayForFieldTypePicker:(id)a3;
- (void)_updateDisplayForFieldTypeText:(id)a3;
- (void)_updateTextFieldStylingWithForceUpdate:(BOOL)a3;
- (void)datePicker:(id)a3 didChangeDate:(id)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)pk_applyAppearance:(id)a3;
- (void)prepareForReuse;
- (void)resetTextFieldStyling;
- (void)setCanResignFirstResponder:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEditableTextFieldCameraCapturedTextColor:(id)a3;
- (void)setEditableTextFieldDisabledTextColor:(id)a3;
- (void)setEditableTextFieldTextColor:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHidePrediction:(BOOL)a3;
- (void)setMinimumTextLabelWidth:(double)a3;
- (void)setPaymentSetupField:(id)a3;
- (void)setShouldDrawFullWidthSeperator:(BOOL)a3;
- (void)setShouldDrawSeperator:(BOOL)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)updatePaymentSetupFieldWithCurrentCellValue;
- (void)updatePaymentSetupFieldWithFormatting;
@end

@implementation PKPaymentSetupFieldCell

- (id)pk_childrenForAppearance
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)pk_applyAppearance:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupFieldCell;
  id v4 = a3;
  [(PKTableViewCell *)&v6 pk_applyAppearance:v4];
  v5 = objc_msgSend(v4, "tintColor", v6.receiver, v6.super_class);

  [(PKPaymentSetupFieldCell *)self setEditableTextFieldCameraCapturedTextColor:v5];
}

+ (id)paymentSetupFieldCellForField:(id)a3 fromTableView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 identifier];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F87B60]];

  if (v9) {
    a1 = (id)objc_opt_class();
  }
  v10 = [v6 identifier];
  int v11 = [v10 isEqualToString:*MEMORY[0x1E4F87B08]];

  if (v11) {
    a1 = (id)objc_opt_class();
  }
  if ([v6 isFieldTypeLabel]) {
    a1 = (id)objc_opt_class();
  }
  if ([v6 isFieldTypePicker])
  {
    v12 = [v6 pickerFieldObject];
    uint64_t v13 = [v12 pickerType];

    if (v13 == 3) {
      a1 = (id)objc_opt_class();
    }
  }
  v14 = [a1 reuseIdentifier];
  id v15 = [v7 dequeueReusableCellWithIdentifier:v14];

  if (!v15) {
    id v15 = objc_alloc_init((Class)a1);
  }
  [v15 setPaymentSetupField:v6];
  v16 = [v6 identifier];
  [v15 setAccessibilityIdentifier:v16];

  return v15;
}

- (PKPaymentSetupFieldCell)init
{
  v3 = [(id)objc_opt_class() reuseIdentifier];
  v33.receiver = self;
  v33.super_class = (Class)PKPaymentSetupFieldCell;
  id v4 = [(PKPaymentSetupFieldCell *)&v33 initWithStyle:0 reuseIdentifier:v3];

  if (v4)
  {
    v5 = objc_alloc_init(PKUITextField);
    textField = v4->_textField;
    v4->_textField = v5;

    [(PKUITextField *)v4->_textField setAllowsTextFromCamera:0];
    id v7 = [(PKPaymentSetupFieldCell *)v4 contentView];
    [v7 addSubview:v4->_textField];

    [(PKPaymentSetupFieldCell *)v4 setEnabled:1];
    [(PKPaymentSetupFieldCell *)v4 setPreservesSuperviewLayoutMargins:0];
    -[PKPaymentSetupFieldCell setLayoutMargins:](v4, "setLayoutMargins:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    v8 = [(PKPaymentSetupFieldCell *)v4 editableTextField];
    [v8 addTarget:v4 action:sel__editableTextFieldDidBeginEditing_ forControlEvents:0x10000];

    int v9 = [(PKPaymentSetupFieldCell *)v4 editableTextField];
    [v9 addTarget:v4 action:sel__editableTextFieldValueChanged_ forControlEvents:0x20000];

    v10 = [(PKPaymentSetupFieldCell *)v4 editableTextField];
    [v10 addTarget:v4 action:sel__editableTextFieldDidEndEditing_ forControlEvents:0x40000];

    [(PKPaymentSetupFieldCell *)v4 setSelectionStyle:0];
    [(PKPaymentSetupFieldCell *)v4 setShouldDrawFullWidthSeperator:0];
    [(PKPaymentSetupFieldCell *)v4 setShouldDrawSeperator:1];
    uint64_t v11 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
    referenceConfiguration = v4->_referenceConfiguration;
    v4->_referenceConfiguration = (UIListContentConfiguration *)v11;

    uint64_t v13 = [(PKPaymentSetupFieldCell *)v4 editableTextField];
    v14 = [v13 inputAssistantItem];
    uint64_t v15 = [v14 leadingBarButtonGroups];
    defaultLeadingBarButtonGroups = v4->_defaultLeadingBarButtonGroups;
    v4->_defaultLeadingBarButtonGroups = (NSArray *)v15;

    v17 = [(PKPaymentSetupFieldCell *)v4 editableTextField];
    v18 = [v17 inputAssistantItem];
    uint64_t v19 = [v18 trailingBarButtonGroups];
    defaultTrailingBarButtonGroups = v4->_defaultTrailingBarButtonGroups;
    v4->_defaultTrailingBarButtonGroups = (NSArray *)v19;

    v21 = [(PKPaymentSetupFieldCell *)v4 editableTextField];
    v22 = [v21 inputAssistantItem];
    uint64_t v23 = [v22 _centerBarButtonGroups];
    defaultCenterBarButtonGroups = v4->_defaultCenterBarButtonGroups;
    v4->_defaultCenterBarButtonGroups = (NSArray *)v23;

    uint64_t v25 = [MEMORY[0x1E4FB1618] labelColor];
    editableTextFieldTextColor = v4->_editableTextFieldTextColor;
    v4->_editableTextFieldTextColor = (UIColor *)v25;

    uint64_t v27 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    editableTextFieldDisabledTextColor = v4->_editableTextFieldDisabledTextColor;
    v4->_editableTextFieldDisabledTextColor = (UIColor *)v27;

    uint64_t v29 = [(PKPaymentSetupFieldCell *)v4 tintColor];
    editableTextFieldCameraCapturedTextColor = v4->_editableTextFieldCameraCapturedTextColor;
    v4->_editableTextFieldCameraCapturedTextColor = (UIColor *)v29;

    v31 = PKProvisioningSecondaryBackgroundColor();
    [(PKPaymentSetupFieldCell *)v4 setBackgroundColor:v31];

    v4->_hidePrediction = 0;
    v4->_canResignFirstResponder = 1;
    v4->_isShowingError = 0;
  }
  return v4;
}

- (PKPaymentSetupFieldCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return -[PKPaymentSetupFieldCell initWithSetupField:](self, "initWithSetupField:", 0, a4);
}

- (PKPaymentSetupFieldCell)initWithSetupField:(id)a3
{
  id v4 = a3;
  v5 = [(PKPaymentSetupFieldCell *)self init];
  id v6 = v5;
  if (v5) {
    [(PKPaymentSetupFieldCell *)v5 setPaymentSetupField:v4];
  }

  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupFieldCell;
  [(PKPaymentSetupFieldCell *)&v4 dealloc];
}

- (void)layoutSubviews
{
  v48.receiver = self;
  v48.super_class = (Class)PKPaymentSetupFieldCell;
  [(PKPaymentSetupFieldCell *)&v48 layoutSubviews];
  v3 = [(PKPaymentSetupFieldCell *)self textLabel];
  objc_super v4 = [(PKPaymentSetupFieldCell *)self editableTextField];
  if (v4)
  {
    v5 = [(PKPaymentSetupFieldCell *)self contentView];
    [v5 bounds];
    double v46 = v7;
    double v47 = v6;
    double v9 = v8;
    double v11 = v10;
    [v3 frame];
    objc_msgSend(v4, "sizeThatFits:", v9, v11);
    int v12 = [(PKPaymentSetupFieldCell *)self _shouldReverseLayoutDirection];
    [(UIListContentConfiguration *)self->_referenceConfiguration directionalLayoutMargins];
    double v16 = v15;
    double v17 = v13;
    double v19 = v18;
    double v20 = v14;
    if (v12) {
      double v21 = v14;
    }
    else {
      double v21 = v13;
    }
    if ([v4 textAlignment] != 2 || v12)
    {
      if (!v12) {
        double v17 = v20;
      }
      [v4 textAlignment];
    }
    double v45 = v47 + v21;
    double v22 = v9 - (v21 + v17);
    double v44 = v11 - (v16 + v19);
    [v3 sizeThatFits:v22];
    double v42 = v23;
    v24 = [(PKPaymentSetupFieldCell *)self traitCollection];
    uint64_t v25 = [v24 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v25);

    double minimumTextLabelWidth = 0.0;
    if (!IsAccessibilityCategory) {
      double minimumTextLabelWidth = self->_minimumTextLabelWidth;
    }
    double v43 = v46 + v16;
    UIRectCenteredYInRect();
    double MaxY = v28;
    double v31 = v30;
    UIRectCenteredYInRect();
    double v34 = v33;
    if (IsAccessibilityCategory)
    {
      double v35 = v45;
      double v36 = v45;
      if (v12)
      {
        v49.origin.x = v45;
        v49.origin.y = v43;
        v49.size.height = v44;
        v49.size.width = v22;
        double v36 = CGRectGetMaxX(v49) - v22;
      }
      objc_msgSend(v3, "setFrame:", v36, v46 + 22.0, v22, v34);
      v50.origin.x = v36;
      v50.origin.y = v46 + 22.0;
      v50.size.width = v22;
      v50.size.height = v34;
      double MaxY = CGRectGetMaxY(v50);
    }
    else
    {
      double v37 = v32;
      double v38 = fmin(fmax(v42, minimumTextLabelWidth), v22 + -122.0);
      double v35 = v45;
      if (v12)
      {
        v51.origin.x = v45;
        v51.origin.y = v43;
        v51.size.height = v44;
        v51.size.width = v22;
        CGFloat MaxX = CGRectGetMaxX(v51);
        CGFloat v40 = MaxX - v38;
        objc_msgSend(v3, "setFrame:", MaxX - v38, v37, v38, v34);
        double v22 = v40 - v45 + -22.0;
      }
      else
      {
        objc_msgSend(v3, "setFrame:", v45, v32, v38, v33);
        v52.origin.x = v45;
        v52.origin.y = v37;
        v52.size.width = v38;
        v52.size.height = v34;
        CGFloat v41 = CGRectGetMaxX(v52) + 22.0;
        v53.origin.x = v45;
        v53.origin.y = v43;
        v53.size.height = v44;
        v53.size.width = v22;
        double v22 = CGRectGetMaxX(v53) - v41;
        double v35 = v41;
      }
    }
    objc_msgSend(v4, "setFrame:", v35, MaxY, v22, v31);
  }
}

- (BOOL)usesCustomInputView
{
  if ([(PKPaymentSetupField *)self->_paymentSetupField isFieldTypeDate]) {
    return 1;
  }
  paymentSetupField = self->_paymentSetupField;

  return [(PKPaymentSetupField *)paymentSetupField isFieldTypePicker];
}

- (void)setPaymentSetupField:(id)a3
{
  v5 = (PKPaymentSetupField *)a3;
  p_paymentSetupField = &self->_paymentSetupField;
  paymentSetupField = self->_paymentSetupField;
  if (paymentSetupField != v5)
  {
    double v11 = v5;
    double v8 = (void *)MEMORY[0x1E4F87AD8];
    if (paymentSetupField)
    {
      double v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 removeObserver:self name:*v8 object:*p_paymentSetupField];
    }
    objc_storeStrong((id *)&self->_paymentSetupField, a3);
    if (*p_paymentSetupField)
    {
      double v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v10 addObserver:self selector:sel__paymentSetupFieldCurrentValueChangedNotification_ name:*v8 object:*p_paymentSetupField];
    }
    [(PKPaymentSetupFieldCell *)self _updateDisplay:1];
    v5 = v11;
  }
}

- (void)setMinimumTextLabelWidth:(double)a3
{
  if (self->_minimumTextLabelWidth != a3)
  {
    self->_double minimumTextLabelWidth = a3;
    [(PKPaymentSetupFieldCell *)self setNeedsLayout];
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    if ([(PKPaymentSetupField *)self->_paymentSetupField source] == 1
      && [(PKPaymentSetupFieldCell *)self isEnabled])
    {
      id v6 = [(PKPaymentSetupFieldCell *)self editableTextField];
      [v6 setTextColor:self->_editableTextFieldCameraCapturedTextColor];
    }
    else
    {
      id v6 = [(PKPaymentSetupFieldCell *)self editableTextField];
      BOOL v4 = [(PKPaymentSetupFieldCell *)self isEnabled];
      uint64_t v5 = 6;
      if (v4) {
        uint64_t v5 = 5;
      }
      [v6 setTextColor:*(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___PKPaymentSetupFieldCell__textField[v5])];
    }
  }
}

- (void)setHidePrediction:(BOOL)a3
{
  if (self->_hidePrediction != a3)
  {
    self->_hidePrediction = a3;
    id v4 = [(PKPaymentSetupFieldCell *)self editableTextField];
    [v4 setHidePrediction:self->_hidePrediction];
  }
}

- (void)setEditableTextFieldCameraCapturedTextColor:(id)a3
{
  id v4 = (UIColor *)a3;
  uint64_t v5 = v4;
  if (self->_editableTextFieldCameraCapturedTextColor != v4)
  {
    double v11 = v4;
    id v6 = (UIColor *)[(UIColor *)v4 copy];
    editableTextFieldCameraCapturedTextColor = self->_editableTextFieldCameraCapturedTextColor;
    self->_editableTextFieldCameraCapturedTextColor = v6;

    uint64_t v8 = [(PKPaymentSetupField *)self->_paymentSetupField source];
    uint64_t v5 = v11;
    if (v8 == 1)
    {
      BOOL v9 = [(PKPaymentSetupFieldCell *)self isEnabled];
      uint64_t v5 = v11;
      if (v9)
      {
        double v10 = [(PKPaymentSetupFieldCell *)self editableTextField];
        [v10 setTextColor:self->_editableTextFieldCameraCapturedTextColor];

        uint64_t v5 = v11;
      }
    }
  }
}

- (void)_updateDisplay:(BOOL)a3
{
  if (a3) {
    [(PKPaymentSetupFieldCell *)self _applyDefaultValues];
  }
  uint64_t v4 = PKUIGetMinScreenWidthType();
  paymentSetupField = self->_paymentSetupField;
  if (v4) {
    [(PKPaymentSetupField *)paymentSetupField localizedDisplayName];
  }
  else {
  id v6 = [(PKPaymentSetupField *)paymentSetupField compactLocalizedDisplayName];
  }
  double v7 = [(PKPaymentSetupFieldCell *)self textLabel];
  [v7 setText:v6];

  uint64_t v8 = [(PKPaymentSetupField *)self->_paymentSetupField localizedPlaceholder];
  BOOL v9 = [(PKPaymentSetupFieldCell *)self editableTextField];
  [v9 setPlaceholder:v8];

  double v10 = [(PKPaymentSetupFieldCell *)self editableTextField];
  [v10 setDelegate:self];

  int v11 = [(PKPaymentSetupField *)self->_paymentSetupField isFieldTypeText];
  int v12 = self->_paymentSetupField;
  if (v11)
  {
    double v13 = [(PKPaymentSetupField *)v12 textFieldObject];
    [(PKPaymentSetupFieldCell *)self _updateDisplayForFieldTypeText:v13];
  }
  else
  {
    int v14 = [(PKPaymentSetupField *)v12 isFieldTypeDate];
    double v15 = self->_paymentSetupField;
    if (v14)
    {
      double v13 = [(PKPaymentSetupField *)v15 dateFieldObject];
      [(PKPaymentSetupFieldCell *)self _updateDisplayForFieldTypeDate:v13];
    }
    else
    {
      int v16 = [(PKPaymentSetupField *)v15 isFieldTypePicker];
      double v17 = self->_paymentSetupField;
      if (v16)
      {
        double v13 = [(PKPaymentSetupField *)v17 pickerFieldObject];
        [(PKPaymentSetupFieldCell *)self _updateDisplayForFieldTypePicker:v13];
      }
      else
      {
        if ([(PKPaymentSetupField *)v17 fieldType]) {
          goto LABEL_13;
        }
        double v13 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)double v19 = 0;
          _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "Error: PKPaymentSetupFieldTypeUnknown field type cells are not currently supported!", v19, 2u);
        }
      }
    }
  }

LABEL_13:
  double v18 = [(PKPaymentSetupFieldCell *)self editableTextField];
  objc_msgSend(v18, "setIsAccessibilityElement:", -[PKPaymentSetupField preventVoiceOver](self->_paymentSetupField, "preventVoiceOver") ^ 1);

  [(PKPaymentSetupFieldCell *)self _pullCurrentValueFromField];
}

- (void)_applyDefaultValues
{
  v3 = (NSString *)*MEMORY[0x1E4FB28C8];
  uint64_t v4 = (NSString *)*MEMORY[0x1E4FB27B0];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB27B0], 2, 0);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [(PKPaymentSetupFieldCell *)self textLabel];
  [v5 setFont:v17];
  [v5 setBaselineAdjustment:1];
  [v5 setAdjustsFontSizeToFitWidth:1];
  [v5 setText:0];
  id v6 = PKFontForDefaultDesign(v3, v4);
  double v7 = [(PKPaymentSetupFieldCell *)self editableTextField];
  [v7 setFont:v6];
  [v7 setText:0];
  [v7 setSecureTextEntry:0];
  [v7 setDisplaySecureTextUsingPlainText:0];
  uint64_t v8 = PKLocalizedPaymentString(&cfstr_Required.isa);
  [v7 setPlaceholder:v8];

  [v7 setClearButtonMode:1];
  [v7 setAutocorrectionType:1];
  [v7 setAutocapitalizationType:1];
  [v7 setKeyboardType:0];
  [v7 setInputView:0];
  [v7 setAdjustsFontForContentSizeCategory:1];
  [v7 setHidePrediction:self->_hidePrediction];
  BOOL v9 = [v7 inputAssistantItem];
  [v9 setTrailingBarButtonGroups:self->_defaultTrailingBarButtonGroups];
  [v9 setLeadingBarButtonGroups:self->_defaultLeadingBarButtonGroups];
  [v9 _setCenterBarButtonGroups:self->_defaultCenterBarButtonGroups];
  if ([(PKPaymentSetupField *)self->_paymentSetupField source] == 1
    && [(PKPaymentSetupFieldCell *)self isEnabled])
  {
    double v10 = &OBJC_IVAR___PKPaymentSetupFieldCell__editableTextFieldCameraCapturedTextColor;
  }
  else
  {
    BOOL v11 = [(PKPaymentSetupFieldCell *)self isEnabled];
    uint64_t v12 = 6;
    if (v11) {
      uint64_t v12 = 5;
    }
    double v10 = &OBJC_IVAR___PKPaymentSetupFieldCell__textField[v12];
  }
  [v7 setTextColor:*(Class *)((char *)&self->super.super.super.super.super.isa + *v10)];
  dateInputView = self->_dateInputView;
  if (dateInputView)
  {
    [(PKDatePicker *)dateInputView setDelegate:0];
    int v14 = self->_dateInputView;
    self->_dateInputView = 0;
  }
  pickerInputView = self->_pickerInputView;
  if (pickerInputView)
  {
    [(UIPickerView *)pickerInputView setDelegate:0];
    [(UIPickerView *)self->_pickerInputView setDataSource:0];
    int v16 = self->_pickerInputView;
    self->_pickerInputView = 0;
  }
}

- (void)_updateDisplayForFieldTypeText:(id)a3
{
  id v24 = a3;
  uint64_t v4 = [(PKPaymentSetupFieldCell *)self editableTextField];
  uint64_t v5 = [v24 displayString];
  [v4 setText:v5];

  if ([v24 isNumericFractional])
  {
    uint64_t v6 = 8;
  }
  else if ([v24 isNumeric])
  {
    uint64_t v6 = 11;
  }
  else
  {
    uint64_t v6 = 0;
  }
  double v7 = [v24 identifier];
  if ([v7 isEqualToString:*MEMORY[0x1E4F87B18]])
  {
    uint64_t v8 = (id *)MEMORY[0x1E4FB2F98];
LABEL_18:
    id v9 = *v8;
    uint64_t v10 = 0;
    goto LABEL_19;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F87B60]])
  {
    uint64_t v8 = (id *)MEMORY[0x1E4FB2F60];
    goto LABEL_18;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F87B50]])
  {
    id v9 = (id)*MEMORY[0x1E4FB2FD8];
    uint64_t v10 = 1;
    uint64_t v6 = 5;
    goto LABEL_19;
  }
  if (([v7 isEqualToString:*MEMORY[0x1E4F87B78]] & 1) != 0
    || [v7 isEqualToString:*MEMORY[0x1E4F87AE8]])
  {
    uint64_t v8 = (id *)MEMORY[0x1E4FB2FC0];
    goto LABEL_18;
  }
  if (([v7 isEqualToString:*MEMORY[0x1E4F87B80]] & 1) != 0
    || [v7 isEqualToString:*MEMORY[0x1E4F87AF0]])
  {
    uint64_t v8 = (id *)MEMORY[0x1E4FB2FC8];
    goto LABEL_18;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F87B88]])
  {
    uint64_t v8 = (id *)MEMORY[0x1E4FB2FD0];
    goto LABEL_18;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F87B58]])
  {
    uint64_t v8 = (id *)MEMORY[0x1E4FB2FB8];
    goto LABEL_18;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F87B20]])
  {
    uint64_t v8 = (id *)MEMORY[0x1E4FB2F50];
    goto LABEL_18;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F87B70]])
  {
    uint64_t v8 = (id *)MEMORY[0x1E4FB2F58];
    goto LABEL_18;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F87B38]])
  {
    uint64_t v8 = (id *)MEMORY[0x1E4FB2F88];
    goto LABEL_18;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F87B40]])
  {
    uint64_t v8 = (id *)MEMORY[0x1E4FB2F78];
    goto LABEL_18;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F87B30]])
  {
    uint64_t v8 = (id *)MEMORY[0x1E4FB2F68];
    goto LABEL_18;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F87B90]])
  {
    id v9 = 0;
    uint64_t v10 = 0;
    uint64_t v6 = 8;
  }
  else
  {
    id v9 = 0;
    uint64_t v10 = 0;
    if ([v7 isEqualToString:*MEMORY[0x1E4F87B48]]) {
      uint64_t v6 = 8;
    }
  }
LABEL_19:
  unsigned int v11 = [v24 isSecureText];
  unsigned int v12 = [v24 isSecureVisibleText];
  int v13 = PKSensitiveFieldBroadcastingEnabled();
  uint64_t v14 = (v13 ^ 1) & v11;
  uint64_t v15 = (v13 ^ 1) & v12;
  int v16 = [(PKPaymentSetupFieldCell *)self _shouldReverseLayoutDirection];
  uint64_t v17 = [v4 textAlignment];
  uint64_t v18 = [v4 clearButtonMode];
  uint64_t v19 = [v24 alignment];
  uint64_t v20 = 2;
  if (v16) {
    uint64_t v20 = 0;
  }
  uint64_t v21 = 2;
  if (!v16) {
    uint64_t v21 = 0;
  }
  if (v19 != 1) {
    uint64_t v21 = v17;
  }
  if (v19 == 2) {
    uint64_t v22 = v20;
  }
  else {
    uint64_t v22 = v21;
  }
  if (v19 == 2) {
    uint64_t v23 = 0;
  }
  else {
    uint64_t v23 = v18;
  }
  [v4 setKeyboardType:v6];
  [v4 setTextContentType:v9];
  [v4 setContentsIsSingleValue:v10];
  [v4 setSecureTextEntry:v14];
  [v4 setDisplaySecureTextUsingPlainText:v15];
  [v4 setSmartInsertDeleteType:1];
  [v4 setTextAlignment:v22];
  [v4 setClearButtonMode:v23];
  if ((v14 & v15) == 1) {
    [v4 setAutocapitalizationType:1];
  }
  objc_msgSend(v4, "pkui_setExcludedFromScreenCapture:andBroadcasting:", v14 & v15, v14 & v15);
  if ([v24 hasDisplayFormat]) {
    [v4 setAutocapitalizationType:3];
  }
}

- (void)_updateDisplayForFieldTypeDate:(id)a3
{
  id v31 = a3;
  if (!self->_dateInputView)
  {
    uint64_t v4 = objc_alloc_init(PKDatePicker);
    dateInputView = self->_dateInputView;
    self->_dateInputView = v4;
  }
  uint64_t v6 = [(PKPaymentSetupFieldCell *)self editableTextField];
  uint64_t v7 = 1;
  [v6 setSecureTextEntry:1];

  uint64_t v8 = [(PKPaymentSetupFieldCell *)self editableTextField];
  [v8 setDisplaySecureTextUsingPlainText:1];

  -[UIView pkui_setExcludedFromScreenCapture:andBroadcasting:](self->_dateInputView, "pkui_setExcludedFromScreenCapture:andBroadcasting:", [v31 isSecureText], objc_msgSend(v31, "isSecureText"));
  id v9 = self->_dateInputView;
  uint64_t v10 = [(PKPaymentSetupFieldCell *)self editableTextField];
  -[PKDatePicker setUsesDarkAppearance:](v9, "setUsesDarkAppearance:", [(id)v10 keyboardAppearance] == 1);

  unsigned int v11 = [v31 identifier];
  LOBYTE(v10) = [v11 isEqualToString:*MEMORY[0x1E4F87B00]];

  if ((v10 & 1) == 0)
  {
    unsigned int v12 = [v31 identifier];
    int v13 = [v12 isEqualToString:*MEMORY[0x1E4F87B28]];

    if (v13) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  uint64_t v14 = self->_dateInputView;
  uint64_t v15 = [v31 showsDay];
  uint64_t v16 = [v31 showsMonth];
  uint64_t v17 = [v31 showsYear];
  uint64_t v18 = [v31 locale];
  uint64_t v19 = [v31 calendar];
  [(PKDatePicker *)v14 reconfigureToShowDay:v15 month:v16 year:v17 style:v7 locale:v18 calendar:v19];

  [(PKDatePicker *)self->_dateInputView setDelegate:self];
  uint64_t v20 = self->_dateInputView;
  uint64_t v21 = [(PKTableViewCell *)self customAccessoryColor];
  if (v21)
  {
    [(PKDatePicker *)v20 setBackgroundColor:v21];
  }
  else
  {
    uint64_t v22 = [(PKPaymentSetupFieldCell *)self backgroundColor];
    [(PKDatePicker *)v20 setBackgroundColor:v22];
  }
  uint64_t v23 = [(PKPaymentSetupFieldCell *)self editableTextField];
  [v23 setInputView:self->_dateInputView];

  id v24 = [(PKPaymentSetupFieldCell *)self editableTextField];
  uint64_t v25 = [v24 inputAssistantItem];
  uint64_t v26 = MEMORY[0x1E4F1CBF0];
  [v25 setTrailingBarButtonGroups:MEMORY[0x1E4F1CBF0]];

  uint64_t v27 = [(PKPaymentSetupFieldCell *)self editableTextField];
  double v28 = [v27 inputAssistantItem];
  [v28 _setCenterBarButtonGroups:v26];

  uint64_t v29 = [(PKPaymentSetupFieldCell *)self editableTextField];
  double v30 = [v29 inputAssistantItem];
  [v30 setLeadingBarButtonGroups:v26];
}

- (void)_updateDisplayForFieldTypePicker:(id)a3
{
  id v19 = a3;
  if (!self->_pickerInputView)
  {
    uint64_t v4 = (UIPickerView *)objc_alloc_init(MEMORY[0x1E4FB1A98]);
    pickerInputView = self->_pickerInputView;
    self->_pickerInputView = v4;
  }
  uint64_t v6 = [(PKPaymentSetupFieldCell *)self editableTextField];
  [v6 setSecureTextEntry:1];

  uint64_t v7 = [(PKPaymentSetupFieldCell *)self editableTextField];
  [v7 setDisplaySecureTextUsingPlainText:1];

  [(UIPickerView *)self->_pickerInputView setDelegate:self];
  [(UIPickerView *)self->_pickerInputView setDataSource:self];
  uint64_t v8 = self->_pickerInputView;
  id v9 = [(PKTableViewCell *)self customAccessoryColor];
  if (v9)
  {
    [(UIPickerView *)v8 setBackgroundColor:v9];
  }
  else
  {
    uint64_t v10 = [(PKPaymentSetupFieldCell *)self backgroundColor];
    [(UIPickerView *)v8 setBackgroundColor:v10];
  }
  unsigned int v11 = [(PKPaymentSetupFieldCell *)self editableTextField];
  [v11 setInputView:self->_pickerInputView];

  unsigned int v12 = [(PKPaymentSetupFieldCell *)self editableTextField];
  int v13 = [v12 inputAssistantItem];
  uint64_t v14 = MEMORY[0x1E4F1CBF0];
  [v13 setTrailingBarButtonGroups:MEMORY[0x1E4F1CBF0]];

  uint64_t v15 = [(PKPaymentSetupFieldCell *)self editableTextField];
  uint64_t v16 = [v15 inputAssistantItem];
  [v16 _setCenterBarButtonGroups:v14];

  uint64_t v17 = [(PKPaymentSetupFieldCell *)self editableTextField];
  uint64_t v18 = [v17 inputAssistantItem];
  [v18 setLeadingBarButtonGroups:v14];
}

- (void)_paymentSetupFieldCurrentValueChangedNotification:(id)a3
{
  if (!self->_ignoreCurrentValueChangedNotifications)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__PKPaymentSetupFieldCell__paymentSetupFieldCurrentValueChangedNotification___block_invoke;
    block[3] = &unk_1E59CA7D0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __77__PKPaymentSetupFieldCell__paymentSetupFieldCurrentValueChangedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDisplay:0];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(PKPaymentSetupFieldCell *)self traitCollection];
  uint64_t v7 = [v6 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

  PKFloatCeilToPixel();
  double v10 = v9;
  double v11 = width + PKTableViewCellTextInset() * -2.0;
  [(PKPaymentSetupFieldCell *)self layoutMargins];
  double v14 = height - (v12 + v13);
  if (IsAccessibilityCategory)
  {
    double v11 = v11 + -22.0;
    uint64_t v15 = [(PKPaymentSetupFieldCell *)self editableTextField];
    objc_msgSend(v15, "sizeThatFits:", v11, v14);

    PKFloatCeilToPixel();
    double v17 = v16 + 0.0 + 20.0;
  }
  else
  {
    double v17 = 0.0;
  }
  uint64_t v18 = [(PKPaymentSetupFieldCell *)self textLabel];
  objc_msgSend(v18, "pkui_sizeThatFits:forceWordWrap:", 1, v11, v14);

  PKFloatCeilToPixel();
  double v20 = v17 + v19 + 20.0;
  [(id)objc_opt_class() minimumCellHeight];
  if (v20 <= v21)
  {
    [(id)objc_opt_class() minimumCellHeight];
    double v20 = v22;
  }
  double v23 = v10;
  double v24 = v20;
  result.double height = v24;
  result.double width = v23;
  return result;
}

+ (double)minimumCellHeight
{
  return 44.0;
}

- (double)heightForWidth:(double)a3
{
  -[PKPaymentSetupFieldCell sizeThatFits:](self, "sizeThatFits:", a3, 3.40282347e38);
  return v3;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupFieldCell;
  [(PKTableViewCell *)&v3 prepareForReuse];
  [(PKPaymentSetupFieldCell *)self _updateDisplay:1];
  [(PKPaymentSetupFieldCell *)self setEnabled:1];
}

- (BOOL)becomeFirstResponder
{
  objc_super v3 = [(PKPaymentSetupFieldCell *)self editableTextField];

  if (v3)
  {
    uint64_t v4 = [(PKPaymentSetupFieldCell *)self editableTextField];
    char v5 = [v4 becomeFirstResponder];

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PKPaymentSetupFieldCell;
    return [(PKPaymentSetupFieldCell *)&v7 becomeFirstResponder];
  }
}

- (void)setCanResignFirstResponder:(BOOL)a3
{
  self->_canResignFirstResponder = a3;
}

- (BOOL)canResignFirstResponder
{
  return self->_canResignFirstResponder;
}

- (BOOL)resignFirstResponder
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSetupFieldCell;
  unsigned __int8 v3 = [(PKPaymentSetupFieldCell *)&v8 resignFirstResponder];
  uint64_t v4 = [(PKPaymentSetupFieldCell *)self editableTextField];
  int v5 = [v4 isUserInteractionEnabled];

  if (v5)
  {
    uint64_t v6 = [(PKPaymentSetupFieldCell *)self editableTextField];
    unsigned __int8 v3 = [v6 resignFirstResponder];
  }
  return v3;
}

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (CGRect)_separatorFrame
{
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentSetupFieldCell;
  [(PKPaymentSetupFieldCell *)&v15 _separatorFrame];
  if (self->_shouldDrawSeperator)
  {
    double v5 = v3;
    double v6 = v4;
    if (self->_shouldDrawFullWidthSeperator)
    {
      [(PKPaymentSetupFieldCell *)self bounds];
      double Width = CGRectGetWidth(v16);
      double v8 = 0.0;
    }
    else
    {
      [(UIListContentConfiguration *)self->_referenceConfiguration directionalLayoutMargins];
      double v10 = v9;
      int v11 = [(PKPaymentSetupFieldCell *)self _shouldReverseLayoutDirection];
      [(PKPaymentSetupFieldCell *)self bounds];
      CGRectGetWidth(v17);
      if (v11) {
        double v8 = 0.0;
      }
      else {
        double v8 = v10;
      }
      [(PKPaymentSetupFieldCell *)self bounds];
      double Width = CGRectGetWidth(v18) - v10;
    }
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DB28];
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double Width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v12 = v8;
  double v13 = v5;
  double v14 = v6;
  result.size.double height = v14;
  result.size.double width = Width;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)editableTextField
{
  return self->_textField;
}

- (void)updatePaymentSetupFieldWithCurrentCellValue
{
  [(PKPaymentSetupFieldCell *)self _pushCurrentValueToField];

  [(PKPaymentSetupFieldCell *)self _pullCurrentValueFromField];
}

- (void)updatePaymentSetupFieldWithFormatting
{
  id v6 = [(PKPaymentSetupField *)self->_paymentSetupField textFieldObject];
  double v3 = [(PKPaymentSetupFieldCell *)self editableTextField];
  double v4 = [v3 text];
  double v5 = [v6 stringByApplyingDisplayFormat:v4 allowPartialFractional:0];

  [v3 setText:v5];
  [v3 sendActionsForControlEvents:0x20000];
}

- (void)_updateTextFieldStylingWithForceUpdate:(BOOL)a3
{
  if (self->_shouldUpdateTextFieldStyling || a3)
  {
    id v14 = [(PKPaymentSetupFieldCell *)self editableTextField];
    double v5 = [v14 text];
    uint64_t v6 = [v5 length];

    if (v6)
    {
      char v7 = [(PKPaymentSetupField *)self->_paymentSetupField isReadonly];
      int v8 = [(PKPaymentSetupField *)self->_paymentSetupField isOptional];
      char v9 = [(PKPaymentSetupField *)self->_paymentSetupField submissionStringMeetsAllRequirements];
      char v10 = [(PKPaymentSetupField *)self->_paymentSetupField submissionStringMeetsValidationRegex];
      if (v8) {
        char v11 = v10;
      }
      else {
        char v11 = v9;
      }
      if (v7 & 1) != 0 || (v11)
      {
        self->_isShowingError = 0;
        uint64_t v12 = [MEMORY[0x1E4FB1618] labelColor];
      }
      else
      {
        self->_isShowingError = 1;
        uint64_t v12 = [MEMORY[0x1E4FB1618] systemRedColor];
      }
      double v13 = (void *)v12;
      [v14 setTextColor:v12];
    }
    else
    {
      [(PKPaymentSetupFieldCell *)self resetTextFieldStyling];
    }
  }
}

- (void)resetTextFieldStyling
{
  id v4 = [(PKPaymentSetupFieldCell *)self editableTextField];
  double v3 = [MEMORY[0x1E4FB1618] labelColor];
  [v4 setTextColor:v3];

  self->_shouldUpdateTextFieldStyling = 0;
  self->_isShowingError = 0;
}

- (void)_pushCurrentValueToField
{
  self->_ignoreCurrentValueChangedNotifications = 1;
  int v3 = [(PKPaymentSetupField *)self->_paymentSetupField isFieldTypeDate];
  paymentSetupField = self->_paymentSetupField;
  if (v3)
  {
    double v5 = [(PKDatePicker *)self->_dateInputView date];
    uint64_t v6 = paymentSetupField;
LABEL_14:
    [(PKPaymentSetupField *)v6 setCurrentValue:v5];
    goto LABEL_15;
  }
  if (![(PKPaymentSetupField *)self->_paymentSetupField isFieldTypePicker])
  {
    char v11 = [(PKPaymentSetupFieldCell *)self editableTextField];
    double v5 = [v11 text];

    uint64_t v12 = [v5 length];
    double v13 = self->_paymentSetupField;
    if (!v12)
    {
LABEL_11:
      uint64_t v15 = 4;
LABEL_12:
      [(PKPaymentSetupField *)v13 setSource:v15];
      goto LABEL_13;
    }
    unint64_t v14 = [(PKPaymentSetupField *)v13 source];
    if (v14 > 4)
    {
LABEL_13:
      uint64_t v6 = self->_paymentSetupField;
      goto LABEL_14;
    }
    if (((1 << v14) & 0x13) != 0)
    {
      double v13 = self->_paymentSetupField;
      goto LABEL_11;
    }
    CGRect v16 = [(PKPaymentSetupField *)self->_paymentSetupField defaultValue];
    id v17 = v5;
    id v18 = v16;
    if (v17 == v18)
    {
    }
    else
    {
      double v19 = v18;
      if (!v17 || !v18)
      {

LABEL_24:
        double v13 = self->_paymentSetupField;
        uint64_t v15 = 3;
        goto LABEL_12;
      }
      int v20 = [v17 isEqualToString:v18];

      if (!v20) {
        goto LABEL_24;
      }
    }
    double v13 = self->_paymentSetupField;
    uint64_t v15 = 2;
    goto LABEL_12;
  }
  char v7 = [(PKPaymentSetupFieldCell *)self paymentSetupField];
  double v5 = [v7 pickerFieldObject];

  unint64_t v8 = [(UIPickerView *)self->_pickerInputView selectedRowInComponent:0];
  char v9 = [v5 pickerItems];
  char v10 = 0;
  if (v8 < [v9 count])
  {
    char v10 = [v9 objectAtIndex:v8];
  }
  [v5 setCurrentValue:v10];

LABEL_15:
  self->_ignoreCurrentValueChangedNotifications = 0;
}

- (void)_pullCurrentValueFromField
{
  int v3 = [(PKPaymentSetupField *)self->_paymentSetupField isFieldTypeDate];
  paymentSetupField = self->_paymentSetupField;
  if (v3)
  {
    double v5 = [(PKPaymentSetupField *)paymentSetupField currentValue];

    uint64_t v6 = [(PKPaymentSetupFieldCell *)self editableTextField];
    char v7 = v6;
    if (v5)
    {
      unint64_t v8 = [(PKPaymentSetupField *)self->_paymentSetupField displayString];
      [v7 setText:v8];
    }
    else
    {
      [v6 setText:0];
    }

    CGRect v16 = [(PKPaymentSetupField *)self->_paymentSetupField currentValue];
    if (v16
      || ([(PKPaymentSetupField *)self->_paymentSetupField dateFieldObject],
          id v18 = objc_claimAutoreleasedReturnValue(),
          [v18 defaultDate],
          CGRect v16 = objc_claimAutoreleasedReturnValue(),
          v18,
          v16))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(PKDatePicker *)self->_dateInputView setDate:v16];
      }
    }
    goto LABEL_13;
  }
  if (![(PKPaymentSetupField *)paymentSetupField isFieldTypePicker])
  {
    CGRect v16 = [(PKPaymentSetupFieldCell *)self editableTextField];
    id v17 = [(PKPaymentSetupField *)self->_paymentSetupField displayString];
    [v16 setText:v17];

LABEL_13:
    goto LABEL_14;
  }
  char v9 = [(PKPaymentSetupField *)self->_paymentSetupField currentValue];

  if (v9)
  {
    char v10 = [(PKPaymentSetupFieldCell *)self editableTextField];
    char v11 = [(PKPaymentSetupField *)self->_paymentSetupField displayString];
    [v10 setText:v11];

    uint64_t v12 = [(PKPaymentSetupField *)self->_paymentSetupField pickerFieldObject];
    double v13 = [v12 pickerItems];
    unint64_t v14 = [(PKPaymentSetupField *)self->_paymentSetupField currentValue];
    uint64_t v15 = [v13 indexOfObject:v14];

    [(UIPickerView *)self->_pickerInputView selectRow:v15 inComponent:0 animated:0];
  }
LABEL_14:
  if ([(PKPaymentSetupField *)self->_paymentSetupField source] == 1
    && [(PKPaymentSetupFieldCell *)self isEnabled])
  {
    id v21 = [(PKPaymentSetupFieldCell *)self editableTextField];
    [v21 setTextColor:self->_editableTextFieldCameraCapturedTextColor];
  }
  else
  {
    id v21 = [(PKPaymentSetupFieldCell *)self editableTextField];
    BOOL v19 = [(PKPaymentSetupFieldCell *)self isEnabled];
    uint64_t v20 = 6;
    if (v19) {
      uint64_t v20 = 5;
    }
    [v21 setTextColor:*(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___PKPaymentSetupFieldCell__textField[v20])];
  }
}

- (void)_editableTextFieldDidBeginEditing:(id)a3
{
  if ([(PKPaymentSetupFieldCell *)self usesCustomInputView]) {
    [(PKPaymentSetupFieldCell *)self updatePaymentSetupFieldWithCurrentCellValue];
  }
  if ([(PKPaymentSetupField *)self->_paymentSetupField isFieldTypeText])
  {
    id v4 = [(PKPaymentSetupFieldCell *)self editableTextField];
    double v5 = [v4 text];
    uint64_t v6 = [v5 length];

    self->_shouldUpdateTextFieldStyling = v6 != 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 fieldCellEditableTextFieldDidBeginEditing:self];
  }
}

- (void)_editableTextFieldDidEndEditing:(id)a3
{
  if ([(PKPaymentSetupField *)self->_paymentSetupField isFieldTypeText]) {
    [(PKPaymentSetupFieldCell *)self _updateTextFieldStylingWithForceUpdate:1];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 fieldCellEditableTextFieldDidEndEditing:self];
  }
}

- (void)_editableTextFieldValueChanged:(id)a3
{
  if (([(PKPaymentSetupField *)self->_paymentSetupField isFieldTypeDate] & 1) == 0
    && ([(PKPaymentSetupField *)self->_paymentSetupField isFieldTypePicker] & 1) == 0)
  {
    [(PKPaymentSetupFieldCell *)self _pushCurrentValueToField];
  }
  if ([(PKPaymentSetupField *)self->_paymentSetupField isFieldTypeText]) {
    [(PKPaymentSetupFieldCell *)self _updateTextFieldStylingWithForceUpdate:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 fieldCellEditableTextFieldValueDidChange:self];
  }
}

- (void)_configureKeyboardAccessories
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  int v3 = [(PKPaymentSetupField *)self->_paymentSetupField textFieldObject];
  id v4 = v3;
  if (v3)
  {
    char v5 = [v3 keyboardAccessories];
    char v6 = PKEqualObjects();

    if ((v6 & 1) == 0)
    {
      char v7 = [v4 keyboardAccessories];
      configuredKeyboardAccessories = self->_configuredKeyboardAccessories;
      self->_configuredKeyboardAccessories = v7;

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector())
      {
        id v10 = objc_loadWeakRetained((id *)&self->_delegate);
        char v11 = objc_opt_respondsToSelector();

        if (v11)
        {
          double v32 = v4;
          id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          uint64_t v12 = [v4 keyboardAccessories];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v35;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v35 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = [*(id *)(*((void *)&v34 + 1) + 8 * i) unsignedIntegerValue];
                id v18 = objc_loadWeakRetained((id *)&self->_delegate);
                int v19 = [v18 fieldCell:self supportsKeyboardAccessory:v17];

                if (v19) {
                  BOOL v20 = v17 == 1;
                }
                else {
                  BOOL v20 = 0;
                }
                if (v20)
                {
                  id v21 = objc_msgSend(MEMORY[0x1E4FB14D8], "pkui_createPlainMinimalButtonConfiguration");
                  double v22 = PKLocalizedPaymentString(&cfstr_ManualEntryCam.isa);
                  [v21 setTitle:v22];

                  double v23 = [MEMORY[0x1E4FB1818] systemImageNamed:@"creditcard.viewfinder"];
                  [v21 setImage:v23];

                  [v21 setImagePlacement:2];
                  [v21 setImagePadding:8.0];
                  double v24 = [MEMORY[0x1E4FB1618] labelColor];
                  [v21 setBaseForegroundColor:v24];

                  uint64_t v25 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
                  [v25 setConfiguration:v21];
                  [v25 addTarget:self action:sel__keyboardAccessoryButtonTapped_ forControlEvents:0x2000];
                  [v25 setTag:1];
                  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v25];
                  [v33 addObject:v26];
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
            }
            while (v14);
          }

          uint64_t v27 = [v33 count];
          id v4 = v32;
          if (v27)
          {
            if (v27 == 1)
            {
              double v28 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
              [v33 insertObject:v28 atIndex:0];

              uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
              [v33 insertObject:v29 atIndex:2];
            }
            id v30 = objc_alloc_init(MEMORY[0x1E4FB1DF0]);
            [v30 setItems:v33];
            [v30 sizeToFit];
            id v31 = [(PKPaymentSetupFieldCell *)self editableTextField];
            [v31 setInputAccessoryView:v30];
          }
        }
      }
      else
      {
      }
    }
  }
}

- (void)_keyboardAccessoryButtonTapped:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "fieldCell:didTapKeyboardAccessory:", self, objc_msgSend(v7, "tag"));
  }
}

- (void)datePicker:(id)a3 didChangeDate:(id)a4
{
  [(PKPaymentSetupFieldCell *)self updatePaymentSetupFieldWithCurrentCellValue];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 fieldCellEditableTextFieldValueDidChange:self];
  }
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  if ([(PKPaymentSetupFieldCell *)self isEnabled]
    && ((id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
         char v5 = objc_opt_respondsToSelector(),
         WeakRetained,
         (v5 & 1) == 0)
     || (id v6 = objc_loadWeakRetained((id *)&self->_delegate),
         int v7 = [v6 fieldCellEditableTextFieldShouldBeginEditing:self],
         v6,
         v7)))
  {
    if ([(PKPaymentSetupField *)self->_paymentSetupField isFieldTypeDate]
      && [(PKPaymentSetupField *)self->_paymentSetupField source] == 1)
    {
      [(PKPaymentSetupField *)self->_paymentSetupField setSource:0];
    }
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }
  [(PKPaymentSetupFieldCell *)self _configureKeyboardAccessories];
  return v8;
}

- (BOOL)textFieldShouldClear:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    int v8 = [v7 fieldCellEditableTextFieldShouldClear:self];

    if (!v8) {
      return 0;
    }
  }
  BOOL v9 = 1;
  self->_ignoreCurrentValueChangedNotifications = 1;
  [(PKPaymentSetupField *)self->_paymentSetupField setCurrentValue:0];
  self->_ignoreCurrentValueChangedNotifications = 0;
  [(PKPaymentSetupField *)self->_paymentSetupField setSource:4];
  [(PKPaymentSetupFieldCell *)self resetTextFieldStyling];
  return v9;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    return 0;
  }
  id v7 = objc_loadWeakRetained((id *)p_delegate);
  char v8 = [v7 fieldCellEditableTextFieldShouldReturn:self];

  return v8;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (([(PKPaymentSetupField *)self->_paymentSetupField isFieldTypeDate] & 1) == 0
    && ([(PKPaymentSetupField *)self->_paymentSetupField isFieldTypePicker] & 1) == 0)
  {
    uint64_t v12 = [v9 text];
    uint64_t v13 = [v12 length];
    uint64_t v14 = (__CFString *)v10;
    uint64_t v15 = [(__CFString *)v14 length];
    v90 = v14;
    unint64_t v91 = v15;
    if (v13)
    {
      *(void *)&v92[4] = v13;
      *(_DWORD *)v92 = 0;
      unint64_t v16 = v15;
    }
    else
    {
      uint64_t v17 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      uint64_t v18 = [(__CFString *)v14 stringByTrimmingCharactersInSet:v17];
      int v19 = v14;
      uint64_t v14 = (__CFString *)v18;

      unint64_t v20 = [(__CFString *)v14 length];
      if (!v20)
      {
        LOBYTE(v11) = 1;
LABEL_100:

        goto LABEL_101;
      }
      unint64_t v16 = v20;
      *(_DWORD *)&v92[8] = 0;
      *(void *)v92 = v20 < v91;
    }
    unint64_t v89 = v16;
    id v21 = [(PKPaymentSetupField *)self->_paymentSetupField textFieldObject];
    uint64_t v22 = [v21 maxLength];
    if (v21) {
      BOOL v23 = v22 == 0;
    }
    else {
      BOOL v23 = 1;
    }
    BOOL v24 = v23 || v16 == 0;
    NSUInteger v93 = length;
    v95 = v21;
    if (v24)
    {
      BOOL v11 = 1;
      if (!v21) {
        goto LABEL_46;
      }
    }
    else
    {
      id obj = (id)v22;
      uint64_t v25 = objc_msgSend(v12, "stringByReplacingCharactersInRange:withString:", location, length, v14);
      char v26 = [v21 keepPaddingCharactersForSubmission];
      if ((v26 & 1) == 0 && [v21 hasDisplayFormat])
      {
        v79 = v14;
        v81 = v12;
        id v83 = v10;
        id v85 = v9;
        long long v104 = 0u;
        long long v105 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        uint64_t v27 = [v21 displayFormatPaddingCharacters];
        uint64_t v28 = [v27 countByEnumeratingWithState:&v102 objects:v107 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v103;
          do
          {
            uint64_t v31 = 0;
            double v32 = v25;
            do
            {
              if (*(void *)v103 != v30) {
                objc_enumerationMutation(v27);
              }
              uint64_t v25 = [v32 stringByReplacingOccurrencesOfString:*(void *)(*((void *)&v102 + 1) + 8 * v31) withString:&stru_1EF1B5B50];

              ++v31;
              double v32 = v25;
            }
            while (v29 != v31);
            uint64_t v29 = [v27 countByEnumeratingWithState:&v102 objects:v107 count:16];
          }
          while (v29);
        }

        id v10 = v83;
        id v9 = v85;
        uint64_t v14 = v79;
        uint64_t v12 = v81;
      }
      BOOL v11 = [v25 length] <= (unint64_t)obj;

      if (!v21)
      {
LABEL_46:
        if (v21 && v11)
        {
          if ([v21 hasDisplayFormat])
          {
            double v42 = [v21 displayFormatPaddingCharacters];
            if (location)
            {
              NSUInteger v43 = v93;
              do
              {
                double v44 = objc_msgSend(v12, "substringWithRange:", location, v43 != 0);
                int v45 = [v42 containsObject:v44];

                if (!v45) {
                  break;
                }
                ++v43;
                --location;
              }
              while (location);
              id v21 = v95;
            }
            else
            {
              NSUInteger v43 = v93;
            }
            id obja = v42;
            if (v14) {
              double v46 = v14;
            }
            else {
              double v46 = &stru_1EF1B5B50;
            }
            uint64_t v47 = objc_msgSend(v12, "stringByReplacingCharactersInRange:withString:", location, v43, v46);
            v87 = [v9 selectedTextRange];
            v78 = (void *)v47;
            objc_super v48 = [v21 stringByApplyingDisplayFormat:v47];
            v88 = v48;
            if ([v21 isNumericFractional]
              && (uint64_t v49 = [v48 length], v49 == objc_msgSend(v12, "length")))
            {
              int v50 = 0;
              BOOL v11 = 1;
              CGRect v51 = v78;
            }
            else
            {
              [v9 setText:v48];
              if ([v12 length] && v43 + location == objc_msgSend(v12, "length"))
              {
                CGRect v52 = [v9 endOfDocument];
              }
              else
              {
                NSUInteger v94 = v43;
                v80 = v14;
                CGRect v53 = [v12 substringToIndex:location];
                if (v91)
                {
                  v54 = [(__CFString *)v90 substringToIndex:1];
                  uint64_t v55 = objc_msgSend(v48, "rangeOfString:options:range:", v54, 0, objc_msgSend(v53, "length"), objc_msgSend(v48, "length") - objc_msgSend(v53, "length"));

                  id v21 = v95;
                  uint64_t v56 = 0;
                  if (v55 != 0x7FFFFFFFFFFFFFFFLL) {
                    uint64_t v56 = v55 - [v53 length];
                  }
                }
                else
                {
                  uint64_t v56 = 0;
                }
                unint64_t v57 = location + v91 + v56;
                if (v57 >= [v48 length]) {
                  unint64_t v57 = [v48 length];
                }
                v58 = [v48 substringToIndex:v57];
                v59 = obja;
                id v84 = v10;
                v86 = v9;
                v82 = v12;
                if ([v21 isNumericFractional])
                {
                  v60 = [v21 decimalSeparator];
                  if (([obja containsObject:v60] & 1) == 0)
                  {
                    uint64_t v61 = [obja arrayByAddingObject:v60];

                    v59 = (void *)v61;
                  }
                }
                long long v100 = 0u;
                long long v101 = 0u;
                long long v98 = 0u;
                long long v99 = 0u;
                id obja = v59;
                uint64_t v62 = [obja countByEnumeratingWithState:&v98 objects:v106 count:16];
                if (v62)
                {
                  uint64_t v63 = v62;
                  uint64_t v64 = 0;
                  uint64_t v65 = 0;
                  uint64_t v66 = *(void *)v99;
                  do
                  {
                    for (uint64_t i = 0; i != v63; ++i)
                    {
                      if (*(void *)v99 != v66) {
                        objc_enumerationMutation(obja);
                      }
                      v68 = *(void **)(*((void *)&v98 + 1) + 8 * i);
                      uint64_t v69 = [v68 length];
                      v70 = [v53 componentsSeparatedByString:v68];
                      v64 += ([v70 count] - 1) * v69;

                      v71 = [v58 componentsSeparatedByString:v68];
                      v65 += ([v71 count] - 1) * v69;
                    }
                    uint64_t v63 = [obja countByEnumeratingWithState:&v98 objects:v106 count:16];
                  }
                  while (v63);
                }
                else
                {
                  uint64_t v64 = 0;
                  uint64_t v65 = 0;
                }

                v72 = [v87 end];
                id v9 = v86;
                CGRect v52 = [v86 positionFromPosition:v72 offset:v89 - v94 - v64 + v65];

                if (!v52)
                {
                  CGRect v52 = [v86 endOfDocument];
                }

                uint64_t v12 = v82;
                id v10 = v84;
                uint64_t v14 = v80;
              }
              CGRect v51 = v78;
              v73 = [v9 textRangeFromPosition:v52 toPosition:v52];
              [v9 setSelectedTextRange:v73];

              [v9 sendActionsForControlEvents:0x20000];
              BOOL v11 = 0;
              int v50 = 1;
              id v21 = v95;
            }

            if (!v50) {
              goto LABEL_98;
            }
          }
          else
          {
            BOOL v11 = 1;
          }
        }
        if ((*(_DWORD *)v92 & v11) != 1 || *(void *)&v92[4] != 0) {
          goto LABEL_99;
        }
        if ([v9 isSecureTextEntry]
          && ![v9 displaySecureTextUsingPlainText])
        {
          LOBYTE(v11) = 1;
          goto LABEL_99;
        }
        [v9 setText:v14];
        v75 = [v9 endOfDocument];
        v76 = [v9 textRangeFromPosition:v75 toPosition:v75];
        [v9 setSelectedTextRange:v76];

        id v21 = v95;
        [v9 sendActionsForControlEvents:0x20000];

LABEL_98:
        LOBYTE(v11) = 0;
LABEL_99:

        goto LABEL_100;
      }
    }
    if (!v11) {
      goto LABEL_46;
    }
    uint64_t v33 = [(PKPaymentSetupField *)self->_paymentSetupField source];
    if ((unint64_t)(v33 - 2) >= 2)
    {
      NSUInteger v36 = v93;
      if (v33 != 1) {
        goto LABEL_38;
      }
      paymentSetupField = self->_paymentSetupField;
    }
    else
    {
      uint64_t v34 = [v12 length];
      paymentSetupField = self->_paymentSetupField;
      NSUInteger v36 = v93;
      if (location || v93 != v34)
      {
        uint64_t v37 = 3;
LABEL_37:
        [(PKPaymentSetupField *)paymentSetupField setSource:v37];
LABEL_38:
        uint64_t v38 = [v12 length];
        if (location || v36 != v38) {
          [(PKPaymentSetupFieldCell *)self _updateTextFieldStylingWithForceUpdate:0];
        }
        else {
          [(PKPaymentSetupFieldCell *)self resetTextFieldStyling];
        }
        uint64_t v39 = [v21 allowedCharacters];
        CGFloat v40 = v39;
        BOOL v11 = 1;
        if (v39 && v14)
        {
          CGFloat v41 = [v39 invertedSet];
          BOOL v11 = [(__CFString *)v14 rangeOfCharacterFromSet:v41 options:0] == 0x7FFFFFFFFFFFFFFFLL;
        }
        id v21 = v95;
        goto LABEL_46;
      }
    }
    uint64_t v37 = 4;
    goto LABEL_37;
  }
  LOBYTE(v11) = 0;
LABEL_101:

  return v11;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = [(PKPaymentSetupField *)self->_paymentSetupField textFieldObject];
  int v5 = [v4 isNumericFractional];

  if (v5)
  {
    [(PKPaymentSetupFieldCell *)self updatePaymentSetupFieldWithFormatting];
  }
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  int v5 = [(PKPaymentSetupFieldCell *)self paymentSetupField];
  int v6 = [v5 isFieldTypePicker];

  if (!v6) {
    return 0;
  }
  id v7 = [(PKPaymentSetupFieldCell *)self paymentSetupField];
  char v8 = [v7 pickerFieldObject];
  id v9 = [v8 pickerItems];
  int64_t v10 = [v9 count];

  return v10;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v7 = [(PKPaymentSetupFieldCell *)self paymentSetupField];
  int v8 = [v7 isFieldTypePicker];

  if (v8)
  {
    id v9 = [(PKPaymentSetupFieldCell *)self paymentSetupField];
    int64_t v10 = [v9 pickerFieldObject];
    BOOL v11 = [v10 pickerItems];
    uint64_t v12 = [v11 objectAtIndex:a4];
    uint64_t v13 = [v12 localizedDisplayName];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  [(PKPaymentSetupFieldCell *)self updatePaymentSetupFieldWithCurrentCellValue];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 fieldCellEditableTextFieldValueDidChange:self];
  }
}

- (PKPaymentSetupFieldCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentSetupFieldCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKPaymentSetupField)paymentSetupField
{
  return self->_paymentSetupField;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (double)minimumTextLabelWidth
{
  return self->_minimumTextLabelWidth;
}

- (BOOL)shouldDrawSeperator
{
  return self->_shouldDrawSeperator;
}

- (void)setShouldDrawSeperator:(BOOL)a3
{
  self->_shouldDrawSeperator = a3;
}

- (BOOL)shouldDrawFullWidthSeperator
{
  return self->_shouldDrawFullWidthSeperator;
}

- (void)setShouldDrawFullWidthSeperator:(BOOL)a3
{
  self->_shouldDrawFullWidthSeperator = a3;
}

- (UIColor)editableTextFieldTextColor
{
  return self->_editableTextFieldTextColor;
}

- (void)setEditableTextFieldTextColor:(id)a3
{
}

- (UIColor)editableTextFieldDisabledTextColor
{
  return self->_editableTextFieldDisabledTextColor;
}

- (void)setEditableTextFieldDisabledTextColor:(id)a3
{
}

- (UIColor)editableTextFieldCameraCapturedTextColor
{
  return self->_editableTextFieldCameraCapturedTextColor;
}

- (BOOL)hidePrediction
{
  return self->_hidePrediction;
}

- (BOOL)isShowingError
{
  return self->_isShowingError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editableTextFieldCameraCapturedTextColor, 0);
  objc_storeStrong((id *)&self->_editableTextFieldDisabledTextColor, 0);
  objc_storeStrong((id *)&self->_editableTextFieldTextColor, 0);
  objc_storeStrong((id *)&self->_paymentSetupField, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_referenceConfiguration, 0);
  objc_storeStrong((id *)&self->_configuredKeyboardAccessories, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_defaultCenterBarButtonGroups, 0);
  objc_storeStrong((id *)&self->_defaultTrailingBarButtonGroups, 0);
  objc_storeStrong((id *)&self->_defaultLeadingBarButtonGroups, 0);
  objc_storeStrong((id *)&self->_pickerInputView, 0);

  objc_storeStrong((id *)&self->_dateInputView, 0);
}

@end