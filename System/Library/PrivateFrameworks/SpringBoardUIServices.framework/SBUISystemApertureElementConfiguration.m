@interface SBUISystemApertureElementConfiguration
- (BOOL)SBUISA_attachedMinimalViewRequiresZeroPadding;
- (BOOL)_elementRequiresConstraintBasedLayout;
- (BOOL)_elementSupportsDynamicResizing;
- (BOOL)attachedMinimalViewRequiresZeroPadding;
- (BOOL)hasMenuPresentation;
- (BOOL)prefersFixedPortraitOrientation;
- (BOOL)preventsAutomaticDismissal;
- (BOOL)preventsInteractiveDismissal;
- (BOOL)shouldDeferViewSizingPreferenceUpdates;
- (BSAction)launchAction;
- (BSMutableSettings)_storage;
- (BSSettings)otherSceneClientSettingsRepresentation;
- (CGSize)maximumAccessoryViewSizeForLayoutMode:(int64_t)a3;
- (CGSize)preferredContentSizeClampedToMaximumExpandedSize;
- (CGSize)preferredCustomAspectRatio;
- (NSDirectionalEdgeInsets)preferredOutsetsFromUnsafeArea;
- (NSSet)backgroundActivitiesToSuppress;
- (NSString)associatedAppBundleIdentifier;
- (NSString)associatedScenePersistenceIdentifier;
- (NSString)elementIdentifier;
- (NSURL)launchURL;
- (NSValue)preferredPaddingForCompactLayout;
- (SBUISystemApertureAccessoryView)detachedMinimalView;
- (SBUISystemApertureAccessoryView)leadingView;
- (SBUISystemApertureAccessoryView)minimalView;
- (SBUISystemApertureAccessoryView)trailingView;
- (SBUISystemApertureElement)elementViewController;
- (UIColor)keyColor;
- (UIViewController)containerViewController;
- (double)preferredHeightForBottomSafeArea;
- (int64_t)activeLayoutMode;
- (int64_t)appliedLayoutMode;
- (int64_t)contentRole;
- (int64_t)maximumLayoutMode;
- (int64_t)minimumLayoutMode;
- (int64_t)preferredCustomLayout;
- (int64_t)preferredLayoutMode;
- (unint64_t)presentationBehaviors;
- (void)_invalidateOtherSceneClientSettingsRepresentation;
- (void)_updateStorageForViewProperties;
- (void)_updateStorageForViewPropertiesIfNeeded;
- (void)setActiveLayoutMode:(int64_t)a3;
- (void)setAppliedLayoutMode:(int64_t)a3;
- (void)setAssociatedAppBundleIdentifier:(id)a3;
- (void)setAssociatedScenePersistenceIdentifier:(id)a3;
- (void)setAttachedMinimalViewRequiresZeroPadding:(BOOL)a3;
- (void)setBackgroundActivitiesToSuppress:(id)a3;
- (void)setContainerViewController:(id)a3;
- (void)setContentRole:(int64_t)a3;
- (void)setDetachedMinimalView:(id)a3;
- (void)setElementIdentifier:(id)a3;
- (void)setElementViewController:(id)a3;
- (void)setHasMenuPresentation:(BOOL)a3;
- (void)setKeyColor:(id)a3;
- (void)setLaunchAction:(id)a3;
- (void)setLaunchURL:(id)a3;
- (void)setLeadingView:(id)a3;
- (void)setMaximumLayoutMode:(int64_t)a3;
- (void)setMinimalView:(id)a3;
- (void)setMinimumLayoutMode:(int64_t)a3;
- (void)setPreferredCustomAspectRatio:(CGSize)a3;
- (void)setPreferredCustomLayout:(int64_t)a3;
- (void)setPreferredHeightForBottomSafeArea:(double)a3;
- (void)setPreferredLayoutMode:(int64_t)a3;
- (void)setPreferredOutsetsFromUnsafeArea:(NSDirectionalEdgeInsets)a3;
- (void)setPreferredOutsetsfromUnsafeArea:(NSDirectionalEdgeInsets)a3;
- (void)setPreferredPaddingForCompactLayout:(id)a3;
- (void)setPrefersFixedPortraitOrientation:(BOOL)a3;
- (void)setPresentationBehaviors:(unint64_t)a3;
- (void)setPreventsAutomaticDismissal:(BOOL)a3;
- (void)setPreventsInteractiveDismissal:(BOOL)a3;
- (void)setShouldDeferViewSizingPreferenceUpdates:(BOOL)a3;
- (void)setTrailingView:(id)a3;
- (void)validateConfiguration;
@end

@implementation SBUISystemApertureElementConfiguration

- (NSString)elementIdentifier
{
  v2 = [(SBUISystemApertureElementConfiguration *)self _storage];
  v3 = objc_msgSend(v2, "SBUISA_stringforSetting:", 3213043);

  return (NSString *)v3;
}

- (int64_t)contentRole
{
  v2 = [(SBUISystemApertureElementConfiguration *)self _storage];
  int64_t v3 = objc_msgSend(v2, "SBUISA_contentRoleforSetting:", 3213018);

  return v3;
}

- (int64_t)preferredLayoutMode
{
  v2 = [(SBUISystemApertureElementConfiguration *)self _storage];
  int64_t v3 = objc_msgSend(v2, "SBUISA_layoutModeforSetting:", 3213019);

  return v3;
}

- (int64_t)minimumLayoutMode
{
  v2 = [(SBUISystemApertureElementConfiguration *)self _storage];
  int64_t v3 = objc_msgSend(v2, "SBUISA_layoutModeforSetting:", 3213020);

  return v3;
}

- (int64_t)maximumLayoutMode
{
  v2 = [(SBUISystemApertureElementConfiguration *)self _storage];
  int64_t v3 = objc_msgSend(v2, "SBUISA_layoutModeforSetting:", 3213021);

  return v3;
}

