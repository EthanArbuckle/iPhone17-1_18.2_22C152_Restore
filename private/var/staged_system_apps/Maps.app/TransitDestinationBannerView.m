@interface TransitDestinationBannerView
- (BOOL)expanded;
- (BOOL)showsControls;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SBUISystemApertureAccessoryView)detachedMinimalView;
- (SBUISystemApertureAccessoryView)leadingView;
- (SBUISystemApertureAccessoryView)minimalView;
- (SBUISystemApertureAccessoryView)trailingView;
- (TransitDestinationBannerView)initWithTarget:(id)a3 item:(id)a4 aperturePresentation:(BOOL)a5;
- (UIImageView)primaryImageView;
- (UILabel)primaryLabel;
- (UIView)controlsView;
- (unint64_t)bannerType;
- (void)setControlsView:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setPrimaryImageView:(id)a3;
- (void)setPrimaryLabel:(id)a3;
- (void)setShowsControls:(BOOL)a3;
- (void)updateFromBannerItem;
@end

@implementation TransitDestinationBannerView

- (TransitDestinationBannerView)initWithTarget:(id)a3 item:(id)a4 aperturePresentation:(BOOL)a5
{
  BOOL v5 = a5;
  v102.receiver = self;
  v102.super_class = (Class)TransitDestinationBannerView;
  v6 = -[MapsBannerView initWithTarget:item:aperturePresentation:](&v102, "initWithTarget:item:aperturePresentation:", a3, a4);
  if (v6)
  {
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    [(TransitDestinationBannerView *)v6 setAccessibilityIdentifier:v8];

    BOOL v95 = v5;
    if (v5)
    {
      v9 = [EmptyApertureView alloc];
      double y = CGRectZero.origin.y;
      double width = CGRectZero.size.width;
      double height = CGRectZero.size.height;
      v13 = -[EmptyApertureView initWithFrame:](v9, "initWithFrame:", CGRectZero.origin.x, y, width, height);
      trailingView = v6->_trailingView;
      v6->_trailingView = v13;

      [(EmptyApertureView *)v6->_trailingView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(TransitDestinationBannerView *)v6 addSubview:v6->_trailingView];
      v15 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
      leadingImageView = v6->_leadingImageView;
      v6->_leadingImageView = v15;

      [(UIImageView *)v6->_leadingImageView setAccessibilityIdentifier:@"LeadingImageView"];
      v17 = +[UIImage systemImageNamed:@"tram.fill"];
      [(UIImageView *)v6->_leadingImageView setImage:v17];

      v18 = +[MapsTheme apertureKeyColor];
      [(UIImageView *)v6->_leadingImageView setTintColor:v18];

      [(UIImageView *)v6->_leadingImageView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIImageView *)v6->_leadingImageView setContentMode:1];
      v19 = [[TransitApertureElementWrapperView alloc] initWithWrappedView:v6->_leadingImageView isDetached:0];
      leadingView = v6->_leadingView;
      v6->_leadingView = v19;

      [(TransitApertureElementWrapperView *)v6->_leadingView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(TransitDestinationBannerView *)v6 addSubview:v6->_leadingView];
      v97 = [(TransitApertureElementWrapperView *)v6->_leadingView widthAnchor];
      v93 = [v97 constraintEqualToConstant:20.0];
      v105[0] = v93;
      v91 = [(TransitApertureElementWrapperView *)v6->_leadingView heightAnchor];
      v90 = [v91 constraintEqualToConstant:20.0];
      v105[1] = v90;
      v21 = [(TransitApertureElementWrapperView *)v6->_leadingView leadingAnchor];
      v22 = [(TransitDestinationBannerView *)v6 SBUISA_systemApertureLeadingConcentricContentLayoutGuide];
      v23 = [v22 leadingAnchor];
      [(MapsBannerView *)v6 bannerAccessoryViewLeadingInset];
      v24 = [v21 constraintEqualToAnchor:v23];
      v105[2] = v24;
      v25 = [(EmptyApertureView *)v6->_trailingView trailingAnchor];
      v26 = [(TransitDestinationBannerView *)v6 SBUISA_systemApertureTrailingConcentricContentLayoutGuide];
      v27 = [v26 trailingAnchor];
      v28 = [v25 constraintEqualToAnchor:v27];
      v105[3] = v28;
      v29 = +[NSArray arrayWithObjects:v105 count:4];

      long long v100 = 0u;
      long long v101 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      id v30 = v29;
      id v31 = [v30 countByEnumeratingWithState:&v98 objects:v104 count:16];
      if (v31)
      {
        id v33 = v31;
        uint64_t v34 = *(void *)v99;
        do
        {
          for (i = 0; i != v33; i = (char *)i + 1)
          {
            if (*(void *)v99 != v34) {
              objc_enumerationMutation(v30);
            }
            LODWORD(v32) = 1144750080;
            [*(id *)(*((void *)&v98 + 1) + 8 * i) setPriority:v32];
          }
          id v33 = [v30 countByEnumeratingWithState:&v98 objects:v104 count:16];
        }
        while (v33);
      }

      +[NSLayoutConstraint activateConstraints:v30];
      v36 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
      minimalImageView = v6->_minimalImageView;
      v6->_minimalImageView = v36;

      [(UIImageView *)v6->_minimalImageView setAccessibilityIdentifier:@"MinimalImageView"];
      v38 = +[UIImage systemImageNamed:@"tram.fill"];
      [(UIImageView *)v6->_minimalImageView setImage:v38];

      v39 = +[MapsTheme apertureKeyColor];
      [(UIImageView *)v6->_minimalImageView setTintColor:v39];

      [(UIImageView *)v6->_minimalImageView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIImageView *)v6->_minimalImageView setContentMode:1];
      v40 = [[TransitApertureElementWrapperView alloc] initWithWrappedView:v6->_minimalImageView isDetached:0];
      minimalView = v6->_minimalView;
      v6->_minimalView = v40;

      [(TransitApertureElementWrapperView *)v6->_minimalView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(TransitDestinationBannerView *)v6 addSubview:v6->_minimalView];
      v42 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
      detachedMinimalImageView = v6->_detachedMinimalImageView;
      v6->_detachedMinimalImageView = v42;

      [(UIImageView *)v6->_detachedMinimalImageView setAccessibilityIdentifier:@"DetachedMinimalImageView"];
      v44 = +[UIImage systemImageNamed:@"tram.fill"];
      [(UIImageView *)v6->_detachedMinimalImageView setImage:v44];

      v45 = +[MapsTheme apertureKeyColor];
      [(UIImageView *)v6->_detachedMinimalImageView setTintColor:v45];

      [(UIImageView *)v6->_detachedMinimalImageView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIImageView *)v6->_detachedMinimalImageView setContentMode:1];
      v46 = [[TransitApertureElementWrapperView alloc] initWithWrappedView:v6->_detachedMinimalImageView isDetached:1];
      detachedMinimalView = v6->_detachedMinimalView;
      v6->_detachedMinimalView = v46;

      [(TransitApertureElementWrapperView *)v6->_detachedMinimalView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(TransitDestinationBannerView *)v6 addSubview:v6->_detachedMinimalView];
    }
    id v48 = objc_alloc((Class)UILabel);
    double v49 = CGRectZero.origin.y;
    double v50 = CGRectZero.size.width;
    double v51 = CGRectZero.size.height;
    v52 = [v48 initWithFrame:CGRectZero.origin.x, v49, v50, v51];
    primaryLabel = v6->_primaryLabel;
    v6->_primaryLabel = v52;

    [(UILabel *)v6->_primaryLabel setAccessibilityIdentifier:@"PrimaryLabel"];
    [(UILabel *)v6->_primaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v54 = +[UIColor labelColor];
    v55 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:2];
    v56 = [v54 resolvedColorWithTraitCollection:v55];
    [(UILabel *)v6->_primaryLabel setTextColor:v56];

    [(UILabel *)v6->_primaryLabel setNumberOfLines:3];
    v57 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleTitle2 weight:UIFontWeightBold];
    [(UILabel *)v6->_primaryLabel setFont:v57];

    v58 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, v49, v50, v51];
    primaryImageView = v6->_primaryImageView;
    v6->_primaryImageView = v58;

    [(UIImageView *)v6->_primaryImageView setAccessibilityIdentifier:@"PrimaryImageView"];
    v60 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleTitle2 weight:UIFontWeightBold];
    v94 = +[UIImageSymbolConfiguration configurationWithFont:v60];
    v61 = +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", @"tram.fill");
    [(UIImageView *)v6->_primaryImageView setImage:v61];

    v62 = +[UIColor labelColor];
    v63 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:2];
    v64 = [v62 resolvedColorWithTraitCollection:v63];
    [(UIImageView *)v6->_primaryImageView setTintColor:v64];

    [(UIImageView *)v6->_primaryImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v6->_primaryImageView setContentMode:4];
    if (v95)
    {
      v65 = +[NSBundle mainBundle];
      v66 = [v65 localizedStringForKey:@"[Nav Banner] End Route" value:@"localized string not found" table:0];
      v67 = +[UIAction actionWithTitle:v66 image:0 identifier:0 handler:&stru_101321648];

      [v67 setAttributes:[v67 attributes] | 2];
      v68 = +[UIButtonConfiguration sbui_systemApertureTextButtonConfiguration];
      v69 = +[UIColor systemRedColor];
      [v68 setBaseBackgroundColor:v69];

      v70 = +[UIColor systemRedColor];
      [v68 setBaseForegroundColor:v70];

      v71 = +[SBUISystemApertureButton buttonWithConfiguration:v68 primaryAction:v67];
      [(UIView *)v71 setAccessibilityIdentifier:@"EndButton"];
      [(UIView *)v71 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)v71 setHidden:1];
      controlsView = v6->_controlsView;
      v6->_controlsView = v71;
      v92 = v71;

      v96 = v6->_controlsView;
      v73 = [(UILabel *)v6->_primaryLabel _tightBoundingBoxLayoutGuide];
      v74 = [v73 topAnchor];
      [(TransitDestinationBannerView *)v6 SBUISA_systemApertureObstructedAreaLayoutGuide];
      v76 = v75 = v60;
      v77 = [v76 bottomAnchor];
      uint64_t v78 = [v74 constraintEqualToAnchor:v77];
      topConstraint = v6->_topConstraint;
      v6->_topConstraint = (NSLayoutConstraint *)v78;

      v60 = v75;
      v80 = GEOResultRefinementSort_ptr;

      LODWORD(v81) = 1144750080;
      [(NSLayoutConstraint *)v6->_topConstraint setPriority:v81];
    }
    else
    {
      v96 = 0;
      v80 = GEOResultRefinementSort_ptr;
    }
    v82 = [(UIImageView *)v6->_primaryImageView heightAnchor];
    v83 = [v82 constraintEqualToConstant:36.0];
    v103[0] = v83;
    v84 = [(UIImageView *)v6->_primaryImageView widthAnchor];
    v85 = [v84 constraintEqualToConstant:36.0];
    v103[1] = v85;
    v86 = [v80[501] arrayWithObjects:v103 count:2];
    +[NSLayoutConstraint activateConstraints:v86];

    v87 = [[MapsBannerContent alloc] initWithHeaderView:0 iconView:v6->_primaryImageView leadingTopView:v6->_primaryLabel trailingTopView:0 bottomView:0 footerView:v96];
    v88 = [(MapsBannerView *)v6 contentView];
    [v88 setContent:v87];

    [(TransitDestinationBannerView *)v6 updateFromBannerItem];
    v6->_cachedHeight = -1.0;
    v6->_calculatedWidth = -1.0;
  }
  return v6;
}

