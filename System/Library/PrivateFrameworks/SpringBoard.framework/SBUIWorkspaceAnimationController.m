@interface SBUIWorkspaceAnimationController
- (SBUIWorkspaceAnimationController)initWithTransitionContextProvider:(id)a3;
- (SBUIWorkspaceAnimationController)initWithWorkspaceTransitionRequest:(id)a3;
@end

@implementation SBUIWorkspaceAnimationController

- (SBUIWorkspaceAnimationController)initWithWorkspaceTransitionRequest:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBUIWorkspaceAnimationController;
  return [(SBUIAnimationController *)&v4 initWithTransitionContextProvider:a3];
}

- (SBUIWorkspaceAnimationController)initWithTransitionContextProvider:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3A8];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v4 raise:v5, @"%s is not a valid initializer. You must call -[%@ initWithWorkspaceTransitionRequest:].", "-[SBUIWorkspaceAnimationController initWithTransitionContextProvider:]", v7 format];

  return [(SBUIWorkspaceAnimationController *)self initWithWorkspaceTransitionRequest:0];
}

@end