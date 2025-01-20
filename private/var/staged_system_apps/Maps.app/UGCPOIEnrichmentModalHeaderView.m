@interface UGCPOIEnrichmentModalHeaderView
- (MKMapItem)mapItem;
- (MapsThemeButton)leadingButton;
- (MapsThemeButton)trailingButton;
- (NSProgress)observedProgress;
- (UGCPOIEnrichmentModalHeaderView)initWithFrame:(CGRect)a3;
- (float)progress;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateSizeForCurrentConfiguration;
- (void)setMapItem:(id)a3;
- (void)setObservedProgress:(id)a3;
- (void)setProgress:(float)a3;
@end

@implementation UGCPOIEnrichmentModalHeaderView

- (UGCPOIEnrichmentModalHeaderView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UGCPOIEnrichmentModalHeaderView;
  v3 = -[UGCPOIEnrichmentModalHeaderView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UGCPOIEnrichmentModalHeaderView *)v3 setAccessibilityIdentifier:@"UGCPOIEnrichmentModalHeader"];
    uint64_t v5 = +[ModalCardHeaderConfiguration defaultModalCardHeaderConfiguration];
    headerConfiguration = v4->_headerConfiguration;
    v4->_headerConfiguration = (ModalCardHeaderConfiguration *)v5;

    [(UGCPOIEnrichmentModalHeaderView *)v4 _setupSubviews];
    [(UGCPOIEnrichmentModalHeaderView *)v4 _setupConstraints];
  }
  return v4;
}

- (void)_setupSubviews
{
  v3 = +[ModalCardHeaderView createModalBarButtonItem];
  leadingButton = self->_leadingButton;
  self->_leadingButton = v3;

  [(MapsThemeButton *)self->_leadingButton setAccessibilityIdentifier:@"LeadingButton"];
  uint64_t v5 = +[ModalCardHeaderView createModalBarButtonItem];
  trailingButton = self->_trailingButton;
  self->_trailingButton = v5;

  [(MapsThemeButton *)self->_trailingButton setAccessibilityIdentifier:@"TrailingButton"];
  v7 = -[UGCPOIEnrichmentHeaderView initWithFrame:]([UGCPOIEnrichmentHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  poiIconView = self->_poiIconView;
  self->_poiIconView = v7;

  [(UGCPOIEnrichmentHeaderView *)self->_poiIconView setHideSummaryText:1];
  LODWORD(v9) = 1148829696;
  [(MapsThemeButton *)self->_leadingButton setContentCompressionResistancePriority:0 forAxis:v9];
  LODWORD(v10) = 1148829696;
  [(MapsThemeButton *)self->_leadingButton setContentHuggingPriority:0 forAxis:v10];
  LODWORD(v11) = 1148813312;
  [(MapsThemeButton *)self->_trailingButton setContentCompressionResistancePriority:0 forAxis:v11];
  LODWORD(v12) = 1148813312;
  [(MapsThemeButton *)self->_trailingButton setContentHuggingPriority:0 forAxis:v12];
  if ((MapsFeature_IsEnabled_SydneyARP() & 1) == 0)
  {
    v13 = (UIProgressView *)[objc_alloc((Class)UIProgressView) initWithProgressViewStyle:1];
    progressView = self->_progressView;
    self->_progressView = v13;
  }
  [(UGCPOIEnrichmentModalHeaderView *)self _updateSizeForCurrentConfiguration];
  [(UGCPOIEnrichmentModalHeaderView *)self addSubview:self->_leadingButton];
  [(UGCPOIEnrichmentModalHeaderView *)self addSubview:self->_trailingButton];
  [(UGCPOIEnrichmentModalHeaderView *)self addSubview:self->_poiIconView];
  if ((MapsFeature_IsEnabled_SydneyARP() & 1) == 0)
  {
    v15 = self->_progressView;
    [(UGCPOIEnrichmentModalHeaderView *)self addSubview:v15];
  }
}

- (void)_updateSizeForCurrentConfiguration
{
  v3 = [(MapsThemeButton *)self->_leadingButton titleLabel];
  v4 = [(ModalCardHeaderConfiguration *)self->_headerConfiguration leadingButtonFontProvider];
  +[DynamicTypeWizard autorefreshLabel:v3 withFontProvider:v4];

  id v6 = [(MapsThemeButton *)self->_trailingButton titleLabel];
  uint64_t v5 = [(ModalCardHeaderConfiguration *)self->_headerConfiguration trailingButtonFontProvider];
  +[DynamicTypeWizard autorefreshLabel:v6 withFontProvider:v5];
}

- (void)_setupConstraints
{
  id v3 = [objc_alloc((Class)MUCompositionalStackLayoutGroup) initWithAxis:0];
  poiIconView = self->_poiIconView;
  v13[0] = self->_leadingButton;
  v13[1] = poiIconView;
  v13[2] = self->_trailingButton;
  uint64_t v5 = +[NSArray arrayWithObjects:v13 count:3];
  [v3 setArrangedLayoutItems:v5];

  [v3 setAlignment:1];
  [v3 setAlignmentBoundsContent:1];
  LODWORD(v6) = 1112276992;
  [v3 setAlignmentFittingSizePriority:v6];
  [v3 setInsets:0.0, 16.0, 0.0, 16.0];
  [v3 setSpacing:16.0];
  [v3 setPadding:self->_leadingButton forArrangedLayoutItem:14.0, 0.0, 0.0, 0.0];
  [v3 setPadding:forArrangedLayoutItem:self->_trailingButton, 14.0, 0.0, 0.0, 0.0];
  id v7 = [objc_alloc((Class)MUCompositionalStackLayoutGroup) initWithAxis:1];
  id v12 = v3;
  objc_super v8 = +[NSArray arrayWithObjects:&v12 count:1];
  [v7 setArrangedLayoutItems:v8];

  if ((MapsFeature_IsEnabled_SydneyARP() & 1) == 0) {
    [v7 addArrangedLayoutItem:self->_progressView];
  }
  id v9 = [objc_alloc((Class)MUCompositionalStackLayout) initWithContainer:self group:v7];
  id v11 = v9;
  double v10 = +[NSArray arrayWithObjects:&v11 count:1];
  +[NSLayoutConstraint _mapsui_activateLayouts:v10];
}

- (void)setMapItem:(id)a3
{
}

- (MKMapItem)mapItem
{
  return [(UGCPOIEnrichmentHeaderView *)self->_poiIconView mapItem];
}

- (void)setObservedProgress:(id)a3
{
}

- (NSProgress)observedProgress
{
  return [(UIProgressView *)self->_progressView observedProgress];
}

- (void)setProgress:(float)a3
{
}

- (float)progress
{
  [(UIProgressView *)self->_progressView progress];
  return result;
}

- (MapsThemeButton)leadingButton
{
  return self->_leadingButton;
}

- (MapsThemeButton)trailingButton
{
  return self->_trailingButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingButton, 0);
  objc_storeStrong((id *)&self->_leadingButton, 0);
  objc_storeStrong((id *)&self->_headerConfiguration, 0);
  objc_storeStrong((id *)&self->_poiIconView, 0);

  objc_storeStrong((id *)&self->_progressView, 0);
}

@end