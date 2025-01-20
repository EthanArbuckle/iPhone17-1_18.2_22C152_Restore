@interface SiriUIMapTemplateView
- (SiriUIMapTemplateView)initWithDataSource:(id)a3;
- (SiriUIMapTemplateViewDelegate)delegate;
- (double)desiredHeight;
- (id)_configuredFootnoteDescriptorLabel;
- (id)_configuredFootnoteLabel;
- (id)_configuredLabel;
- (void)_handleTapGesture:(id)a3;
- (void)_mapButtonPressed:(id)a3;
- (void)_notifyDelegateOfLocationUpdateIfNeededWithPlacemark:(id)a3;
- (void)layoutSubviews;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)prepareForDismissal;
- (void)reloadData;
- (void)setDelegate:(id)a3;
@end

@implementation SiriUIMapTemplateView

- (SiriUIMapTemplateView)initWithDataSource:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)SiriUIMapTemplateView;
  v3 = [(SiriUIBaseTemplateView *)&v21 initWithDataSource:a3];
  if (v3)
  {
    v4 = (MKMapView *)objc_alloc_init(MEMORY[0x263F109A8]);
    mapView = v3->_mapView;
    v3->_mapView = v4;

    [(SiriUIMapTemplateView *)v3 addSubview:v3->_mapView];
    id v6 = objc_alloc_init(MEMORY[0x263F109E8]);
    [v6 setRepresentation:2];
    uint64_t v7 = [objc_alloc(MEMORY[0x263F109D0]) initWithAnnotation:v6 reuseIdentifier:@"SiriUIMapTemplateViewPinAnnotationViewReuseIdentifier"];
    pinAnnotationView = v3->_pinAnnotationView;
    v3->_pinAnnotationView = (MKPinAnnotationView *)v7;

    [(SiriUIMapTemplateView *)v3 addSubview:v3->_pinAnnotationView];
    uint64_t v9 = [(SiriUIMapTemplateView *)v3 _configuredFootnoteDescriptorLabel];
    footnoteDescriptorLabel = v3->_footnoteDescriptorLabel;
    v3->_footnoteDescriptorLabel = (UILabel *)v9;

    [(SiriUIMapTemplateView *)v3 addSubview:v3->_footnoteDescriptorLabel];
    uint64_t v11 = [(SiriUIMapTemplateView *)v3 _configuredFootnoteLabel];
    footnoteLabel = v3->_footnoteLabel;
    v3->_footnoteLabel = (UILabel *)v11;

    [(SiriUIMapTemplateView *)v3 addSubview:v3->_footnoteLabel];
    id v13 = objc_alloc(MEMORY[0x263F1C488]);
    uint64_t v14 = objc_msgSend(v13, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    mapButton = v3->_mapButton;
    v3->_mapButton = (UIButton *)v14;

    [(SiriUIMapTemplateView *)v3 addSubview:v3->_mapButton];
    [(UIButton *)v3->_mapButton addTarget:v3 action:sel__mapButtonPressed_ forControlEvents:64];
    uint64_t v16 = [objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:v3 action:sel__handleTapGesture_];
    tapRecognizer = v3->_tapRecognizer;
    v3->_tapRecognizer = (UITapGestureRecognizer *)v16;

    [(SiriUIMapTemplateView *)v3 addGestureRecognizer:v3->_tapRecognizer];
    v18 = (CLGeocoder *)objc_alloc_init(MEMORY[0x263F00A40]);
    geocoder = v3->_geocoder;
    v3->_geocoder = v18;

    [(SiriUIMapTemplateView *)v3 setClipsToBounds:1];
    [(SiriUIMapTemplateView *)v3 reloadData];
  }
  return v3;
}

