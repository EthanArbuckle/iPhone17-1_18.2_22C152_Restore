@interface SKUITextFieldSettingDescriptionView
+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5;
+ (void)requestLayoutForSettingDescription:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (id)_currentControllerValue;
- (void)_addInputWithElement:(id)a3;
- (void)_addLabelWithElement:(id)a3;
- (void)_addTextInputWithElement:(id)a3;
- (void)_alignView:(id)a3 withBaselineLabel:(id)a4 font:(id)a5 offsetX:(double)a6 fitWidth:(double)a7;
- (void)_arrangeTextField:(id)a3 andLabel:(id)a4;
- (void)_fillLayoutWithView:(id)a3 labelForBaselinePosition:(id)a4;
- (void)_updateTextFieldValue:(id)a3;
- (void)beginEdits;
- (void)commitEdits;
- (void)layoutSubviews;
- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5;
- (void)setEnabled:(BOOL)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)tintColorDidChange;
@end

@implementation SKUITextFieldSettingDescriptionView

- (void)beginEdits
{
}

- (void)commitEdits
{
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUITextFieldSettingDescriptionView setEnabled:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUITextFieldSettingDescriptionView;
  [(SKUIFieldSettingDescriptionView *)&v15 setEnabled:v3];
  textField = self->_textField;
  if (textField)
  {
    [(UITextField *)textField setEnabled:v3];
    double v14 = 0.5;
    if (v3) {
      double v14 = 1.0;
    }
    [(UITextField *)self->_textField setAlpha:v14];
  }
}

+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUITextFieldSettingDescriptionView prefetchResourcesForSettingDescription:reason:context:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  return 0;
}

+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUITextFieldSettingDescriptionView preferredSizeForSettingDescription:context:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  double v12 = *MEMORY[0x1E4F1DB30];
  double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)requestLayoutForSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        +[SKUITextFieldSettingDescriptionView requestLayoutForSettingDescription:width:context:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v16 = [v6 viewElement];
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__14;
  v38 = __Block_byref_object_dispose__14;
  id v39 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__14;
  v32 = __Block_byref_object_dispose__14;
  id v33 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __88__SKUITextFieldSettingDescriptionView_requestLayoutForSettingDescription_width_context___block_invoke;
  v27[3] = &unk_1E64224C0;
  v27[4] = &v34;
  v27[5] = &v28;
  [v16 enumerateChildrenUsingBlock:v27];
  if (v35[5] && v29[5])
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    v18 = [(id)v35[5] text];
    v19 = [v18 string];
    [v17 setText:v19];

    v20 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [v17 setFont:v20];

    objc_msgSend(v17, "sizeThatFits:", 1.0, 1.0);
    double v22 = v21;
    v23 = [v7 aggregateValueForKey:@"SKUITextFieldSettingDescriptionFieldLabelWidthKey"];
    v24 = v23;
    if (v23)
    {
      [v23 doubleValue];
      double v22 = fmax(v22, v25);
    }
    v26 = (void *)[objc_alloc(NSNumber) initWithDouble:v22];
    [v7 setAggregateValue:v26 forKey:@"SKUITextFieldSettingDescriptionFieldLabelWidthKey"];
  }
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
}

void __88__SKUITextFieldSettingDescriptionView_requestLayoutForSettingDescription_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v4 = [v6 elementType];
  if ((unint64_t)(v4 - 139) < 2 || v4 == 58)
  {
    uint64_t v5 = *(void *)(a1 + 40);
  }
  else
  {
    if (v4 != 138) {
      goto LABEL_7;
    }
    uint64_t v5 = *(void *)(a1 + 32);
  }
  objc_storeStrong((id *)(*(void *)(v5 + 8) + 40), a2);
LABEL_7:
}

