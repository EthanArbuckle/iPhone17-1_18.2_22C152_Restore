@interface StatusBarSpinnerController
- (BOOL)isEnabled;
- (StatusBarSpinnerController)init;
- (void)_setProgress:(float)a3;
- (void)_setResourcesLoading:(BOOL)a3;
- (void)_updateProgressIndicator;
- (void)didFailLoadingResource:(id)a3;
- (void)didStartLoadingResource;
- (void)didStopLoadingResource;
- (void)setEnabled:(BOOL)a3;
- (void)updateProgressWithResource:(id)a3;
@end

@implementation StatusBarSpinnerController

- (StatusBarSpinnerController)init
{
  v6.receiver = self;
  v6.super_class = (Class)StatusBarSpinnerController;
  v2 = [(StatusBarSpinnerController *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_enabled = 1;
    v4 = v2;
  }

  return v3;
}

- (void)didStartLoadingResource
{
  int currentlyLoadingResourcesCount = self->_currentlyLoadingResourcesCount;
  self->_int currentlyLoadingResourcesCount = currentlyLoadingResourcesCount + 1;
  if (!currentlyLoadingResourcesCount && self->_enabled) {
    [(StatusBarSpinnerController *)self _setResourcesLoading:1];
  }
}

- (void)didStopLoadingResource
{
  int v2 = self->_currentlyLoadingResourcesCount - 1;
  self->_int currentlyLoadingResourcesCount = v2;
  if (!v2 && self->_enabled) {
    [(StatusBarSpinnerController *)self _setResourcesLoading:0];
  }
}

- (void)updateProgressWithResource:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_enabled)
  {
    id obj = v4;
    int v6 = [v4 isActive];
    v5 = obj;
    if (v6)
    {
      [obj estimatedProgress];
      float v8 = v7;
      BOOL v9 = v8 < 1.0 && v8 > 0.0;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_resourceWhoseProgressIsShown);
      if (WeakRetained == obj && ([obj isContentReady] & 1) == 0)
      {

        if (!v9) {
          goto LABEL_10;
        }
      }
      else
      {
      }
      *(float *)&double v11 = v8;
      [(StatusBarSpinnerController *)self _setProgress:v11];
LABEL_10:
      objc_storeWeak((id *)&self->_resourceWhoseProgressIsShown, obj);
      v5 = obj;
    }
  }
}

- (void)didFailLoadingResource:(id)a3
{
  if ([a3 isActive])
  {
    [(StatusBarSpinnerController *)self _setResourcesLoading:0];
  }
}

- (void)_setResourcesLoading:(BOOL)a3
{
  self->_resourcesLoading = a3;
  [(StatusBarSpinnerController *)self _updateProgressIndicator];
}

- (void)_setProgress:(float)a3
{
  self->_progress = a3;
  [(StatusBarSpinnerController *)self _updateProgressIndicator];
}

- (void)_updateProgressIndicator
{
  float progress = self->_progress;
  BOOL v3 = progress > 0.0 && progress < 1.0;
  if (v3 || self->_resourcesLoading)
  {
    if (!self->_showingProgressIndicator)
    {
      self->_showingProgressIndicator = 1;
      +[DelayedSpinner showWithDelay];
    }
  }
  else if (self->_showingProgressIndicator)
  {
    self->_showingProgressIndicator = 0;
    +[DelayedSpinner hide];
  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
}

@end