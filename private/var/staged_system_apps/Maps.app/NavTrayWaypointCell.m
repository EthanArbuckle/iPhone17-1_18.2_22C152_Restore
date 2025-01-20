@interface NavTrayWaypointCell
+ (double)heightForCellWithWaypoint:(id)a3 etaInfo:(id)a4 shouldDisplayDeleteButton:(BOOL)a5 width:(double)a6;
+ (id)_destinationPhoneNumbersForWaypoint:(id)a3;
- (BOOL)shouldDisplayDeleteButton;
- (GEOComposedWaypoint)waypoint;
- (MNDisplayETALegInfo)etaInfo;
- (MapsFadingLabel)subtitleLabel;
- (MapsFadingLabel)titleLabel;
- (NSLayoutConstraint)labelStackViewTrailingButtonConstraint;
- (NSLayoutConstraint)trailingButtonContainerWidthConstraint;
- (NSSet)destinationPhoneNumbers;
- (NavTrayWaypointCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NavTrayWaypointCellDelegate)delegate;
- (UIImageView)leadingImageView;
- (UIView)deleteView;
- (UIView)phoneCallView;
- (UIView)trailingButtonContainerView;
- (void)_pressedDelete;
- (void)_pressedPhoneCall;
- (void)_updateActionButtons;
- (void)_updateLabelsAndLeadingImageView;
- (void)prepareForReuse;
- (void)setDelegate:(id)a3;
- (void)setDeleteView:(id)a3;
- (void)setLabelStackViewTrailingButtonConstraint:(id)a3;
- (void)setLeadingImageView:(id)a3;
- (void)setPhoneCallView:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTrailingButtonContainerView:(id)a3;
- (void)setTrailingButtonContainerWidthConstraint:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateWithWaypoint:(id)a3 etaInfo:(id)a4 shouldDisplayDeleteButton:(BOOL)a5;
@end

@implementation NavTrayWaypointCell

