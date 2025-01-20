@interface VKCameraDelegateMediator
- (BOOL)isChangingMapType;
- (VKCameraDelegateMediator)init;
- (VKMapViewCameraDelegate)cameraDelegate;
- (id)mapLayerPresentationForAnnotation:(id)a3;
- (void)mapLayerCanEnter3DModeDidChange:(BOOL)a3;
- (void)mapLayerCanZoomInDidChange:(BOOL)a3;
- (void)mapLayerCanZoomOutDidChange:(BOOL)a3;
- (void)mapLayerDidBecomePitched:(BOOL)a3;
- (void)mapLayerDidChangeRegionAnimated:(BOOL)a3;
- (void)mapLayerDidChangeVisibleRegion;
- (void)mapLayerDidFinishInitialTrackingAnimation;
- (void)mapLayerMuninAvailabilityDidChange:(int64_t)a3;
- (void)mapLayerNavigationCameraDidLeaveDefaultZoom;
- (void)mapLayerNavigationCameraDidReturnToDefaultZoom;
- (void)mapLayerNavigationCameraHasStartedPanning;
- (void)mapLayerNavigationCameraHasStoppedPanning;
- (void)mapLayerWasUnableToAnimate;
- (void)mapLayerWillAnimateToLocation:(id)a3;
- (void)mapLayerWillChangeRegionAnimated:(BOOL)a3;
- (void)mapLayerWillPerformZoomBounceAnimation;
- (void)setCameraDelegate:(id)a3;
- (void)setIsChangingMapType:(BOOL)a3;
@end

@implementation VKCameraDelegateMediator

- (void)mapLayerCanEnter3DModeDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  p_cameraDelegate = &self->_cameraDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = objc_loadWeakRetained((id *)p_cameraDelegate);
    [v7 mapLayerCanEnter3DModeDidChange:v3];
  }
}

- (void)mapLayerDidChangeVisibleRegion
{
  if (!self->_isChangingMapType)
  {
    p_cameraDelegate = &self->_cameraDelegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      id v5 = objc_loadWeakRetained((id *)p_cameraDelegate);
      [v5 mapLayerDidChangeVisibleRegion];
    }
  }
}

- (void)mapLayerDidChangeRegionAnimated:(BOOL)a3
{
  if (!self->_isChangingMapType)
  {
    unint64_t regionChangeCount = self->_regionChangeCount;
    if (regionChangeCount)
    {
      unint64_t v4 = regionChangeCount - 1;
      self->_unint64_t regionChangeCount = v4;
      if (!v4)
      {
        BOOL v5 = a3;
        p_cameraDelegate = &self->_cameraDelegate;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
        char v7 = objc_opt_respondsToSelector();

        if (v7)
        {
          id v9 = objc_loadWeakRetained((id *)p_cameraDelegate);
          [v9 mapLayerDidChangeRegionAnimated:v5];
        }
      }
    }
  }
}

- (void)mapLayerWillChangeRegionAnimated:(BOOL)a3
{
  if (!self->_isChangingMapType)
  {
    unint64_t regionChangeCount = self->_regionChangeCount;
    self->_unint64_t regionChangeCount = regionChangeCount + 1;
    if (!regionChangeCount)
    {
      BOOL v4 = a3;
      p_cameraDelegate = &self->_cameraDelegate;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
      char v6 = objc_opt_respondsToSelector();

      if (v6)
      {
        id v8 = objc_loadWeakRetained((id *)p_cameraDelegate);
        [v8 mapLayerWillChangeRegionAnimated:v4];
      }
    }
  }
}

- (VKCameraDelegateMediator)init
{
  v6.receiver = self;
  v6.super_class = (Class)VKCameraDelegateMediator;
  v2 = [(VKCameraDelegateMediator *)&v6 init];
  char v3 = v2;
  if (v2)
  {
    objc_storeWeak((id *)&v2->_cameraDelegate, 0);
    BOOL v4 = v3;
  }

  return v3;
}

