@interface PRPosterTimeFontConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (PRPosterTimeFontConfiguration)configurationWithTimeFontConfiguration:(id)a3 extensionBundleURL:(id)a4 systemItem:(BOOL)a5;
+ (PRPosterTimeFontConfiguration)defaultConfiguration;
+ (id)configurationWithTimeFontConfiguration:(id)a3 extensionBundleIdentifier:(id)a4 systemItem:(BOOL)a5;
- (BOOL)isSystemItem;
- (NSString)description;
- (NSString)uniqueIdentifier;
- (PRPosterTimeFontConfiguration)init;
- (PRPosterTimeFontConfiguration)initWithBSXPCCoder:(id)a3;
- (PRPosterTimeFontConfiguration)initWithCoder:(id)a3;
- (PRPosterTimeFontConfiguration)timeFontConfigurationWithExtensionBundle:(id)a3;
- (PRPosterTimeFontConfiguration)timeFontConfigurationWithExtensionBundleIdentifier:(id)a3;
- (PRPosterTimeFontConfiguration)timeFontConfigurationWithExtensionBundleURL:(id)a3;
- (id)timeFontIdentifier;
@end

@implementation PRPosterTimeFontConfiguration

+ (PRPosterTimeFontConfiguration)configurationWithTimeFontConfiguration:(id)a3 extensionBundleURL:(id)a4 systemItem:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"PRPosterTimeFontConfiguration.m", 26, @"Invalid parameter not satisfying: %@", @"timeFontConfiguration != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, a1, @"PRPosterTimeFontConfiguration.m", 27, @"Invalid parameter not satisfying: %@", @"extensionBundleURL != nil" object file lineNumber description];

LABEL_3:
  v12 = [v9 timeFontIdentifier];
  [v9 weight];
  if (v12)
  {
    v14 = [[PRPosterSystemTimeFontConfiguration alloc] initWithTimeFontIdentifier:v12 weight:v5 systemItem:v13];
  }
  else
  {
    v15 = [v9 customFont];
    if (v15) {
      v14 = [[PRPosterCustomTimeFontConfiguration alloc] initWithFont:v15 extensionBundleURL:v11];
    }
    else {
      v14 = 0;
    }
  }
  return (PRPosterTimeFontConfiguration *)v14;
}

+ (id)configurationWithTimeFontConfiguration:(id)a3 extensionBundleIdentifier:(id)a4 systemItem:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = (objc_class *)MEMORY[0x1E4F223A0];
  id v10 = a4;
  v11 = (void *)[[v9 alloc] initWithBundleIdentifier:v10 error:0];

  v12 = [v11 URL];
  if (v12)
  {
    double v13 = [a1 configurationWithTimeFontConfiguration:v8 extensionBundleURL:v12 systemItem:v5];
  }
  else
  {
    double v13 = 0;
  }

  return v13;
}

+ (PRPosterTimeFontConfiguration)defaultConfiguration
{
  v2 = objc_alloc_init(PRPosterSystemTimeFontConfiguration);
  return (PRPosterTimeFontConfiguration *)v2;
}

- (PRPosterTimeFontConfiguration)timeFontConfigurationWithExtensionBundle:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PRPosterTimeFontConfiguration.m", 58, @"Invalid parameter not satisfying: %@", @"extensionBundle != nil" object file lineNumber description];
  }
  v6 = [v5 bundleURL];
  v7 = [(PRPosterTimeFontConfiguration *)self timeFontConfigurationWithExtensionBundleURL:v6];

  return (PRPosterTimeFontConfiguration *)v7;
}

- (PRPosterTimeFontConfiguration)timeFontConfigurationWithExtensionBundleIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PRPosterTimeFontConfiguration.m", 63, @"Invalid parameter not satisfying: %@", @"extensionBundleIdentifier != nil" object file lineNumber description];
  }
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F223A0]) initWithBundleIdentifier:v5 error:0];
  v7 = [v6 URL];
  if (v7)
  {
    id v8 = [(PRPosterTimeFontConfiguration *)self timeFontConfigurationWithExtensionBundleURL:v7];
  }
  else
  {
    id v8 = 0;
  }

  return (PRPosterTimeFontConfiguration *)v8;
}

- (PRPosterTimeFontConfiguration)timeFontConfigurationWithExtensionBundleURL:(id)a3
{
  return 0;
}

- (PRPosterTimeFontConfiguration)init
{
  v3 = self;
  int v4 = [(PRPosterTimeFontConfiguration *)self isMemberOfClass:v3];

  if (v4)
  {
    id v5 = objc_alloc_init(PRPosterSystemTimeFontConfiguration);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PRPosterTimeFontConfiguration;
    id v5 = [(PRPosterTimeFontConfiguration *)&v8 init];
    self = &v5->super;
  }
  p_super = &v5->super;

  return p_super;
}

- (NSString)uniqueIdentifier
{
  return (NSString *)&stru_1ED9A3120;
}

- (id)timeFontIdentifier
{
  return 0;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __44__PRPosterTimeFontConfiguration_description__block_invoke;
  id v10 = &unk_1E54DAA08;
  v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  id v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __44__PRPosterTimeFontConfiguration_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRPosterTimeFontConfiguration)initWithCoder:(id)a3
{
  return 0;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRPosterTimeFontConfiguration)initWithBSXPCCoder:(id)a3
{
  return 0;
}

- (BOOL)isSystemItem
{
  return self->_systemItem;
}

@end