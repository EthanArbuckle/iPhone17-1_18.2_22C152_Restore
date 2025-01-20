@interface IOSCardsOverlay
- (BOOL)_canShowWhileLocked;
- (BOOL)allowsDisplayOnLockScreen;
- (BOOL)isHidden;
- (BOOL)supportsEmptyStack;
- (ChromeOverlayHosting)host;
- (double)statusBarHeight;
- (id)passThroughView;
- (void)_refreshViewportAndMapInsetConstraintsForCurrentLayoutStyle;
- (void)containerStyleManagerConfigureLayoutForStyle:(unint64_t)a3;
- (void)setChromeHidden:(BOOL)a3;
- (void)setControllerStack:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setHidden:(BOOL)a3;
- (void)setHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setHost:(id)a3;
- (void)updateMapEdgeInsets;
@end

@implementation IOSCardsOverlay

- (void)containerStyleManagerConfigureLayoutForStyle:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IOSCardsOverlay;
  [(OverlayContainerViewController *)&v4 containerStyleManagerConfigureLayoutForStyle:a3];
  [(IOSCardsOverlay *)self _refreshViewportAndMapInsetConstraintsForCurrentLayoutStyle];
}

- (void)setHost:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  v5 = obj;
  if (WeakRetained != obj)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_host);

    if (v6)
    {
      overlayViewportConstraints = self->_overlayViewportConstraints;
      self->_overlayViewportConstraints = 0;

      overlayMapInsetsConstraints = self->_overlayMapInsetsConstraints;
      self->_overlayMapInsetsConstraints = 0;

      [(IOSCardsOverlay *)self willMoveToParentViewController:0];
      v9 = [(IOSCardsOverlay *)self view];
      [v9 removeFromSuperview];

      [(IOSCardsOverlay *)self removeFromParentViewController];
    }
    objc_storeWeak((id *)&self->_host, obj);
    v5 = obj;
    if (obj)
    {
      v10 = [obj overlayContentView];
      v11 = [obj containingViewController];
      uint64_t v12 = sub_1000BBB44(v10);
      BOOL v13 = v12 == 5;
      [(ContainerViewController *)self setStackOnOppositeSide:v13];
      [(ContainerViewController *)self macSetEnableExtendedPresentationStyles:v13];
      [v11 addChildViewController:self];
      v14 = [(IOSCardsOverlay *)self view];
      [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

      v15 = [(IOSCardsOverlay *)self view];
      [v10 addSubview:v15];

      v16 = [(IOSCardsOverlay *)self view];
      v18 = v16;
      if (v12 == 5)
      {
        v19 = [obj contentLayoutGuide];
        LODWORD(v20) = 1148846080;
        v21 = [v18 _maps_constraintsEqualToEdgesOfLayoutGuide:v19 priority:v20];
        v22 = [v21 allConstraints];
        +[NSLayoutConstraint activateConstraints:v22];
      }
      else
      {
        LODWORD(v17) = 1148846080;
        v19 = [v16 _maps_constraintsEqualToEdgesOfView:v10 priority:v17];
        v21 = [v19 allConstraints];
        +[NSLayoutConstraint activateConstraints:v21];
      }

      [(PassThroughViewController *)self didMoveToParentViewController:v11];
      v23 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v23);
      v25 = +[NSString stringWithFormat:@"%@.OverlayVC", v24];
      v26 = [(IOSCardsOverlay *)self view];
      [v26 setAccessibilityIdentifier:v25];

      v27 = (objc_class *)objc_opt_class();
      v28 = NSStringFromClass(v27);
      v29 = +[NSString stringWithFormat:@"%@.OverlayVC.OverlayView", v28];
      v30 = [(OverlayContainerViewController *)self overlayView];
      [v30 setAccessibilityIdentifier:v29];

      [(IOSCardsOverlay *)self _refreshViewportAndMapInsetConstraintsForCurrentLayoutStyle];
      v5 = obj;
    }
  }
}

