@interface PBFHomeScreenPreviewViewBuilder
- (BOOL)excludesHomeScreenDock;
- (BOOL)excludesSilhouette;
- (PBFDisplayContext)displayContext;
- (PBFHomeScreenPreviewViewBuilder)init;
- (PRPosterHomeScreenConfiguration)homeScreenConfiguration;
- (UIImage)unlockedPosterSnapshot;
- (double)viewScreenSizeScale;
- (id)buildView;
- (id)renderingCompletionHandler;
- (void)setDisplayContext:(id)a3;
- (void)setExcludesHomeScreenDock:(BOOL)a3;
- (void)setExcludesSilhouette:(BOOL)a3;
- (void)setHomeScreenConfiguration:(id)a3;
- (void)setRenderingCompletionHandler:(id)a3;
- (void)setUnlockedPosterSnapshot:(id)a3;
- (void)setViewScreenSizeScale:(double)a3;
@end

@implementation PBFHomeScreenPreviewViewBuilder

- (PBFHomeScreenPreviewViewBuilder)init
{
  v3.receiver = self;
  v3.super_class = (Class)PBFHomeScreenPreviewViewBuilder;
  result = [(PBFHomeScreenPreviewViewBuilder *)&v3 init];
  if (result) {
    result->_viewScreenSizeScale = 1.0;
  }
  return result;
}

- (id)buildView
{
  [(PBFDisplayContext *)self->_displayContext pbf_frame];
  [(PBFDisplayContext *)self->_displayContext pbf_scale];
  BSFloatRoundForScale();
  double v4 = v3;
  [(PBFDisplayContext *)self->_displayContext pbf_frame];
  [(PBFDisplayContext *)self->_displayContext pbf_scale];
  BSFloatRoundForScale();
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, v4, v5);
  [v6 setAutoresizingMask:18];
  uint64_t v7 = [(PRPosterHomeScreenConfiguration *)self->_homeScreenConfiguration selectedAppearanceType];
  switch(v7)
  {
    case 0:
    case 3:
      id v8 = objc_alloc(MEMORY[0x1E4FB1838]);
      [v6 bounds];
      v9 = objc_msgSend(v8, "initWithFrame:");
      [v9 setAutoresizingMask:18];
      [v9 setContentMode:0];
      [v9 setImage:self->_unlockedPosterSnapshot];
      [v6 addSubview:v9];
      if (v7 == 3)
      {
        v17 = [(PRPosterHomeScreenConfiguration *)self->_homeScreenConfiguration homePosterAppearance];
        int v18 = [v17 isLegibilityBlurEnabled];

        if (!v18) {
          goto LABEL_11;
        }
        goto LABEL_10;
      }
      if (!v7)
      {
        v10 = [(PRPosterHomeScreenConfiguration *)self->_homeScreenConfiguration lockPosterAppearance];
        char v11 = [v10 isLegibilityBlurEnabled];

        if (v11)
        {
LABEL_10:
          v19 = objc_msgSend(MEMORY[0x1E4F743C8], "pui_homeScreenLegibilityMaterialView");
          objc_msgSend(v19, "pbf_scaleBlurRadiusByAmount:", self->_viewScreenSizeScale);
          [v6 bounds];
          objc_msgSend(v19, "setFrame:");
          [v19 setAutoresizingMask:18];
          [v19 setGroupNameBase:@"HomeScreenPreviewView"];
          [v6 addSubview:v19];
        }
      }
LABEL_11:

LABEL_12:
      if ([(PBFHomeScreenPreviewViewBuilder *)self excludesSilhouette])
      {
        v20 = (void *)MEMORY[0x1E4F39CF8];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __44__PBFHomeScreenPreviewViewBuilder_buildView__block_invoke;
        v28[3] = &unk_1E69808E8;
        v28[4] = self;
        v21 = &v29;
        id v29 = v6;
        objc_msgSend(v20, "bs_performAfterSynchronizedCommit:", v28);
      }
      else
      {
        BOOL v22 = [(PBFHomeScreenPreviewViewBuilder *)self excludesHomeScreenDock];
        v23 = [NSString stringWithUTF8String:"-[PBFHomeScreenPreviewViewBuilder buildView]"];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __44__PBFHomeScreenPreviewViewBuilder_buildView__block_invoke_2;
        v25[3] = &unk_1E6981468;
        BOOL v27 = v22;
        v25[4] = self;
        v21 = &v26;
        id v26 = v6;
        PBFDispatchAsyncWithString(v23, QOS_CLASS_USER_INITIATED, v25);
      }
      return v6;
    case 1:
      id v12 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      [v6 bounds];
      v9 = objc_msgSend(v12, "initWithFrame:");
      v13 = [(PRPosterHomeScreenConfiguration *)self->_homeScreenConfiguration solidColorAppearance];
      v14 = [v13 effectiveColor];
      v15 = [v14 color];
      [v9 setBackgroundColor:v15];

      goto LABEL_8;
    case 2:
      id v16 = objc_alloc(MEMORY[0x1E4F927D0]);
      [v6 bounds];
      v9 = objc_msgSend(v16, "initWithFrame:");
      v13 = [(PRPosterHomeScreenConfiguration *)self->_homeScreenConfiguration gradientAppearance];
      v14 = [v13 gradientColors];
      [v9 setColors:v14];
LABEL_8:

      [v9 setAutoresizingMask:18];
      [v6 addSubview:v9];
      goto LABEL_11;
    default:
      goto LABEL_12;
  }
}

