@interface SBHomeScreenPreviewView
- (BOOL)isIconViewRecycled:(id)a3;
- (SBDockOffscreenFractionModifying)dockOffscreenModifier;
- (SBFloatingDockViewController)floatingDockViewController;
- (SBHIconManager)iconManager;
- (SBHomeScreenPreviewView)initWithFrame:(CGRect)a3 iconManager:(id)a4 wallpaperController:(id)a5 options:(unint64_t)a6 wallpaperImage:(id)a7 listView:(id)a8;
- (id)dequeueReusableIconViewOfClass:(Class)a3;
- (id)iconView:(id)a3 backgroundViewForComponentsOfType:(int64_t)a4;
- (id)makeFolderContentWithWallpaperController:(id)a3 legibilitySettings:(id)a4 options:(unint64_t)a5;
- (id)makeIconFolderContentWithWallpaperController:(id)a3 legibilitySettings:(id)a4 options:(unint64_t)a5;
- (id)makeSilhouetteFolderContent;
- (unint64_t)snapshotOptions;
- (void)configureIconView:(id)a3 forIcon:(id)a4;
- (void)dealloc;
- (void)layoutSubviews;
@end

@implementation SBHomeScreenPreviewView

- (SBHomeScreenPreviewView)initWithFrame:(CGRect)a3 iconManager:(id)a4 wallpaperController:(id)a5 options:(unint64_t)a6 wallpaperImage:(id)a7 listView:(id)a8
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v18 = a4;
  id v19 = a5;
  id v20 = a7;
  id v21 = a8;
  v69.receiver = self;
  v69.super_class = (Class)SBHomeScreenPreviewView;
  v22 = -[SBHomeScreenPreviewView initWithFrame:](&v69, sel_initWithFrame_, x, y, width, height);
  v23 = v22;
  if (!v22) {
    goto LABEL_43;
  }
  objc_storeStrong((id *)&v22->_iconManager, a4);
  v23->_snapshotOptions = a6;
  if ((a6 & 0x400) != 0)
  {
    id v27 = objc_alloc(MEMORY[0x1E4F43228]);
    uint64_t v28 = 2;
LABEL_8:
    v29 = (void *)[v27 initWithStyle:v28];
    goto LABEL_11;
  }
  if ((a6 & 0x800) != 0)
  {
    id v27 = objc_alloc(MEMORY[0x1E4F43228]);
    uint64_t v28 = 1;
    goto LABEL_8;
  }
  v24 = [v18 legibilitySettings];
  v25 = v24;
  if (v24) {
    id v26 = v24;
  }
  else {
    id v26 = (id)[objc_alloc(MEMORY[0x1E4F43228]) initWithStyle:2];
  }
  v29 = v26;

LABEL_11:
  [(SBHomeScreenPreviewView *)v23 bounds];
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  if ((a6 & 0x40) != 0)
  {
    v68 = 0;
    if (!v21) {
      goto LABEL_26;
    }
    goto LABEL_15;
  }
  if (v20)
  {
    v68 = 0;
LABEL_24:
    v43 = (objc_class *)MEMORY[0x1E4F42AA0];
    id v20 = v20;
    v44 = (SBWallpaperEffectView *)[[v43 alloc] initWithImage:v20];
    [(SBWallpaperEffectView *)v44 setContentMode:2];

    goto LABEL_25;
  }
  if (!v19)
  {
    id v19 = +[SBWallpaperController sharedInstance];
  }
  v38 = [v19 wallpaperConfigurationManager];
  v39 = [v38 homeScreenWallpaperConfigurationIncludingValuesForTypes:4];
  v68 = v39;
  if (_os_feature_enabled_impl())
  {
    v40 = SBLogWallpaper();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
      -[SBHomeScreenPreviewView initWithFrame:iconManager:wallpaperController:options:wallpaperImage:listView:](v68, v40);
    }
  }
  else
  {
    v41 = [v39 proceduralWallpaperInfo];

    if (!v41)
    {

      goto LABEL_45;
    }
  }
  v42 = [v68 wallpaperThumbnailImage];
  objc_msgSend(v42, "resizableImageWithCapInsets:resizingMode:", 1, *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));
  id v20 = (id)objc_claimAutoreleasedReturnValue();

  if (v20) {
    goto LABEL_24;
  }
LABEL_45:
  v44 = [[SBWallpaperEffectView alloc] initWithWallpaperVariant:1 transformOptions:2];
  [(PBUIWallpaperEffectViewBase *)v44 setForcesOpaque:1];
  [(PBUIWallpaperEffectViewBase *)v44 setStyle:0];
  id v20 = 0;
