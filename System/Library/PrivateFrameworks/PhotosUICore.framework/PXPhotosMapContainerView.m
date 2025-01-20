@interface PXPhotosMapContainerView
- (MKMapView)bodyView;
- (PXMapOptionsView)mapOptionsView;
- (void)layoutSubviews;
- (void)setBodyView:(id)a3;
- (void)setMapOptionsView:(id)a3;
- (void)updateWithConfiguration:(id)a3;
@end

@implementation PXPhotosMapContainerView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapOptionsView, 0);
  objc_storeStrong((id *)&self->_bodyView, 0);
}

- (PXMapOptionsView)mapOptionsView
{
  return self->_mapOptionsView;
}

- (MKMapView)bodyView
{
  return self->_bodyView;
}

- (void)updateWithConfiguration:(id)a3
{
  id v15 = a3;
  v4 = [v15 mapView];
  [(PXPhotosMapContainerView *)self setBodyView:v4];

  v5 = [(PXPhotosMapContainerView *)self mapOptionsView];

  if (!v5)
  {
    v6 = [v15 mapView];
    v7 = [[PXMapOptionsView alloc] initWithMapView:v6];
    [(PXPhotosMapContainerView *)self setMapOptionsView:v7];
  }
  v8 = [v15 mapOptionsViewDelegate];
  v9 = [(PXPhotosMapContainerView *)self mapOptionsView];
  [v9 setDelegate:v8];

  v10 = [(PXPhotosMapContainerView *)self mapOptionsView];
  objc_msgSend(v10, "setPerspectiveButtonState:animated:", objc_msgSend(v15, "perspectiveButtonState"), 1);

  uint64_t v11 = [v15 mapStyle];
  v12 = [(PXPhotosMapContainerView *)self mapOptionsView];
  [v12 setMapStyle:v11];

  uint64_t v13 = [v15 enableUserTrackingButton];
  v14 = [(PXPhotosMapContainerView *)self mapOptionsView];
  [v14 setEnableUserTrackingButton:v13];
}

- (void)setMapOptionsView:(id)a3
{
  v26[4] = *MEMORY[0x1E4F143B8];
  v5 = (PXMapOptionsView *)a3;
  p_mapOptionsView = &self->_mapOptionsView;
  mapOptionsView = self->_mapOptionsView;
  if (mapOptionsView != v5)
  {
    [(PXMapOptionsView *)mapOptionsView removeFromSuperview];
    objc_storeStrong((id *)&self->_mapOptionsView, a3);
    if (*p_mapOptionsView)
    {
      -[PXPhotosMapContainerView addSubview:](self, "addSubview:");
      [(PXMapOptionsView *)*p_mapOptionsView setTranslatesAutoresizingMaskIntoConstraints:0];
      v19 = (void *)MEMORY[0x1E4F28DC8];
      v24 = [(PXMapOptionsView *)*p_mapOptionsView topAnchor];
      v25 = [(PXPhotosMapContainerView *)self safeAreaLayoutGuide];
      v23 = [v25 topAnchor];
      v22 = [v24 constraintEqualToAnchor:v23 constant:8.0];
      v26[0] = v22;
      v20 = [(PXMapOptionsView *)*p_mapOptionsView trailingAnchor];
      v21 = [(PXPhotosMapContainerView *)self safeAreaLayoutGuide];
      v18 = [v21 trailingAnchor];
      v17 = [v20 constraintEqualToAnchor:v18 constant:-8.0];
      v26[1] = v17;
      v8 = [(PXMapOptionsView *)*p_mapOptionsView leadingAnchor];
      v9 = [(PXPhotosMapContainerView *)self safeAreaLayoutGuide];
      v10 = [v9 leadingAnchor];
      uint64_t v11 = [v8 constraintGreaterThanOrEqualToAnchor:v10 constant:8.0];
      v26[2] = v11;
      v12 = [(PXMapOptionsView *)*p_mapOptionsView bottomAnchor];
      uint64_t v13 = [(PXPhotosMapContainerView *)self safeAreaLayoutGuide];
      v14 = [v13 bottomAnchor];
      id v15 = [v12 constraintLessThanOrEqualToAnchor:v14 constant:-8.0];
      v26[3] = v15;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
      [v19 activateConstraints:v16];
    }
  }
}

- (void)setBodyView:(id)a3
{
  v5 = (MKMapView *)a3;
  p_bodyView = &self->_bodyView;
  bodyView = self->_bodyView;
  if (bodyView != v5)
  {
    v8 = v5;
    [(MKMapView *)bodyView removeFromSuperview];
    objc_storeStrong((id *)&self->_bodyView, a3);
    if (*p_bodyView)
    {
      -[PXPhotosMapContainerView addSubview:](self, "addSubview:");
      [(PXPhotosMapContainerView *)self sendSubviewToBack:*p_bodyView];
    }
    [(PXPhotosMapContainerView *)self setNeedsLayout];
    v5 = v8;
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosMapContainerView;
  [(PXPhotosMapContainerView *)&v3 layoutSubviews];
  [(PXPhotosMapContainerView *)self bounds];
  -[MKMapView setFrame:](self->_bodyView, "setFrame:");
}

@end