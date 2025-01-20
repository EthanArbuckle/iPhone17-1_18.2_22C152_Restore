@interface _PUWallpaperPosterEditorDebugEnvironment
- (BOOL)px_isCallServices;
- (CGRect)px_floatingObscurableBounds;
- (CGRect)px_titleBoundsForLayout:(unint64_t)a3;
- (NSString)pu_selectedToolbarItemIdentifier;
- (NSURL)sourceAssetDirectory;
- (NSURL)targetAssetDirectory;
- (PFPosterConfiguration)sourcePosterConfiguration;
- (PFPosterDescriptor)posterDescriptor;
- (PUMutablePosterConfiguration)pu_targetConfiguration;
- (PUPosterOverrideConfiguration)overrideConfiguration;
- (UIColor)pu_caseColor;
- (_PUWallpaperPosterEditorDebugEnvironment)init;
- (_PUWallpaperPosterEditorDebugEnvironment)initWithPosterDescriptor:(id)a3;
- (_PUWallpaperPosterEditorDebugEnvironment)initWithSourcePosterConfiguration:(id)a3;
- (int64_t)pu_deviceOrientation;
- (int64_t)pu_posterType;
- (int64_t)pu_userInterfaceStyle;
- (int64_t)px_boundingShape;
- (unint64_t)legacyConfigurationType;
- (unint64_t)px_significantEventsCounter;
- (void)setLegacyConfigurationType:(unint64_t)a3;
- (void)setOverrideConfiguration:(id)a3;
- (void)setPosterDescriptor:(id)a3;
- (void)setPu_caseColor:(id)a3;
- (void)setPu_selectedToolbarItemIdentifier:(id)a3;
- (void)setPu_userInterfaceStyle:(int64_t)a3;
- (void)setSourceAssetDirectory:(id)a3;
- (void)setSourcePosterConfiguration:(id)a3;
- (void)setTargetAssetDirectory:(id)a3;
@end

@implementation _PUWallpaperPosterEditorDebugEnvironment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideConfiguration, 0);
  objc_storeStrong((id *)&self->_targetAssetDirectory, 0);
  objc_storeStrong((id *)&self->_sourceAssetDirectory, 0);
  objc_storeStrong((id *)&self->_sourcePosterConfiguration, 0);
  objc_storeStrong((id *)&self->_posterDescriptor, 0);
  objc_storeStrong((id *)&self->_pu_selectedToolbarItemIdentifier, 0);
  objc_storeStrong((id *)&self->_pu_caseColor, 0);
}

- (void)setOverrideConfiguration:(id)a3
{
}

- (PUPosterOverrideConfiguration)overrideConfiguration
{
  return self->_overrideConfiguration;
}

- (void)setLegacyConfigurationType:(unint64_t)a3
{
  self->_legacyConfigurationType = a3;
}

- (unint64_t)legacyConfigurationType
{
  return self->_legacyConfigurationType;
}

- (void)setTargetAssetDirectory:(id)a3
{
}

- (NSURL)targetAssetDirectory
{
  return self->_targetAssetDirectory;
}

- (void)setSourceAssetDirectory:(id)a3
{
}

- (NSURL)sourceAssetDirectory
{
  return self->_sourceAssetDirectory;
}

- (void)setSourcePosterConfiguration:(id)a3
{
}

- (PFPosterConfiguration)sourcePosterConfiguration
{
  return self->_sourcePosterConfiguration;
}

- (void)setPosterDescriptor:(id)a3
{
}

- (PFPosterDescriptor)posterDescriptor
{
  return self->_posterDescriptor;
}

- (void)setPu_selectedToolbarItemIdentifier:(id)a3
{
}

- (NSString)pu_selectedToolbarItemIdentifier
{
  return self->_pu_selectedToolbarItemIdentifier;
}

- (void)setPu_userInterfaceStyle:(int64_t)a3
{
  self->_pu_userInterfaceStyle = a3;
}

- (int64_t)pu_userInterfaceStyle
{
  return self->_pu_userInterfaceStyle;
}

- (void)setPu_caseColor:(id)a3
{
}

- (UIColor)pu_caseColor
{
  return self->_pu_caseColor;
}

- (CGRect)px_titleBoundsForLayout:(unint64_t)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (int64_t)pu_deviceOrientation
{
  return 0;
}

- (CGRect)px_floatingObscurableBounds
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (int64_t)px_boundingShape
{
  return -1;
}

- (BOOL)px_isCallServices
{
  return 0;
}

- (unint64_t)px_significantEventsCounter
{
  return 0;
}

- (PUMutablePosterConfiguration)pu_targetConfiguration
{
  double v2 = objc_alloc_init(_PUMutablePosterConfigurationDebug);
  return (PUMutablePosterConfiguration *)v2;
}

- (int64_t)pu_posterType
{
  double v3 = [(_PUWallpaperPosterEditorDebugEnvironment *)self posterDescriptor];

  if (v3)
  {
    double v4 = [(_PUWallpaperPosterEditorDebugEnvironment *)self posterDescriptor];
LABEL_5:
    double v6 = v4;
    int64_t v7 = [v4 posterType];

    return v7;
  }
  double v5 = [(_PUWallpaperPosterEditorDebugEnvironment *)self sourcePosterConfiguration];

  if (v5)
  {
    double v4 = [(_PUWallpaperPosterEditorDebugEnvironment *)self sourcePosterConfiguration];
    goto LABEL_5;
  }
  return 0;
}

- (_PUWallpaperPosterEditorDebugEnvironment)initWithSourcePosterConfiguration:(id)a3
{
  id v5 = a3;
  double v6 = [(_PUWallpaperPosterEditorDebugEnvironment *)self init];
  int64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sourcePosterConfiguration, a3);
  }

  return v7;
}

- (_PUWallpaperPosterEditorDebugEnvironment)initWithPosterDescriptor:(id)a3
{
  id v5 = a3;
  double v6 = [(_PUWallpaperPosterEditorDebugEnvironment *)self init];
  int64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_posterDescriptor, a3);
  }

  return v7;
}

- (_PUWallpaperPosterEditorDebugEnvironment)init
{
  v10.receiver = self;
  v10.super_class = (Class)_PUWallpaperPosterEditorDebugEnvironment;
  double v2 = [(_PUWallpaperPosterEditorDebugEnvironment *)&v10 init];
  if (v2)
  {
    double v3 = (void *)MEMORY[0x1E4F1CB10];
    double v4 = NSTemporaryDirectory();
    id v5 = [v4 stringByAppendingPathComponent:@"PhotosPoster"];
    uint64_t v6 = [v3 fileURLWithPath:v5];
    targetAssetDirectory = v2->_targetAssetDirectory;
    v2->_targetAssetDirectory = (NSURL *)v6;

    v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v8 createDirectoryAtURL:v2->_targetAssetDirectory withIntermediateDirectories:0 attributes:0 error:0];
  }
  return v2;
}

@end