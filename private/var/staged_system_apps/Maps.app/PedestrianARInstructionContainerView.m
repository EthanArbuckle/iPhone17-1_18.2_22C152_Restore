@interface PedestrianARInstructionContainerView
- (BOOL)_isLandscape;
- (GEOComposedRoute)route;
- (MNGuidanceARInfo)_currentGuidanceInfo;
- (MNNavigationService)navigationService;
- (NSArray)_continueGuidanceInfos;
- (NSArray)_guidanceInfos;
- (NSArray)_maneuverGuidanceInfos;
- (NSLayoutConstraint)bottomConstraint;
- (NSLayoutConstraint)leadingConstraint;
- (NSLayoutConstraint)trailingConstraint;
- (PedestrianARInstructionContainerView)initWithMapViewDelegate:(id)a3 navigationService:(id)a4;
- (PedestrianARVKMapViewMapDelegate)mapViewDelegate;
- (UILabel)bottomLabel;
- (UILabel)topLabel;
- (double)_distanceToCurrentARFeature;
- (double)_iconSideLengthForArrival:(BOOL)a3;
- (id)_arrivalIcon;
- (id)_arrivedContinueGuidanceInfo;
- (id)_arrivedManeuverGuidanceInfo;
- (id)_customComposedStringForCurrentGuidanceInfo;
- (id)_customVariableOverridesForCurrentGuidanceInfo;
- (id)_sortedContinueGuidanceInfos;
- (id)_sortedManeuverGuidanceInfos;
- (id)_stringAttributesForGuidanceInfo:(id)a3 label:(id)a4;
- (void)_updateConstraints;
- (void)_updateFonts;
- (void)_updateLabelsForCurrentState;
- (void)_updateUI;
- (void)dealloc;
- (void)layoutSubviews;
- (void)mapLayer:(id)a3 activeARWalkingFeatureDidUpdate:(id)a4;
- (void)mapLayer:(id)a3 guidanceInfoDidUpdate:(id)a4 forFeature:(id)a5;
- (void)mapLayer:(id)a3 updatedFeatures:(id)a4;
- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4;
- (void)setBottomConstraint:(id)a3;
- (void)setBottomLabel:(id)a3;
- (void)setLeadingConstraint:(id)a3;
- (void)setMapViewDelegate:(id)a3;
- (void)setNavigationService:(id)a3;
- (void)setRoute:(id)a3;
- (void)setTopLabel:(id)a3;
- (void)setTrailingConstraint:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PedestrianARInstructionContainerView

- (PedestrianARInstructionContainerView)initWithMapViewDelegate:(id)a3 navigationService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v48 = sub_1005762E4();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v63 = "-[PedestrianARInstructionContainerView initWithMapViewDelegate:navigationService:]";
      __int16 v64 = 2080;
      v65 = "PedestrianARInstructionContainerView.m";
      __int16 v66 = 1024;
      int v67 = 70;
      __int16 v68 = 2080;
      v69 = "mapViewDelegate != nil";
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v49 = sub_1005762E4();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        v50 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v63 = v50;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v7)
  {
    v51 = sub_1005762E4();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v63 = "-[PedestrianARInstructionContainerView initWithMapViewDelegate:navigationService:]";
      __int16 v64 = 2080;
      v65 = "PedestrianARInstructionContainerView.m";
      __int16 v66 = 1024;
      int v67 = 71;
      __int16 v68 = 2080;
      v69 = "navigationService != nil";
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v52 = sub_1005762E4();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        v53 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v63 = v53;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v59.receiver = self;
  v59.super_class = (Class)PedestrianARInstructionContainerView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v11 = -[PedestrianARInstructionContainerView initWithFrame:](&v59, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v11)
  {
    v12 = sub_10057AEF8();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v63 = (const char *)v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeWeak((id *)&v11->_mapViewDelegate, v6);
    objc_storeWeak((id *)&v11->_navigationService, v7);
    id v58 = v6;
    v13 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    [(UILabel *)v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v14) = 1148846080;
    [(UILabel *)v13 setContentCompressionResistancePriority:1 forAxis:v14];
    [(UILabel *)v13 setNumberOfLines:0];
    v15 = +[UIColor secondaryLabelColor];
    [(UILabel *)v13 setTextColor:v15];

    [(UILabel *)v13 setLineBreakMode:0];
    [(UILabel *)v13 setLineBreakStrategy:1];
    id v57 = v7;
    topLabel = v11->_topLabel;
    v11->_topLabel = v13;

    v17 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    [(UILabel *)v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v18) = 1148846080;
    [(UILabel *)v17 setContentCompressionResistancePriority:1 forAxis:v18];
    [(UILabel *)v17 setNumberOfLines:0];
    v19 = +[UIColor labelColor];
    [(UILabel *)v17 setTextColor:v19];

    [(UILabel *)v17 setLineBreakMode:0];
    [(UILabel *)v17 setLineBreakStrategy:1];
    bottomLabel = v11->_bottomLabel;
    v11->_bottomLabel = v17;

    v56 = +[NSMutableArray array];
    [(PedestrianARInstructionContainerView *)v11 addSubview:v11->_topLabel];
    v21 = [(UILabel *)v11->_topLabel leadingAnchor];
    v22 = [(PedestrianARInstructionContainerView *)v11 safeAreaLayoutGuide];
    v23 = [v22 leadingAnchor];
    uint64_t v24 = [v21 constraintEqualToAnchor:v23 constant:26.0];
    leadingConstraint = v11->_leadingConstraint;
    v11->_leadingConstraint = (NSLayoutConstraint *)v24;

    v26 = [(UILabel *)v11->_topLabel trailingAnchor];
    v27 = [(PedestrianARInstructionContainerView *)v11 safeAreaLayoutGuide];
    v28 = [v27 trailingAnchor];
    uint64_t v29 = [v26 constraintEqualToAnchor:v28 constant:-26.0];
    trailingConstraint = v11->_trailingConstraint;
    v11->_trailingConstraint = (NSLayoutConstraint *)v29;

    v61[0] = v11->_leadingConstraint;
    v61[1] = v11->_trailingConstraint;
    v31 = +[NSArray arrayWithObjects:v61 count:2];
    [v56 addObjectsFromArray:v31];

    [(PedestrianARInstructionContainerView *)v11 addSubview:v11->_bottomLabel];
    v32 = [(UILabel *)v11->_bottomLabel bottomAnchor];
    v33 = [(PedestrianARInstructionContainerView *)v11 safeAreaLayoutGuide];
    v34 = [v33 bottomAnchor];
    uint64_t v35 = [v32 constraintEqualToAnchor:v34 constant:-24.0];
    bottomConstraint = v11->_bottomConstraint;
    v11->_bottomConstraint = (NSLayoutConstraint *)v35;

    v55 = [(UILabel *)v11->_bottomLabel leadingAnchor];
    v54 = [(UILabel *)v11->_topLabel leadingAnchor];
    v37 = [v55 constraintEqualToAnchor:v54];
    v60[0] = v37;
    v38 = [(UILabel *)v11->_bottomLabel trailingAnchor];
    v39 = [(UILabel *)v11->_topLabel trailingAnchor];
    v40 = [v38 constraintEqualToAnchor:v39];
    v60[1] = v40;
    v41 = [(UILabel *)v11->_bottomLabel topAnchor];
    v42 = [(UILabel *)v11->_topLabel bottomAnchor];
    v43 = [v41 constraintEqualToAnchor:v42 constant:9.0];
    v60[2] = v43;
    v60[3] = v11->_bottomConstraint;
    v44 = +[NSArray arrayWithObjects:v60 count:4];
    [v56 addObjectsFromArray:v44];

    id v6 = v58;
    id v7 = v57;

    +[NSLayoutConstraint activateConstraints:v56];
    id WeakRetained = objc_loadWeakRetained((id *)&v11->_mapViewDelegate);
    [WeakRetained registerObserver:v11];

    id v46 = objc_loadWeakRetained((id *)&v11->_navigationService);
    [v46 registerObserver:v11];

    [(PedestrianARInstructionContainerView *)v11 _updateUI];
  }

  return v11;
}

