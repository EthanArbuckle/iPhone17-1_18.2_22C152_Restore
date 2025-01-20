@interface SBUISystemApertureElementUnassociatedContext
+ (id)unassociatedContext;
- (BOOL)isBeingRemoved;
- (BOOL)isFallbackContext;
- (SBUISystemApertureElementTransitionContext)transitionContext;
- (id)requestAlertingAssertion;
- (id)requestAlertingAssertionWithOptions:(unint64_t)a3;
- (void)_logErrorForSelectorIfNeeded:(SEL)a3;
- (void)elementDidDismissMenu;
- (void)elementWillPresentMenu;
- (void)requestNegativeResponseAnimation;
- (void)requestTransitionToMaximumSupportedLayoutMode;
- (void)requestTransitionToPreferredLayoutMode;
- (void)setElementNeedsLayoutUpdateWithOptions:(unint64_t)a3 coordinatedAnimations:(id)a4;
- (void)setElementNeedsUpdate;
- (void)setElementNeedsUpdateWithCoordinatedAnimations:(id)a3;
@end

@implementation SBUISystemApertureElementUnassociatedContext

+ (id)unassociatedContext
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__SBUISystemApertureElementUnassociatedContext_unassociatedContext__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (unassociatedContext_onceToken != -1) {
    dispatch_once(&unassociatedContext_onceToken, block);
  }
  v2 = (void *)unassociatedContext_unassociatedContext;
  return v2;
}

uint64_t __67__SBUISystemApertureElementUnassociatedContext_unassociatedContext__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = unassociatedContext_unassociatedContext;
  unassociatedContext_unassociatedContext = (uint64_t)v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (BOOL)isFallbackContext
{
  return 1;
}

- (BOOL)isBeingRemoved
{
  return 0;
}

- (void)_logErrorForSelectorIfNeeded:(SEL)a3
{
  if (SBUIIsSystemApertureEnabled())
  {
    NSStringFromSelector(a3);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    NSLog(&cfstr_CallingSbuisys.isa, v4);
  }
}

- (void)elementDidDismissMenu
{
}

- (void)elementWillPresentMenu
{
}

- (void)requestNegativeResponseAnimation
{
}

- (void)requestTransitionToMaximumSupportedLayoutMode
{
}

- (void)requestTransitionToPreferredLayoutMode
{
}

- (void)setElementNeedsUpdateWithCoordinatedAnimations:(id)a3
{
}

- (void)setElementNeedsLayoutUpdateWithOptions:(unint64_t)a3 coordinatedAnimations:(id)a4
{
}

- (void)setElementNeedsUpdate
{
}

- (id)requestAlertingAssertionWithOptions:(unint64_t)a3
{
  return 0;
}

- (id)requestAlertingAssertion
{
  return 0;
}

- (SBUISystemApertureElementTransitionContext)transitionContext
{
  return self->transitionContext;
}

- (void).cxx_destruct
{
}

@end