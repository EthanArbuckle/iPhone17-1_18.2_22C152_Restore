@interface SBHWidgetIconStyleConfiguration
+ (id)_buildColorMatrixFilterForColor:(id)a3;
- (BOOL)_isCrystalLinked;
- (BOOL)_isDawnLinked;
- (BOOL)isAccented;
- (BOOL)isBackgroundRemovable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToWidgetIconStyleConfiguration:(id)a3;
- (CHSWidgetDescriptor)widgetDescriptor;
- (CHSWidgetExtension)widgetExtension;
- (NSString)containingApplicationBundleIdentifier;
- (NSString)widgetBundleIdentifier;
- (SBHIconImageAppearance)imageAppearance;
- (SBHWidgetDisplayConfiguration)customDisplayConfiguration;
- (SBHWidgetIconStyleConfiguration)initWithContainingApplicationBundleIdentifier:(id)a3 imageAppearance:(id)a4 customDisplayConfiguration:(id)a5;
- (SBHWidgetIconStyleConfiguration)initWithWidgetDataSource:(id)a3 gridSizeClass:(id)a4 widgetViewController:(id)a5 widgetExtensionProvider:(id)a6 imageAppearance:(id)a7 customDisplayConfiguration:(id)a8;
- (SBHWidgetIconStyleConfiguration)initWithWidgetExtension:(id)a3 widgetDescriptor:(id)a4 imageAppearance:(id)a5 customDisplayConfiguration:(id)a6;
- (SBLeafIconDataSource)widgetDataSource;
- (UIViewController)widgetViewController;
- (id)appropriateColorFilter;
- (id)appropriateWidgetRenderScheme;
- (id)appropriateWidgetTintParameters;
- (id)bundleRecord;
- (id)description;
- (int64_t)backgroundType;
- (unint64_t)hash;
- (void)_generateParameters;
- (void)setWidgetDescriptor:(id)a3;
@end

@implementation SBHWidgetIconStyleConfiguration

- (SBHWidgetIconStyleConfiguration)initWithWidgetExtension:(id)a3 widgetDescriptor:(id)a4 imageAppearance:(id)a5 customDisplayConfiguration:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SBHWidgetIconStyleConfiguration;
  v15 = [(SBHWidgetIconStyleConfiguration *)&v24 init];
  if (v15)
  {
    uint64_t v16 = [v13 copy];
    imageAppearance = v15->_imageAppearance;
    v15->_imageAppearance = (SBHIconImageAppearance *)v16;

    objc_storeStrong((id *)&v15->_widgetDescriptor, a4);
    objc_storeStrong((id *)&v15->_widgetExtension, a3);
    v18 = [v11 identity];
    uint64_t v19 = [v18 extensionBundleIdentifier];
    widgetBundleIdentifier = v15->_widgetBundleIdentifier;
    v15->_widgetBundleIdentifier = (NSString *)v19;

    uint64_t v21 = [v14 copy];
    customDisplayConfiguration = v15->_customDisplayConfiguration;
    v15->_customDisplayConfiguration = (SBHWidgetDisplayConfiguration *)v21;
  }
  return v15;
}

- (SBHWidgetIconStyleConfiguration)initWithWidgetDataSource:(id)a3 gridSizeClass:(id)a4 widgetViewController:(id)a5 widgetExtensionProvider:(id)a6 imageAppearance:(id)a7 customDisplayConfiguration:(id)a8
{
  id v13 = a3;
  id v15 = a3;
  id v16 = a4;
  id v30 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = a7;
  v20 = self;
  LOBYTE(a7) = objc_opt_isKindOfClass();

  v31 = v16;
  v29 = v17;
  if (a7)
  {
    id v21 = v15;
    v22 = [v21 chsWidgetWithGridSizeClass:v16 intent:0];
    uint64_t v23 = objc_msgSend(v17, "sbh_extensionForWidget:", v22);
    objc_msgSend(v17, "sbh_descriptorForWidgetIdentifiable:", v21);
    id v24 = v13;
    v26 = id v25 = a5;

    v27 = [(SBHWidgetIconStyleConfiguration *)self initWithWidgetExtension:v23 widgetDescriptor:v26 imageAppearance:v19 customDisplayConfiguration:v18];
    id v18 = (id)v26;
    a5 = v25;
    id v13 = v24;
    id v19 = (id)v23;
  }
  else
  {
    v22 = SBHContainerBundleIdentifierForDataSource(v15);
    v27 = [(SBHWidgetIconStyleConfiguration *)self initWithContainingApplicationBundleIdentifier:v22 imageAppearance:v19 customDisplayConfiguration:v18];
  }

  if (v27)
  {
    objc_storeStrong((id *)&v27->_widgetDataSource, v13);
    objc_storeStrong((id *)&v27->_widgetViewController, a5);
  }

  return v27;
}