- (void)dealloc
{
  v3 = sub_10057AEF8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocating", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapViewDelegate);
  [WeakRetained unregisterObserver:self];

  id v5 = objc_loadWeakRetained((id *)&self->_navigationService);
  [v5 unregisterObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)PedestrianARInstructionContainerView;
  [(PedestrianARInstructionContainerView *)&v6 dealloc];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PedestrianARInstructionContainerView;
  [(PedestrianARInstructionContainerView *)&v3 layoutSubviews];
  [(PedestrianARInstructionContainerView *)self _updateUI];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PedestrianARInstructionContainerView;
  [(PedestrianARInstructionContainerView *)&v9 traitCollectionDidChange:v4];
  if (!v4) {
    goto LABEL_3;
  }
  id v5 = [(PedestrianARInstructionContainerView *)self traitCollection];
  objc_super v6 = [v5 preferredContentSizeCategory];
  id v7 = [v4 preferredContentSizeCategory];
  NSComparisonResult v8 = UIContentSizeCategoryCompareToCategory(v6, v7);

  if (v8) {
LABEL_3:
  }
    [(PedestrianARInstructionContainerView *)self _updateUI];
}

- (void)_updateUI
{
  [(PedestrianARInstructionContainerView *)self _updateFonts];
  [(PedestrianARInstructionContainerView *)self _updateConstraints];

  [(PedestrianARInstructionContainerView *)self _updateLabelsForCurrentState];
}

- (void)_updateFonts
{
  unsigned int v3 = [(PedestrianARInstructionContainerView *)self _isLandscape];
  id v4 = (id *)&UIContentSizeCategoryAccessibilityMedium;
  if (!v3) {
    id v4 = (id *)&UIContentSizeCategoryAccessibilityLarge;
  }
  id v5 = *v4;
  objc_super v6 = [(PedestrianARInstructionContainerView *)self traitCollection];
  [v6 _maps_traitCollectionWithMaximumContentSizeCategory:v5];
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = +[UIFont _maps_fontWithTextStyle:UIFontTextStyleTitle2 weight:v11 compatibleWithTraitCollection:UIFontWeightBold];
  NSComparisonResult v8 = [(PedestrianARInstructionContainerView *)self topLabel];
  [v8 setFont:v7];

  objc_super v9 = +[UIFont _maps_fontWithTextStyle:UIFontTextStyleTitle1 weight:v11 compatibleWithTraitCollection:UIFontWeightBold];
  v10 = [(PedestrianARInstructionContainerView *)self bottomLabel];
  [v10 setFont:v9];
}

- (void)_updateConstraints
{
  unsigned int v3 = [(PedestrianARInstructionContainerView *)self _isLandscape];
  id v4 = sub_10057AEF8();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      int v16 = 134349056;
      v17 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Updating constraints for landscape", (uint8_t *)&v16, 0xCu);
    }

    objc_super v6 = [(PedestrianARInstructionContainerView *)self leadingConstraint];
    [v6 setConstant:0.0];

    id v7 = [(PedestrianARInstructionContainerView *)self trailingConstraint];
    [v7 setConstant:0.0];

    NSComparisonResult v8 = [(PedestrianARInstructionContainerView *)self traitCollection];
    objc_super v9 = [v8 preferredContentSizeCategory];
    uint64_t v10 = sub_1000E93B0(v9, UIContentSizeCategoryExtraExtraExtraLarge);

    id v11 = [(PedestrianARInstructionContainerView *)self bottomConstraint];
    v12 = v11;
    if (v10 == 1) {
      double v13 = -16.0;
    }
    else {
      double v13 = -18.0;
    }
  }
  else
  {
    if (v5)
    {
      int v16 = 134349056;
      v17 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Updating constraints for portrait", (uint8_t *)&v16, 0xCu);
    }

    double v14 = [(PedestrianARInstructionContainerView *)self leadingConstraint];
    [v14 setConstant:26.0];

    v15 = [(PedestrianARInstructionContainerView *)self trailingConstraint];
    [v15 setConstant:-26.0];

    id v11 = [(PedestrianARInstructionContainerView *)self bottomConstraint];
    v12 = v11;
    double v13 = -24.0;
  }
  [v11 setConstant:v13];
}

- (NSArray)_guidanceInfos
{
  v2 = [(PedestrianARInstructionContainerView *)self mapViewDelegate];
  unsigned int v3 = [v2 currentFeatureMapping];
  id v4 = sub_100099700(v3, &stru_1012F0068);

  return (NSArray *)v4;
}

