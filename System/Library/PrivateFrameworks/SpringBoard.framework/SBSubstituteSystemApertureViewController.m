@interface SBSubstituteSystemApertureViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_isLockHidden;
- (BOOL)_isOnContinuityDisplay;
- (BOOL)_isStandbyPresented;
- (CGRect)_lockFrame;
- (CGRect)_substituteLockElementContainerFrame;
- (CGRect)sensorRegionFrame;
- (CGRect)systemApertureContainerView:(id)a3 hitRectForBounds:(CGRect)a4 debugColor:(id *)a5;
- (SBSubstituteSystemApertureViewController)initWithSensorRegionFrame:(CGRect)a3;
- (SBSystemApertureWindowScene)activeWindowScene;
- (UIEdgeInsets)_currentEdgeInsets;
- (double)_lockPadding;
- (id)_statusBarManager;
- (id)keyLineColorValidatorForSystemApertureContainerView:(id)a3;
- (id)parentViewForBackgroundForSystemApertureContainerView:(id)a3;
- (id)parentViewForSubBackgroundForSystemApertureContainerView:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_ensureStatusBarAvoidanceFrame;
- (void)_postLayoutDidChangeNotificationIfNecessary;
- (void)_updateKeylineMode;
- (void)_updateLockViewHidden;
- (void)setActiveWindowScene:(id)a3;
- (void)setSensorRegionFrame:(CGRect)a3;
- (void)systemApertureContainerView:(id)a3 sampledLuminanceLevelChangedTo:(int64_t)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SBSubstituteSystemApertureViewController

- (SBSubstituteSystemApertureViewController)initWithSensorRegionFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)SBSubstituteSystemApertureViewController;
  v7 = [(SBSubstituteSystemApertureViewController *)&v12 initWithNibName:0 bundle:0];
  v8 = v7;
  if (v7)
  {
    v7->_sensorRegionFrame.origin.CGFloat x = x;
    v7->_sensorRegionFrame.origin.CGFloat y = y;
    v7->_sensorRegionFrame.size.CGFloat width = width;
    v7->_sensorRegionFrame.size.CGFloat height = height;
    v9 = objc_alloc_init(SBSystemApertureKeyLineColorValidator);
    keyLineColorValidator = v8->_keyLineColorValidator;
    v8->_keyLineColorValidator = v9;
  }
  return v8;
}

- (void)setSensorRegionFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_sensorRegionFrame = &self->_sensorRegionFrame;
  if (!CGRectEqualToRect(self->_sensorRegionFrame, a3))
  {
    p_sensorRegionFrame->origin.CGFloat x = x;
    p_sensorRegionFrame->origin.CGFloat y = y;
    p_sensorRegionFrame->size.CGFloat width = width;
    p_sensorRegionFrame->size.CGFloat height = height;
    id v9 = [(SBSubstituteSystemApertureViewController *)self viewIfLoaded];
    [v9 setNeedsLayout];
  }
}

- (void)setActiveWindowScene:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeWindowScene);
  if (WeakRetained != obj)
  {
    v5 = [WeakRetained associatedWindowScene];
    v6 = [v5 ambientPresentationController];
    [v6 removeObserver:self];

    objc_storeWeak((id *)&self->_activeWindowScene, obj);
    v7 = [obj associatedWindowScene];
    v8 = [v7 ambientPresentationController];
    [v8 addObserver:self];

    [(SBSubstituteSystemApertureViewController *)self _ensureStatusBarAvoidanceFrame];
    [(SBSubstituteSystemApertureViewController *)self _updateLockViewHidden];
    [(SBSubstituteSystemApertureViewController *)self _postLayoutDidChangeNotificationIfNecessary];
  }
}