+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUITextFieldSettingDescriptionView sizeThatFitsWidth:settingDescription:context:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  double v13 = *MEMORY[0x1E4F1DB30];
  double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  objc_storeStrong((id *)&self->_settingDescription, a3);
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v8 viewElement];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__SKUITextFieldSettingDescriptionView_reloadWithSettingDescription_width_context___block_invoke;
  v13[3] = &unk_1E6423570;
  v13[4] = self;
  [v10 enumerateChildrenUsingBlock:v13];
  uint64_t v11 = [v9 aggregateValueForKey:@"SKUITextFieldSettingDescriptionFieldLabelWidthKey"];

  [v11 doubleValue];
  self->_aggregateLabelWidth = v12;
  [(SKUITextFieldSettingDescriptionView *)self setNeedsLayout];
}

void __82__SKUITextFieldSettingDescriptionView_reloadWithSettingDescription_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 elementType];
  if ((unint64_t)(v3 - 139) < 2 || v3 == 58)
  {
    [*(id *)(a1 + 32) _addInputWithElement:v6];
    goto LABEL_7;
  }
  BOOL v4 = v3 == 138;
  BOOL v5 = v6;
  if (v4)
  {
    [*(id *)(a1 + 32) _addLabelWithElement:v6];
LABEL_7:
    BOOL v5 = v6;
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = [a3 text];
  [(SKUITextFieldSettingDescriptionView *)self _updateTextFieldValue:v4];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a5;
  uint64_t v10 = [a3 text];
  uint64_t v11 = objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9);

  [(SKUITextFieldSettingDescriptionView *)self _updateTextFieldValue:v11];
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = [(SKUIFieldSettingDescription *)self->_settingDescription controller];
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    [v4 returnInSettingDescription:self->_settingDescription];
  }

  return 0;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SKUITextFieldSettingDescriptionView;
  [(SKUITextFieldSettingDescriptionView *)&v3 tintColorDidChange];
  [(SKUITextFieldSettingDescriptionView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)SKUITextFieldSettingDescriptionView;
  [(SKUITextFieldSettingDescriptionView *)&v7 layoutSubviews];
  objc_super v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  textField = self->_textField;
  if (self->_label || !textField)
  {
    -[SKUITextFieldSettingDescriptionView _arrangeTextField:andLabel:](self, "_arrangeTextField:andLabel:", textField);
  }
  else
  {
    [(UITextField *)self->_textField setFont:v3];
    BOOL v5 = self->_textField;
    id v6 = [(UITextField *)v5 _placeholderLabel];
    [(SKUITextFieldSettingDescriptionView *)self _fillLayoutWithView:v5 labelForBaselinePosition:v6];
  }
}

- (void)_addInputWithElement:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_inputViewElement, a3);
  if ([v5 isMemberOfClass:objc_opt_class()]) {
    [(SKUITextFieldSettingDescriptionView *)self _addTextInputWithElement:v5];
  }
}

- (void)_addLabelWithElement:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FB1930];
  id v5 = a3;
  id v6 = (UILabel *)objc_alloc_init(v4);
  label = self->_label;
  self->_label = v6;

  id v8 = self->_label;
  id v9 = [v5 text];

  uint64_t v10 = [v9 string];
  [(UILabel *)v8 setText:v10];

  uint64_t v11 = self->_label;
  double v12 = [MEMORY[0x1E4FB1618] blackColor];
  [(UILabel *)v11 setTextColor:v12];

  double v13 = self->_label;

  [(SKUITextFieldSettingDescriptionView *)self addSubview:v13];
}

- (void)_addTextInputWithElement:(id)a3
{
  id v15 = a3;
  id v4 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
  textField = self->_textField;
  self->_textField = v4;

  -[UITextField setSecureTextEntry:](self->_textField, "setSecureTextEntry:", [v15 isSecure]);
  id v6 = self->_textField;
  objc_super v7 = [MEMORY[0x1E4FB1618] blackColor];
  [(UITextField *)v6 setTextColor:v7];

  [(UITextField *)self->_textField setDelegate:self];
  [(UITextField *)self->_textField setAutocorrectionType:1];
  [(UITextField *)self->_textField setAutocapitalizationType:0];
  -[UITextField setKeyboardType:](self->_textField, "setKeyboardType:", [v15 keyboardType]);
  id v8 = [(SKUITextFieldSettingDescriptionView *)self _currentControllerValue];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(UITextField *)self->_textField setText:v8];
  }
  id v9 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v10 = [MEMORY[0x1E4FB1618] lightGrayColor];
  uint64_t v11 = objc_msgSend(v9, "initWithObjectsAndKeys:", v10, *MEMORY[0x1E4FB0700], 0);

  id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
  double v13 = [v15 placeholderText];
  double v14 = (void *)[v12 initWithString:v13 attributes:v11];

  [(UITextField *)self->_textField setAttributedPlaceholder:v14];
  [(SKUITextFieldSettingDescriptionView *)self addSubview:self->_textField];
}

