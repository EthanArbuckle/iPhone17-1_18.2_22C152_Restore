@interface SBFlashlightActivityElement
- (BOOL)hasActivityBehavior;
- (BOOL)isFlashlightOn;
- (SAActivityHosting)activityHost;
- (SBFlashlightActivityElement)initWithFlashlightOn:(BOOL)a3;
- (SBFlashlightActivityElementDelegate)delegate;
- (int64_t)systemApertureLayoutCustomizingOptions;
- (void)_handleExpandedLeadingButtonAction;
- (void)setActivityHost:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFlashlightOn:(BOOL)a3;
- (void)setPreviewing:(BOOL)a3;
@end

@implementation SBFlashlightActivityElement

- (SBFlashlightActivityElement)initWithFlashlightOn:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBFlashlightActivityElement;
  return [(SBFlashlightElement *)&v4 initWithStyle:0 state:a3];
}

- (void)setFlashlightOn:(BOOL)a3
{
  if (self->_flashlightOn != a3)
  {
    self->_flashlightOn = a3;
    [(SBFlashlightElement *)self setState:a3];
  }
}

- (void)_handleExpandedLeadingButtonAction
{
  v3 = [(SBFlashlightActivityElement *)self delegate];
  [v3 flashlightActivityElementRequestsTogglingFlashlight:self];

  id v4 = [(SBSystemApertureProvidedContentElement *)self layoutHost];
  [v4 preferredLayoutModeDidInvalidateForLayoutSpecifier:self];
}

- (void)setPreviewing:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBFlashlightActivityElement;
  if ([(SBSystemApertureProvidedContentElement *)&v7 isPreviewing] != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)SBFlashlightActivityElement;
    [(SBSystemApertureProvidedContentElement *)&v6 setPreviewing:v3];
    v5 = [(SBSystemApertureProvidedContentElement *)self layoutHost];
    [v5 preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:self];
  }
}

- (BOOL)hasActivityBehavior
{
  return 1;
}

- (int64_t)systemApertureLayoutCustomizingOptions
{
  v5.receiver = self;
  v5.super_class = (Class)SBFlashlightActivityElement;
  int64_t v3 = [(SBSystemApertureProvidedContentElement *)&v5 systemApertureLayoutCustomizingOptions];
  if ([(SBSystemApertureProvidedContentElement *)self isPreviewing]) {
    return v3;
  }
  else {
    return v3 | 2;
  }
}

- (SAActivityHosting)activityHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityHost);
  return (SAActivityHosting *)WeakRetained;
}

- (void)setActivityHost:(id)a3
{
}

- (SBFlashlightActivityElementDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFlashlightActivityElementDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isFlashlightOn
{
  return self->_flashlightOn;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_activityHost);
}

@end