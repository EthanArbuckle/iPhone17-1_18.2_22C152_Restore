@interface PUEditPlugin
+ (BOOL)pu_isMarkupExtensionIdentifier:(id)a3;
+ (id)pu_defaultMarkupExtensionIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)pu_isMarkupExtension;
- (NSExtension)extension;
- (NSString)title;
- (PUEditPlugin)initWithExtension:(id)a3 pluginCategoryType:(unint64_t)a4;
- (UIApplicationExtensionActivity)applicationExtensionActivity;
- (UIImage)icon;
- (UIImage)smallIcon;
- (unint64_t)category;
- (unint64_t)hash;
- (void)setCategory:(unint64_t)a3;
@end

@implementation PUEditPlugin

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_applicationExtensionActivity, 0);
}

- (NSExtension)extension
{
  return self->_extension;
}

- (UIApplicationExtensionActivity)applicationExtensionActivity
{
  return self->_applicationExtensionActivity;
}

- (void)setCategory:(unint64_t)a3
{
  self->_category = a3;
}

- (BOOL)pu_isMarkupExtension
{
  v2 = [(PUEditPlugin *)self extension];
  v3 = [v2 identifier];
  BOOL v4 = +[PUEditPlugin pu_isMarkupExtensionIdentifier:v3];

  return v4;
}

- (unint64_t)category
{
  return self->_category;
}

- (UIImage)smallIcon
{
  v2 = [(PUEditPlugin *)self applicationExtensionActivity];
  v3 = [v2 _activitySettingsImage];

  return (UIImage *)v3;
}

- (UIImage)icon
{
  v2 = [(PUEditPlugin *)self applicationExtensionActivity];
  v3 = [v2 _activityImage];

  return (UIImage *)v3;
}

- (NSString)title
{
  v2 = [(PUEditPlugin *)self extension];
  v3 = [v2 _plugIn];

  BOOL v4 = [v3 localizedContainingName];
  if (![(__CFString *)v4 length])
  {
    uint64_t v5 = [v3 localizedName];

    BOOL v4 = (__CFString *)v5;
  }
  if (![(__CFString *)v4 length])
  {
    uint64_t v6 = [v3 localizedShortName];

    BOOL v4 = (__CFString *)v6;
  }
  if ([(__CFString *)v4 length]) {
    v7 = v4;
  }
  else {
    v7 = &stru_1F06BE7B8;
  }
  v8 = v7;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(PUEditPlugin *)self extension];
    uint64_t v6 = [v4 extension];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(PUEditPlugin *)self extension];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (PUEditPlugin)initWithExtension:(id)a3 pluginCategoryType:(unint64_t)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PUEditPlugin;
  v8 = [(PUEditPlugin *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_extension, a3);
    v9->_category = a4;
    if (!a4)
    {
      v10 = _PUEditActionPluginApplicationExtensionActivity;
      goto LABEL_6;
    }
    if (a4 == 1)
    {
      v10 = _PUEditSharePluginApplicationExtensionActivity;
LABEL_6:
      uint64_t v11 = [[v10 alloc] initWithApplicationExtension:v7];
      applicationExtensionActivity = v9->_applicationExtensionActivity;
      v9->_applicationExtensionActivity = (UIApplicationExtensionActivity *)v11;
    }
  }

  return v9;
}

+ (BOOL)pu_isMarkupExtensionIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.PaperKit.MarkupPhotoEditingExtension"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"com.apple.MarkupUI.MarkupPhotoExtension"];
  }

  return v4;
}

+ (id)pu_defaultMarkupExtensionIdentifier
{
  return @"com.apple.PaperKit.MarkupPhotoEditingExtension";
}

@end