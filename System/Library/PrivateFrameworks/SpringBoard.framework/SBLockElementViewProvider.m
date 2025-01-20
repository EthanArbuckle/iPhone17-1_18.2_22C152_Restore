@interface SBLockElementViewProvider
+ (BOOL)deviceSupportsElement;
- (BOOL)_activelyWantsMatching;
- (BOOL)_allowsBiometricUnlock;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isShowingInLandscape;
- (BOOL)_treatsAsAmbientSearching;
- (BOOL)handleElementViewEvent:(int64_t)a3;
- (BOOL)hasActivityBehavior;
- (BOOL)isProvidedViewConcentric:(id)a3 inLayoutMode:(int64_t)a4;
- (BOOL)preventsSwipeToHide;
- (BOOL)shouldIgnoreSystemChromeSuppression;
- (BOOL)shouldSuppressElementWhileOnContinuityDisplay;
- (BOOL)shouldSuppressElementWhileOnCoversheet;
- (BOOL)shouldSuppressElementWhileOverLiquidDetectionCriticalUI;
- (CGRect)_elementFrameLeading:(BOOL)a3 forLayoutMode:(int64_t)a4;
- (CGSize)sizeThatFitsSize:(CGSize)a3 forProvidedView:(id)a4 inLayoutMode:(int64_t)a5;
- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5;
- (SBLockElementViewProvider)init;
- (SBUISystemApertureContentProvider)contentProvider;
- (SBUISystemApertureCustomContentProvider)lockProvider;
- (SBUISystemApertureCustomContentProvider)trailingPackageProvider;
- (id)elementHost;
- (id)elementIdentifier;
- (id)layoutHost;
- (id)leadingLock;
- (id)prominentLock;
- (id)trailingPackageView;
- (int64_t)layoutMode;
- (int64_t)maximumSupportedLayoutMode;
- (int64_t)minimumSupportedLayoutMode;
- (int64_t)preferredLayoutMode;
- (int64_t)systemApertureCustomLayout;
- (unint64_t)_unlockMode;
- (void)_setAcquiring:(BOOL)a3;
- (void)_setUnlockMode:(unint64_t)a3;
- (void)_toggleUnlockMode;
- (void)_updateAllowsBioUnlock;
- (void)_updateContentProvidersForViewProviderMode;
- (void)_updateLargePackageVisibility;
- (void)_updateLeadingPackageVisibility;
- (void)_updateLockLayout;
- (void)_updateProminentLockIfNecessaryWithState:(int64_t)a3;
- (void)_updateTrailingGlyph;
- (void)_updateTrailingPackageVisibility;
- (void)_updateUnlockModeForState;
- (void)backlightController:(id)a3 willTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5;
- (void)biometricResource:(id)a3 matchingEnabledDidChange:(BOOL)a4;
- (void)biometricResource:(id)a3 observeEvent:(unint64_t)a4;
- (void)contentProviderWillTransitionToSize:(CGSize)a3 inContainerView:(id)a4 transitionCoordinator:(id)a5;
- (void)dealloc;
- (void)handleBiometricEvent:(int64_t)a3;
- (void)layoutHostContainerViewWillLayoutSubviews:(id)a3;
- (void)setAuthenticated:(BOOL)a3;
- (void)setBloomed:(BOOL)a3;
- (void)setContentProvider:(id)a3;
- (void)setElementHost:(id)a3;
- (void)setEmpty:(BOOL)a3;
- (void)setLayoutHost:(id)a3;
- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4;
- (void)setLockProvider:(id)a3;
- (void)setTrailingPackageProvider:(id)a3;
- (void)shake;
@end

@implementation SBLockElementViewProvider

