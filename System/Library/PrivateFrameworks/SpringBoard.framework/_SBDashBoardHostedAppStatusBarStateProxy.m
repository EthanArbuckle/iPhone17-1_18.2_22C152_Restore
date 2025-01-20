@interface _SBDashBoardHostedAppStatusBarStateProxy
- (BOOL)_suppressInheritedPartStyles;
- (SBDashBoardHostedAppViewController)hostedAppVCBackReference;
- (double)_statusBarAlpha;
- (int64_t)_fallbackInterfaceOrientation;
- (void)setHostedAppVCBackReference:(id)a3;
@end

@implementation _SBDashBoardHostedAppStatusBarStateProxy

- (int64_t)_fallbackInterfaceOrientation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostedAppVCBackReference);
  int64_t v3 = [WeakRetained contentInterfaceOrientation];

  return v3;
}

- (BOOL)_suppressInheritedPartStyles
{
  if (_suppressInheritedPartStyles_onceToken != -1) {
    dispatch_once(&_suppressInheritedPartStyles_onceToken, &__block_literal_global_263);
  }
  return _suppressInheritedPartStyles_sAllowSplitView;
}

- (double)_statusBarAlpha
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostedAppVCBackReference);
  v4 = [WeakRetained _appViewController];

  if (v4)
  {
    [v4 statusBarAlpha];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_SBDashBoardHostedAppStatusBarStateProxy;
    [(SBDeviceApplicationSceneStatusBarStateProxy *)&v8 _statusBarAlpha];
  }
  double v6 = v5;

  return v6;
}

- (SBDashBoardHostedAppViewController)hostedAppVCBackReference
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostedAppVCBackReference);
  return (SBDashBoardHostedAppViewController *)WeakRetained;
}

- (void)setHostedAppVCBackReference:(id)a3
{
}

- (void).cxx_destruct
{
}

@end