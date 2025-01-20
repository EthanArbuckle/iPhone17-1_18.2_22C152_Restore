@interface SBUISystemApertureElementSource
+ (id)openSources;
+ (id)unassociatedContext;
+ (void)_addSource:(id)a3;
+ (void)_removeSource:(id)a3;
- (BOOL)_elementIsInAWindow;
- (BOOL)_elementRequiresConstraintBasedLayout;
- (BOOL)_elementSupportsDynamicResizing;
- (BOOL)_handleSceneResizeAction:(id)a3;
- (BOOL)_isPresentationPossibleAndSceneForeground;
- (BOOL)_mustHaveUniqueElementIdentity;
- (BOOL)_performElementUpdate;
- (BOOL)_performElementUpdateWithActions:(id)a3;
- (BOOL)_performElementUpdateWithActionsIfPossible:(id)a3;
- (BOOL)_wantsCenteredCustomLayout;
- (BOOL)elementCanRequestAlertingAssertion;
- (BOOL)elementHasMenuPresentation;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isBeingRemoved;
- (BOOL)isFallbackContext;
- (BOOL)isPresentationPossible;
- (BSSettings)lastKnownOtherSettings;
- (CGRect)anchorFrameForDetachedMinimalView;
- (CGRect)anchorFrameForLeadingView;
- (CGRect)anchorFrameForMinimalView;
- (CGRect)anchorFrameForTrailingView;
- (FBSSceneIdentityToken)identityToken;
- (NSArray)_activeConstraintsForLayoutMode;
- (NSHashTable)_observers;
- (NSLayoutConstraint)_maximumLeadingViewWidthConstraint;
- (NSLayoutConstraint)_maximumTrailingViewWidthConstraint;
- (NSMutableArray)alertingAssertionsAwaitingActions;
- (NSMutableArray)transitionContexts;
- (NSSet)openSources;
- (NSString)associatedScenePersistenceIdentifier;
- (NSString)description;
- (SBUIDependencyGestureRecognizer)dependencyGestureRecognizer;
- (SBUISystemApertureAnimationParameters)localSceneResizeParameters;
- (SBUISystemApertureElement)_elementViewController;
- (SBUISystemApertureElementConfiguration)mutableConfiguration;
- (SBUISystemApertureElementProviding)systemApertureElementViewControllerProvider;
- (SBUISystemApertureElementSource)init;
- (SBUISystemApertureElementSource)initWithScene:(id)a3;
- (SBUISystemApertureElementTransitionContext)transitionContext;
- (UIView)containerView;
- (UIView)layoutGuideRootView;
- (UIWindow)systemApertureOwnedWindow;
- (UIWindowScene)windowScene;
- (_SBUISystemApertureAlertingAssertion)_alertingAssertion;
- (_SBUISystemApertureElementSourceAnimationContext)animationContext;
- (id)_FBSScene;
- (id)_constraintsForLayoutMode:(int64_t)a3;
- (id)_elementIdentifierIfExists;
- (id)_sceneSettings;
- (id)_settingsDiffActionsForScene:(id)a3;
- (id)containerViewController;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)requestAlertingAssertion;
- (id)requestAlertingAssertionWithOptions:(unint64_t)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)systemApertureElementViewController;
- (int64_t)layoutMode;
- (int64_t)layoutModeAsFarAsClientsAreConcerned;
- (void)_activateConstraintsForActiveLayoutModeIfNeeded:(int64_t)a3;
- (void)_activateConstraintsForLayoutMode:(int64_t)a3;
- (void)_animateWithSceneResizeAction:(id)a3;
- (void)_ensureAccessoryView:(id)a3 hasLayoutFrame:(CGRect)a4;
- (void)_ensureAccessoryViewLayoutForTransitionWithAnimator:(id)a3;
- (void)_ensureElementViewControllerIsInAWindow;
- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4;
- (void)_handleAlertingAction:(id)a3;
- (void)_handleClientErrorNonUniqueElementAction;
- (void)_handleGestureDependencyChange:(id)a3;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)_sceneWillInvalidate:(id)a3;
- (void)_sendActionForCommand:(int64_t)a3;
- (void)_setAlertingAssertion:(id)a3;
- (void)_setScene:(id)a3;
- (void)_updateElementCanRequestAlertingAssertion;
- (void)_updateTraitCollectionForElementIfNeeded;
- (void)_windowDidAttachToContext:(id)a3;
- (void)addObserver:(id)a3;
- (void)addTransitionContext:(id)a3;
- (void)elementDidDismissMenu;
- (void)elementWillPresentMenu;
- (void)registerWithScene:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removeTransitionContext:(id)a3;
- (void)requestNegativeResponseAnimation;
- (void)requestTransitionToMaximumSupportedLayoutMode;
- (void)requestTransitionToPreferredLayoutMode;
- (void)setDependencyGestureRecognizer:(id)a3;
- (void)setElementCanRequestAlertingAssertion:(BOOL)a3;
- (void)setElementHasMenuPresentation:(BOOL)a3;
- (void)setElementNeedsLayoutUpdateWithOptions:(unint64_t)a3 coordinatedAnimations:(id)a4;
- (void)setElementNeedsUpdate;
- (void)setElementNeedsUpdateWithCoordinatedAnimations:(id)a3;
- (void)setLastKnownOtherSettings:(id)a3;
- (void)setLayoutModeAsFarAsClientsAreConcerned:(int64_t)a3;
- (void)setLocalSceneResizeParameters:(id)a3;
- (void)setPresentationPossible:(BOOL)a3;
- (void)setSystemApertureElementProvider:(id)a3;
- (void)setSystemApertureElementViewControllerProvider:(id)a3;
- (void)setSystemApertureOwnedWindow:(id)a3;
- (void)setWindowScene:(id)a3;
- (void)set_activeConstraintsForLayoutMode:(id)a3;
- (void)set_elementViewController:(id)a3;
- (void)set_maximumLeadingViewWidthConstraint:(id)a3;
- (void)set_maximumTrailingViewWidthConstraint:(id)a3;
- (void)set_observers:(id)a3;
- (void)unregisterFromScene;
- (void)validateConfiguration;
@end

@implementation SBUISystemApertureElementSource

+ (id)unassociatedContext
{
  return +[SBUISystemApertureElementUnassociatedContext unassociatedContext];
}

+ (void)_addSource:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v9 = v3;
    uint64_t v3 = [(id)SBUISystemApertureElementSourceOpenSources containsObject:v3];
    uint64_t v4 = v9;
    if ((v3 & 1) == 0)
    {
      v5 = (void *)SBUISystemApertureElementSourceOpenSources;
      if (!SBUISystemApertureElementSourceOpenSources)
      {
        uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
        v7 = (void *)SBUISystemApertureElementSourceOpenSources;
        SBUISystemApertureElementSourceOpenSources = v6;

        v5 = (void *)SBUISystemApertureElementSourceOpenSources;
      }
      [v5 addObject:v9];
      v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 postNotificationName:@"SBUISystemApertureElementSourceDidConnectNotification" object:v9];

      uint64_t v4 = v9;
    }
  }
  MEMORY[0x1F41817F8](v3, v4);
}

+ (void)_removeSource:(id)a3
{
  id v4 = a3;
  if (v4) {
    [(id)SBUISystemApertureElementSourceOpenSources removeObject:v4];
  }
  if (![(id)SBUISystemApertureElementSourceOpenSources count])
  {
    uint64_t v3 = (void *)SBUISystemApertureElementSourceOpenSources;
    SBUISystemApertureElementSourceOpenSources = 0;
  }
}

+ (id)openSources
{
  return (id)[(id)SBUISystemApertureElementSourceOpenSources setRepresentation];
}

- (void)setLastKnownOtherSettings:(id)a3
{
  id v6 = a3;
  if ((-[BSSettings isEqual:](self->_lastKnownOtherSettings, "isEqual:") & 1) == 0)
  {
    id v4 = (BSSettings *)[v6 copy];
    lastKnownOtherSettings = self->_lastKnownOtherSettings;
    self->_lastKnownOtherSettings = v4;
  }
}

- (SBUISystemApertureElementSource)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBUISystemApertureElementSource;
  v2 = [(SBUISystemApertureElementSource *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(_SBUISystemApertureElementSourceAnimationContext);
    animationContext = v2->_animationContext;
    v2->_animationContext = v3;

    +[SBUISystemApertureElementSource performSelector:sel__addSource_ withObject:v2 afterDelay:0.0];
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__windowDidAttachToContext_ name:*MEMORY[0x1E4F44248] object:0];
  }
  return v2;
}

- (SBUISystemApertureElementSource)initWithScene:(id)a3
{
  id v5 = a3;
  id v6 = [(SBUISystemApertureElementSource *)self init];
  if (v6)
  {
    objc_super v7 = [v5 session];
    v8 = [v7 role];
    char v9 = [v8 isEqualToString:@"SBUISystemApertureSceneSessionRole"];

    if ((v9 & 1) == 0)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, v6, @"SBUISystemApertureElementSource.m", 212, @"Invalid parameter not satisfying: %@", @"[[[scene session] role] isEqualToString:kSBUISystemApertureSceneSessionRole]" object file lineNumber description];
    }
    [(SBUISystemApertureElementSource *)v6 _setScene:v5];
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v6 selector:sel__contentSizeCategoryDidChange name:*MEMORY[0x1E4F43788] object:0];
  }
  return v6;
}

- (BOOL)isFallbackContext
{
  return 0;
}

- (NSString)associatedScenePersistenceIdentifier
{
  v2 = [(SBUISystemApertureElementSource *)self _FBSScene];
  uint64_t v3 = [v2 clientSettings];
  id v4 = objc_msgSend(v3, "SBUISA_associatedScenePersistenceIdentifier");

  return (NSString *)v4;
}

- (FBSSceneIdentityToken)identityToken
{
  v2 = [(SBUISystemApertureElementSource *)self _FBSScene];
  uint64_t v3 = [v2 identityToken];

  return (FBSSceneIdentityToken *)v3;
}

- (id)systemApertureElementViewController
{
  p_elementViewController = &self->__elementViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->__elementViewController);
  if (!WeakRetained)
  {
    id v5 = [(SBUISystemApertureElementSource *)self systemApertureElementViewControllerProvider];
    WeakRetained = [v5 systemApertureElementViewController];

    objc_storeWeak((id *)p_elementViewController, WeakRetained);
  }
  return WeakRetained;
}

- (void)setSystemApertureElementProvider:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(SBUISystemApertureElementSource *)self setSystemApertureElementViewControllerProvider:v4];
  }
}

- (void)setSystemApertureElementViewControllerProvider:(id)a3
{
  p_systemApertureElementViewControllerProvider = &self->_systemApertureElementViewControllerProvider;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_systemApertureElementViewControllerProvider);

  objc_storeWeak((id *)p_systemApertureElementViewControllerProvider, v5);
  if (WeakRetained != v5)
  {
    [(SBUISystemApertureElementSource *)self setElementNeedsUpdate];
  }
}

- (id)containerViewController
{
  v2 = [(SBUISystemApertureElementSource *)self mutableConfiguration];
  uint64_t v3 = [v2 containerViewController];

  return v3;
}

- (UIView)containerView
{
  v2 = [(SBUISystemApertureElementSource *)self containerViewController];
  uint64_t v3 = [v2 viewIfLoaded];

  return (UIView *)v3;
}

- (UIView)layoutGuideRootView
{
  v2 = [(SBUISystemApertureElementSource *)self systemApertureElementViewController];
  uint64_t v3 = [v2 viewIfLoaded];
  id v4 = [v3 window];

  return (UIView *)v4;
}

- (void)requestTransitionToMaximumSupportedLayoutMode
{
  if (self->_alertingAssertion)
  {
    alertingAssertion = self->_alertingAssertion;
    [(_SBUISystemApertureAlertingAssertion *)alertingAssertion resetAutomaticInvalidationTimer];
  }
  else
  {
    id v3 = [(SBUISystemApertureElementSource *)self requestAlertingAssertion];
  }
}

- (void)requestTransitionToPreferredLayoutMode
{
  id v3 = [(SBUISystemApertureElementSource *)self systemApertureElementViewController];
  uint64_t v4 = [v3 preferredLayoutMode];

  if (v4 == -1) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 1;
  }
  [(SBUISystemApertureElementSource *)self _sendActionForCommand:v5];
}