- (SBLockElementViewProvider)init
{
  v52[6] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4FA7D70]);
  v51.receiver = self;
  v51.super_class = (Class)SBLockElementViewProvider;
  v5 = [(SBSystemApertureProvidedContentElement *)&v51 initWithIdentifier:self contentProvider:v4];
  if (v5)
  {
    if (([(id)objc_opt_class() deviceSupportsElement] & 1) == 0)
    {
      v37 = [MEMORY[0x1E4F28B00] currentHandler];
      [v37 handleFailureInMethod:a2 object:v5 file:@"SBLockElementViewProvider.m" lineNumber:87 description:@"It's probably not beneficial to use this when unsupported."];
    }
    uint64_t v6 = [MEMORY[0x1E4FA7C68] sharedInstance];
    sharedResource = v5->_sharedResource;
    v5->_sharedResource = (SBUIBiometricResource *)v6;

    [(SBUIBiometricResource *)v5->_sharedResource addObserver:v5];
    v5->_allowsBioUnlock = [(SBLockElementViewProvider *)v5 _activelyWantsMatching];
    [(SBLockElementViewProvider *)v5 _setUnlockMode:1];
    p_contentProvider = (id *)&v5->_contentProvider;
    objc_storeStrong((id *)&v5->_contentProvider, v4);
    id v8 = objc_alloc(MEMORY[0x1E4FA7D78]);
    v9 = [(SBLockElementViewProvider *)v5 leadingLock];
    uint64_t v10 = [v8 initWithView:v9];
    lockProvider = v5->_lockProvider;
    v5->_lockProvider = (SBUISystemApertureCustomContentProvider *)v10;

    v12 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithSize:", 37.0, 37.0);
    v13 = [(SBLockElementViewProvider *)v5 trailingPackageView];
    [(UIView *)v12 addSubview:v13];
    [(UIView *)v12 setClipsToBounds:0];
    [(UIView *)v12 setClipsToBounds:0];
    v41 = (void *)MEMORY[0x1E4F28DC8];
    v47 = [v13 widthAnchor];
    v46 = [(UIView *)v12 widthAnchor];
    v45 = [v47 constraintEqualToAnchor:v46];
    v52[0] = v45;
    v44 = [v13 heightAnchor];
    v43 = [(UIView *)v12 heightAnchor];
    v42 = [v44 constraintEqualToAnchor:v43];
    v52[1] = v42;
    v48 = v13;
    v14 = [v13 centerXAnchor];
    v40 = v14;
    uint64_t v15 = [(UIView *)v12 centerXAnchor];
    v39 = (void *)v15;
    uint64_t v16 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
    double v17 = 6.0;
    if (v16 == 1) {
      double v17 = -6.0;
    }
    v38 = [v14 constraintEqualToAnchor:v15 constant:v17];
    v52[2] = v38;
    v18 = [v13 centerYAnchor];
    v19 = [(UIView *)v12 centerYAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v52[3] = v20;
    v21 = [(UIView *)v12 widthAnchor];
    [v21 constraintEqualToConstant:37.0];
    v22 = id v50 = v4;
    v52[4] = v22;
    v23 = [(UIView *)v12 heightAnchor];
    v24 = [v23 constraintEqualToConstant:37.0];
    v52[5] = v24;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:6];
    [v41 activateConstraints:v25];

    trailingView = v5->_trailingView;
    v5->_trailingView = v12;
    v27 = v12;

    id v28 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(UIView *)v5->_trailingView size];
    uint64_t v29 = objc_msgSend(v28, "initWithSize:");
    trailingContainerView = v5->_trailingContainerView;
    v5->_trailingContainerView = (UIView *)v29;

    [(UIView *)v5->_trailingContainerView addSubview:v5->_trailingView];
    v31 = v5->_trailingContainerView;
    v32 = [(SBLockElementViewProvider *)v5 prominentLock];
    [(UIView *)v31 addSubview:v32];

    id v4 = v50;
    uint64_t v33 = [objc_alloc(MEMORY[0x1E4FA7D78]) initWithView:v5->_trailingContainerView];
    trailingPackageProvider = v5->_trailingPackageProvider;
    v5->_trailingPackageProvider = (SBUISystemApertureCustomContentProvider *)v33;

    [*p_contentProvider setLeadingContentViewProvider:v5->_lockProvider];
    [*p_contentProvider setTrailingContentViewProvider:v5->_trailingPackageProvider];
    v35 = +[SBBacklightController sharedInstance];

    [v35 addObserver:v5];
    [(SBLockElementViewProvider *)v5 _updateContentProvidersForViewProviderMode];
  }
  return v5;
}

- (void)dealloc
{
  v3 = +[SBBacklightController sharedInstance];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBLockElementViewProvider;
  [(SBLockElementViewProvider *)&v4 dealloc];
}

+ (BOOL)deviceSupportsElement
{
  if (deviceSupportsElement_onceToken != -1) {
    dispatch_once(&deviceSupportsElement_onceToken, &__block_literal_global_22);
  }
  return deviceSupportsElement_isJindo;
}

uint64_t __50__SBLockElementViewProvider_deviceSupportsElement__block_invoke()
{
  char v0 = 1;
  uint64_t result = SBFEffectiveArtworkSubtype();
  if (result > 2795)
  {
    if (result != 2796 && result != 2868) {
      goto LABEL_7;
    }
  }
  else if (result != 2556 && result != 2622)
  {
LABEL_7:
    char v0 = 0;
  }
  deviceSupportsElement_isJindo = v0;
  return result;
}

