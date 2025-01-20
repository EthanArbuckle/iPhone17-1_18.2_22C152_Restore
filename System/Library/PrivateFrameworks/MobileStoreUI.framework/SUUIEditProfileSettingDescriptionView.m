@interface SUUIEditProfileSettingDescriptionView
+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5;
+ (id)_baselineFontForTextStyle:(id)a3;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (id)_textFieldWithPlaceholder:(id)a3;
- (void)_editProfilePhoto;
- (void)_updateHandleTextFieldValidity;
- (void)layoutSubviews;
- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation SUUIEditProfileSettingDescriptionView

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

+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5
{
  v6 = objc_msgSend(a1, "_baselineFontForTextStyle:", *MEMORY[0x263F83570], a5);
  [v6 _scaledValueForValue:48.0];
  double v8 = v7 + v7;

  double v9 = a3;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  id v40 = a3;
  p_settingDescription = &self->_settingDescription;
  objc_storeStrong((id *)&self->_settingDescription, a3);
  id v9 = a5;
  double v10 = [v9 clientContext];

  clientContext = self->_clientContext;
  self->_clientContext = v10;

  imageView = self->_imageView;
  if (!imageView)
  {
    v13 = objc_alloc_init(SUUIImageView);
    v14 = self->_imageView;
    self->_imageView = v13;

    [(SUUIEditProfileSettingDescriptionView *)self addSubview:self->_imageView];
    imageView = self->_imageView;
  }
  v15 = [(SUUIEditProfileSettingDescription *)*p_settingDescription photo];
  [(SUUIImageView *)imageView setImage:v15];

  if (!self->_editButton)
  {
    v16 = [MEMORY[0x263F824E8] buttonWithType:1];
    editButton = self->_editButton;
    self->_editButton = v16;

    v18 = self->_clientContext;
    if (v18) {
      [(SUUIClientContext *)v18 localizedStringForKey:@"SETTINGS_PROFILE_EDIT_BUTTON_LABEL" inTable:@"Settings"];
    }
    else {
    v19 = +[SUUIClientContext localizedStringForKey:@"SETTINGS_PROFILE_EDIT_BUTTON_LABEL" inBundles:0 inTable:@"Settings"];
    }
    [(UIButton *)self->_editButton setTitle:v19 forState:0];
    [(UIButton *)self->_editButton addTarget:self action:sel__editProfilePhoto forControlEvents:64];
    v20 = [(UIButton *)self->_editButton titleLabel];
    v21 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
    [v20 setFont:v21];

    [(SUUIEditProfileSettingDescriptionView *)self addSubview:self->_editButton];
  }
  nameField = self->_nameField;
  if (!nameField)
  {
    v23 = self->_clientContext;
    if (v23) {
      [(SUUIClientContext *)v23 localizedStringForKey:@"SETTINGS_PROFILE_EDIT_NAME" inTable:@"Settings"];
    }
    else {
    v24 = +[SUUIClientContext localizedStringForKey:@"SETTINGS_PROFILE_EDIT_NAME" inBundles:0 inTable:@"Settings"];
    }
    v25 = [(SUUIEditProfileSettingDescriptionView *)self _textFieldWithPlaceholder:v24];
    v26 = self->_nameField;
    self->_nameField = v25;

    [(UITextField *)self->_nameField setAutocapitalizationType:1];
    [(UITextField *)self->_nameField setAutocorrectionType:1];
    [(SUUIEditProfileSettingDescriptionView *)self addSubview:self->_nameField];
    nameField = self->_nameField;
  }
  v27 = [(SUUIEditProfileSettingDescription *)*p_settingDescription name];
  [(UITextField *)nameField setText:v27];

  handleField = self->_handleField;
  if (!handleField)
  {
    v29 = self->_clientContext;
    if (v29) {
      [(SUUIClientContext *)v29 localizedStringForKey:@"SETTINGS_PROFILE_EDIT_HANDLE" inTable:@"Settings"];
    }
    else {
    v30 = +[SUUIClientContext localizedStringForKey:@"SETTINGS_PROFILE_EDIT_HANDLE" inBundles:0 inTable:@"Settings"];
    }
    v31 = [(SUUIEditProfileSettingDescriptionView *)self _textFieldWithPlaceholder:v30];
    v32 = self->_handleField;
    self->_handleField = v31;

    [(UITextField *)self->_handleField setAutocapitalizationType:0];
    [(UITextField *)self->_handleField setAutocorrectionType:1];
    [(UITextField *)self->_handleField _setPrefix:@"@"];
    [(SUUIEditProfileSettingDescriptionView *)self addSubview:self->_handleField];
    handleField = self->_handleField;
  }
  v33 = [(SUUIEditProfileSettingDescription *)*p_settingDescription handle];
  [(UITextField *)handleField setText:v33];

  if (!self->_divider1)
  {
    v34 = [MEMORY[0x263F157E8] layer];
    divider1 = self->_divider1;
    self->_divider1 = v34;

    v36 = self->_divider1;
    id v37 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
    -[CALayer setBackgroundColor:](v36, "setBackgroundColor:", [v37 CGColor]);

    v38 = [(SUUIEditProfileSettingDescriptionView *)self layer];
    [v38 addSublayer:self->_divider1];
  }
  uint64_t v39 = [(SUUIEditProfileSettingDescription *)*p_settingDescription isEditing];
  [(UIButton *)self->_editButton setHidden:v39 ^ 1];
  [(UITextField *)self->_nameField setEnabled:v39];
  [(UITextField *)self->_handleField setEnabled:v39];
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  if ([a3 isEqual:self->_handleField])
  {
    [(SUUIEditProfileSettingDescriptionView *)self _updateHandleTextFieldValidity];
  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  int v4 = [a3 isEqual:self->_nameField];
  handleField = self->_handleField;
  if (v4) {
    [(UITextField *)handleField becomeFirstResponder];
  }
  else {
    [(UITextField *)handleField resignFirstResponder];
  }
  return 0;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  v11 = [v9 text];
  v12 = objc_msgSend(v11, "stringByReplacingCharactersInRange:withString:", location, length, v10);

  if ([v9 isEqual:self->_nameField])
  {
    [(SUUIEditProfileSettingDescription *)self->_settingDescription setName:v12];
  }
  else if ([v9 isEqual:self->_handleField])
  {
    [(SUUIEditProfileSettingDescriptionView *)self _updateHandleTextFieldValidity];
  }

  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v7 = a3;
  if ([v7 isEqual:self->_nameField])
  {
    settingDescription = self->_settingDescription;
    double v5 = [v7 text];
    [(SUUIEditProfileSettingDescription *)settingDescription setName:v5];
  }
  else
  {
    if (![v7 isEqual:self->_handleField]) {
      goto LABEL_6;
    }
    v6 = self->_settingDescription;
    double v5 = [v7 text];
    [(SUUIEditProfileSettingDescription *)v6 setHandle:v5];
  }

LABEL_6:
}

- (void)layoutSubviews
{
  v51.receiver = self;
  v51.super_class = (Class)SUUIEditProfileSettingDescriptionView;
  [(SUUIEditProfileSettingDescriptionView *)&v51 layoutSubviews];
  [(SUUISettingDescriptionView *)self layoutMargins];
  CGFloat v4 = v3;
  double v48 = v5;
  [(SUUIEditProfileSettingDescriptionView *)self bounds];
  CGFloat v7 = v6;
  CGFloat v46 = v8;
  CGFloat v47 = v6;
  CGFloat v10 = v9;
  CGFloat v50 = v11;
  int ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  v13 = [(UIButton *)self->_editButton titleLabel];
  v14 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
  [v13 setFont:v14];
  [v14 _scaledValueForValue:16.0];
  double v16 = v15;
  -[UIButton sizeThatFits:](self->_editButton, "sizeThatFits:", 1.0, 1.0);
  double v18 = v17;
  CGFloat v20 = v19;
  v52.origin.y = 8.0;
  v52.origin.x = v4;
  v52.size.width = 56.0;
  v52.size.height = 56.0;
  double v21 = v16 + CGRectGetMaxY(v52);
  [v13 _firstBaselineOffsetFromTop];
  CGFloat v23 = v21 - v22;
  v53.origin.y = 8.0;
  v53.origin.x = v4;
  v53.size.width = 56.0;
  v53.size.height = 56.0;
  double v24 = floor((CGRectGetWidth(v53) - v18) * 0.5);
  v54.origin.y = 8.0;
  v54.origin.x = v4;
  v54.size.width = 56.0;
  v54.size.height = 56.0;
  CGFloat v25 = CGRectGetMinX(v54) + v24;
  CGFloat v26 = v10;
  [(UIButton *)self->_editButton setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v25, v23, v18, v20, v7, v10, v50, v46)];
  uint64_t v27 = *MEMORY[0x263F83570];
  v28 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [(UITextField *)self->_nameField setFont:v28];
  [(UITextField *)self->_handleField setFont:v28];
  if (ShouldReverseLayoutDirection) {
    uint64_t v29 = 2;
  }
  else {
    uint64_t v29 = 0;
  }
  [(UITextField *)self->_nameField setTextAlignment:v29];
  [(UITextField *)self->_handleField setTextAlignment:v29];
  v30 = [(id)objc_opt_class() _baselineFontForTextStyle:v27];
  [v30 _scaledValueForValue:30.0];
  double v32 = v31;
  [v30 _scaledValueForValue:18.0];
  double v45 = v32 + v33;
  v34 = [(UITextField *)self->_nameField _placeholderLabel];
  v55.origin.y = 8.0;
  v55.origin.x = v4;
  v55.size.width = 56.0;
  v55.size.height = 56.0;
  CGFloat v35 = CGRectGetMaxX(v55) + 16.0;
  [v34 _firstBaselineOffsetFromTop];
  double v37 = v32 - v36;
  double v44 = v32 - v36;
  v56.origin.x = v47;
  v56.origin.y = v10;
  v56.size.width = v50;
  v56.size.height = v46;
  CGFloat v38 = CGRectGetWidth(v56) - v35 - v48;
  v57.origin.x = v47;
  v57.origin.y = v10;
  v57.size.width = v50;
  v57.size.height = v46;
  CGFloat v43 = CGRectGetWidth(v57) - v35;
  -[UITextField sizeThatFits:](self->_nameField, "sizeThatFits:", v38, 1.0);
  CGFloat v49 = v39;
  [(UITextField *)self->_nameField setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v35, v37 + 0.0, v38, v39, v47, v10, v50, v46)];
  id v40 = [MEMORY[0x263F82B60] mainScreen];
  [v40 scale];
  CGFloat v42 = 1.0 / v41;

  [(CALayer *)self->_divider1 setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v35, v45 + 0.0, v43, v42, v47, v26, v50, v46)];
  [(UITextField *)self->_handleField setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v35, v45 + 0.0 + v44, v38, v49, v47, v26, v50, v46)];
  [(SUUIImageView *)self->_imageView setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v4, 8.0, 56.0, 56.0, v47, v26, v50, v46)];
}