- (NavTrayWaypointCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v124.receiver = self;
  v124.super_class = (Class)NavTrayWaypointCell;
  v4 = [(NavTrayWaypointCell *)&v124 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    [(NavTrayWaypointCell *)v4 setAccessibilityIdentifier:v6];

    v7 = [(NavTrayWaypointCell *)v4 contentView];
    [v7 setAccessibilityIdentifier:@"NavTrayWaypointCellContent"];

    v121 = +[UIBackgroundConfiguration listCellConfiguration];
    [v121 setCornerRadius:10.0];
    [(NavTrayWaypointCell *)v4 setBackgroundConfiguration:v121];
    [(NavTrayWaypointCell *)v4 setSelectionStyle:0];
    v8 = objc_opt_new();
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 setUserInteractionEnabled:0];
    [v8 setAccessibilityIdentifier:@"ImageViewContainer"];
    v9 = [(NavTrayWaypointCell *)v4 contentView];
    v123 = v8;
    [v9 addSubview:v8];

    uint64_t v10 = objc_opt_new();
    leadingImageView = v4->_leadingImageView;
    v4->_leadingImageView = (UIImageView *)v10;

    [(UIImageView *)v4->_leadingImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_leadingImageView setContentMode:1];
    [(UIImageView *)v4->_leadingImageView setIsAccessibilityElement:1];
    [(UIImageView *)v4->_leadingImageView setAccessibilityIdentifier:@"LeadingImageView"];
    [v8 addSubview:v4->_leadingImageView];
    v12 = [MapsFadingLabel alloc];
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v16 = -[MapsFadingLabel initWithFrame:](v12, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v16;

    [(MapsFadingLabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v18 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
    [(MapsFadingLabel *)v4->_titleLabel setFont:v18];

    [(MapsFadingLabel *)v4->_titleLabel setNumberOfLines:1];
    [(MapsFadingLabel *)v4->_titleLabel setTextAlignment:0];
    [(MapsFadingLabel *)v4->_titleLabel setAccessibilityIdentifier:@"TitleLabel"];
    v19 = -[MapsFadingLabel initWithFrame:]([MapsFadingLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v19;

    [(MapsFadingLabel *)v4->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v21 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleBody maximumContentSizeCategory:UIContentSizeCategoryAccessibilityExtraExtraLarge];
    [(MapsFadingLabel *)v4->_subtitleLabel setFont:v21];

    [(MapsFadingLabel *)v4->_subtitleLabel setNumberOfLines:1];
    v22 = +[UIColor secondaryLabelColor];
    [(MapsFadingLabel *)v4->_subtitleLabel setTextColor:v22];

    [(MapsFadingLabel *)v4->_subtitleLabel setTextAlignment:0];
    [(MapsFadingLabel *)v4->_subtitleLabel setAccessibilityIdentifier:@"SubtitleLabel"];
    id v23 = objc_alloc((Class)UIStackView);
    v127[0] = v4->_titleLabel;
    v127[1] = v4->_subtitleLabel;
    v24 = +[NSArray arrayWithObjects:v127 count:2];
    id v25 = [v23 initWithArrangedSubviews:v24];

    [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v25 setDistribution:0];
    [v25 setAlignment:1];
    [v25 setAxis:1];
    [v25 setSpacing:0.0];
    LODWORD(v26) = 1132068864;
    [v25 setContentHuggingPriority:0 forAxis:v26];
    LODWORD(v27) = 1148846080;
    [v25 setContentHuggingPriority:1 forAxis:v27];
    LODWORD(v28) = 1148846080;
    [v25 setContentCompressionResistancePriority:1 forAxis:v28];
    id v29 = v25;
    v122 = v25;
    [v25 setAccessibilityIdentifier:@"LabelStackView"];
    v30 = [(NavTrayWaypointCell *)v4 contentView];
    [v30 addSubview:v29];

    v31 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
    trailingButtonContainerView = v4->_trailingButtonContainerView;
    v4->_trailingButtonContainerView = v31;

    [(UIView *)v4->_trailingButtonContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4->_trailingButtonContainerView setUserInteractionEnabled:1];
    LODWORD(v33) = 1148846080;
    [(UIView *)v4->_trailingButtonContainerView setContentHuggingPriority:0 forAxis:v33];
    LODWORD(v34) = 1148846080;
    [(UIView *)v4->_trailingButtonContainerView setContentCompressionResistancePriority:1 forAxis:v34];
    v35 = +[UIColor secondarySystemGroupedBackgroundColor];
    [(UIView *)v4->_trailingButtonContainerView setBackgroundColor:v35];

    v36 = [(NavTrayWaypointCell *)v4 contentView];
    [v36 addSubview:v4->_trailingButtonContainerView];

    v37 = [(UIView *)v4->_trailingButtonContainerView widthAnchor];
    uint64_t v38 = [v37 constraintEqualToConstant:0.0];
    trailingButtonContainerWidthConstraint = v4->_trailingButtonContainerWidthConstraint;
    v4->_trailingButtonContainerWidthConstraint = (NSLayoutConstraint *)v38;

    v40 = [NavTrayWaypointCellActionImageView alloc];
    v41 = +[UIImage systemImageNamed:@"phone.fill"];
    v42 = [(NavTrayWaypointCellActionImageView *)v40 initWithImage:v41 style:UIFontTextStyleHeadline weight:UIFontWeightRegular sideLength:42.0];
    phoneCallView = v4->_phoneCallView;
    v4->_phoneCallView = &v42->super;

    [(UIView *)v4->_phoneCallView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4->_phoneCallView setUserInteractionEnabled:1];
    v44 = +[UIColor systemBlueColor];
    [(UIView *)v4->_phoneCallView setTintColor:v44];

    id v120 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v4 action:"_pressedPhoneCall"];
    [(UIView *)v4->_phoneCallView addGestureRecognizer:v120];
    [(UIView *)v4->_phoneCallView setAccessibilityIdentifier:@"PhoneCallView"];
    v45 = +[NSBundle mainBundle];
    v46 = [v45 localizedStringForKey:@"[NavTray] [Accessibility] Phone Call Button" value:@"localized string not found" table:0];
    [(UIView *)v4->_phoneCallView setAccessibilityLabel:v46];

    v47 = [NavTrayWaypointCellActionImageView alloc];
    v48 = +[UIImage systemImageNamed:@"minus"];
    v49 = [(NavTrayWaypointCellActionImageView *)v47 initWithImage:v48 style:UIFontTextStyleTitle3 weight:UIFontWeightHeavy sideLength:42.0];
    deleteView = v4->_deleteView;
    v4->_deleteView = &v49->super;

    [(UIView *)v4->_deleteView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4->_deleteView setUserInteractionEnabled:1];
    v51 = +[UIColor systemRedColor];
    [(UIView *)v4->_deleteView setTintColor:v51];

    id v119 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v4 action:"_pressedDelete"];
    [(UIView *)v4->_deleteView addGestureRecognizer:v119];
    [(UIView *)v4->_deleteView setAccessibilityIdentifier:@"DeleteView"];
    v52 = +[NSBundle mainBundle];
    v53 = [v52 localizedStringForKey:@"[NavTray] [Accessibility] Delete Stop Button" value:@"localized string not found" table:0];
    [(UIView *)v4->_deleteView setAccessibilityLabel:v53];

    v54 = [v122 trailingAnchor];
    v55 = [(UIView *)v4->_trailingButtonContainerView leadingAnchor];
    uint64_t v56 = [v54 constraintEqualToAnchor:v55 constant:0.0];
    labelStackViewTrailingButtonConstraint = v4->_labelStackViewTrailingButtonConstraint;
    v4->_labelStackViewTrailingButtonConstraint = (NSLayoutConstraint *)v56;

    v117 = [v123 leadingAnchor];
    v118 = [(NavTrayWaypointCell *)v4 contentView];
    v116 = [v118 leadingAnchor];
    v115 = [v117 constraintEqualToAnchor:v116];
    v126[0] = v115;
    v114 = [v123 widthAnchor];
    v113 = [v114 constraintEqualToConstant:76.0];
    v126[1] = v113;
    v111 = [v123 topAnchor];
    v112 = [(NavTrayWaypointCell *)v4 contentView];
    v110 = [v112 topAnchor];
    v109 = [v111 constraintEqualToAnchor:v110];
    v126[2] = v109;
    v107 = [v123 bottomAnchor];
    v108 = [(NavTrayWaypointCell *)v4 contentView];
    v106 = [v108 bottomAnchor];
    v105 = [v107 constraintEqualToAnchor:v106];
    v126[3] = v105;
    v104 = [(UIImageView *)v4->_leadingImageView centerXAnchor];
    v103 = [v123 centerXAnchor];
    v102 = [v104 constraintEqualToAnchor:v103];
    v126[4] = v102;
    v101 = [(UIImageView *)v4->_leadingImageView centerYAnchor];
    v100 = [v123 centerYAnchor];
    v99 = [v101 constraintEqualToAnchor:v100];
    v126[5] = v99;
    v98 = [(UIImageView *)v4->_leadingImageView heightAnchor];
    v97 = [v98 constraintEqualToConstant:44.0];
    v126[6] = v97;
    v96 = [v122 leadingAnchor];
    v95 = [v123 trailingAnchor];
    v94 = [v96 constraintEqualToAnchor:v95];
    v126[7] = v94;
    v126[8] = v4->_labelStackViewTrailingButtonConstraint;
    v92 = [v122 centerYAnchor];
    v93 = [(NavTrayWaypointCell *)v4 contentView];
    v91 = [v93 centerYAnchor];
    v90 = [v92 constraintEqualToAnchor:v91];
    v126[9] = v90;
    v88 = [v122 topAnchor];
    v89 = [(NavTrayWaypointCell *)v4 contentView];
    v87 = [v89 topAnchor];
    v86 = [v88 constraintGreaterThanOrEqualToAnchor:v87];
    v126[10] = v86;
    v84 = [v122 bottomAnchor];
    v85 = [(NavTrayWaypointCell *)v4 contentView];
    v83 = [v85 bottomAnchor];
    v82 = [v84 constraintLessThanOrEqualToAnchor:v83];
    v126[11] = v82;
    v80 = [(UIView *)v4->_trailingButtonContainerView trailingAnchor];
    v81 = [(NavTrayWaypointCell *)v4 contentView];
    v79 = [v81 trailingAnchor];
    v78 = [v80 constraintEqualToAnchor:v79 constant:-18.0];
    v126[12] = v78;
    v76 = [(UIView *)v4->_trailingButtonContainerView topAnchor];
    v77 = [(NavTrayWaypointCell *)v4 contentView];
    v75 = [v77 topAnchor];
    v74 = [v76 constraintEqualToAnchor:v75];
    v126[13] = v74;
    v72 = [(UIView *)v4->_trailingButtonContainerView bottomAnchor];
    v73 = [(NavTrayWaypointCell *)v4 contentView];
    v71 = [v73 bottomAnchor];
    v70 = [v72 constraintEqualToAnchor:v71];
    v126[14] = v70;
    v58 = [(UIView *)v4->_phoneCallView heightAnchor];
    v59 = [v58 constraintEqualToConstant:42.0];
    v126[15] = v59;
    v60 = [(UIView *)v4->_phoneCallView widthAnchor];
    v61 = [v60 constraintEqualToConstant:42.0];
    v126[16] = v61;
    v62 = [(UIView *)v4->_deleteView heightAnchor];
    v63 = [v62 constraintEqualToConstant:42.0];
    v126[17] = v63;
    v64 = [(UIView *)v4->_deleteView widthAnchor];
    v65 = [v64 constraintEqualToConstant:42.0];
    v126[18] = v65;
    v66 = +[NSArray arrayWithObjects:v126 count:19];
    +[NSLayoutConstraint activateConstraints:v66];

    v125[0] = v4->_phoneCallView;
    v125[1] = v4->_deleteView;
    v125[2] = v4->_leadingImageView;
    v125[3] = v4->_titleLabel;
    v125[4] = v4->_subtitleLabel;
    v67 = +[NSArray arrayWithObjects:v125 count:5];
    [(NavTrayWaypointCell *)v4 setAccessibilityElements:v67];

    v68 = +[NSNotificationCenter defaultCenter];
    [v68 addObserver:v4 selector:"callCapabilitiesChanged" name:TUCallCapabilitiesSupportsTelephonyCallsChangedNotification object:0];
  }
  return v4;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)NavTrayWaypointCell;
  [(NavTrayWaypointCell *)&v5 prepareForReuse];
  [(UIView *)self->_phoneCallView removeFromSuperview];
  [(UIView *)self->_deleteView removeFromSuperview];
  waypoint = self->_waypoint;
  self->_waypoint = 0;

  etaInfo = self->_etaInfo;
  self->_etaInfo = 0;

  self->_shouldDisplayDeleteButton = 0;
  [(MapsFadingLabel *)self->_titleLabel setText:0];
  [(MapsFadingLabel *)self->_titleLabel setNumberOfLines:1];
  [(MapsFadingLabel *)self->_subtitleLabel setText:0];
  [(UIImageView *)self->_leadingImageView setImage:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NavTrayWaypointCell;
  [(NavTrayWaypointCell *)&v11 traitCollectionDidChange:v4];
  if (!v4) {
    goto LABEL_3;
  }
  objc_super v5 = [(NavTrayWaypointCell *)self traitCollection];
  v6 = [v5 preferredContentSizeCategory];
  v7 = [v4 preferredContentSizeCategory];
  NSComparisonResult v8 = UIContentSizeCategoryCompareToCategory(v6, v7);

  if (v8)
  {
LABEL_3:
    v9 = [(NavTrayWaypointCell *)self traitCollection];
    uint64_t v10 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleBody maximumContentSizeCategory:UIContentSizeCategoryAccessibilityExtraExtraLarge compatibleWithTraitCollection:v9];
    [(MapsFadingLabel *)self->_subtitleLabel setFont:v10];
  }
}

- (NSSet)destinationPhoneNumbers
{
  v3 = objc_opt_class();
  waypoint = self->_waypoint;

  return (NSSet *)[v3 _destinationPhoneNumbersForWaypoint:waypoint];
}

+ (id)_destinationPhoneNumbersForWaypoint:(id)a3
{
  id v3 = a3;
  if ((+[TUCallCapabilities supportsTelephonyCalls] & 1) == 0)
  {
    id v11 = +[NSSet set];
    goto LABEL_9;
  }
  id v4 = objc_opt_new();
  objc_super v5 = [v3 findMyHandleID];

  if (v5)
  {
    v6 = [v3 findMyHandle];
    v7 = [v6 phoneNumbers];
    [v4 unionSet:v7];
  }
  else
  {
    v13 = [v3 addressBookAddress];

    if (!v13) {
      goto LABEL_5;
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v14 = [v3 addressBookAddress];
    v15 = [v14 contact];
    v6 = [v15 phoneNumbers];

    id v16 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v22;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v6);
          }
          v20 = [*(id *)(*((void *)&v21 + 1) + 8 * i) value];
          [v4 addObject:v20];
        }
        id v17 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v17);
    }
  }