LABEL_25:
  -[SBWallpaperEffectView setFrame:](v44, "setFrame:", v31, v33, v35, v37);
  [(SBHomeScreenPreviewView *)v23 addSubview:v44];

  if (!v21)
  {
LABEL_26:
    v45 = [(id)SBApp userSessionController];
    int v46 = [v45 isLoginSession];

    if (!v46)
    {
      uint64_t v47 = [(SBHomeScreenPreviewView *)v23 makeFolderContentWithWallpaperController:v19 legibilitySettings:v29 options:a6];
      folderContent = v23->_folderContent;
      v23->_folderContent = (UIView *)v47;
    }
    goto LABEL_28;
  }
LABEL_15:
  objc_storeStrong((id *)&v23->_folderContent, a8);
LABEL_28:
  double v49 = *MEMORY[0x1E4F43D08];
  -[UIView setFrame:](v23->_folderContent, "setFrame:", 0.0, *MEMORY[0x1E4F43D08], v35, v37 - *MEMORY[0x1E4F43D08]);
  [(SBHomeScreenPreviewView *)v23 addSubview:v23->_folderContent];
  int v50 = [v18 isFloatingDockSupported];
  if ((a6 & 0x2000) == 0 && v50)
  {
    v51 = [(SBFloatingDockViewController *)[SBPreviewFloatingDockViewController alloc] initWithIconManager:v18 iconViewProvider:v23];
    floatingDockViewController = v23->_floatingDockViewController;
    v23->_floatingDockViewController = &v51->super;

    v53 = [(SBFloatingDockViewController *)v23->_floatingDockViewController view];
    objc_msgSend(v53, "setFrame:", v31, v33, v35, v37);
    [v53 layoutIfNeeded];
    [(SBFloatingDockViewController *)v23->_floatingDockViewController layoutUserControlledIconListsWithAnimationType:-1 forceRelayout:1];
    [(SBHomeScreenPreviewView *)v23 addSubview:v53];
    objc_storeStrong((id *)&v23->_floatingDock, v53);
    if ((a6 & 0x200) != 0)
    {
      v54 = [v53 layer];
      [v54 setAllowsGroupOpacity:1];

      [v53 setAlpha:0.5];
    }
    if ((a6 & 0x40) != 0)
    {
      v55 = [(SBFloatingDockViewController *)v23->_floatingDockViewController dockView];
      v56 = [[SBWallpaperEffectView alloc] initWithWallpaperVariant:1 transformOptions:2];
      [(SBWallpaperEffectView *)v56 setClipsToBounds:1];
      [(PBUIWallpaperEffectViewBase *)v56 setStyle:28];
      [v55 setBackgroundView:v56];
    }
  }
  if ((a6 & 1) == 0)
  {
    v57 = [v18 rootFolderController];
    v58 = [v57 _sbWindowScene];
    uint64_t v59 = [v58 statusBarManager];
    windowSceneStatusBarManager = v23->_windowSceneStatusBarManager;
    v23->_windowSceneStatusBarManager = (SBWindowSceneStatusBarManager *)v59;

    v61 = [(SBWindowSceneStatusBarManager *)v23->_windowSceneStatusBarManager reusePool];
    v62 = objc_msgSend(v61, "getReusableStatusBarWithReason:withFrame:", @"Settings HomeScreen Preview View", 0.0, 0.0, v35, v49);

    [v62 requestResolvedStyle:0];
    [v62 setManager:0];
    objc_msgSend(v62, "setLegibilityStyle:", objc_msgSend(v29, "style"));
    v63 = [v29 primaryColor];
    [v62 setForegroundColor:v63];

    if ((a6 & 4) != 0)
    {
      v64 = [MEMORY[0x1E4F1C9C8] date];
      objc_msgSend(v62, "sb_setSnapshotOverridesWithTimeEnabled:overriddenDate:", 1, v64);
    }
    else
    {
      objc_msgSend(v62, "sb_setSnapshotOverridesWithTimeEnabled:overriddenDate:", 1, 0);
    }
    [(SBHomeScreenPreviewView *)v23 addSubview:v62];
    statusBar = v23->_statusBar;
    v23->_statusBar = (UIStatusBar *)v62;
  }
  v66 = SBLogWallpaper();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v71 = v68;
    _os_log_impl(&dword_1D85BA000, v66, OS_LOG_TYPE_DEFAULT, "SETTING UP HomeScreenPreviewView WITH WALLPAPER '%{public}@", buf, 0xCu);
  }