- (void)shake
{
  id v3 = [(SBLockElementViewProvider *)self elementHost];
  [v3 elementRequestsNegativeResponse:self];
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5
{
  if (self->_isEmpty)
  {
    CGFloat top = *MEMORY[0x1E4F424F0];
    double v5 = *(double *)(MEMORY[0x1E4F424F0] + 8);
    double bottom = *(double *)(MEMORY[0x1E4F424F0] + 16);
    double trailing = *(double *)(MEMORY[0x1E4F424F0] + 24);
  }
  else
  {
    double trailing = a4.trailing;
    double bottom = a4.bottom;
    double leading = a4.leading;
    CGFloat top = a4.top;
    unint64_t v12 = [(SBLockElementViewProvider *)self _unlockMode];
    if (a3 == 3 || (v12 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      BOOL v15 = [(SBLockElementViewProvider *)self _treatsAsAmbientSearching];
      if (v15) {
        double bottom = -118.0;
      }
      else {
        double bottom = -14.0;
      }
      if (v15) {
        double trailing = -14.0;
      }
      else {
        double trailing = -40.0;
      }
      CGFloat top = -1.0;
      double v5 = trailing;
    }
    else
    {
      if (self->_isAuthenticated)
      {
        uint64_t v13 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
        double v14 = 0.666666;
        if (v13 == 1) {
          double v14 = 2.0;
        }
      }
      else
      {
        double v14 = 0.0;
      }
      double v5 = leading - v14;
    }
  }
  double v16 = top;
  double v17 = bottom;
  double v18 = trailing;
  result.double trailing = v18;
  result.double bottom = v17;
  result.double leading = v5;
  result.CGFloat top = v16;
  return result;
}

- (void)setAuthenticated:(BOOL)a3
{
  if (self->_isAuthenticated == a3) {
    return;
  }
  BOOL v3 = a3;
  self->_isAuthenticated = a3;
  if (a3) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  [(SBLockElementViewProvider *)self handleBiometricEvent:v5];
  if (self->_isInBloomMode)
  {
    if (v3)
    {
LABEL_7:
      if (self->_hasActiveUnlockAttempt) {
        uint64_t v6 = 6;
      }
      else {
        uint64_t v6 = 0;
      }
      [(SBLockElementViewProvider *)self handleBiometricEvent:v6];
      self->_hasActiveUnlockAttempt = 0;
      return;
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    [WeakRetained preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:self];

    if (v3) {
      goto LABEL_7;
    }
  }
  [(SBLockElementViewProvider *)self _setAcquiring:0];
  [(SBLockElementViewProvider *)self _updateTrailingPackageVisibility];
}

- (void)_updateLockLayout
{
  [(SBLockElementViewProvider *)self _elementFrameLeading:1 forLayoutMode:[(SBLockElementViewProvider *)self layoutMode]];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(SBLockElementViewProvider *)self layoutMode] == 3)
  {
    if ([(SBLockElementViewProvider *)self _treatsAsAmbientSearching])
    {
      prominentLock = self->_prominentLock;
      double v12 = *MEMORY[0x1E4F1DAD8];
      double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      double v14 = 67.0;
      double v15 = 67.0;
      double v16 = 67.0;
    }
    else
    {
      -[SBUIProudLockIconView setFrame:](self->_leadingLock, "setFrame:", v4, v6, v8, v10);
      prominentLock = self->_leadingLock;
      double v12 = 0.0;
      double v13 = 0.0;
      double v14 = v8;
      double v15 = v10;
      double v16 = v10;
    }
  }
  else
  {
    -[SBUIProudLockIconView setFrame:](self->_leadingLock, "setFrame:", v4, v6, v8, v10);
    prominentLock = self->_leadingLock;
    double v12 = *MEMORY[0x1E4F1DAD8];
    double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v16 = 12.0;
    double v14 = v8;
    double v15 = v10;
  }
  -[SBUIProudLockIconView setOverrideSize:offset:extent:](prominentLock, "setOverrideSize:offset:extent:", v14, v15, v12, v13, v16);
}

- (void)_updateAllowsBioUnlock
{
  BOOL v3 = [(SBLockElementViewProvider *)self _activelyWantsMatching];
  if (self->_allowsBioUnlock == v3)
  {
    if (self->_allowsBioUnlock && !self->_isAuthenticated)
    {
      [(SBLockElementViewProvider *)self handleBiometricEvent:16];
    }
  }
  else
  {
    self->_allowsBioUnlock = v3;
    if (v3) {
      uint64_t v4 = 16;
    }
    else {
      uint64_t v4 = 0;
    }
    [(SBLockElementViewProvider *)self handleBiometricEvent:v4];
    if (!self->_allowsBioUnlock)
    {
      [(SBLockElementViewProvider *)self _updateTrailingPackageVisibility];
    }
  }
}

- (void)setEmpty:(BOOL)a3
{
  if (self->_isEmpty != a3)
  {
    self->_isEmpty = a3;
    [(SBLockElementViewProvider *)self _updateLeadingPackageVisibility];
    [(SBLockElementViewProvider *)self _updateTrailingPackageVisibility];
    [(SBLockElementViewProvider *)self _updateLargePackageVisibility];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    [WeakRetained preferredLayoutModeDidInvalidateForLayoutSpecifier:self];
    [WeakRetained preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:self];
  }
}

- (void)setBloomed:(BOOL)a3
{
  if (self->_isInBloomMode != a3)
  {
    self->_isInBloomMode = a3;
    [(SBLockElementViewProvider *)self _updateUnlockModeForState];
  }
}

- (void)_updateContentProvidersForViewProviderMode
{
  BOOL v3 = [(SBLockElementViewProvider *)self _treatAsAmbient];
  if (v3)
  {
    uint64_t v4 = [(SBLockElementViewProvider *)self prominentLock];
  }
  else
  {
    uint64_t v4 = self->_trailingView;
  }
  trailingContainerView = self->_trailingContainerView;
  double v9 = v4;
  [(UIView *)v4 frame];
  -[UIView setSize:](trailingContainerView, "setSize:", v6, v7);
  double v8 = [(SBLockElementViewProvider *)self prominentLock];
  [v8 setHidden:v3 ^ 1];

  [(UIView *)self->_trailingView setHidden:v3];
}

- (BOOL)_treatsAsAmbientSearching
{
  BOOL v3 = [(SBLockElementViewProvider *)self _treatAsAmbient];
  if (v3) {
    LOBYTE(v3) = self->_layoutMode == 3;
  }
  return v3;
}

- (void)_updateProminentLockIfNecessaryWithState:(int64_t)a3
{
  if ([(SBLockElementViewProvider *)self _treatAsAmbient])
  {
    prominentLock = self->_prominentLock;
    [(SBUIProudLockIconView *)prominentLock setState:a3];
  }
}

- (int64_t)systemApertureCustomLayout
{
  return [(SBLockElementViewProvider *)self _treatsAsAmbientSearching];
}

- (void)handleBiometricEvent:(int64_t)a3
{
  BOOL v3 = self;
  switch(a3)
  {
    case 0:
    case 6:
      goto LABEL_12;
    case 1:
    case 2:
      leadingLock = self->_leadingLock;
      -[SBUIProudLockIconView setState:](leadingLock, "setState:");
      return;
    case 5:
      [(SBLockElementViewProvider *)self _setAcquiring:1];
      self = v3;
      a3 = 5;
      goto LABEL_12;
    case 7:
      [(SBLockElementViewProvider *)self _setAcquiring:0];
      [(SBLockElementViewProvider *)v3 _updateProminentLockIfNecessaryWithState:7];
      if (v3->_isInBloomMode)
      {
        [(SBLockElementViewProvider *)v3 shake];
      }
      return;
    case 16:
      [(SBLockElementViewProvider *)self _setAcquiring:0];
      self = v3;
      a3 = 16;
LABEL_12:
      [(SBLockElementViewProvider *)self _updateProminentLockIfNecessaryWithState:a3];
      break;
    default:
      return;
  }
}

- (void)_updateLeadingPackageVisibility
{
  BOOL v3 = ![(SBLockElementViewProvider *)self _treatAsAmbient]
    && self->_priorLayoutMode == 3
    && self->_layoutMode == -1;
  BOOL v4 = [(SBLockElementViewProvider *)self _treatsAsAmbientSearching];
  int v5 = self->_isEmpty || v4;
  leadingLock = self->_leadingLock;
  [(SBUIProudLockIconView *)leadingLock setHidden:v5 | v3];
}

- (void)_updateTrailingPackageVisibility
{
  trailingPackageView = self->_trailingPackageView;
  BOOL v4 = [(SBLockElementViewProvider *)self _treatAsAmbient]
    || ![(SBLockElementViewProvider *)self _allowsBiometricUnlock]
    || self->_isEmpty;
  [(BSUICAPackageView *)trailingPackageView setHidden:v4];
}

- (void)_updateLargePackageVisibility
{
  if (self->_isEmpty || ![(SBLockElementViewProvider *)self _treatsAsAmbientSearching])
  {
    if (([(SBUIProudLockIconView *)self->_prominentLock isHidden] & 1) == 0) {
      [(SBUIProudLockIconView *)self->_prominentLock setState:0];
    }
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = 0;
  }
  prominentLock = self->_prominentLock;
  [(SBUIProudLockIconView *)prominentLock setHidden:v3];
}

- (void)_setAcquiring:(BOOL)a3
{
  if (self->_isAcquiring != a3)
  {
    self->_isAcquiring = a3;
    [(SBLockElementViewProvider *)self _updateUnlockModeForState];
  }
}

- (void)_updateUnlockModeForState
{
  if (self->_isInBloomMode && [(SBLockElementViewProvider *)self _activelyWantsMatching])
  {
    if (self->_isAcquiring) {
      uint64_t v3 = 2;
    }
    else {
      uint64_t v3 = 3;
    }
  }
  else
  {
    uint64_t v3 = 1;
  }
  [(SBLockElementViewProvider *)self _setUnlockMode:v3];
}

- (id)elementIdentifier
{
  return (id)*MEMORY[0x1E4FA7F28];
}

- (BOOL)hasActivityBehavior
{
  return 1;
}

- (BOOL)handleElementViewEvent:(int64_t)a3
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CGRect)_elementFrameLeading:(BOOL)a3 forLayoutMode:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) < 0xFFFFFFFFFFFFFFFELL || a3)
  {
    if (a4 == 3)
    {
      double v7 = 23.0;
      double v5 = 0.0;
      double v6 = 17.3333333;
      double v4 = -27.0;
      if (a3) {
        double v4 = 0.0;
      }
      else {
        double v6 = 27.0;
      }
      if (!a3) {
        double v7 = 27.0;
      }
    }
    else
    {
      double v7 = 15.0;
      double v4 = 0.0;
      double v6 = 11.333333;
      double v5 = 0.0;
    }
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DB28];
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)leadingLock
{
  leadingLock = self->_leadingLock;
  if (!leadingLock)
  {
    [(SBLockElementViewProvider *)self _elementFrameLeading:1 forLayoutMode:1];
    double v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA7D18]), "initWithFrame:", v4, v5, v6, v7);
    double v9 = v8;
    if (self->_isAuthenticated) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 1;
    }
    [v8 setState:v10 animated:0];
    v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v12 = [v11 localizedStringForKey:@"SWIPE_UP_TO_UNLOCK" value:&stru_1F3084718 table:@"CoverSheetCommon"];
    [v9 setAccessibilityLabel:v12];

    double v13 = self->_leadingLock;
    self->_leadingLock = (SBUIProudLockIconView *)v9;

    leadingLock = self->_leadingLock;
  }
  return leadingLock;
}