- (int64_t)appliedLayoutMode
{
  v2 = [(SBUISystemApertureElementConfiguration *)self _storage];
  int64_t v3 = objc_msgSend(v2, "SBUISA_layoutModeforSetting:", 3213022);

  return v3;
}

- (NSDirectionalEdgeInsets)preferredOutsetsFromUnsafeArea
{
  v2 = [(SBUISystemApertureElementConfiguration *)self _storage];
  objc_msgSend(v2, "SBUISA_directionalEdgeInsetsforSetting:", 3213033);
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.trailing = v14;
  result.bottom = v13;
  result.leading = v12;
  result.top = v11;
  return result;
}

- (NSValue)preferredPaddingForCompactLayout
{
  v2 = [(SBUISystemApertureElementConfiguration *)self _storage];
  double v3 = [v2 objectForSetting:3213040];

  return (NSValue *)v3;
}

- (BOOL)SBUISA_attachedMinimalViewRequiresZeroPadding
{
  v2 = [(SBUISystemApertureElementConfiguration *)self _storage];
  double v3 = [v2 objectForSetting:3213041];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (double)preferredHeightForBottomSafeArea
{
  [(SBUISystemApertureElementConfiguration *)self preferredOutsetsFromUnsafeArea];
  return -v2;
}

- (NSString)associatedScenePersistenceIdentifier
{
  double v2 = [(SBUISystemApertureElementConfiguration *)self _storage];
  double v3 = objc_msgSend(v2, "SBUISA_stringforSetting:", 3213023);

  return (NSString *)v3;
}

- (NSString)associatedAppBundleIdentifier
{
  double v2 = [(SBUISystemApertureElementConfiguration *)self _storage];
  double v3 = objc_msgSend(v2, "SBUISA_stringforSetting:", 3213037);

  return (NSString *)v3;
}

- (NSURL)launchURL
{
  double v2 = [(SBUISystemApertureElementConfiguration *)self _storage];
  double v3 = objc_msgSend(v2, "SBUISA_URLforSetting:", 3213051);

  return (NSURL *)v3;
}

- (BSAction)launchAction
{
  double v2 = [(SBUISystemApertureElementConfiguration *)self _storage];
  double v3 = objc_msgSend(v2, "SBUISA_BSActionforSetting:", 3213052);

  return (BSAction *)v3;
}

- (NSSet)backgroundActivitiesToSuppress
{
  double v2 = [(SBUISystemApertureElementConfiguration *)self _storage];
  double v3 = objc_msgSend(v2, "SBUISA_backgroundActivityIdentifiersForSetting:", 3213034);

  return (NSSet *)v3;
}

- (CGSize)preferredCustomAspectRatio
{
  double v2 = [(SBUISystemApertureElementConfiguration *)self _storage];
  objc_msgSend(v2, "SBUISA_CGSizeforSetting:", 3213035);
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (int64_t)preferredCustomLayout
{
  double v2 = [(SBUISystemApertureElementConfiguration *)self _storage];
  int64_t v3 = objc_msgSend(v2, "SBUISA_customLayoutModeforSetting:", 3213036);

  return v3;
}

- (BOOL)hasMenuPresentation
{
  double v2 = [(SBUISystemApertureElementConfiguration *)self _storage];
  int64_t v3 = [v2 objectForSetting:3213038];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setElementIdentifier:(id)a3
{
  id v7 = a3;
  char v4 = [(SBUISystemApertureElementConfiguration *)self elementIdentifier];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    double v6 = [(SBUISystemApertureElementConfiguration *)self _storage];
    objc_msgSend(v6, "SBUISA_setString:forSetting:", v7, 3213043);

    [(SBUISystemApertureElementConfiguration *)self _invalidateOtherSceneClientSettingsRepresentation];
  }
}

- (BOOL)preventsInteractiveDismissal
{
  double v2 = [(SBUISystemApertureElementConfiguration *)self _storage];
  int64_t v3 = [v2 objectForSetting:3213048];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)preventsAutomaticDismissal
{
  double v2 = [(SBUISystemApertureElementConfiguration *)self _storage];
  int64_t v3 = [v2 objectForSetting:3213049];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (UIColor)keyColor
{
  double v2 = [(SBUISystemApertureElementConfiguration *)self _storage];
  int64_t v3 = objc_msgSend(v2, "SBUISA_UIColorForSetting:", 3213050);

  return (UIColor *)v3;
}

- (unint64_t)presentationBehaviors
{
  double v2 = [(SBUISystemApertureElementConfiguration *)self _storage];
  unint64_t v3 = objc_msgSend(v2, "SBUISA_presentationBehaviorsForSetting:", 3213039);

  return v3;
}

- (BOOL)attachedMinimalViewRequiresZeroPadding
{
  double v2 = [(SBUISystemApertureElementConfiguration *)self _storage];
  char v3 = [v2 BOOLForSetting:3213041];

  return v3;
}

- (BOOL)prefersFixedPortraitOrientation
{
  double v2 = [(SBUISystemApertureElementConfiguration *)self _storage];
  char v3 = [v2 BOOLForSetting:3213042];

  return v3;
}

- (void)setContentRole:(int64_t)a3
{
  if ([(SBUISystemApertureElementConfiguration *)self contentRole] != a3)
  {
    char v5 = [(SBUISystemApertureElementConfiguration *)self _storage];
    objc_msgSend(v5, "SBUISA_setContentRole:forSetting:", a3, 3213018);

    [(SBUISystemApertureElementConfiguration *)self _invalidateOtherSceneClientSettingsRepresentation];
  }
}

- (void)setPreferredLayoutMode:(int64_t)a3
{
  if ([(SBUISystemApertureElementConfiguration *)self preferredLayoutMode] != a3)
  {
    char v5 = [(SBUISystemApertureElementConfiguration *)self _storage];
    objc_msgSend(v5, "SBUISA_setLayoutMode:forSetting:", a3, 3213019);

    [(SBUISystemApertureElementConfiguration *)self _invalidateOtherSceneClientSettingsRepresentation];
  }
}

- (void)setMinimumLayoutMode:(int64_t)a3
{
  if ([(SBUISystemApertureElementConfiguration *)self minimumLayoutMode] != a3)
  {
    char v5 = [(SBUISystemApertureElementConfiguration *)self _storage];
    objc_msgSend(v5, "SBUISA_setLayoutMode:forSetting:", a3, 3213020);

    [(SBUISystemApertureElementConfiguration *)self _invalidateOtherSceneClientSettingsRepresentation];
  }
}

- (void)setMaximumLayoutMode:(int64_t)a3
{
  if ([(SBUISystemApertureElementConfiguration *)self maximumLayoutMode] != a3)
  {
    char v5 = [(SBUISystemApertureElementConfiguration *)self _storage];
    objc_msgSend(v5, "SBUISA_setLayoutMode:forSetting:", a3, 3213021);

    [(SBUISystemApertureElementConfiguration *)self _invalidateOtherSceneClientSettingsRepresentation];
  }
}

- (void)setAppliedLayoutMode:(int64_t)a3
{
  if ([(SBUISystemApertureElementConfiguration *)self appliedLayoutMode] != a3)
  {
    char v5 = [(SBUISystemApertureElementConfiguration *)self _storage];
    objc_msgSend(v5, "SBUISA_setLayoutMode:forSetting:", a3, 3213022);

    [(SBUISystemApertureElementConfiguration *)self _invalidateOtherSceneClientSettingsRepresentation];
  }
}

- (void)setPreferredHeightForBottomSafeArea:(double)a3
{
  [(SBUISystemApertureElementConfiguration *)self preferredHeightForBottomSafeArea];
  if (v5 != a3)
  {
    -[SBUISystemApertureElementConfiguration setPreferredOutsetsfromUnsafeArea:](self, "setPreferredOutsetsfromUnsafeArea:", 0.0, -1000.0, -a3, -1000.0);
  }
}

- (void)setPreferredOutsetsfromUnsafeArea:(NSDirectionalEdgeInsets)a3
{
  double trailing = a3.trailing;
  double bottom = a3.bottom;
  double leading = a3.leading;
  double top = a3.top;
  [(SBUISystemApertureElementConfiguration *)self preferredOutsetsFromUnsafeArea];
  if (leading != v11 || top != v8 || trailing != v10 || bottom != v9)
  {
    v15 = [(SBUISystemApertureElementConfiguration *)self _storage];
    objc_msgSend(v15, "SBUISA_setDirectionalEdgeInsets:forSetting:", 3213033, top, leading, bottom, trailing);

    [(SBUISystemApertureElementConfiguration *)self _invalidateOtherSceneClientSettingsRepresentation];
  }
}

- (void)setPreferredPaddingForCompactLayout:(id)a3
{
  id v7 = a3;
  char v4 = [(SBUISystemApertureElementConfiguration *)self preferredPaddingForCompactLayout];
  [v7 directionalEdgeInsetsValue];
  [v4 directionalEdgeInsetsValue];
  if (!BSFloatApproximatelyEqualToFloat()
    || (int v5 = BSFloatApproximatelyEqualToFloat(), (v7 == 0) ^ (v4 == 0))
    || !v5)
  {
    double v6 = [(SBUISystemApertureElementConfiguration *)self _storage];
    [v6 setObject:v7 forSetting:3213040];

    [(SBUISystemApertureElementConfiguration *)self _invalidateOtherSceneClientSettingsRepresentation];
  }
}

- (void)setAttachedMinimalViewRequiresZeroPadding:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBUISystemApertureElementConfiguration *)self attachedMinimalViewRequiresZeroPadding] != a3)
  {
    int v5 = [(SBUISystemApertureElementConfiguration *)self _storage];
    double v6 = [NSNumber numberWithBool:v3];
    [v5 setObject:v6 forSetting:3213041];

    [(SBUISystemApertureElementConfiguration *)self _invalidateOtherSceneClientSettingsRepresentation];
  }
}

