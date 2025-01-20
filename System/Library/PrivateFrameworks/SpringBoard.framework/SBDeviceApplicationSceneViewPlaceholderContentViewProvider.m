@interface SBDeviceApplicationSceneViewPlaceholderContentViewProvider
- (BOOL)_checkApplicationRestorationState:(id)a3 useSnapshot:(BOOL *)a4;
- (CGSize)_naturalSizeForOrientation:(int64_t)a3 referenceSize:(CGSize)result;
- (SBDeviceApplicationSceneViewPlaceholderContentViewProvider)initWithApplication:(id)a3;
- (SBScenePlaceholderContentViewProviderDelegate)delegate;
- (id)_contentViewFromSceneHandle:(id)a3 displayConfiguration:(id)a4 orientation:(int64_t)a5 snapshot:(id)a6 size:(CGSize)a7 statusBarDescriptor:(id)a8 hasOrientationMismatchForClassicApp:(BOOL)a9 customContainerBounds:(CGRect)a10;
- (id)_initWithApplication:(id)a3 userInterfaceStyleForDisplayConfigurationProvider:(id)a4;
- (id)_loadLiveXIBViewForApplication:(id)a3;
- (id)sceneView:(id)a3 requestsPlaceholderContentViewWithContext:(id)a4;
- (int64_t)userInterfaceStyleForDisplayConfiguration:(id)a3;
- (unint64_t)_contentTypeToSearchFromSceneHandle:(id)a3 withContext:(id)a4;
- (void)_snapshotsDidChange:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation SBDeviceApplicationSceneViewPlaceholderContentViewProvider

- (int64_t)userInterfaceStyleForDisplayConfiguration:(id)a3
{
  v3 = (void *)SBApp;
  v4 = [a3 identity];
  v5 = [v3 userInterfaceStyleProviderForDisplay:v4];
  int64_t v6 = [v5 currentStyle];

  return v6;
}

- (void)setDelegate:(id)a3
{
}

