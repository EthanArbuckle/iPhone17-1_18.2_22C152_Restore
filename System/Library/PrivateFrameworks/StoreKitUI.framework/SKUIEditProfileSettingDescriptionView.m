@interface SKUIEditProfileSettingDescriptionView
+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5;
+ (id)_baselineFontForTextStyle:(id)a3;
+ (void)requestLayoutForSettingDescription:(id)a3 width:(double)a4 context:(id)a5;
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

@implementation SKUIEditProfileSettingDescriptionView

+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUIEditProfileSettingDescriptionView prefetchResourcesForSettingDescription:reason:context:](v5, v6, v7, v8, v9, v10, v11, v12);
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
        +[SKUIEditProfileSettingDescriptionView preferredSizeForSettingDescription:context:](v4, v5, v6, v7, v8, v9, v10, v11);
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
  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v5) {
      +[SKUIEditProfileSettingDescriptionView requestLayoutForSettingDescription:width:context:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        +[SKUIEditProfileSettingDescriptionView sizeThatFitsWidth:settingDescription:context:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  v15 = [a1 _baselineFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v15 _scaledValueForValue:48.0];
  double v17 = v16 + v16;

  double v18 = a3;
  double v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  id v40 = a3;
  p_settingDescription = &self->_settingDescription;
  objc_storeStrong((id *)&self->_settingDescription, a3);
  id v9 = a5;
  uint64_t v10 = [v9 clientContext];

  clientContext = self->_clientContext;
  self->_clientContext = v10;

  imageView = self->_imageView;
  if (!imageView)
  {
    uint64_t v13 = objc_alloc_init(SKUIImageView);
    uint64_t v14 = self->_imageView;
    self->_imageView = v13;

    [(SKUIEditProfileSettingDescriptionView *)self addSubview:self->_imageView];
    imageView = self->_imageView;
  }
  v15 = [(SKUIEditProfileSettingDescription *)*p_settingDescription photo];
  [(SKUIImageView *)imageView setImage:v15];

  if (!self->_editButton)
  {
    double v16 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    editButton = self->_editButton;
    self->_editButton = v16;

    double v18 = self->_clientContext;
    if (v18) {
      [(SKUIClientContext *)v18 localizedStringForKey:@"SETTINGS_PROFILE_EDIT_BUTTON_LABEL" inTable:@"Settings"];
    }
    else {
    double v19 = +[SKUIClientContext localizedStringForKey:@"SETTINGS_PROFILE_EDIT_BUTTON_LABEL" inBundles:0 inTable:@"Settings"];
    }
    [(UIButton *)self->_editButton setTitle:v19 forState:0];
    [(UIButton *)self->_editButton addTarget:self action:sel__editProfilePhoto forControlEvents:64];
    v20 = [(UIButton *)self->_editButton titleLabel];
    v21 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    [v20 setFont:v21];

    [(SKUIEditProfileSettingDescriptionView *)self addSubview:self->_editButton];
  }
  nameField = self->_nameField;
  if (!nameField)
  {
    v23 = self->_clientContext;
    if (v23) {
      [(SKUIClientContext *)v23 localizedStringForKey:@"SETTINGS_PROFILE_EDIT_NAME" inTable:@"Settings"];
    }
    else {
    v24 = +[SKUIClientContext localizedStringForKey:@"SETTINGS_PROFILE_EDIT_NAME" inBundles:0 inTable:@"Settings"];
    }
    v25 = [(SKUIEditProfileSettingDescriptionView *)self _textFieldWithPlaceholder:v24];
    v26 = self->_nameField;
    self->_nameField = v25;

    [(UITextField *)self->_nameField setAutocapitalizationType:1];
    [(UITextField *)self->_nameField setAutocorrectionType:1];
    [(SKUIEditProfileSettingDescriptionView *)self addSubview:self->_nameField];
    nameField = self->_nameField;
  }
  v27 = [(SKUIEditProfileSettingDescription *)*p_settingDescription name];
  [(UITextField *)nameField setText:v27];

  handleField = self->_handleField;
  if (!handleField)
  {
    v29 = self->_clientContext;
    if (v29) {
      [(SKUIClientContext *)v29 localizedStringForKey:@"SETTINGS_PROFILE_EDIT_HANDLE" inTable:@"Settings"];
    }
    else {
    v30 = +[SKUIClientContext localizedStringForKey:@"SETTINGS_PROFILE_EDIT_HANDLE" inBundles:0 inTable:@"Settings"];
    }
    v31 = [(SKUIEditProfileSettingDescriptionView *)self _textFieldWithPlaceholder:v30];
    v32 = self->_handleField;
    self->_handleField = v31;

    [(UITextField *)self->_handleField setAutocapitalizationType:0];
    [(UITextField *)self->_handleField setAutocorrectionType:1];
    [(UITextField *)self->_handleField _setPrefix:@"@"];
    [(SKUIEditProfileSettingDescriptionView *)self addSubview:self->_handleField];
    handleField = self->_handleField;
  }
  v33 = [(SKUIEditProfileSettingDescription *)*p_settingDescription handle];
  [(UITextField *)handleField setText:v33];

  if (!self->_divider1)
  {
    v34 = [MEMORY[0x1E4F39BE8] layer];
    divider1 = self->_divider1;
    self->_divider1 = v34;

    v36 = self->_divider1;
    id v37 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
    -[CALayer setBackgroundColor:](v36, "setBackgroundColor:", [v37 CGColor]);

    v38 = [(SKUIEditProfileSettingDescriptionView *)self layer];
    [v38 addSublayer:self->_divider1];
  }
  uint64_t v39 = [(SKUIEditProfileSettingDescription *)*p_settingDescription isEditing];
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
    [(SKUIEditProfileSettingDescriptionView *)self _updateHandleTextFieldValidity];
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
  uint64_t v11 = [v9 text];
  uint64_t v12 = objc_msgSend(v11, "stringByReplacingCharactersInRange:withString:", location, length, v10);

  if ([v9 isEqual:self->_nameField])
  {
    [(SKUIEditProfileSettingDescription *)self->_settingDescription setName:v12];
  }
  else if ([v9 isEqual:self->_handleField])
  {
    [(SKUIEditProfileSettingDescriptionView *)self _updateHandleTextFieldValidity];
  }

  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v7 = a3;
  if ([v7 isEqual:self->_nameField])
  {
    settingDescription = self->_settingDescription;
    BOOL v5 = [v7 text];
    [(SKUIEditProfileSettingDescription *)settingDescription setName:v5];
  }
  else
  {
    if (![v7 isEqual:self->_handleField]) {
      goto LABEL_6;
    }
    uint64_t v6 = self->_settingDescription;
    BOOL v5 = [v7 text];
    [(SKUIEditProfileSettingDescription *)v6 setHandle:v5];
  }

LABEL_6:
}

- (void)layoutSubviews
{
  v56.receiver = self;
  v56.super_class = (Class)SKUIEditProfileSettingDescriptionView;
  [(SKUIEditProfileSettingDescriptionView *)&v56 layoutSubviews];
  [(SKUISettingDescriptionView *)self layoutMargins];
  CGFloat v4 = v3;
  double v53 = v5;
  [(SKUIEditProfileSettingDescriptionView *)self bounds];
  CGFloat v7 = v6;
  CGFloat v51 = v8;
  CGFloat v52 = v6;
  CGFloat v10 = v9;
  CGFloat v55 = v11;
  int ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  uint64_t v13 = [(UIButton *)self->_editButton titleLabel];
  uint64_t v14 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [v13 setFont:v14];
  [v14 _scaledValueForValue:16.0];
  double v16 = v15;
  -[UIButton sizeThatFits:](self->_editButton, "sizeThatFits:", 1.0, 1.0);
  double v18 = v17;
  CGFloat v20 = v19;
  v57.origin.y = 8.0;
  v57.origin.x = v4;
  v57.size.width = 56.0;
  v57.size.height = 56.0;
  double v21 = v16 + CGRectGetMaxY(v57);
  [v13 _firstBaselineOffsetFromTop];
  CGFloat v23 = v21 - v22;
  v58.origin.y = 8.0;
  v58.origin.x = v4;
  v58.size.width = 56.0;
  v58.size.height = 56.0;
  double v24 = floor((CGRectGetWidth(v58) - v18) * 0.5);
  v59.origin.y = 8.0;
  v59.origin.x = v4;
  v59.size.width = 56.0;
  v59.size.height = 56.0;
  CGFloat v25 = CGRectGetMinX(v59) + v24;
  editButton = self->_editButton;
  CGFloat v27 = v10;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v25, v23, v18, v20, v7, v10, v55, v51);
  -[UIButton setFrame:](editButton, "setFrame:");
  uint64_t v28 = *MEMORY[0x1E4FB28C8];
  v29 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(UITextField *)self->_nameField setFont:v29];
  [(UITextField *)self->_handleField setFont:v29];
  if (ShouldReverseLayoutDirection) {
    uint64_t v30 = 2;
  }
  else {
    uint64_t v30 = 0;
  }
  [(UITextField *)self->_nameField setTextAlignment:v30];
  [(UITextField *)self->_handleField setTextAlignment:v30];
  v31 = [(id)objc_opt_class() _baselineFontForTextStyle:v28];
  [v31 _scaledValueForValue:30.0];
  double v33 = v32;
  [v31 _scaledValueForValue:18.0];
  double v50 = v33 + v34;
  v35 = [(UITextField *)self->_nameField _placeholderLabel];
  v60.origin.y = 8.0;
  v60.origin.x = v4;
  v60.size.width = 56.0;
  v60.size.height = 56.0;
  CGFloat v36 = CGRectGetMaxX(v60) + 16.0;
  [v35 _firstBaselineOffsetFromTop];
  double v38 = v33 - v37;
  double v49 = v33 - v37;
  v61.origin.x = v52;
  v61.origin.y = v10;
  v61.size.width = v55;
  v61.size.height = v51;
  CGFloat v39 = CGRectGetWidth(v61) - v36 - v53;
  v62.origin.x = v52;
  v62.origin.y = v10;
  v62.size.width = v55;
  v62.size.height = v51;
  CGFloat v48 = CGRectGetWidth(v62) - v36;
  -[UITextField sizeThatFits:](self->_nameField, "sizeThatFits:", v39, 1.0);
  CGFloat v54 = v40;
  nameField = self->_nameField;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v36, v38 + 0.0, v39, v40, v52, v10, v55, v51);
  -[UITextField setFrame:](nameField, "setFrame:");
  v42 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v42 scale];
  CGFloat v44 = 1.0 / v43;

  divider1 = self->_divider1;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v36, v50 + 0.0, v48, v44, v52, v27, v55, v51);
  -[CALayer setFrame:](divider1, "setFrame:");
  handleField = self->_handleField;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v36, v50 + 0.0 + v49, v39, v54, v52, v27, v55, v51);
  -[UITextField setFrame:](handleField, "setFrame:");
  imageView = self->_imageView;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v4, 8.0, 56.0, 56.0, v52, v27, v55, v51);
  -[SKUIImageView setFrame:](imageView, "setFrame:");
}