- (void)setPrefersFixedPortraitOrientation:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBUISystemApertureElementConfiguration *)self prefersFixedPortraitOrientation] != a3)
  {
    int v5 = [(SBUISystemApertureElementConfiguration *)self _storage];
    double v6 = [NSNumber numberWithBool:v3];
    [v5 setObject:v6 forSetting:3213042];

    [(SBUISystemApertureElementConfiguration *)self _invalidateOtherSceneClientSettingsRepresentation];
  }
}

- (void)setAssociatedScenePersistenceIdentifier:(id)a3
{
  id v7 = a3;
  char v4 = [(SBUISystemApertureElementConfiguration *)self associatedScenePersistenceIdentifier];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    double v6 = [(SBUISystemApertureElementConfiguration *)self _storage];
    objc_msgSend(v6, "SBUISA_setString:forSetting:", v7, 3213023);

    [(SBUISystemApertureElementConfiguration *)self _invalidateOtherSceneClientSettingsRepresentation];
  }
}

- (void)setAssociatedAppBundleIdentifier:(id)a3
{
  id v7 = a3;
  char v4 = [(SBUISystemApertureElementConfiguration *)self associatedAppBundleIdentifier];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    double v6 = [(SBUISystemApertureElementConfiguration *)self _storage];
    objc_msgSend(v6, "SBUISA_setString:forSetting:", v7, 3213037);

    [(SBUISystemApertureElementConfiguration *)self _invalidateOtherSceneClientSettingsRepresentation];
  }
}

- (void)setLaunchURL:(id)a3
{
  id v7 = a3;
  char v4 = [(SBUISystemApertureElementConfiguration *)self launchURL];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    double v6 = [(SBUISystemApertureElementConfiguration *)self _storage];
    objc_msgSend(v6, "SBUISA_setURL:forSetting:", v7, 3213051);

    [(SBUISystemApertureElementConfiguration *)self _invalidateOtherSceneClientSettingsRepresentation];
  }
}