- (void)requestNegativeResponseAnimation
{
}

- (id)requestAlertingAssertionWithOptions:(unint64_t)a3
{
  if (!self->_alertingAssertion)
  {
    char v4 = a3;
    if ([(SBUISystemApertureElementSource *)self elementCanRequestAlertingAssertion])
    {
      uint64_t v5 = [[_SBUISystemApertureAlertingAssertion alloc] initWithElementSource:self];
      alertingAssertion = self->_alertingAssertion;
      self->_alertingAssertion = v5;

      objc_initWeak(&location, self);
      objc_super v7 = self->_alertingAssertion;
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      v15 = __71__SBUISystemApertureElementSource_requestAlertingAssertionWithOptions___block_invoke;
      v16 = &unk_1E5CCE598;
      objc_copyWeak(&v17, &location);
      [(_SBUISystemApertureAlertingAssertion *)v7 addInvalidationBlock:&v13];
      alertingAssertionsAwaitingActions = self->_alertingAssertionsAwaitingActions;
      if (alertingAssertionsAwaitingActions)
      {
        -[NSMutableArray addObject:](alertingAssertionsAwaitingActions, "addObject:", self->_alertingAssertion, v13, v14, v15, v16);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:", self->_alertingAssertion, v13, v14, v15, v16);
        char v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        v10 = self->_alertingAssertionsAwaitingActions;
        self->_alertingAssertionsAwaitingActions = v9;
      }
      [(SBUISystemApertureElementSource *)self _sendActionForCommand:v4 & 1 | 6];
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
  v11 = self->_alertingAssertion;
  return v11;
}

void __71__SBUISystemApertureElementSource_requestAlertingAssertionWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [WeakRetained _alertingAssertion];

  if (v4 == v3) {
    [WeakRetained _setAlertingAssertion:0];
  }
}

- (id)requestAlertingAssertion
{
  return [(SBUISystemApertureElementSource *)self requestAlertingAssertionWithOptions:0];
}

- (void)elementWillPresentMenu
{
  if (![(SBUISystemApertureElementSource *)self elementHasMenuPresentation])
  {
    [(SBUISystemApertureElementSource *)self setElementHasMenuPresentation:1];
    [(SBUISystemApertureElementSource *)self setElementNeedsUpdate];
  }
}

- (void)elementDidDismissMenu
{
  if ([(SBUISystemApertureElementSource *)self elementHasMenuPresentation])
  {
    [(SBUISystemApertureElementSource *)self setElementHasMenuPresentation:0];
    [(SBUISystemApertureElementSource *)self setElementNeedsUpdate];
  }
}

- (void)setPresentationPossible:(BOOL)a3
{
  if (self->_presentationPossible != a3)
  {
    self->_presentationPossible = a3;
    if (a3)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __59__SBUISystemApertureElementSource_setPresentationPossible___block_invoke;
      v5[3] = &unk_1E5CCE5C0;
      v5[4] = self;
      [(SBUISystemApertureElementSource *)self _enumerateObserversRespondingToSelector:sel_systemApertureElementContextPresentationDidBecomePossible_ usingBlock:v5];
      [(SBUISystemApertureElementSource *)self setElementNeedsUpdate];
    }
    else
    {
      id v4 = [(SBUISystemApertureElementSource *)self systemApertureOwnedWindow];
      [v4 setHidden:1];

      [(SBUISystemApertureElementSource *)self setSystemApertureOwnedWindow:0];
    }
  }
}

uint64_t __59__SBUISystemApertureElementSource_setPresentationPossible___block_invoke(uint64_t a1, void *a2)
{
  return [a2 systemApertureElementContextPresentationDidBecomePossible:*(void *)(a1 + 32)];
}

- (SBUISystemApertureElementConfiguration)mutableConfiguration
{
  mutableConfiguration = self->_mutableConfiguration;
  if (!mutableConfiguration)
  {
    id v4 = objc_alloc_init(SBUISystemApertureElementConfiguration);
    uint64_t v5 = self->_mutableConfiguration;
    self->_mutableConfiguration = v4;

    mutableConfiguration = self->_mutableConfiguration;
  }
  return mutableConfiguration;
}

- (id)_FBSScene
{
  v2 = [(SBUISystemApertureElementSource *)self _scene];
  id v3 = [v2 _FBSScene];

  return v3;
}

- (id)_sceneSettings
{
  v2 = [(SBUISystemApertureElementSource *)self _FBSScene];
  id v3 = [v2 settings];

  return v3;
}

- (int64_t)layoutMode
{
  v2 = [(SBUISystemApertureElementSource *)self _sceneSettings];
  int64_t v3 = objc_msgSend(v2, "SBUISA_layoutMode");

  return v3;
}

- (void)validateConfiguration
{
  id v2 = [(SBUISystemApertureElementSource *)self mutableConfiguration];
  [v2 validateConfiguration];
}

- (void)setElementNeedsUpdate
{
  if ([(SBUISystemApertureElementSource *)self isPresentationPossible])
  {
    [(SBUISystemApertureElementSource *)self _performElementUpdate];
  }
}

- (BOOL)_isPresentationPossibleAndSceneForeground
{
  int64_t v3 = [(SBUISystemApertureElementSource *)self _scene];
  unint64_t v4 = [v3 activationState];

  BOOL result = [(SBUISystemApertureElementSource *)self isPresentationPossible];
  if (v4 >= 2) {
    return 0;
  }
  return result;
}

- (void)setElementNeedsLayoutUpdateWithOptions:(unint64_t)a3 coordinatedAnimations:(id)a4
{
  char v4 = a3;
  v16 = (void (**)(void))a4;
  if (![(SBUISystemApertureElementSource *)self _isPresentationPossibleAndSceneForeground]|| ![(SBUISystemApertureElementSource *)self _elementSupportsDynamicResizing])
  {
    [(_SBUISystemApertureElementSourceAnimationContext *)self->_animationContext disableSkippingSceneResizeActions];
    v16[2]();
    goto LABEL_6;
  }
  BOOL v6 = [(_SBUISystemApertureElementSourceAnimationContext *)self->_animationContext hasPendingCoordinatedAnimations];
  objc_super v7 = [(SBUISystemApertureElementSource *)self transitionContext];
  if (v7)
  {
    v8 = [(SBUISystemApertureElementSource *)self transitionContext];
    uint64_t v9 = [v8 fromLayoutMode];
    BOOL v10 = v9 == [(SBUISystemApertureElementSource *)self layoutMode];
  }
  else
  {
    BOOL v10 = 1;
  }

  int64_t v11 = [(SBUISystemApertureElementSource *)self layoutMode];
  [(_SBUISystemApertureElementSourceAnimationContext *)self->_animationContext addPendingAnimation:v16];
  if ((v4 & 1) == 0
    || (v11 == 4 ? (BOOL v12 = v10) : (BOOL v12 = 0),
        [(_SBUISystemApertureElementSourceAnimationContext *)self->_animationContext disableSkippingSceneResizeActions], !v12))
  {
    if (!v6
      && ![(_SBUISystemApertureElementSourceAnimationContext *)self->_animationContext hasTransientLocalResizeAction])
    {
      uint64_t v14 = [(SBUISystemApertureElementSource *)self localSceneResizeParameters];
      v15 = +[SBUISystemApertureSceneResizeAction transientLocalResizeSceneActionWithAnimationParameters:v14];
      [(SBUISystemApertureElementSource *)self _handleSceneResizeAction:v15];
      goto LABEL_20;
    }
LABEL_6:
    [(SBUISystemApertureElementSource *)self setElementNeedsUpdate];
    goto LABEL_7;
  }
  uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = [[SBUISystemApertureSceneAction alloc] initWithCommand:4];
  v15 = [v13 setWithObject:v14];
  [(SBUISystemApertureElementSource *)self _performElementUpdateWithActions:v15];
LABEL_20:

LABEL_7:
}

- (void)setElementNeedsUpdateWithCoordinatedAnimations:(id)a3
{
}

- (void)_ensureElementViewControllerIsInAWindow
{
  if (![(SBUISystemApertureElementSource *)self isPresentationPossible])
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2 object:self file:@"SBUISystemApertureElementSource.m" lineNumber:439 description:@"Should not call _ensureElementViewControllerIsInAWindow unless presentations are possible."];
  }
  id v29 = [(SBUISystemApertureElementSource *)self systemApertureElementViewController];
  char v4 = [(SBUISystemApertureElementSource *)self windowScene];
  uint64_t v5 = [v29 parentViewController];

  if (!v5)
  {
    BOOL v6 = [[SBUISystemApertureSecureWindow alloc] initWithWindowScene:v4];
    [(SBUISystemApertureElementSource *)self setSystemApertureOwnedWindow:v6];
    objc_super v7 = objc_alloc_init(SBUISystemApertureElementSourceContainerViewController);
    [(SBUISystemApertureSecureWindow *)v6 setRootViewController:v7];
    [(SBUISystemApertureElementSourceContainerViewController *)v7 setElementViewController:v29];
    [(SBUISystemApertureSecureWindow *)v6 setHidden:0];
  }
  v8 = [v29 parentViewController];
  if (!self->_dependencyGestureRecognizer)
  {
    uint64_t v9 = [[SBUIDependencyGestureRecognizer alloc] initWithTarget:self action:sel__handleGestureDependencyChange_];
    dependencyGestureRecognizer = self->_dependencyGestureRecognizer;
    self->_dependencyGestureRecognizer = v9;

    int64_t v11 = self->_dependencyGestureRecognizer;
    BOOL v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", NSClassFromString(&cfstr_Mruslider.isa), 0);
    [(SBUIDependencyGestureRecognizer *)v11 setObservedControlClasses:v12];

    [(SBUIDependencyGestureRecognizer *)self->_dependencyGestureRecognizer setDelegate:self];
    uint64_t v13 = [v8 view];
    [v13 addGestureRecognizer:self->_dependencyGestureRecognizer];
  }
  uint64_t v14 = [(SBUISystemApertureElementSource *)self mutableConfiguration];
  v15 = [v14 containerViewController];
  char v16 = [v15 isEqual:v8];

  if ((v16 & 1) == 0)
  {
    id v17 = [(SBUISystemApertureElementSource *)self mutableConfiguration];
    [v17 setContainerViewController:v8];
  }
  v18 = [(SBUISystemApertureElementSource *)self mutableConfiguration];
  v19 = [(SBUISystemApertureElementSource *)self systemApertureElement];
  [v18 setElementViewController:v19];

  v20 = [v29 viewIfLoaded];
  v21 = [v20 window];

  v22 = v29;
  if (v21)
  {
    v23 = [v29 view];
    v24 = [v23 window];

    v25 = [v24 windowScene];
    if (([v25 isEqual:v4] & 1) == 0)
    {
      v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:a2, self, @"SBUISystemApertureElementSource.m", 464, @"Expected scene %@ for element view controller %@ but got %@", v4, v29, v25 object file lineNumber description];
    }
    v22 = v29;
  }
  v26 = [v22 viewIfLoaded];
  [v26 setOverrideUserInterfaceStyle:2];

  [v29 setOverrideUserInterfaceStyle:2];
  [(SBUISystemApertureElementSource *)self _updateTraitCollectionForElementIfNeeded];
}

- (BOOL)_performElementUpdate
{
  return [(SBUISystemApertureElementSource *)self _performElementUpdateWithActionsIfPossible:0];
}

- (BOOL)_performElementUpdateWithActionsIfPossible:(id)a3
{
  id v4 = a3;
  if (![(SBUISystemApertureElementSource *)self isPresentationPossible]) {
    goto LABEL_7;
  }
  uint64_t v5 = [(SBUISystemApertureElementSource *)self systemApertureElement];
  if (!v5 || [(SBUISystemApertureElementSource *)self layoutMode] == -1)
  {

    goto LABEL_7;
  }
  BOOL v6 = [(SBUISystemApertureElementSource *)self _scene];

  if (!v6)
  {
LABEL_7:
    BOOL v7 = 0;
    goto LABEL_8;
  }
  BOOL v7 = [(SBUISystemApertureElementSource *)self _performElementUpdateWithActions:v4];
LABEL_8:

  return v7;
}