- (id)sceneView:(id)a3 requestsPlaceholderContentViewWithContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v57 = [MEMORY[0x1E4F28B00] currentHandler];
    [v57 handleFailureInMethod:a2 object:self file:@"SBDeviceApplicationSceneViewPlaceholderContentViewProvider.m" lineNumber:100 description:@"Unsupported scene view provided to SBDeviceApplicationSceneViewPlaceholderContentViewProvider."];
  }
  uint64_t v9 = objc_opt_class();
  v66 = v8;
  v10 = SBSafeCast(v9, v8);
  v11 = [v7 sceneHandle];
  v63 = [v11 displayIdentity];
  uint64_t v12 = [v63 currentConfiguration];
  [v7 referenceSize];
  double v14 = v13;
  double v16 = v15;
  uint64_t v17 = [v7 orientation];
  v18 = [v11 application];
  userInterfaceStyleForDisplayConfigurationProvider = self->_userInterfaceStyleForDisplayConfigurationProvider;
  if (!userInterfaceStyleForDisplayConfigurationProvider) {
    userInterfaceStyleForDisplayConfigurationProvider = self;
  }
  id v62 = userInterfaceStyleForDisplayConfigurationProvider;
  v67 = (void *)v12;
  uint64_t v20 = [v62 userInterfaceStyleForDisplayConfiguration:v12];
  v21 = [v11 _windowScene];
  v22 = [v21 switcherController];

  v61 = v22;
  if ([v22 isChamoisWindowingUIEnabled]) {
    int v65 = [v18 isClassic];
  }
  else {
    int v65 = 0;
  }
  if (![v11 _mainSceneSupportsInterfaceOrientation:v17] || (unint64_t v23 = v17) == 0) {
    unint64_t v23 = [v11 activationInterfaceOrientationForOrientation:v17];
  }
  if (v23 <= 1) {
    uint64_t v24 = 1;
  }
  else {
    uint64_t v24 = v23;
  }
  if ([v18 isClassic])
  {
    [v18 defaultLaunchingSizeForDisplayConfiguration:v67];
    double v14 = v25;
    double v16 = v26;
  }
  if (![v10 prefersLiveXIB]
    || ![v18 isSystemApplication]
    || ([(SBDeviceApplicationSceneViewPlaceholderContentViewProvider *)self _loadLiveXIBViewForApplication:v18], (v27 = (_SBDeviceApplicationSceneViewPlaceholderContentView *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v28 = self;
    uint64_t v29 = v20;
    v30 = [v7 sceneHandle];
    v59 = v28;
    uint64_t v31 = [(SBDeviceApplicationSceneViewPlaceholderContentViewProvider *)v28 _contentTypeToSearchFromSceneHandle:v30 withContext:v66];

    id v32 = [v10 requestedLaunchIdentifier];
    if (!v32) {
      id v32 = (id)((v31 << 63 >> 63) & (unint64_t)@"SBSuspendSnapshot");
    }
    uint64_t v33 = objc_msgSend(v11, "displayEdgeInfoForLayoutEnvironment:", objc_msgSend(v10, "layoutEnvironment"));
    [v67 pointScale];
    v60 = (void *)v33;
    v64 = v10;
    v58 = v10;
    uint64_t v34 = v24;
    v35 = objc_msgSend(v18, "bestSnapshotWithImageName:sceneHandle:variantID:scale:referenceSize:requireExactSize:contentTypeMask:statusBarStateMask:launchingOrientation:contentOverridesContext:userInterfaceStyle:displayEdgeInfo:", v32, v11, 0, 1, v31, -1, v24, v58, v29, v33);
    uint64_t v36 = [v35 interfaceOrientation];
    v37 = (double *)MEMORY[0x1E4F1DB28];
    if (v65)
    {
      [v7 bounds];
      double v39 = v38;
      double v41 = v40;
      v42 = v59;
      if ((unint64_t)(v17 - 3) < 2 != (unint64_t)(v36 - 3) < 2)
      {
        BSSizeSwap();
        double v39 = v43;
        double v41 = v44;
      }
      if (v35) {
        goto LABEL_25;
      }
    }
    else
    {
      double v39 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v41 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      v42 = v59;
      if (v35)
      {
LABEL_25:
        double v45 = *v37;
        double v46 = v37[1];
        v47 = [v7 statusBarDescriptor];
        v48 = -[SBDeviceApplicationSceneViewPlaceholderContentViewProvider _contentViewFromSceneHandle:displayConfiguration:orientation:snapshot:size:statusBarDescriptor:hasOrientationMismatchForClassicApp:customContainerBounds:](v42, "_contentViewFromSceneHandle:displayConfiguration:orientation:snapshot:size:statusBarDescriptor:hasOrientationMismatchForClassicApp:customContainerBounds:", v11, v67, v34, v35, v47, [v64 hasOrientationMismatchForClassicApp], v14, v16, v45, v46, v39, v41);

        [v7 referenceSize];
        -[SBDeviceApplicationSceneViewPlaceholderContentViewProvider _naturalSizeForOrientation:referenceSize:](v42, "_naturalSizeForOrientation:referenceSize:", v17);
        BSRectWithSize();
        v27 = -[BSUIOrientationTransformWrapperView initWithFrame:]([_SBDeviceApplicationSceneViewPlaceholderContentView alloc], "initWithFrame:", v49, v50, v51, v52);
        [(BSUIOrientationTransformWrapperView *)v27 addContentView:v48];
        [(BSUIOrientationTransformWrapperView *)v27 setContainerOrientation:v17];
        if (v65) {
          [(BSUIOrientationTransformWrapperView *)v27 setContentOrientation:v36];
        }
        [(_SBDeviceApplicationSceneViewPlaceholderContentView *)v27 setClipsToBounds:1];
        v53 = [v35 statusBarSettings];
        uint64_t v54 = [v53 style];

        if (v54 == -1)
        {
          v55 = [v18 info];
          uint64_t v54 = [v55 defaultStatusBarStyle];
        }
        [(_SBDeviceApplicationSceneViewPlaceholderContentView *)v27 setStatusBarStyle:v54];

        goto LABEL_32;
      }
    }
    v27 = 0;
LABEL_32:

    v10 = v64;
  }

  return v27;
}

- (CGSize)_naturalSizeForOrientation:(int64_t)a3 referenceSize:(CGSize)result
{
  if ((unint64_t)(a3 - 1) >= 2) {
    double height = result.height;
  }
  else {
    double height = result.width;
  }
  if ((unint64_t)(a3 - 1) >= 2) {
    result.double height = result.width;
  }
  double v5 = height;
  result.width = v5;
  return result;
}

- (id)_contentViewFromSceneHandle:(id)a3 displayConfiguration:(id)a4 orientation:(int64_t)a5 snapshot:(id)a6 size:(CGSize)a7 statusBarDescriptor:(id)a8 hasOrientationMismatchForClassicApp:(BOOL)a9 customContainerBounds:(CGRect)a10
{
  LOBYTE(v11) = a9;
  return +[SBUIController zoomViewForDeviceApplicationSceneHandle:displayConfiguration:interfaceOrientation:snapshot:snapshotSize:statusBarDescriptor:decodeImage:hasOrientationMismatchForClassicApp:customContainerBounds:](SBUIController, "zoomViewForDeviceApplicationSceneHandle:displayConfiguration:interfaceOrientation:snapshot:snapshotSize:statusBarDescriptor:decodeImage:hasOrientationMismatchForClassicApp:customContainerBounds:", a3, a4, a5, a6, a8, 0, a7.width, a7.height, a10.origin.x, a10.origin.y, a10.size.width, a10.size.height, v11);
}

- (unint64_t)_contentTypeToSearchFromSceneHandle:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = SBSafeCast(v8, v7);
  int v10 = [v7 canShowUserContent];

  if (!v10) {
    goto LABEL_14;
  }
  uint64_t v11 = [v6 _windowScene];
  uint64_t v12 = [v11 authenticationStatusProvider];
  int v13 = [v12 isAuthenticated];

  if (!v13) {
    goto LABEL_14;
  }
  uint64_t v14 = [v9 preferredContentType];
  if (v14 != 1)
  {
    if (!v14)
    {
      double v15 = [v6 application];
      double v16 = [v15 processState];
      int v17 = [v16 isRunning];

      if (v17)
      {

        goto LABEL_12;
      }
      [v6 hasMainSceneBeenForegroundAtLeastOnce];
      unsigned __int8 v23 = 0;
      if ([(SBDeviceApplicationSceneViewPlaceholderContentViewProvider *)self _checkApplicationRestorationState:v15 useSnapshot:&v23])
      {
        int v18 = v23;

        if (v18) {
          goto LABEL_12;
        }
      }
      else if (_os_feature_enabled_impl())
      {
        v19 = [v15 info];
        int v20 = [v19 supportsMultiwindow];

        if (v20) {
          goto LABEL_12;
        }
      }
      else
      {
      }
    }
LABEL_14:
    unint64_t v21 = 6;
    goto LABEL_15;
  }
LABEL_12:
  unint64_t v21 = -1;
LABEL_15:

  return v21;
}

- (BOOL)_checkApplicationRestorationState:(id)a3 useSnapshot:(BOOL *)a4
{
  id v4 = a3;
  double v5 = [v4 bundleIdentifier];
  id v6 = [v4 info];

  id v7 = [v6 restorationArchiveContainerURL];
  uint64_t v8 = [v7 path];
  char v9 = _checkApplicationRestorationState();

  return v9;
}

- (id)_initWithApplication:(id)a3 userInterfaceStyleForDisplayConfigurationProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBDeviceApplicationSceneViewPlaceholderContentViewProvider;
  uint64_t v8 = [(SBDeviceApplicationSceneViewPlaceholderContentViewProvider *)&v12 init];
  char v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_userInterfaceStyleForDisplayConfigurationProvider, a4);
    int v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v9 selector:sel__snapshotsDidChange_ name:@"SBApplicationSnapshotChangedNotification" object:v6];
  }
  return v9;
}