- (void)updateFromBannerItem
{
  id v5 = [(MapsBannerView *)self item];
  v3 = [v5 title];
  v4 = [(TransitDestinationBannerView *)self primaryLabel];
  [v4 setText:v3];

  self->_cachedHeight = -1.0;
}

- (unint64_t)bannerType
{
  return 3;
}

- (void)setShowsControls:(BOOL)a3
{
  unsigned int v4 = [(MapsBannerView *)self aperturePresentation] && a3;
  if (self->_showsControls != v4)
  {
    self->_showsControls = v4;
    [(UIView *)self->_controlsView setHidden:v4 ^ 1];
    self->_cachedHeight = -1.0;
  }
}

- (void)setExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  self->_expanded = a3;
  id v5 = [(TransitDestinationBannerView *)self leadingView];
  v6 = v5;
  if (v3)
  {
    [v5 setAlpha:0.0];

    v7 = [(TransitDestinationBannerView *)self trailingView];
    [v7 setAlpha:0.0];

    v8 = [(TransitDestinationBannerView *)self minimalView];
    [v8 setAlpha:0.0];

    v9 = [(TransitDestinationBannerView *)self detachedMinimalView];
    [v9 setAlpha:0.0];

    v10 = [(MapsBannerView *)self contentView];
    v11 = v10;
    double v12 = 1.0;
  }
  else
  {
    [v5 setAlpha:1.0];

    v13 = [(TransitDestinationBannerView *)self trailingView];
    [v13 setAlpha:1.0];

    v14 = [(TransitDestinationBannerView *)self minimalView];
    [v14 setAlpha:1.0];

    v15 = [(TransitDestinationBannerView *)self detachedMinimalView];
    [v15 setAlpha:1.0];

    v10 = [(MapsBannerView *)self contentView];
    v11 = v10;
    double v12 = 0.0;
  }
  [v10 setAlpha:v12];

  topConstraint = self->_topConstraint;

  [(NSLayoutConstraint *)topConstraint setActive:v3];
}

