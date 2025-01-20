@interface PXPhotosMapContainerViewConfiguration
- (BOOL)enableUserTrackingButton;
- (BOOL)isEqual:(id)a3;
- (MKMapView)mapView;
- (PXGSingleViewLayout)weakLayout;
- (PXMapOptionsViewDelegate)mapOptionsViewDelegate;
- (PXPhotosMapContainerViewConfiguration)init;
- (PXPhotosMapContainerViewConfiguration)initWithMapView:(id)a3 mapOptionsViewDelegate:(id)a4 enableUserTrackingButton:(BOOL)a5 perspectiveButtonState:(unint64_t)a6 mapStyle:(unint64_t)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)mapStyle;
- (unint64_t)perspectiveButtonState;
- (void)setWeakLayout:(id)a3;
@end

@implementation PXPhotosMapContainerViewConfiguration

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapOptionsViewDelegate);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_destroyWeak((id *)&self->weakLayout);
}

- (unint64_t)mapStyle
{
  return self->_mapStyle;
}

- (unint64_t)perspectiveButtonState
{
  return self->_perspectiveButtonState;
}

- (BOOL)enableUserTrackingButton
{
  return self->_enableUserTrackingButton;
}

- (PXMapOptionsViewDelegate)mapOptionsViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapOptionsViewDelegate);
  return (PXMapOptionsViewDelegate *)WeakRetained;
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setWeakLayout:(id)a3
{
}

- (PXGSingleViewLayout)weakLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->weakLayout);
  return (PXGSingleViewLayout *)WeakRetained;
}

- (unint64_t)hash
{
  v2 = [(PXPhotosMapContainerViewConfiguration *)self mapView];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXPhotosMapContainerViewConfiguration *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      v8 = [(PXPhotosMapContainerViewConfiguration *)self mapView];
      v9 = [(PXPhotosMapContainerViewConfiguration *)v7 mapView];
      if ([v8 isEqual:v9]
        && (BOOL v10 = [(PXPhotosMapContainerViewConfiguration *)self enableUserTrackingButton],
            v10 == [(PXPhotosMapContainerViewConfiguration *)v7 enableUserTrackingButton])
        && (unint64_t v11 = [(PXPhotosMapContainerViewConfiguration *)self perspectiveButtonState],
            v11 == [(PXPhotosMapContainerViewConfiguration *)v7 perspectiveButtonState]))
      {
        unint64_t v12 = [(PXPhotosMapContainerViewConfiguration *)self mapStyle];
        BOOL v6 = v12 == [(PXPhotosMapContainerViewConfiguration *)v7 mapStyle];
      }
      else
      {
        BOOL v6 = 0;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [PXPhotosMapContainerViewConfiguration alloc];
  uint64_t v5 = [(PXPhotosMapContainerViewConfiguration *)self mapView];
  BOOL v6 = [(PXPhotosMapContainerViewConfiguration *)self mapOptionsViewDelegate];
  v7 = [(PXPhotosMapContainerViewConfiguration *)v4 initWithMapView:v5 mapOptionsViewDelegate:v6 enableUserTrackingButton:[(PXPhotosMapContainerViewConfiguration *)self enableUserTrackingButton] perspectiveButtonState:[(PXPhotosMapContainerViewConfiguration *)self perspectiveButtonState] mapStyle:[(PXPhotosMapContainerViewConfiguration *)self mapStyle]];

  return v7;
}

- (PXPhotosMapContainerViewConfiguration)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosMapContainerViewConfiguration.m", 35, @"%s is not available as initializer", "-[PXPhotosMapContainerViewConfiguration init]");

  abort();
}

- (PXPhotosMapContainerViewConfiguration)initWithMapView:(id)a3 mapOptionsViewDelegate:(id)a4 enableUserTrackingButton:(BOOL)a5 perspectiveButtonState:(unint64_t)a6 mapStyle:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PXPhotosMapContainerViewConfiguration;
  v15 = [(PXPhotosMapContainerViewConfiguration *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_mapView, a3);
    objc_storeWeak((id *)&v16->_mapOptionsViewDelegate, v14);
    v16->_enableUserTrackingButton = a5;
    v16->_perspectiveButtonState = a6;
    v16->_mapStyle = a7;
  }

  return v16;
}

@end