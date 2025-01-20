@interface PUICustomFontConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)extensionBundleRelativeFilePath;
- (NSString)fontPostScriptName;
- (PUICustomFontConfiguration)initWithBSXPCCoder:(id)a3;
- (PUICustomFontConfiguration)initWithCoder:(id)a3;
- (PUICustomFontConfiguration)initWithFont:(id)a3 extensionBundle:(id)a4;
- (PUICustomFontConfiguration)initWithFont:(id)a3 extensionBundleURL:(id)a4;
- (PUICustomFontConfiguration)initWithFontPostScriptName:(id)a3 extensionBundleRelativeFilePath:(id)a4;
- (id)PUIFontWithExtensionBundleURL:(id)a3;
- (id)fontWithExtensionBundleURL:(id)a3;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PUICustomFontConfiguration

- (PUICustomFontConfiguration)initWithFontPostScriptName:(id)a3 extensionBundleRelativeFilePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PUICustomFontConfiguration;
  v8 = [(PUIFontConfiguration *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    fontPostScriptName = v8->_fontPostScriptName;
    v8->_fontPostScriptName = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    extensionBundleRelativeFilePath = v8->_extensionBundleRelativeFilePath;
    v8->_extensionBundleRelativeFilePath = (NSString *)v11;
  }
  return v8;
}

- (PUICustomFontConfiguration)initWithFont:(id)a3 extensionBundle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_msgSend(v7, "pui_postScriptName");
  uint64_t v9 = objc_msgSend(v7, "pui_referencePathRelativeToBundle:", v6);

  v10 = 0;
  if (v8 && v9)
  {
    self = [(PUICustomFontConfiguration *)self initWithFontPostScriptName:v8 extensionBundleRelativeFilePath:v9];
    v10 = self;
  }

  return v10;
}

- (PUICustomFontConfiguration)initWithFont:(id)a3 extensionBundleURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_msgSend(v7, "pui_postScriptName");
  uint64_t v9 = objc_msgSend(v7, "pui_referencePathRelativeToDirectoryAtURL:", v6);

  v10 = 0;
  if (v8 && v9)
  {
    self = [(PUICustomFontConfiguration *)self initWithFontPostScriptName:v8 extensionBundleRelativeFilePath:v9];
    v10 = self;
  }

  return v10;
}

- (id)PUIFontWithExtensionBundleURL:(id)a3
{
  id v4 = a3;
  v5 = [(PUICustomFontConfiguration *)self fontPostScriptName];
  id v6 = [(PUICustomFontConfiguration *)self extensionBundleRelativeFilePath];
  id v7 = objc_msgSend(MEMORY[0x263F1C658], "pui_UIFontWithPostScriptName:inBundleAtURL:relativePath:", v5, v4, v6);

  if (v7) {
    v8 = [[PUIFont alloc] initWithCustomFont:v7];
  }
  else {
    v8 = 0;
  }

  return v8;
}

- (id)fontWithExtensionBundleURL:(id)a3
{
  id v4 = a3;
  v5 = [(PUICustomFontConfiguration *)self fontPostScriptName];
  uint64_t v6 = [(PUICustomFontConfiguration *)self extensionBundleRelativeFilePath];
  id v7 = (void *)v6;
  v8 = 0;
  if (v5 && v6)
  {
    v8 = objc_msgSend(MEMORY[0x263F1C658], "pui_UIFontWithPostScriptName:inBundleAtURL:relativePath:", v5, v4, v6);
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PUICustomFontConfiguration *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = v4;
      v8 = [(PUICustomFontConfiguration *)self fontPostScriptName];
      uint64_t v9 = [(PUICustomFontConfiguration *)v7 fontPostScriptName];
      int v10 = BSEqualObjects();

      if (v10)
      {
        uint64_t v11 = [(PUICustomFontConfiguration *)self extensionBundleRelativeFilePath];
        v12 = [(PUICustomFontConfiguration *)v7 extensionBundleRelativeFilePath];
        char v13 = BSEqualObjects();
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = [(PUICustomFontConfiguration *)self fontPostScriptName];
  uint64_t v4 = [v3 hash];
  v5 = [(PUICustomFontConfiguration *)self extensionBundleRelativeFilePath];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(PUICustomFontConfiguration *)self fontPostScriptName];
  [v7 appendString:v4 withName:@"fontPostScriptName"];

  v5 = [(PUICustomFontConfiguration *)self extensionBundleRelativeFilePath];
  id v6 = (id)[v7 appendObject:v5 withName:@"extensionBundleRelativeFilePath"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PUICustomFontConfiguration *)self fontPostScriptName];
  [v4 encodeObject:v5 forKey:@"fontPostScriptName"];

  id v6 = [(PUICustomFontConfiguration *)self extensionBundleRelativeFilePath];
  [v4 encodeObject:v6 forKey:@"extensionBundleRelativeFilePath"];
}

- (PUICustomFontConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"fontPostScriptName"];

  id v7 = self;
  v8 = [v4 decodeObjectOfClass:v7 forKey:@"extensionBundleRelativeFilePath"];

  if (v6) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    int v10 = 0;
  }
  else
  {
    self = [(PUICustomFontConfiguration *)self initWithFontPostScriptName:v6 extensionBundleRelativeFilePath:v8];
    int v10 = self;
  }

  return v10;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PUICustomFontConfiguration *)self fontPostScriptName];
  [v4 encodeObject:v5 forKey:@"fontPostScriptName"];

  id v6 = [(PUICustomFontConfiguration *)self extensionBundleRelativeFilePath];
  [v4 encodeObject:v6 forKey:@"extensionBundleRelativeFilePath"];
}

- (PUICustomFontConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"fontPostScriptName"];

  id v7 = self;
  v8 = [v4 decodeObjectOfClass:v7 forKey:@"extensionBundleRelativeFilePath"];

  if (v6) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    int v10 = 0;
  }
  else
  {
    self = [(PUICustomFontConfiguration *)self initWithFontPostScriptName:v6 extensionBundleRelativeFilePath:v8];
    int v10 = self;
  }

  return v10;
}

- (NSString)fontPostScriptName
{
  return self->_fontPostScriptName;
}

- (NSString)extensionBundleRelativeFilePath
{
  return self->_extensionBundleRelativeFilePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionBundleRelativeFilePath, 0);
  objc_storeStrong((id *)&self->_fontPostScriptName, 0);
}

@end