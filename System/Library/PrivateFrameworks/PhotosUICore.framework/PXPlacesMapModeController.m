@interface PXPlacesMapModeController
- (BOOL)_toggle3DModeByAdjustingPitch:(BOOL)a3;
- (BOOL)is3DPerspectiveActive;
- (BOOL)is3DPerspectiveActiveByCheckingPitch;
- (BOOL)prefersRealisticElevationStyle;
- (BOOL)supportsPerspectiveToggling;
- (BOOL)toggle3DModeIfPossible;
- (BOOL)togglePerspectiveIfPossible;
- (PXPlacesMapModeController)init;
- (PXPlacesMapModeController)initWithMapView:(id)a3 prefersRealisticElevationStyle:(BOOL)a4;
- (PXPlacesMapView)mapView;
- (unint64_t)mapStyle;
- (void)setMapStyle:(unint64_t)a3;
@end

@implementation PXPlacesMapModeController

- (void).cxx_destruct
{
}

- (BOOL)prefersRealisticElevationStyle
{
  return self->_prefersRealisticElevationStyle;
}

- (PXPlacesMapView)mapView
{
  return self->_mapView;
}

- (BOOL)_toggle3DModeByAdjustingPitch:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PXPlacesMapModeController *)self mapView];
  BOOL v6 = [(PXPlacesMapModeController *)self supportsPerspectiveToggling];
  if (v6)
  {
    BOOL v7 = [(PXPlacesMapModeController *)self is3DPerspectiveActive];
    if ([(PXPlacesMapModeController *)self prefersRealisticElevationStyle])
    {
      v8 = [v5 preferredConfiguration];
      v9 = v8;
      uint64_t v10 = 1;
    }
    else
    {
      v8 = [v5 preferredConfiguration];
      v9 = v8;
      uint64_t v10 = !v7;
    }
    [v8 setElevationStyle:v10];

    if (v3)
    {
      double v11 = 45.0;
      if (v7) {
        double v11 = 0.0;
      }
      [v5 setPitch:v11];
    }
    else
    {
      v12 = [(PXPlacesMapModeController *)self mapView];
      v13 = v12;
      if (v7) {
        [v12 _exit3DMode];
      }
      else {
        [v12 _enter3DMode];
      }
    }
  }

  return v6;
}

- (BOOL)supportsPerspectiveToggling
{
  v2 = [(PXPlacesMapModeController *)self mapView];
  char v3 = [v2 isPitchEnabled];

  return v3;
}

- (BOOL)is3DPerspectiveActiveByCheckingPitch
{
  v2 = [(PXPlacesMapModeController *)self mapView];
  char v3 = objc_msgSend(v2, "px_isPitched");

  return v3;
}

- (BOOL)is3DPerspectiveActive
{
  v2 = [(PXPlacesMapModeController *)self mapView];
  [v2 pitch];
  BOOL v4 = v3 > 0.0;

  return v4;
}

- (unint64_t)mapStyle
{
  v2 = [(PXPlacesMapModeController *)self mapView];
  double v3 = [v2 preferredConfiguration];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v4 = 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v4 = 1;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        unint64_t v4 = 2;
      }
      else {
        unint64_t v4 = 0;
      }
    }
  }

  return v4;
}

- (void)setMapStyle:(unint64_t)a3
{
  id v8 = [(PXPlacesMapModeController *)self mapView];
  BOOL v5 = [(PXPlacesMapModeController *)self is3DPerspectiveActive];
  BOOL v6 = [(PXPlacesMapModeController *)self prefersRealisticElevationStyle];
  if (a3 > 2) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = (void *)[objc_alloc(**((Class **)&unk_1E5DCE358 + a3)) initWithElevationStyle:v6 | v5];
  }
  [v8 setPreferredConfiguration:v7];
}

- (BOOL)toggle3DModeIfPossible
{
  return [(PXPlacesMapModeController *)self _toggle3DModeByAdjustingPitch:0];
}

- (BOOL)togglePerspectiveIfPossible
{
  return [(PXPlacesMapModeController *)self _toggle3DModeByAdjustingPitch:1];
}

- (PXPlacesMapModeController)init
{
  unint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPlacesMapModeController.m", 33, @"%s is not available as initializer", "-[PXPlacesMapModeController init]");

  abort();
}

- (PXPlacesMapModeController)initWithMapView:(id)a3 prefersRealisticElevationStyle:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXPlacesMapModeController;
  id v8 = [(PXPlacesMapModeController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mapView, a3);
    v9->_prefersRealisticElevationStyle = a4;
  }

  return v9;
}

@end