- (MNGuidanceARInfo)_currentGuidanceInfo
{
  unsigned int v3 = [(PedestrianARInstructionContainerView *)self mapViewDelegate];
  id v4 = [v3 currentFeature];

  if (v4)
  {
    BOOL v5 = [(PedestrianARInstructionContainerView *)self mapViewDelegate];
    objc_super v6 = [v5 guidanceInfoForFeature:v4];
  }
  else
  {
    objc_super v6 = 0;
  }

  return (MNGuidanceARInfo *)v6;
}

- (NSArray)_continueGuidanceInfos
{
  v2 = [(PedestrianARInstructionContainerView *)self _guidanceInfos];
  unsigned int v3 = sub_1000AC254(v2, &stru_1012F00A8);

  return (NSArray *)v3;
}

- (id)_sortedContinueGuidanceInfos
{
  unsigned int v3 = [(PedestrianARInstructionContainerView *)self _continueGuidanceInfos];
  id v4 = sub_10057AEF8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 134349314;
    objc_super v9 = self;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Will sort continue guidance infos: %@", (uint8_t *)&v8, 0x16u);
  }

  BOOL v5 = [v3 sortedArrayUsingComparator:&stru_1012F00E8];
  objc_super v6 = sub_10057AEF8();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 134349314;
    objc_super v9 = self;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Did sort continue guidance infos: %@", (uint8_t *)&v8, 0x16u);
  }

  return v5;
}

- (NSArray)_maneuverGuidanceInfos
{
  v2 = [(PedestrianARInstructionContainerView *)self _guidanceInfos];
  unsigned int v3 = sub_1000AC254(v2, &stru_1012F0108);

  return (NSArray *)v3;
}

- (id)_sortedManeuverGuidanceInfos
{
  unsigned int v3 = [(PedestrianARInstructionContainerView *)self _maneuverGuidanceInfos];
  id v4 = sub_10057AEF8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 134349314;
    objc_super v9 = self;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Will sort maneuver guidance infos: %@", (uint8_t *)&v8, 0x16u);
  }

  BOOL v5 = [v3 sortedArrayUsingComparator:&stru_1012F0128];
  objc_super v6 = sub_10057AEF8();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 134349314;
    objc_super v9 = self;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Did sort maneuver guidance infos: %@", (uint8_t *)&v8, 0x16u);
  }

  return v5;
}