- (SBUISystemApertureAccessoryView)leadingView
{
  return (SBUISystemApertureAccessoryView *)self->_leadingView;
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return (SBUISystemApertureAccessoryView *)self->_trailingView;
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return (SBUISystemApertureAccessoryView *)self->_minimalView;
}

- (SBUISystemApertureAccessoryView)detachedMinimalView
{
  return (SBUISystemApertureAccessoryView *)self->_detachedMinimalView;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  double cachedHeight = self->_cachedHeight;
  if (cachedHeight == -1.0 || self->_calculatedWidth != a3.width)
  {
    if ([(MapsBannerView *)self aperturePresentation])
    {
      v7 = [(TransitDestinationBannerView *)self SBUISA_systemApertureObstructedAreaLayoutGuide];
      [v7 layoutFrame];
      double MaxY = CGRectGetMaxY(v25);
      v9 = [(MapsBannerView *)self contentView];
      [v9 _maps_compressedSizeForWidth:0 withBlock:width];
      double v11 = MaxY + v10 + 17.0;
    }
    else
    {
      [(TransitDestinationBannerView *)self _maps_compressedSizeForWidth:0 withBlock:width];
      double v11 = v12;
    }
    if (v11 <= height)
    {
      self->_double cachedHeight = v11;
      self->_calculatedWidth = width;
      double cachedHeight = self->_cachedHeight;
    }
    else
    {
      v13 = sub_1000AD30C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        v14 = [(MapsBannerView *)self item];
        v23.CGFloat width = width;
        v23.double height = height;
        v15 = NSStringFromCGSize(v23);
        int v17 = 138412802;
        v18 = v14;
        __int16 v19 = 2112;
        v20 = v15;
        __int16 v21 = 2048;
        double v22 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "Banner: %@ wasn't able to draw correctly in the provided space: %@ desired height: %f", (uint8_t *)&v17, 0x20u);
      }
      double cachedHeight = height;
    }
  }
  double v16 = width;
  result.double height = cachedHeight;
  result.CGFloat width = v16;
  return result;
}

- (BOOL)showsControls
{
  return self->_showsControls;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
}

- (UIImageView)primaryImageView
{
  return self->_primaryImageView;
}

- (void)setPrimaryImageView:(id)a3
{
}

- (UIView)controlsView
{
  return self->_controlsView;
}

- (void)setControlsView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlsView, 0);
  objc_storeStrong((id *)&self->_primaryImageView, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_detachedMinimalImageView, 0);
  objc_storeStrong((id *)&self->_detachedMinimalView, 0);
  objc_storeStrong((id *)&self->_minimalImageView, 0);
  objc_storeStrong((id *)&self->_minimalView, 0);
  objc_storeStrong((id *)&self->_leadingImageView, 0);

  objc_storeStrong((id *)&self->_leadingView, 0);
}

@end