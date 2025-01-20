@interface _SBAppContainerStatusBarStateProxy
- (SBAppContainerViewController)appVCBackReference;
- (double)_statusBarAlpha;
- (int64_t)_fallbackInterfaceOrientation;
- (int64_t)_statusBarOrientationGivenFallbackOrientation:(int64_t)a3;
- (int64_t)_statusBarStyle;
- (int64_t)_statusBarStyleForPartWithIdentifier:(id)a3 suppressingInherited:(BOOL)a4;
- (int64_t)overrideStatusBarStyle;
- (void)setAppVCBackReference:(id)a3;
@end

@implementation _SBAppContainerStatusBarStateProxy

- (int64_t)_statusBarStyle
{
  uint64_t v3 = [(_SBAppContainerStatusBarStateProxy *)self overrideStatusBarStyle];
  if (v3 == -1)
  {
    v5.receiver = self;
    v5.super_class = (Class)_SBAppContainerStatusBarStateProxy;
    return [(SBDeviceApplicationSceneStatusBarStateProxy *)&v5 _statusBarStyle];
  }
  else
  {
    return _SBStatusBarStyleFromLegacyStyle(v3);
  }
}

- (int64_t)_statusBarStyleForPartWithIdentifier:(id)a3 suppressingInherited:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(_SBAppContainerStatusBarStateProxy *)self overrideStatusBarStyle];
  if (v7 == -1)
  {
    v11.receiver = self;
    v11.super_class = (Class)_SBAppContainerStatusBarStateProxy;
    uint64_t v8 = [(SBDeviceApplicationSceneStatusBarStateProxy *)&v11 _statusBarStyleForPartWithIdentifier:v6 suppressingInherited:v4];
  }
  else
  {
    uint64_t v8 = _SBStatusBarStyleFromLegacyStyle(v7);
  }
  int64_t v9 = v8;

  return v9;
}

- (double)_statusBarAlpha
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appVCBackReference);
  BOOL v4 = [WeakRetained _applicationSceneViewController];

  if (v4)
  {
    [v4 statusBarAlpha];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_SBAppContainerStatusBarStateProxy;
    [(SBDeviceApplicationSceneStatusBarStateProxy *)&v8 _statusBarAlpha];
  }
  double v6 = v5;

  return v6;
}

- (int64_t)overrideStatusBarStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appVCBackReference);
  uint64_t v3 = [WeakRetained _applicationSceneViewController];

  if (v3) {
    int64_t v4 = [v3 overrideStatusBarStyle];
  }
  else {
    int64_t v4 = -1;
  }

  return v4;
}

- (int64_t)_statusBarOrientationGivenFallbackOrientation:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appVCBackReference);
  int64_t v6 = [WeakRetained _overrideStatusBarOrientationGivenFallbackOrientation:a3];

  if (!v6)
  {
    v8.receiver = self;
    v8.super_class = (Class)_SBAppContainerStatusBarStateProxy;
    return [(SBDeviceApplicationSceneStatusBarStateProxy *)&v8 _statusBarOrientationGivenFallbackOrientation:a3];
  }
  return v6;
}

- (int64_t)_fallbackInterfaceOrientation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appVCBackReference);
  int64_t v3 = [WeakRetained contentOrientation];

  return v3;
}

- (SBAppContainerViewController)appVCBackReference
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appVCBackReference);
  return (SBAppContainerViewController *)WeakRetained;
}

- (void)setAppVCBackReference:(id)a3
{
}

- (void).cxx_destruct
{
}

@end