- (void)_updateLabelsForCurrentState
{
  id v3 = [(PedestrianARInstructionContainerView *)self _currentGuidanceInfo];
  if (v3) {
    goto LABEL_5;
  }
  id v4 = [(PedestrianARInstructionContainerView *)self _sortedManeuverGuidanceInfos];
  BOOL v5 = [v4 firstObject];
  if (v5)
  {
    id v3 = v5;

    goto LABEL_5;
  }
  objc_super v6 = [(PedestrianARInstructionContainerView *)self _sortedContinueGuidanceInfos];
  id v3 = [v6 firstObject];

  if (v3)
  {
LABEL_5:
    if ([v3 eventType] == 1)
    {
      id v7 = [(PedestrianARInstructionContainerView *)self _sortedManeuverGuidanceInfos];
      int v8 = [v7 firstObject];
LABEL_7:

LABEL_28:
      v25 = sub_10057AEF8();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = [v3 mapsShortDescription];
        v27 = [v8 mapsShortDescription];
        *(_DWORD *)buf = 134349570;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v26;
        *(_WORD *)&buf[22] = 2112;
        double v91 = *(double *)&v27;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "[%{public}p] Will display instruction text for current guidance info: %@, next guidance info: %@", buf, 0x20u);
      }
      char IsRightToLeft = MKApplicationLayoutDirectionIsRightToLeft();
      if ([v3 eventType] != 1
        || ([v3 maneuverType] == 17 || objc_msgSend(v3, "maneuverType") == 85)
        && !v8)
      {
        v36 = [(PedestrianARInstructionContainerView *)self topLabel];
        [v36 setAttributedText:0];

        v37 = [v3 instructionString];

        if (v37)
        {
          v38 = [(PedestrianARInstructionContainerView *)self _customComposedStringForCurrentGuidanceInfo];
          id v39 = [objc_alloc((Class)MKServerFormattedString) initWithComposedString:v38];
          v40 = sub_10057AEF8();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            if ([v3 maneuverType] == 17)
            {
              CFStringRef v41 = @"StartOn";
            }
            else if ([v3 maneuverType] == 85)
            {
              CFStringRef v41 = @"Resume";
            }
            else
            {
              CFStringRef v41 = @"Maneuver";
            }
            v43 = [v3 mapsLongDescription];
            v44 = [v3 instructionString];
            *(_DWORD *)buf = 134350082;
            *(void *)&uint8_t buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v41;
            *(_WORD *)&buf[22] = 2112;
            double v91 = *(double *)&v43;
            __int16 v92 = 2112;
            v93 = v44;
            __int16 v94 = 2112;
            v95 = v38;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "[%{public}p] Configured for %@ guidance type with maneuver guidance info: %@, original string: %@, custom override string: %@", buf, 0x34u);
          }
        }
        else
        {
          id v42 = [(PedestrianARInstructionContainerView *)self _currentGuidanceInfo];
          if (v3 == v42) {
            [(PedestrianARInstructionContainerView *)self _customVariableOverridesForCurrentGuidanceInfo];
          }
          else {
          v38 = [v3 variableOverrides];
          }

          id v59 = objc_alloc((Class)MKServerFormattedStringParameters);
          buf[0] = 1;
          memset(&buf[1], 0, 17);
          buf[18] = IsRightToLeft;
          *(_DWORD *)&buf[19] = 0;
          buf[23] = 0;
          double v91 = 0.0;
          v40 = [v59 initWithOptions:buf variableOverrides:v38];
          id v60 = objc_alloc((Class)MKServerFormattedString);
          v61 = [v3 instruction];
          id v39 = [v60 initWithGeoServerString:v61 parameters:v40];

          v62 = sub_10057AEF8();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            if ([v3 maneuverType] == 17)
            {
              CFStringRef v63 = @"StartOn";
            }
            else if ([v3 maneuverType] == 85)
            {
              CFStringRef v63 = @"Resume";
            }
            else
            {
              CFStringRef v63 = @"Maneuver";
            }
            __int16 v64 = [v3 mapsLongDescription];
            v65 = [v3 variableOverrides];
            *(_DWORD *)buf = 134350082;
            *(void *)&uint8_t buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v63;
            *(_WORD *)&buf[22] = 2112;
            double v91 = *(double *)&v64;
            __int16 v92 = 2112;
            v93 = v65;
            __int16 v94 = 2112;
            v95 = v38;
            _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "[%{public}p] Configured for %@ guidance type with maneuver guidance info: %@, maneuver variable overrides: %@, custom variable overrides: %@", buf, 0x34u);
          }
        }

        __int16 v66 = [(PedestrianARInstructionContainerView *)self bottomLabel];
        v45 = [(PedestrianARInstructionContainerView *)self _stringAttributesForGuidanceInfo:v3 label:v66];

        int v67 = [v39 multiPartAttributedStringWithAttributes:v45];
        v47 = [v67 attributedString];

        v49 = [(PedestrianARInstructionContainerView *)self bottomLabel];
        [v49 setAttributedText:v47];
      }
      else
      {
        id v29 = objc_alloc((Class)MKServerFormattedStringParameters);
        v30 = [v3 variableOverrides];
        buf[0] = 1;
        memset(&buf[1], 0, 17);
        buf[18] = IsRightToLeft;
        *(_DWORD *)&buf[19] = 0;
        buf[23] = 0;
        double v91 = 0.0;
        id v31 = [v29 initWithOptions:buf variableOverrides:v30];

        v32 = [v3 instructionString];

        id v33 = objc_alloc((Class)MKServerFormattedString);
        id v86 = v31;
        if (v32)
        {
          v34 = [v3 instructionString];
          id v35 = [v33 initWithComposedString:v34];
        }
        else
        {
          v34 = [v3 instruction];
          id v35 = [v33 initWithGeoServerString:v34 parameters:v31];
        }
        v45 = v35;

        id v46 = [(PedestrianARInstructionContainerView *)self topLabel];
        v47 = [(PedestrianARInstructionContainerView *)self _stringAttributesForGuidanceInfo:v3 label:v46];

        v48 = [v45 multiPartAttributedStringWithAttributes:v47];
        v49 = [v48 attributedString];

        v50 = [(PedestrianARInstructionContainerView *)self topLabel];
        [v50 setAttributedText:v49];

        v87 = v8;
        if (v8)
        {
          id v51 = objc_alloc((Class)MKServerFormattedStringParameters);
          [v8 variableOverrides];
          v53 = v52 = v8;
          buf[0] = 1;
          memset(&buf[1], 0, 17);
          buf[18] = IsRightToLeft;
          *(_DWORD *)&buf[19] = 0;
          buf[23] = 0;
          double v91 = 0.0;
          id v54 = [v51 initWithOptions:buf variableOverrides:v53];

          v55 = [v52 instructionString];

          id v56 = objc_alloc((Class)MKServerFormattedString);
          if (v55)
          {
            id v57 = [v52 instructionString];
            id v58 = [v56 initWithComposedString:v57];
          }
          else
          {
            id v57 = [v52 instruction];
            id v58 = [v56 initWithGeoServerString:v57 parameters:v54];
          }
          __int16 v68 = v58;

          v69 = [(PedestrianARInstructionContainerView *)self bottomLabel];
          v70 = [(PedestrianARInstructionContainerView *)self _stringAttributesForGuidanceInfo:v52 label:v69];

          v71 = [v68 multiPartAttributedStringWithAttributes:v70];
          v72 = [v71 attributedString];

          v73 = [(PedestrianARInstructionContainerView *)self bottomLabel];
          [v73 setAttributedText:v72];
        }
        else
        {
          id v54 = [(PedestrianARInstructionContainerView *)self bottomLabel];
          [v54 setAttributedText:0];
        }

        v74 = sub_10057AEF8();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
        {
          v75 = [v3 mapsLongDescription];
          v76 = [v87 mapsLongDescription];
          v77 = [v3 variableOverrides];
          v78 = [v87 variableOverrides];
          *(_DWORD *)buf = 134350082;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v75;
          *(_WORD *)&buf[22] = 2112;
          double v91 = *(double *)&v76;
          __int16 v92 = 2112;
          v93 = v77;
          __int16 v94 = 2112;
          v95 = v78;
          _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_INFO, "[%{public}p] Configured for Continue guidance type with continue guidance info: %@, maneuver guidance info: %@, continue variable overrides: %@, maneuver variable overrides: %@", buf, 0x34u);
        }
        id v39 = v86;
        int v8 = v87;
      }

      goto LABEL_67;
    }
    unsigned __int8 v9 = [v3 isArrival];
    [(PedestrianARInstructionContainerView *)self _distanceToCurrentARFeature];
    double v11 = v10;
    if (v9)
    {
      GEOConfigGetDouble();
      if (v11 < v12)
      {
        double v13 = v12;
        double v14 = sub_10057AEF8();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134349568;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v11;
          *(_WORD *)&buf[22] = 2048;
          double v91 = v13;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%{public}p] Current maneuver guidance info is sufficiently close to arrival (%f < %f); showing arrival UI",
            buf,
            0x20u);
        }

        uint64_t v15 = [(PedestrianARInstructionContainerView *)self _arrivedContinueGuidanceInfo];

        int v8 = [(PedestrianARInstructionContainerView *)self _arrivedManeuverGuidanceInfo];
        id v3 = (id)v15;
        goto LABEL_28;
      }
    }
    else
    {
      GEOConfigGetDouble();
      if (v11 < v16)
      {
        double v17 = v16;
        double v18 = sub_10057AEF8();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134349568;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v11;
          *(_WORD *)&buf[22] = 2048;
          double v91 = v17;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}p] Current maneuver guidance info is too close (%f < %f); skipping to next one",
            buf,
            0x20u);
        }

        id v7 = [(PedestrianARInstructionContainerView *)self _sortedManeuverGuidanceInfos];
        v19 = [v7 indexOfObject:v3];
        if (v19 == (unsigned char *)0x7FFFFFFFFFFFFFFFLL || (v20 = v19, v19 == (char *)[v7 count] - 1))
        {
          v21 = sub_1005762E4();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = "-[PedestrianARInstructionContainerView _updateLabelsForCurrentState]";
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "PedestrianARInstructionContainerView.m";
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v91) = 273;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
          }

          if (sub_100BB36BC())
          {
            v22 = sub_1005762E4();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              v23 = +[NSThread callStackSymbols];
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v23;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
            }
          }
          uint64_t v24 = sub_10057AEF8();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134349314;
            *(void *)&uint8_t buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v7;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "[%{public}p] Cannot skip ahead to next maneuver because there aren't enough maneuvers: %@", buf, 0x16u);
          }
          int v8 = 0;
        }
        else
        {
          v81 = [v7 objectAtIndex:v20 + 1];
          v82 = [(PedestrianARInstructionContainerView *)self _continueGuidanceInfos];
          v88[0] = _NSConcreteStackBlock;
          v88[1] = 3221225472;
          v88[2] = sub_10057C7C4;
          v88[3] = &unk_1012F0150;
          int v8 = v81;
          v89 = v8;
          uint64_t v83 = sub_1000990A8(v82, v88);

          v84 = sub_10057AEF8();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
          {
            v85 = [v8 mapsShortDescription];
            *(_DWORD *)buf = 134349314;
            *(void *)&uint8_t buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v85;
            _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_INFO, "[%{public}p] Skipping ahead to maneuver: %@", buf, 0x16u);
          }
          uint64_t v24 = v89;
          id v3 = (id)v83;
        }

        goto LABEL_7;
      }
    }
    int v8 = 0;
    goto LABEL_28;
  }
  v79 = sub_10057AEF8();
  if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_INFO, "[%{public}p] There is no current guidance info nor continue guidance info; cannot update labels",
      buf,
      0xCu);
  }

  v80 = [(PedestrianARInstructionContainerView *)self topLabel];
  [v80 setText:0];

  id v3 = [(PedestrianARInstructionContainerView *)self bottomLabel];
  [v3 setText:0];
