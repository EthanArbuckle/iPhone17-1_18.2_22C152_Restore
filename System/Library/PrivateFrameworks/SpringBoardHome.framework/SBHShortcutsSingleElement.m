@interface SBHShortcutsSingleElement
+ (id)elementIdentifier;
+ (id)elementKind;
- (BOOL)iconSupportsConfiguration:(id)a3;
- (id)configurationStorageIdentifier;
- (id)containerBundleIdentifier;
- (id)displayName;
- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4;
- (id)supportedGridSizeClasses;
@end

@implementation SBHShortcutsSingleElement

+ (id)elementIdentifier
{
  return @"Shortcuts";
}

+ (id)elementKind
{
  return @"SBHSpecialAvocadoDescriptorKindShortcutsSingle";
}

- (id)containerBundleIdentifier
{
  return @"com.apple.shortcuts";
}

- (id)displayName
{
  v2 = SBHBundle();
  v3 = [v2 localizedStringForKey:@"SHORTCUTS_WIDGET_COLLECTION_NAME" value:&stru_1F2FA0300 table:@"SpringBoardHome"];

  return v3;
}

- (BOOL)iconSupportsConfiguration:(id)a3
{
  return 1;
}

- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4
{
  return SBHGetApplicationIconImage(@"com.apple.shortcuts", 0, v4, v5, v6);
}

- (id)configurationStorageIdentifier
{
  return @"com.apple.shortcuts";
}

- (id)supportedGridSizeClasses
{
  v2 = [[SBHIconGridSizeClassSet alloc] initWithGridSizeClass:@"SBHIconGridSizeClassSmall"];
  return v2;
}

@end