- (id)prominentLock
{
  prominentLock = self->_prominentLock;
  if (!prominentLock)
  {
    double v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA7D18]), "initWithFrame:", 0.0, 0.0, 67.0, 67.0);
    [v4 setOverrideGlyphStyle:1];
    double v5 = [MEMORY[0x1E4F428B8] colorWithRed:0.192156863 green:0.819607843 blue:0.345098039 alpha:1.0];
    double v6 = (void *)[objc_alloc(MEMORY[0x1E4F43228]) initWithContentColor:v5];
    [v4 setLegibilitySettings:v6];

    double v7 = self->_prominentLock;
    self->_prominentLock = (SBUIProudLockIconView *)v4;

    prominentLock = self->_prominentLock;
  }
  return prominentLock;
}

- (id)trailingPackageView
{
  trailingPackageView = self->_trailingPackageView;
  if (!trailingPackageView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F4F8A0]);
    double v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v6 = (BSUICAPackageView *)[v4 initWithPackageName:@"Round-D73" inBundle:v5];

    [(BSUICAPackageView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v7 = self->_trailingPackageView;
    self->_trailingPackageView = v6;

    trailingPackageView = self->_trailingPackageView;
  }
  return trailingPackageView;
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  int64_t layoutMode = self->_layoutMode;
  if (layoutMode != a3) {
    self->_priorLayoutMode = layoutMode;
  }
  self->_int64_t layoutMode = a3;
  [(SBLockElementViewProvider *)self _updateLeadingPackageVisibility];
  [(SBLockElementViewProvider *)self _updateTrailingPackageVisibility];
  [(SBLockElementViewProvider *)self _updateLargePackageVisibility];
  [(SBLockElementViewProvider *)self _updateContentProvidersForViewProviderMode];
}