- (double)statusBarHeight
{
  uint64_t v3 = sub_1000BBB44(self);
  double result = 0.0;
  if (v3 != 5)
  {
    v5.receiver = self;
    v5.super_class = (Class)IOSCardsOverlay;
    [(ContainerViewController *)&v5 statusBarHeight];
  }
  return result;
}

- (void)_refreshViewportAndMapInsetConstraintsForCurrentLayoutStyle
{
  p_host = &self->_host;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  if (WeakRetained)
  {
    id v79 = objc_loadWeakRetained((id *)p_host);
    objc_super v5 = [v79 overlayContentView];
    unint64_t v6 = [(ContainerViewController *)self containerStyle];
    v78 = self;
    v74 = v5;
    if (v6 <= 7 && ((1 << v6) & 0xA3) != 0
      || ([(ContainerViewController *)self currentViewController],
          v37 = objc_claimAutoreleasedReturnValue(),
          [v37 cardPresentationController],
          v38 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v39 = [v38 takesAvailableWidth],
          v38,
          v37,
          (v39 & 1) != 0))
    {
      v75 = [v79 viewportLayoutGuide];
      v71 = [v75 topAnchor];
      v68 = [v5 topAnchor];
      v7 = [v71 constraintGreaterThanOrEqualToAnchor:v68];
      v65 = [v79 viewportLayoutGuide];
      v62 = [v65 leadingAnchor];
      v59 = [v5 leadingAnchor];
      v8 = [v62 constraintGreaterThanOrEqualToAnchor:v59];
      v56 = [v79 viewportLayoutGuide];
      v54 = [v56 bottomAnchor];
      [v5 bottomAnchor];
      v10 = v9 = v5;
      v11 = [v54 constraintLessThanOrEqualToAnchor:v10];
      uint64_t v12 = [v79 viewportLayoutGuide];
      BOOL v13 = [v12 trailingAnchor];
      v14 = [v9 trailingAnchor];
      v15 = [v13 constraintLessThanOrEqualToAnchor:v14];
      v16 = +[MapsEdgeConstraints edgeConstraintsWithTop:v7 leading:v8 bottom:v11 trailing:v15];
      overlayViewportConstraints = self->_overlayViewportConstraints;
      self->_overlayViewportConstraints = v16;

      v72 = [v79 mapInsetsLayoutGuide];
      v18 = [v72 topAnchor];
      v66 = [v9 topAnchor];
      v69 = v18;
      uint64_t v19 = [v18 constraintGreaterThanOrEqualToAnchor:v66];
      v63 = [v79 mapInsetsLayoutGuide];
      double v20 = [v63 leadingAnchor];
      v57 = [v9 leadingAnchor];
      v60 = v20;
      uint64_t v21 = [v20 constraintLessThanOrEqualToAnchor:v57];
      v22 = [v79 mapInsetsLayoutGuide];
      v23 = [v22 bottomAnchor];
      v24 = [v9 bottomAnchor];
      v25 = [v23 constraintLessThanOrEqualToAnchor:v24];
      v26 = [v79 mapInsetsLayoutGuide];
      v27 = [v26 trailingAnchor];
      v28 = [v9 trailingAnchor];
      v29 = [v27 constraintLessThanOrEqualToAnchor:v28];
      v76 = (void *)v19;
      v30 = (void *)v19;
      v31 = v78;
    }
    else
    {
      v77 = [v79 viewportLayoutGuide];
      v73 = [v77 topAnchor];
      v70 = [v5 topAnchor];
      v40 = [v73 constraintGreaterThanOrEqualToAnchor:v70];
      v67 = [v79 viewportLayoutGuide];
      v64 = [v67 leadingAnchor];
      v61 = [v5 leadingAnchor];
      v41 = [v64 constraintGreaterThanOrEqualToAnchor:v61];
      v58 = [v79 viewportLayoutGuide];
      v42 = [v58 bottomAnchor];
      [v5 bottomAnchor];
      v44 = v43 = v5;
      v45 = [v42 constraintLessThanOrEqualToAnchor:v44];
      v46 = [v79 viewportLayoutGuide];
      v47 = [v46 trailingAnchor];
      v48 = [v43 trailingAnchor];
      v49 = [v47 constraintLessThanOrEqualToAnchor:v48];
      uint64_t v50 = +[MapsEdgeConstraints edgeConstraintsWithTop:v40 leading:v41 bottom:v45 trailing:v49];
      v51 = v78->_overlayViewportConstraints;
      v78->_overlayViewportConstraints = (MapsEdgeConstraints *)v50;

      v31 = v78;
      v72 = [v79 mapInsetsLayoutGuide];
      v52 = [v72 topAnchor];
      v66 = [v43 topAnchor];
      v69 = v52;
      v76 = [v52 constraintGreaterThanOrEqualToAnchor:v66];
      v63 = [v79 mapInsetsLayoutGuide];
      v53 = [v63 leadingAnchor];
      v57 = [v43 leadingAnchor];
      v60 = v53;
      uint64_t v21 = [v53 constraintGreaterThanOrEqualToAnchor:v57];
      v22 = [v79 mapInsetsLayoutGuide];
      v23 = [v22 bottomAnchor];
      v24 = [v43 bottomAnchor];
      v25 = [v23 constraintLessThanOrEqualToAnchor:v24];
      v26 = [v79 mapInsetsLayoutGuide];
      v27 = [v26 trailingAnchor];
      v28 = [v43 trailingAnchor];
      v29 = [v27 constraintLessThanOrEqualToAnchor:v28];
      v30 = v76;
    }
    uint64_t v32 = +[MapsEdgeConstraints edgeConstraintsWithTop:leading:bottom:trailing:](MapsEdgeConstraints, "edgeConstraintsWithTop:leading:bottom:trailing:", v30, v21, v25, v29, v21);
    overlayMapInsetsConstraints = v31->_overlayMapInsetsConstraints;
    v31->_overlayMapInsetsConstraints = (MapsEdgeConstraints *)v32;

    [(MapsEdgeConstraints *)v31->_overlayViewportConstraints allConstraints];
    v35 = v34 = v31;
    [v79 setViewportConstraints:v35 forOverlay:v34];

    v36 = [(MapsEdgeConstraints *)v34->_overlayMapInsetsConstraints allConstraints];
    [v79 setMapInsetsConstraints:v36 forOverlay:v34];

    [v79 setViewportConstraintsEnabled:0 forOverlay:v34];
    [v79 setMapInsetsConstraintsEnabled:0 forOverlay:v34];
  }
}

