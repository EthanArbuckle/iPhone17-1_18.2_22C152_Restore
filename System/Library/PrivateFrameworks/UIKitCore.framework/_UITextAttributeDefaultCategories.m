@interface _UITextAttributeDefaultCategories
- (NSString)description;
- (_UITextAttributeDefaultCategories)initWithUserInterfaceIdiom:(int64_t)a3;
- (_UITextAttributeDefaults)_generic;
- (_UITextAttributeDefaults)_label;
- (_UITextAttributeDefaults)_textField;
- (_UITextAttributeDefaults)_textView;
- (double)_buttonFontSize;
- (double)_labelFontSize;
- (double)_smallSystemFontSize;
- (double)_systemFontSize;
- (id)_genericDefaults:(int64_t)a3;
- (id)_labelDefaults:(int64_t)a3;
- (id)_textFieldDefaults:(int64_t)a3;
- (id)_textViewDefaults:(int64_t)a3;
@end

@implementation _UITextAttributeDefaultCategories

- (_UITextAttributeDefaults)_label
{
  return self->_label;
}

- (_UITextAttributeDefaultCategories)initWithUserInterfaceIdiom:(int64_t)a3
{
  if (qword_1EB25F450 != -1) {
    dispatch_once(&qword_1EB25F450, &__block_literal_global_92);
  }
  v5 = (void *)_MergedGlobals_982;
  v6 = [NSNumber numberWithInteger:a3];
  v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)_UITextAttributeDefaultCategories;
    v8 = [(_UITextAttributeDefaultCategories *)&v20 init];
    if (v8)
    {
      +[_UITextAttributeDefaults _getFontSizesForUserInterfaceIdiom:a3 labelFontSize:&v8->_labelFontSize buttonFontSize:&v8->_buttonFontSize systemFontSize:&v8->_systemFontSize smallSystemFontSize:&v8->_smallSystemFontSize];
      uint64_t v9 = [(_UITextAttributeDefaultCategories *)v8 _genericDefaults:a3];
      generic = v8->_generic;
      v8->_generic = (_UITextAttributeDefaults *)v9;

      uint64_t v11 = [(_UITextAttributeDefaultCategories *)v8 _labelDefaults:a3];
      label = v8->_label;
      v8->_label = (_UITextAttributeDefaults *)v11;

      uint64_t v13 = [(_UITextAttributeDefaultCategories *)v8 _textFieldDefaults:a3];
      textField = v8->_textField;
      v8->_textField = (_UITextAttributeDefaults *)v13;

      uint64_t v15 = [(_UITextAttributeDefaultCategories *)v8 _textViewDefaults:a3];
      textView = v8->_textView;
      v8->_textView = (_UITextAttributeDefaults *)v15;

      v17 = (void *)_MergedGlobals_982;
      v18 = [NSNumber numberWithInteger:a3];
      [v17 setObject:v8 forKeyedSubscript:v18];
    }
  }

  return v8;
}

- (id)_labelDefaults:(int64_t)a3
{
  id v5 = [[_UITextAttributeDefaults alloc] _initWithFallback:self->_generic];
  if (a3 == 8 || a3 == 2)
  {
    uint64_t v6 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleHeadline"];
  }
  else
  {
    uint64_t v6 = [off_1E52D39B8 systemFontOfSize:self->_labelFontSize];
  }
  v7 = (void *)v6;
  [v5 _setFont:v6];

  v8 = objc_opt_new();
  objc_msgSend(v8, "setShadowOffset:", 0.0, -1.0);
  [v8 setShadowColor:0];
  [v8 setShadowBlurRadius:0.0];
  [v5 _setShadow:v8];

  return v5;
}

- (id)_textFieldDefaults:(int64_t)a3
{
  id v3 = [[_UITextAttributeDefaults alloc] _initWithFallback:self->_label];
  [v3 _setShadow:0];
  return v3;
}

- (id)_textViewDefaults:(int64_t)a3
{
  id v3 = [[_UITextAttributeDefaults alloc] _initWithFallback:self->_generic];
  v4 = [off_1E52D39B8 fontWithName:@"Helvetica" size:12.0];
  [v3 _setFont:v4];

  return v3;
}

