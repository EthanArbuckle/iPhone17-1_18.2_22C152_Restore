@interface RoutePlanningElevationPopoverViewController
- (GEOComposedRoute)route;
- (void)_updateLabels;
- (void)setRoute:(id)a3;
- (void)viewDidLoad;
@end

@implementation RoutePlanningElevationPopoverViewController

- (void)viewDidLoad
{
  v98.receiver = self;
  v98.super_class = (Class)RoutePlanningElevationPopoverViewController;
  [(RoutePlanningElevationPopoverViewController *)&v98 viewDidLoad];
  id v3 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = [(RoutePlanningElevationPopoverViewController *)self view];
  [v8 addSubview:v7];

  v9 = [DirectionsElevationGraphConfiguration alloc];
  v10 = [(RoutePlanningElevationPopoverViewController *)self traitCollection];
  v96 = -[DirectionsElevationGraphConfiguration initWithUseType:userInterfaceIdiom:](v9, "initWithUseType:userInterfaceIdiom:", 0, [v10 userInterfaceIdiom]);

  v11 = [[DirectionsElevationGraphView alloc] initWithConfiguration:v96];
  elevationGraphView = self->_elevationGraphView;
  self->_elevationGraphView = v11;

  [(DirectionsElevationGraphView *)self->_elevationGraphView setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = self->_elevationGraphView;
  v14 = [(GEOComposedRoute *)self->_route elevationProfile];
  [(GEOComposedRoute *)self->_route distance];
  -[DirectionsElevationGraphView setElevationProfile:routeLength:](v13, "setElevationProfile:routeLength:", v14);

  [v7 addSubview:self->_elevationGraphView];
  v15 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle2];
  v95 = [v15 fontDescriptorWithSymbolicTraits:2];

  uint64_t v16 = +[UIFont fontWithDescriptor:v95 size:0.0];
  v17 = [[DirectionsElevationLabelView alloc] initWithStyle:0];
  ascentLabelView = self->_ascentLabelView;
  self->_ascentLabelView = v17;

  v19 = self->_ascentLabelView;
  v20 = +[UIColor labelColor];
  v93 = (void *)v16;
  [(DirectionsElevationLabelView *)v19 setFont:v16 color:v20];

  id v21 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  [v21 setNumberOfLines:2];
  v22 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v21 setFont:v22];

  v23 = +[NSBundle mainBundle];
  v24 = [v23 localizedStringForKey:@"Total Ascent [Elevation, Detail, Mac]", @"localized string not found", 0 value table];
  [v21 setText:v24];

  v94 = v21;
  LODWORD(v25) = 1148829696;
  [v21 setContentCompressionResistancePriority:0 forAxis:v25];
  id v26 = objc_alloc((Class)UIStackView);
  v101[0] = self->_ascentLabelView;
  v101[1] = v21;
  v27 = +[NSArray arrayWithObjects:v101 count:2];
  id v28 = [v26 initWithArrangedSubviews:v27];

  [v28 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v28 setAxis:1];
  [v28 setDistribution:0];
  [v28 setAlignment:0];
  [v28 setSpacing:4.0];
  LODWORD(v29) = 1148846080;
  [v28 setContentHuggingPriority:0 forAxis:v29];
  LODWORD(v30) = 1148846080;
  [v28 setContentHuggingPriority:1 forAxis:v30];
  LODWORD(v31) = 1148846080;
  [v28 setContentCompressionResistancePriority:1 forAxis:v31];
  v32 = v28;
  [v7 addSubview:v28];
  v33 = [[DirectionsElevationLabelView alloc] initWithStyle:1];
  descentLabelView = self->_descentLabelView;
  self->_descentLabelView = v33;

  v35 = self->_descentLabelView;
  v36 = +[UIColor labelColor];
  [(DirectionsElevationLabelView *)v35 setFont:v16 color:v36];

  id v37 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  [v37 setNumberOfLines:2];
  v38 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  v92 = v37;
  [v37 setFont:v38];

  v39 = +[NSBundle mainBundle];
  v40 = [v39 localizedStringForKey:@"Total Descent [Elevation, Detail, Mac]", @"localized string not found", 0 value table];
  [v37 setText:v40];

  LODWORD(v41) = 1148829696;
  [v37 setContentCompressionResistancePriority:0 forAxis:v41];
  id v42 = objc_alloc((Class)UIStackView);
  v100[0] = self->_descentLabelView;
  v100[1] = v37;
  v43 = +[NSArray arrayWithObjects:v100 count:2];
  id v44 = [v42 initWithArrangedSubviews:v43];

  [v44 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v44 setAxis:1];
  [v44 setDistribution:0];
  [v44 setAlignment:0];
  [v44 setSpacing:4.0];
  LODWORD(v45) = 1148846080;
  [v44 setContentHuggingPriority:0 forAxis:v45];
  LODWORD(v46) = 1148846080;
  [v44 setContentHuggingPriority:1 forAxis:v46];
  LODWORD(v47) = 1148846080;
  [v44 setContentCompressionResistancePriority:1 forAxis:v47];
  [v7 addSubview:v44];
  [(RoutePlanningElevationPopoverViewController *)self _updateLabels];
  id v97 = objc_alloc_init((Class)NSMutableArray);
  v48 = [(RoutePlanningElevationPopoverViewController *)self view];
  LODWORD(v49) = 1148846080;
  v50 = [v7 _maps_constraintsEqualToEdgesOfView:v48 insets:40.0, 40.0, 40.0, 30.0 priority:v49];
  v51 = [v50 allConstraints];
  [v97 addObjectsFromArray:v51];

  v91 = [(DirectionsElevationGraphView *)self->_elevationGraphView topAnchor];
  v52 = v7;
  v90 = [v7 topAnchor];
  v89 = [v91 constraintEqualToAnchor:v90];
  v99[0] = v89;
  v88 = [(DirectionsElevationGraphView *)self->_elevationGraphView leadingAnchor];
  v87 = [v7 leadingAnchor];
  v86 = [v88 constraintEqualToAnchor:v87];
  v99[1] = v86;
  v85 = [v7 trailingAnchor];
  v84 = [(DirectionsElevationGraphView *)self->_elevationGraphView trailingAnchor];
  v83 = [v85 constraintEqualToAnchor:v84];
  v99[2] = v83;
  v82 = [(DirectionsElevationGraphView *)self->_elevationGraphView widthAnchor];
  v81 = [v82 constraintEqualToConstant:320.0];
  v99[3] = v81;
  v80 = [(DirectionsElevationGraphView *)self->_elevationGraphView heightAnchor];
  v78 = [v80 constraintEqualToConstant:120.0];
  v99[4] = v78;
  v76 = [v32 topAnchor];
  v75 = [(DirectionsElevationGraphView *)self->_elevationGraphView bottomAnchor];
  v74 = [v76 constraintEqualToAnchor:v75 constant:20.0];
  v99[5] = v74;
  v73 = [v32 leadingAnchor];
  v72 = [v7 leadingAnchor];
  v71 = [v73 constraintEqualToAnchor:v72];
  v99[6] = v71;
  v70 = [v44 leadingAnchor];
  v69 = [v32 trailingAnchor];
  v68 = [v70 constraintEqualToAnchor:v69 constant:35.0];
  v99[7] = v68;
  v67 = [v7 trailingAnchor];
  v66 = [v44 trailingAnchor];
  v65 = [v67 constraintGreaterThanOrEqualToAnchor:v66];
  v99[8] = v65;
  v79 = v7;
  v64 = [v7 bottomAnchor];
  v53 = v32;
  v77 = v32;
  v63 = [v32 bottomAnchor];
  v54 = [v64 constraintGreaterThanOrEqualToAnchor:v63];
  v99[9] = v54;
  v55 = [v44 topAnchor];
  v56 = [v53 topAnchor];
  v57 = [v55 constraintEqualToAnchor:v56];
  v99[10] = v57;
  v58 = [v52 bottomAnchor];
  v59 = [v44 bottomAnchor];
  v60 = [v58 constraintGreaterThanOrEqualToAnchor:v59];
  v99[11] = v60;
  v61 = +[NSArray arrayWithObjects:v99 count:12];
  [v97 addObjectsFromArray:v61];

  +[NSLayoutConstraint activateConstraints:v97];
  v62 = [(RoutePlanningElevationPopoverViewController *)self view];
  [v62 systemLayoutSizeFittingSize:UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height];
  -[RoutePlanningElevationPopoverViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)setRoute:(id)a3
{
  id v7 = (GEOComposedRoute *)a3;
  if (self->_route != v7)
  {
    objc_storeStrong((id *)&self->_route, a3);
    [(RoutePlanningElevationPopoverViewController *)self _updateLabels];
    elevationGraphView = self->_elevationGraphView;
    v6 = [(GEOComposedRoute *)v7 elevationProfile];
    [(GEOComposedRoute *)v7 distance];
    -[DirectionsElevationGraphView setElevationProfile:routeLength:](elevationGraphView, "setElevationProfile:routeLength:", v6);
  }
}

