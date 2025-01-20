@interface CarMapControlsOverlay
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)configuration;
- (BOOL)isHidden;
- (BOOL)mode3DEnabled;
- (BOOL)trackingButtonEnabled;
- (BOOL)zoomInEnabled;
- (BOOL)zoomOutEnabled;
- (CarAudioControlView)audioControlView;
- (CarCameraToggleButton)cameraToggleButton;
- (CarFloatingControlsButtonView)floatingControls;
- (CarFocusableImageButton)recenterButton;
- (CarFocusableImageButton)reportIncidentButton;
- (CarMapControlsDelegate)delegate;
- (CarMapTrackingController)trackingController;
- (CarZoomButtonView)zoomControls;
- (ChromeOverlayHosting)host;
- (NSArray)focusOrderSubItems;
- (NSArray)preferredFocusEnvironments;
- (NavAudioControlViewDelegate)audioControlDelegate;
- (double)_mapControlGutterWidth;
- (id)_viewForElement:(unint64_t)a3;
- (unint64_t)audioSettings;
- (unint64_t)cameraToggleButtonState;
- (unint64_t)mode3DState;
- (void)_cameraToggleButtonPressed;
- (void)_configureContainer:(id)a3 withElement:(unint64_t)a4 preferredEdgeLocation:(unint64_t)a5 priority:(float)a6;
- (void)_navRecenterButtonPressed;
- (void)_reportIncidentButtonPressed;
- (void)audioControlView:(id)a3 didSelectAudioType:(unint64_t)a4;
- (void)audioControlView:(id)a3 willChangeSizeWithAnimation:(id)a4;
- (void)dealloc;
- (void)mode3DButtonPressed;
- (void)panButtonPressed;
- (void)reload;
- (void)setAudioControlDelegate:(id)a3;
- (void)setAudioControlView:(id)a3;
- (void)setAudioSettings:(unint64_t)a3;
- (void)setCameraToggleButton:(id)a3;
- (void)setCameraToggleButtonState:(unint64_t)a3;
- (void)setConfiguration:(id *)a3;
- (void)setConfiguration:(id *)a3 withAnimation:(id)a4;
- (void)setContentView:(id)a3 layoutGuide:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setFloatingControls:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setHost:(id)a3;
- (void)setMode3DEnabled:(BOOL)a3;
- (void)setMode3DState:(unint64_t)a3;
- (void)setRecenterButton:(id)a3;
- (void)setReportIncidentButton:(id)a3;
- (void)setTrackingButtonEnabled:(BOOL)a3;
- (void)setTrackingController:(id)a3;
- (void)setZoomControls:(id)a3;
- (void)setZoomInEnabled:(BOOL)a3;
- (void)setZoomOutEnabled:(BOOL)a3;
- (void)zoomInButtonPressed;
- (void)zoomOutButtonPressed;
@end

@implementation CarMapControlsOverlay

- (void)dealloc
{
  [(CarMapControlsOverlay *)self setContentView:0 layoutGuide:0];
  v3.receiver = self;
  v3.super_class = (Class)CarMapControlsOverlay;
  [(CarMapControlsOverlay *)&v3 dealloc];
}

- (void)setConfiguration:(id *)a3
{
  if (a3->var0 != self->_configuration.topElement
    || a3->var1 != self->_configuration.centerElement
    || a3->var2 != self->_configuration.bottomElement)
  {
    long long v5 = *(_OWORD *)&a3->var0;
    self->_configuration.bottomElement = a3->var2;
    *(_OWORD *)&self->_configuration.topElement = v5;
    [(CarMapControlsOverlay *)self reload];
  }
}

- (void)setConfiguration:(id *)a3 withAnimation:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (a3->var0 != self->_configuration.topElement
    || a3->var1 != self->_configuration.centerElement
    || a3->var2 != self->_configuration.bottomElement)
  {
    if ([v6 isAnimated])
    {
      BOOL v10 = *(_OWORD *)&self->_configuration.topElement == 0 && self->_configuration.bottomElement == 0;
      BOOL v11 = *(_OWORD *)&a3->var0 == 0 && a3->var2 == 0;
      long long v12 = *(_OWORD *)&a3->var0;
      self->_configuration.bottomElement = a3->var2;
      *(_OWORD *)&self->_configuration.topElement = v12;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100822EB0;
      v19[3] = &unk_1012F8940;
      BOOL v20 = v10;
      BOOL v21 = v11;
      v19[4] = self;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100822ECC;
      v15[3] = &unk_1012F84D0;
      BOOL v16 = v10;
      BOOL v17 = v11;
      v15[4] = self;
      char v18 = 1;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100822F78;
      v13[3] = &unk_1012E8908;
      BOOL v14 = v11;
      v13[4] = self;
      [v7 addPreparation:v19 animations:v15 completion:v13];
    }
    else
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100822E74;
      v22[3] = &unk_1012EB8B8;
      v22[4] = self;
      long long v23 = *(_OWORD *)&a3->var0;
      unint64_t var2 = a3->var2;
      [v7 addPreparation:v22];
    }
  }
}