- (BOOL)_performElementUpdateWithActions:(id)a3
{
  id v5 = a3;
  if ([(SBUISystemApertureElementSource *)self layoutMode] == -1)
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2 object:self file:@"SBUISystemApertureElementSource.m" lineNumber:484 description:@"Performing an update when element is removed is not supported."];
  }
  BOOL v6 = [(SBUISystemApertureElementSource *)self _scene];

  if (!v6)
  {
    v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:a2 object:self file:@"SBUISystemApertureElementSource.m" lineNumber:485 description:@"Performing an update when element doesn't have a scene is not supported."];
  }
  [(SBUISystemApertureElementSource *)self _ensureElementViewControllerIsInAWindow];
  BOOL v7 = [(SBUISystemApertureElementSource *)self systemApertureElementViewController];
  v8 = [(SBUISystemApertureElementSource *)self mutableConfiguration];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [v7 elementIdentifier];
    [v8 setElementIdentifier:v9];
  }
  objc_msgSend(v8, "setContentRole:", objc_msgSend(v7, "contentRole"));
  objc_msgSend(v8, "setPreferredLayoutMode:", objc_msgSend(v7, "preferredLayoutMode"));
  objc_msgSend(v8, "setMaximumLayoutMode:", objc_msgSend(v7, "maximumLayoutMode"));
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v7 minimumLayoutMode] > 1
     || (uint64_t v10 = [v7 minimumLayoutMode], v10 == objc_msgSend(v7, "maximumLayoutMode")))
    && [v8 contentRole] == 2)
  {
    uint64_t v11 = [v7 minimumLayoutMode];
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      BOOL v12 = [v7 leadingView];
      BOOL v13 = v12 != 0;
    }
    else
    {
      BOOL v13 = 0;
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v14 = [v7 trailingView];
      BOOL v15 = v14 != 0;
    }
    else
    {
      BOOL v15 = 0;
    }
    if (objc_opt_respondsToSelector())
    {
      char v16 = [v7 minimalView];
      BOOL v17 = v16 != 0;
    }
    else
    {
      BOOL v17 = 0;
    }
    if (v13 && v15 && [v7 maximumLayoutMode] >= 3)
    {
      if ([v8 contentRole] == 2 && v17) {
        uint64_t v11 = 2;
      }
      else {
        uint64_t v11 = 3;
      }
    }
    else if (v17 && [v7 maximumLayoutMode] == 2)
    {
      uint64_t v11 = 2;
    }
    else
    {
      uint64_t v11 = 4 * ([v7 maximumLayoutMode] == 4);
    }
  }
  [v8 setMinimumLayoutMode:v11];
  if (objc_opt_respondsToSelector()) {
    uint64_t v18 = [v7 preventsInteractiveDismissal];
  }
  else {
    uint64_t v18 = [v8 contentRole] == 2;
  }
  [v8 setPreventsInteractiveDismissal:v18];
  if ([v8 contentRole] == 1 && (objc_opt_respondsToSelector() & 1) != 0) {
    uint64_t v19 = [v7 preventsAutomaticDismissal];
  }
  else {
    uint64_t v19 = 0;
  }
  [v8 setPreventsAutomaticDismissal:v19];
  [(SBUISystemApertureElementSource *)self _updateElementCanRequestAlertingAssertion];
  if ([v8 minimumLayoutMode] != 4)
  {
    if (objc_opt_respondsToSelector())
    {
      v20 = [v7 leadingView];
      [v8 setLeadingView:v20];
    }
    if (objc_opt_respondsToSelector())
    {
      v21 = [v7 trailingView];
      [v8 setTrailingView:v21];
    }
    if (objc_opt_respondsToSelector())
    {
      v22 = [v7 minimalView];
      [v8 setMinimalView:v22];
    }
    if (objc_opt_respondsToSelector())
    {
      v23 = [v7 detachedMinimalView];
      [v8 setDetachedMinimalView:v23];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    v24 = [v7 associatedScenePersistenceIdentifier];
    [v8 setAssociatedScenePersistenceIdentifier:v24];
  }
  else
  {
    [v8 setAssociatedScenePersistenceIdentifier:0];
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v8, "setPresentationBehaviors:", objc_msgSend(v7, "presentationBehaviors"));
  }
  if (objc_opt_respondsToSelector())
  {
    v25 = [v7 associatedAppBundleIdentifier];
    [v8 setAssociatedAppBundleIdentifier:v25];
  }
  else
  {
    if ([v8 presentationBehaviors] & 0x1000) != 0 || (objc_opt_respondsToSelector())
    {
      [v8 setAssociatedAppBundleIdentifier:0];
      goto LABEL_58;
    }
    v25 = [MEMORY[0x1E4F28B50] mainBundle];
    v26 = [v25 bundleIdentifier];
    [v8 setAssociatedAppBundleIdentifier:v26];
  }
LABEL_58:
  if (objc_opt_respondsToSelector())
  {
    v27 = [v7 launchURL];
  }
  else
  {
    v27 = 0;
  }
  [v8 setLaunchURL:v27];
  if (objc_opt_respondsToSelector())
  {
    v28 = [v7 launchAction];
  }
  else
  {
    v28 = 0;
  }
  [v8 setLaunchAction:v28];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v29 = [v7 backgroundActivitiesToSuppress];
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_69;
    }
    uint64_t v29 = soft_STUIBackgroundActivityIdentifiersForStyleOverrides([v7 statusBarStyleOverridesToSuppress]);
  }
  v30 = (void *)v29;
  [v8 setBackgroundActivitiesToSuppress:v29];

LABEL_69:
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v8, "setPreferredCustomLayout:", objc_msgSend(v7, "preferredCustomLayout"));
  }
  else if (objc_opt_respondsToSelector())
  {
    [v7 preferredCustomAspectRatio];
    objc_msgSend(v8, "setPreferredCustomAspectRatio:");
  }
  if (objc_opt_respondsToSelector())
  {
    v31 = [v7 keyColor];
    [v8 setKeyColor:v31];
  }
  objc_msgSend(v8, "setHasMenuPresentation:", -[SBUISystemApertureElementSource elementHasMenuPresentation](self, "elementHasMenuPresentation"));
  objc_msgSend(v8, "setAppliedLayoutMode:", -[SBUISystemApertureElementSource layoutModeAsFarAsClientsAreConcerned](self, "layoutModeAsFarAsClientsAreConcerned"));
  if (objc_opt_respondsToSelector()) {
    uint64_t v32 = [v7 attachedMinimalViewRequiresZeroPadding];
  }
  else {
    uint64_t v32 = 0;
  }
  [v8 setAttachedMinimalViewRequiresZeroPadding:v32];
  if (objc_opt_respondsToSelector()) {
    uint64_t v33 = [v7 prefersFixedPortraitOrientation];
  }
  else {
    uint64_t v33 = 0;
  }
  [v8 setPrefersFixedPortraitOrientation:v33];
  [v8 refreshViewSizingPreferences];
  [(SBUISystemApertureElementSource *)self validateConfiguration];
  v34 = [v8 otherSceneClientSettingsRepresentation];
  v35 = [(SBUISystemApertureElementSource *)self lastKnownOtherSettings];
  int v36 = [v35 isEqual:v34];

  if (!v36 || [v5 count])
  {
    [(SBUISystemApertureElementSource *)self setLastKnownOtherSettings:v34];
    uint64_t v37 = [v5 count];
    v38 = [(SBUISystemApertureElementSource *)self _FBSScene];
    if (v37)
    {
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __68__SBUISystemApertureElementSource__performElementUpdateWithActions___block_invoke;
      v45[3] = &unk_1E5CCE5E8;
      v39 = &v46;
      id v46 = v34;
      id v47 = v5;
      [v38 updateClientSettingsWithTransitionBlock:v45];

      v38 = v47;
    }
    else
    {
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __68__SBUISystemApertureElementSource__performElementUpdateWithActions___block_invoke_2;
      v43[3] = &unk_1E5CCE610;
      v39 = &v44;
      id v44 = v34;
      [v38 updateClientSettingsWithBlock:v43];
    }
  }
  return v36 ^ 1;
}

id __68__SBUISystemApertureElementSource__performElementUpdateWithActions___block_invoke(uint64_t a1, void *a2)
{
  int64_t v3 = [a2 otherSettings];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      BOOL v6 = v5;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  id v7 = v6;

  [v7 applySettings:*(void *)(a1 + 32)];
  v8 = [MEMORY[0x1E4F42790] transitionContext];
  [v8 setActions:*(void *)(a1 + 40)];
  return v8;
}

void __68__SBUISystemApertureElementSource__performElementUpdateWithActions___block_invoke_2(uint64_t a1, void *a2)
{
  int64_t v3 = [a2 otherSettings];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      BOOL v6 = v5;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  id v7 = v6;

  [v7 applySettings:*(void *)(a1 + 32)];
}

- (void)_handleGestureDependencyChange:(id)a3
{
  if ([a3 state] == 3)
  {
    [(SBUISystemApertureElementSource *)self _sendActionForCommand:5];
  }
}

- (CGRect)anchorFrameForLeadingView
{
  id v2 = [(SBUISystemApertureElementSource *)self _sceneSettings];
  objc_msgSend(v2, "SBUISA_resolvedLeadingViewFrame");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)anchorFrameForTrailingView
{
  id v2 = [(SBUISystemApertureElementSource *)self _sceneSettings];
  objc_msgSend(v2, "SBUISA_resolvedTrailingViewFrame");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)anchorFrameForMinimalView
{
  id v2 = [(SBUISystemApertureElementSource *)self _sceneSettings];
  objc_msgSend(v2, "SBUISA_resolvedMinimalViewFrame");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)anchorFrameForDetachedMinimalView
{
  id v2 = [(SBUISystemApertureElementSource *)self _sceneSettings];
  objc_msgSend(v2, "SBUISA_resolvedDetachedMinimalViewFrame");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)_setScene:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v8 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      double v6 = v8;
    }
    else {
      double v6 = 0;
    }
  }
  else
  {
    double v6 = 0;
  }
  id v7 = v6;

  [(SBUISystemApertureElementSource *)self setWindowScene:v7];
  +[SBUISystemApertureElementSource _addSource:self];
}

- (void)_sceneWillInvalidate:(id)a3
{
}

void __56__SBUISystemApertureElementSource__sceneWillInvalidate___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 160) performPendingCoordinatedAnimations];
  id v2 = [*(id *)(a1 + 32) systemApertureElementViewController];
  uint64_t v3 = [v2 activeLayoutMode];

  if (v3 != -1)
  {
    id v4 = [*(id *)(a1 + 32) systemApertureElementViewController];
    [v4 setActiveLayoutMode:-1];
  }
  +[SBUISystemApertureElementSource _removeSource:*(void *)(a1 + 32)];
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:*(void *)(a1 + 32)];
}

- (id)_settingsDiffActionsForScene:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = self;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  return v3;
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  id v12 = a7;
  double v13 = [a4 settings];
  double v14 = objc_msgSend(v13, "SBUI_systemApertureDescriptionOfDiffFromSettings:", v11);

  if (v14)
  {
    BOOL v15 = SBLogSystemApertureHosting();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      char v16 = [(SBUISystemApertureElementSource *)self succinctDescription];
      *(_DWORD *)buf = 138543618;
      v60 = v16;
      __int16 v61 = 2114;
      v62 = v14;
      _os_log_impl(&dword_1A7607000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ received scene settings update with changes: %{public}@", buf, 0x16u);
    }
  }
  int64_t v17 = [(SBUISystemApertureElementSource *)self layoutMode];
  uint64_t v18 = objc_msgSend(v11, "SBUISA_layoutMode");
  if (v18 != [(SBUISystemApertureElementSource *)self layoutMode]) {
    [(_SBUISystemApertureElementSourceAnimationContext *)self->_animationContext disableSkippingSceneResizeActions];
  }
  [(SBUISystemApertureElementSource *)self setPresentationPossible:(unint64_t)(v17 - 1) < 0xFFFFFFFFFFFFFFFELL];
  uint64_t v19 = [v12 actions];
  v20 = objc_msgSend(v19, "bs_firstObjectPassingTest:", &__block_literal_global_133);

  v21 = [v12 actions];
  v22 = objc_msgSend(v21, "bs_filter:", &__block_literal_global_135);

  v23 = [v12 actions];
  v24 = objc_msgSend(v23, "bs_firstObjectPassingTest:", &__block_literal_global_137);

  v51 = v22;
  if (!v20 && ![v22 count] && !v24)
  {
    v28 = [(SBUISystemApertureElementSource *)self windowScene];
    BOOL v29 = 0;
    goto LABEL_42;
  }
  v25 = [v12 actions];
  v26 = (void *)[v25 mutableCopy];

  if (v20) {
    [v26 removeObject:v20];
  }
  if ([v22 count]) {
    [v26 minusSet:v22];
  }
  if (v24) {
    [v26 removeObject:v24];
  }
  [v12 setActions:v26];
  v49 = v20;
  v50 = v14;
  v48 = v24;
  v45 = v26;
  if (!v20) {
    goto LABEL_17;
  }
  if (objc_msgSend(v20, "isTransientLocal", v26))
  {
    v27 = [v20 animationParameters];
    [(SBUISystemApertureElementSource *)self setLocalSceneResizeParameters:v27];

LABEL_17:
    BOOL v47 = 0;
    goto LABEL_22;
  }
  BOOL v47 = [(SBUISystemApertureElementSource *)self _handleSceneResizeAction:v20];