- (void)reloadData
{
  id v18 = [(SiriUIBaseTemplateView *)self dataSource];
  [(MKMapView *)self->_mapView setDelegate:0];
  mapView = self->_mapView;
  v4 = [(MKMapView *)mapView annotations];
  [(MKMapView *)mapView removeAnnotations:v4];

  v5 = [v18 CLLocation];
  [v5 coordinate];
  double v7 = v6;
  double v9 = v8;

  -[MKMapView setRegion:animated:](self->_mapView, "setRegion:animated:", 1, v7, v9, 0.005, 0.005);
  [(MKMapView *)self->_mapView setDelegate:self];
  pinAnnotationView = self->_pinAnnotationView;
  uint64_t v11 = [(SiriUIBaseTemplateView *)self dataSource];
  v12 = [v11 pinColor];
  if (v12)
  {
    [(MKPinAnnotationView *)pinAnnotationView setPinTintColor:v12];
  }
  else
  {
    id v13 = [MEMORY[0x263F1C550] redColor];
    [(MKPinAnnotationView *)pinAnnotationView setPinTintColor:v13];
  }
  footnoteDescriptorLabel = self->_footnoteDescriptorLabel;
  v15 = [v18 footnoteDescriptor];
  [(UILabel *)footnoteDescriptorLabel setText:v15];

  footnoteLabel = self->_footnoteLabel;
  v17 = [v18 footnote];
  [(UILabel *)footnoteLabel setText:v17];

  [(SiriUIMapTemplateView *)self setNeedsLayout];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(SiriUIMapTemplateView *)self setNeedsLayout];
    v5 = obj;
  }
}

- (double)desiredHeight
{
  v2 = [(SiriUIBaseTemplateView *)self dataSource];
  BOOL v3 = [v2 mapSizeValue] == 0;

  return dbl_22323E760[v3];
}

- (void)layoutSubviews
{
  [(SiriUIMapTemplateView *)self bounds];
  double height = v31.size.height;
  double width = v31.size.width;
  double v3 = CGRectGetWidth(v31);
  uint64_t v4 = [(SiriUIMapTemplateView *)self semanticContentAttribute];
  v5 = [(SiriUIBaseTemplateView *)self templatedSuperview];
  [v5 templatedContentMargins];
  double v7 = v6;

  double v8 = [(SiriUIBaseTemplateView *)self dataSource];
  uint64_t v9 = [v8 mapSizeValue];

  v10 = [(SiriUIBaseTemplateView *)self dataSource];
  uint64_t v11 = [v10 interactive];

  [(MKMapView *)self->_mapView setDelegate:0];
  double v12 = dbl_22323E770[v9 != 1];
  -[MKMapView setFrame:](self->_mapView, "setFrame:", 0.0, 0.0, v3, v12);
  [(MKMapView *)self->_mapView setScrollEnabled:v11];
  [(MKMapView *)self->_mapView setZoomEnabled:v11];
  if (v11) {
    [(UIButton *)self->_mapButton removeFromSuperview];
  }
  else {
    [(SiriUIMapTemplateView *)self addSubview:self->_mapButton];
  }
  BOOL v13 = v9 != 1;
  -[UIButton setFrame:](self->_mapButton, "setFrame:", 0.0, 0.0, v3, v12);
  pinAnnotationView = self->_pinAnnotationView;
  [(MKPinAnnotationView *)pinAnnotationView frame];
  v32.origin.x = 0.0;
  v32.origin.y = 0.0;
  v32.size.double width = v3;
  v32.size.double height = v12;
  CGRectGetMidX(v32);
  v33.origin.x = 0.0;
  v33.origin.y = 0.0;
  v33.size.double width = v3;
  v33.size.double height = v12;
  CGRectGetMidY(v33);
  UIRectCenteredAboutPoint();
  -[MKPinAnnotationView setFrame:](pinAnnotationView, "setFrame:");
  [(UILabel *)self->_footnoteDescriptorLabel setHidden:v13];
  [(UILabel *)self->_footnoteLabel setHidden:v13];
  double v16 = height;
  double v15 = width;
  -[UILabel sizeThatFits:](self->_footnoteDescriptorLabel, "sizeThatFits:", width, height);
  double v19 = v18;
  double v20 = v3 - v18;
  double v21 = v20 - v7;
  if (v4 == 4) {
    double v22 = v20 - v7;
  }
  else {
    double v22 = v7;
  }
  -[UILabel setFrame:](self->_footnoteDescriptorLabel, "setFrame:", v22, 0.0, v19, v17, *(void *)&height, *(void *)&width);
  [(UILabel *)self->_footnoteDescriptorLabel _setLastLineBaselineFrameOriginY:308.0];
  -[UILabel sizeThatFits:](self->_footnoteLabel, "sizeThatFits:", v15, v16);
  double v25 = v24;
  double v26 = v21 + -10.0 - v24;
  if (v4 != 4) {
    double v26 = v7 + v19 + 10.0;
  }
  -[UILabel setFrame:](self->_footnoteLabel, "setFrame:", v26, 0.0, v25, v23);
  [(UILabel *)self->_footnoteLabel _setLastLineBaselineFrameOriginY:308.0];
  mapView = self->_mapView;
  [(MKMapView *)mapView setDelegate:self];
}