- (SBHWidgetIconStyleConfiguration)initWithContainingApplicationBundleIdentifier:(id)a3 imageAppearance:(id)a4 customDisplayConfiguration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SBHWidgetIconStyleConfiguration;
  id v11 = [(SBHWidgetIconStyleConfiguration *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    imageAppearance = v11->_imageAppearance;
    v11->_imageAppearance = (SBHIconImageAppearance *)v12;

    uint64_t v14 = [v8 copy];
    containingApplicationBundleIdentifier = v11->_containingApplicationBundleIdentifier;
    v11->_containingApplicationBundleIdentifier = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    customDisplayConfiguration = v11->_customDisplayConfiguration;
    v11->_customDisplayConfiguration = (SBHWidgetDisplayConfiguration *)v16;
  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBHWidgetIconStyleConfiguration *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(SBHWidgetIconStyleConfiguration *)self isEqualToWidgetIconStyleConfiguration:v4];
  }

  return v5;
}

- (BOOL)isEqualToWidgetIconStyleConfiguration:(id)a3
{
  v4 = (SBHWidgetIconStyleConfiguration *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    char v40 = 1;
  }
  else
  {
    v6 = [(SBHWidgetIconStyleConfiguration *)v4 containingApplicationBundleIdentifier];
    v7 = [(SBHWidgetIconStyleConfiguration *)self containingApplicationBundleIdentifier];
    int v8 = BSEqualStrings();

    if (!v8) {
      goto LABEL_15;
    }
    id v9 = [(SBHWidgetIconStyleConfiguration *)v5 widgetBundleIdentifier];
    id v10 = [(SBHWidgetIconStyleConfiguration *)self widgetBundleIdentifier];
    int v11 = BSEqualStrings();

    if (!v11) {
      goto LABEL_15;
    }
    uint64_t v12 = [(SBHWidgetIconStyleConfiguration *)v5 widgetDescriptor];
    id v13 = [(SBHWidgetIconStyleConfiguration *)self widgetDescriptor];
    int v14 = BSEqualObjects();

    if (!v14) {
      goto LABEL_15;
    }
    id v15 = [(SBHWidgetIconStyleConfiguration *)v5 widgetExtension];
    uint64_t v16 = [(SBHWidgetIconStyleConfiguration *)self widgetExtension];
    int v17 = BSEqualObjects();

    if (!v17) {
      goto LABEL_15;
    }
    id v18 = [(SBHWidgetIconStyleConfiguration *)v5 imageAppearance];
    objc_super v19 = [(SBHWidgetIconStyleConfiguration *)self imageAppearance];
    int v20 = BSEqualObjects();

    if (!v20) {
      goto LABEL_15;
    }
    id v21 = [(SBHWidgetIconStyleConfiguration *)v5 appropriateWidgetRenderScheme];
    v22 = [(SBHWidgetIconStyleConfiguration *)self appropriateWidgetRenderScheme];
    int v23 = BSEqualObjects();

    if (!v23) {
      goto LABEL_15;
    }
    id v24 = [(SBHWidgetIconStyleConfiguration *)v5 appropriateWidgetTintParameters];
    id v25 = [(SBHWidgetIconStyleConfiguration *)self appropriateWidgetTintParameters];
    int v26 = BSEqualObjects();

    if (!v26) {
      goto LABEL_15;
    }
    v27 = [(SBHWidgetIconStyleConfiguration *)v5 appropriateColorFilter];
    v28 = [(SBHWidgetIconStyleConfiguration *)self appropriateColorFilter];
    int v29 = BSEqualObjects();

    if (!v29) {
      goto LABEL_15;
    }
    BOOL v30 = [(SBHWidgetIconStyleConfiguration *)v5 isBackgroundRemovable];
    if (v30 != [(SBHWidgetIconStyleConfiguration *)self isBackgroundRemovable]) {
      goto LABEL_15;
    }
    uint64_t v31 = [(SBHWidgetIconStyleConfiguration *)v5 backgroundType];
    if (v31 != [(SBHWidgetIconStyleConfiguration *)self backgroundType]) {
      goto LABEL_15;
    }
    v32 = [(SBHWidgetIconStyleConfiguration *)v5 widgetDataSource];
    v33 = [(SBHWidgetIconStyleConfiguration *)self widgetDataSource];
    int v34 = BSEqualObjects();

    if (!v34) {
      goto LABEL_15;
    }
    v35 = [(SBHWidgetIconStyleConfiguration *)v5 widgetViewController];
    v36 = [(SBHWidgetIconStyleConfiguration *)self widgetViewController];
    int v37 = BSEqualObjects();

    if (v37)
    {
      v38 = [(SBHWidgetIconStyleConfiguration *)v5 customDisplayConfiguration];
      v39 = [(SBHWidgetIconStyleConfiguration *)self customDisplayConfiguration];
      char v40 = BSEqualObjects();
    }
    else
    {
LABEL_15:
      char v40 = 0;
    }
  }

  return v40;
}

