@interface _UIColorPickerViewControllerConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)_allowsNoColor;
- (BOOL)_isEmbedded;
- (BOOL)_isInPopoverPresentation;
- (BOOL)_isInSheetPresentation;
- (BOOL)_shouldUseDarkGridInDarkMode;
- (BOOL)_showsEyedropper;
- (BOOL)_showsGridOnly;
- (BOOL)_useLandscapeLayout;
- (BOOL)isEqual:(id)a3;
- (BOOL)showsAlpha;
- (NSArray)_suggestedColors;
- (NSString)title;
- (_UIColorPickerViewControllerConfiguration)init;
- (_UIColorPickerViewControllerConfiguration)initWithCoder:(id)a3;
- (double)_preferredWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_userInterfaceStyleForGrid;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setShowsAlpha:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)set_allowsNoColor:(BOOL)a3;
- (void)set_isEmbedded:(BOOL)a3;
- (void)set_isInPopoverPresentation:(BOOL)a3;
- (void)set_isInSheetPresentation:(BOOL)a3;
- (void)set_preferredWidth:(double)a3;
- (void)set_shouldUseDarkGridInDarkMode:(BOOL)a3;
- (void)set_showsEyedropper:(BOOL)a3;
- (void)set_showsGridOnly:(BOOL)a3;
- (void)set_suggestedColors:(id)a3;
- (void)set_useLandscapeLayout:(BOOL)a3;
- (void)set_userInterfaceStyleForGrid:(int64_t)a3;
@end

@implementation _UIColorPickerViewControllerConfiguration

- (_UIColorPickerViewControllerConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIColorPickerViewControllerConfiguration;
  result = [(_UIColorPickerViewControllerConfiguration *)&v3 init];
  if (result)
  {
    result->_showsAlpha = 1;
    result->__showsEyedropper = 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setShowsAlpha:", -[_UIColorPickerViewControllerConfiguration showsAlpha](self, "showsAlpha"));
  v5 = [(_UIColorPickerViewControllerConfiguration *)self title];
  [v4 setTitle:v5];

  objc_msgSend(v4, "set_userInterfaceStyleForGrid:", -[_UIColorPickerViewControllerConfiguration _userInterfaceStyleForGrid](self, "_userInterfaceStyleForGrid"));
  objc_msgSend(v4, "set_shouldUseDarkGridInDarkMode:", -[_UIColorPickerViewControllerConfiguration _shouldUseDarkGridInDarkMode](self, "_shouldUseDarkGridInDarkMode"));
  objc_msgSend(v4, "set_isEmbedded:", -[_UIColorPickerViewControllerConfiguration _isEmbedded](self, "_isEmbedded"));
  objc_msgSend(v4, "set_useLandscapeLayout:", -[_UIColorPickerViewControllerConfiguration _useLandscapeLayout](self, "_useLandscapeLayout"));
  [(_UIColorPickerViewControllerConfiguration *)self _preferredWidth];
  objc_msgSend(v4, "set_preferredWidth:");
  v6 = [(_UIColorPickerViewControllerConfiguration *)self _suggestedColors];
  objc_msgSend(v4, "set_suggestedColors:", v6);

  objc_msgSend(v4, "set_allowsNoColor:", -[_UIColorPickerViewControllerConfiguration _allowsNoColor](self, "_allowsNoColor"));
  objc_msgSend(v4, "set_showsEyedropper:", -[_UIColorPickerViewControllerConfiguration _showsEyedropper](self, "_showsEyedropper"));
  objc_msgSend(v4, "set_showsGridOnly:", -[_UIColorPickerViewControllerConfiguration _showsGridOnly](self, "_showsGridOnly"));
  objc_msgSend(v4, "set_isInPopoverPresentation:", -[_UIColorPickerViewControllerConfiguration _isInPopoverPresentation](self, "_isInPopoverPresentation"));
  objc_msgSend(v4, "set_isInSheetPresentation:", -[_UIColorPickerViewControllerConfiguration _isInSheetPresentation](self, "_isInSheetPresentation"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UIColorPickerViewControllerConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = [(_UIColorPickerViewControllerConfiguration *)self showsAlpha];
      if (v6 != [(_UIColorPickerViewControllerConfiguration *)v5 showsAlpha])
      {
        LOBYTE(v7) = 0;
LABEL_29:

        goto LABEL_30;
      }
      v8 = [(_UIColorPickerViewControllerConfiguration *)self title];
      v9 = [(_UIColorPickerViewControllerConfiguration *)v5 title];
      id v10 = v8;
      id v11 = v9;
      v12 = v11;
      if (v10 == v11)
      {
      }
      else
      {
        LOBYTE(v7) = 0;
        id v13 = v10;
        if (!v10 || !v11) {
          goto LABEL_27;
        }
        int v14 = [v10 isEqual:v11];

        if (!v14)
        {
LABEL_20:
          LOBYTE(v7) = 0;
LABEL_28:

          goto LABEL_29;
        }
      }
      BOOL v15 = [(_UIColorPickerViewControllerConfiguration *)self _shouldUseDarkGridInDarkMode];
      if (v15 != [(_UIColorPickerViewControllerConfiguration *)v5 _shouldUseDarkGridInDarkMode])goto LABEL_20; {
      int64_t v16 = [(_UIColorPickerViewControllerConfiguration *)self _userInterfaceStyleForGrid];
      }
      if (v16 != [(_UIColorPickerViewControllerConfiguration *)v5 _userInterfaceStyleForGrid])goto LABEL_20; {
      BOOL v17 = [(_UIColorPickerViewControllerConfiguration *)self _isEmbedded];
      }
      if (v17 != [(_UIColorPickerViewControllerConfiguration *)v5 _isEmbedded]) {
        goto LABEL_20;
      }
      BOOL v18 = [(_UIColorPickerViewControllerConfiguration *)self _useLandscapeLayout];
      if (v18 != [(_UIColorPickerViewControllerConfiguration *)v5 _useLandscapeLayout]) {
        goto LABEL_20;
      }
      [(_UIColorPickerViewControllerConfiguration *)self _preferredWidth];
      double v20 = v19;
      [(_UIColorPickerViewControllerConfiguration *)v5 _preferredWidth];
      if (v20 != v21) {
        goto LABEL_20;
      }
      id v13 = [(_UIColorPickerViewControllerConfiguration *)self _suggestedColors];
      id v11 = [(_UIColorPickerViewControllerConfiguration *)v5 _suggestedColors];
      if (v13 == v11)
      {
        BOOL v22 = [(_UIColorPickerViewControllerConfiguration *)self _allowsNoColor];
        if (v22 == [(_UIColorPickerViewControllerConfiguration *)v5 _allowsNoColor]
          && (BOOL v23 = [(_UIColorPickerViewControllerConfiguration *)self _showsEyedropper],
              v23 == [(_UIColorPickerViewControllerConfiguration *)v5 _showsEyedropper])
          && (BOOL v24 = [(_UIColorPickerViewControllerConfiguration *)self _showsGridOnly],
              v24 == [(_UIColorPickerViewControllerConfiguration *)v5 _showsGridOnly])
          && (BOOL v25 = [(_UIColorPickerViewControllerConfiguration *)self _isInPopoverPresentation], v25 == [(_UIColorPickerViewControllerConfiguration *)v5 _isInPopoverPresentation]))
        {
          BOOL v27 = [(_UIColorPickerViewControllerConfiguration *)self _isInSheetPresentation];
          BOOL v7 = v27 ^ [(_UIColorPickerViewControllerConfiguration *)v5 _isInSheetPresentation] ^ 1;
        }
        else
        {
          LOBYTE(v7) = 0;
        }
        id v11 = v13;
      }
      else
      {
        LOBYTE(v7) = 0;
      }
LABEL_27:

      goto LABEL_28;
    }
    LOBYTE(v7) = 0;
  }
LABEL_30:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(_UIColorPickerViewControllerConfiguration *)self showsAlpha];
  v4 = [(_UIColorPickerViewControllerConfiguration *)self title];
  uint64_t v5 = [v4 hash] ^ v3;
  int64_t v6 = v5 ^ (2
           * [(_UIColorPickerViewControllerConfiguration *)self _userInterfaceStyleForGrid]);
  if ([(_UIColorPickerViewControllerConfiguration *)self _shouldUseDarkGridInDarkMode]) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = 0;
  }
  BOOL v8 = [(_UIColorPickerViewControllerConfiguration *)self _isEmbedded];
  uint64_t v9 = 16;
  if (!v8) {
    uint64_t v9 = 0;
  }
  uint64_t v10 = v7 ^ v9;
  BOOL v11 = [(_UIColorPickerViewControllerConfiguration *)self _useLandscapeLayout];
  uint64_t v12 = 32;
  if (!v11) {
    uint64_t v12 = 0;
  }
  int64_t v13 = v6 ^ v10 ^ v12;
  [(_UIColorPickerViewControllerConfiguration *)self _preferredWidth];
  unint64_t v15 = v13 ^ ((unint64_t)v14 << 6);
  if ([(_UIColorPickerViewControllerConfiguration *)self _allowsNoColor]) {
    uint64_t v16 = 128;
  }
  else {
    uint64_t v16 = 0;
  }
  BOOL v17 = [(_UIColorPickerViewControllerConfiguration *)self _showsEyedropper];
  uint64_t v18 = 256;
  if (!v17) {
    uint64_t v18 = 0;
  }
  uint64_t v19 = v16 ^ v18;
  BOOL v20 = [(_UIColorPickerViewControllerConfiguration *)self _showsGridOnly];
  uint64_t v21 = 512;
  if (!v20) {
    uint64_t v21 = 0;
  }
  uint64_t v22 = v19 ^ v21;
  BOOL v23 = [(_UIColorPickerViewControllerConfiguration *)self _isInPopoverPresentation];
  uint64_t v24 = 1024;
  if (!v23) {
    uint64_t v24 = 0;
  }
  uint64_t v25 = v22 ^ v24;
  BOOL v26 = [(_UIColorPickerViewControllerConfiguration *)self _isInSheetPresentation];
  uint64_t v27 = 2048;
  if (!v26) {
    uint64_t v27 = 0;
  }
  uint64_t v28 = v25 ^ v27;
  v29 = [(_UIColorPickerViewControllerConfiguration *)self _suggestedColors];
  unint64_t v30 = v15 ^ v28 ^ [v29 hash];

  return v30;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_msgSend(v7, "encodeBool:forKey:", -[_UIColorPickerViewControllerConfiguration showsAlpha](self, "showsAlpha"), @"ShowsAlpha");
  v4 = [(_UIColorPickerViewControllerConfiguration *)self title];
  [v7 encodeObject:v4 forKey:@"_Title"];

  objc_msgSend(v7, "encodeInt:forKey:", -[_UIColorPickerViewControllerConfiguration _userInterfaceStyleForGrid](self, "_userInterfaceStyleForGrid"), @"_interfaceStyle");
  objc_msgSend(v7, "encodeBool:forKey:", -[_UIColorPickerViewControllerConfiguration _shouldUseDarkGridInDarkMode](self, "_shouldUseDarkGridInDarkMode"), @"_UseDarkGrid");
  objc_msgSend(v7, "encodeBool:forKey:", -[_UIColorPickerViewControllerConfiguration _isEmbedded](self, "_isEmbedded"), @"_IsEmbedded");
  objc_msgSend(v7, "encodeBool:forKey:", -[_UIColorPickerViewControllerConfiguration _useLandscapeLayout](self, "_useLandscapeLayout"), @"_UseLandscapeLayout");
  [(_UIColorPickerViewControllerConfiguration *)self _preferredWidth];
  *(float *)&double v5 = v5;
  [v7 encodeFloat:@"_PreferredWidth" forKey:v5];
  int64_t v6 = [(_UIColorPickerViewControllerConfiguration *)self _suggestedColors];
  [v7 encodeObject:v6 forKey:@"_SuggestedColors"];

  objc_msgSend(v7, "encodeBool:forKey:", -[_UIColorPickerViewControllerConfiguration _allowsNoColor](self, "_allowsNoColor"), @"_AllowsNoColor");
  objc_msgSend(v7, "encodeBool:forKey:", -[_UIColorPickerViewControllerConfiguration _showsEyedropper](self, "_showsEyedropper"), @"_ShowsEyedropper");
  objc_msgSend(v7, "encodeBool:forKey:", -[_UIColorPickerViewControllerConfiguration _showsGridOnly](self, "_showsGridOnly"), @"_ShowsGridOnly");
  objc_msgSend(v7, "encodeBool:forKey:", -[_UIColorPickerViewControllerConfiguration _isInPopoverPresentation](self, "_isInPopoverPresentation"), @"_IsInPopoverPresentation");
  objc_msgSend(v7, "encodeBool:forKey:", -[_UIColorPickerViewControllerConfiguration _isInSheetPresentation](self, "_isInSheetPresentation"), @"_IsInSheetPresentation");
}