- (void)_alignView:(id)a3 withBaselineLabel:(id)a4 font:(id)a5 offsetX:(double)a6 fitWidth:(double)a7
{
  id v12 = a5;
  id v13 = a4;
  id v27 = a3;
  [(SKUITextFieldSettingDescriptionView *)self bounds];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  [v12 _scaledValueForValue:30.0];
  double v23 = v22;

  [v13 _firstBaselineOffsetFromTop];
  double v25 = v24;

  objc_msgSend(v27, "sizeThatFits:", a7, 1.0);
  SKUIRectByApplyingUserInterfaceLayoutDirectionInRect(a6, v23 - v25, a7, v26, v15, v17, v19, v21);
  objc_msgSend(v27, "setFrame:");
}

- (void)_arrangeTextField:(id)a3 andLabel:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v7 = *MEMORY[0x1E4FB28C8];
  id v8 = a4;
  id v9 = a3;
  id v22 = [v6 preferredFontForTextStyle:v7];
  [(SKUISettingDescriptionView *)self layoutMargins];
  double v11 = v10;
  double v13 = v12;
  [(SKUITextFieldSettingDescriptionView *)self bounds];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  [(SKUITextFieldSettingDescriptionView *)self _alignView:v8 withBaselineLabel:v8 font:v22 offsetX:v11 fitWidth:self->_aggregateLabelWidth];
  v24.origin.x = v15;
  v24.origin.y = v17;
  v24.size.width = v19;
  v24.size.height = v21;
  [(SKUITextFieldSettingDescriptionView *)self _alignView:v9 withBaselineLabel:v8 font:v22 offsetX:v11 + self->_aggregateLabelWidth + 16.0 fitWidth:CGRectGetWidth(v24) - (v11 + self->_aggregateLabelWidth + 16.0) - v13];
}

- (id)_currentControllerValue
{
  objc_super v3 = [(SKUIFieldSettingDescription *)self->_settingDescription controller];
  if ([v3 isMemberOfClass:objc_opt_class()])
  {
    id v4 = [v3 valueForSettingDescription:self->_settingDescription];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_updateTextFieldValue:(id)a3
{
  id v4 = (__CFString *)a3;
  if (!v4) {
    id v4 = &stru_1F1C879E8;
  }
  uint64_t v7 = v4;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v4, @"value", 0);
  [(SKUIInputViewElement *)self->_inputViewElement dispatchEventOfType:15 canBubble:1 isCancelable:1 extraInfo:v5 completionBlock:0];
  id v6 = [(SKUIFieldSettingDescription *)self->_settingDescription controller];
  if ([v6 isMemberOfClass:objc_opt_class()]) {
    [v6 setValue:v7 forSettingDescription:self->_settingDescription];
  }
}

- (void)_fillLayoutWithView:(id)a3 labelForBaselinePosition:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v7 = *MEMORY[0x1E4FB28C8];
  id v8 = a4;
  id v9 = a3;
  id v14 = [v6 preferredFontForTextStyle:v7];
  [(SKUISettingDescriptionView *)self layoutMargins];
  double v11 = v10;
  double v13 = v12;
  [(SKUITextFieldSettingDescriptionView *)self bounds];
  [(SKUITextFieldSettingDescriptionView *)self _alignView:v9 withBaselineLabel:v8 font:v14 offsetX:v11 fitWidth:CGRectGetWidth(v16) - v11 - v13];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_settingDescription, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_inputViewElement, 0);
}

- (void)setEnabled:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)prefetchResourcesForSettingDescription:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)preferredSizeForSettingDescription:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)requestLayoutForSettingDescription:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 settingDescription:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end