LABEL_5:
  NSComparisonResult v8 = [v3 geoMapItem];
  if ([v8 _hasTelephone])
  {
    v9 = [v8 _telephone];
    uint64_t v10 = +[CNPhoneNumber phoneNumberWithStringValue:v9];
    [v4 addObject:v10];
  }
  id v11 = [v4 copy];

LABEL_9:

  return v11;
}

- (void)updateWithWaypoint:(id)a3 etaInfo:(id)a4 shouldDisplayDeleteButton:(BOOL)a5
{
  NSComparisonResult v8 = (GEOComposedWaypoint *)a3;
  v9 = (MNDisplayETALegInfo *)a4;
  waypoint = self->_waypoint;
  self->_waypoint = v8;
  id v11 = v8;

  etaInfo = self->_etaInfo;
  self->_etaInfo = v9;

  self->_shouldDisplayDeleteButton = a5;
  [(NavTrayWaypointCell *)self _updateLabelsAndLeadingImageView];
  [(NavTrayWaypointCell *)self _updateActionButtons];

  [(NavTrayWaypointCell *)self setNeedsLayout];
}

- (void)_updateLabelsAndLeadingImageView
{
  [(UIImageView *)self->_leadingImageView setAccessibilityLabel:0];
  id v3 = [(GEOComposedWaypoint *)self->_waypoint findMyHandleID];

  waypoint = self->_waypoint;
  if (v3)
  {
    objc_super v5 = [(GEOComposedWaypoint *)waypoint findMyHandle];
    v6 = [(NavTrayWaypointCell *)self traitCollection];
    [v6 displayScale];
    v7 = [v5 thumbnailIconWithScale:size:];
    [(UIImageView *)self->_leadingImageView setImage:v7];

    NSComparisonResult v8 = [(GEOComposedWaypoint *)self->_waypoint findMyHandle];
    v9 = [v8 displayName];
    [(UIImageView *)self->_leadingImageView setAccessibilityLabel:v9];

    uint64_t v10 = [(GEOComposedWaypoint *)self->_waypoint findMyHandle];
    id v11 = [v10 displayName];
    [(MapsFadingLabel *)self->_titleLabel setText:v11];
    goto LABEL_5;
  }
  v12 = [(GEOComposedWaypoint *)waypoint addressBookAddress];

  v13 = self->_waypoint;
  if (v12)
  {
    v14 = [(GEOComposedWaypoint *)v13 addressBookAddress];
    v15 = [(NavTrayWaypointCell *)self traitCollection];
    [v15 displayScale];
    id v16 = [v14 thumbnailIconWithScale:3];
    [(UIImageView *)self->_leadingImageView setImage:v16];

    id v17 = [(GEOComposedWaypoint *)self->_waypoint addressBookAddress];
    uint64_t v18 = [v17 waypointCompositeName];
    [(UIImageView *)self->_leadingImageView setAccessibilityLabel:v18];

    uint64_t v10 = [(GEOComposedWaypoint *)self->_waypoint addressBookAddress];
    id v11 = [v10 waypointCompositeName];
    [(MapsFadingLabel *)self->_titleLabel setText:v11];
    goto LABEL_5;
  }
  double v26 = [(GEOComposedWaypoint *)v13 name];
  if (v26)
  {
    [(MapsFadingLabel *)self->_titleLabel setText:v26];
  }
  else
  {
    double v27 = MKLocalizedStringForUnknownLocation();
    [(MapsFadingLabel *)self->_titleLabel setText:v27];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v28 = +[GEOFeatureStyleAttributes customSavedRouteStyleAttributes];
LABEL_29:
    v31 = (void *)v28;
    v32 = [(NavTrayWaypointCell *)self traitCollection];
    [v32 displayScale];
    uint64_t v33 = +[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v31, 3, 0);
    goto LABEL_30;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v28 = +[GEOFeatureStyleAttributes evChargerStyleAttributes];
    goto LABEL_29;
  }
  id v29 = [(GEOComposedWaypoint *)self->_waypoint styleAttributes];

  v30 = self->_waypoint;
  if (v29)
  {
    uint64_t v28 = [(GEOComposedWaypoint *)v30 styleAttributes];
    goto LABEL_29;
  }
  v31 = [(GEOComposedWaypoint *)v30 mkMapItem];
  v32 = [(NavTrayWaypointCell *)self traitCollection];
  [v32 displayScale];
  uint64_t v33 = +[MKMapItem _maps_markerImageForMapItem:scale:size:useMarkerFallback:](MKMapItem, "_maps_markerImageForMapItem:scale:size:useMarkerFallback:", v31, 3, 1);
LABEL_30:
  double v34 = (void *)v33;
  [(UIImageView *)self->_leadingImageView setImage:v33];

  v35 = [(GEOComposedWaypoint *)self->_waypoint geoMapItem];
  uint64_t v10 = [v35 _poiCategory];

  if (!v10 || ![v10 hasPrefix:@"GEOPOICategory"]) {
    goto LABEL_6;
  }
  id v11 = [v10 substringFromIndex:[@"GEOPOICategory" length]];
  [(UIImageView *)self->_leadingImageView setAccessibilityLabel:v11];
LABEL_5:

LABEL_6:
  etaInfo = self->_etaInfo;
  if (etaInfo)
  {
    v20 = +[GuidanceETA etaStringFromEtaLegInfo:etaInfo includingAMPMSymbols:1];
  }
  else
  {
    v20 = 0;
  }
  if ([v20 length])
  {
    long long v21 = +[NSBundle mainBundle];
    long long v22 = [v21 localizedStringForKey:@"[NavTray] Arrival time format" value:@"localized string not found" table:0];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v20);
    id v36 = (id)objc_claimAutoreleasedReturnValue();

    v20 = v21;
  }
  else
  {
    id v36 = 0;
  }

  [(MapsFadingLabel *)self->_subtitleLabel setText:v36];
  [(MapsFadingLabel *)self->_subtitleLabel setHidden:self->_etaInfo == 0];
  long long v23 = [(MapsFadingLabel *)self->_subtitleLabel text];
  if ([v23 length])
  {
    unsigned __int8 v24 = [(MapsFadingLabel *)self->_subtitleLabel isHidden];

    if ((v24 & 1) == 0)
    {
      uint64_t v25 = 1;
      goto LABEL_17;
    }
  }
  else
  {
  }
  uint64_t v25 = 2;