- (void)setLaunchAction:(id)a3
{
  id v7 = a3;
  char v4 = [(SBUISystemApertureElementConfiguration *)self launchAction];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    double v6 = [(SBUISystemApertureElementConfiguration *)self _storage];
    objc_msgSend(v6, "SBUISA_setBSAction:forSetting:", v7, 3213052);

    [(SBUISystemApertureElementConfiguration *)self _invalidateOtherSceneClientSettingsRepresentation];
  }
}

- (void)setBackgroundActivitiesToSuppress:(id)a3
{
  id v7 = a3;
  char v4 = [(SBUISystemApertureElementConfiguration *)self backgroundActivitiesToSuppress];
  char v5 = BSEqualSets();

  if ((v5 & 1) == 0)
  {
    double v6 = [(SBUISystemApertureElementConfiguration *)self _storage];
    objc_msgSend(v6, "SBUISA_setBackgroundActivityIdentifiers:forSetting:", v7, 3213034);

    [(SBUISystemApertureElementConfiguration *)self _invalidateOtherSceneClientSettingsRepresentation];
  }
}

- (void)setPreferredCustomAspectRatio:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(SBUISystemApertureElementConfiguration *)self preferredCustomAspectRatio];
  if (width != v7 || height != v6)
  {
    double v9 = [(SBUISystemApertureElementConfiguration *)self _storage];
    objc_msgSend(v9, "SBUISA_setCGSize:forSetting:", 3213035, width, height);

    [(SBUISystemApertureElementConfiguration *)self _invalidateOtherSceneClientSettingsRepresentation];
  }
}

- (void)setPreferredCustomLayout:(int64_t)a3
{
  if ([(SBUISystemApertureElementConfiguration *)self preferredCustomLayout] != a3)
  {
    char v5 = [(SBUISystemApertureElementConfiguration *)self _storage];
    objc_msgSend(v5, "SBUISA_setCustomLayout:forSetting:", a3, 3213036);

    [(SBUISystemApertureElementConfiguration *)self _invalidateOtherSceneClientSettingsRepresentation];
  }
}

- (void)setHasMenuPresentation:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBUISystemApertureElementConfiguration *)self hasMenuPresentation] != a3)
  {
    char v5 = [(SBUISystemApertureElementConfiguration *)self _storage];
    double v6 = [NSNumber numberWithBool:v3];
    [v5 setObject:v6 forSetting:3213038];

    [(SBUISystemApertureElementConfiguration *)self _invalidateOtherSceneClientSettingsRepresentation];
  }
}

- (void)setPresentationBehaviors:(unint64_t)a3
{
  char v5 = [(SBUISystemApertureElementConfiguration *)self _storage];
  uint64_t v6 = objc_msgSend(v5, "SBUISA_presentationBehaviorsForSetting:", 3213039);

  if (v6 != a3)
  {
    double v7 = [(SBUISystemApertureElementConfiguration *)self _storage];
    double v8 = [NSNumber numberWithUnsignedInteger:a3];
    [v7 setObject:v8 forSetting:3213039];

    [(SBUISystemApertureElementConfiguration *)self _invalidateOtherSceneClientSettingsRepresentation];
  }
}

- (void)setPreventsInteractiveDismissal:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBUISystemApertureElementConfiguration *)self preventsInteractiveDismissal] != a3)
  {
    char v5 = [(SBUISystemApertureElementConfiguration *)self _storage];
    uint64_t v6 = [NSNumber numberWithBool:v3];
    [v5 setObject:v6 forSetting:3213048];

    [(SBUISystemApertureElementConfiguration *)self _invalidateOtherSceneClientSettingsRepresentation];
  }
}

- (void)setPreventsAutomaticDismissal:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBUISystemApertureElementConfiguration *)self preventsAutomaticDismissal] != a3)
  {
    char v5 = [(SBUISystemApertureElementConfiguration *)self _storage];
    uint64_t v6 = [NSNumber numberWithBool:v3];
    [v5 setObject:v6 forSetting:3213049];

    [(SBUISystemApertureElementConfiguration *)self _invalidateOtherSceneClientSettingsRepresentation];
  }
}

- (void)setKeyColor:(id)a3
{
  id v7 = a3;
  char v4 = [(SBUISystemApertureElementConfiguration *)self keyColor];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = [(SBUISystemApertureElementConfiguration *)self _storage];
    objc_msgSend(v6, "SBUISA_setUIColor:forSetting:", v7, 3213050);

    [(SBUISystemApertureElementConfiguration *)self _invalidateOtherSceneClientSettingsRepresentation];
  }
}

- (BSMutableSettings)_storage
{
  storage = self->__storage;
  if (!storage)
  {
    char v4 = (BSMutableSettings *)objc_alloc_init(MEMORY[0x1E4F4F7A0]);
    char v5 = self->__storage;
    self->__storage = v4;

    storage = self->__storage;
  }
  return storage;
}

- (BSSettings)otherSceneClientSettingsRepresentation
{
  [(SBUISystemApertureElementConfiguration *)self _updateStorageForViewPropertiesIfNeeded];
  otherSceneClientSettingsRepresentation = self->_otherSceneClientSettingsRepresentation;
  if (!otherSceneClientSettingsRepresentation)
  {
    char v4 = [(SBUISystemApertureElementConfiguration *)self _storage];
    char v5 = (BSSettings *)[v4 copy];
    uint64_t v6 = self->_otherSceneClientSettingsRepresentation;
    self->_otherSceneClientSettingsRepresentation = v5;

    otherSceneClientSettingsRepresentation = self->_otherSceneClientSettingsRepresentation;
  }
  return otherSceneClientSettingsRepresentation;
}

