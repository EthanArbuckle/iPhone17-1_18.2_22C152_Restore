@interface PUPhotoEditTopToolbarButtonConfig
+ (id)imageConfigurationForSelectedState:(BOOL)a3;
+ (id)selectedConfiguration;
+ (id)unselectedConfiguration;
@end

@implementation PUPhotoEditTopToolbarButtonConfig

+ (id)selectedConfiguration
{
  return (id)[a1 imageConfigurationForSelectedState:1];
}

+ (id)unselectedConfiguration
{
  return (id)[a1 imageConfigurationForSelectedState:0];
}

+ (id)imageConfigurationForSelectedState:(BOOL)a3
{
  BOOL v3 = a3;
  v18[1] = *MEMORY[0x1E4F143B8];
  v4 = +[PUInterfaceManager currentTheme];
  v5 = (void *)MEMORY[0x1E4FB1830];
  [v4 topToolbarToolButtonGlyphSize];
  v6 = objc_msgSend(v5, "configurationWithPointSize:");
  if (v3) {
    uint64_t v7 = 5;
  }
  else {
    uint64_t v7 = 4;
  }
  v8 = [MEMORY[0x1E4FB1830] configurationWithWeight:v7];
  v9 = (void *)MEMORY[0x1E4FB1830];
  if (v3)
  {
    v10 = [v4 photoEditingToolbarButtonSelectedColor];
    v18[0] = v10;
    v11 = (void **)v18;
  }
  else
  {
    v10 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v17 = v10;
    v11 = &v17;
  }
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v13 = [v9 configurationWithPaletteColors:v12];

  v14 = [v6 configurationByApplyingConfiguration:v13];
  v15 = [v14 configurationByApplyingConfiguration:v8];

  return v15;
}

@end