LABEL_22:
  v30 = [(SBUISystemApertureElementSource *)self systemApertureElement];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v31 = v22;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v55 != v34) {
          objc_enumerationMutation(v31);
        }
        switch([*(id *)(*((void *)&v54 + 1) + 8 * i) command])
        {
          case 11:
            if (objc_opt_respondsToSelector()) {
              [v30 handleCustomViewLongPressEvent];
            }
            break;
          case 12:
            [(SBUISystemApertureElementSource *)self setElementCanRequestAlertingAssertion:1];
            [(SBUISystemApertureElementSource *)self _updateElementCanRequestAlertingAssertion];
            break;
          case 13:
            if (objc_opt_respondsToSelector()) {
              [v30 handleCompactOrMinimalViewTapEvent];
            }
            break;
          case 14:
            [(SBUISystemApertureElementSource *)self _handleClientErrorNonUniqueElementAction];
            break;
          default:
            continue;
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v54 objects:v58 count:16];
    }
    while (v33);
  }

  v24 = v48;
  if (v48) {
    [(SBUISystemApertureElementSource *)self _handleAlertingAction:v48];
  }

  v28 = [(SBUISystemApertureElementSource *)self windowScene];
  v20 = v49;
  double v14 = v50;
  if (v49)
  {
    BOOL v29 = v47;
    if (![v49 isTransientLocal]) {
      goto LABEL_45;
    }
  }
  else
  {
    BOOL v29 = v47;
  }
LABEL_42:
  if ([(SBUISystemApertureElementSource *)self layoutMode] == 1)
  {
    int v36 = v24;
    uint64_t v37 = [(SBUISystemApertureElementSource *)self systemApertureElement];
    uint64_t v38 = [v37 activeLayoutMode];

    if (!v38)
    {
      v40 = [(SBUISystemApertureElementSource *)self systemApertureElement];
      [v40 loadViewIfNeeded];

      v39 = [(SBUISystemApertureElementSource *)self systemApertureElement];
      v24 = v36;
      goto LABEL_53;
    }
    v24 = v36;
  }
LABEL_45:
  if ([(SBUISystemApertureElementSource *)self layoutMode] == 1)
  {
    v39 = [(SBUISystemApertureElementSource *)self systemApertureElement];
    if ([v39 activeLayoutMode] == 1)
    {
LABEL_54:

      goto LABEL_55;
    }
    if ([v28 activationState] == 2)
    {
    }
    else
    {
      v41 = v24;
      uint64_t v42 = [v28 activationState];

      BOOL v43 = v42 == -1;
      v24 = v41;
      if (!v43) {
        goto LABEL_55;
      }
    }
    v39 = [(SBUISystemApertureElementSource *)self systemApertureElementViewController];
LABEL_53:
    [v39 setActiveLayoutMode:1];
    goto LABEL_54;
  }
LABEL_55:
  int64_t v44 = [(SBUISystemApertureElementSource *)self layoutMode];
  if ((v44 == 2) == (objc_msgSend(v11, "SBUISA_layoutMode") != 2) && !v29)
  {
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __145__SBUISystemApertureElementSource__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_4;
    v52[3] = &unk_1E5CCC5A8;
    v52[4] = self;
    BOOL v53 = v44 == 2;
    objc_msgSend(MEMORY[0x1E4F42FF0], "SBUISA_performWithoutAnimationOrRetargeting:", v52);
  }
}

uint64_t __145__SBUISystemApertureElementSource__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __145__SBUISystemApertureElementSource__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __145__SBUISystemApertureElementSource__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __145__SBUISystemApertureElementSource__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mutableConfiguration];
  id v5 = [v2 detachedMinimalView];

  uint64_t v3 = [*(id *)(a1 + 32) mutableConfiguration];
  id v4 = [v3 minimalView];

  [v5 setHidden:*(unsigned char *)(a1 + 40) == 0];
  if (*(unsigned char *)(a1 + 40)) {
    [v4 setHidden:0];
  }
}

- (void)addTransitionContext:(id)a3
{
  id v4 = a3;
  transitionContexts = self->_transitionContexts;
  id v8 = v4;
  if (!transitionContexts)
  {
    double v6 = [MEMORY[0x1E4F1CA48] array];
    id v7 = self->_transitionContexts;
    self->_transitionContexts = v6;

    id v4 = v8;
    transitionContexts = self->_transitionContexts;
  }
  [(NSMutableArray *)transitionContexts addObject:v4];
  -[SBUISystemApertureElementSource setLayoutModeAsFarAsClientsAreConcerned:](self, "setLayoutModeAsFarAsClientsAreConcerned:", [v8 fromLayoutMode]);
}

- (void)removeTransitionContext:(id)a3
{
  [(NSMutableArray *)self->_transitionContexts removeObject:a3];
  [(SBUISystemApertureElementSource *)self setLayoutModeAsFarAsClientsAreConcerned:[(SBUISystemApertureElementSource *)self layoutMode]];
  if (![(NSMutableArray *)self->_transitionContexts count])
  {
    transitionContexts = self->_transitionContexts;
    self->_transitionContexts = 0;
  }
}

- (SBUISystemApertureElementTransitionContext)transitionContext
{
  return (SBUISystemApertureElementTransitionContext *)[(NSMutableArray *)self->_transitionContexts lastObject];
}

- (BOOL)_elementRequiresConstraintBasedLayout
{
  uint64_t v3 = [(SBUISystemApertureElementSource *)self systemApertureElementViewController];
  id v4 = [v3 view];

  BOOL v5 = (![v4 translatesAutoresizingMaskIntoConstraints]
     || [(id)objc_opt_class() requiresConstraintBasedLayout])
    && [(SBUISystemApertureElementSource *)self _elementSupportsDynamicResizing];

  return v5;
}