- (BOOL)_elementRequiresConstraintBasedLayout
{
  BOOL v3 = [(SBUISystemApertureElementConfiguration *)self _strongElementViewController];
  if ([v3 isViewLoaded])
  {
    char v4 = [(SBUISystemApertureElementConfiguration *)self _strongElementViewController];
    char v5 = [v4 viewIfLoaded];
    int v6 = [v5 translatesAutoresizingMaskIntoConstraints] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)_elementSupportsDynamicResizing
{
  double v2 = [(SBUISystemApertureElementConfiguration *)self _strongElementViewController];
  char v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (void)setShouldDeferViewSizingPreferenceUpdates:(BOOL)a3
{
  if (self->_shouldDeferViewSizingPreferenceUpdates != a3) {
    self->_shouldDeferViewSizingPreferenceUpdates = a3;
  }
}

- (CGSize)maximumAccessoryViewSizeForLayoutMode:(int64_t)a3
{
  char v4 = [(SBUISystemApertureElementConfiguration *)self containerViewController];
  char v5 = [v4 view];

  if (a3 == 2)
  {
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    double v10 = +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay];
    [v10 maximumLeadingTrailingViewSize];
    double v7 = v11;
    double v9 = v12;
  }
  double v13 = v7;
  double v14 = v9;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (void)_updateStorageForViewPropertiesIfNeeded
{
  if (![(SBUISystemApertureElementConfiguration *)self shouldDeferViewSizingPreferenceUpdates])
  {
    [(SBUISystemApertureElementConfiguration *)self _updateStorageForViewProperties];
  }
}

- (void)_updateStorageForViewProperties
{
  char v4 = [(SBUISystemApertureElementConfiguration *)self _storage];
  v109[0] = MEMORY[0x1E4F143A8];
  v109[1] = 3221225472;
  v109[2] = __73__SBUISystemApertureElementConfiguration__updateStorageForViewProperties__block_invoke;
  v109[3] = &unk_1E5CCE120;
  v109[4] = self;
  id v5 = v4;
  id v110 = v5;
  SEL v111 = a2;
  double v6 = (void (**)(void, void, void, void, void, void))MEMORY[0x1AD0CF1C0](v109);
  double v7 = [(SBUISystemApertureElementConfiguration *)self minimalView];
  ((void (**)(void, void *, uint64_t, uint64_t, uint64_t, uint64_t))v6)[2](v6, v7, 2, 3213031, 3213026, 3213046);

  double v8 = [(SBUISystemApertureElementConfiguration *)self detachedMinimalView];
  ((void (**)(void, void *, uint64_t, uint64_t, uint64_t, uint64_t))v6)[2](v6, v8, 2, 3213032, 3213027, 3213047);

  double v9 = [(SBUISystemApertureElementConfiguration *)self trailingView];
  ((void (**)(void, void *, uint64_t, uint64_t, uint64_t, uint64_t))v6)[2](v6, v9, 3, 3213030, 3213025, 3213045);

  double v10 = [(SBUISystemApertureElementConfiguration *)self leadingView];
  ((void (**)(void, void *, uint64_t, uint64_t, uint64_t, uint64_t))v6)[2](v6, v10, 3, 3213029, 3213024, 3213044);

  double v11 = [(SBUISystemApertureElementConfiguration *)self _strongElementViewController];
  double v12 = [v11 view];
  double v13 = [v12 layer];
  double v14 = CALayerGetContext();

  uint64_t v15 = [v14 contextId];
  if (objc_msgSend(v5, "SBUISA_contextIdforSetting:", 3213028) != v15)
  {
    objc_msgSend(v5, "SBUISA_setContextId:forSetting:", v15, 3213028);
    [(SBUISystemApertureElementConfiguration *)self _invalidateOtherSceneClientSettingsRepresentation];
  }
  if (![(SBUISystemApertureElementConfiguration *)self _elementSupportsDynamicResizing])
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v101 = [MEMORY[0x1E4F28B00] currentHandler];
      [v101 handleFailureInMethod:a2 object:self file:@"SBUISystemApertureElementConfiguration.m" lineNumber:482 description:@"Elements that don't support dynamic layout must implement -[SBUISystemApertureElement preferredHeightForBottomSafeArea]"];
    }
    [v11 preferredHeightForBottomSafeArea];
    -[SBUISystemApertureElementConfiguration setPreferredHeightForBottomSafeArea:](self, "setPreferredHeightForBottomSafeArea:");
    v18 = (void *)MEMORY[0x1E4F29238];
    v107[0] = *MEMORY[0x1E4F43ED8];
    v107[1] = v107[0];
    v107[2] = v107[0];
    v107[3] = v107[0];
    v19 = v107;
    goto LABEL_33;
  }
  if ([v11 activeLayoutMode] == 4)
  {
    v16 = [v11 view];
    char v17 = [v16 translatesAutoresizingMaskIntoConstraints];

    if (v17)
    {
      [(SBUISystemApertureElementConfiguration *)self preferredContentSizeClampedToMaximumExpandedSize];
      goto LABEL_19;
    }
    v26 = [v11 view];
    [v26 frame];
LABEL_18:

    goto LABEL_19;
  }
  [(SBUISystemApertureElementConfiguration *)self preferredOutsetsFromUnsafeArea];
  if (*(double *)(MEMORY[0x1E4F424F0] + 8) != v23
    || *MEMORY[0x1E4F424F0] != v20
    || *(double *)(MEMORY[0x1E4F424F0] + 24) != v22
    || *(double *)(MEMORY[0x1E4F424F0] + 16) != v21)
  {
    goto LABEL_22;
  }
  [(SBUISystemApertureElementConfiguration *)self preferredContentSizeClampedToMaximumExpandedSize];
  if (v25 == *MEMORY[0x1E4F1DB30] && v24 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v26 = +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay];
    [v26 minimumExpandedSize];
    goto LABEL_18;
  }
