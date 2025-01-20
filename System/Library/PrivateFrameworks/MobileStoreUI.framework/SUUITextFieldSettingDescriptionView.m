@interface SUUITextFieldSettingDescriptionView
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

@implementation SUUITextFieldSettingDescriptionView

- (void)beginEdits
{
  textField = self->_textField;
  if (textField) {
    [(UITextField *)textField becomeFirstResponder];
  }
}

- (void)commitEdits
{
  textField = self->_textField;
  if (textField) {
    [(UITextField *)textField resignFirstResponder];
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SUUITextFieldSettingDescriptionView;
  -[SUUIFieldSettingDescriptionView setEnabled:](&v7, sel_setEnabled_);
  textField = self->_textField;
  if (textField)
  {
    [(UITextField *)textField setEnabled:v3];
    double v6 = 0.5;
    if (v3) {
      double v6 = 1.0;
    }
    [(UITextField *)self->_textField setAlpha:v6];
  }
}

+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4
{
  double v4 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  v8 = [v6 viewElement];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__89;
  v30 = __Block_byref_object_dispose__89;
  id v31 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__89;
  v24 = __Block_byref_object_dispose__89;
  id v25 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __88__SUUITextFieldSettingDescriptionView_requestLayoutForSettingDescription_width_context___block_invoke;
  v19[3] = &unk_265407B18;
  v19[4] = &v26;
  v19[5] = &v20;
  [v8 enumerateChildrenUsingBlock:v19];
  if (v27[5] && v21[5])
  {
    id v9 = objc_alloc_init(MEMORY[0x263F828E0]);
    v10 = [(id)v27[5] text];
    v11 = [v10 string];
    [v9 setText:v11];

    v12 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    [v9 setFont:v12];

    objc_msgSend(v9, "sizeThatFits:", 1.0, 1.0);
    double v14 = v13;
    v15 = [v7 aggregateValueForKey:@"SUUITextFieldSettingDescriptionFieldLabelWidthKey"];
    v16 = v15;
    if (v15)
    {
      [v15 doubleValue];
      double v14 = fmax(v14, v17);
    }
    v18 = (void *)[objc_alloc(NSNumber) initWithDouble:v14];
    [v7 setAggregateValue:v18 forKey:@"SUUITextFieldSettingDescriptionFieldLabelWidthKey"];
  }
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
}

void __88__SUUITextFieldSettingDescriptionView_requestLayoutForSettingDescription_width_context___block_invoke(uint64_t a1, void *a2)
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
  double v5 = *MEMORY[0x263F001B0];
  double v6 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  objc_storeStrong((id *)&self->_settingDescription, a3);
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 viewElement];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __82__SUUITextFieldSettingDescriptionView_reloadWithSettingDescription_width_context___block_invoke;
  v13[3] = &unk_2654008B8;
  v13[4] = self;
  [v10 enumerateChildrenUsingBlock:v13];
  v11 = [v9 aggregateValueForKey:@"SUUITextFieldSettingDescriptionFieldLabelWidthKey"];

  [v11 doubleValue];
  self->_aggregateLabelWidth = v12;
  [(SUUITextFieldSettingDescriptionView *)self setNeedsLayout];
}

void __82__SUUITextFieldSettingDescriptionView_reloadWithSettingDescription_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 elementType];
  if ((unint64_t)(v3 - 139) < 2 || v3 == 58)
  {
    [*(id *)(a1 + 32) _addInputWithElement:v6];
    goto LABEL_7;
  }
  BOOL v4 = v3 == 138;
  double v5 = v6;
  if (v4)
  {
    [*(id *)(a1 + 32) _addLabelWithElement:v6];
LABEL_7:
    double v5 = v6;
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = [a3 text];
  [(SUUITextFieldSettingDescriptionView *)self _updateTextFieldValue:v4];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a5;
  v10 = [a3 text];
  v11 = objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9);

  [(SUUITextFieldSettingDescriptionView *)self _updateTextFieldValue:v11];
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = [(SUUIFieldSettingDescription *)self->_settingDescription controller];
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    [v4 returnInSettingDescription:self->_settingDescription];
  }

  return 0;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SUUITextFieldSettingDescriptionView;
  [(SUUITextFieldSettingDescriptionView *)&v3 tintColorDidChange];
  [(SUUITextFieldSettingDescriptionView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)SUUITextFieldSettingDescriptionView;
  [(SUUITextFieldSettingDescriptionView *)&v7 layoutSubviews];
  objc_super v3 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  textField = self->_textField;
  if (self->_label || !textField)
  {
    -[SUUITextFieldSettingDescriptionView _arrangeTextField:andLabel:](self, "_arrangeTextField:andLabel:", textField);
  }
  else
  {
    [(UITextField *)self->_textField setFont:v3];
    double v5 = self->_textField;
    id v6 = [(UITextField *)v5 _placeholderLabel];
    [(SUUITextFieldSettingDescriptionView *)self _fillLayoutWithView:v5 labelForBaselinePosition:v6];
  }
}

- (void)_addInputWithElement:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_inputViewElement, a3);
  if ([v5 isMemberOfClass:objc_opt_class()]) {
    [(SUUITextFieldSettingDescriptionView *)self _addTextInputWithElement:v5];
  }
}