- (CarCameraToggleButton)cameraToggleButton
{
  cameraToggleButton = self->_cameraToggleButton;
  if (!cameraToggleButton)
  {
    v4 = -[CarCameraToggleButton initWithFrame:]([CarCameraToggleButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    long long v5 = self->_cameraToggleButton;
    self->_cameraToggleButton = v4;

    [(CarCameraToggleButton *)self->_cameraToggleButton setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v6) = 1148846080;
    [(CarCameraToggleButton *)self->_cameraToggleButton setContentCompressionResistancePriority:1 forAxis:v6];
    LODWORD(v7) = 1148846080;
    [(CarCameraToggleButton *)self->_cameraToggleButton setContentHuggingPriority:1 forAxis:v7];
    [(CarCameraToggleButton *)self->_cameraToggleButton addTarget:self action:"_cameraToggleButtonPressed" forControlEvents:64];
    cameraToggleButton = self->_cameraToggleButton;
  }

  return cameraToggleButton;
}

- (CarAudioControlView)audioControlView
{
  audioControlView = self->_audioControlView;
  if (!audioControlView)
  {
    v4 = [(NavAudioControlView *)[CarAudioControlView alloc] initWithDelegate:self];
    long long v5 = self->_audioControlView;
    self->_audioControlView = v4;

    [(NavAudioControlView *)self->_audioControlView setAvailableAudioTypes:&off_1013AE028];
    [(CarAudioControlView *)self->_audioControlView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v6) = 1148846080;
    [(CarAudioControlView *)self->_audioControlView setContentCompressionResistancePriority:1 forAxis:v6];
    LODWORD(v7) = 1148846080;
    [(CarAudioControlView *)self->_audioControlView setContentHuggingPriority:1 forAxis:v7];
    LODWORD(v8) = 1148846080;
    [(CarAudioControlView *)self->_audioControlView setContentHuggingPriority:0 forAxis:v8];
    -[CarAudioControlView _setTouchInsets:](self->_audioControlView, "_setTouchInsets:", -8.5, -8.5, -8.5, -8.5);
    audioControlView = self->_audioControlView;
  }

  return audioControlView;
}

- (CarFloatingControlsButtonView)floatingControls
{
  floatingControls = self->_floatingControls;
  if (!floatingControls)
  {
    v4 = -[CarFloatingControlsButtonView initWithFrame:]([CarFloatingControlsButtonView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    long long v5 = self->_floatingControls;
    self->_floatingControls = v4;

    [(CarFloatingControlsButtonView *)self->_floatingControls setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarFloatingControlsButtonView *)self->_floatingControls setDelegate:self];
    double v6 = self->_floatingControls;
    double v7 = [(CarMapControlsOverlay *)self trackingController];
    [(CarFloatingControlsButtonView *)v6 setTrackingController:v7];

    [(CarFloatingControlsButtonView *)self->_floatingControls setEnableTrackingButton:[(CarMapControlsOverlay *)self trackingButtonEnabled]];
    [(CarFloatingControlsButtonView *)self->_floatingControls setEnable3DButton:[(CarMapControlsOverlay *)self mode3DEnabled]];
    [(CarFloatingControlsButtonView *)self->_floatingControls set3DButtonState:[(CarMapControlsOverlay *)self mode3DState]];
    floatingControls = self->_floatingControls;
  }

  return floatingControls;
}

- (CarFocusableImageButton)reportIncidentButton
{
  reportIncidentButton = self->_reportIncidentButton;
  if (!reportIncidentButton)
  {
    v4 = [CarFocusableImageButton alloc];
    long long v5 = +[UIImage _mapsCar_systemImageNamed:@"exclamationmark.bubble.fill" textStyle:UIFontTextStyleSubheadline];
    double v6 = [(CarFocusableImageButton *)v4 initWithImage:v5];
    double v7 = self->_reportIncidentButton;
    self->_reportIncidentButton = v6;

    [(CarFocusableImageButton *)self->_reportIncidentButton setAccessibilityIdentifier:@"ReportIncidentButton"];
    [(CarFocusableImageButton *)self->_reportIncidentButton setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v8) = 1132068864;
    [(CarFocusableImageButton *)self->_reportIncidentButton setContentCompressionResistancePriority:1 forAxis:v8];
    [(CarFocusableImageButton *)self->_reportIncidentButton addTarget:self action:"_reportIncidentButtonPressed" forControlEvents:64];
    v9 = +[NSBundle mainBundle];
    BOOL v10 = [v9 localizedStringForKey:@"CarPlay_Report_Incident" value:@"localized string not found" table:0];
    v15[0] = v10;
    BOOL v11 = +[NSBundle mainBundle];
    long long v12 = [v11 localizedStringForKey:@"CarPlay_Exclamation" value:@"localized string not found" table:0];
    v15[1] = v12;
    v13 = +[NSArray arrayWithObjects:v15 count:2];
    [(CarFocusableImageButton *)self->_reportIncidentButton setAccessibilityUserInputLabels:v13];

    reportIncidentButton = self->_reportIncidentButton;
  }

  return reportIncidentButton;
}

- (CarFocusableImageButton)recenterButton
{
  recenterButton = self->_recenterButton;
  if (!recenterButton)
  {
    v4 = [CarFocusableImageButton alloc];
    long long v5 = +[UIImage _mapsCar_systemImageNamed:@"location" textStyle:UIFontTextStyleSubheadline];
    double v6 = [(CarFocusableImageButton *)v4 initWithImage:v5];
    double v7 = self->_recenterButton;
    self->_recenterButton = v6;

    [(CarFocusableImageButton *)self->_recenterButton setAccessibilityIdentifier:@"RecenterButton"];
    [(CarFocusableImageButton *)self->_recenterButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarFocusableImageButton *)self->_recenterButton addTarget:self action:"_navRecenterButtonPressed" forControlEvents:64];
    double v8 = +[NSBundle mainBundle];
    v9 = [v8 localizedStringForKey:@"CarPlay_Recenter" value:@"localized string not found" table:0];
    long long v12 = v9;
    BOOL v10 = +[NSArray arrayWithObjects:&v12 count:1];
    [(CarFocusableImageButton *)self->_recenterButton setAccessibilityUserInputLabels:v10];

    recenterButton = self->_recenterButton;
  }

  return recenterButton;
}

- (CarZoomButtonView)zoomControls
{
  zoomControls = self->_zoomControls;
  if (!zoomControls)
  {
    v4 = [[CarZoomButtonView alloc] initWithVisiblePanButton:1];
    long long v5 = self->_zoomControls;
    self->_zoomControls = v4;

    [(CarZoomButtonView *)self->_zoomControls setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarZoomButtonView *)self->_zoomControls setDelegate:self];
    LODWORD(v6) = 1132068864;
    [(CarZoomButtonView *)self->_zoomControls setContentHuggingPriority:1 forAxis:v6];
    LODWORD(v7) = 1132068864;
    [(CarZoomButtonView *)self->_zoomControls setContentCompressionResistancePriority:1 forAxis:v7];
    [(CarZoomButtonView *)self->_zoomControls setZoomInEnabled:[(CarMapControlsOverlay *)self zoomInEnabled]];
    [(CarZoomButtonView *)self->_zoomControls setZoomOutEnabled:[(CarMapControlsOverlay *)self zoomOutEnabled]];
    zoomControls = self->_zoomControls;
  }

  return zoomControls;
}

- (void)setTrackingButtonEnabled:(BOOL)a3
{
  if (self->_trackingButtonEnabled != a3)
  {
    BOOL v3 = a3;
    self->_trackingButtonEnabled = a3;
    id v4 = [(CarMapControlsOverlay *)self floatingControls];
    [v4 setEnableTrackingButton:v3];
  }
}

- (void)setMode3DEnabled:(BOOL)a3
{
  if (self->_mode3DEnabled != a3)
  {
    BOOL v3 = a3;
    self->_mode3DEnabled = a3;
    id v4 = [(CarMapControlsOverlay *)self floatingControls];
    [v4 setEnable3DButton:v3];
  }
}

- (void)setMode3DState:(unint64_t)a3
{
  if (self->_mode3DState != a3)
  {
    self->_mode3DState = a3;
    id v4 = [(CarMapControlsOverlay *)self floatingControls];
    [v4 set3DButtonState:a3];
  }
}

- (unint64_t)cameraToggleButtonState
{
  v2 = [(CarMapControlsOverlay *)self cameraToggleButton];
  id v3 = [v2 buttonState];

  return (unint64_t)v3;
}

- (void)setCameraToggleButtonState:(unint64_t)a3
{
  id v4 = [(CarMapControlsOverlay *)self cameraToggleButton];
  [v4 setButtonState:a3];
}

- (void)setTrackingController:(id)a3
{
  long long v5 = (CarMapTrackingController *)a3;
  if (self->_trackingController != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)&self->_trackingController, a3);
    double v6 = [(CarMapControlsOverlay *)self floatingControls];
    [v6 setTrackingController:self->_trackingController];

    long long v5 = v7;
  }
}