LABEL_19:
  v27 = [v11 view];
  v28 = objc_msgSend(v27, "SBUISA_systemApertureObstructedAreaLayoutGuide");
  [v28 layoutFrame];
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  CGFloat v36 = v35;

  v37 = [v11 view];
  v38 = objc_msgSend(v37, "SBUISA_systemApertureObstructedAreaLayoutGuide");
  [v38 layoutFrame];
  UIRoundToScale();

  v112.origin.x = v30;
  v112.origin.y = v32;
  v112.size.double width = v34;
  v112.size.double height = v36;
  CGRectGetHeight(v112);
  UIRoundToScale();
  if ([(SBUISystemApertureElementConfiguration *)self preferredCustomLayout] == 4) {
    UIRoundToScale();
  }
  UIRoundToScale();
  double v40 = v39;
  UIRoundToScale();
  double v42 = v41;
  UIRoundToScale();
  double v44 = v43;
  UIRoundToScale();
  -[SBUISystemApertureElementConfiguration setPreferredOutsetsfromUnsafeArea:](self, "setPreferredOutsetsfromUnsafeArea:", v40, v42, v44, v45);
LABEL_22:
  if ([v11 activeLayoutMode] == 3)
  {
    v46 = [(SBUISystemApertureElementConfiguration *)self leadingView];
    v47 = [(SBUISystemApertureElementConfiguration *)self leadingView];
    [v47 bounds];
    double v49 = v48;
    double v51 = v50;
    double v53 = v52;
    double v55 = v54;
    v56 = [v11 view];
    objc_msgSend(v46, "convertRect:toView:", v56, v49, v51, v53, v55);
    CGFloat v58 = v57;
    CGFloat v60 = v59;
    CGFloat recta = v61;
    CGFloat v63 = v62;

    v64 = [(SBUISystemApertureElementConfiguration *)self trailingView];
    v65 = [(SBUISystemApertureElementConfiguration *)self trailingView];
    [v65 bounds];
    double v67 = v66;
    double v69 = v68;
    double v71 = v70;
    double v73 = v72;
    v74 = [v11 view];
    objc_msgSend(v64, "convertRect:toView:", v74, v67, v69, v71, v73);
    CGFloat v76 = v75;
    CGFloat v78 = v77;
    CGFloat v80 = v79;
    CGFloat v82 = v81;

    v83 = +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay];
    [v83 maximumLeadingTrailingViewSize];
    double v85 = v84;

    CGFloat v103 = v60;
    CGFloat v104 = v58;
    v113.origin.x = v58;
    v113.origin.y = v60;
    CGFloat v86 = v78;
    v113.size.double width = recta;
    CGFloat rect = v63;
    v113.size.double height = v63;
    double Width = CGRectGetWidth(v113);
    if (Width <= v85) {
      CGFloat v88 = Width;
    }
    else {
      CGFloat v88 = v85;
    }
    v114.origin.x = v76;
    v114.origin.y = v78;
    v114.size.double width = v80;
    v114.size.double height = v82;
    double v89 = CGRectGetWidth(v114);
    if (v89 <= v85) {
      CGFloat v90 = v89;
    }
    else {
      CGFloat v90 = v85;
    }
    v91 = [v11 view];
    uint64_t v92 = [v91 effectiveUserInterfaceLayoutDirection];

    if (v92)
    {
      v93 = [v11 view];
      [v93 bounds];
      double MaxX = CGRectGetMaxX(v115);
      v116.origin.y = v103;
      v116.origin.x = v104;
      v116.size.double width = v88;
      v116.size.double height = rect;
      double v102 = MaxX - CGRectGetMaxX(v116);

      v117.origin.x = v76;
      v117.origin.y = v78;
      v117.size.double width = v90;
      v117.size.double height = v82;
      double MinX = CGRectGetMinX(v117);
    }
    else
    {
      v118.origin.y = v103;
      v118.origin.x = v104;
      v118.size.double width = v88;
      v118.size.double height = rect;
      double v102 = CGRectGetMinX(v118);
      v96 = [v11 view];
      [v96 bounds];
      double v97 = CGRectGetMaxX(v119);
      v120.origin.x = v76;
      v120.origin.y = v86;
      v120.size.double width = v90;
      v120.size.double height = v82;
      double MinX = v97 - CGRectGetMaxX(v120);
    }
    v121.origin.y = v103;
    v121.origin.x = v104;
    v121.size.double width = v88;
    v121.size.double height = rect;
    double v98 = fmax(v85 - CGRectGetWidth(v121), 0.0);
    v122.origin.x = v76;
    v122.origin.y = v86;
    v122.size.double width = v90;
    v122.size.double height = v82;
    CGFloat v99 = CGRectGetWidth(v122);
    v18 = (void *)MEMORY[0x1E4F29238];
    v108[0] = 0;
    v108[1] = fmax(fmin(v102, v98), 0.0);
    v108[2] = 0;
    v108[3] = fmax(fmin(MinX, fmax(v85 - v99, 0.0)), 0.0);
    v19 = v108;
LABEL_33:
    v100 = [v18 valueWithBytes:v19 objCType:"{NSDirectionalEdgeInsets=dddd}"];
    [(SBUISystemApertureElementConfiguration *)self setPreferredPaddingForCompactLayout:v100];
  }
}