LABEL_67:
}

- (id)_stringAttributesForGuidanceInfo:(id)a3 label:(id)a4
{
  objc_super v6 = (char *)a3;
  v29[0] = MKServerFormattedStringArtworkArrowFillColorAttributeKey;
  id v7 = a4;
  int v8 = +[UIColor whiteColor];
  v30[0] = v8;
  v29[1] = MKServerFormattedStringArtworkJunctionFillColorAttributeKey;
  unsigned __int8 v9 = +[UIColor systemWhiteColor];
  double v10 = [v9 colorWithAlphaComponent:0.3];
  v30[1] = v10;
  double v11 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];

  id v12 = [v11 mutableCopy];
  double v13 = [v7 font];

  [v12 setObject:v13 forKey:NSFontAttributeName];
  id v14 = objc_alloc_init((Class)NSMutableParagraphStyle);
  [v14 setLineBreakStrategy:1];
  [v12 setObject:v14 forKey:NSParagraphStyleAttributeName];
  if ([v6 eventType] == 2 && objc_msgSend(v6, "isArrival"))
  {
    uint64_t v15 = [(PedestrianARInstructionContainerView *)self _arrivalIcon];
    if (v15)
    {
      double v16 = v15;
      double v17 = sub_10057AEF8();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        int v23 = 134349314;
        uint64_t v24 = self;
        __int16 v25 = 2112;
        v26 = v6;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "[%{public}p] Generated arrival icon for guidance info: %@", (uint8_t *)&v23, 0x16u);
      }

      [v12 setObject:v16 forKey:MKServerFormattedStringArtworkArrivalIconImageKey];
      [(PedestrianARInstructionContainerView *)self _iconSideLengthForArrival:1];
      double v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v12 setObject:v18 forKey:MKServerFormattedStringArtworkSideLengthAttributeKey];
    }
    else
    {
      v20 = sub_1005762E4();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v23 = 136315650;
        uint64_t v24 = (PedestrianARInstructionContainerView *)"-[PedestrianARInstructionContainerView _stringAttributesForGuidanceInfo:label:]";
        __int16 v25 = 2080;
        v26 = "PedestrianARInstructionContainerView.m";
        __int16 v27 = 1024;
        int v28 = 365;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v23, 0x1Cu);
      }

      if (sub_100BB36BC())
      {
        v21 = sub_1005762E4();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = +[NSThread callStackSymbols];
          int v23 = 138412290;
          uint64_t v24 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v23, 0xCu);
        }
      }
      double v16 = sub_10057AEF8();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v23 = 134349314;
        uint64_t v24 = self;
        __int16 v25 = 2112;
        v26 = v6;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[%{public}p] Could not generate arrival icon for guidance info: %@", (uint8_t *)&v23, 0x16u);
      }
    }
  }
  else
  {
    [(PedestrianARInstructionContainerView *)self _iconSideLengthForArrival:0];
    double v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v12 setObject:v16 forKey:MKServerFormattedStringArtworkSideLengthAttributeKey];
  }

  return v12;
}

- (id)_arrivalIcon
{
  id v3 = [(PedestrianARInstructionContainerView *)self route];
  id v4 = [v3 destination];
  BOOL v5 = [v4 geoMapItem];

  if (v5) {
    id v6 = [objc_alloc((Class)MKMapItem) initWithGeoMapItem:v5 isPlaceHolderPlace:0];
  }
  else {
    id v6 = 0;
  }
  id v7 = +[UIScreen mainScreen];
  [v7 scale];
  int v8 = +[MKMapItem _maps_markerImageForMapItem:scale:size:useMarkerFallback:](MKMapItem, "_maps_markerImageForMapItem:scale:size:useMarkerFallback:", v6, 3, 1);

  if (v8)
  {
    [(PedestrianARInstructionContainerView *)self _iconSideLengthForArrival:1];
    double v10 = v9;
    v14.double width = v9 + 4.0;
    v14.double height = v10;
    UIGraphicsBeginImageContextWithOptions(v14, 0, 0.0);
    [v8 drawInRect:2.0, 0.0, v10, v10];
    double v11 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (id)_arrivedContinueGuidanceInfo
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"Pedestrian_AR_arrived" value:@"localized string not found" table:0];

  id v4 = objc_alloc((Class)MNGuidanceARInfo);
  BOOL v5 = [v3 _geo_formattedString];
  id v6 = [v4 initWithEventID:0 type:1 maneuverType:18 instruction:v5 variableOverrides:0 arrowLabel:0 locationCoordinate:-180.0 -180.0 maneuverRoadName:0 heading:1.79769313e308 stepIndex:0];

  return v6;
}