- (unint64_t)hash
{
  uint64_t v3 = [(CHSWidgetDescriptor *)self->_widgetDescriptor hash];
  uint64_t v4 = [(SBLeafIconDataSource *)self->_widgetDataSource hash] ^ v3;
  uint64_t v5 = [(CHSWidgetExtension *)self->_widgetExtension hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_containingApplicationBundleIdentifier hash];
  unint64_t v7 = [(SBHIconImageAppearance *)self->_imageAppearance hash];
  uint64_t v8 = v7 ^ [(CHSWidgetRenderScheme *)self->_appropriateWidgetRenderScheme hash];
  uint64_t v9 = v6 ^ v8 ^ [(CHSWidgetTintParameters *)self->_appropriateWidgetTintParameters hash];
  uint64_t v10 = [(CAFilter *)self->_appropriateColorFilter hash];
  uint64_t v11 = v10 ^ [(UIViewController *)self->_widgetViewController hash];
  return v9 ^ v11 ^ [(SBHWidgetDisplayConfiguration *)self->_customDisplayConfiguration hash] ^ self->_isBackgroundRemovable ^ self->_backgroundType;
}

- (id)description
{
  if (!self->_didGenerate) {
    [(SBHWidgetIconStyleConfiguration *)self _generateParameters];
  }
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendPointer:self->_widgetDescriptor withName:@"_widgetDescriptor"];
  id v5 = (id)[v3 appendObject:self->_widgetDataSource withName:@"_widgetDataSource" skipIfNil:1];
  id v6 = (id)[v3 appendObject:self->_widgetExtension withName:@"_widgetExtension" skipIfNil:1];
  id v7 = (id)[v3 appendObject:self->_containingApplicationBundleIdentifier withName:@"_containingApplicationBundleIdentifier" skipIfNil:1];
  id v8 = (id)[v3 appendObject:self->_imageAppearance withName:@"_imageAppearance" skipIfNil:1];
  id v9 = (id)[v3 appendObject:self->_appropriateWidgetRenderScheme withName:@"_appropriateWidgetRenderScheme" skipIfNil:1];
  id v10 = (id)[v3 appendObject:self->_appropriateWidgetTintParameters withName:@"_appropriateWidgetTintParameters" skipIfNil:1];
  id v11 = (id)[v3 appendObject:self->_appropriateColorFilter withName:@"_appropriateColorFilter" skipIfNil:1];
  id v12 = (id)[v3 appendBool:self->_isBackgroundRemovable withName:@"_isBackgroundRemovable"];
  unint64_t backgroundType = self->_backgroundType;
  if (backgroundType > 2) {
    int v14 = 0;
  }
  else {
    int v14 = off_1E6AB48A8[backgroundType];
  }
  id v15 = (id)[v3 appendObject:v14 withName:@"_backgroundType"];
  id v16 = (id)[v3 appendObject:self->_widgetViewController withName:@"_widgetViewController" skipIfNil:1];
  id v17 = (id)[v3 appendObject:self->_customDisplayConfiguration withName:@"_customDisplayConfiguration" skipIfNil:1];
  id v18 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBHWidgetIconStyleConfiguration _isCrystalLinked](self, "_isCrystalLinked"), @"isCrystalLinked");
  id v19 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBHWidgetIconStyleConfiguration _isDawnLinked](self, "_isDawnLinked"), @"isDawnLinked");
  int v20 = [v3 build];

  return v20;
}