LABEL_17:
  [(MapsFadingLabel *)self->_titleLabel setNumberOfLines:v25];
}

- (void)_updateActionButtons
{
  id v3 = [(NavTrayWaypointCell *)self destinationPhoneNumbers];
  id v4 = [v3 count];

  BOOL shouldDisplayDeleteButton = self->_shouldDisplayDeleteButton;
  if (v4)
  {
    [(UIView *)self->_trailingButtonContainerView addSubview:self->_phoneCallView];
    if (shouldDisplayDeleteButton)
    {
      [(UIView *)self->_trailingButtonContainerView addSubview:self->_deleteView];
      v43 = [(UIView *)self->_deleteView trailingAnchor];
      v42 = [(UIView *)self->_trailingButtonContainerView trailingAnchor];
      v41 = [v43 constraintEqualToAnchor:v42];
      v48[0] = v41;
      v40 = [(UIView *)self->_deleteView centerYAnchor];
      v39 = [(UIView *)self->_trailingButtonContainerView centerYAnchor];
      uint64_t v38 = [v40 constraintEqualToAnchor:v39];
      v48[1] = v38;
      v37 = [(UIView *)self->_phoneCallView trailingAnchor];
      v6 = [(UIView *)self->_deleteView leadingAnchor];
      v7 = [v37 constraintEqualToAnchor:v6 constant:-10.0];
      v48[2] = v7;
      NSComparisonResult v8 = [(UIView *)self->_phoneCallView leadingAnchor];
      v9 = [(UIView *)self->_trailingButtonContainerView leadingAnchor];
      uint64_t v10 = [v8 constraintEqualToAnchor:v9];
      v48[3] = v10;
      id v11 = [(UIView *)self->_phoneCallView centerYAnchor];
      v12 = [(UIView *)self->_trailingButtonContainerView centerYAnchor];
      v13 = [v11 constraintEqualToAnchor:v12];
      v48[4] = v13;
      v14 = +[NSArray arrayWithObjects:v48 count:5];
      +[NSLayoutConstraint activateConstraints:v14];
    }
    else
    {
      v45 = [(UIView *)self->_phoneCallView leadingAnchor];
      unsigned __int8 v24 = [(UIView *)self->_trailingButtonContainerView leadingAnchor];
      uint64_t v25 = [v45 constraintEqualToAnchor:v24];
      v47[0] = v25;
      double v26 = [(UIView *)self->_phoneCallView trailingAnchor];
      double v27 = [(UIView *)self->_trailingButtonContainerView trailingAnchor];
      uint64_t v28 = [v26 constraintEqualToAnchor:v27];
      v47[1] = v28;
      id v29 = [(UIView *)self->_phoneCallView centerYAnchor];
      v30 = [(UIView *)self->_trailingButtonContainerView centerYAnchor];
      v31 = [v29 constraintEqualToAnchor:v30];
      v47[2] = v31;
      v32 = +[NSArray arrayWithObjects:v47 count:3];
      +[NSLayoutConstraint activateConstraints:v32];
    }
    goto LABEL_7;
  }
  if (self->_shouldDisplayDeleteButton)
  {
    [(UIView *)self->_trailingButtonContainerView addSubview:self->_deleteView];
    v44 = [(UIView *)self->_deleteView leadingAnchor];
    v15 = [(UIView *)self->_trailingButtonContainerView leadingAnchor];
    id v16 = [v44 constraintEqualToAnchor:v15];
    v46[0] = v16;
    id v17 = [(UIView *)self->_deleteView trailingAnchor];
    uint64_t v18 = [(UIView *)self->_trailingButtonContainerView trailingAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v46[1] = v19;
    v20 = [(UIView *)self->_deleteView centerYAnchor];
    long long v21 = [(UIView *)self->_trailingButtonContainerView centerYAnchor];
    long long v22 = [v20 constraintEqualToAnchor:v21];
    v46[2] = v22;
    long long v23 = +[NSArray arrayWithObjects:v46 count:3];
    +[NSLayoutConstraint activateConstraints:v23];

LABEL_7:
    trailingButtonContainerWidthConstraint = self->_trailingButtonContainerWidthConstraint;
    uint64_t v34 = 0;
    goto LABEL_8;
  }
  [(UIView *)self->_phoneCallView removeFromSuperview];
  [(UIView *)self->_deleteView removeFromSuperview];
  trailingButtonContainerWidthConstraint = self->_trailingButtonContainerWidthConstraint;
  uint64_t v34 = 1;
LABEL_8:
  [(NSLayoutConstraint *)trailingButtonContainerWidthConstraint setActive:v34];
  unsigned int v35 = [(NSLayoutConstraint *)self->_trailingButtonContainerWidthConstraint isActive];
  double v36 = -12.0;
  if (v35) {
    double v36 = 0.0;
  }
  [(NSLayoutConstraint *)self->_labelStackViewTrailingButtonConstraint setConstant:v36];
}

- (void)_pressedPhoneCall
{
  id v3 = [(NavTrayWaypointCell *)self delegate];
  [v3 pressedPhoneCallOnCell:self];
}

- (void)_pressedDelete
{
  id v3 = [(NavTrayWaypointCell *)self delegate];
  [v3 pressedDeleteOnCell:self];
}

+ (double)heightForCellWithWaypoint:(id)a3 etaInfo:(id)a4 shouldDisplayDeleteButton:(BOOL)a5 width:(double)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v12 = [a1 _destinationPhoneNumbersForWaypoint:v10];
  id v13 = [v12 count];

  if (v13) {
    int v14 = 1;
  }
  else {
    int v14 = v7;
  }
  double v15 = 72.0;
  if (!v14) {
    double v15 = 18.0;
  }
  if (v13 != 0 && v7) {
    double v15 = 124.0;
  }
  double v16 = a6 + -76.0 - v15;
  id v17 = [v10 findMyHandleID];

  if (v17)
  {
    uint64_t v18 = [v10 findMyHandle];
    uint64_t v19 = [v18 displayName];
LABEL_12:
    long long v21 = (void *)v19;
    long long v22 = &stru_101324E70;
    if (v19) {
      long long v22 = (__CFString *)v19;
    }
    long long v23 = v22;

    goto LABEL_15;
  }
  v20 = [v10 addressBookAddress];

  if (v20)
  {
    uint64_t v18 = [v10 addressBookAddress];
    uint64_t v19 = [v18 waypointCompositeName];
    goto LABEL_12;
  }
  uint64_t v35 = [v10 name];
  uint64_t v18 = (void *)v35;
  double v36 = &stru_101324E70;
  if (v35) {
    double v36 = (__CFString *)v35;
  }
  long long v23 = v36;
LABEL_15:

  id v24 = objc_alloc((Class)NSAttributedString);
  NSAttributedStringKey v39 = NSFontAttributeName;
  uint64_t v25 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
  v40 = v25;
  double v26 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
  id v27 = [v24 initWithString:v23 attributes:v26];

  [v27 boundingRectWithSize:1 options:0 context:v16];
  double v28 = ceil(CGRectGetMaxY(v41)) + 0.0;
  if (v11)
  {
    id v29 = objc_alloc((Class)NSAttributedString);
    v30 = +[GuidanceETA etaStringFromEtaLegInfo:v11 includingAMPMSymbols:1];
    NSAttributedStringKey v37 = NSFontAttributeName;
    v31 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    uint64_t v38 = v31;
    v32 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    id v33 = [v29 initWithString:v30 attributes:v32];

    [v33 boundingRectWithSize:1 options:0 context:v16];
    double v28 = v28 + ceil(CGRectGetMaxY(v42));
    id v27 = v33;
  }

  return fmax(v28, 78.0);
}