void __73__SBUISystemApertureElementConfiguration__updateStorageForViewProperties__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  id v52 = a2;
  int v11 = [*(id *)(a1 + 32) _elementSupportsDynamicResizing];
  double v12 = [*(id *)(a1 + 32) _strongElementViewController];
  uint64_t v13 = [v12 activeLayoutMode];

  objc_msgSend(*(id *)(a1 + 40), "SBUISA_CGSizeforSetting:", a5);
  double v16 = *MEMORY[0x1E4F1DB30];
  double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  BOOL v18 = v15 == v17 && *MEMORY[0x1E4F1DB30] == v14;
  BOOL v19 = v13 == a3 || v18;
  if (!v11) {
    BOOL v19 = v52 != 0;
  }
  if (v52) {
    BOOL v20 = v19;
  }
  else {
    BOOL v20 = 0;
  }
  double v21 = [v52 layer];
  uint64_t RenderId = CALayerGetRenderId();

  if (RenderId != objc_msgSend(*(id *)(a1 + 40), "SBUISA_renderingIdforSetting:", a4))
  {
    objc_msgSend(*(id *)(a1 + 40), "SBUISA_setRenderingid:forSetting:", RenderId, a4);
    [*(id *)(a1 + 32) _invalidateOtherSceneClientSettingsRepresentation];
  }
  if (v20)
  {
    objc_msgSend(*(id *)(a1 + 40), "SBUISA_CGSizeforSetting:", a5);
    double v24 = v23;
    double v26 = v25;
    [*(id *)(a1 + 32) maximumAccessoryViewSizeForLayoutMode:a3];
    double v28 = v27;
    double v30 = v29;
    if ([*(id *)(a1 + 32) _elementSupportsDynamicResizing])
    {
      if (![v52 translatesAutoresizingMaskIntoConstraints])
      {
        double v43 = [*(id *)(a1 + 32) _strongElementViewController];
        uint64_t v44 = [v43 activeLayoutMode];

        if (v44 == a3)
        {
          [v52 frame];
          double v24 = v45;
          double v26 = v46;
        }
        else if (v18)
        {
          [v52 intrinsicContentSize];
          BOOL v49 = v16 == v47;
          BOOL v50 = v15 == v48;
          if (v49 && v50) {
            double v26 = 1.0;
          }
          else {
            double v26 = v48;
          }
          if (v49 && v50) {
            double v24 = 1.0;
          }
          else {
            double v24 = v47;
          }
        }
        goto LABEL_24;
      }
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        objc_msgSend(v52, "sizeThatFits:", v28, v30);
LABEL_23:
        double v24 = v31;
        double v26 = v32;
LABEL_24:
        if (a5 >> 1 == 1606512)
        {
          if ([*(id *)(a1 + 32) _elementSupportsDynamicResizing]) {
            double v33 = 0.0;
          }
          else {
            double v33 = 8.0;
          }
          objc_msgSend(v52, "SBUISA_maximumAccessoryViewWidth");
          double v35 = v34 - v33;
          if (v35 >= v24) {
            double v35 = v24;
          }
          double v24 = fmax(v35, 0.0);
        }
        objc_msgSend(*(id *)(a1 + 40), "SBUISA_CGSizeforSetting:", a5);
        if (v24 != v37 || v26 != v36)
        {
          objc_msgSend(*(id *)(a1 + 40), "SBUISA_setCGSize:forSetting:", a5, v24, v26);
          [*(id *)(a1 + 32) _invalidateOtherSceneClientSettingsRepresentation];
        }
        goto LABEL_34;
      }
    }
    else if ([*(id *)(a1 + 32) minimumLayoutMode] != 4 && (objc_opt_respondsToSelector() & 1) == 0)
    {
      double v51 = [MEMORY[0x1E4F28B00] currentHandler];
      [v51 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"SBUISystemApertureElementConfiguration.m" lineNumber:391 description:@"Elements that don't support dynamic layout must supply accessory views that implement -[SBUISystemApertureAccessoryView sizeThatFits:forLayoutMode:]"];
    }
    objc_msgSend(v52, "sizeThatFits:forLayoutMode:", a3, v28, v30);
    goto LABEL_23;
  }
LABEL_34:
  v38 = [v52 accessibilityLabel];
  double v39 = objc_msgSend(*(id *)(a1 + 40), "SBUISA_stringforSetting:", a6);
  char v40 = BSEqualStrings();

  if ((v40 & 1) == 0)
  {
    double v41 = *(void **)(a1 + 40);
    double v42 = [v52 accessibilityLabel];
    objc_msgSend(v41, "SBUISA_setString:forSetting:", v42, a6);

    [*(id *)(a1 + 32) _invalidateOtherSceneClientSettingsRepresentation];
  }
}

- (void)_invalidateOtherSceneClientSettingsRepresentation
{
  self->_otherSceneClientSettingsRepresentation = 0;
  MEMORY[0x1F41817F8]();
}