- (int64_t)minimumSupportedLayoutMode
{
  if (self->_isEmpty) {
    return 1;
  }
  unint64_t v3 = [(SBLockElementViewProvider *)self _unlockMode];
  int64_t v4 = 3;
  if (v3 == 1) {
    int64_t v4 = 1;
  }
  if (v3) {
    return v4;
  }
  else {
    return -1;
  }
}

- (int64_t)maximumSupportedLayoutMode
{
  if (self->_isEmpty) {
    return 1;
  }
  unint64_t v3 = [(SBLockElementViewProvider *)self _unlockMode];
  int64_t v4 = 3;
  if (v3 == 1) {
    int64_t v4 = 1;
  }
  if (v3) {
    return v4;
  }
  else {
    return -1;
  }
}

- (int64_t)preferredLayoutMode
{
  if (self->_isEmpty) {
    return 1;
  }
  unint64_t v3 = [(SBLockElementViewProvider *)self _unlockMode];
  int64_t v4 = 3;
  if (v3 == 1) {
    int64_t v4 = 1;
  }
  if (v3) {
    return v4;
  }
  else {
    return -1;
  }
}

- (CGSize)sizeThatFitsSize:(CGSize)a3 forProvidedView:(id)a4 inLayoutMode:(int64_t)a5
{
  CGFloat height = a3.height;
  double v8 = (SBUIProudLockIconView *)a4;
  double v9 = v8;
  if ((unint64_t)(a5 + 1) >= 2)
  {
    if (a5 == 3)
    {
      if ((SBUIProudLockIconView *)self->_trailingPackageView == v8)
      {
        *(double *)&uint64_t v10 = 37.0;
        CGFloat height = 37.0;
      }
      else
      {
        CGFloat height = 23.0;
        *(double *)&uint64_t v10 = 17.3333333;
        if (self->_leadingLock != v8 && self->_prominentLock != v8)
        {
          uint64_t v10 = *(uint64_t *)MEMORY[0x1E4F1DB30];
          CGFloat height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
        }
      }
    }
    else
    {
      [(SBLockElementViewProvider *)self _elementFrameLeading:self->_leadingLock == v8 forLayoutMode:a5];
      uint64_t v10 = v11;
      CGFloat height = v12;
    }
  }
  else
  {
    *(double *)&uint64_t v10 = 0.0;
  }

  double v13 = *(double *)&v10;
  double v14 = height;
  result.CGFloat height = v14;
  result.width = v13;
  return result;
}