LABEL_43:
  return v23;
}

- (void)dealloc
{
  if (self->_statusBar)
  {
    v3 = [(SBWindowSceneStatusBarManager *)self->_windowSceneStatusBarManager reusePool];
    [v3 recycleStatusBar:self->_statusBar];
  }
  v4.receiver = self;
  v4.super_class = (Class)SBHomeScreenPreviewView;
  [(SBHomeScreenPreviewView *)&v4 dealloc];
}

- (id)makeFolderContentWithWallpaperController:(id)a3 legibilitySettings:(id)a4 options:(unint64_t)a5
{
  if ((a5 & 0x4000) != 0) {
    [(SBHomeScreenPreviewView *)self makeSilhouetteFolderContent];
  }
  else {
  v5 = -[SBHomeScreenPreviewView makeIconFolderContentWithWallpaperController:legibilitySettings:options:](self, "makeIconFolderContentWithWallpaperController:legibilitySettings:options:", a3, a4);
  }
  return v5;
}

- (id)makeIconFolderContentWithWallpaperController:(id)a3 legibilitySettings:(id)a4 options:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(SBHomeScreenPreviewView *)self iconManager];
  v11 = [[_SBHomeScreenFolderDelegate alloc] initWithForwardingTarget:v10];
  v12 = v11;
  unint64_t v13 = 1;
  if ((a5 & 0x800) == 0) {
    unint64_t v13 = (a5 >> 9) & 2;
  }
  if ((a5 & 0x200) != 0) {
    unint64_t v14 = v13;
  }
  else {
    unint64_t v14 = 0;
  }
  [(_SBHomeScreenFolderDelegate *)v11 setDockStyle:v14];
  objc_storeStrong((id *)&self->_folderDelegate, v12);
  id v15 = objc_alloc_init(MEMORY[0x1E4FA6460]);
  v16 = [v10 rootFolder];
  [v15 setFolder:v16];

  v17 = [v10 listLayoutProvider];
  [v15 setListLayoutProvider:v17];

  [v15 setLegibilitySettings:v8];
  objc_msgSend(v15, "setDockExternal:", +[SBFloatingDockController isFloatingDockSupported](SBFloatingDockController, "isFloatingDockSupported"));
  [v15 setFolderDelegate:v12];
  [v15 setIconViewProvider:self];
  id v18 = [v10 folderIconImageCache];
  [v15 setFolderIconImageCache:v18];

  id v19 = [v10 iconImageCache];
  [v15 setIconImageCache:v19];

  id v20 = (void *)[objc_alloc(MEMORY[0x1E4FA6458]) initWithConfiguration:v15];
  id v21 = [v9 averageColorForVariant:1];

  [v20 setDefaultAccessibilityTintColor:v21];
  [v20 setPageControlHidden:(a5 >> 1) & 1];
  objc_storeStrong((id *)&self->_rootFolderController, v20);
  if ((a5 & 0x2000) != 0)
  {
    v22 = [v20 beginModifyingDockOffscreenFractionForReason:@"Preview"];
    dockOffscreenModifier = self->_dockOffscreenModifier;
    self->_dockOffscreenModifier = v22;

    [(SBDockOffscreenFractionModifying *)self->_dockOffscreenModifier setDockOffscreenFraction:1.0];
  }
  v24 = [v20 view];

  return v24;
}

- (id)makeSilhouetteFolderContent
{
  v3 = [(SBHomeScreenPreviewView *)self iconManager];
  objc_super v4 = [v3 silhouetteLayoutForPageAtIndex:0];
  id v5 = objc_alloc(MEMORY[0x1E4FA7B70]);
  [(SBHomeScreenPreviewView *)self bounds];
  id v8 = objc_msgSend(v5, "initWithSilhouetteLayout:viewSize:", v4, v6, v7);
  id v9 = [MEMORY[0x1E4F29128] UUID];
  v10 = [v9 UUIDString];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __54__SBHomeScreenPreviewView_makeSilhouetteFolderContent__block_invoke;
  v20[3] = &unk_1E6B08F18;
  id v11 = v10;
  id v21 = v11;
  [v8 setIconViewBuilder:v20];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __54__SBHomeScreenPreviewView_makeSilhouetteFolderContent__block_invoke_2;
  id v18 = &unk_1E6B08F18;
  id v19 = v11;
  id v12 = v11;
  [v8 setDockViewBuilder:&v15];
  unint64_t v13 = objc_msgSend(v8, "buildView", v15, v16, v17, v18);

  return v13;
}