- (void)setZoomInEnabled:(BOOL)a3
{
  if (self->_zoomInEnabled != a3)
  {
    self->_zoomInEnabled = a3;
    id v4 = [(CarMapControlsOverlay *)self zoomControls];
    [v4 setZoomInEnabled:self->_zoomInEnabled];
  }
}

- (void)setZoomOutEnabled:(BOOL)a3
{
  if (self->_zoomOutEnabled != a3)
  {
    self->_zoomOutEnabled = a3;
    id v4 = [(CarMapControlsOverlay *)self zoomControls];
    [v4 setZoomOutEnabled:self->_zoomOutEnabled];
  }
}

- (void)setAudioSettings:(unint64_t)a3
{
  long long v5 = [(CarMapControlsOverlay *)self audioControlView];
  id v6 = [v5 currentAudioType];

  if (v6 != (id)a3)
  {
    id v7 = [(CarMapControlsOverlay *)self audioControlView];
    [v7 setCurrentAudioType:a3];
  }
}

- (unint64_t)audioSettings
{
  return [(NavAudioControlView *)self->_audioControlView currentAudioType];
}

- (id)_viewForElement:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      uint64_t v4 = [(CarMapControlsOverlay *)self floatingControls];
      goto LABEL_10;
    case 2uLL:
      long long v5 = objc_opt_new();
      [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
      id v6 = [(CarMapControlsOverlay *)self cameraToggleButton];
      [v5 addSubview:v6];

      id v7 = [(CarMapControlsOverlay *)self audioControlView];
      [v5 addSubview:v7];

      LODWORD(v8) = 1148846080;
      [v5 setContentHuggingPriority:1 forAxis:v8];
      LODWORD(v9) = 1148846080;
      [v5 setContentCompressionResistancePriority:1 forAxis:v9];
      v43 = [(CarMapControlsOverlay *)self cameraToggleButton];
      v42 = [v43 topAnchor];
      v41 = [v5 topAnchor];
      v40 = [v42 constraintEqualToAnchor:v41];
      v44[0] = v40;
      v39 = [(CarMapControlsOverlay *)self cameraToggleButton];
      v38 = [v39 leadingAnchor];
      v37 = [v5 leadingAnchor];
      v36 = [v38 constraintEqualToAnchor:v37];
      v44[1] = v36;
      v35 = [(CarMapControlsOverlay *)self cameraToggleButton];
      v34 = [v35 trailingAnchor];
      v33 = [v5 trailingAnchor];
      v32 = [v34 constraintEqualToAnchor:v33];
      v44[2] = v32;
      v31 = [(CarMapControlsOverlay *)self audioControlView];
      v29 = [v31 topAnchor];
      v30 = [(CarMapControlsOverlay *)self cameraToggleButton];
      v28 = [v30 bottomAnchor];
      v27 = [v29 constraintEqualToAnchor:v28 constant:8.5];
      v44[3] = v27;
      v26 = [(CarMapControlsOverlay *)self audioControlView];
      v25 = [v26 leadingAnchor];
      v24 = [v5 leadingAnchor];
      long long v23 = [v25 constraintEqualToAnchor:v24];
      v44[4] = v23;
      BOOL v10 = [(CarMapControlsOverlay *)self audioControlView];
      BOOL v11 = [v10 trailingAnchor];
      long long v12 = [v5 trailingAnchor];
      v13 = [v11 constraintEqualToAnchor:v12];
      v44[5] = v13;
      BOOL v14 = [(CarMapControlsOverlay *)self audioControlView];
      v15 = [v14 bottomAnchor];
      BOOL v16 = [v5 bottomAnchor];
      BOOL v17 = [v15 constraintEqualToAnchor:v16];
      v44[6] = v17;
      char v18 = +[NSArray arrayWithObjects:v44 count:7];
      +[NSLayoutConstraint activateConstraints:v18];

      break;
    case 3uLL:
      uint64_t v4 = [(CarMapControlsOverlay *)self reportIncidentButton];
      goto LABEL_10;
    case 4uLL:
      v19 = [(CarMapControlsOverlay *)self zoomControls];
      BOOL v20 = v19;
      uint64_t v21 = 0;
      goto LABEL_8;
    case 5uLL:
      v19 = [(CarMapControlsOverlay *)self zoomControls];
      BOOL v20 = v19;
      uint64_t v21 = 1;
LABEL_8:
      [v19 setPanButtonVisible:v21];

      uint64_t v4 = [(CarMapControlsOverlay *)self zoomControls];
      goto LABEL_10;
    case 6uLL:
      uint64_t v4 = [(CarMapControlsOverlay *)self recenterButton];
LABEL_10:
      long long v5 = (void *)v4;
      break;
    default:
      long long v5 = 0;
      break;
  }

  return v5;
}