- (void)layoutHostContainerViewWillLayoutSubviews:(id)a3
{
  id v23 = a3;
  [(SBLockElementViewProvider *)self _updateLockLayout];
  [v23 size];
  if (v4 <= 200.0)
  {
    if ([(SBLockElementViewProvider *)self layoutMode] == 3) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 1;
    }
  }
  else
  {
    uint64_t v5 = 3;
  }
  [(SBLockElementViewProvider *)self _elementFrameLeading:1 forLayoutMode:v5];
  double v7 = v6;
  double v9 = v8;
  if ([(SBLockElementViewProvider *)self layoutMode] == 3)
  {
    [v23 center];
    double v11 = v10;
    double v13 = v12;
    if ([(SBLockElementViewProvider *)self _treatsAsAmbientSearching])
    {
      -[SBUIProudLockIconView setSize:](self->_prominentLock, "setSize:", 67.0, 67.0);
      -[SBUIProudLockIconView setCenter:](self->_prominentLock, "setCenter:", 33.5, 33.5);
      [(SBUIProudLockIconView *)self->_prominentLock size];
      double v15 = v14;
      double v17 = v16;
    }
    else
    {
      -[SBUIProudLockIconView setSize:](self->_leadingLock, "setSize:", v7, v9);
      [(SBUIProudLockIconView *)self->_leadingLock center];
      [v23 bounds];
      CGRectGetMidY(v25);
      UIRoundToViewScale();
      double v18 = (id *)MEMORY[0x1E4F43630];
      if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
      {
        [v23 bounds];
        CGRectGetMaxX(v26);
      }
      UIRoundToViewScale();
      -[SBUIProudLockIconView setCenter:](self->_leadingLock, "setCenter:");
      [(UIView *)self->_trailingView size];
      double v15 = v19;
      double v17 = v20;
      [v23 bounds];
      CGRectGetMidY(v27);
      UIRoundToViewScale();
      double v13 = v21;
      if ([*v18 userInterfaceLayoutDirection] != 1)
      {
        [v23 bounds];
        CGRectGetMaxX(v28);
      }
      UIRoundToViewScale();
      double v11 = v22;
      -[UIView setCenter:](self->_trailingView, "setCenter:", v15 * 0.5, v17 * 0.5);
    }
    -[UIView setSize:](self->_trailingContainerView, "setSize:", v15, v17);
    -[UIView setCenter:](self->_trailingContainerView, "setCenter:", v11, v13);
  }
}