- (void)viewDidLoad
{
  v35.receiver = self;
  v35.super_class = (Class)SBSubstituteSystemApertureViewController;
  [(SBSubstituteSystemApertureViewController *)&v35 viewDidLoad];
  v3 = [(SBSubstituteSystemApertureViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  objc_super v12 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v5, v7, v9, v11);
  containerSubBackgroundParent = self->_containerSubBackgroundParent;
  self->_containerSubBackgroundParent = v12;

  [(UIView *)self->_containerSubBackgroundParent setUserInteractionEnabled:0];
  v14 = [(UIView *)self->_containerSubBackgroundParent layer];
  [v14 setDisableUpdateMask:32];

  v15 = [(SBSubstituteSystemApertureViewController *)self view];
  [v15 addSubview:self->_containerSubBackgroundParent];

  v16 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v5, v7, v9, v11);
  containerBackgroundParent = self->_containerBackgroundParent;
  self->_containerBackgroundParent = v16;

  [(UIView *)self->_containerBackgroundParent setUserInteractionEnabled:0];
  v18 = [(SBSubstituteSystemApertureViewController *)self view];
  [v18 addSubview:self->_containerBackgroundParent];

  v19 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FA6028]), "initWithFrame:", v5, v7, v9, v11);
  containerParent = self->_containerParent;
  self->_containerParent = v19;

  v21 = [(SBSubstituteSystemApertureViewController *)self view];
  [v21 addSubview:self->_containerParent];

  id v22 = objc_alloc(MEMORY[0x1E4FA7D18]);
  v23 = (SBUIProudLockIconView *)objc_msgSend(v22, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  lockView = self->_lockView;
  self->_lockView = v23;

  [(SBUIProudLockIconView *)self->_lockView setState:1 animated:0];
  [(SBUIProudLockIconView *)self->_lockView setTranslatesAutoresizingMaskIntoConstraints:0];
  v25 = self->_lockView;
  [MEMORY[0x1E4FA5F68] proudLockAssetSize];
  double v27 = v26 / 1.13;
  [MEMORY[0x1E4FA5F68] proudLockAssetSize];
  -[SBUIProudLockIconView setOverrideSize:offset:extent:](v25, "setOverrideSize:offset:extent:", v27, v28 / 1.13, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 12.0);
  v29 = [SBSystemApertureContainerView alloc];
  id v30 = objc_alloc_init(MEMORY[0x1E4F29128]);
  v31 = [(SBSystemApertureContainerView *)v29 initWithInterfaceElementIdentifier:v30];
  substituteLockElementContainer = self->_substituteLockElementContainer;
  self->_substituteLockElementContainer = v31;

  [(SBSystemApertureContainerView *)self->_substituteLockElementContainer setDelegate:self];
  v33 = self->_substituteLockElementContainer;
  v34 = [MEMORY[0x1E4F428B8] colorWithWhite:0.5 alpha:1.0];
  [(SBSystemApertureContainerView *)v33 setKeyLineTintColor:v34];

  [(SBSystemApertureContainerView *)self->_substituteLockElementContainer setKeyLineMode:1];
  [(UIView *)self->_containerParent addSubview:self->_substituteLockElementContainer];
  [(SBSystemApertureContainerView *)self->_substituteLockElementContainer addContentSubview:self->_lockView];
  [(SBSubstituteSystemApertureViewController *)self _updateLockViewHidden];
}