+ (id)_baselineFontForTextStyle:(id)a3
{
  double v3 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:a3 addingSymbolicTraits:0 options:2];
  CGFloat v4 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v3 size:0.0];

  return v4;
}

- (void)_updateHandleTextFieldValidity
{
  settingDescription = self->_settingDescription;
  CGFloat v4 = [(UITextField *)self->_handleField text];
  [(SKUIEditProfileSettingDescription *)settingDescription setHandle:v4];

  BOOL v5 = [(SKUIEditProfileSettingDescription *)self->_settingDescription isHandleValid];
  handleField = self->_handleField;
  if (v5) {
    [MEMORY[0x1E4FB1618] blackColor];
  }
  else {
  id v7 = [MEMORY[0x1E4FB1618] systemRedColor];
  }
  [(UITextField *)handleField setTextColor:v7];
}

- (void)_editProfilePhoto
{
}

- (id)_textFieldWithPlaceholder:(id)a3
{
  CGFloat v4 = (objc_class *)MEMORY[0x1E4FB1D70];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v7 setDelegate:self];
  double v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v7 setFont:v8];
  double v9 = [MEMORY[0x1E4FB1618] blackColor];
  [v7 setTextColor:v9];

  id v10 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  double v11 = [MEMORY[0x1E4FB1618] systemRedColor];
  uint64_t v12 = objc_msgSend(v10, "initWithObjectsAndKeys:", v11, *MEMORY[0x1E4FB0700], 0);

  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:v12];
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