id __54__SBHomeScreenPreviewView_makeSilhouetteFolderContent__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:3];
  v3 = [@"homeScreenIconView" stringByAppendingString:*(void *)(a1 + 32)];
  [v2 setGroupNameBase:v3];

  return v2;
}

id __54__SBHomeScreenPreviewView_makeSilhouetteFolderContent__block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:19];
  v3 = [@"homeScreenDockView" stringByAppendingString:*(void *)(a1 + 32)];
  [v2 setGroupNameBase:v3];

  return v2;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)SBHomeScreenPreviewView;
  [(SBHomeScreenPreviewView *)&v14 layoutSubviews];
  [(SBHomeScreenPreviewView *)self bounds];
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  remainder.origin.double x = v3;
  remainder.origin.double y = v4;
  remainder.size.double width = v5;
  remainder.size.double height = v6;
  if (self->_statusBar)
  {
    memset(&v12, 0, sizeof(v12));
    CGRectDivide(*(CGRect *)&v3, &v12, &remainder, *MEMORY[0x1E4F43D08], CGRectMinYEdge);
    -[UIStatusBar setFrame:](self->_statusBar, "setFrame:", *(_OWORD *)&v12.origin, *(_OWORD *)&v12.size);
  }
  if (self->_floatingDock)
  {
    memset(&v12, 0, sizeof(v12));
    [(SBFloatingDockViewController *)self->_floatingDockViewController maximumContentHeight];
    CGRectDivide(remainder, &v12, &remainder, v11, CGRectMaxYEdge);
    -[UIView setFrame:](self->_floatingDock, "setFrame:", *(_OWORD *)&v12.origin, *(_OWORD *)&v12.size);
  }
  -[UIView setFrame:](self->_folderContent, "setFrame:", v7, v8, v9, v10);
}

- (id)dequeueReusableIconViewOfClass:(Class)a3
{
  return 0;
}

- (BOOL)isIconViewRecycled:(id)a3
{
  return 0;
}

- (void)configureIconView:(id)a3 forIcon:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  double v7 = [(SBHomeScreenPreviewView *)self iconManager];
  [v7 configureIconView:v8 forIcon:v6];

  [v8 setDelegate:self];
  [v8 setLabelAccessoryHidden:1];
  [v8 setAllowsBlockedForScreenTimeExpiration:0];
  [v8 setImageLoadingBehavior:0];
  if (([(SBHomeScreenPreviewView *)self snapshotOptions] & 0x1000) != 0) {
    [v8 setHidden:1];
  }
}

- (id)iconView:(id)a3 backgroundViewForComponentsOfType:(int64_t)a4
{
  CGFloat v4 = [a3 location];
  char v5 = SBIconLocationGroupContainsLocation();

  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [[SBWallpaperEffectView alloc] initWithWallpaperVariant:1];
    [(PBUIWallpaperEffectViewBase *)v6 setStyle:29];
  }
  return v6;
}

- (SBHIconManager)iconManager
{
  return self->_iconManager;
}

- (SBFloatingDockViewController)floatingDockViewController
{
  return self->_floatingDockViewController;
}

- (unint64_t)snapshotOptions
{
  return self->_snapshotOptions;
}

- (SBDockOffscreenFractionModifying)dockOffscreenModifier
{
  return self->_dockOffscreenModifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dockOffscreenModifier, 0);
  objc_storeStrong((id *)&self->_floatingDockViewController, 0);
  objc_storeStrong((id *)&self->_iconManager, 0);
  objc_storeStrong((id *)&self->_windowSceneStatusBarManager, 0);
  objc_storeStrong((id *)&self->_folderDelegate, 0);
  objc_storeStrong((id *)&self->_rootFolderController, 0);
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_storeStrong((id *)&self->_floatingDock, 0);
  objc_storeStrong((id *)&self->_folderContent, 0);
}

- (void)initWithFrame:(void *)a1 iconManager:(NSObject *)a2 wallpaperController:options:wallpaperImage:listView:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  CGFloat v3 = [a1 debugDescription];
  int v4 = 138543362;
  char v5 = v3;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "WooP is on, using wallpaper thumbnail image from home screen wallpaper configuration: %{public}@", (uint8_t *)&v4, 0xCu);
}

@end