- (id)appropriateWidgetRenderScheme
{
  [(SBHWidgetIconStyleConfiguration *)self _generateParameters];
  appropriateWidgetRenderScheme = self->_appropriateWidgetRenderScheme;
  if (appropriateWidgetRenderScheme) {
    id v4 = appropriateWidgetRenderScheme;
  }
  else {
    id v4 = (CHSWidgetRenderScheme *)objc_opt_new();
  }
  return v4;
}

- (id)appropriateWidgetTintParameters
{
  [(SBHWidgetIconStyleConfiguration *)self _generateParameters];
  appropriateWidgetTintParameters = self->_appropriateWidgetTintParameters;
  return appropriateWidgetTintParameters;
}

- (id)appropriateColorFilter
{
  [(SBHWidgetIconStyleConfiguration *)self _generateParameters];
  appropriateColorFilter = self->_appropriateColorFilter;
  return appropriateColorFilter;
}

- (BOOL)isBackgroundRemovable
{
  return self->_isBackgroundRemovable;
}

- (int64_t)backgroundType
{
  return self->_backgroundType;
}

- (BOOL)isAccented
{
  v2 = [(SBHWidgetIconStyleConfiguration *)self imageAppearance];
  BOOL v3 = [v2 appearanceType] == 2;

  return v3;
}