- (void)_configureContainer:(id)a3 withElement:(unint64_t)a4 preferredEdgeLocation:(unint64_t)a5 priority:(float)a6
{
  id v10 = a3;
  BOOL v11 = v10;
  if (a5 == 1 || a5 == 4)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v12 = [v10 subviews];
    id v13 = [v12 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v37;
      do
      {
        BOOL v16 = 0;
        do
        {
          if (*(void *)v37 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v36 + 1) + 8 * (void)v16) removeFromSuperview];
          BOOL v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v14);
    }

    [v11 invalidateIntrinsicContentSize];
    BOOL v17 = [(CarMapControlsOverlay *)self _viewForElement:a4];
    if (v17)
    {
      [v11 addSubview:v17];
      v35 = +[NSMutableArray arrayWithCapacity:4];
      char v18 = [v17 leadingAnchor];
      v19 = [v11 leadingAnchor];
      BOOL v20 = [v18 constraintEqualToAnchor:v19];
      v43[0] = v20;
      uint64_t v21 = [v17 trailingAnchor];
      v22 = [v11 trailingAnchor];
      long long v23 = [v21 constraintEqualToAnchor:v22];
      v43[1] = v23;
      v24 = +[NSArray arrayWithObjects:v43 count:2];
      +[NSLayoutConstraint activateConstraints:v24];

      v25 = [v17 topAnchor];
      v26 = [v11 topAnchor];
      if (a5 == 1)
      {
        v28 = [v25 constraintEqualToAnchor:v26];
        v42[0] = v28;
        v29 = [v17 bottomAnchor];
        v30 = [v11 bottomAnchor];
        *(float *)&double v31 = a6;
        v32 = [v29 constraintLessThanOrEqualToAnchor:v30 constant:0.0 priority:v31];
        v42[1] = v32;
        v33 = v42;
      }
      else
      {
        *(float *)&double v27 = a6;
        v28 = [v25 constraintGreaterThanOrEqualToAnchor:v26 constant:0.0 priority:v27];
        v41[0] = v28;
        v29 = [v17 bottomAnchor];
        v30 = [v11 bottomAnchor];
        v32 = [v29 constraintEqualToAnchor:v30];
        v41[1] = v32;
        v33 = v41;
      }
      v34 = +[NSArray arrayWithObjects:v33 count:2];
      [v35 addObjectsFromArray:v34];

      +[NSLayoutConstraint activateConstraints:v35];
    }
  }
  else
  {
    BOOL v17 = sub_100015DB4();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "Unsupported edge location.", buf, 2u);
    }
  }
}

