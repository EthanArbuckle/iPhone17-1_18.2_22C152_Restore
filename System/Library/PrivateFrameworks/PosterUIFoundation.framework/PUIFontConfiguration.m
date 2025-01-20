@interface PUIFontConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (PUIFontConfiguration)defaultFontConfiguration;
+ (PUIFontConfiguration)fontConfigurationWithPUIFont:(id)a3 extensionBundleIdentifier:(id)a4 systemItem:(BOOL)a5;
+ (PUIFontConfiguration)fontConfigurationWithPUIFont:(id)a3 extensionBundleURL:(id)a4 systemItem:(BOOL)a5;
- (BOOL)isSystemItem;
- (NSString)description;
- (NSString)uniqueIdentifier;
- (PUIFontConfiguration)init;
- (PUIFontConfiguration)initWithBSXPCCoder:(id)a3;
- (PUIFontConfiguration)initWithCoder:(id)a3;
- (id)PUIFontWithExtensionBundle:(id)a3;
- (id)PUIFontWithExtensionBundleIdentifier:(id)a3;
- (id)PUIFontWithExtensionBundleURL:(id)a3;
@end

@implementation PUIFontConfiguration

+ (PUIFontConfiguration)fontConfigurationWithPUIFont:(id)a3 extensionBundleURL:(id)a4 systemItem:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 fontIdentifier];
  [v7 weight];
  if (v9)
  {
    v11 = [[PUISystemFontConfiguration alloc] initWithFontIdentifier:v9 weight:v5 systemItem:v10];
  }
  else
  {
    v12 = [v7 customFont];
    if (v12) {
      v11 = [[PUICustomFontConfiguration alloc] initWithFont:v12 extensionBundleURL:v8];
    }
    else {
      v11 = 0;
    }
  }
  return (PUIFontConfiguration *)v11;
}

+ (PUIFontConfiguration)fontConfigurationWithPUIFont:(id)a3 extensionBundleIdentifier:(id)a4 systemItem:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = (objc_class *)MEMORY[0x263F01858];
  id v10 = a4;
  v11 = (void *)[[v9 alloc] initWithBundleIdentifier:v10 error:0];

  v12 = [v11 URL];
  if (v12)
  {
    v13 = [a1 fontConfigurationWithPUIFont:v8 extensionBundleURL:v12 systemItem:v5];
  }
  else
  {
    v13 = 0;
  }

  return (PUIFontConfiguration *)v13;
}

+ (PUIFontConfiguration)defaultFontConfiguration
{
  v2 = objc_alloc_init(PUISystemFontConfiguration);
  return (PUIFontConfiguration *)v2;
}

- (id)PUIFontWithExtensionBundle:(id)a3
{
  v4 = [a3 bundleURL];
  BOOL v5 = [(PUIFontConfiguration *)self PUIFontWithExtensionBundleURL:v4];

  return v5;
}

- (id)PUIFontWithExtensionBundleIdentifier:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F01858];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithBundleIdentifier:v5 error:0];

  id v7 = [v6 URL];
  if (v7)
  {
    id v8 = [(PUIFontConfiguration *)self PUIFontWithExtensionBundleURL:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)PUIFontWithExtensionBundleURL:(id)a3
{
  return 0;
}

- (PUIFontConfiguration)init
{
  v3 = self;
  int v4 = [(PUIFontConfiguration *)self isMemberOfClass:v3];

  if (v4)
  {
    id v5 = objc_alloc_init(PUISystemFontConfiguration);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PUIFontConfiguration;
    id v5 = [(PUIFontConfiguration *)&v8 init];
    self = &v5->super;
  }
  p_super = &v5->super;

  return p_super;
}

- (NSString)uniqueIdentifier
{
  return (NSString *)&stru_270801C00;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F29C48]);
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __35__PUIFontConfiguration_description__block_invoke;
  id v10 = &unk_265471108;
  v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  id v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __35__PUIFontConfiguration_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUIFontConfiguration)initWithCoder:(id)a3
{
  return 0;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PUIFontConfiguration)initWithBSXPCCoder:(id)a3
{
  return 0;
}

- (BOOL)isSystemItem
{
  return self->_systemItem;
}

@end