- (void)_generateParameters
{
  if (self->_didGenerate) {
    return;
  }
  id v45 = [(SBHWidgetIconStyleConfiguration *)self widgetExtension];
  BOOL v3 = [(SBHWidgetIconStyleConfiguration *)self imageAppearance];
  id v4 = [(SBHWidgetIconStyleConfiguration *)self customDisplayConfiguration];
  if ([v3 appearanceType] == 2)
  {
    id v5 = [v3 tintColor];
  }
  else
  {
    id v5 = 0;
  }
  BOOL v6 = [(SBHWidgetIconStyleConfiguration *)self _isCrystalLinked];
  BOOL v7 = [(SBHWidgetIconStyleConfiguration *)self _isDawnLinked];
  BOOL v8 = [(SBHWidgetIconStyleConfiguration *)self isAccented];
  id v9 = [(SBHWidgetIconStyleConfiguration *)self widgetDataSource];
  id v10 = [(SBHWidgetIconStyleConfiguration *)self widgetViewController];
  if (v9)
  {
    BOOL v11 = +[SBHWidgetStackViewController _shouldDrawSystemBackgroundMaterialForWidget:v9 widgetViewController:v10];
    if (v4)
    {
LABEL_7:
      self->_unint64_t backgroundType = 0;
      id v12 = [v4 renderScheme];
      id v13 = (CHSWidgetRenderScheme *)[v12 copy];
      appropriateWidgetRenderScheme = self->_appropriateWidgetRenderScheme;
      self->_appropriateWidgetRenderScheme = v13;

      id v15 = [v4 tintParameters];
      id v16 = (CHSWidgetTintParameters *)[(NSString *)v15 copy];
      appropriateWidgetTintParameters = self->_appropriateWidgetTintParameters;
      self->_appropriateWidgetTintParameters = v16;

LABEL_8:
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v11 = 0;
    if (v4) {
      goto LABEL_7;
    }
  }
  if (v45)
  {
    BOOL v42 = v11;
    id v19 = [(SBHWidgetIconStyleConfiguration *)self widgetDescriptor];
    id v18 = v19;
    BOOL v43 = v6;
    if (v19) {
      unsigned int v20 = [(CAFilter *)v19 isBackgroundRemovable];
    }
    else {
      unsigned int v20 = 0;
    }
    self->_isBackgroundRemovable = v20;
    appropriateColorFilter = self->_appropriateColorFilter;
    self->_appropriateColorFilter = 0;

    v44 = objc_opt_new();
    v41 = v5;
    unint64_t v40 = __PAIR64__(v20, v8);
    if (v43)
    {
      if (v18) {
        unsigned int v20 = [(CAFilter *)v18 supportsAccentedContent];
      }
      if (v8)
      {
        id v25 = objc_alloc_init(MEMORY[0x1E4F58D70]);
        if (v20)
        {
          int v26 = [v5 BSColor];
          v27 = [MEMORY[0x1E4FB1618] whiteColor];
          v28 = [v27 BSColor];

          [v25 setPrimaryTintColor:v26];
          [v25 setSecondaryTintColor:v28];
          [v25 setFilterStyle:0];
          [v25 setFraction:1.0];

          int64_t v29 = 2;
          uint64_t v30 = 2;
        }
        else
        {
          v35 = [(id)objc_opt_class() _buildColorMatrixFilterForColor:v5];
          uint64_t v30 = 0;
          int v26 = self->_appropriateColorFilter;
          self->_appropriateColorFilter = v35;
          int64_t v29 = v42;
        }
      }
      else
      {
        id v25 = 0;
        uint64_t v30 = 0;
        int64_t v29 = v42;
      }
      objc_msgSend(v44, "setRenderingMode:", v30, v40);
    }
    else
    {
      BOOL v31 = (v7 & v20 & v8) == 0;
      if ((v7 & v20 & v8) != 0) {
        uint64_t v30 = 2;
      }
      else {
        uint64_t v30 = 0;
      }
      BOOL v32 = v8;
      if (v31) {
        int64_t v29 = v42;
      }
      else {
        int64_t v29 = 2;
      }
      if (v32)
      {
        v33 = [(id)objc_opt_class() _buildColorMatrixFilterForColor:v5];
        int v34 = self->_appropriateColorFilter;
        self->_appropriateColorFilter = v33;
      }
      else
      {
        int v34 = self->_appropriateColorFilter;
        self->_appropriateColorFilter = 0;
      }

      id v25 = 0;
    }
    if (v30 == 2)
    {
      if (v42) {
        uint64_t v30 = 0;
      }
      else {
        uint64_t v30 = 2;
      }
      if (v42) {
        int64_t v29 = 1;
      }
      self->_isBackgroundRemovable = (v43 && ~v42) & BYTE4(v40) & v40;
    }
    objc_msgSend(v44, "setBackgroundViewPolicy:", v30, v40);
    self->_unint64_t backgroundType = v29;
    v36 = (CHSWidgetRenderScheme *)[v44 copy];
    int v37 = self->_appropriateWidgetRenderScheme;
    self->_appropriateWidgetRenderScheme = v36;

    v38 = (CHSWidgetTintParameters *)[v25 copy];
    v39 = self->_appropriateWidgetTintParameters;
    self->_appropriateWidgetTintParameters = v38;

    id v5 = v41;
    goto LABEL_51;
  }
  if (v11 || !v6 || !v8)
  {
    BOOL v21 = 0;
    self->_unint64_t backgroundType = v11;
  }
  else
  {
    self->_unint64_t backgroundType = 2;
    BOOL v21 = 1;
  }
  self->_isBackgroundRemovable = v21;
  if (!v5) {
    goto LABEL_9;
  }
  id v15 = self->_containingApplicationBundleIdentifier;
  if ([(NSString *)v15 isEqualToString:@"com.apple.DocumentsApp"]) {
    goto LABEL_8;
  }
  BOOL v22 = [(NSString *)v15 isEqualToString:@"com.apple.shortcuts"];

  if (!v22)
  {
    int v23 = [(id)objc_opt_class() _buildColorMatrixFilterForColor:v5];
    id v18 = self->_appropriateColorFilter;
    self->_appropriateColorFilter = v23;
    goto LABEL_51;
  }
LABEL_9:
  id v18 = self->_appropriateColorFilter;
  self->_appropriateColorFilter = 0;
LABEL_51:

  self->_didGenerate = 1;
}

+ (id)_buildColorMatrixFilterForColor:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x1E4F39BC0];
  uint64_t v4 = *MEMORY[0x1E4F3A038];
  id v5 = a3;
  BOOL v6 = [v3 filterWithType:v4];
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v10 = 0;
  [v5 getRed:&v12 green:&v11 blue:&v10 alpha:0];

  CAColorMatrixMakeMultiplyColor();
  memset(v9, 0, sizeof(v9));
  BOOL v7 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v9];
  [v6 setValue:v7 forKey:*MEMORY[0x1E4F3A168]];

  [v6 setName:@"widgetIconStyleConfigurationColorFilter"];
  return v6;
}