- (NavTrayWaypointCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NavTrayWaypointCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (GEOComposedWaypoint)waypoint
{
  return self->_waypoint;
}

- (MNDisplayETALegInfo)etaInfo
{
  return self->_etaInfo;
}

- (BOOL)shouldDisplayDeleteButton
{
  return self->_shouldDisplayDeleteButton;
}

- (UIImageView)leadingImageView
{
  return self->_leadingImageView;
}

- (void)setLeadingImageView:(id)a3
{
}

- (MapsFadingLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (MapsFadingLabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UIView)phoneCallView
{
  return self->_phoneCallView;
}

- (void)setPhoneCallView:(id)a3
{
}

- (UIView)deleteView
{
  return self->_deleteView;
}

- (void)setDeleteView:(id)a3
{
}

- (UIView)trailingButtonContainerView
{
  return self->_trailingButtonContainerView;
}

- (void)setTrailingButtonContainerView:(id)a3
{
}

- (NSLayoutConstraint)trailingButtonContainerWidthConstraint
{
  return self->_trailingButtonContainerWidthConstraint;
}

- (void)setTrailingButtonContainerWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)labelStackViewTrailingButtonConstraint
{
  return self->_labelStackViewTrailingButtonConstraint;
}

- (void)setLabelStackViewTrailingButtonConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelStackViewTrailingButtonConstraint, 0);
  objc_storeStrong((id *)&self->_trailingButtonContainerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_trailingButtonContainerView, 0);
  objc_storeStrong((id *)&self->_deleteView, 0);
  objc_storeStrong((id *)&self->_phoneCallView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_leadingImageView, 0);
  objc_storeStrong((id *)&self->_etaInfo, 0);
  objc_storeStrong((id *)&self->_waypoint, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end