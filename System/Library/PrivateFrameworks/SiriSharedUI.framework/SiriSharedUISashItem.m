@interface SiriSharedUISashItem
+ (id)languageCode;
+ (void)setLanguageCode:(id)a3;
- (BOOL)canPunchout;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHidden;
- (BOOL)isPlaceHolderImage;
- (BOOL)isSiriImage;
- (BOOL)requestsExtraPadding;
- (NSArray)commands;
- (NSString)applicationBundleIdentifier;
- (NSString)title;
- (SiriSharedUISashItem)init;
- (SiriSharedUISashItem)initWithApplicationBundleIdentifier:(id)a3;
- (SiriSharedUISashItem)initWithTitle:(id)a3 image:(id)a4;
- (SiriSharedUISashItemDelegate)delegate;
- (UIColor)backgroundColor;
- (UIColor)textColor;
- (UIImage)image;
- (void)_configureIconForAppProxy:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCommands:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setRequestsExtraPadding:(BOOL)a3;
- (void)setTextColor:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SiriSharedUISashItem

- (SiriSharedUISashItem)initWithTitle:(id)a3 image:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SiriSharedUISashItem *)self init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    title = v8->_title;
    v8->_title = (NSString *)v9;

    [(SiriSharedUISashItem *)v8 setImage:v7];
  }

  return v8;
}

- (SiriSharedUISashItem)initWithApplicationBundleIdentifier:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(SiriSharedUISashItem *)self init];
  if (v5)
  {
    if (([v4 isEqualToString:@"com.apple.SiriViewService"] & 1) != 0
      || ![v4 length])
    {
      applicationBundleIdentifier = v5->_applicationBundleIdentifier;
      v5->_applicationBundleIdentifier = (NSString *)@"com.apple.siri";
    }
    else
    {
      id v6 = (NSString *)v4;
      applicationBundleIdentifier = v5->_applicationBundleIdentifier;
      v5->_applicationBundleIdentifier = v6;
    }

    v5->_siriImage = [v4 isEqualToString:@"com.apple.siri"];
    v8 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v5->_applicationBundleIdentifier];
    uint64_t v9 = [v8 appState];
    char v10 = [v9 isValid];

    if ((v10 & 1) == 0)
    {
      v11 = [MEMORY[0x263F01868] applicationProxyForSystemPlaceholder:v5->_applicationBundleIdentifier];

      v12 = [v11 appState];
      int v13 = [v12 isValid];

      if (!v13)
      {

        v20 = 0;
        goto LABEL_14;
      }
      v8 = v11;
    }
    [(SiriSharedUISashItem *)v5 _configureIconForAppProxy:v8];
    uint64_t v14 = [(id)objc_opt_class() languageCode];
    v15 = (void *)v14;
    if (v14)
    {
      v22[0] = v14;
      v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
      v17 = [v8 localizedNameForContext:0 preferredLocalizations:v16];
    }
    else
    {
      v17 = [v8 localizedName];
    }
    uint64_t v18 = [v17 copy];
    title = v5->_title;
    v5->_title = (NSString *)v18;

    v5->_canPunchout = ![(NSString *)v5->_applicationBundleIdentifier isEqualToString:@"com.apple.siri"];
  }
  v20 = v5;
LABEL_14:

  return v20;
}

- (SiriSharedUISashItem)init
{
  v3.receiver = self;
  v3.super_class = (Class)SiriSharedUISashItem;
  result = [(SiriSharedUISashItem *)&v3 init];
  if (result) {
    result->_canPunchout = 1;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    title = self->_title;
    id v6 = [v4 title];
    if ([(NSString *)title isEqualToString:v6])
    {
      image = self->_image;
      v8 = [v4 image];
      char v9 = [(UIImage *)image isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)setImage:(id)a3
{
  id v4 = (void *)MEMORY[0x263F82B60];
  id v5 = a3;
  id v8 = [v4 mainScreen];
  [v8 scale];
  objc_msgSend(v5, "_applicationIconImageForFormat:precomposed:scale:", 5, 0);
  id v6 = (UIImage *)objc_claimAutoreleasedReturnValue();

  image = self->_image;
  self->_image = v6;
}

- (void)setTitle:(id)a3
{
  self->_title = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (BOOL)canPunchout
{
  uint64_t v3 = [(SiriSharedUISashItem *)self commands];
  BOOL result = (!v3
         || (id v4 = (void *)v3,
             [(SiriSharedUISashItem *)self commands],
             id v5 = objc_claimAutoreleasedReturnValue(),
             uint64_t v6 = [v5 count],
             v5,
             v4,
             v6))
        && self->_canPunchout;
  return result;
}

- (void)_configureIconForAppProxy:(id)a3
{
  self->_image = [MEMORY[0x263F827E8] _iconForResourceProxy:a3 format:5];
  MEMORY[0x270F9A758]();
}

+ (id)languageCode
{
  return (id)_languageCode;
}

+ (void)setLanguageCode:(id)a3
{
  _languageCode = [a3 copy];
  MEMORY[0x270F9A758]();
}

- (SiriSharedUISashItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriSharedUISashItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)isSiriImage
{
  return self->_siriImage;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (NSArray)commands
{
  return self->_commands;
}

- (void)setCommands:(id)a3
{
}

- (BOOL)requestsExtraPadding
{
  return self->_requestsExtraPadding;
}

- (void)setRequestsExtraPadding:(BOOL)a3
{
  self->_requestsExtraPadding = a3;
}

- (BOOL)isPlaceHolderImage
{
  return self->_placeHolderImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end