- (BOOL)_isCrystalLinked
{
  BOOL v3 = [(SBHWidgetIconStyleConfiguration *)self widgetExtension];
  uint64_t v4 = v3;
  if (v3)
  {
    char v5 = [v3 isLinkedOnOrAfter:1];
  }
  else
  {
    BOOL v6 = [(SBHWidgetIconStyleConfiguration *)self bundleRecord];

    if (v6)
    {
      BOOL v7 = [(SBHWidgetIconStyleConfiguration *)self bundleRecord];
      BOOL v8 = [v7 SDKVersion];

      id v9 = (void *)[objc_alloc(MEMORY[0x1E4F4F6C8]) initWithString:v8];
      char v5 = [v9 majorBuildNumber] == 18;
    }
    else
    {
      char v5 = 1;
    }
  }

  return v5;
}

- (BOOL)_isDawnLinked
{
  BOOL v3 = [(SBHWidgetIconStyleConfiguration *)self widgetExtension];
  uint64_t v4 = v3;
  if (v3)
  {
    char v5 = [v3 isLinkedOnOrAfter:0];
  }
  else
  {
    BOOL v6 = [(SBHWidgetIconStyleConfiguration *)self bundleRecord];

    if (v6)
    {
      BOOL v7 = [(SBHWidgetIconStyleConfiguration *)self bundleRecord];
      BOOL v8 = [v7 SDKVersion];

      id v9 = (void *)[objc_alloc(MEMORY[0x1E4F4F6C8]) initWithString:v8];
      char v5 = [v9 majorBuildNumber] == 17;
    }
    else
    {
      char v5 = 1;
    }
  }

  return v5;
}

- (id)bundleRecord
{
  bundleRecord = self->_bundleRecord;
  if (!bundleRecord)
  {
    uint64_t v4 = [(SBHWidgetIconStyleConfiguration *)self widgetExtension];

    if (v4)
    {
      char v5 = (LSBundleRecord *)[objc_alloc(MEMORY[0x1E4F223A0]) initWithBundleIdentifier:self->_widgetBundleIdentifier error:0];
      BOOL v6 = self->_bundleRecord;
      self->_bundleRecord = v5;
    }
    else
    {
      id v7 = objc_alloc(MEMORY[0x1E4F223C8]);
      BOOL v6 = [(SBHWidgetIconStyleConfiguration *)self containingApplicationBundleIdentifier];
      BOOL v8 = (LSBundleRecord *)[v7 initWithBundleIdentifier:v6 allowPlaceholder:0 error:0];
      id v9 = self->_bundleRecord;
      self->_bundleRecord = v8;
    }
    bundleRecord = self->_bundleRecord;
  }
  uint64_t v10 = bundleRecord;
  return v10;
}

- (NSString)containingApplicationBundleIdentifier
{
  return self->_containingApplicationBundleIdentifier;
}

- (NSString)widgetBundleIdentifier
{
  return self->_widgetBundleIdentifier;
}

- (CHSWidgetExtension)widgetExtension
{
  return self->_widgetExtension;
}

- (CHSWidgetDescriptor)widgetDescriptor
{
  return self->_widgetDescriptor;
}

- (void)setWidgetDescriptor:(id)a3
{
}

- (SBHIconImageAppearance)imageAppearance
{
  return self->_imageAppearance;
}

- (SBHWidgetDisplayConfiguration)customDisplayConfiguration
{
  return self->_customDisplayConfiguration;
}

- (SBLeafIconDataSource)widgetDataSource
{
  return self->_widgetDataSource;
}

- (UIViewController)widgetViewController
{
  return self->_widgetViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetViewController, 0);
  objc_storeStrong((id *)&self->_widgetDataSource, 0);
  objc_storeStrong((id *)&self->_customDisplayConfiguration, 0);
  objc_storeStrong((id *)&self->_imageAppearance, 0);
  objc_storeStrong((id *)&self->_widgetDescriptor, 0);
  objc_storeStrong((id *)&self->_widgetExtension, 0);
  objc_storeStrong((id *)&self->_widgetBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_containingApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleRecord, 0);
  objc_storeStrong((id *)&self->_appropriateColorFilter, 0);
  objc_storeStrong((id *)&self->_appropriateWidgetTintParameters, 0);
  objc_storeStrong((id *)&self->_appropriateWidgetRenderScheme, 0);
}

@end