- (void)_addLabelWithElement:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F828E0];
  id v5 = a3;
  id v6 = (UILabel *)objc_alloc_init(v4);
  label = self->_label;
  self->_label = v6;

  id v8 = self->_label;
  id v9 = [v5 text];

  v10 = [v9 string];
  [(UILabel *)v8 setText:v10];

  v11 = self->_label;
  double v12 = [MEMORY[0x263F825C8] blackColor];
  [(UILabel *)v11 setTextColor:v12];

  double v13 = self->_label;
  [(SUUITextFieldSettingDescriptionView *)self addSubview:v13];
}

- (void)_addTextInputWithElement:(id)a3
{
  id v15 = a3;
  id v4 = (UITextField *)objc_alloc_init(MEMORY[0x263F82CF0]);
  textField = self->_textField;
  self->_textField = v4;

  -[UITextField setSecureTextEntry:](self->_textField, "setSecureTextEntry:", [v15 isSecure]);
  id v6 = self->_textField;
  objc_super v7 = [MEMORY[0x263F825C8] blackColor];
  [(UITextField *)v6 setTextColor:v7];

  [(UITextField *)self->_textField setDelegate:self];
  [(UITextField *)self->_textField setAutocorrectionType:1];
  [(UITextField *)self->_textField setAutocapitalizationType:0];
  -[UITextField setKeyboardType:](self->_textField, "setKeyboardType:", [v15 keyboardType]);
  id v8 = [(SUUITextFieldSettingDescriptionView *)self _currentControllerValue];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(UITextField *)self->_textField setText:v8];
  }
  id v9 = objc_alloc(NSDictionary);
  v10 = [MEMORY[0x263F825C8] lightGrayColor];
  v11 = objc_msgSend(v9, "initWithObjectsAndKeys:", v10, *MEMORY[0x263F81500], 0);

  id v12 = objc_alloc(MEMORY[0x263F086A0]);
  double v13 = [v15 placeholderText];
  double v14 = (void *)[v12 initWithString:v13 attributes:v11];

  [(UITextField *)self->_textField setAttributedPlaceholder:v14];
  [(SUUITextFieldSettingDescriptionView *)self addSubview:self->_textField];
}

- (void)_alignView:(id)a3 withBaselineLabel:(id)a4 font:(id)a5 offsetX:(double)a6 fitWidth:(double)a7
{
  id v12 = a5;
  id v13 = a4;
  id v27 = a3;
  [(SUUITextFieldSettingDescriptionView *)self bounds];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  [v12 _scaledValueForValue:30.0];
  double v23 = v22;

  [v13 _firstBaselineOffsetFromTop];
  double v25 = v24;

  objc_msgSend(v27, "sizeThatFits:", a7, 1.0);
  objc_msgSend(v27, "setFrame:", SUUIRectByApplyingUserInterfaceLayoutDirectionInRect(a6, v23 - v25, a7, v26, v15, v17, v19, v21));
}

- (void)_arrangeTextField:(id)a3 andLabel:(id)a4
{
  id v6 = (void *)MEMORY[0x263F81708];
  uint64_t v7 = *MEMORY[0x263F83570];
  id v8 = a4;
  id v9 = a3;
  id v22 = [v6 preferredFontForTextStyle:v7];
  [(SUUISettingDescriptionView *)self layoutMargins];
  double v11 = v10;
  double v13 = v12;
  [(SUUITextFieldSettingDescriptionView *)self bounds];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  [(SUUITextFieldSettingDescriptionView *)self _alignView:v8 withBaselineLabel:v8 font:v22 offsetX:v11 fitWidth:self->_aggregateLabelWidth];
  v24.origin.x = v15;
  v24.origin.y = v17;
  v24.size.width = v19;
  v24.size.height = v21;
  [(SUUITextFieldSettingDescriptionView *)self _alignView:v9 withBaselineLabel:v8 font:v22 offsetX:v11 + self->_aggregateLabelWidth + 16.0 fitWidth:CGRectGetWidth(v24) - (v11 + self->_aggregateLabelWidth + 16.0) - v13];
}

- (id)_currentControllerValue
{
  objc_super v3 = [(SUUIFieldSettingDescription *)self->_settingDescription controller];
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
    id v4 = &stru_2704F8130;
  }
  uint64_t v7 = v4;
  id v5 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v4, @"value", 0);
  [(SUUIInputViewElement *)self->_inputViewElement dispatchEventOfType:15 canBubble:1 isCancelable:1 extraInfo:v5 completionBlock:0];
  id v6 = [(SUUIFieldSettingDescription *)self->_settingDescription controller];
  if ([v6 isMemberOfClass:objc_opt_class()]) {
    [v6 setValue:v7 forSettingDescription:self->_settingDescription];
  }
}

- (void)_fillLayoutWithView:(id)a3 labelForBaselinePosition:(id)a4
{
  id v6 = (void *)MEMORY[0x263F81708];
  uint64_t v7 = *MEMORY[0x263F83570];
  id v8 = a4;
  id v9 = a3;
  id v14 = [v6 preferredFontForTextStyle:v7];
  [(SUUISettingDescriptionView *)self layoutMargins];
  double v11 = v10;
  double v13 = v12;
  [(SUUITextFieldSettingDescriptionView *)self bounds];
  [(SUUITextFieldSettingDescriptionView *)self _alignView:v9 withBaselineLabel:v8 font:v14 offsetX:v11 fitWidth:CGRectGetWidth(v16) - v11 - v13];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_settingDescription, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_inputViewElement, 0);
}

@end