+ (id)_baselineFontForTextStyle:(id)a3
{
  double v3 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:a3 addingSymbolicTraits:0 options:2];
  CGFloat v4 = [MEMORY[0x263F81708] fontWithDescriptor:v3 size:0.0];

  return v4;
}

- (void)_updateHandleTextFieldValidity
{
  settingDescription = self->_settingDescription;
  CGFloat v4 = [(UITextField *)self->_handleField text];
  [(SUUIEditProfileSettingDescription *)settingDescription setHandle:v4];

  BOOL v5 = [(SUUIEditProfileSettingDescription *)self->_settingDescription isHandleValid];
  handleField = self->_handleField;
  if (v5) {
    [MEMORY[0x263F825C8] blackColor];
  }
  else {
  id v7 = [MEMORY[0x263F825C8] systemRedColor];
  }
  [(UITextField *)handleField setTextColor:v7];
}

- (void)_editProfilePhoto
{
}

- (id)_textFieldWithPlaceholder:(id)a3
{
  CGFloat v4 = (objc_class *)MEMORY[0x263F82CF0];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v7 setDelegate:self];
  double v8 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [v7 setFont:v8];
  double v9 = [MEMORY[0x263F825C8] blackColor];
  [v7 setTextColor:v9];

  id v10 = objc_alloc(NSDictionary);
  double v11 = [MEMORY[0x263F825C8] systemRedColor];
  v12 = objc_msgSend(v10, "initWithObjectsAndKeys:", v11, *MEMORY[0x263F81500], 0);

  v13 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v5 attributes:v12];
  [v7 setAttributedPlaceholder:v13];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingDescription, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_handleField, 0);
  objc_storeStrong((id *)&self->_nameField, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_divider1, 0);
}

@end