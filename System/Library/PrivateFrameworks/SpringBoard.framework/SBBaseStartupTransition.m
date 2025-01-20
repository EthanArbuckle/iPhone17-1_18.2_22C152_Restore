@interface SBBaseStartupTransition
- (SBBaseStartupTransition)initWithDestination:(unint64_t)a3 context:(id)a4;
- (SBMainWorkspace)mainWorkspace;
- (SBStartupTransitionContext)context;
- (unint64_t)destination;
- (void)_begin;
- (void)performTransitionWithCompletionBlock:(id)a3;
@end

@implementation SBBaseStartupTransition

- (SBBaseStartupTransition)initWithDestination:(unint64_t)a3 context:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBBaseStartupTransition;
  v8 = [(SBTransaction *)&v12 init];
  if (v8)
  {
    uint64_t v9 = +[SBWorkspace mainWorkspace];
    mainWorkspace = v8->_mainWorkspace;
    v8->_mainWorkspace = (SBMainWorkspace *)v9;

    v8->_destination = a3;
    objc_storeStrong((id *)&v8->_context, a4);
  }

  return v8;
}

- (void)performTransitionWithCompletionBlock:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)_begin
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  [(SBBaseStartupTransition *)self addMilestone:v4];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__SBBaseStartupTransition__begin__block_invoke;
  v7[3] = &unk_1E6AF5290;
  v7[4] = self;
  id v8 = v4;
  id v5 = v4;
  [(SBBaseStartupTransition *)self performTransitionWithCompletionBlock:v7];
  v6.receiver = self;
  v6.super_class = (Class)SBBaseStartupTransition;
  [(SBBaseStartupTransition *)&v6 _begin];
}

uint64_t __33__SBBaseStartupTransition__begin__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeMilestone:*(void *)(a1 + 40)];
}

- (SBMainWorkspace)mainWorkspace
{
  return self->_mainWorkspace;
}

- (SBStartupTransitionContext)context
{
  return self->_context;
}

- (unint64_t)destination
{
  return self->_destination;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainWorkspace, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end