- (_UIColorPickerViewControllerConfiguration)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIColorPickerViewControllerConfiguration;
  double v5 = [(_UIColorPickerViewControllerConfiguration *)&v13 init];
  if (v5)
  {
    -[_UIColorPickerViewControllerConfiguration setShowsAlpha:](v5, "setShowsAlpha:", [v4 decodeBoolForKey:@"ShowsAlpha"]);
    int64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_Title"];
    [(_UIColorPickerViewControllerConfiguration *)v5 setTitle:v6];

    -[_UIColorPickerViewControllerConfiguration set_userInterfaceStyleForGrid:](v5, "set_userInterfaceStyleForGrid:", (int)[v4 decodeIntForKey:@"_interfaceStyle"]);
    -[_UIColorPickerViewControllerConfiguration set_shouldUseDarkGridInDarkMode:](v5, "set_shouldUseDarkGridInDarkMode:", [v4 decodeBoolForKey:@"_UseDarkGrid"]);
    -[_UIColorPickerViewControllerConfiguration set_isEmbedded:](v5, "set_isEmbedded:", [v4 decodeBoolForKey:@"_IsEmbedded"]);
    -[_UIColorPickerViewControllerConfiguration set_useLandscapeLayout:](v5, "set_useLandscapeLayout:", [v4 decodeBoolForKey:@"_UseLandscapeLayout"]);
    [v4 decodeFloatForKey:@"_PreferredWidth"];
    [(_UIColorPickerViewControllerConfiguration *)v5 set_preferredWidth:v7];
    BOOL v8 = (void *)MEMORY[0x1E4F1CAD0];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    uint64_t v10 = [v8 setWithArray:v9];
    BOOL v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_SuggestedColors"];
    [(_UIColorPickerViewControllerConfiguration *)v5 set_suggestedColors:v11];

    -[_UIColorPickerViewControllerConfiguration set_allowsNoColor:](v5, "set_allowsNoColor:", [v4 decodeBoolForKey:@"_AllowsNoColor"]);
    -[_UIColorPickerViewControllerConfiguration set_showsEyedropper:](v5, "set_showsEyedropper:", [v4 decodeBoolForKey:@"_ShowsEyedropper"]);
    -[_UIColorPickerViewControllerConfiguration set_showsGridOnly:](v5, "set_showsGridOnly:", [v4 decodeBoolForKey:@"_ShowsGridOnly"]);
    -[_UIColorPickerViewControllerConfiguration set_isInPopoverPresentation:](v5, "set_isInPopoverPresentation:", [v4 decodeBoolForKey:@"_IsInPopoverPresentation"]);
    -[_UIColorPickerViewControllerConfiguration set_isInSheetPresentation:](v5, "set_isInSheetPresentation:", [v4 decodeBoolForKey:@"_IsInSheetPresentation"]);
  }

  return v5;
}

