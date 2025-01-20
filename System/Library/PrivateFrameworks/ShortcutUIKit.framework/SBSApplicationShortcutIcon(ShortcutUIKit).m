@interface SBSApplicationShortcutIcon(ShortcutUIKit)
+ (id)_scui_defaultImage;
- (id)scui_iconImageWithAssetProvider:()ShortcutUIKit;
- (uint64_t)_scui_iconImageWithAssetProvider:()ShortcutUIKit;
@end

@implementation SBSApplicationShortcutIcon(ShortcutUIKit)

- (id)scui_iconImageWithAssetProvider:()ShortcutUIKit
{
  v1 = objc_msgSend(a1, "_scui_iconImageWithAssetProvider:");
  if (!v1)
  {
    v1 = objc_msgSend((id)objc_opt_class(), "_scui_defaultImage");
  }

  return v1;
}

+ (id)_scui_defaultImage
{
  if (_scui_defaultImage_onceToken != -1) {
    dispatch_once(&_scui_defaultImage_onceToken, &__block_literal_global);
  }
  v0 = (void *)_scui_defaultImage___defaultImage;

  return v0;
}

- (uint64_t)_scui_iconImageWithAssetProvider:()ShortcutUIKit
{
  return 0;
}

@end