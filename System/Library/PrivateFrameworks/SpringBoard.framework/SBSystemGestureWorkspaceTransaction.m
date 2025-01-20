@interface SBSystemGestureWorkspaceTransaction
- (BOOL)shouldSuppressMedusaKeyboardDuringGesture;
- (SBSystemGestureWorkspaceTransaction)initWithTransitionRequest:(id)a3;
- (UIGestureRecognizer)gestureRecognizer;
- (int64_t)completionType;
- (void)_begin;
- (void)_didComplete;
- (void)finishWithCompletionType:(int64_t)a3;
- (void)setGestureRecognizer:(id)a3;
@end

@implementation SBSystemGestureWorkspaceTransaction

- (SBSystemGestureWorkspaceTransaction)initWithTransitionRequest:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBSystemGestureWorkspaceTransaction;
  v3 = [(SBMainWorkspaceTransaction *)&v11 initWithTransitionRequest:a3];
  v4 = v3;
  if (v3)
  {
    v3->_completionType = 1;
    id v5 = [NSString alloc];
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    uint64_t v8 = [v5 initWithFormat:@"%@-%p", v7, v4];
    suppressionReason = v4->_suppressionReason;
    v4->_suppressionReason = (NSString *)v8;
  }
  return v4;
}

- (void)finishWithCompletionType:(int64_t)a3
{
  self->_completionType = a3;
  -[SBSystemGestureWorkspaceTransaction _finishWithCompletionType:](self, "_finishWithCompletionType:");
}

- (int64_t)completionType
{
  return self->_completionType;
}

- (void)_begin
{
  v4 = [(SBSystemGestureWorkspaceTransaction *)self gestureRecognizer];

  if (!v4)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"SBSystemGestureWorkspaceTransaction.m" lineNumber:53 description:@"Trying to _begin but I'm not tracking a system gesture"];
  }
  if ([(SBSystemGestureWorkspaceTransaction *)self shouldSuppressMedusaKeyboardDuringGesture])
  {
    id v5 = [(SBWorkspaceTransaction *)self transitionRequest];
    v6 = [v5 applicationContext];

    v7 = [v6 previousApplicationSceneEntities];
    if ((unint64_t)[v7 count] >= 2)
    {
    }
    else
    {
      uint64_t v8 = [v6 applicationSceneEntities];
      unint64_t v9 = [v8 count];

      if (v9 < 2) {
        goto LABEL_9;
      }
    }
    v10 = +[SBKeyboardSuppressionManager sharedInstance];
    suppressionReason = self->_suppressionReason;
    v12 = [(SBWorkspaceTransaction *)self transitionRequest];
    v13 = [v12 displayIdentity];
    [v10 startSuppressingKeyboardWithReason:suppressionReason predicate:0 displayIdentity:v13];

LABEL_9:
  }
  [(SBSystemGestureWorkspaceTransaction *)self _setupAnimation];
  v15.receiver = self;
  v15.super_class = (Class)SBSystemGestureWorkspaceTransaction;
  [(SBSystemGestureWorkspaceTransaction *)&v15 _begin];
  [(SBSystemGestureWorkspaceTransaction *)self _beginAnimation];
}

- (void)_didComplete
{
  v3 = +[SBKeyboardSuppressionManager sharedInstance];
  [v3 stopSuppressingKeyboardWithReason:self->_suppressionReason];

  v4.receiver = self;
  v4.super_class = (Class)SBSystemGestureWorkspaceTransaction;
  [(SBMainWorkspaceTransaction *)&v4 _didComplete];
}

- (BOOL)shouldSuppressMedusaKeyboardDuringGesture
{
  return 1;
}

- (UIGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_storeStrong((id *)&self->_suppressionReason, 0);
}

@end