- (id)_arrivedManeuverGuidanceInfo
{
  id v3 = [(PedestrianARInstructionContainerView *)self _currentGuidanceInfo];
  id v4 = v3;
  if (v3 && [v3 isArrival])
  {
    id v23 = objc_alloc((Class)MNGuidanceARInfo);
    id v5 = [v4 eventType];
    id v6 = [v4 maneuverType];
    id v7 = [(PedestrianARInstructionContainerView *)self route];
    int v8 = [v7 destination];
    double v9 = [v8 navDisplayName];
    double v10 = [v9 _geo_formattedString];
    double v11 = [v4 variableOverrides];
    id v12 = [v4 arrowLabel];
    [v4 locationCoordinate];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    v19 = [v4 maneuverRoadName];
    [v4 heading];
    id v21 = [v23 initWithEventID:0 type:v5 maneuverType:v6 instruction:v10 variableOverrides:v11 arrowLabel:v12 locationCoordinate:v14 maneuverRoadName:v16 heading:v18 stepIndex:[v4 stepIndex]];
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (BOOL)_isLandscape
{
  [(PedestrianARInstructionContainerView *)self frame];
  double Width = CGRectGetWidth(v5);
  [(PedestrianARInstructionContainerView *)self frame];
  return Width > CGRectGetHeight(v6);
}

- (double)_iconSideLengthForArrival:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PedestrianARInstructionContainerView *)self traitCollection];
  CGRect v5 = [v4 preferredContentSizeCategory];
  uint64_t v6 = sub_1000E93B0(v5, UIContentSizeCategoryExtraExtraExtraLarge);

  double result = 32.0;
  if (v3) {
    double result = 34.0;
  }
  double v8 = 42.0;
  if (v3) {
    double v8 = 44.0;
  }
  if (v6 == 1) {
    return v8;
  }
  return result;
}

- (id)_customComposedStringForCurrentGuidanceInfo
{
  v2 = [(PedestrianARInstructionContainerView *)self _currentGuidanceInfo];
  BOOL v3 = [v2 instructionString];
  if ([v2 eventType] != 2 || !objc_msgSend(v2, "isArrival")) {
    goto LABEL_26;
  }
  id v4 = [(PedestrianARInstructionContainerView *)self navigationService];
  CGRect v5 = [v4 lastLocation];

  if (!v5)
  {
    v32 = sub_1005762E4();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v54 = (PedestrianARInstructionContainerView *)"-[PedestrianARInstructionContainerView _customComposedStringForCurrentGuidanceInfo]";
      __int16 v55 = 2080;
      id v56 = "PedestrianARInstructionContainerView.m";
      __int16 v57 = 1024;
      LODWORD(v58) = 446;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      id v33 = sub_1005762E4();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        id v54 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    id v35 = sub_10057AEF8();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      id v54 = self;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "[%{public}p] Guidance info is arrival but we don't know where the user currently is; falling back to default variable overrides",
        buf,
        0xCu);
    }

    goto LABEL_26;
  }
  uint64_t v6 = [v3 defaultOptions];
  id v7 = +[NSMutableArray array];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  double v8 = [v6 arguments];
  id v9 = [v8 countByEnumeratingWithState:&v49 objects:v59 count:16];
  if (v9)
  {
    id v10 = v9;
    id v42 = v6;
    v43 = v5;
    v44 = v3;
    v45 = v2;
    char v11 = 0;
    uint64_t v12 = *(void *)v50;
    double v13 = NSCollectionLayoutEdgeSpacing_ptr;
    uint64_t v46 = *(void *)v50;
    do
    {
      double v14 = 0;
      id v47 = v10;
      do
      {
        if (*(void *)v50 != v12) {
          objc_enumerationMutation(v8);
        }
        double v15 = *(void **)(*((void *)&v49 + 1) + 8 * (void)v14);
        if (objc_msgSend(v15, "type", v42) == 1)
        {
          [(PedestrianARInstructionContainerView *)self _distanceToCurrentARFeature];
          double v17 = v16;
          double v18 = sub_10057AEF8();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            v19 = [v15 distanceFormat];
            double v20 = [v19 overrideValue];
            [v13[96] meters];
            id v21 = v7;
            id v23 = v22 = v8;
            [v20 measurementByConvertingToUnit:v23];
            v25 = uint64_t v24 = v13;
            [v25 doubleValue];
            *(_DWORD *)buf = 134349568;
            id v54 = self;
            __int16 v55 = 2048;
            id v56 = v26;
            __int16 v57 = 2048;
            double v58 = v17;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}p] Replacing distance variable override (%f) with: %f", buf, 0x20u);

            double v13 = v24;
            double v8 = v22;
            id v7 = v21;
            uint64_t v12 = v46;
            id v10 = v47;
          }
          id v27 = objc_alloc((Class)NSMeasurement);
          int v28 = [v13[96] meters];
          id v29 = [v27 initWithDoubleValue:v28 unit:v17];
          v30 = [v15 distanceFormat];
          [v30 setOverrideValue:v29];

          char v11 = 1;
        }
        [v7 addObject:v15];
        double v14 = (char *)v14 + 1;
      }
      while (v10 != v14);
      id v10 = [v8 countByEnumeratingWithState:&v49 objects:v59 count:16];
    }
    while (v10);

    BOOL v3 = v44;
    v2 = v45;
    uint64_t v6 = v42;
    CGRect v5 = v43;
    if (v11)
    {
      [v42 setArguments:v7];
      uint64_t v31 = [v44 composedStringWithOptions:v42];

      BOOL v3 = (void *)v31;
LABEL_26:
      id v36 = v3;
      goto LABEL_27;
    }
  }
  else
  {
  }
  v38 = sub_1005762E4();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    id v54 = (PedestrianARInstructionContainerView *)"-[PedestrianARInstructionContainerView _customComposedStringForCurrentGuidanceInfo]";
    __int16 v55 = 2080;
    id v56 = "PedestrianARInstructionContainerView.m";
    __int16 v57 = 1024;
    LODWORD(v58) = 470;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    id v39 = sub_1005762E4();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = +[NSThread callStackSymbols];
      *(_DWORD *)buf = 138412290;
      id v54 = v40;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
  CFStringRef v41 = sub_10057AEF8();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349314;
    id v54 = self;
    __int16 v55 = 2112;
    id v56 = (const char *)v3;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "[%{public}p] Arrival guidance info does not have distance variable override (%@); falling back to default string",
      buf,
      0x16u);
  }

  id v36 = v3;
