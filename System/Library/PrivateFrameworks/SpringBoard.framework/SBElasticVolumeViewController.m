@interface SBElasticVolumeViewController
- (BOOL)updateActiveRouteDisplay:(id *)a3;
- (SBElasticVolumeViewController)initWithDataSource:(id)a3;
- (double)interactiveValueUpdateDiscontinuityInterval;
- (id)createSliderView;
- (id)dataSource;
- (id)physicalButtonSceneTargets;
- (id)sliderAccessibilityIdentifier;
- (int64_t)triggerButton;
- (unint64_t)attachmentIgnoredOrientations;
- (unint64_t)layoutAxisForInterfaceOrientation:(int64_t)a3;
- (void)_debugHandleNextRoute;
- (void)_debugHandleResetRoute;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)volumeHUDRouteDescriptionProvider:(id)a3 didChangeOutputDeviceAsset:(id)a4;
@end

@implementation SBElasticVolumeViewController

- (SBElasticVolumeViewController)initWithDataSource:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBElasticVolumeViewController;
  v3 = [(SBElasticValueViewController *)&v11 initWithDataSource:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F42A98] configurationWithPointSize:6 weight:2 scale:26.0];
    v5 = [MEMORY[0x1E4F42A98] _configurationWithHierarchicalColors:MEMORY[0x1E4F1CBF0]];
    uint64_t v6 = [v4 configurationByApplyingConfiguration:v5];
    routeImageSymbolConfiguration = v3->_routeImageSymbolConfiguration;
    v3->_routeImageSymbolConfiguration = (UIImageSymbolConfiguration *)v6;

    v8 = (MRUVolumeHUDRouteDescriptionProvider *)objc_alloc_init(MEMORY[0x1E4F74890]);
    routeDescriptionProvider = v3->_routeDescriptionProvider;
    v3->_routeDescriptionProvider = v8;

    [(MRUVolumeHUDRouteDescriptionProvider *)v3->_routeDescriptionProvider setDelegate:v3];
    v3->_mediaProvidedRouteDisplayInfoNeedsUpdate = 1;
  }
  return v3;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SBElasticVolumeViewController;
  [(SBElasticValueViewController *)&v23 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  if (v6)
  {
    v7 = [v6 windowScene];
    v8 = [v7 _FBSScene];
    v9 = [v8 identity];

    v10 = (void *)MEMORY[0x1E4FA5FB8];
    objc_super v11 = [MEMORY[0x1E4F4F7F8] processHandle];
    v12 = [v11 auditToken];
    v13 = [v10 targetWithPhysicalButton:1 generation:1 auditToken:v12 identifier:1];

    v14 = (void *)MEMORY[0x1E4FA5FB8];
    v15 = [MEMORY[0x1E4F4F7F8] processHandle];
    v16 = [v15 auditToken];
    v17 = [v14 targetWithPhysicalButton:2 generation:1 auditToken:v16 identifier:1];

    v18 = [MEMORY[0x1E4FA5FA8] targetWithSceneIdentity:v9];
    [v18 addButtonTarget:v13];
    [v18 addButtonTarget:v17];
    v19 = (void *)MEMORY[0x1E4F1C978];
    v20 = (void *)[v18 copy];
    v21 = [v19 arrayWithObject:v20];
    physicalButtonSceneTargets = self->_physicalButtonSceneTargets;
    self->_physicalButtonSceneTargets = v21;
  }
  else
  {
    v9 = self->_physicalButtonSceneTargets;
    self->_physicalButtonSceneTargets = 0;
  }
}

- (id)physicalButtonSceneTargets
{
  return self->_physicalButtonSceneTargets;
}

- (int64_t)triggerButton
{
  return 10;
}

- (unint64_t)attachmentIgnoredOrientations
{
  return 8;
}

- (id)dataSource
{
  v4.receiver = self;
  v4.super_class = (Class)SBElasticVolumeViewController;
  v2 = [(SBElasticValueViewController *)&v4 dataSource];
  return v2;
}

- (BOOL)updateActiveRouteDisplay:(id *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v5 = self->_routeDescriptionProvider;
  id v6 = [(MRUVolumeHUDRouteDescriptionProvider *)v5 outputDeviceAsset];
  v7 = [v6 localizedDisplayTitle];
  if ([v6 kind])
  {
    v8 = [v6 icon];
    v9 = [v8 symbolConfiguration];
    v10 = [v9 configurationByApplyingConfiguration:self->_routeImageSymbolConfiguration];
    routeImageSymbolConfiguration = v10;
    if (!v10) {
      routeImageSymbolConfiguration = self->_routeImageSymbolConfiguration;
    }
    v12 = routeImageSymbolConfiguration;

    v13 = [v8 imageByApplyingSymbolConfiguration:v12];

    v14 = +[SBElasticRouteDisplayContext routeContextWithName:v7 glyphImage:v13];
  }
  else
  {
    v13 = [v6 packageDescription];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __58__SBElasticVolumeViewController_updateActiveRouteDisplay___block_invoke;
    v21[3] = &unk_1E6B017C0;
    v22 = v5;
    v15 = (void *)MEMORY[0x1D948C7A0](v21);
    v14 = +[SBElasticRouteDisplayContext routeContextWithName:v7 valueTransformer:v15 glyphPackage:v13];
  }
  id v16 = v14;
  *a3 = v16;
  BOOL mediaProvidedRouteDisplayInfoNeedsUpdate = self->_mediaProvidedRouteDisplayInfoNeedsUpdate;
  self->_BOOL mediaProvidedRouteDisplayInfoNeedsUpdate = 0;
  v18 = [(SBElasticVolumeViewController *)self log];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = [v6 type];
    *(_DWORD *)buf = 134218498;
    uint64_t v24 = v19;
    __int16 v25 = 2112;
    v26 = v7;
    __int16 v27 = 1024;
    BOOL v28 = mediaProvidedRouteDisplayInfoNeedsUpdate;
    _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_INFO, "Set route display info for audio route: (%li) named '%@'; updated: %{BOOL}u",
      buf,
      0x1Cu);
  }

  return mediaProvidedRouteDisplayInfoNeedsUpdate;
}

uint64_t __58__SBElasticVolumeViewController_updateActiveRouteDisplay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "packageStateForVolumeValue:");
}

- (unint64_t)layoutAxisForInterfaceOrientation:(int64_t)a3
{
  objc_super v4 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) != 1 && (unint64_t)(a3 - 3) >= 2) {
    return 2;
  }
  else {
    return 1;
  }
}

- (double)interactiveValueUpdateDiscontinuityInterval
{
  return 0.1;
}

- (id)createSliderView
{
  v4.receiver = self;
  v4.super_class = (Class)SBElasticVolumeViewController;
  v2 = [(SBElasticValueViewController *)&v4 createSliderView];
  [v2 setBehaviorIdentifier:1];
  [v2 setShouldIncludeVolumeButtonsInput:1];
  return v2;
}

- (id)sliderAccessibilityIdentifier
{
  return @"sb-volume-hud";
}

- (void)_debugHandleNextRoute
{
}

- (void)_debugHandleResetRoute
{
}

- (void)volumeHUDRouteDescriptionProvider:(id)a3 didChangeOutputDeviceAsset:(id)a4
{
  self->_BOOL mediaProvidedRouteDisplayInfoNeedsUpdate = 1;
  [(SBElasticValueViewController *)self reloadData];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalButtonSceneTargets, 0);
  objc_storeStrong((id *)&self->_routeDescriptionProvider, 0);
  objc_storeStrong((id *)&self->_routeImageSymbolConfiguration, 0);
}

@end