- (void)prepareForDismissal
{
  [(CLGeocoder *)self->_geocoder cancelGeocode];
  currentPlacemark = self->_currentPlacemark;
  [(SiriUIMapTemplateView *)self _notifyDelegateOfLocationUpdateIfNeededWithPlacemark:currentPlacemark];
}

- (void)_notifyDelegateOfLocationUpdateIfNeededWithPlacemark:(id)a3
{
  if (self->_needsToNotifyDelegateOfLocationUpdate)
  {
    id v4 = a3;
    v5 = [(SiriUIMapTemplateView *)self delegate];
    [v5 mapTemplateView:self didModifyPlacemark:v4];

    self->_needsToNotifyDelegateOfLocationUpdate = 0;
  }
}

- (id)_configuredFootnoteDescriptorLabel
{
  v2 = [(SiriUIMapTemplateView *)self _configuredLabel];
  double v3 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
  [v2 setFont:v3];

  id v4 = objc_msgSend(MEMORY[0x263F1C550], "siriui_platterSemiTransparentTextColor");
  [v2 setTextColor:v4];

  return v2;
}

- (id)_configuredFootnoteLabel
{
  v2 = [(SiriUIMapTemplateView *)self _configuredLabel];
  double v3 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2C0]];
  [v2 setFont:v3];

  return v2;
}

- (id)_configuredLabel
{
  id v2 = objc_alloc(MEMORY[0x263F1C768]);
  double v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  id v4 = objc_msgSend(MEMORY[0x263F1C550], "siriui_platterTextColor");
  [v3 setTextColor:v4];

  return v3;
}

