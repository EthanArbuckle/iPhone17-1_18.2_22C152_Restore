@interface UIShortcutActivity
- (BOOL)_isServiceExtension;
- (NSArray)photosAssetIdentifiers;
- (NSNumber)sortValue;
- (NSString)identifier;
- (NSString)name;
- (NSString)singleUseToken;
- (UIImage)iconImage;
- (UIShortcutActivity)initWithApplicationExtension:(id)a3 partialShortcutWithName:(id)a4 identifier:(id)a5 image:(id)a6 sortValue:(id)a7;
- (UIShortcutActivity)initWithApplicationExtension:(id)a3 singleUseToken:(id)a4 photosAssetIdentifiers:(id)a5;
- (UIShortcutActivity)initWithPartial:(id)a3;
- (id)_actionImage;
- (id)activityType;
- (int64_t)_defaultSortGroup;
- (void)prepareWithActivityExtensionItemData:(id)a3;
- (void)setIconImage:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setPhotosAssetIdentifiers:(id)a3;
- (void)setSingleUseToken:(id)a3;
- (void)setSortValue:(id)a3;
@end

@implementation UIShortcutActivity

- (UIShortcutActivity)initWithPartial:(id)a3
{
  id v4 = a3;
  v5 = [v4 applicationExtension];
  v12.receiver = self;
  v12.super_class = (Class)UIShortcutActivity;
  v6 = [(UIApplicationExtensionActivity *)&v12 initWithApplicationExtension:v5];

  if (v6)
  {
    v7 = [v4 name];
    [(UIShortcutActivity *)v6 setName:v7];

    v8 = [v4 identifier];
    [(UIShortcutActivity *)v6 setIdentifier:v8];

    v9 = [v4 iconImage];
    [(UIShortcutActivity *)v6 setIconImage:v9];

    v10 = [v4 sortValue];
    [(UIShortcutActivity *)v6 setSortValue:v10];
  }
  return v6;
}

- (UIShortcutActivity)initWithApplicationExtension:(id)a3 partialShortcutWithName:(id)a4 identifier:(id)a5 image:(id)a6 sortValue:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)UIShortcutActivity;
  v16 = [(UIApplicationExtensionActivity *)&v19 initWithApplicationExtension:a3];
  v17 = v16;
  if (v16)
  {
    [(UIShortcutActivity *)v16 setName:v12];
    [(UIShortcutActivity *)v17 setIdentifier:v13];
    [(UIShortcutActivity *)v17 setIconImage:v14];
    [(UIShortcutActivity *)v17 setSortValue:v15];
  }

  return v17;
}

- (UIShortcutActivity)initWithApplicationExtension:(id)a3 singleUseToken:(id)a4 photosAssetIdentifiers:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [(UIApplicationExtensionActivity *)self initWithApplicationExtension:a3];
  v11 = v10;
  if (v10)
  {
    [(UIShortcutActivity *)v10 setSingleUseToken:v8];
    [(UIShortcutActivity *)v11 setPhotosAssetIdentifiers:v9];
    id v12 = v11;
  }

  return v11;
}

- (int64_t)_defaultSortGroup
{
  return 6;
}

- (id)_actionImage
{
  v3 = objc_opt_class();
  id v4 = [(UIShortcutActivity *)self iconImage];
  v5 = [(UIActivity *)self contentSizeCategory];
  v6 = [v3 _actionImageForActionRepresentationImage:v4 contentSizeCategory:v5];

  return v6;
}

- (id)activityType
{
  v3 = NSString;
  id v4 = [(UIApplicationExtensionActivity *)self applicationExtension];
  v5 = [v4 identifier];
  v6 = [(UIShortcutActivity *)self identifier];
  v7 = [v3 stringWithFormat:@"%@.%@", v5, v6];

  return v7;
}

- (BOOL)_isServiceExtension
{
  return 1;
}

- (void)prepareWithActivityExtensionItemData:(id)a3
{
  id v4 = a3;
  v5 = [v4 extensionItems];
  v6 = [v5 firstObject];
  v7 = [v6 userInfo];
  id v8 = (void *)[v7 mutableCopy];

  id v9 = [(UIShortcutActivity *)self singleUseToken];
  [v8 setObject:v9 forKeyedSubscript:@"ActionExtensionWorkflowToken"];

  v10 = [(UIShortcutActivity *)self photosAssetIdentifiers];

  if (v10)
  {
    v11 = [(UIShortcutActivity *)self photosAssetIdentifiers];
    [v8 setObject:v11 forKeyedSubscript:@"WFPhotosAssetIdentifiers"];
  }
  id v12 = [v5 firstObject];
  [v12 setUserInfo:v8];

  [v4 setExtensionItems:v5];
  v13.receiver = self;
  v13.super_class = (Class)UIShortcutActivity;
  [(UIApplicationExtensionActivity *)&v13 prepareWithActivityExtensionItemData:v4];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSNumber)sortValue
{
  return self->_sortValue;
}

- (void)setSortValue:(id)a3
{
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
}

- (NSString)singleUseToken
{
  return self->_singleUseToken;
}

- (void)setSingleUseToken:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSArray)photosAssetIdentifiers
{
  return self->_photosAssetIdentifiers;
}

- (void)setPhotosAssetIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_singleUseToken, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_sortValue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end