- (BOOL)_elementSupportsDynamicResizing
{
  id v2 = [(SBUISystemApertureElementSource *)self systemApertureElementViewController];
  char v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (BOOL)_elementIsInAWindow
{
  char v3 = [(SBUISystemApertureElementSource *)self containerViewController];
  id v4 = [v3 viewIfLoaded];

  BOOL v5 = [(SBUISystemApertureElementSource *)self _elementViewController];
  double v6 = [v5 viewIfLoaded];

  if ([v6 _isInAWindow]) {
    char v7 = [v6 isDescendantOfView:v4];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (void)_activateConstraintsForActiveLayoutModeIfNeeded:(int64_t)a3
{
  if ([(SBUISystemApertureElementSource *)self isPresentationPossible]
    && [(SBUISystemApertureElementSource *)self _elementIsInAWindow]
    && [(SBUISystemApertureElementSource *)self _elementRequiresConstraintBasedLayout]&& [(SBUISystemApertureElementSource *)self _elementSupportsDynamicResizing])
  {
    [(SBUISystemApertureElementSource *)self _activateConstraintsForLayoutMode:a3];
  }
  else
  {
    id v5 = [(SBUISystemApertureElementSource *)self _activeConstraintsForLayoutMode];
    [(SBUISystemApertureElementSource *)self set_activeConstraintsForLayoutMode:0];
    if ([v5 count]) {
      [MEMORY[0x1E4F28DC8] deactivateConstraints:v5];
    }
  }
}

- (void)_activateConstraintsForLayoutMode:(int64_t)a3
{
  id v15 = [(SBUISystemApertureElementSource *)self _constraintsForLayoutMode:a3];
  id v4 = [(SBUISystemApertureElementSource *)self _activeConstraintsForLayoutMode];
  char v5 = [v15 isEqualToArray:v4];

  if ((v5 & 1) == 0)
  {
    double v6 = [(SBUISystemApertureElementSource *)self systemApertureElementViewController];
    [(SBUISystemApertureElementSource *)self _ensureElementViewControllerIsInAWindow];
    char v7 = [v6 minimalView];
    if (objc_opt_respondsToSelector())
    {
      id v8 = [v6 detachedMinimalView];
    }
    else
    {
      id v8 = 0;
    }
    double v9 = [v6 leadingView];
    double v10 = [v6 trailingView];
    id v11 = [v6 view];
    if (v7 && ([v7 isDescendantOfView:v11] & 1) == 0) {
      [v11 addSubview:v7];
    }
    if (v8 && ([v8 isDescendantOfView:v11] & 1) == 0) {
      [v11 addSubview:v8];
    }
    if (v9 && ([v9 isDescendantOfView:v11] & 1) == 0) {
      [v11 addSubview:v9];
    }
    if (v10 && ([v10 isDescendantOfView:v11] & 1) == 0) {
      [v11 addSubview:v10];
    }
    maximumLeadingViewWidthConstraint = self->__maximumLeadingViewWidthConstraint;
    objc_msgSend(v9, "SBUISA_maximumAccessoryViewWidth");
    -[NSLayoutConstraint setConstant:](maximumLeadingViewWidthConstraint, "setConstant:");
    maximumTrailingViewWidthConstraint = self->__maximumTrailingViewWidthConstraint;
    objc_msgSend(v10, "SBUISA_maximumAccessoryViewWidth");
    -[NSLayoutConstraint setConstant:](maximumTrailingViewWidthConstraint, "setConstant:");
    double v14 = [(SBUISystemApertureElementSource *)self _activeConstraintsForLayoutMode];
    [(SBUISystemApertureElementSource *)self set_activeConstraintsForLayoutMode:0];
    if ([v14 count]) {
      [MEMORY[0x1E4F28DC8] deactivateConstraints:v14];
    }
    if ([v15 count])
    {
      [(SBUISystemApertureElementSource *)self set_activeConstraintsForLayoutMode:v15];
      [MEMORY[0x1E4F28DC8] activateConstraints:v15];
    }
  }
}

- (id)_constraintsForLayoutMode:(int64_t)a3
{
  id v4 = self;
  v152[12] = *MEMORY[0x1E4F143B8];
  char v5 = [(SBUISystemApertureElementSource *)self _elementViewController];
  double v6 = [v5 view];

  char v7 = [(SBUISystemApertureElementSource *)v4 containerViewController];
  id v8 = [v7 view];

  double v9 = [(SBUISystemApertureElementSource *)v4 mutableConfiguration];
  double v10 = [v9 leadingView];

  id v11 = [(SBUISystemApertureElementSource *)v4 mutableConfiguration];
  id v12 = [v11 minimalView];

  double v13 = [(SBUISystemApertureElementSource *)v4 mutableConfiguration];
  double v14 = [v13 detachedMinimalView];

  id v15 = [(SBUISystemApertureElementSource *)v4 mutableConfiguration];
  char v16 = [v15 trailingView];

  v145 = objc_msgSend(v8, "SBUISA_systemApertureObstructedAreaLayoutGuide");
  int64_t v17 = [v8 window];
  v147 = objc_msgSend(v17, "SBUISA_systemApertureMinimumContentSizeLayoutGuide");

  uint64_t v18 = [v8 window];
  v146 = objc_msgSend(v18, "SBUISA_systemApertureMaximumContentSizeLayoutGuide");

  constraintsByLayoutMode = v4->_constraintsByLayoutMode;
  v20 = [NSNumber numberWithInteger:a3];
  v21 = [(NSMutableDictionary *)constraintsByLayoutMode objectForKeyedSubscript:v20];

  if (v21) {
    goto LABEL_8;
  }
  v136 = v16;
  v137 = v4;
  v138 = v14;
  v139 = v10;
  v142 = v12;
  v143 = (void *)MEMORY[0x1E4F1CA48];
  v131 = [v6 centerXAnchor];
  v127 = [v8 centerXAnchor];
  v123 = [v131 constraintEqualToAnchor:v127];
  v152[0] = v123;
  v121 = [v6 topAnchor];
  v135 = v8;
  v119 = [v8 topAnchor];
  v117 = [v121 constraintEqualToAnchor:v119];
  v152[1] = v117;
  v115 = [v6 widthAnchor];
  v113 = [v147 widthAnchor];
  v111 = [v115 constraintEqualToAnchor:v113];
  LODWORD(v22) = 1.0;
  v109 = objc_msgSend(v111, "SBUISA_withPriority:", v22);
  v152[2] = v109;
  v107 = [v6 heightAnchor];
  v105 = [v147 heightAnchor];
  v103 = [v107 constraintEqualToAnchor:v105];
  LODWORD(v23) = 1.0;
  v101 = objc_msgSend(v103, "SBUISA_withPriority:", v23);
  v152[3] = v101;
  v99 = [v6 topAnchor];
  v97 = [v147 topAnchor];
  v95 = [v99 constraintLessThanOrEqualToAnchor:v97];
  v152[4] = v95;
  v93 = [v6 leadingAnchor];
  v91 = [v147 leadingAnchor];
  v90 = [v93 constraintLessThanOrEqualToAnchor:v91];
  v152[5] = v90;
  v89 = [v6 bottomAnchor];
  v88 = [v147 bottomAnchor];
  v87 = [v89 constraintGreaterThanOrEqualToAnchor:v88];
  v152[6] = v87;
  v86 = [v6 trailingAnchor];
  v85 = [v147 trailingAnchor];
  v84 = [v86 constraintGreaterThanOrEqualToAnchor:v85];
  v152[7] = v84;
  v83 = [v6 topAnchor];
  v82 = [v146 topAnchor];
  v81 = [v83 constraintGreaterThanOrEqualToAnchor:v82];
  v152[8] = v81;
  v24 = [v6 leadingAnchor];
  v25 = [v146 leadingAnchor];
  v26 = [v24 constraintGreaterThanOrEqualToAnchor:v25];
  v152[9] = v26;
  v27 = [v6 bottomAnchor];
  v28 = [v146 bottomAnchor];
  [v27 constraintLessThanOrEqualToAnchor:v28];
  BOOL v29 = v140 = a3;
  v152[10] = v29;
  v30 = [v6 trailingAnchor];
  id v31 = [v146 trailingAnchor];
  [v30 constraintLessThanOrEqualToAnchor:v31];
  uint64_t v32 = v141 = v6;
  v152[11] = v32;
  uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v152 count:12];
  v144 = [v143 arrayWithArray:v33];

  int64_t v34 = v140;
  if ((unint64_t)(v140 + 1) >= 3)
  {
    if (v140 == 2)
    {
      double v6 = v141;
      id v12 = v142;
      if (v142)
      {
        v133 = [v142 centerXAnchor];
        v129 = [v141 centerXAnchor];
        v125 = [v133 constraintEqualToAnchor:v129];
        v150[0] = v125;
        v65 = [v142 centerYAnchor];
        v66 = [v141 centerYAnchor];
        v67 = [v65 constraintEqualToAnchor:v66];
        v150[1] = v67;
        v68 = [v142 leadingAnchor];
        v69 = [v141 leadingAnchor];
        v70 = [v68 constraintGreaterThanOrEqualToAnchor:v69];
        v150[2] = v70;
        v71 = [v142 topAnchor];
        v72 = [v141 topAnchor];
        v73 = [v71 constraintGreaterThanOrEqualToAnchor:v72];
        v150[3] = v73;
        v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:v150 count:4];
        [v144 addObjectsFromArray:v74];

        int64_t v34 = v140;
        double v6 = v141;

        id v12 = v142;
      }
      double v14 = v138;
      double v10 = v139;
      if (!v138 || v138 == v12) {
        goto LABEL_5;
      }
      v134 = [v138 centerXAnchor];
      uint64_t v126 = [v6 centerXAnchor];
      uint64_t v130 = [v134 constraintEqualToAnchor:v126];
      v149[0] = v130;
      uint64_t v38 = [v138 centerYAnchor];
      v39 = [v6 centerYAnchor];
      v40 = [v38 constraintEqualToAnchor:v39];
      v149[1] = v40;
      v41 = [v138 leadingAnchor];
      v75 = [v6 leadingAnchor];
      v76 = [v41 constraintGreaterThanOrEqualToAnchor:v75];
      v149[2] = v76;
      v77 = [v138 topAnchor];
      v78 = [v6 topAnchor];
      v79 = [v77 constraintGreaterThanOrEqualToAnchor:v78];
      v149[3] = v79;
      v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:v149 count:4];
      [v144 addObjectsFromArray:v80];

      int64_t v34 = v140;
      double v6 = v141;

      uint64_t v37 = (void *)v130;
      int v36 = (void *)v126;

      v35 = v134;
    }
    else
    {
      double v6 = v141;
      id v12 = v142;
      double v14 = v138;
      double v10 = v139;
      if (v140 != 3 || !v139) {
        goto LABEL_5;
      }
      v52 = [v139 widthAnchor];
      objc_msgSend(v139, "SBUISA_maximumAccessoryViewWidth");
      uint64_t v53 = objc_msgSend(v52, "constraintLessThanOrEqualToConstant:");
      maximumLeadingViewWidthConstraint = v137->__maximumLeadingViewWidthConstraint;
      v137->__maximumLeadingViewWidthConstraint = (NSLayoutConstraint *)v53;

      long long v55 = [v136 widthAnchor];
      objc_msgSend(v136, "SBUISA_maximumAccessoryViewWidth");
      uint64_t v56 = objc_msgSend(v55, "constraintLessThanOrEqualToConstant:");
      maximumTrailingViewWidthConstraint = v137->__maximumTrailingViewWidthConstraint;
      v137->__maximumTrailingViewWidthConstraint = (NSLayoutConstraint *)v56;

      v132 = [v139 leadingAnchor];
      uint64_t v124 = [v141 leadingAnchor];
      uint64_t v128 = [v132 constraintGreaterThanOrEqualToAnchor:v124];
      v148[0] = v128;
      uint64_t v38 = [v139 topAnchor];
      v39 = [v141 topAnchor];
      v40 = [v38 constraintGreaterThanOrEqualToAnchor:v39];
      v148[1] = v40;
      v41 = [v139 centerYAnchor];
      v122 = [v141 centerYAnchor];
      v120 = [v41 constraintEqualToAnchor:v122];
      v148[2] = v120;
      v118 = [v139 trailingAnchor];
      v116 = [v145 leadingAnchor];
      v114 = [v118 constraintLessThanOrEqualToAnchor:v116];
      v58 = v137->__maximumLeadingViewWidthConstraint;
      v148[3] = v114;
      v148[4] = v58;
      v112 = [v136 leadingAnchor];
      v110 = [v145 trailingAnchor];
      v108 = [v112 constraintGreaterThanOrEqualToAnchor:v110];
      v148[5] = v108;
      v106 = [v136 topAnchor];
      v104 = [v141 topAnchor];
      v102 = [v106 constraintGreaterThanOrEqualToAnchor:v104];
      v148[6] = v102;
      v100 = [v136 centerYAnchor];
      v98 = [v141 centerYAnchor];
      v96 = [v100 constraintEqualToAnchor:v98];
      v148[7] = v96;
      v94 = [v136 trailingAnchor];
      v92 = [v141 trailingAnchor];
      v59 = [v94 constraintLessThanOrEqualToAnchor:v92];
      v60 = v137->__maximumTrailingViewWidthConstraint;
      v148[8] = v59;
      v148[9] = v60;
      __int16 v61 = [v141 heightAnchor];
      v62 = [v145 heightAnchor];
      uint64_t v63 = [v61 constraintEqualToAnchor:v62];
      v148[10] = v63;
      v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v148 count:11];
      [v144 addObjectsFromArray:v64];

      int v36 = (void *)v124;
      double v6 = v141;

      uint64_t v37 = (void *)v128;
      v35 = v132;

      int64_t v34 = v140;
    }
  }
  else
  {
    double v6 = v141;
    v35 = [v141 widthAnchor];
    int v36 = [v147 widthAnchor];
    uint64_t v37 = [v35 constraintEqualToAnchor:v36];
    v151[0] = v37;
    uint64_t v38 = [v141 heightAnchor];
    v39 = [v147 heightAnchor];
    v40 = [v38 constraintEqualToAnchor:v39];
    v151[1] = v40;
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v151 count:2];
    [v144 addObjectsFromArray:v41];
  }

  double v14 = v138;
  double v10 = v139;
  id v12 = v142;
LABEL_5:
  v21 = (void *)[v144 copy];
  id v4 = v137;
  uint64_t v42 = v137->_constraintsByLayoutMode;
  if (!v42)
  {
    uint64_t v43 = [MEMORY[0x1E4F1CA60] dictionary];
    int64_t v44 = v137->_constraintsByLayoutMode;
    v137->_constraintsByLayoutMode = (NSMutableDictionary *)v43;

    uint64_t v42 = v137->_constraintsByLayoutMode;
  }
  v45 = [NSNumber numberWithInteger:v34];
  [(NSMutableDictionary *)v42 setObject:v21 forKeyedSubscript:v45];

  id v8 = v135;
  char v16 = v136;
LABEL_8:
  id v46 = [(SBUISystemApertureElementSource *)v4 windowScene];
  BOOL v47 = v46;
  if (v46)
  {
    uint64_t v48 = [v46 activationState];
    id v46 = v21;
    v49 = v147;
    if (v48)
    {
      if ([v47 activationState] == 1) {
        id v46 = v21;
      }
      else {
        id v46 = 0;
      }
    }
  }
  else
  {
    v49 = v147;
  }
  id v50 = v46;

  return v50;
}

- (BOOL)_wantsCenteredCustomLayout
{
  char v3 = [(SBUISystemApertureElementSource *)self systemApertureElementViewController];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  char v5 = [(SBUISystemApertureElementSource *)self systemApertureElementViewController];
  BOOL v6 = [v5 preferredCustomLayout] == 4;

  return v6;
}