- (BOOL)_shouldUseDarkGridInDarkMode
{
  return self->__shouldUseDarkGridInDarkMode;
}

- (void)set_shouldUseDarkGridInDarkMode:(BOOL)a3
{
  self->__shouldUseDarkGridInDarkMode = a3;
}

- (int64_t)_userInterfaceStyleForGrid
{
  return self->__userInterfaceStyleForGrid;
}

- (void)set_userInterfaceStyleForGrid:(int64_t)a3
{
  self->__userInterfaceStyleForGrid = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)showsAlpha
{
  return self->_showsAlpha;
}

- (void)setShowsAlpha:(BOOL)a3
{
  self->_showsAlpha = a3;
}

- (BOOL)_isEmbedded
{
  return self->__isEmbedded;
}

- (void)set_isEmbedded:(BOOL)a3
{
  self->__isEmbedded = a3;
}

- (BOOL)_useLandscapeLayout
{
  return self->__useLandscapeLayout;
}

- (void)set_useLandscapeLayout:(BOOL)a3
{
  self->__useLandscapeLayout = a3;
}

- (double)_preferredWidth
{
  return self->__preferredWidth;
}

- (void)set_preferredWidth:(double)a3
{
  self->__preferredWidth = a3;
}

- (NSArray)_suggestedColors
{
  return self->__suggestedColors;
}

- (void)set_suggestedColors:(id)a3
{
}

- (BOOL)_allowsNoColor
{
  return self->__allowsNoColor;
}

- (void)set_allowsNoColor:(BOOL)a3
{
  self->__allowsNoColor = a3;
}

- (BOOL)_showsEyedropper
{
  return self->__showsEyedropper;
}

- (void)set_showsEyedropper:(BOOL)a3
{
  self->__showsEyedropper = a3;
}

- (BOOL)_showsGridOnly
{
  return self->__showsGridOnly;
}

- (void)set_showsGridOnly:(BOOL)a3
{
  self->__showsGridOnly = a3;
}

- (BOOL)_isInPopoverPresentation
{
  return self->__isInPopoverPresentation;
}

- (void)set_isInPopoverPresentation:(BOOL)a3
{
  self->__isInPopoverPresentation = a3;
}

- (BOOL)_isInSheetPresentation
{
  return self->__isInSheetPresentation;
}

- (void)set_isInSheetPresentation:(BOOL)a3
{
  self->__isInSheetPresentation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__suggestedColors, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end