- (BOOL)isProvidedViewConcentric:(id)a3 inLayoutMode:(int64_t)a4
{
  return 0;
}

- (BOOL)shouldSuppressElementWhileOnCoversheet
{
  return 0;
}

- (BOOL)shouldSuppressElementWhileOverLiquidDetectionCriticalUI
{
  return 0;
}

- (BOOL)shouldIgnoreSystemChromeSuppression
{
  return 1;
}

- (BOOL)shouldSuppressElementWhileOnContinuityDisplay
{
  return 1;
}

- (BOOL)preventsSwipeToHide
{
  return 1;
}

- (void)biometricResource:(id)a3 matchingEnabledDidChange:(BOOL)a4
{
  [(SBLockElementViewProvider *)self _updateAllowsBioUnlock];
  [(SBLockElementViewProvider *)self _updateTrailingGlyph];
}

- (void)biometricResource:(id)a3 observeEvent:(unint64_t)a4
{
  double v6 = (SBUIBiometricResource *)a3;
  if (self->_sharedResource == v6)
  {
    double v9 = v6;
    switch(a4)
    {
      case 4uLL:
        double v7 = self;
        uint64_t v8 = 6;
        goto LABEL_4;
      case 5uLL:
      case 6uLL:
      case 7uLL:
      case 8uLL:
      case 0xBuLL:
        [(SBLockElementViewProvider *)self _updateAllowsBioUnlock];
        goto LABEL_6;
      case 9uLL:
      case 0xAuLL:
      case 0xFuLL:
      case 0x11uLL:
      case 0x12uLL:
      case 0x13uLL:
      case 0x14uLL:
      case 0x15uLL:
      case 0x17uLL:
      case 0x18uLL:
        self->_hasActiveUnlockAttempt = 0;
        double v7 = self;
        uint64_t v8 = 7;
        goto LABEL_4;
      case 0xCuLL:
        double v7 = self;
        uint64_t v8 = 4;
        goto LABEL_4;
      case 0xDuLL:
        if (self->_hasActiveUnlockAttempt || self->_isAuthenticated) {
          break;
        }
        self->_hasActiveUnlockAttempt = 1;
LABEL_16:
        double v7 = self;
        uint64_t v8 = 5;
LABEL_4:
        [(SBLockElementViewProvider *)v7 handleBiometricEvent:v8];
LABEL_6:
        double v6 = v9;
        break;
      case 0xEuLL:
      case 0x16uLL:
        double v7 = self;
        uint64_t v8 = 16;
        goto LABEL_4;
      case 0x22uLL:
        goto LABEL_16;
      default:
        break;
    }
  }
}

- (BOOL)_activelyWantsMatching
{
  if (![(SBLockElementViewProvider *)self _allowsBiometricUnlock]
    || ![(SBUIBiometricResource *)self->_sharedResource isMatchingAllowed]
    || ([(SBUIBiometricResource *)self->_sharedResource isMatchingEnabled] & 1) == 0
    && !self->_isAuthenticated)
  {
    return 0;
  }
  sharedResource = self->_sharedResource;
  return [(SBUIBiometricResource *)sharedResource isPearlDetectEnabled];
}

- (void)contentProviderWillTransitionToSize:(CGSize)a3 inContainerView:(id)a4 transitionCoordinator:(id)a5
{
  id v7 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __103__SBLockElementViewProvider_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke;
  v9[3] = &unk_1E6AF7D20;
  v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  [a5 animateAlongsideTransition:v9 completion:0];
}

uint64_t __103__SBLockElementViewProvider_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateContentProvidersForViewProviderMode];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 layoutHostContainerViewWillLayoutSubviews:v3];
}