- (void)_mapButtonPressed:(id)a3
{
  id v4 = [(SiriUIMapTemplateView *)self delegate];
  [v4 mapTemplateViewDidSelectMap:self];
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  id v5 = a3;
  self->_needsToNotifyDelegateOfLocationUpdate = 1;
  [(MKMapView *)self->_mapView centerCoordinate];
  double v8 = (void *)[objc_alloc(MEMORY[0x263F00A50]) initWithLatitude:v6 longitude:v7];
  uint64_t v9 = (CLPlacemark *)[objc_alloc(MEMORY[0x263F00AA8]) initWithLocation:v8 addressDictionary:0 region:0 areasOfInterest:0];
  currentPlacemark = self->_currentPlacemark;
  self->_currentPlacemark = v9;

  objc_initWeak(&location, self);
  geocoder = self->_geocoder;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __57__SiriUIMapTemplateView_mapView_regionDidChangeAnimated___block_invoke;
  v13[3] = &unk_26469F5E0;
  id v12 = v8;
  id v14 = v12;
  objc_copyWeak(&v16, &location);
  double v15 = self;
  [(CLGeocoder *)geocoder reverseGeocodeLocation:v12 completionHandler:v13];
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

void __57__SiriUIMapTemplateView_mapView_regionDidChangeAnimated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    double v7 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      __57__SiriUIMapTemplateView_mapView_regionDidChangeAnimated___block_invoke_cold_1(a1, (uint64_t)v6, v7);
    }
  }
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v9 = WeakRetained;
  if (v5 && WeakRetained)
  {
    uint64_t v10 = [v5 firstObject];
    id v11 = v9[58];
    v9[58] = (id)v10;

    [v9 _notifyDelegateOfLocationUpdateIfNeededWithPlacemark:v9[58]];
    id v12 = [v9 _configuredFootnoteLabel];
    BOOL v13 = [v9 _configuredFootnoteDescriptorLabel];
    id v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v15 = [v9[58] name];
    if (v15)
    {
      id v16 = (void *)v15;
      double v17 = [v14 siriUILocalizedStringForKey:@"MAP_TEMPLATE_LOCATION_DESCRIPTOR"];
    }
    else
    {
      double v18 = [v9[58] postalAddress];
      id v19 = objc_alloc_init(MEMORY[0x263EFEB38]);
      id v16 = [v19 stringFromPostalAddress:v18];
      double v17 = [v14 siriUILocalizedStringForKey:@"MAP_TEMPLATE_ADDRESS_DESCRIPTOR"];
    }
    [v12 setText:v16];
    [v9[55] frame];
    objc_msgSend(v12, "setFrame:");
    [v12 sizeToFit];
    [v12 setAlpha:0.0];
    [v13 setText:v17];
    [v9[54] frame];
    objc_msgSend(v13, "setFrame:");
    [v13 sizeToFit];
    [v13 setAlpha:0.0];
    [v9 addSubview:v12];
    [v9 addSubview:v13];
    double v20 = (void *)MEMORY[0x263F1CB60];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __57__SiriUIMapTemplateView_mapView_regionDidChangeAnimated___block_invoke_24;
    v26[3] = &unk_26469F270;
    v26[4] = v9;
    id v27 = v12;
    id v28 = v13;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __57__SiriUIMapTemplateView_mapView_regionDidChangeAnimated___block_invoke_2;
    v23[3] = &unk_26469F5B8;
    v23[4] = v9;
    id v24 = v27;
    id v25 = v28;
    id v21 = v28;
    id v22 = v27;
    [v20 animateWithDuration:0 delay:v26 usingSpringWithDamping:v23 initialSpringVelocity:0.5 options:0.0 animations:1.0 completion:0.5];
  }
}

uint64_t __57__SiriUIMapTemplateView_mapView_regionDidChangeAnimated___block_invoke_24(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 440) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:0.0];
  [*(id *)(a1 + 40) setAlpha:1.0];
  id v2 = *(void **)(a1 + 48);
  return [v2 setAlpha:1.0];
}

void __57__SiriUIMapTemplateView_mapView_regionDidChangeAnimated___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 440) removeFromSuperview];
  [*(id *)(*(void *)(a1 + 32) + 432) removeFromSuperview];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 440), *(id *)(a1 + 40));
  id v2 = *(void **)(a1 + 48);
  double v3 = (id *)(*(void *)(a1 + 32) + 432);
  objc_storeStrong(v3, v2);
}

- (void)_handleTapGesture:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  double v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[SiriUIMapTemplateView _handleTapGesture:]";
    _os_log_impl(&dword_2231EF000, v3, OS_LOG_TYPE_DEFAULT, "%s Ignoring tap", (uint8_t *)&v4, 0xCu);
  }
}

- (SiriUIMapTemplateViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriUIMapTemplateViewDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_geocoder, 0);
  objc_storeStrong((id *)&self->_currentPlacemark, 0);
  objc_storeStrong((id *)&self->_mapButton, 0);
  objc_storeStrong((id *)&self->_pinAnnotationView, 0);
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_footnoteDescriptorLabel, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
}

void __57__SiriUIMapTemplateView_mapView_regionDidChangeAnimated___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 136315651;
  id v5 = "-[SiriUIMapTemplateView mapView:regionDidChangeAnimated:]_block_invoke";
  __int16 v6 = 2113;
  uint64_t v7 = v3;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_2231EF000, log, OS_LOG_TYPE_ERROR, "%s Error reverse-geocoding location %{private}@, %{public}@", (uint8_t *)&v4, 0x20u);
}

@end