- (void)reload
{
  if (self->_mapControlsStackView)
  {
    LODWORD(v2) = 1148846080;
    [(CarMapControlsOverlay *)self _configureContainer:self->_topContainerView withElement:self->_configuration.topElement preferredEdgeLocation:1 priority:v2];
    LODWORD(v4) = 1148846080;
    [(CarMapControlsOverlay *)self _configureContainer:self->_centerContainerView withElement:self->_configuration.centerElement preferredEdgeLocation:1 priority:v4];
    LODWORD(v5) = 1144750080;
    [(CarMapControlsOverlay *)self _configureContainer:self->_bottomContainerView withElement:self->_configuration.bottomElement preferredEdgeLocation:4 priority:v5];
    [(NSLayoutConstraint *)self->_stackViewTopConstraint setActive:self->_configuration.topElement != 0];
    if ([(CarMapControlsOverlay *)self isHidden]) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = *(_OWORD *)&self->_configuration.topElement != 0 || self->_configuration.bottomElement != 0;
    }
    id v8 = [(CarMapControlsOverlay *)self host];
    [v8 setCollisionConstraintsEnabled:v6 forOverlay:self];
  }
  else
  {
    id v7 = sub_100015DB4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Will not reload map controls, overlay is not active", buf, 2u);
    }
  }
}

- (BOOL)isHidden
{
  [(UIStackView *)self->_mapControlsStackView alpha];
  return v2 == 0.0;
}

- (void)setHidden:(BOOL)a3
{
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (!self->_mapControlsStackView) {
    return;
  }
  BOOL v4 = a3;
  if (!a4) {
    goto LABEL_12;
  }
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    BOOL v6 = sub_100015DB4();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_11:

LABEL_12:
      int v13 = 0;
      goto LABEL_14;
    }
    id v7 = self;
    id v8 = (objc_class *)objc_opt_class();
    double v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      id v10 = [(CarMapControlsOverlay *)v7 performSelector:"accessibilityIdentifier"];
      BOOL v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        long long v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_10;
      }
    }
    long long v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_10:

    *(_DWORD *)buf = 138543362;
    v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Reduce motion enabled, running map controls update without animation", buf, 0xCu);

    goto LABEL_11;
  }
  int v13 = 1;
LABEL_14:
  if (v4) {
    double v14 = 0.0;
  }
  else {
    double v14 = 1.0;
  }
  [(UIStackView *)self->_mapControlsStackView alpha];
  if (v14 != v15)
  {
    BOOL v16 = sub_100015DB4();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      if (v4) {
        BOOL v17 = "hide";
      }
      else {
        BOOL v17 = "show";
      }
      char v18 = [(UIStackView *)self->_mapControlsStackView arrangedSubviews];
      v19 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v18 count]);
      *(_DWORD *)buf = 136315394;
      v24 = v17;
      __int16 v25 = 2112;
      v26 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Will %s map control view using alpha (controls: %@)", buf, 0x16u);
    }
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100824710;
    v21[3] = &unk_1012E8FA8;
    v21[4] = self;
    *(double *)&v21[5] = v14;
    BOOL v22 = v4;
    BOOL v20 = objc_retainBlock(v21);
    if (v13)
    {
      if (+[UIView _isInAnimationBlock]) {
        ((void (*)(void *))v20[2])(v20);
      }
      else {
        +[UIView animateWithDuration:4 delay:v20 options:0 animations:0.1 completion:0.0];
      }
    }
    else
    {
      +[UIView performWithoutAnimation:v20];
    }
  }
}

- (void)setHost:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_host, v4);
    if (v4)
    {
      BOOL v6 = [v4 overlayContentView];
      id v7 = [v4 layoutGuideForOverlay:self];
      [(CarMapControlsOverlay *)self setContentView:v6 layoutGuide:v7];

      id v8 = [(UIStackView *)self->_mapControlsStackView _maps_leftRHDAnchor];
      double v9 = [v4 mapInsetsLayoutGuide];
      id v10 = [v9 _maps_rightRHDAnchor];
      LODWORD(v11) = 1148846080;
      long long v12 = [v8 _maps_constraintWithRHDAnchor:v10 relation:1 constant:0.0 priority:v11];
      uint64_t v21 = v12;
      int v13 = +[NSArray arrayWithObjects:&v21 count:1];
      [v4 setMapInsetsConstraints:v13 forOverlay:self];

      double v14 = [(UIStackView *)self->_mapControlsStackView _maps_leftRHDAnchor];
      double v15 = [v4 viewportLayoutGuide];
      BOOL v16 = [v15 _maps_rightRHDAnchor];
      LODWORD(v17) = 1148846080;
      char v18 = [v14 _maps_constraintWithRHDAnchor:v16 relation:1 constant:0.0 priority:v17];
      BOOL v20 = v18;
      v19 = +[NSArray arrayWithObjects:&v20 count:1];
      [v4 setViewportConstraints:v19 forOverlay:self];
    }
    else
    {
      [(CarMapControlsOverlay *)self setContentView:0 layoutGuide:0];
    }
  }
}