- (void)backlightController:(id)a3 willTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5
{
  id v7 = a3;
  if (a4 == 1)
  {
    id v13 = v7;
    [(BSInvalidatable *)self->_nonSecureLockContentAssertion invalidate];
    nonSecureLockContentAssertion = self->_nonSecureLockContentAssertion;
    self->_nonSecureLockContentAssertion = 0;
    goto LABEL_6;
  }
  if (a4 == 3 && !self->_nonSecureLockContentAssertion)
  {
    id v13 = v7;
    leadingLock = self->_leadingLock;
    double v9 = (objc_class *)objc_opt_class();
    nonSecureLockContentAssertion = NSStringFromClass(v9);
    double v11 = [(SBUIProudLockIconView *)leadingLock acquireNonSecureContentAssertionForReason:nonSecureLockContentAssertion];
    double v12 = self->_nonSecureLockContentAssertion;
    self->_nonSecureLockContentAssertion = v11;

LABEL_6:
    id v7 = v13;
  }
}

- (void)_toggleUnlockMode
{
  unint64_t unlockMode = self->_unlockMode;
  if (unlockMode <= 3) {
    [(SBLockElementViewProvider *)self _setUnlockMode:qword_1D8FD0778[unlockMode]];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  [WeakRetained preferredLayoutModeDidInvalidateForLayoutSpecifier:self];
}

- (unint64_t)_unlockMode
{
  return self->_unlockMode;
}

- (void)_setUnlockMode:(unint64_t)a3
{
  if (self->_unlockMode != a3)
  {
    self->_unint64_t unlockMode = a3;
    [(SBLockElementViewProvider *)self _updateTrailingGlyph];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    [WeakRetained preferredLayoutModeDidInvalidateForLayoutSpecifier:self];
  }
}

- (void)_updateTrailingGlyph
{
  switch([(SBLockElementViewProvider *)self _unlockMode])
  {
    case 0uLL:
    case 2uLL:
      if (![(SBLockElementViewProvider *)self _activelyWantsMatching]) {
        goto LABEL_5;
      }
      if (!self->_isAuthenticated)
      {
        p_trailingPackageView = &self->_trailingPackageView;
        double v4 = @"Faceid";
        goto LABEL_8;
      }
      break;
    case 1uLL:
LABEL_5:
      p_trailingPackageView = &self->_trailingPackageView;
      double v4 = @"success";
      goto LABEL_8;
    case 3uLL:
      p_trailingPackageView = &self->_trailingPackageView;
      [(BSUICAPackageView *)*p_trailingPackageView setState:@"Faceid" animated:0];
      double v4 = @"failed";
LABEL_8:
      uint64_t v5 = *p_trailingPackageView;
      [(BSUICAPackageView *)v5 setState:v4 animated:1];
      break;
    default:
      return;
  }
}

- (BOOL)_allowsBiometricUnlock
{
  return [(SBUIBiometricResource *)self->_sharedResource biometricLockoutState] == 0;
}

- (BOOL)_isShowingInLandscape
{
  v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  v13.origin.x = v4;
  v13.origin.y = v6;
  v13.size.width = v8;
  v13.size.CGFloat height = v10;
  double Width = CGRectGetWidth(v13);
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.CGFloat height = v10;
  return Width > CGRectGetHeight(v14);
}

- (id)elementHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementHost);
  return WeakRetained;
}

- (void)setElementHost:(id)a3
{
}

- (int64_t)layoutMode
{
  return self->_layoutMode;
}

- (id)layoutHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  return WeakRetained;
}

- (void)setLayoutHost:(id)a3
{
}

- (SBUISystemApertureContentProvider)contentProvider
{
  return self->_contentProvider;
}

- (void)setContentProvider:(id)a3
{
}

- (SBUISystemApertureCustomContentProvider)lockProvider
{
  return self->_lockProvider;
}

- (void)setLockProvider:(id)a3
{
}

- (SBUISystemApertureCustomContentProvider)trailingPackageProvider
{
  return self->_trailingPackageProvider;
}

- (void)setTrailingPackageProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingPackageProvider, 0);
  objc_storeStrong((id *)&self->_lockProvider, 0);
  objc_storeStrong((id *)&self->_contentProvider, 0);
  objc_destroyWeak((id *)&self->_layoutHost);
  objc_destroyWeak((id *)&self->_elementHost);
  objc_storeStrong((id *)&self->_nonSecureLockContentAssertion, 0);
  objc_storeStrong((id *)&self->_trailingPackageView, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_prominentLock, 0);
  objc_storeStrong((id *)&self->_trailingContainerView, 0);
  objc_storeStrong((id *)&self->_leadingLock, 0);
  objc_storeStrong((id *)&self->_sharedResource, 0);
}

@end