- (void)updateMapEdgeInsets
{
  uint64_t v3 = [(IOSCardsOverlay *)self viewIfLoaded];
  if (!v3) {
    return;
  }
  objc_super v4 = (void *)v3;
  objc_super v5 = [(IOSCardsOverlay *)self view];
  unint64_t v6 = [v5 superview];

  if (!v6) {
    return;
  }
  uint64_t v7 = [(ContainerViewController *)self chromeContext];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(ContainerViewController *)self currentViewController];
    if (v9)
    {

LABEL_7:
      v47.receiver = self;
      v47.super_class = (Class)IOSCardsOverlay;
      [(ContainerViewController *)&v47 _calculateMapEdgeInsets];
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      uint64_t v19 = [(MapsEdgeConstraints *)self->_overlayMapInsetsConstraints topConstraint];
      [v19 constant];
      double v21 = v20;
      v22 = [(MapsEdgeConstraints *)self->_overlayMapInsetsConstraints leadingConstraint];
      [v22 constant];
      double v24 = v23;
      v25 = [(MapsEdgeConstraints *)self->_overlayMapInsetsConstraints bottomConstraint];
      [v25 constant];
      id v45 = v26;
      v27 = [(MapsEdgeConstraints *)self->_overlayMapInsetsConstraints trailingConstraint];
      [v27 constant];
      double v29 = v28;

      v30 = [(IOSCardsOverlay *)self view];
      id v31 = [v30 effectiveUserInterfaceLayoutDirection];

      if (v31 == (id)1) {
        double v32 = v18;
      }
      else {
        double v32 = v14;
      }
      if (v31 != (id)1) {
        double v14 = v18;
      }
      v33 = [(MapsEdgeConstraints *)self->_overlayViewportConstraints topConstraint];
      [v33 setConstant:v12];
      v34 = [(MapsEdgeConstraints *)self->_overlayMapInsetsConstraints topConstraint];
      [v34 setConstant:v12];

      v35 = [(MapsEdgeConstraints *)self->_overlayViewportConstraints leadingConstraint];
      [v35 setConstant:v32];
      v36 = [(MapsEdgeConstraints *)self->_overlayMapInsetsConstraints leadingConstraint];
      [v36 setConstant:v32];

      v37 = [(MapsEdgeConstraints *)self->_overlayViewportConstraints bottomConstraint];
      [v37 setConstant:-v16];
      v38 = [(MapsEdgeConstraints *)self->_overlayMapInsetsConstraints bottomConstraint];
      [v38 setConstant:-v16];

      unsigned __int8 v39 = [(MapsEdgeConstraints *)self->_overlayViewportConstraints trailingConstraint];
      [v39 setConstant:-v14];
      v40 = [(MapsEdgeConstraints *)self->_overlayMapInsetsConstraints trailingConstraint];
      [v40 setConstant:-v14];

      v41 = [(IOSCardsOverlay *)self host];
      [v41 setViewportConstraintsEnabled:[self chromeHidden] ^ 1 forOverlay:self];

      v42 = [(IOSCardsOverlay *)self host];
      [v42 setMapInsetsConstraintsEnabled:[self chromeHidden] ^ 1 forOverlay:self];

      if (![(ContainerViewController *)self chromeHidden]
        && (v32 != v24 || v12 != v21 || v14 != v29 || v16 != *(double *)&v45))
      {
        v43 = [(IOSCardsOverlay *)self host];
        [v43 overlayDidUpdateExistingMapInsetConstraints:self];
      }
      return;
    }
    unint64_t v10 = [(ContainerViewController *)self containeeLayout];

    if (v10) {
      goto LABEL_7;
    }
  }
  v44 = [(IOSCardsOverlay *)self host];
  [v44 setViewportConstraintsEnabled:0 forOverlay:self];

  id v46 = [(IOSCardsOverlay *)self host];
  [v46 setMapInsetsConstraintsEnabled:0 forOverlay:self];
}

