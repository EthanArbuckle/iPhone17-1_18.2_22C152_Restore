@interface SBMedusaHostedKeyboardWindowLevelAssertion
- (SBMedusaHostedKeyboardWindowLevelAssertion)initWithMedusaHostedKeyboardWindow:(id)a3 priority:(unint64_t)a4 windowLevel:(double)a5;
- (double)windowLevel;
- (unint64_t)priority;
- (void)dealloc;
- (void)invalidate;
@end

@implementation SBMedusaHostedKeyboardWindowLevelAssertion

- (SBMedusaHostedKeyboardWindowLevelAssertion)initWithMedusaHostedKeyboardWindow:(id)a3 priority:(unint64_t)a4 windowLevel:(double)a5
{
  id v8 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SBMedusaHostedKeyboardWindowLevelAssertion;
  v9 = [(SBMedusaHostedKeyboardWindowLevelAssertion *)&v22 init];
  v10 = v9;
  if (v9)
  {
    v9->_priority = a4;
    v9->_windowLevel = a5;
    objc_initWeak(&location, v9);
    objc_initWeak(&from, v8);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __102__SBMedusaHostedKeyboardWindowLevelAssertion_initWithMedusaHostedKeyboardWindow_priority_windowLevel___block_invoke;
    v17 = &unk_1E6AFFA80;
    objc_copyWeak(&v18, &from);
    objc_copyWeak(&v19, &location);
    uint64_t v11 = MEMORY[0x1D948C7A0](&v14);
    id invalidationHandler = v10->_invalidationHandler;
    v10->_id invalidationHandler = (id)v11;

    objc_msgSend(v8, "addWindowLevelAssertion:", v10, v14, v15, v16, v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __102__SBMedusaHostedKeyboardWindowLevelAssertion_initWithMedusaHostedKeyboardWindow_priority_windowLevel___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained removeWindowLevelAssertion:v2];
}

- (void)dealloc
{
  [(SBMedusaHostedKeyboardWindowLevelAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBMedusaHostedKeyboardWindowLevelAssertion;
  [(SBMedusaHostedKeyboardWindowLevelAssertion *)&v3 dealloc];
}

- (void)invalidate
{
  id invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
  if (invalidationHandler)
  {
    invalidationHandler[2](invalidationHandler, a2);
    id v4 = self->_invalidationHandler;
    self->_id invalidationHandler = 0;
  }
}

- (unint64_t)priority
{
  return self->_priority;
}

- (double)windowLevel
{
  return self->_windowLevel;
}

- (void).cxx_destruct
{
}

@end