uint64_t __44__PBFHomeScreenPreviewViewBuilder_buildView__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 40));
  }
  return result;
}

void __44__PBFHomeScreenPreviewViewBuilder_buildView__block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FA6AC8]);
  double v3 = [v2 silhouetteLayoutForPageAtIndex:0];
  double v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = objc_alloc_init(MEMORY[0x1E4FA6AF0]);
  }
  v6 = v5;

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__PBFHomeScreenPreviewViewBuilder_buildView__block_invoke_3;
  v10[3] = &unk_1E69825F0;
  char v14 = *(unsigned char *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v8;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

void __44__PBFHomeScreenPreviewViewBuilder_buildView__block_invoke_3(uint64_t a1)
{
  id v2 = +[PBFSilhouetteHelpers makeHomeScreenSilhouetteViewWithLayout:*(void *)(a1 + 32) includeDock:*(unsigned char *)(a1 + 56) == 0 displayContext:*(void *)(*(void *)(a1 + 40) + 16) viewScreenSizeScale:*(double *)(*(void *)(a1 + 40) + 40)];
  [*(id *)(a1 + 48) addSubview:v2];
  double v3 = (void *)MEMORY[0x1E4F39CF8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__PBFHomeScreenPreviewViewBuilder_buildView__block_invoke_4;
  v5[3] = &unk_1E69808E8;
  double v4 = *(void **)(a1 + 48);
  v5[4] = *(void *)(a1 + 40);
  id v6 = v4;
  objc_msgSend(v3, "bs_performAfterSynchronizedCommit:", v5);
}

uint64_t __44__PBFHomeScreenPreviewViewBuilder_buildView__block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 40));
  }
  return result;
}

- (PBFDisplayContext)displayContext
{
  return self->_displayContext;
}

- (void)setDisplayContext:(id)a3
{
}

- (PRPosterHomeScreenConfiguration)homeScreenConfiguration
{
  return self->_homeScreenConfiguration;
}

- (void)setHomeScreenConfiguration:(id)a3
{
}

- (UIImage)unlockedPosterSnapshot
{
  return self->_unlockedPosterSnapshot;
}

- (void)setUnlockedPosterSnapshot:(id)a3
{
}

- (BOOL)excludesSilhouette
{
  return self->_excludesSilhouette;
}

- (void)setExcludesSilhouette:(BOOL)a3
{
  self->_excludesSilhouette = a3;
}

- (BOOL)excludesHomeScreenDock
{
  return self->_excludesHomeScreenDock;
}

- (void)setExcludesHomeScreenDock:(BOOL)a3
{
  self->_excludesHomeScreenDock = a3;
}

- (double)viewScreenSizeScale
{
  return self->_viewScreenSizeScale;
}

- (void)setViewScreenSizeScale:(double)a3
{
  self->_viewScreenSizeScale = a3;
}

- (id)renderingCompletionHandler
{
  return self->_renderingCompletionHandler;
}

- (void)setRenderingCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_renderingCompletionHandler, 0);
  objc_storeStrong((id *)&self->_unlockedPosterSnapshot, 0);
  objc_storeStrong((id *)&self->_homeScreenConfiguration, 0);
  objc_storeStrong((id *)&self->_displayContext, 0);
}

@end