- (ChromeOverlayHosting)host
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  return (ChromeOverlayHosting *)WeakRetained;
}

- (BOOL)allowsDisplayOnLockScreen
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)supportsEmptyStack
{
  return 1;
}

- (void)setChromeHidden:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(ContainerViewController *)self chromeHidden];
  v9.receiver = self;
  v9.super_class = (Class)IOSCardsOverlay;
  [(ContainerViewController *)&v9 setChromeHidden:v3];
  if (v5 != v3)
  {
    unint64_t v6 = [(IOSCardsOverlay *)self host];
    uint64_t v7 = v3 ^ 1;
    [v6 setViewportConstraintsEnabled:v7 forOverlay:self];

    v8 = [(IOSCardsOverlay *)self host];
    [v8 setMapInsetsConstraintsEnabled:v7 forOverlay:self];
  }
}

- (void)setControllerStack:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100D6614C;
  v12[3] = &unk_1012E7DB8;
  objc_copyWeak(&v14, &location);
  id v10 = v9;
  id v13 = v10;
  v11.receiver = self;
  v11.super_class = (Class)IOSCardsOverlay;
  [(ContainerViewController *)&v11 setControllerStack:v8 animated:v6 completion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)setHidden:(BOOL)a3
{
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_hidden != a3)
  {
    self->_hidden = a3;
    double v4 = 0.2;
    if (!a4) {
      double v4 = 0.0;
    }
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100D66294;
    v5[3] = &unk_1012E6300;
    v5[4] = self;
    BOOL v6 = a3;
    +[UIView animateWithDuration:v5 animations:v4];
  }
}

- (id)passThroughView
{
  return 0;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_overlayMapInsetsConstraints, 0);

  objc_storeStrong((id *)&self->_overlayViewportConstraints, 0);
}

@end