- (BOOL)_handleSceneResizeAction:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(_SBUISystemApertureElementSourceAnimationContext *)self->_animationContext addSceneResizeAction:v4];
  if ([(SBUISystemApertureElementSource *)self isPresentationPossible]) {
    [(SBUISystemApertureElementSource *)self _ensureElementViewControllerIsInAWindow];
  }
  char v5 = [(SBUISystemApertureElementSource *)self _sceneSettings];
  BOOL v6 = [(SBUISystemApertureElementSource *)self systemApertureElementViewController];
  char v7 = [v6 view];

  [v7 frame];
  UISizeRoundToScale();
  double v9 = v8;
  double v11 = v10;
  objc_msgSend(v5, "SBUISA_containerViewFrame");
  UISizeRoundToScale();
  BOOL v14 = v11 == v13 && v9 == v12;
  id v15 = [v4 animationParameters];
  char v16 = [(SBUISystemApertureElementSource *)self localSceneResizeParameters];
  BOOL v17 = +[SBUISystemApertureAnimationParameters areParams:v15 equivalentTo:v16];

  if (([v4 isTransientLocal] & 1) != 0
    || ![(_SBUISystemApertureElementSourceAnimationContext *)self->_animationContext canSkipRemoteSceneResizeActions])
  {
    int v31 = 1;
  }
  else
  {
    int v18 = v14 && v17;
    uint64_t v19 = [(SBUISystemApertureElementSource *)self mutableConfiguration];
    v20 = [v19 minimalView];
    v21 = [v19 detachedMinimalView];
    double v22 = [v19 leadingView];
    double v23 = [v19 trailingView];
    if (v18 == 1)
    {
      int64_t v24 = [(SBUISystemApertureElementSource *)self layoutMode];
      if (v24 == 3)
      {
        [v22 frame];
        double v40 = v39;
        double v42 = v41;
        objc_msgSend(v5, "SBUISA_resolvedLeadingViewFrame");
        BOOL v45 = v42 == v44 && v40 == v43;
        [v23 frame];
        double v47 = v46;
        double v49 = v48;
        objc_msgSend(v5, "SBUISA_resolvedTrailingViewFrame");
        BOOL v51 = v47 == v50;
        if (v49 != v52) {
          BOOL v51 = 0;
        }
        int v31 = !v45 || !v51;
      }
      else if (v24 == 2)
      {
        [v20 frame];
        double v26 = v25;
        double v28 = v27;
        objc_msgSend(v5, "SBUISA_resolvedMinimalViewFrame");
        int v31 = v28 != v30 || v26 != v29;
        if (v21)
        {
          [v21 frame];
          double v33 = v32;
          double v35 = v34;
          objc_msgSend(v5, "SBUISA_resolvedDetachedMinimalViewFrame");
          BOOL v37 = v33 != v36;
          if (v35 != v38) {
            BOOL v37 = 1;
          }
          v31 |= v37;
        }
      }
      else
      {
        int v31 = 0;
      }
    }
    else
    {
      int v31 = 1;
    }
  }
  if (([v4 isTransientLocal] & 1) == 0)
  {
    uint64_t v53 = SBLogSystemApertureHosting();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      long long v54 = [(SBUISystemApertureElementSource *)self succinctDescription];
      BOOL v55 = [(_SBUISystemApertureElementSourceAnimationContext *)self->_animationContext canSkipRemoteSceneResizeActions];
      int v57 = 138412802;
      v58 = v54;
      __int16 v59 = 1024;
      int v60 = v31;
      __int16 v61 = 1024;
      BOOL v62 = v55;
      _os_log_impl(&dword_1A7607000, v53, OS_LOG_TYPE_DEFAULT, "Handling remote resize action for %@ will animate %{BOOL}u animationContext allows skipping: %{BOOL}u", (uint8_t *)&v57, 0x18u);
    }
  }
  if (v31) {
    [(SBUISystemApertureElementSource *)self _animateWithSceneResizeAction:v4];
  }
  else {
    [(_SBUISystemApertureElementSourceAnimationContext *)self->_animationContext removeSceneResizeAction:v4];
  }

  return v31;
}

- (void)_animateWithSceneResizeAction:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(SBUISystemApertureElementSource *)self _sceneSettings];
  BOOL v6 = [(SBUISystemApertureElementSource *)self _elementSupportsDynamicResizing];
  BOOL v43 = [(SBUISystemApertureElementSource *)self _elementRequiresConstraintBasedLayout];
  char v7 = [(SBUISystemApertureElementSource *)self mutableConfiguration];
  BOOL v45 = v6;
  [v7 setShouldDeferViewSizingPreferenceUpdates:v6];

  double v8 = [(SBUISystemApertureElementSource *)self layoutGuideRootView];
  double v9 = [(SBUISystemApertureElementSource *)self systemApertureElementViewController];
  double v10 = [v9 view];

  if ([v4 isTransientLocal])
  {
    double v11 = SBLogSystemApertureHosting();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      double v12 = [(SBUISystemApertureElementSource *)self succinctDescription];
      *(_DWORD *)buf = 138412290;
      v77 = v12;
      _os_log_impl(&dword_1A7607000, v11, OS_LOG_TYPE_DEFAULT, "Performing transient local action for %@", buf, 0xCu);
    }
  }
  double v13 = [SBUISystemApertureElementSourceAnimator alloc];
  BOOL v14 = [v4 animationParameters];
  [v10 window];
  id v15 = v39 = v10;
  char v16 = [(SBUISystemApertureElementSourceAnimator *)v13 initWithSettings:v14 window:v15];

  id v42 = objc_alloc_init(MEMORY[0x1E4F433A0]);
  [v42 _setAnimator:v16];
  BOOL v17 = [v4 animationParameters];
  objc_msgSend(v42, "_setIsAnimated:", objc_msgSend(v17, "isAnimated"));

  int v18 = [v42 _transitionCoordinator];
  uint64_t v19 = objc_alloc_init(SBUISystemApertureElementTransitionContext);
  v20 = [(SBUISystemApertureElementSource *)self systemApertureElementViewController];
  [(SBUISystemApertureElementTransitionContext *)v19 setTransitionCoordinator:v18];
  [(SBUISystemApertureElementTransitionContext *)v19 setFromLayoutMode:[(SBUISystemApertureElementSource *)self layoutModeAsFarAsClientsAreConcerned]];
  -[SBUISystemApertureElementTransitionContext setUserInitiated:](v19, "setUserInitiated:", [v4 isUserInitiated]);
  [(SBUISystemApertureElementSource *)self addTransitionContext:v19];
  objc_msgSend(v5, "SBUISA_containerViewFrame");
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v29 = objc_msgSend(v5, "SBUISA_layoutMode");
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __65__SBUISystemApertureElementSource__animateWithSceneResizeAction___block_invoke;
  v64[3] = &unk_1E5CCE658;
  uint64_t v70 = v29;
  id v30 = v20;
  id v65 = v30;
  v66 = self;
  id v67 = v5;
  id v31 = v8;
  BOOL v75 = v45;
  id v68 = v31;
  id v69 = v18;
  uint64_t v71 = v22;
  uint64_t v72 = v24;
  uint64_t v73 = v26;
  uint64_t v74 = v28;
  id v41 = v18;
  id v40 = v5;
  [(SBUISystemApertureElementSourceAnimator *)v16 addPreflightAction:v64];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __65__SBUISystemApertureElementSource__animateWithSceneResizeAction___block_invoke_2;
  v54[3] = &unk_1E5CCE680;
  BOOL v63 = v43;
  v54[4] = self;
  uint64_t v58 = v22;
  uint64_t v59 = v24;
  uint64_t v60 = v26;
  uint64_t v61 = v28;
  id v32 = v30;
  id v55 = v32;
  id v56 = v39;
  uint64_t v62 = v29;
  id v33 = v31;
  id v57 = v33;
  id v44 = v39;
  [(SBUISystemApertureElementSourceAnimator *)v16 addPreAlongsideAnimation:v54];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __65__SBUISystemApertureElementSource__animateWithSceneResizeAction___block_invoke_3;
  v50[3] = &unk_1E5CCE6A8;
  v50[4] = self;
  BOOL v51 = v19;
  id v52 = v32;
  id v34 = v4;
  id v53 = v34;
  id v35 = v32;
  double v36 = v19;
  [(SBUISystemApertureElementSourceAnimator *)v16 addPostflightAction:v50];
  [(SBUISystemApertureElementSource *)self _ensureAccessoryViewLayoutForTransitionWithAnimator:v16];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __65__SBUISystemApertureElementSource__animateWithSceneResizeAction___block_invoke_4;
  v46[3] = &unk_1E5CCE6D0;
  BOOL v49 = v45;
  v46[4] = self;
  id v47 = v33;
  id v48 = v34;
  id v37 = v34;
  id v38 = v33;
  [(SBUISystemApertureElementSourceAnimator *)v16 addPostAlongsideAnimation:v46];
  [(SBUISystemApertureElementSourceAnimator *)v16 animateTransition:v42];
}

void __65__SBUISystemApertureElementSource__animateWithSceneResizeAction___block_invoke(uint64_t a1)
{
  if (*(uint64_t *)(a1 + 72) >= 2 && objc_msgSend(*(id *)(a1 + 32), "bs_isDisappearingOrDisappeared"))
  {
    [*(id *)(a1 + 32) beginAppearanceTransition:1 animated:0];
    [*(id *)(a1 + 32) endAppearanceTransition];
  }
  id v2 = [*(id *)(a1 + 40) systemApertureElementViewController];
  [v2 setActiveLayoutMode:*(void *)(a1 + 72)];

  char v3 = [*(id *)(a1 + 40) systemApertureElementViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 48), "SBUISA_minimalViewLayoutAxis");
    BOOL v6 = [*(id *)(a1 + 40) systemApertureElementViewController];
    uint64_t v7 = [v6 minimalViewLayoutAxis];

    if (v5 != v7)
    {
      double v8 = [*(id *)(a1 + 40) systemApertureElementViewController];
      objc_msgSend(v8, "setMinimalViewLayoutAxis:", objc_msgSend(*(id *)(a1 + 48), "SBUISA_minimalViewLayoutAxis"));
    }
  }
  if (+[SBUISystemApertureLayoutGuide prepareLayoutGuidesForViewControllerIfNeeded:*(void *)(a1 + 32) onlyIfEmpty:1])
  {
    [*(id *)(a1 + 56) setNeedsLayout];
    [*(id *)(a1 + 56) layoutIfNeeded];
  }
  int v9 = *(unsigned __int8 *)(a1 + 112);
  double v10 = [*(id *)(a1 + 40) systemApertureElementViewController];
  id v11 = v10;
  if (v9) {
    [v10 viewWillLayoutSubviewsWithTransitionCoordinator:*(void *)(a1 + 64)];
  }
  else {
    objc_msgSend(v10, "viewWillTransitionToSize:withTransitionCoordinator:", *(void *)(a1 + 64), *(double *)(a1 + 96), *(double *)(a1 + 104));
  }
}

uint64_t __65__SBUISystemApertureElementSource__animateWithSceneResizeAction___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 104))
  {
    if ([*(id *)(a1 + 32) _elementSupportsDynamicResizing]
      && [*(id *)(a1 + 32) layoutMode] == 4
      && ([*(id *)(a1 + 32) mutableConfiguration],
          id v2 = objc_claimAutoreleasedReturnValue(),
          uint64_t v3 = [v2 preferredCustomLayout],
          v2,
          !v3))
    {
      CGFloat v9 = *(double *)(a1 + 64);
      double v8 = *(double *)(a1 + 72);
      double v10 = [*(id *)(a1 + 32) mutableConfiguration];
      [v10 preferredContentSizeClampedToMaximumExpandedSize];
      CGFloat v12 = v11;
      double v14 = v13;

      id v15 = [*(id *)(a1 + 40) parentViewController];
      char v16 = [v15 view];
      BOOL v17 = objc_msgSend(v16, "SBUISA_systemApertureObstructedAreaLayoutGuide");
      [v17 layoutFrame];
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v24;

      v30.origin.x = v9;
      v30.origin.y = v8;
      v30.size.width = v12;
      double v26 = v12;
      v30.size.height = v14;
      CGRectGetWidth(v30);
      v31.origin.x = v19;
      v31.origin.y = v21;
      v31.size.width = v23;
      v31.size.height = v25;
      CGRectGetWidth(v31);
      v32.origin.x = v19;
      v32.origin.y = v21;
      v32.size.width = v23;
      v32.size.height = v25;
      double MinX = CGRectGetMinX(v32);
      UIRoundToScale();
      objc_msgSend(*(id *)(a1 + 48), "setFrame:", MinX - v28, v8, v26, v14);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
    }
  }
  [*(id *)(a1 + 32) _activateConstraintsForActiveLayoutModeIfNeeded:*(void *)(a1 + 96)];
  BOOL v4 = +[SBUISystemApertureLayoutGuide prepareLayoutGuidesForViewControllerIfNeeded:*(void *)(a1 + 40) onlyIfEmpty:0];
  if (*(unsigned char *)(a1 + 104)) {
    BOOL v5 = !v4;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    [*(id *)(a1 + 56) setNeedsLayout];
    [*(id *)(a1 + 56) layoutIfNeeded];
  }
  uint64_t result = [*(id *)(a1 + 32) _elementSupportsDynamicResizing];
  if (result)
  {
    [*(id *)(a1 + 32) _updateTraitCollectionForElementIfNeeded];
    uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 160);
    return [v7 performPendingCoordinatedAnimations];
  }
  return result;
}