- (CGSize)preferredContentSizeClampedToMaximumExpandedSize
{
  double v2 = [(SBUISystemApertureElementConfiguration *)self elementViewController];
  char v3 = +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay];
  [v3 maximumExpandedSize];
  double v5 = v4;
  double v7 = v6;

  [v2 preferredContentSize];
  if (v8 <= v5) {
    double v5 = v8;
  }
  if (v9 <= v7) {
    double v7 = v9;
  }

  double v10 = v5;
  double v11 = v7;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)validateConfiguration
{
  uint64_t v30 = 0;
  double v31 = &v30;
  uint64_t v32 = 0x3032000000;
  double v33 = __Block_byref_object_copy__3;
  double v34 = __Block_byref_object_dispose__3;
  id v35 = 0;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __63__SBUISystemApertureElementConfiguration_validateConfiguration__block_invoke;
  v29[3] = &unk_1E5CCE148;
  v29[4] = &v30;
  double v4 = (void (**)(void, void))MEMORY[0x1AD0CF1C0](v29);
  double v5 = [(SBUISystemApertureElementConfiguration *)self leadingView];

  double v6 = [(SBUISystemApertureElementConfiguration *)self trailingView];

  double v7 = [(SBUISystemApertureElementConfiguration *)self minimalView];

  if (v6) {
    BOOL v8 = v5 != 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v7) {
    BOOL v9 = v8;
  }
  else {
    BOOL v9 = 0;
  }
  if (v5 || v6 || v7)
  {
    if (v9)
    {
      double v10 = [(SBUISystemApertureElementConfiguration *)self leadingView];
      double v11 = [(SBUISystemApertureElementConfiguration *)self trailingView];

      if (v10 != v11) {
        goto LABEL_25;
      }
      double v12 = @"Leading and trailing views must not be identical.";
      goto LABEL_24;
    }
    if (v5 && !v6)
    {
      double v12 = @"If you specify a leading view you must provide a trailing view.";
LABEL_24:
      ((void (**)(void, __CFString *))v4)[2](v4, v12);
      goto LABEL_25;
    }
    if (v6) {
      BOOL v13 = v5 != 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (!v13)
    {
      double v12 = @"If you specify a trailing view you must provide a leading view.";
      goto LABEL_24;
    }
    if (!v7 && [(SBUISystemApertureElementConfiguration *)self minimumLayoutMode] == 2)
    {
      double v12 = @"If you support minimal layout you must provide a minimal view.";
      goto LABEL_24;
    }
  }
LABEL_25:
  if (![(SBUISystemApertureElementConfiguration *)self contentRole]) {
    ((void (**)(void, __CFString *))v4)[2](v4, @"invalid content role");
  }
  int64_t v14 = [(SBUISystemApertureElementConfiguration *)self preferredLayoutMode];
  if (v14 < [(SBUISystemApertureElementConfiguration *)self minimumLayoutMode]
    && [(SBUISystemApertureElementConfiguration *)self preferredLayoutMode] != -1)
  {
    ((void (**)(void, __CFString *))v4)[2](v4, @"preferred layout mode must be greater than or equal to the minimum layout mode");
  }
  int64_t v15 = [(SBUISystemApertureElementConfiguration *)self maximumLayoutMode];
  if (v15 < [(SBUISystemApertureElementConfiguration *)self minimumLayoutMode]) {
    ((void (**)(void, __CFString *))v4)[2](v4, @"maximum layout mode must be greater than or equal to the minimum layout mode");
  }
  int64_t v16 = [(SBUISystemApertureElementConfiguration *)self preferredLayoutMode];
  if (v16 > [(SBUISystemApertureElementConfiguration *)self maximumLayoutMode]) {
    ((void (**)(void, __CFString *))v4)[2](v4, @"preferred layout mode must be less than or equal to the maximum layout mode");
  }
  char v17 = [(SBUISystemApertureElementConfiguration *)self minimumLayoutMode] != 2 || v9;
  if ((v17 & 1) == 0) {
    ((void (**)(void, __CFString *))v4)[2](v4, @"if your minimum layout mode is .minimal, you must specify all accessory views");
  }
  if ([(SBUISystemApertureElementConfiguration *)self minimumLayoutMode] == 3)
  {
    BOOL v18 = [(SBUISystemApertureElementConfiguration *)self leadingView];
    if (!v18
      || ([(SBUISystemApertureElementConfiguration *)self trailingView],
          BOOL v19 = objc_claimAutoreleasedReturnValue(),
          v19,
          v18,
          !v19))
    {
      ((void (**)(void, __CFString *))v4)[2](v4, @"if your minimum layout mode is .compact, you must specify leading and trailing views");
    }
  }
  if ([(SBUISystemApertureElementConfiguration *)self _elementSupportsDynamicResizing])
  {
    BOOL v20 = [(SBUISystemApertureElementConfiguration *)self minimalView];
    double v21 = [(SBUISystemApertureElementConfiguration *)self leadingView];
    if ([v20 isEqual:v21])
    {
    }
    else
    {
      double v22 = [(SBUISystemApertureElementConfiguration *)self minimalView];
      double v23 = [(SBUISystemApertureElementConfiguration *)self trailingView];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_48;
      }
    }
    ((void (**)(void, __CFString *))v4)[2](v4, @"If you support dynamic resizing, you  must also provide a unique minimal view");
  }
LABEL_48:
  if ([(id)v31[5] count])
  {
    double v25 = NSString;
    double v26 = [(id)v31[5] componentsJoinedByString:@" | "];
    double v27 = [v25 stringWithFormat:@"Invalid config: %@ %@", self, v26];

    double v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"SBUISystemApertureElementConfiguration.m" lineNumber:570 description:v27];
  }
  _Block_object_dispose(&v30, 8);
}

void __63__SBUISystemApertureElementConfiguration_validateConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 length])
  {
    char v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v3)
    {
      uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
      double v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;

      char v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v3 addObject:v7];
  }
}

- (int64_t)activeLayoutMode
{
  return self->_activeLayoutMode;
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  self->_activeLayoutMode = a3;
}

- (BOOL)shouldDeferViewSizingPreferenceUpdates
{
  return self->_shouldDeferViewSizingPreferenceUpdates;
}

- (UIViewController)containerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setContainerViewController:(id)a3
{
}

- (SBUISystemApertureElement)elementViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementViewController);
  return (SBUISystemApertureElement *)WeakRetained;
}

- (void)setElementViewController:(id)a3
{
}

- (SBUISystemApertureAccessoryView)leadingView
{
  return self->_leadingView;
}

- (void)setLeadingView:(id)a3
{
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return self->_trailingView;
}

- (void)setTrailingView:(id)a3
{
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return self->_minimalView;
}

- (void)setMinimalView:(id)a3
{
}

- (SBUISystemApertureAccessoryView)detachedMinimalView
{
  return self->_detachedMinimalView;
}

- (void)setDetachedMinimalView:(id)a3
{
}

- (void)setPreferredOutsetsFromUnsafeArea:(NSDirectionalEdgeInsets)a3
{
  self->_preferredOutsetsFromUnsafeArea = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detachedMinimalView, 0);
  objc_storeStrong((id *)&self->_minimalView, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_destroyWeak((id *)&self->_elementViewController);
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_storeStrong((id *)&self->_otherSceneClientSettingsRepresentation, 0);
  objc_storeStrong((id *)&self->__storage, 0);
}

@end