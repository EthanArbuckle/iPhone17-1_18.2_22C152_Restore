@interface PRPosterCustomTimeFontConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)extensionBundleRelativeFilePath;
- (NSString)fontPostScriptName;
- (PRPosterCustomTimeFontConfiguration)initWithBSXPCCoder:(id)a3;
- (PRPosterCustomTimeFontConfiguration)initWithCoder:(id)a3;
- (PRPosterCustomTimeFontConfiguration)initWithFont:(id)a3 extensionBundle:(id)a4;
- (PRPosterCustomTimeFontConfiguration)initWithFont:(id)a3 extensionBundleURL:(id)a4;
- (PRPosterCustomTimeFontConfiguration)initWithFontPostScriptName:(id)a3 extensionBundleRelativeFilePath:(id)a4;
- (PRPosterCustomTimeFontConfiguration)timeFontConfigurationWithExtensionBundleURL:(id)a3;
- (id)fontWithExtensionBundleURL:(id)a3;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRPosterCustomTimeFontConfiguration

- (PRPosterCustomTimeFontConfiguration)initWithFontPostScriptName:(id)a3 extensionBundleRelativeFilePath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PRPosterTimeFontConfiguration.m", 313, @"Invalid parameter not satisfying: %@", @"fontPostScriptName" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"PRPosterTimeFontConfiguration.m", 314, @"Invalid parameter not satisfying: %@", @"extensionBundleRelativeFilePath" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)PRPosterCustomTimeFontConfiguration;
  v10 = [(PRPosterTimeFontConfiguration *)&v18 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    fontPostScriptName = v10->_fontPostScriptName;
    v10->_fontPostScriptName = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    extensionBundleRelativeFilePath = v10->_extensionBundleRelativeFilePath;
    v10->_extensionBundleRelativeFilePath = (NSString *)v13;
  }
  return v10;
}

- (PRPosterCustomTimeFontConfiguration)initWithFont:(id)a3 extensionBundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PRPosterTimeFontConfiguration.m", 324, @"Invalid parameter not satisfying: %@", @"font" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_8:
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PRPosterTimeFontConfiguration.m", 325, @"Invalid parameter not satisfying: %@", @"extensionBundle" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_8;
  }
LABEL_3:
  v10 = objc_msgSend(v7, "pr_postScriptName");
  uint64_t v11 = objc_msgSend(v7, "pr_referencePathRelativeToBundle:", v9);
  v12 = (void *)v11;
  uint64_t v13 = 0;
  if (v10 && v11)
  {
    self = [(PRPosterCustomTimeFontConfiguration *)self initWithFontPostScriptName:v10 extensionBundleRelativeFilePath:v11];
    uint64_t v13 = self;
  }

  return v13;
}

- (PRPosterCustomTimeFontConfiguration)initWithFont:(id)a3 extensionBundleURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PRPosterTimeFontConfiguration.m", 336, @"Invalid parameter not satisfying: %@", @"font" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_8:
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PRPosterTimeFontConfiguration.m", 337, @"Invalid parameter not satisfying: %@", @"extensionBundleURL" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_8;
  }
LABEL_3:
  v10 = objc_msgSend(v7, "pr_postScriptName");
  uint64_t v11 = objc_msgSend(v7, "pr_referencePathRelativeToDirectoryAtURL:", v9);
  v12 = (void *)v11;
  uint64_t v13 = 0;
  if (v10 && v11)
  {
    self = [(PRPosterCustomTimeFontConfiguration *)self initWithFontPostScriptName:v10 extensionBundleRelativeFilePath:v11];
    uint64_t v13 = self;
  }

  return v13;
}

- (PRPosterCustomTimeFontConfiguration)timeFontConfigurationWithExtensionBundleURL:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PRPosterTimeFontConfiguration.m", 348, @"Invalid parameter not satisfying: %@", @"extensionBundleURL != nil" object file lineNumber description];
  }
  v6 = [(PRPosterCustomTimeFontConfiguration *)self fontPostScriptName];
  id v7 = [(PRPosterCustomTimeFontConfiguration *)self extensionBundleRelativeFilePath];
  id v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "pr_fontWithPostScriptName:inBundleAtURL:relativePath:", v6, v5, v7);
  if (v8) {
    v9 = [[PRTimeFontConfiguration alloc] initWithCustomFont:v8];
  }
  else {
    v9 = 0;
  }

  return (PRPosterCustomTimeFontConfiguration *)v9;
}

- (id)fontWithExtensionBundleURL:(id)a3
{
  id v4 = a3;
  id v5 = [(PRPosterCustomTimeFontConfiguration *)self fontPostScriptName];
  uint64_t v6 = [(PRPosterCustomTimeFontConfiguration *)self extensionBundleRelativeFilePath];
  id v7 = (void *)v6;
  id v8 = 0;
  if (v5 && v6)
  {
    id v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "pr_fontWithPostScriptName:inBundleAtURL:relativePath:", v5, v4, v6);
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PRPosterCustomTimeFontConfiguration *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    id v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = v4;
      id v8 = [(PRPosterCustomTimeFontConfiguration *)self fontPostScriptName];
      v9 = [(PRPosterCustomTimeFontConfiguration *)v7 fontPostScriptName];
      int v10 = BSEqualObjects();

      if (v10)
      {
        uint64_t v11 = [(PRPosterCustomTimeFontConfiguration *)self extensionBundleRelativeFilePath];
        v12 = [(PRPosterCustomTimeFontConfiguration *)v7 extensionBundleRelativeFilePath];
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
  v3 = [(PRPosterCustomTimeFontConfiguration *)self fontPostScriptName];
  uint64_t v4 = [v3 hash];
  id v5 = [(PRPosterCustomTimeFontConfiguration *)self extensionBundleRelativeFilePath];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(PRPosterCustomTimeFontConfiguration *)self fontPostScriptName];
  [v7 appendString:v4 withName:@"fontPostScriptName"];

  id v5 = [(PRPosterCustomTimeFontConfiguration *)self extensionBundleRelativeFilePath];
  id v6 = (id)[v7 appendObject:v5 withName:@"extensionBundleRelativeFilePath"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PRPosterCustomTimeFontConfiguration *)self fontPostScriptName];
  [v4 encodeObject:v5 forKey:@"fontPostScriptName"];

  id v6 = [(PRPosterCustomTimeFontConfiguration *)self extensionBundleRelativeFilePath];
  [v4 encodeObject:v6 forKey:@"extensionBundleRelativeFilePath"];
}

- (PRPosterCustomTimeFontConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"fontPostScriptName"];

  id v7 = self;
  id v8 = [v4 decodeObjectOfClass:v7 forKey:@"extensionBundleRelativeFilePath"];

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
    self = [(PRPosterCustomTimeFontConfiguration *)self initWithFontPostScriptName:v6 extensionBundleRelativeFilePath:v8];
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
  id v5 = [(PRPosterCustomTimeFontConfiguration *)self fontPostScriptName];
  [v4 encodeObject:v5 forKey:@"fontPostScriptName"];

  id v6 = [(PRPosterCustomTimeFontConfiguration *)self extensionBundleRelativeFilePath];
  [v4 encodeObject:v6 forKey:@"extensionBundleRelativeFilePath"];
}

- (PRPosterCustomTimeFontConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"fontPostScriptName"];

  id v7 = self;
  id v8 = [v4 decodeObjectOfClass:v7 forKey:@"extensionBundleRelativeFilePath"];

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
    self = [(PRPosterCustomTimeFontConfiguration *)self initWithFontPostScriptName:v6 extensionBundleRelativeFilePath:v8];
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