- (void)viewDidLayoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)SBSubstituteSystemApertureViewController;
  [(SBSubstituteSystemApertureViewController *)&v21 viewDidLayoutSubviews];
  v3 = [(SBSubstituteSystemApertureViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[UIView setFrame:](self->_containerBackgroundParent, "setFrame:", v5, v7, v9, v11);
  -[UIView setFrame:](self->_containerParent, "setFrame:", v5, v7, v9, v11);
  -[UIView setFrame:](self->_containerSubBackgroundParent, "setFrame:", v5, v7, v9, v11);
  [(SBSubstituteSystemApertureViewController *)self _substituteLockElementContainerFrame];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  -[SBSystemApertureContainerView setFrame:](self->_substituteLockElementContainer, "setFrame:");
  lockView = self->_lockView;
  [(SBSubstituteSystemApertureViewController *)self _lockFrame];
  -[SBUIProudLockIconView setFrame:](lockView, "setFrame:");
  v22.origin.CGFloat x = v13;
  v22.origin.CGFloat y = v15;
  v22.size.CGFloat width = v17;
  v22.size.CGFloat height = v19;
  [(SBSystemApertureContainerView *)self->_substituteLockElementContainer setIDCornerRadius:CGRectGetHeight(v22) * 0.5];
  [(SBSubstituteSystemApertureViewController *)self _postLayoutDidChangeNotificationIfNecessary];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBSubstituteSystemApertureViewController;
  [(SBSubstituteSystemApertureViewController *)&v4 viewDidAppear:a3];
  [(SBSubstituteSystemApertureViewController *)self _ensureStatusBarAvoidanceFrame];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)parentViewForSubBackgroundForSystemApertureContainerView:(id)a3
{
  return self->_containerSubBackgroundParent;
}

- (id)parentViewForBackgroundForSystemApertureContainerView:(id)a3
{
  return self->_containerBackgroundParent;
}

- (void)systemApertureContainerView:(id)a3 sampledLuminanceLevelChangedTo:(int64_t)a4
{
  self->_lastSampledLumaLevel = a4;
  [(SBSubstituteSystemApertureViewController *)self _updateKeylineMode];
}

- (CGRect)systemApertureContainerView:(id)a3 hitRectForBounds:(CGRect)a4 debugColor:(id *)a5
{
  objc_msgSend(a3, "bounds", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (id)keyLineColorValidatorForSystemApertureContainerView:(id)a3
{
  return self->_keyLineColorValidator;
}

- (double)_lockPadding
{
  double Height = CGRectGetHeight(self->_sensorRegionFrame);
  [MEMORY[0x1E4FA5F68] proudLockAssetSize];
  return (Height + v3 / -1.13) * 0.5 + 1.33333333;
}

- (CGRect)_substituteLockElementContainerFrame
{
  if ([(SBSubstituteSystemApertureViewController *)self _isLockHidden])
  {
    double x = self->_sensorRegionFrame.origin.x;
    CGFloat y = self->_sensorRegionFrame.origin.y;
    double width = self->_sensorRegionFrame.size.width;
    double height = self->_sensorRegionFrame.size.height;
  }
  else
  {
    [(SBSubstituteSystemApertureViewController *)self _lockPadding];
    double v8 = v7;
    [MEMORY[0x1E4FA5F68] proudLockAssetSize];
    double v10 = v8 + v9 / 1.13;
    double v11 = v8 + 6.0;
    p_sensorRegionFrame = &self->_sensorRegionFrame;
    double x = CGRectGetMinX(*p_sensorRegionFrame) - v10;
    CGFloat y = CGRectGetMinY(*p_sensorRegionFrame);
    double width = v11 + v10 + CGRectGetWidth(*p_sensorRegionFrame);
    double height = CGRectGetHeight(*p_sensorRegionFrame);
  }
  double v13 = x;
  double v14 = y;
  double v15 = width;
  result.size.double height = height;
  result.size.double width = v15;
  result.origin.CGFloat y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGRect)_lockFrame
{
  if ([(SBSubstituteSystemApertureViewController *)self _isLockHidden])
  {
    double v3 = *MEMORY[0x1E4F1DB28];
    double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    [(SBSubstituteSystemApertureViewController *)self _lockPadding];
    double v3 = v7;
    double Height = CGRectGetHeight(self->_sensorRegionFrame);
    [MEMORY[0x1E4FA5F68] proudLockAssetSize];
    double v4 = (Height - v9 / 1.13) * 0.5;
    [MEMORY[0x1E4FA5F68] proudLockAssetSize];
    double v6 = v10 / 1.13;
    [MEMORY[0x1E4FA5F68] proudLockAssetSize];
    double v5 = v11 / 1.13;
  }
  double v12 = v3;
  double v13 = v4;
  double v14 = v6;
  result.size.double height = v5;
  result.size.double width = v14;
  result.origin.CGFloat y = v13;
  result.origin.double x = v12;
  return result;
}

- (BOOL)_isLockHidden
{
  if ([(SBSubstituteSystemApertureViewController *)self _isOnContinuityDisplay]) {
    return 1;
  }
  return [(SBSubstituteSystemApertureViewController *)self _isStandbyPresented];
}

- (BOOL)_isStandbyPresented
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeWindowScene);
  double v3 = [WeakRetained associatedWindowScene];
  double v4 = [v3 ambientPresentationController];
  char v5 = [v4 isPresented];

  return v5;
}

- (void)_updateLockViewHidden
{
  int v3 = [(SBSubstituteSystemApertureViewController *)self _isLockHidden];
  if (v3 != [(SBUIProudLockIconView *)self->_lockView isHidden])
  {
    [(SBUIProudLockIconView *)self->_lockView setHidden:[(SBSubstituteSystemApertureViewController *)self _isLockHidden]];
    [(SBSubstituteSystemApertureViewController *)self _updateKeylineMode];
    id v4 = [(SBSubstituteSystemApertureViewController *)self view];
    [v4 setNeedsLayout];
  }
}

- (void)_updateKeylineMode
{
  if ([(SBSubstituteSystemApertureViewController *)self _isLockHidden])
  {
    uint64_t v3 = 0;
  }
  else
  {
    unint64_t lastSampledLumaLevel = self->_lastSampledLumaLevel;
    if (lastSampledLumaLevel > 2) {
      return;
    }
    uint64_t v3 = qword_1D8FD1268[lastSampledLumaLevel];
  }
  substituteLockElementContainer = self->_substituteLockElementContainer;
  [(SBSystemApertureContainerView *)substituteLockElementContainer setKeyLineMode:v3];
}

- (BOOL)_isOnContinuityDisplay
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeWindowScene);
  uint64_t v3 = [WeakRetained associatedWindowScene];
  char v4 = [v3 isContinuityDisplayWindowScene];

  return v4;
}

