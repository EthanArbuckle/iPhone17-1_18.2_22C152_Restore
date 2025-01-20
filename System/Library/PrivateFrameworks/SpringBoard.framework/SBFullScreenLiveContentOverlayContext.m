@interface SBFullScreenLiveContentOverlayContext
- (SBFullScreenLiveContentOverlayContext)initWithOverlay:(id)a3;
- (SBFullScreenSwitcherSceneLiveContentOverlay)overlay;
- (int64_t)overlayType;
@end

@implementation SBFullScreenLiveContentOverlayContext

- (int64_t)overlayType
{
  return self->_overlayType;
}

- (SBFullScreenSwitcherSceneLiveContentOverlay)overlay
{
  return self->_overlay;
}

- (SBFullScreenLiveContentOverlayContext)initWithOverlay:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBFullScreenLiveContentOverlayContext;
  v6 = [(SBFullScreenLiveContentOverlayContext *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_overlay, a3);
    v7->_overlayType = [v5 overlayType];
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end