- (void)_updateLabels
{
  id v3 = [(GEOComposedRoute *)self->_route elevationProfile];

  if (v3)
  {
    v4 = [(GEOComposedRoute *)self->_route elevationProfile];
    double v5 = (double)[v4 sumElevationGainCm] / 100.0;

    v6 = [(GEOComposedRoute *)self->_route elevationProfile];
    double v7 = (double)[v6 sumElevationLossCm] / 100.0;
  }
  else
  {
    double v7 = 0.0;
    double v5 = 0.0;
  }
  v8 = sub_100577384();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = self;
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    if (objc_opt_respondsToSelector())
    {
      v12 = [(RoutePlanningElevationPopoverViewController *)v9 performSelector:"accessibilityIdentifier"];
      v13 = v12;
      if (v12 && ![v12 isEqualToString:v11])
      {
        v14 = +[NSString stringWithFormat:@"%@<%p, %@>", v11, v9, v13];

        goto LABEL_10;
      }
    }
    v14 = +[NSString stringWithFormat:@"%@<%p>", v11, v9];
LABEL_10:

    *(_DWORD *)buf = 138412290;
    v24 = v14;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@ | Will update labels for gain/loss", buf, 0xCu);
  }
  ascentLabelView = self->_ascentLabelView;
  id v16 = objc_alloc((Class)NSMeasurement);
  v17 = +[NSUnitLength meters];
  id v18 = [v16 initWithDoubleValue:v17 unit:v5];
  [(DirectionsElevationLabelView *)ascentLabelView setElevation:v18];

  descentLabelView = self->_descentLabelView;
  id v20 = objc_alloc((Class)NSMeasurement);
  id v21 = +[NSUnitLength meters];
  id v22 = [v20 initWithDoubleValue:v21 unit:v7];
  [(DirectionsElevationLabelView *)descentLabelView setElevation:v22];
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_descentLabelView, 0);
  objc_storeStrong((id *)&self->_ascentLabelView, 0);

  objc_storeStrong((id *)&self->_elevationGraphView, 0);
}

@end