uint64_t __65__SBUISystemApertureElementSource__animateWithSceneResizeAction___block_invoke_3(uint64_t a1, int a2)
{
  [*(id *)(a1 + 32) removeTransitionContext:*(void *)(a1 + 40)];
  BOOL v4 = *(void **)(a1 + 32);
  if (a2)
  {
    [v4 _performElementUpdate];
    uint64_t result = [*(id *)(a1 + 32) layoutMode];
    if (result <= 1)
    {
      uint64_t result = objc_msgSend(*(id *)(a1 + 48), "bs_isAppearingOrAppeared");
      if (result)
      {
        [*(id *)(a1 + 48) beginAppearanceTransition:0 animated:0];
        BOOL v6 = *(void **)(a1 + 48);
        return [v6 endAppearanceTransition];
      }
    }
  }
  else
  {
    uint64_t v7 = [v4 mutableConfiguration];
    [v7 setShouldDeferViewSizingPreferenceUpdates:0];

    [*(id *)(*(void *)(a1 + 32) + 160) removeSceneResizeAction:*(void *)(a1 + 56)];
    double v8 = *(void **)(*(void *)(a1 + 32) + 160);
    return [v8 disableSkippingSceneResizeActions];
  }
  return result;
}

uint64_t __65__SBUISystemApertureElementSource__animateWithSceneResizeAction___block_invoke_4(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) mutableConfiguration];
  [v2 setShouldDeferViewSizingPreferenceUpdates:0];

  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v3 = [*(id *)(a1 + 32) mutableConfiguration];
    BOOL v4 = [v3 leadingView];
    [v4 setNeedsLayout];

    BOOL v5 = [*(id *)(a1 + 32) mutableConfiguration];
    BOOL v6 = [v5 trailingView];
    [v6 setNeedsLayout];

    uint64_t v7 = [*(id *)(a1 + 32) mutableConfiguration];
    double v8 = [v7 minimalView];
    [v8 setNeedsLayout];

    CGFloat v9 = [*(id *)(a1 + 32) mutableConfiguration];
    double v10 = [v9 detachedMinimalView];
    [v10 setNeedsLayout];

    double v11 = [*(id *)(a1 + 32) mutableConfiguration];
    CGFloat v12 = [v11 elementViewController];
    double v13 = [v12 view];
    [v13 setNeedsLayout];

    double v14 = [*(id *)(a1 + 32) mutableConfiguration];
    id v15 = [v14 elementViewController];
    char v16 = [v15 view];
    [v16 updateConstraintsIfNeeded];

    [*(id *)(a1 + 40) setNeedsLayout];
    [*(id *)(a1 + 40) layoutIfNeeded];
    [*(id *)(*(void *)(a1 + 32) + 160) removeSceneResizeAction:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 32) + 160) performPendingCoordinatedAnimations];
    int v17 = [*(id *)(a1 + 32) _performElementUpdate];
    uint64_t result = [*(id *)(a1 + 48) isTransientLocal];
    if (result)
    {
      CGFloat v19 = SBLogSystemApertureHosting();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        double v20 = [*(id *)(a1 + 32) succinctDescription];
        v23[0] = 67109378;
        v23[1] = v17;
        __int16 v24 = 2112;
        CGFloat v25 = v20;
        _os_log_impl(&dword_1A7607000, v19, OS_LOG_TYPE_DEFAULT, "didUpdate %{BOOL}u for transient local action for %@", (uint8_t *)v23, 0x12u);
      }
      CGFloat v21 = *(void **)(*(void *)(a1 + 32) + 160);
      if (v17) {
        return [v21 noteIsExpectingRemoteSceneResizeAction];
      }
      else {
        return [v21 disableSkippingSceneResizeActions];
      }
    }
  }
  else
  {
    [*(id *)(a1 + 40) setNeedsLayout];
    double v22 = *(void **)(a1 + 40);
    return [v22 layoutIfNeeded];
  }
  return result;
}

- (void)_ensureAccessoryViewLayoutForTransitionWithAnimator:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBUISystemApertureElementSource *)self mutableConfiguration];
  BOOL v6 = [(SBUISystemApertureElementSource *)self systemApertureElement];
  uint64_t v7 = [v6 view];

  CGRect v31 = [v5 minimalView];
  double v8 = [v5 detachedMinimalView];
  CGRect v30 = [v5 leadingView];
  CGFloat v9 = [v5 trailingView];
  if ([v7 effectiveUserInterfaceLayoutDirection]) {
    [v5 leadingView];
  }
  else {
  double v10 = [v5 trailingView];
  }
  if ([(SBUISystemApertureElementSource *)self _elementSupportsDynamicResizing]
    && ![(SBUISystemApertureElementSource *)self _elementRequiresConstraintBasedLayout])
  {
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke;
    v58[3] = &unk_1E5CCE6F8;
    v58[4] = self;
    id v59 = v7;
    id v60 = v10;
    uint64_t v29 = v9;
    double v11 = (void *)MEMORY[0x1AD0CF1C0](v58);
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_2;
    v52[3] = &unk_1E5CCE720;
    id v57 = v11;
    id v12 = v31;
    id v53 = v12;
    id v13 = v8;
    id v54 = v13;
    uint64_t v27 = v10;
    id v14 = v30;
    id v55 = v14;
    double v28 = v7;
    id v15 = v29;
    id v56 = v15;
    id v16 = v11;
    int v17 = (void *)MEMORY[0x1AD0CF1C0](v52);
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_3;
    v46[3] = &unk_1E5CCE770;
    v46[4] = self;
    id v47 = v12;
    id v48 = v13;
    id v18 = v14;
    double v10 = v27;
    id v49 = v18;
    id v19 = v15;
    uint64_t v7 = v28;
    id v50 = v19;
    id v20 = v17;
    CGFloat v9 = v29;
    id v21 = v20;
    id v51 = v20;
    [v4 addPreAlongsideAnimation:v46];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_5;
    v44[3] = &unk_1E5CCCDF0;
    v44[4] = self;
    id v45 = v21;
    id v22 = v21;
    [v4 addPostAlongsideAnimation:v44];
  }
  if (![(SBUISystemApertureElementSource *)self _elementSupportsDynamicResizing])
  {
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_6;
    v39[3] = &unk_1E5CCE798;
    v39[4] = self;
    id v40 = v31;
    id v41 = v8;
    id v42 = v30;
    id v43 = v9;
    CGFloat v23 = (void *)MEMORY[0x1AD0CF1C0](v39);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_7;
    v37[3] = &unk_1E5CCCDF0;
    id v24 = v23;
    v37[4] = self;
    id v38 = v24;
    [v4 addPreAlongsideAnimation:v37];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_8;
    v35[3] = &unk_1E5CCCDF0;
    v35[4] = self;
    id v36 = v24;
    id v25 = v24;
    [v4 addPostAlongsideAnimation:v35];
  }
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_9;
  v32[3] = &unk_1E5CCC878;
  id v33 = v8;
  id v34 = self;
  id v26 = v8;
  [v4 addPreAlongsideAnimation:v32];
}

void __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v35 = a2;
  BOOL v5 = [*(id *)(a1 + 32) mutableConfiguration];
  [v5 maximumAccessoryViewSizeForLayoutMode:a3];
  double v7 = v6;
  double v9 = v8;

  double v10 = *(void **)(a1 + 40);
  [v35 bounds];
  objc_msgSend(v10, "convertRect:fromView:", v35);
  double v12 = v11;
  double v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v35, "sizeThatFits:forLayoutMode:", a3, v7, v9);
  }
  else {
    objc_msgSend(v35, "sizeThatFits:", v7, v9);
  }
  double v21 = v19;
  double v22 = v20;
  CGFloat v23 = v35;
  if (*(id *)(a1 + 48) == v35)
  {
    v37.origin.x = v12;
    v37.origin.y = v14;
    v37.size.width = v16;
    v37.size.height = v18;
    double MaxX = CGRectGetMaxX(v37);
    v38.origin.x = v12;
    v38.origin.y = v14;
    v38.size.width = v21;
    v38.size.height = v22;
    CGFloat v25 = CGRectGetMaxX(v38);
    CGFloat v23 = v35;
    double v12 = v12 + MaxX - v25;
  }
  id v26 = [v23 superview];
  objc_msgSend(v26, "convertRect:fromView:", *(void *)(a1 + 40), v12, v14, v21, v22);
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;

  objc_msgSend(v35, "setFrame:", v28, v30, v32, v34);
}

uint64_t __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_2(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  if (a2 == 3 || a2 == 2)
  {
    (*(void (**)(void))(*(void *)(result + 64) + 16))();
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(v2 + 64) + 16);
    return v3();
  }
  return result;
}

void __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F42FF0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_4;
  v4[3] = &unk_1E5CCE748;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  [v2 performWithoutAnimation:v4];
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), [*(id *)(a1 + 32) layoutMode]);
}

uint64_t __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) layoutMode];
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2 == 2)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    [*(id *)(a1 + 32) anchorFrameForMinimalView];
    objc_msgSend(v3, "_ensureAccessoryView:hasLayoutFrame:", v4);
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
    [v5 anchorFrameForDetachedMinimalView];
  }
  else
  {
    if ([*(id *)(a1 + 32) layoutMode] != 3) {
      goto LABEL_6;
    }
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 56);
    [v7 anchorFrameForLeadingView];
    objc_msgSend(v7, "_ensureAccessoryView:hasLayoutFrame:", v8);
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 64);
    [v5 anchorFrameForTrailingView];
  }
  objc_msgSend(v5, "_ensureAccessoryView:hasLayoutFrame:", v6);
LABEL_6:
  double v9 = *(void **)(a1 + 48);
  BOOL v10 = [*(id *)(a1 + 32) layoutMode] != 2;
  return [v9 setHidden:v10];
}

uint64_t __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) layoutMode];
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

void *__87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_6(void *result, uint64_t a2)
{
  uint64_t v2 = result;
  if (a2 == 3)
  {
    id v7 = (void *)result[4];
    uint64_t v8 = result[7];
    [v7 anchorFrameForLeadingView];
    objc_msgSend(v7, "_ensureAccessoryView:hasLayoutFrame:", v8);
    id v5 = (void *)v2[4];
    uint64_t v6 = v2[8];
    [v5 anchorFrameForTrailingView];
  }
  else
  {
    if (a2 != 2) {
      return result;
    }
    uint64_t v3 = (void *)result[4];
    uint64_t v4 = result[5];
    [v3 anchorFrameForMinimalView];
    objc_msgSend(v3, "_ensureAccessoryView:hasLayoutFrame:", v4);
    id v5 = (void *)v2[4];
    uint64_t v6 = v2[6];
    [v5 anchorFrameForDetachedMinimalView];
  }
  return objc_msgSend(v5, "_ensureAccessoryView:hasLayoutFrame:", v6);
}

uint64_t __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_7(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) layoutMode];
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

uint64_t __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) layoutMode];
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

uint64_t __87__SBUISystemApertureElementSource__ensureAccessoryViewLayoutForTransitionWithAnimator___block_invoke_9(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  BOOL v2 = [*(id *)(a1 + 40) layoutMode] != 2;
  return [v1 setHidden:v2];
}

- (void)_handleAlertingAction:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [(NSMutableArray *)self->_alertingAssertionsAwaitingActions count];
  alertingAssertionsAwaitingActions = self->_alertingAssertionsAwaitingActions;
  if (v6 < 2)
  {
    [(NSMutableArray *)alertingAssertionsAwaitingActions removeAllObjects];
    if ([(SBUISystemApertureAssertion *)self->_alertingAssertion isValid])
    {
      double v9 = [(_SBUISystemApertureAlertingAssertion *)self->_alertingAssertion alertingAction];

      if (v9)
      {
        BOOL v10 = [MEMORY[0x1E4F28B00] currentHandler];
        [v10 handleFailureInMethod:a2, self, @"SBUISystemApertureElementSource.m", 1279, @"Alerting assertion already has an alerting action: %@", self->_alertingAssertion object file lineNumber description];
      }
      [(_SBUISystemApertureAlertingAssertion *)self->_alertingAssertion setAlertingAction:v5];
    }
    else
    {
      [v5 invalidateWithReason:@"no alerting assertion"];
    }
  }
  else
  {
    [(NSMutableArray *)alertingAssertionsAwaitingActions removeObjectAtIndex:0];
    uint64_t v8 = SBLogSystemApertureHosting();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7607000, v8, OS_LOG_TYPE_DEFAULT, "_handleAlertingAction: Ignoring this action because we have an invalid assertion awaiting action.", buf, 2u);
    }
  }
}