- (id)_genericDefaults:(int64_t)a3
{
  id v5 = [[_UITextAttributeDefaults alloc] _init];
  if (a3 == 8 || a3 == 2)
  {
    uint64_t v6 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleHeadline"];
  }
  else
  {
    uint64_t v6 = [off_1E52D39B8 systemFontOfSize:self->_labelFontSize];
  }
  v7 = (void *)v6;
  [v5 _setFont:v6];

  v8 = +[UIColor labelColor];
  [v5 _setTextColor:v8];

  uint64_t v9 = objc_opt_new();
  [v9 setLineBreakMode:4];
  [v9 setLineBreakStrategy:0xFFFFLL];
  if (+[UIView _enableRTL]) {
    uint64_t v10 = 4;
  }
  else {
    uint64_t v10 = 0;
  }
  [v9 setAlignment:v10];
  uint64_t v11 = (void *)[v9 copy];

  [v5 _setParagraphStyle:v11];
  return v5;
}

- (_UITextAttributeDefaults)_textField
{
  return self->_textField;
}

- (_UITextAttributeDefaults)_textView
{
  return self->_textView;
}

- (NSString)description
{
  v33[5] = *(id *)MEMORY[0x1E4F143B8];
  label = self->_label;
  v33[0] = self->_generic;
  v32[0] = @"generic";
  v32[1] = @"label";
  v4 = label;
  id v5 = (_UITextAttributeDefaults *)v33[0];
  uint64_t v6 = v5;
  if (v4 == v5)
  {

LABEL_10:
    uint64_t v9 = (_UITextAttributeDefaults *)@"generic";
    goto LABEL_12;
  }
  if (v5) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
  }
  else
  {
    BOOL v8 = [(_UITextAttributeDefaults *)v4 isEqual:v5];

    if (v8) {
      goto LABEL_10;
    }
  }
  uint64_t v9 = self->_label;
LABEL_12:
  v33[1] = v9;
  v32[2] = @"textField";
  generic = self->_generic;
  uint64_t v11 = self->_textField;
  v12 = generic;
  if (v11 == v12)
  {

    goto LABEL_18;
  }
  uint64_t v13 = v12;
  if (v11 && v12)
  {
    BOOL v14 = [(_UITextAttributeDefaults *)v11 isEqual:v12];

    if (!v14) {
      goto LABEL_20;
    }
LABEL_18:
    textField = (_UITextAttributeDefaults *)@"generic";
    goto LABEL_21;
  }

LABEL_20:
  textField = self->_textField;
LABEL_21:
  v33[2] = textField;
  v32[3] = @"textView";
  v16 = self->_generic;
  v17 = self->_textView;
  v18 = v16;
  if (v17 == v18)
  {

    goto LABEL_27;
  }
  v19 = v18;
  if (v17 && v18)
  {
    BOOL v20 = [(_UITextAttributeDefaults *)v17 isEqual:v18];

    if (!v20) {
      goto LABEL_29;
    }
LABEL_27:
    textView = (_UITextAttributeDefaults *)@"generic";
    goto LABEL_30;
  }

LABEL_29:
  textView = self->_textView;
LABEL_30:
  v33[3] = textView;
  v32[4] = @"fontSizeDefaults";
  v30[0] = @"label";
  v22 = [NSNumber numberWithDouble:self->_labelFontSize];
  v31[0] = v22;
  v30[1] = @"button";
  v23 = [NSNumber numberWithDouble:self->_buttonFontSize];
  v31[1] = v23;
  v30[2] = @"system";
  v24 = [NSNumber numberWithDouble:self->_systemFontSize];
  v31[2] = v24;
  v30[3] = @"smallSystem";
  v25 = [NSNumber numberWithDouble:self->_smallSystemFontSize];
  v31[3] = v25;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:4];
  v33[4] = v26;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:5];
  v28 = +[UIDescriptionBuilder descriptionForObject:self namesAndObjects:v27];

  return (NSString *)v28;
}

- (_UITextAttributeDefaults)_generic
{
  return self->_generic;
}

- (double)_labelFontSize
{
  return self->_labelFontSize;
}

- (double)_buttonFontSize
{
  return self->_buttonFontSize;
}

- (double)_systemFontSize
{
  return self->_systemFontSize;
}

- (double)_smallSystemFontSize
{
  return self->_smallSystemFontSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_generic, 0);
}

@end