LABEL_27:

  return v36;
}

- (id)_customVariableOverridesForCurrentGuidanceInfo
{
  BOOL v3 = [(PedestrianARInstructionContainerView *)self _currentGuidanceInfo];
  if ([v3 eventType] == 2 && objc_msgSend(v3, "isArrival"))
  {
    id v4 = [(PedestrianARInstructionContainerView *)self navigationService];
    CGRect v5 = [v4 lastLocation];

    if (v5)
    {
      uint64_t v6 = [v3 variableOverrides];
      id v7 = +[NSMutableDictionary dictionaryWithDictionary:v6];

      double v8 = [v7 objectForKey:@"{distance}"];

      if (v8)
      {
        [(PedestrianARInstructionContainerView *)self _distanceToCurrentARFeature];
        double v10 = v9;
        char v11 = sub_10057AEF8();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = [v7 objectForKey:@"{distance}"];
          [v12 doubleValue];
          int v27 = 134349568;
          int v28 = self;
          __int16 v29 = 2048;
          v30 = v13;
          __int16 v31 = 2048;
          double v32 = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}p] Replacing distance variable override (%f) with: %f", (uint8_t *)&v27, 0x20u);
        }
        double v14 = +[NSNumber numberWithDouble:v10];
        [v7 setObject:v14 forKey:@"{distance}"];

        id v15 = v7;
      }
      else
      {
        id v21 = sub_1005762E4();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          int v27 = 136315650;
          int v28 = (PedestrianARInstructionContainerView *)"-[PedestrianARInstructionContainerView _customVariableOverridesF"
                                                        "orCurrentGuidanceInfo]";
          __int16 v29 = 2080;
          v30 = "PedestrianARInstructionContainerView.m";
          __int16 v31 = 1024;
          LODWORD(v32) = 494;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v27, 0x1Cu);
        }

        if (sub_100BB36BC())
        {
          v22 = sub_1005762E4();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            id v23 = +[NSThread callStackSymbols];
            int v27 = 138412290;
            int v28 = v23;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v27, 0xCu);
          }
        }
        uint64_t v24 = sub_10057AEF8();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          __int16 v25 = [v3 variableOverrides];
          int v27 = 134349314;
          int v28 = self;
          __int16 v29 = 2112;
          v30 = v25;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "[%{public}p] Arrival guidance info does not have distance variable override (%@); falling back to default va"
            "riable overrides",
            (uint8_t *)&v27,
            0x16u);
        }
        id v15 = [v3 variableOverrides];
      }
      double v16 = v15;
    }
    else
    {
      double v17 = sub_1005762E4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v27 = 136315650;
        int v28 = (PedestrianARInstructionContainerView *)"-[PedestrianARInstructionContainerView _customVariableOverridesFor"
                                                      "CurrentGuidanceInfo]";
        __int16 v29 = 2080;
        v30 = "PedestrianARInstructionContainerView.m";
        __int16 v31 = 1024;
        LODWORD(v32) = 487;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v27, 0x1Cu);
      }

      if (sub_100BB36BC())
      {
        double v18 = sub_1005762E4();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = +[NSThread callStackSymbols];
          int v27 = 138412290;
          int v28 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v27, 0xCu);
        }
      }
      double v20 = sub_10057AEF8();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v27 = 134349056;
        int v28 = self;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "[%{public}p] Guidance info is arrival but we don't know where the user currently is; falling back to default v"
          "ariable overrides",
          (uint8_t *)&v27,
          0xCu);
      }

      double v16 = [v3 variableOverrides];
    }
  }
  else
  {
    double v16 = [v3 variableOverrides];
  }

  return v16;
}

- (double)_distanceToCurrentARFeature
{
  BOOL v3 = [(PedestrianARInstructionContainerView *)self navigationService];
  id v4 = [v3 lastLocation];

  if (v4)
  {
    [v4 coordinate];
    uint64_t v6 = v5;
    uint64_t v8 = v7;
    double v9 = [(PedestrianARInstructionContainerView *)self mapViewDelegate];
    [v9 currentFeaturePosition];
    uint64_t v11 = v10;
    uint64_t v13 = v12;

    GEOCalculateDistance();
    double v15 = v14;
    double v16 = sub_10057AEF8();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v21 = 134350336;
      v22 = self;
      __int16 v23 = 2048;
      uint64_t v24 = v6;
      __int16 v25 = 2048;
      uint64_t v26 = v8;
      __int16 v27 = 2048;
      uint64_t v28 = v11;
      __int16 v29 = 2048;
      uint64_t v30 = v13;
      __int16 v31 = 2048;
      double v32 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}p] Calculated distance between user location (%f, %f) and feature location (%f, %f): %f", (uint8_t *)&v21, 0x3Eu);
    }
  }
  else
  {
    double v17 = sub_1005762E4();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136315650;
      v22 = (PedestrianARInstructionContainerView *)"-[PedestrianARInstructionContainerView _distanceToCurrentARFeature]";
      __int16 v23 = 2080;
      uint64_t v24 = "PedestrianARInstructionContainerView.m";
      __int16 v25 = 1024;
      LODWORD(v26) = 512;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v21, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      double v18 = sub_1005762E4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = +[NSThread callStackSymbols];
        int v21 = 138412290;
        v22 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v21, 0xCu);
      }
    }
    double v16 = sub_10057AEF8();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v21 = 134349056;
      v22 = self;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[%{public}p] We don't know where the user currently is; cannot calculate distance to guidance info",
        (uint8_t *)&v21,
        0xCu);
    }
    double v15 = 1.79769313e308;
  }

  return v15;
}

