@interface _UISceneHostingReconnectingActivationController
- (_UISceneHostingReconnectingActivationController)init;
- (_UISceneHostingReconnectingActivationControllerDelegate)delegate;
- (double)retryTimeout;
- (unint64_t)maxRetryCount;
- (void)_performActivationForHostingController:(id)a3;
- (void)_setupActivationInhibitor;
- (void)activationHandleDidUpdate:(id)a3 forHostingController:(id)a4;
- (void)beginManagingHostedSceneActivationUsingHandle:(id)a3 forHostingController:(id)a4;
- (void)endManagingHostedSceneActivationForHostingController:(id)a3;
- (void)hostingController:(id)a3 isMovingToParentScene:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setMaxRetryCount:(unint64_t)a3;
- (void)setRetryTimeout:(double)a3;
@end

@implementation _UISceneHostingReconnectingActivationController

- (_UISceneHostingReconnectingActivationController)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UISceneHostingReconnectingActivationController;
  v2 = [(_UISceneHostingReconnectingActivationController *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_maxRetryCount = 3;
    v2->_retryTimeout = 0.5;
    [(_UISceneHostingReconnectingActivationController *)v2 _setupActivationInhibitor];
  }
  return v3;
}

- (void)setMaxRetryCount:(unint64_t)a3
{
  if (self->_maxRetryCount != a3)
  {
    self->_maxRetryCount = a3;
    [(_UISceneHostingReconnectingActivationController *)self _setupActivationInhibitor];
  }
}

- (void)setRetryTimeout:(double)a3
{
  if (self->_retryTimeout != a3)
  {
    self->_retryTimeout = a3;
    [(_UISceneHostingReconnectingActivationController *)self _setupActivationInhibitor];
  }
}

- (void)_setupActivationInhibitor
{
  v3 = [_UISimpleTimedInhibitor alloc];
  unint64_t v4 = [(_UISceneHostingReconnectingActivationController *)self maxRetryCount];
  [(_UISceneHostingReconnectingActivationController *)self retryTimeout];
  objc_super v5 = -[_UISimpleTimedInhibitor initWithClockType:maxAttempts:inPeriod:](v3, "initWithClockType:maxAttempts:inPeriod:", 0, v4);
  activationInhibitor = self->_activationInhibitor;
  self->_activationInhibitor = v5;
}

- (void)beginManagingHostedSceneActivationUsingHandle:(id)a3 forHostingController:(id)a4
{
}

- (void)endManagingHostedSceneActivationForHostingController:(id)a3
{
  activationHandle = self->_activationHandle;
  self->_activationHandle = 0;
}

- (void)hostingController:(id)a3 isMovingToParentScene:(id)a4
{
  id v7 = a3;
  objc_storeWeak((id *)&self->_parentScene, a4);
  BOOL v6 = [(_UISceneHostingActivationHandle *)self->_activationHandle isActive];
  if (a4 && !v6) {
    [(_UISceneHostingReconnectingActivationController *)self _performActivationForHostingController:v7];
  }
}

- (void)activationHandleDidUpdate:(id)a3 forHostingController:(id)a4
{
  id v7 = a4;
  if (([a3 isActive] & 1) == 0)
  {
    if ([(_UISimpleTimedInhibitor *)self->_activationInhibitor attempt])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_parentScene);

      if (WeakRetained) {
        [(_UISceneHostingReconnectingActivationController *)self _performActivationForHostingController:v7];
      }
    }
  }
}

- (void)_performActivationForHostingController:(id)a3
{
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained
    && (objc_super v5 = WeakRetained,
        id v6 = objc_loadWeakRetained((id *)&self->_delegate),
        char v7 = objc_opt_respondsToSelector(),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = [v8 transitionerForConnectingHostingController:v10];
  }
  else
  {
    v9 = 0;
  }
  [(_UISceneHostingActivationHandle *)self->_activationHandle activate:v9];
}

- (unint64_t)maxRetryCount
{
  return self->_maxRetryCount;
}

- (double)retryTimeout
{
  return self->_retryTimeout;
}

- (_UISceneHostingReconnectingActivationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UISceneHostingReconnectingActivationControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_parentScene);
  objc_storeStrong((id *)&self->_activationInhibitor, 0);
  objc_storeStrong((id *)&self->_activationHandle, 0);
}

@end