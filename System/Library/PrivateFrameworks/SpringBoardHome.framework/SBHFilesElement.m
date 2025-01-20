@interface SBHFilesElement
+ (id)elementIdentifier;
+ (id)elementKind;
- (BOOL)iconSupportsConfiguration:(id)a3;
- (BOOL)iconSupportsRasterization:(id)a3;
- (id)configurationStorageIdentifier;
- (id)containerBundleIdentifier;
- (id)displayName;
- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4;
- (id)supportedGridSizeClasses;
@end

@implementation SBHFilesElement

+ (id)elementIdentifier
{
  return @"Files";
}

+ (id)elementKind
{
  return @"SBHSpecialAvocadoDescriptorKindFiles";
}

- (id)containerBundleIdentifier
{
  return @"com.apple.DocumentsApp";
}

- (id)displayName
{
  v2 = SBHBundle();
  v3 = [v2 localizedStringForKey:@"FILES_WIDGET_COLLECTION_NAME" value:&stru_1F2FA0300 table:@"SpringBoardHome"];

  return v3;
}

- (BOOL)iconSupportsConfiguration:(id)a3
{
  return _os_feature_enabled_impl();
}

- (id)configurationStorageIdentifier
{
  return @"com.apple.DocumentsApp";
}

- (BOOL)iconSupportsRasterization:(id)a3
{
  return 0;
}

- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4
{
  return SBHGetApplicationIconImage(@"com.apple.DocumentsApp", 0, v4, v5, v6);
}

- (id)supportedGridSizeClasses
{
  v2 = [SBHIconGridSizeClassSet alloc];
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"SBHIconGridSizeClassSmall", @"SBHIconGridSizeClassMedium", @"SBHIconGridSizeClassLarge", @"SBHIconGridSizeClassExtraLarge", 0);
  double v4 = [(SBHIconGridSizeClassSet *)v2 initWithGridSizeClasses:v3];

  return v4;
}

@end