- (void)mapLayer:(id)a3 activeARWalkingFeatureDidUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  double v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    BOOL v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      double v17 = sub_1005762E4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v20 = 136316418;
        int v21 = (PedestrianARInstructionContainerView *)"-[PedestrianARInstructionContainerView mapLayer:activeARWalkingFeatureDidUpdate:]";
        __int16 v22 = 2080;
        __int16 v23 = "PedestrianARInstructionContainerView.m";
        __int16 v24 = 1024;
        *(_DWORD *)__int16 v25 = 529;
        *(_WORD *)&v25[4] = 2080;
        *(void *)&v25[6] = "dispatch_get_main_queue()";
        __int16 v26 = 2080;
        __int16 v27 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v28 = 2080;
        __int16 v29 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v20,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        double v18 = sub_1005762E4();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = +[NSThread callStackSymbols];
          int v20 = 138412290;
          int v21 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v20, 0xCu);
        }
      }
    }
  }
  uint64_t v11 = [v7 feature];
  if (v11)
  {
    uint64_t v12 = [(PedestrianARInstructionContainerView *)self mapViewDelegate];
    uint64_t v13 = [v7 feature];
    double v14 = [v12 guidanceInfoForFeature:v13];
  }
  else
  {
    double v14 = 0;
  }

  double v15 = sub_10057AEF8();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    double v16 = [v14 mapsShortDescription];
    int v20 = 134349570;
    int v21 = self;
    __int16 v22 = 2112;
    __int16 v23 = (const char *)v7;
    __int16 v24 = 2112;
    *(void *)__int16 v25 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}p] Walking feature updated: %@ with guidance info: %@", (uint8_t *)&v20, 0x20u);
  }
  [(PedestrianARInstructionContainerView *)self _updateLabelsForCurrentState];
}

- (void)mapLayer:(id)a3 guidanceInfoDidUpdate:(id)a4 forFeature:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  uint64_t v12 = dispatch_queue_get_label(0);
  if (label != v12)
  {
    BOOL v13 = !label || v12 == 0;
    if (v13 || strcmp(label, v12))
    {
      double v16 = sub_1005762E4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v19 = 136316418;
        int v20 = (PedestrianARInstructionContainerView *)"-[PedestrianARInstructionContainerView mapLayer:guidanceInfoDidUpd"
                                                      "ate:forFeature:]";
        __int16 v21 = 2080;
        __int16 v22 = "PedestrianARInstructionContainerView.m";
        __int16 v23 = 1024;
        *(_DWORD *)__int16 v24 = 539;
        *(_WORD *)&v24[4] = 2080;
        *(void *)&v24[6] = "dispatch_get_main_queue()";
        __int16 v25 = 2080;
        __int16 v26 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v27 = 2080;
        __int16 v28 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v19,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        double v17 = sub_1005762E4();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          double v18 = +[NSThread callStackSymbols];
          int v19 = 138412290;
          int v20 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v19, 0xCu);
        }
      }
    }
  }
  double v14 = sub_10057AEF8();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    double v15 = [v9 mapsShortDescription];
    int v19 = 134349570;
    int v20 = self;
    __int16 v21 = 2112;
    __int16 v22 = v15;
    __int16 v23 = 2112;
    *(void *)__int16 v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%{public}p] Guidance info updated: %@ for feature: %@", (uint8_t *)&v19, 0x20u);
  }
  [(PedestrianARInstructionContainerView *)self _updateLabelsForCurrentState];
}

- (void)mapLayer:(id)a3 updatedFeatures:(id)a4
{
  id v6 = a3;
  id v7 = (char *)a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    BOOL v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      uint64_t v12 = sub_1005762E4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136316418;
        double v16 = (PedestrianARInstructionContainerView *)"-[PedestrianARInstructionContainerView mapLayer:updatedFeatures:]";
        __int16 v17 = 2080;
        double v18 = "PedestrianARInstructionContainerView.m";
        __int16 v19 = 1024;
        int v20 = 548;
        __int16 v21 = 2080;
        __int16 v22 = "dispatch_get_main_queue()";
        __int16 v23 = 2080;
        __int16 v24 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v25 = 2080;
        __int16 v26 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v15,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        BOOL v13 = sub_1005762E4();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          double v14 = +[NSThread callStackSymbols];
          int v15 = 138412290;
          double v16 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v15, 0xCu);
        }
      }
    }
  }
  uint64_t v11 = sub_10057AEF8();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v15 = 134349314;
    double v16 = self;
    __int16 v17 = 2112;
    double v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}p] Features updated: %@", (uint8_t *)&v15, 0x16u);
  }

  [(PedestrianARInstructionContainerView *)self _updateLabelsForCurrentState];
}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  id v6 = a3;
  id v7 = (char *)a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    BOOL v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      uint64_t v12 = sub_1005762E4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136316418;
        double v16 = (PedestrianARInstructionContainerView *)"-[PedestrianARInstructionContainerView navigationService:didUpdate"
                                                      "MatchedLocation:]";
        __int16 v17 = 2080;
        double v18 = "PedestrianARInstructionContainerView.m";
        __int16 v19 = 1024;
        int v20 = 559;
        __int16 v21 = 2080;
        __int16 v22 = "dispatch_get_main_queue()";
        __int16 v23 = 2080;
        __int16 v24 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v25 = 2080;
        __int16 v26 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v15,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        BOOL v13 = sub_1005762E4();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          double v14 = +[NSThread callStackSymbols];
          int v15 = 138412290;
          double v16 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v15, 0xCu);
        }
      }
    }
  }
  uint64_t v11 = sub_10057AEF8();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v15 = 134349314;
    double v16 = self;
    __int16 v17 = 2112;
    double v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}p] Got matched location update: %@", (uint8_t *)&v15, 0x16u);
  }

  [(PedestrianARInstructionContainerView *)self _updateLabelsForCurrentState];
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
}

- (PedestrianARVKMapViewMapDelegate)mapViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapViewDelegate);

  return (PedestrianARVKMapViewMapDelegate *)WeakRetained;
}

- (void)setMapViewDelegate:(id)a3
{
}

- (MNNavigationService)navigationService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationService);

  return (MNNavigationService *)WeakRetained;
}

- (void)setNavigationService:(id)a3
{
}

- (UILabel)topLabel
{
  return self->_topLabel;
}

- (void)setTopLabel:(id)a3
{
}

- (UILabel)bottomLabel
{
  return self->_bottomLabel;
}

- (void)setBottomLabel:(id)a3
{
}

- (NSLayoutConstraint)leadingConstraint
{
  return self->_leadingConstraint;
}

- (void)setLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)trailingConstraint
{
  return self->_trailingConstraint;
}

- (void)setTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)setBottomConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomLabel, 0);
  objc_storeStrong((id *)&self->_topLabel, 0);
  objc_destroyWeak((id *)&self->_navigationService);
  objc_destroyWeak((id *)&self->_mapViewDelegate);

  objc_storeStrong((id *)&self->_route, 0);
}

@end