- (void)setContentView:(id)a3 layoutGuide:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UIStackView *)self->_mapControlsStackView superview];
  if (v8 != v6)
  {
    [(UIStackView *)self->_mapControlsStackView removeFromSuperview];
    mapControlsStackView = self->_mapControlsStackView;
    self->_mapControlsStackView = 0;

    if (v6)
    {
      v77 = v8;
      id v10 = sub_100015DB4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Will create new map control container view", buf, 2u);
      }

      double v11 = [[PassThroughStackView alloc] initWithArrangedSubviews:&__NSArray0__struct];
      long long v12 = self->_mapControlsStackView;
      self->_mapControlsStackView = &v11->super;

      [(UIStackView *)self->_mapControlsStackView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIStackView *)self->_mapControlsStackView setAxis:1];
      [(UIStackView *)self->_mapControlsStackView setAlignment:3];
      [(UIStackView *)self->_mapControlsStackView setDistribution:3];
      [(UIStackView *)self->_mapControlsStackView setSpacing:8.5];
      [(UIStackView *)self->_mapControlsStackView setLayoutMarginsRelativeArrangement:1];
      -[UIStackView setDirectionalLayoutMargins:](self->_mapControlsStackView, "setDirectionalLayoutMargins:", 8.5, 0.0, 8.5, 0.0);
      [(UIStackView *)self->_mapControlsStackView setAlpha:0.0];
      int v13 = self->_mapControlsStackView;
      double v14 = [(UIStackView *)v13 heightAnchor];
      LODWORD(v15) = 1112014848;
      BOOL v16 = [v14 constraintEqualToConstant:0.0 priority:v15];
      v85[0] = v16;
      double v17 = [(UIStackView *)self->_mapControlsStackView widthAnchor];
      [(CarMapControlsOverlay *)self _mapControlGutterWidth];
      char v18 = [v17 constraintEqualToConstant:];
      v85[1] = v18;
      v19 = +[NSArray arrayWithObjects:v85 count:2];
      [(UIStackView *)v13 addConstraints:v19];

      LODWORD(v20) = 1148846080;
      [(UIStackView *)self->_mapControlsStackView setContentCompressionResistancePriority:1 forAxis:v20];
      LODWORD(v21) = 1148846080;
      [(UIStackView *)self->_mapControlsStackView setContentCompressionResistancePriority:0 forAxis:v21];
      [v6 addSubview:self->_mapControlsStackView];
      BOOL v22 = [(UIStackView *)self->_mapControlsStackView topAnchor];
      long long v23 = [v7 topAnchor];
      LODWORD(v24) = 1148846080;
      __int16 v25 = [v22 constraintEqualToAnchor:v23 constant:0.0 priority:v24];
      stackViewTopConstraint = self->_stackViewTopConstraint;
      self->_stackViewTopConstraint = v25;

      v84[0] = self->_stackViewTopConstraint;
      v75 = [(UIStackView *)self->_mapControlsStackView topAnchor];
      double v27 = [v7 topAnchor];
      v28 = [v75 constraintGreaterThanOrEqualToAnchor:v27 constant:0.0];
      v84[1] = v28;
      v29 = [(UIStackView *)self->_mapControlsStackView bottomAnchor];
      [v7 bottomAnchor];
      v30 = v79 = v7;
      double v31 = [v29 constraintEqualToAnchor:v30 constant:-0.0];
      v84[2] = v31;
      v32 = [(UIStackView *)self->_mapControlsStackView _maps_rightRHDAnchor];
      [v79 _maps_rightRHDAnchor];
      v33 = id v78 = v6;
      LODWORD(v34) = 1148846080;
      v35 = [v32 _maps_constraintWithRHDAnchor:v33 relation:0 constant:-0.0 priority:v34];
      v84[3] = v35;
      long long v36 = +[NSArray arrayWithObjects:v84 count:4];
      +[NSLayoutConstraint activateConstraints:v36];

      long long v37 = +[MapsExternalDevice sharedInstance];
      if ([v37 rightHandDrive]) {
        uint64_t v38 = 2;
      }
      else {
        uint64_t v38 = 8;
      }

      long long v39 = [(CarMapControlsOverlay *)self host];
      v76 = [v39 collisionGuideForEdge:v38];

      v40 = [(CarMapControlsOverlay *)self host];
      v41 = [v40 collisionGuideForEdge:4];

      v42 = [(CarMapControlsOverlay *)self host];
      v43 = [(UIStackView *)self->_mapControlsStackView topAnchor];
      v44 = [v76 bottomAnchor];
      v45 = [v43 constraintGreaterThanOrEqualToAnchor:v44];
      v83[0] = v45;
      v46 = [(UIStackView *)self->_mapControlsStackView _maps_leftRHDAnchor];
      v47 = [v41 _maps_rightRHDAnchor];
      LODWORD(v48) = 1148846080;
      v49 = [v46 _maps_constraintWithRHDAnchor:v47 relation:1 constant:0.0 priority:v48];
      v83[1] = v49;
      v50 = +[NSArray arrayWithObjects:v83 count:2];
      [v42 setCollisionConstraints:v50 forOverlay:self];

      id v7 = v79;
      v51 = objc_alloc_init(CarMapControlsAutohidingContainerView);
      topContainerView = self->_topContainerView;
      self->_topContainerView = v51;

      [(CarMapControlsAutohidingContainerView *)self->_topContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
      LODWORD(v53) = 1148846080;
      [(CarMapControlsAutohidingContainerView *)self->_topContainerView setContentHuggingPriority:1 forAxis:v53];
      v54 = objc_alloc_init(CarMapControlsAutohidingContainerView);
      centerContainerView = self->_centerContainerView;
      self->_centerContainerView = v54;

      [(CarMapControlsAutohidingContainerView *)self->_centerContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
      LODWORD(v56) = 1148846080;
      [(CarMapControlsAutohidingContainerView *)self->_centerContainerView setContentHuggingPriority:1 forAxis:v56];
      v57 = objc_alloc_init(CarMapControlsAutohidingContainerView);
      bottomContainerView = self->_bottomContainerView;
      self->_bottomContainerView = v57;

      [(CarMapControlsAutohidingContainerView *)self->_bottomContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
      LODWORD(v59) = 1148846080;
      [(CarMapControlsAutohidingContainerView *)self->_bottomContainerView setContentHuggingPriority:1 forAxis:v59];
      v60 = self->_mapControlsStackView;
      long long v81 = *(_OWORD *)&self->_topContainerView;
      v82 = self->_bottomContainerView;
      v61 = +[NSArray arrayWithObjects:&v81 count:3];
      [(UIStackView *)v60 _maps_setArrangedSubviews:v61];

      v62 = [(CarMapControlsAutohidingContainerView *)self->_centerContainerView centerYAnchor];
      v63 = [v79 centerYAnchor];
      LODWORD(v64) = 1144750080;
      v65 = [v62 constraintEqualToAnchor:v63 constant:0.0 priority:v64];
      [v65 setActive:1];

      id v6 = v78;
      [(CarMapControlsOverlay *)self reload];

      id v8 = v77;
    }
    else
    {
      v66 = self->_topContainerView;
      self->_topContainerView = 0;

      v67 = self->_centerContainerView;
      self->_centerContainerView = 0;

      v68 = self->_bottomContainerView;
      self->_bottomContainerView = 0;

      floatingControls = self->_floatingControls;
      self->_floatingControls = 0;

      zoomControls = self->_zoomControls;
      self->_zoomControls = 0;

      cameraToggleButton = self->_cameraToggleButton;
      self->_cameraToggleButton = 0;

      audioControlView = self->_audioControlView;
      self->_audioControlView = 0;

      recenterButton = self->_recenterButton;
      self->_recenterButton = 0;

      reportIncidentButton = self->_reportIncidentButton;
      self->_reportIncidentButton = 0;
    }
  }
}