- (void)_ensureAccessoryView:(id)a3 hasLayoutFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  BOOL v10 = [(SBUISystemApertureElementSource *)self systemApertureElementViewController];
  double v11 = [v10 view];

  if (([v9 isDescendantOfView:v11] & 1) == 0) {
    [v11 addSubview:v9];
  }
  [v9 setAlpha:1.0];
  [v9 setHidden:0];
  if ([v9 translatesAutoresizingMaskIntoConstraints])
  {
    double v12 = [(SBUISystemApertureElementSource *)self windowScene];
    double v13 = [v12 coordinateSpace];
    double v14 = [v9 superview];
    objc_msgSend(v13, "convertRect:toCoordinateSpace:", v14, x, y, width, height);
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    [v9 setAutoresizingMask:0];
    long long v23 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v24[0] = *MEMORY[0x1E4F1DAB8];
    v24[1] = v23;
    v24[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v9 setTransform:v24];
    objc_msgSend(v9, "setFrame:", v16, v18, v20, v22);
    [v9 setNeedsLayout];
  }
}

- (void)_updateTraitCollectionForElementIfNeeded
{
  v22[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SBUISystemApertureElementSource *)self systemApertureElement];
  uint64_t v4 = [v3 traitCollection];
  id v5 = [(SBUISystemApertureElementSource *)self containerViewController];
  uint64_t v6 = [v5 overrideTraitCollectionForChildViewController:v3];
  id v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = (void *)v6;
  }
  else {
    uint64_t v8 = v4;
  }
  id v9 = v8;

  BOOL v10 = [(SBUISystemApertureElementSource *)self containerViewController];
  double v11 = [v10 traitCollection];

  double v12 = objc_msgSend(v11, "sbui_preferredContentSizeCategoryAllowingTraitsForCustomLayoutMode:", -[SBUISystemApertureElementSource layoutMode](self, "layoutMode") == 4);
  double v13 = [v4 preferredContentSizeCategory];
  if (BSEqualStrings())
  {
    uint64_t v14 = [v4 userInterfaceStyle];

    if (v14 == 2) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  uint64_t v15 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:2];
  double v16 = (void *)v15;
  if (v9)
  {
    double v17 = (void *)MEMORY[0x1E4F42F80];
    double v18 = objc_msgSend(MEMORY[0x1E4F42F80], "traitCollectionWithPreferredContentSizeCategory:", v12, v9, v15);
    v22[2] = v18;
    double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
    uint64_t v20 = [v17 traitCollectionWithTraitsFromCollections:v19];

    double v21 = [(SBUISystemApertureElementSource *)self containerViewController];
    [v21 setOverrideTraitCollection:v20 forChildViewController:v3];

    id v9 = (id)v20;
  }

LABEL_11:
}

- (void)_updateElementCanRequestAlertingAssertion
{
  id v3 = [(SBUISystemApertureElementSource *)self systemApertureElementViewController];
  if ([(SBUISystemApertureElementSource *)self elementCanRequestAlertingAssertion]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "setCanRequestAlertingAssertion:", -[SBUISystemApertureElementSource elementCanRequestAlertingAssertion](self, "elementCanRequestAlertingAssertion"));
  }
}

- (void)_windowDidAttachToContext:(id)a3
{
  uint64_t v4 = [a3 object];
  id v5 = [(SBUISystemApertureElementSource *)self systemApertureElement];
  uint64_t v6 = [v5 view];
  id v7 = [v6 window];
  int v8 = [v4 isEqual:v7];

  if (v8)
  {
    [(SBUISystemApertureElementSource *)self setElementNeedsUpdate];
  }
}

- (void)registerWithScene:(id)a3
{
  id v4 = a3;
  [(SBUISystemApertureElementSource *)self unregisterFromScene];
  [v4 _registerSceneComponent:self forKey:@"SBUISystemApertureElementSourceKey"];
}

- (void)unregisterFromScene
{
  id v2 = [(SBUISystemApertureElementSource *)self _scene];
  [v2 _unregisterSceneComponentForKey:@"SBUISystemApertureElementSourceKey"];
}

- (void)addObserver:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(SBUISystemApertureElementSource *)self _observers];

    if (!v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      observers = self->__observers;
      self->__observers = v6;
    }
    id v8 = [(SBUISystemApertureElementSource *)self _observers];
    [v8 addObject:v4];
  }
}

- (void)removeObserver:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    id v4 = [(SBUISystemApertureElementSource *)self _observers];
    [v4 removeObject:v8];
  }
  id v5 = [(SBUISystemApertureElementSource *)self _observers];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
    observers = self->__observers;
    self->__observers = 0;
  }
}

- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void))a4;
  if ([(NSHashTable *)self->__observers count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = [(SBUISystemApertureElementSource *)self _observers];
    id v7 = (void *)[v6 copy];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * v11);
          if (objc_opt_respondsToSelector()) {
            v5[2](v5, v12);
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (BOOL)isBeingRemoved
{
  id v2 = [(SBUISystemApertureElementSource *)self _sceneSettings];
  char v3 = objc_msgSend(v2, "SBUISA_isBeingRemoved");

  return v3;
}

- (BOOL)_mustHaveUniqueElementIdentity
{
  if ([(SBUISystemApertureElementSource *)self isBeingRemoved]
    || [(SBUISystemApertureElementSource *)self layoutMode] == -1)
  {
    return 0;
  }
  char v3 = [(SBUISystemApertureElementSource *)self systemApertureElement];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)_elementIdentifierIfExists
{
  char v3 = [(SBUISystemApertureElementSource *)self mutableConfiguration];
  BOOL v4 = [v3 elementIdentifier];

  if (!v4)
  {
    id v5 = [(SBUISystemApertureElementSource *)self systemApertureElement];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(SBUISystemApertureElementSource *)self systemApertureElement];
      BOOL v4 = [v7 elementIdentifier];
    }
    else
    {
      BOOL v4 = 0;
    }
  }
  return v4;
}

- (void)_handleClientErrorNonUniqueElementAction
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 _elementIdentifierIfExists];
  BOOL v4 = (void *)v3;
  id v5 = @"Default/Inferred";
  if (v3) {
    id v5 = (__CFString *)v3;
  }
  int v6 = 138543362;
  id v7 = v5;
  _os_log_error_impl(&dword_1A7607000, a2, OS_LOG_TYPE_ERROR, "*** Client SPI Misuse: Invalid attempt to post two elements in jindo with the same elementIdentifier, << %{public}@ >>. If the elements are functionally equivalent, never post a duplicate element. If they are functionally distinct, talk with SpringBoard about providing a unique elementIdentifier for your functional use case. ***", (uint8_t *)&v6, 0xCu);
}

- (void)_sendActionForCommand:(int64_t)a3
{
  BOOL v4 = (void *)MEMORY[0x1E4F1CAD0];
  int v6 = [[SBUISystemApertureSceneAction alloc] initWithCommand:a3];
  id v5 = [v4 setWithObject:v6];
  [(SBUISystemApertureElementSource *)self _sendActions:v5];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (NSString)description
{
  return (NSString *)[(SBUISystemApertureElementSource *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  id v2 = [(SBUISystemApertureElementSource *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBUISystemApertureElementSource *)self descriptionBuilderWithMultilinePrefix:a3];
  BOOL v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(SBUISystemApertureElementSource *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__SBUISystemApertureElementSource_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E5CCC878;
  id v6 = v5;
  id v10 = v6;
  uint64_t v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __73__SBUISystemApertureElementSource_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) windowScene];
  id v4 = [v3 _FBSScene];
  id v5 = [v4 identifier];
  [v2 appendString:v5 withName:@"sceneIdentifier"];

  id v6 = *(void **)(a1 + 32);
  SBUISystemApertureLayoutModeDescription([*(id *)(a1 + 40) layoutMode]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v6 appendString:v7 withName:@"layoutMode"];
}

- (SBUISystemApertureElementProviding)systemApertureElementViewControllerProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemApertureElementViewControllerProvider);
  return (SBUISystemApertureElementProviding *)WeakRetained;
}

- (BOOL)isPresentationPossible
{
  return self->_presentationPossible;
}

- (UIWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (UIWindowScene *)WeakRetained;
}

- (void)setWindowScene:(id)a3
{
}

- (UIWindow)systemApertureOwnedWindow
{
  return self->_systemApertureOwnedWindow;
}

- (void)setSystemApertureOwnedWindow:(id)a3
{
}

- (SBUISystemApertureElement)_elementViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__elementViewController);
  return (SBUISystemApertureElement *)WeakRetained;
}

- (void)set_elementViewController:(id)a3
{
}

- (BSSettings)lastKnownOtherSettings
{
  return self->_lastKnownOtherSettings;
}

- (NSHashTable)_observers
{
  return self->__observers;
}

- (void)set_observers:(id)a3
{
}

- (NSMutableArray)transitionContexts
{
  return self->_transitionContexts;
}

- (int64_t)layoutModeAsFarAsClientsAreConcerned
{
  return self->_layoutModeAsFarAsClientsAreConcerned;
}

- (void)setLayoutModeAsFarAsClientsAreConcerned:(int64_t)a3
{
  self->_layoutModeAsFarAsClientsAreConcerned = a3;
}

- (BOOL)elementHasMenuPresentation
{
  return self->_elementHasMenuPresentation;
}

- (void)setElementHasMenuPresentation:(BOOL)a3
{
  self->_elementHasMenuPresentation = a3;
}

- (NSArray)_activeConstraintsForLayoutMode
{
  return self->__activeConstraintsForLayoutMode;
}

- (void)set_activeConstraintsForLayoutMode:(id)a3
{
}

- (NSLayoutConstraint)_maximumLeadingViewWidthConstraint
{
  return self->__maximumLeadingViewWidthConstraint;
}

- (void)set_maximumLeadingViewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)_maximumTrailingViewWidthConstraint
{
  return self->__maximumTrailingViewWidthConstraint;
}

- (void)set_maximumTrailingViewWidthConstraint:(id)a3
{
}

- (SBUIDependencyGestureRecognizer)dependencyGestureRecognizer
{
  return self->_dependencyGestureRecognizer;
}

- (void)setDependencyGestureRecognizer:(id)a3
{
}

- (_SBUISystemApertureAlertingAssertion)_alertingAssertion
{
  return self->_alertingAssertion;
}

- (void)_setAlertingAssertion:(id)a3
{
}

- (NSMutableArray)alertingAssertionsAwaitingActions
{
  return self->_alertingAssertionsAwaitingActions;
}

- (BOOL)elementCanRequestAlertingAssertion
{
  return self->_elementCanRequestAlertingAssertion;
}

- (void)setElementCanRequestAlertingAssertion:(BOOL)a3
{
  self->_elementCanRequestAlertingAssertion = a3;
}

- (SBUISystemApertureAnimationParameters)localSceneResizeParameters
{
  return self->_localSceneResizeParameters;
}

- (void)setLocalSceneResizeParameters:(id)a3
{
}

- (_SBUISystemApertureElementSourceAnimationContext)animationContext
{
  return self->_animationContext;
}

- (NSSet)openSources
{
  return self->_openSources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openSources, 0);
  objc_storeStrong((id *)&self->_animationContext, 0);
  objc_storeStrong((id *)&self->_localSceneResizeParameters, 0);
  objc_storeStrong((id *)&self->_alertingAssertionsAwaitingActions, 0);
  objc_storeStrong((id *)&self->_alertingAssertion, 0);
  objc_storeStrong((id *)&self->_dependencyGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__maximumTrailingViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->__maximumLeadingViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->__activeConstraintsForLayoutMode, 0);
  objc_storeStrong((id *)&self->_transitionContexts, 0);
  objc_storeStrong((id *)&self->__observers, 0);
  objc_storeStrong((id *)&self->_lastKnownOtherSettings, 0);
  objc_destroyWeak((id *)&self->__elementViewController);
  objc_storeStrong((id *)&self->_systemApertureOwnedWindow, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_mutableConfiguration, 0);
  objc_destroyWeak((id *)&self->_systemApertureElementViewControllerProvider);
  objc_storeStrong((id *)&self->_constraintsByLayoutMode, 0);
}

@end