- (SBDeviceApplicationSceneViewPlaceholderContentViewProvider)initWithApplication:(id)a3
{
  return (SBDeviceApplicationSceneViewPlaceholderContentViewProvider *)[(SBDeviceApplicationSceneViewPlaceholderContentViewProvider *)self _initWithApplication:a3 userInterfaceStyleForDisplayConfigurationProvider:0];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  objc_storeWeak((id *)&self->_delegate, 0);
  v4.receiver = self;
  v4.super_class = (Class)SBDeviceApplicationSceneViewPlaceholderContentViewProvider;
  [(SBDeviceApplicationSceneViewPlaceholderContentViewProvider *)&v4 dealloc];
}

- (void)_snapshotsDidChange:(id)a3
{
  BSDispatchQueueAssertMain();
  uint64_t v4 = _snapshotsDidChange__i;
  if (!_snapshotsDidChange__i)
  {
    double v5 = [(SBDeviceApplicationSceneViewPlaceholderContentViewProvider *)self delegate];
    [v5 placeholderContentViewProviderContentDidUpdate:self];

    dispatch_time_t v6 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__SBDeviceApplicationSceneViewPlaceholderContentViewProvider__snapshotsDidChange___block_invoke;
    block[3] = &unk_1E6AF4AC0;
    block[4] = self;
    dispatch_after(v6, MEMORY[0x1E4F14428], block);
    uint64_t v4 = _snapshotsDidChange__i;
  }
  _snapshotsDidChange__i = v4 + 1;
}

uint64_t __82__SBDeviceApplicationSceneViewPlaceholderContentViewProvider__snapshotsDidChange___block_invoke(uint64_t result)
{
  unint64_t v1 = _snapshotsDidChange__i;
  _snapshotsDidChange__i = 0;
  if (v1 >= 2) {
    return [*(id *)(result + 32) _snapshotsDidChange:0];
  }
  return result;
}

- (id)_loadLiveXIBViewForApplication:(id)a3
{
  id v5 = a3;
  if (([v5 isSystemApplication] & 1) == 0)
  {
    int v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"SBDeviceApplicationSceneViewPlaceholderContentViewProvider.m" lineNumber:233 description:@"Cannot load a live XIB view for non-system applications."];
  }
  dispatch_time_t v6 = [v5 info];
  id v7 = [v6 launchInterfaceFileName];

  uint64_t v8 = (void *)MEMORY[0x1E4F28B50];
  char v9 = [v5 info];

  int v10 = [v9 bundleURL];
  uint64_t v11 = [v10 path];
  objc_super v12 = [v8 bundleWithPath:v11];

  int v13 = [MEMORY[0x1E4F42C08] nibWithNibName:v7 bundle:v12];
  uint64_t v14 = [v13 instantiateWithOwner:0 options:0];
  double v15 = [v14 firstObject];
  objc_opt_class();
  id v16 = 0;
  if (objc_opt_isKindOfClass()) {
    id v16 = v15;
  }

  return v16;
}

- (SBScenePlaceholderContentViewProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBScenePlaceholderContentViewProviderDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userInterfaceStyleForDisplayConfigurationProvider, 0);
}

@end