- (double)_mapControlGutterWidth
{
  return 45.0;
}

- (void)audioControlView:(id)a3 didSelectAudioType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(CarMapControlsOverlay *)self audioControlDelegate];
  [v7 audioControlView:v6 didSelectAudioType:a4];
}

- (void)audioControlView:(id)a3 willChangeSizeWithAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CarMapControlsOverlay *)self audioControlDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(CarMapControlsOverlay *)self audioControlDelegate];
    [v10 audioControlView:v6 willChangeSizeWithAnimation:v7];
  }
  if ([v6 isDescendantOfView:self->_mapControlsStackView])
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10082526C;
    v14[3] = &unk_1012E5D08;
    v14[4] = self;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100825278;
    v11[3] = &unk_1012E5D58;
    id v12 = v6;
    int v13 = self;
    [v7 addPreparation:v14 animations:v11 completion:0];
  }
}

- (NSArray)preferredFocusEnvironments
{
  id v3 = [(UIStackView *)self->_mapControlsStackView arrangedSubviews];
  id v4 = [v3 count];

  if (v4)
  {
    mapControlsStackView = self->_mapControlsStackView;
    double v5 = +[NSArray arrayWithObjects:&mapControlsStackView count:1];
  }
  else
  {
    double v5 = &__NSArray0__struct;
  }

  return (NSArray *)v5;
}