- (void)setIsChangingMapType:(BOOL)a3
{
  self->_isChangingMapType = a3;
}

- (void)setCameraDelegate:(id)a3
{
}

- (VKMapViewCameraDelegate)cameraDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
  return (VKMapViewCameraDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

- (BOOL)isChangingMapType
{
  return self->_isChangingMapType;
}

- (void)mapLayerWasUnableToAnimate
{
  p_cameraDelegate = &self->_cameraDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v5 = objc_loadWeakRetained((id *)p_cameraDelegate);
    [v5 mapLayerWasUnableToAnimate];
  }
}

- (void)mapLayerWillAnimateToLocation:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  p_cameraDelegate = &self->_cameraDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v8 = objc_loadWeakRetained((id *)p_cameraDelegate);
    objc_msgSend(v8, "mapLayerWillAnimateToLocation:", var0, var1);
  }
}

- (void)mapLayerNavigationCameraDidReturnToDefaultZoom
{
  p_cameraDelegate = &self->_cameraDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v5 = objc_loadWeakRetained((id *)p_cameraDelegate);
    [v5 mapLayerNavigationCameraDidReturnToDefaultZoom];
  }
}

- (void)mapLayerNavigationCameraDidLeaveDefaultZoom
{
  p_cameraDelegate = &self->_cameraDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v5 = objc_loadWeakRetained((id *)p_cameraDelegate);
    [v5 mapLayerNavigationCameraDidLeaveDefaultZoom];
  }
}

- (void)mapLayerNavigationCameraHasStoppedPanning
{
  p_cameraDelegate = &self->_cameraDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v5 = objc_loadWeakRetained((id *)p_cameraDelegate);
    [v5 mapLayerNavigationCameraHasStoppedPanning];
  }
}

- (void)mapLayerNavigationCameraHasStartedPanning
{
  p_cameraDelegate = &self->_cameraDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v5 = objc_loadWeakRetained((id *)p_cameraDelegate);
    [v5 mapLayerNavigationCameraHasStartedPanning];
  }
}

- (void)mapLayerCanZoomOutDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  p_cameraDelegate = &self->_cameraDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = objc_loadWeakRetained((id *)p_cameraDelegate);
    [v7 mapLayerCanZoomOutDidChange:v3];
  }
}

- (void)mapLayerCanZoomInDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  p_cameraDelegate = &self->_cameraDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = objc_loadWeakRetained((id *)p_cameraDelegate);
    [v7 mapLayerCanZoomInDidChange:v3];
  }
}

- (void)mapLayerMuninAvailabilityDidChange:(int64_t)a3
{
  p_cameraDelegate = &self->_cameraDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = objc_loadWeakRetained((id *)p_cameraDelegate);
    [v7 mapLayerMuninAvailabilityDidChange:a3];
  }
}

- (void)mapLayerDidBecomePitched:(BOOL)a3
{
  BOOL v3 = a3;
  p_cameraDelegate = &self->_cameraDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = objc_loadWeakRetained((id *)p_cameraDelegate);
    [v7 mapLayerDidBecomePitched:v3];
  }
}

- (id)mapLayerPresentationForAnnotation:(id)a3
{
  id v4 = a3;
  p_cameraDelegate = &self->_cameraDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_cameraDelegate);
    id v9 = [v8 mapLayerPresentationForAnnotation:v4];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)mapLayerDidFinishInitialTrackingAnimation
{
  p_cameraDelegate = &self->_cameraDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v5 = objc_loadWeakRetained((id *)p_cameraDelegate);
    [v5 mapLayerDidFinishInitialTrackingAnimation];
  }
}

- (void)mapLayerWillPerformZoomBounceAnimation
{
  p_cameraDelegate = &self->_cameraDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v5 = objc_loadWeakRetained((id *)p_cameraDelegate);
    [v5 mapLayerWillPerformZoomBounceAnimation];
  }
}

@end