- (id)_statusBarManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeWindowScene);
  uint64_t v3 = [WeakRetained associatedWindowScene];
  char v4 = [v3 statusBarManager];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      double v7 = v6;
    }
    else {
      double v7 = 0;
    }
  }
  else
  {
    double v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (void)_ensureStatusBarAvoidanceFrame
{
  id v13 = [(SBSubstituteSystemApertureViewController *)self _statusBarManager];
  [(SBSubstituteSystemApertureViewController *)self _substituteLockElementContainerFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  double v12 = [v11 BSAnimationSettings];
  objc_msgSend(v13, "setAvoidanceFrame:reason:statusBar:animationSettings:options:", @"SBSubstituteSystemApertureViewController", 0, v12, 2, v4, v6, v8, v10);
}

- (UIEdgeInsets)_currentEdgeInsets
{
  if ([(SBSubstituteSystemApertureViewController *)self _isLockHidden])
  {
    double v3 = *MEMORY[0x1E4F437F8];
    double v4 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v6 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v5 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  }
  else
  {
    CGFloat x = self->_sensorRegionFrame.origin.x;
    CGFloat y = self->_sensorRegionFrame.origin.y;
    CGFloat width = self->_sensorRegionFrame.size.width;
    CGFloat height = self->_sensorRegionFrame.size.height;
    [(SBSubstituteSystemApertureViewController *)self _substituteLockElementContainerFrame];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v26 = v15;
    CGFloat rect = v13;
    CGFloat v17 = v16;
    CGFloat v23 = v16;
    v28.origin.CGFloat x = x;
    v28.origin.CGFloat y = y;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v28);
    v29.origin.CGFloat x = v12;
    v29.origin.CGFloat y = v14;
    v29.size.CGFloat width = v26;
    v29.size.CGFloat height = v17;
    double v25 = MinY - CGRectGetMinY(v29);
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v30);
    v31.origin.CGFloat x = v12;
    v31.origin.CGFloat y = rect;
    v31.size.CGFloat width = v26;
    v31.size.CGFloat height = v23;
    double v24 = MinX - CGRectGetMinX(v31);
    v32.origin.CGFloat x = x;
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v32);
    v33.origin.CGFloat x = v12;
    v33.origin.CGFloat y = rect;
    v33.size.CGFloat width = v26;
    v33.size.CGFloat height = v23;
    double v6 = MaxY - CGRectGetMaxY(v33);
    v34.origin.CGFloat x = x;
    v34.origin.CGFloat y = y;
    v34.size.CGFloat width = width;
    v34.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v34);
    v35.origin.CGFloat x = v12;
    v35.origin.CGFloat y = rect;
    v35.size.CGFloat width = v26;
    v35.size.CGFloat height = v23;
    double v5 = MaxX - CGRectGetMaxX(v35);
    double v4 = v24;
    double v3 = v25;
  }
  double v22 = v6;
  result.right = v5;
  result.bottom = v22;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)_postLayoutDidChangeNotificationIfNecessary
{
  v32[4] = *MEMORY[0x1E4F143B8];
  [(SBSubstituteSystemApertureViewController *)self _substituteLockElementContainerFrame];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  BOOL v11 = [(SBSubstituteSystemApertureViewController *)self _isLockHidden];
  CGFloat v12 = &unk_1F3347C40;
  if (v11) {
    CGFloat v12 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v13 = v12;
  CGFloat v14 = (void *)MEMORY[0x1E4F1CA60];
  v31[0] = @"SBSystemApertureEdgeInsets";
  double v15 = (void *)MEMORY[0x1E4F29238];
  [(SBSubstituteSystemApertureViewController *)self _currentEdgeInsets];
  double v16 = objc_msgSend(v15, "valueWithUIEdgeInsets:");
  v32[0] = v16;
  v31[1] = @"SBSystemApertureFrames";
  v29[0] = v4;
  v29[1] = v6;
  v29[2] = v8;
  v29[3] = v10;
  CGFloat v17 = [MEMORY[0x1E4F29238] valueWithBytes:v29 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  CGRect v30 = v17;
  double v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  v32[1] = v18;
  v32[2] = v13;
  v31[2] = @"SBSystemApertureVisibleElementIdentifiers";
  v31[3] = @"SBSystemApertureCanRegisterRecordingIndicator";
  CGFloat v19 = [NSNumber numberWithBool:0];
  v32[3] = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:4];
  objc_super v21 = [v14 dictionaryWithDictionary:v20];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeWindowScene);
  CGFloat v23 = [WeakRetained associatedWindowScene];
  double v24 = [v23 _sbDisplayConfiguration];
  double v25 = [v24 identity];

  if (v25) {
    [v21 setObject:v25 forKey:@"SBSystemApertureOriginatingDisplayIdentity"];
  }
  if ((BSEqualObjects() & 1) == 0)
  {
    CGFloat v26 = (NSDictionary *)[v21 copy];
    cachedLayoutDidChangeUserInfo = self->_cachedLayoutDidChangeUserInfo;
    self->_cachedLayoutDidChangeUserInfo = v26;

    CGRect v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v28 postNotificationName:@"SBSystemApertureLayoutDidChangeNotification" object:self userInfo:self->_cachedLayoutDidChangeUserInfo];
  }
}

- (CGRect)sensorRegionFrame
{
  double x = self->_sensorRegionFrame.origin.x;
  double y = self->_sensorRegionFrame.origin.y;
  double width = self->_sensorRegionFrame.size.width;
  double height = self->_sensorRegionFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (SBSystemApertureWindowScene)activeWindowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeWindowScene);
  return (SBSystemApertureWindowScene *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activeWindowScene);
  objc_storeStrong((id *)&self->_cachedLayoutDidChangeUserInfo, 0);
  objc_storeStrong((id *)&self->_keyLineColorValidator, 0);
  objc_storeStrong((id *)&self->_substituteLockElementContainer, 0);
  objc_storeStrong((id *)&self->_lockView, 0);
  objc_storeStrong((id *)&self->_containerSubBackgroundParent, 0);
  objc_storeStrong((id *)&self->_containerParent, 0);
  objc_storeStrong((id *)&self->_containerBackgroundParent, 0);
}

@end