- (NSArray)focusOrderSubItems
{
  id v3 = [(UIStackView *)self->_mapControlsStackView arrangedSubviews];
  id v4 = [v3 count];

  if (v4)
  {
    long long v36 = *(_OWORD *)&self->_topContainerView;
    bottomContainerView = self->_bottomContainerView;
    double v5 = +[NSArray arrayWithObjects:&v36 count:3];
    id v6 = sub_1000AC254(v5, &stru_1012F9F20);

    v26 = +[NSMutableArray arrayWithCapacity:7];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = v6;
    id v7 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v25 = *(void *)v28;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v28 != v25) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(id *)(*((void *)&v27 + 1) + 8 * i);
          double v11 = +[NSMutableArray array];
          id v12 = [v10 subviews];
          int v13 = [v12 sortedArrayUsingComparator:&stru_1012F9F80];

          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id v14 = v13;
          id v15 = [v14 countByEnumeratingWithState:&v31 objects:v38 count:16];
          if (v15)
          {
            id v16 = v15;
            uint64_t v17 = *(void *)v32;
            do
            {
              for (j = 0; j != v16; j = (char *)j + 1)
              {
                if (*(void *)v32 != v17) {
                  objc_enumerationMutation(v14);
                }
                v19 = *(void **)(*((void *)&v31 + 1) + 8 * (void)j);
                if ([v19 conformsToProtocol:&OBJC_PROTOCOL___CarFocusOrderCollection])
                {
                  double v20 = [v19 focusOrderSubItems];
                  [v11 addObjectsFromArray:v20];
                }
                else
                {
                  [v11 addObject:v19];
                }
              }
              id v16 = [v14 countByEnumeratingWithState:&v31 objects:v38 count:16];
            }
            while (v16);
          }

          id v21 = [v11 copy];
          [v26 addObjectsFromArray:v21];
        }
        id v8 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v8);
    }

    BOOL v22 = sub_1000AC254(v26, &stru_1012F9F40);
  }
  else
  {
    BOOL v22 = &__NSArray0__struct;
  }

  return (NSArray *)v22;
}

- (void)_navRecenterButtonPressed
{
  id v3 = [(CarMapControlsOverlay *)self delegate];
  [v3 carMapControls:self didTriggerAction:1];
}

- (void)_cameraToggleButtonPressed
{
  id v3 = [(CarMapControlsOverlay *)self delegate];
  [v3 carMapControls:self didTriggerAction:6];
}

- (void)_reportIncidentButtonPressed
{
  id v3 = [(CarMapControlsOverlay *)self delegate];
  [v3 carMapControls:self didTriggerAction:7];
}

- (void)panButtonPressed
{
  id v3 = [(CarMapControlsOverlay *)self delegate];
  [v3 carMapControls:self didTriggerAction:2];
}

- (void)zoomInButtonPressed
{
  id v3 = [(CarMapControlsOverlay *)self delegate];
  [v3 carMapControls:self didTriggerAction:3];
}

- (void)zoomOutButtonPressed
{
  id v3 = [(CarMapControlsOverlay *)self delegate];
  [v3 carMapControls:self didTriggerAction:4];
}

- (void)mode3DButtonPressed
{
  id v3 = [(CarMapControlsOverlay *)self delegate];
  [v3 carMapControls:self didTriggerAction:5];
}

- (ChromeOverlayHosting)host
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  return (ChromeOverlayHosting *)WeakRetained;
}

- (CarMapControlsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarMapControlsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NavAudioControlViewDelegate)audioControlDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioControlDelegate);

  return (NavAudioControlViewDelegate *)WeakRetained;
}

- (void)setAudioControlDelegate:(id)a3
{
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)configuration
{
  *($FA60EBF46223DE135220C488449FC0D5 *)retstr = *($FA60EBF46223DE135220C488449FC0D5 *)&self->var1;
  return self;
}

- (BOOL)zoomInEnabled
{
  return self->_zoomInEnabled;
}

- (BOOL)zoomOutEnabled
{
  return self->_zoomOutEnabled;
}

- (BOOL)trackingButtonEnabled
{
  return self->_trackingButtonEnabled;
}

- (BOOL)mode3DEnabled
{
  return self->_mode3DEnabled;
}

- (unint64_t)mode3DState
{
  return self->_mode3DState;
}

- (CarMapTrackingController)trackingController
{
  return self->_trackingController;
}

- (void)setCameraToggleButton:(id)a3
{
}

- (void)setAudioControlView:(id)a3
{
}

- (void)setFloatingControls:(id)a3
{
}

- (void)setReportIncidentButton:(id)a3
{
}

- (void)setRecenterButton:(id)a3
{
}

- (void)setZoomControls:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomControls, 0);
  objc_storeStrong((id *)&self->_recenterButton, 0);
  objc_storeStrong((id *)&self->_reportIncidentButton, 0);
  objc_storeStrong((id *)&self->_floatingControls, 0);
  objc_storeStrong((id *)&self->_audioControlView, 0);
  objc_storeStrong((id *)&self->_cameraToggleButton, 0);
  objc_storeStrong((id *)&self->_trackingController, 0);
  objc_destroyWeak((id *)&self->_audioControlDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_stackViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_bottomContainerView, 0);
  objc_storeStrong((id *)&self->_centerContainerView, 0);
  objc_storeStrong((id *)&self->_topContainerView, 0);

  objc_storeStrong((id *)&self->_mapControlsStackView, 0);
}

@end