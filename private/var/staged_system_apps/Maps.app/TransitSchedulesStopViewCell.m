@interface TransitSchedulesStopViewCell
- (BOOL)isHighlightedStation;
- (GEOTransitLine)transitLine;
- (GEOTransitTripStop)transitTripStop;
- (MKTransitInfoLabelView)connectingTransitShieldsLabelView;
- (MapsThemeLabel)primaryTextLabel;
- (TransitDirectionsColoredLine)incomingTransitLineSection;
- (TransitDirectionsColoredLine)outgoingTransitLineSection;
- (TransitSchedulesStopViewCell)initWithFrame:(CGRect)a3;
- (TransitVehiclePositionAnnotationView)vehicleImageView;
- (UIImageView)transitLineStopIndicatorImageView;
- (UILabel)timeLabel;
- (UIView)coloredTransitLineContainerView;
- (id)createStationLinkSubview;
- (id)departureTimeColor;
- (id)primaryTextColor;
- (unint64_t)stopType;
- (void)createSubviews;
- (void)createVehicleImageView;
- (void)prepareForReuse;
- (void)setColoredTransitLineContainerView:(id)a3;
- (void)setConnectingTransitShieldsLabelView:(id)a3;
- (void)setHighlightStation:(BOOL)a3;
- (void)setIncomingTransitLineSection:(id)a3;
- (void)setOutgoingTransitLineSection:(id)a3;
- (void)setPrimaryTextLabel:(id)a3;
- (void)setStopType:(unint64_t)a3;
- (void)setTimeLabel:(id)a3;
- (void)setTransitLine:(id)a3;
- (void)setTransitLine:(id)a3 withTransitTripStop:(id)a4 stopType:(unint64_t)a5 colorStyleType:(unint64_t)a6 vehiclePosition:(unint64_t)a7 showTimeZone:(BOOL)a8;
- (void)setTransitLineStopIndicatorImageView:(id)a3;
- (void)setTransitTripStop:(id)a3;
- (void)setVehicleImageView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updatePrimaryTextFont;
- (void)updateTransitLinks;
@end

@implementation TransitSchedulesStopViewCell

- (TransitSchedulesStopViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TransitSchedulesStopViewCell;
  v3 = -[TransitSchedulesStopViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(TransitSchedulesStopViewCell *)v3 createSubviews];
  }
  return v4;
}

- (void)createSubviews
{
  v3 = [(TransitSchedulesStopViewCell *)self contentView];
  [v3 setAccessibilityIdentifier:@"TransitSchedulesStopViewCell"];
  v4 = +[UIColor clearColor];
  [(TransitSchedulesStopViewCell *)self setBackgroundColor:v4];

  v73 = [(TransitSchedulesStopViewCell *)self createStationLinkSubview];
  [(TransitSchedulesStopViewCell *)self setColoredTransitLineContainerView:v73];
  [v3 addSubview:v73];
  v5 = objc_alloc_init(MapsThemeLabel);
  [(TransitSchedulesStopViewCell *)self setPrimaryTextLabel:v5];
  [(MapsThemeLabel *)v5 setNumberOfLines:2];
  [(MapsThemeLabel *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MapsThemeLabel *)v5 setAccessibilityIdentifier:@"TransitSchedulesStopViewCellPrimaryTextLabel"];
  [v3 addSubview:v5];
  objc_super v6 = v5;
  LODWORD(v7) = 1148846080;
  [(MapsThemeLabel *)v5 setContentCompressionResistancePriority:1 forAxis:v7];
  id v8 = objc_alloc_init((Class)UILabel);
  [(TransitSchedulesStopViewCell *)self setTimeLabel:v8];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 setAccessibilityIdentifier:@"TransitSchedulesStopViewCellTimeLabel"];
  v71 = v3;
  [v3 addSubview:v8];
  v74 = v8;
  LODWORD(v9) = 1148846080;
  [v8 setContentCompressionResistancePriority:0 forAxis:v9];
  +[DynamicTypeWizard autorefreshLabel:v8 withFontProvider:&stru_101321360];
  id v10 = objc_alloc((Class)MKTransitInfoLabelView);
  id v11 = [v10 initWithLabelItems:0 iconSize:3 shieldSize:5 spaceBetweenShields:3.0 maxWidth:MKTransitInfoLabelViewNoMaxWidth];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v11 setAccessibilityIdentifier:@"TransitSchedulesStopViewCellTransitInfoLabelView"];
  [v3 addSubview:v11];
  LODWORD(v12) = 1148846080;
  [v11 setContentCompressionResistancePriority:0 forAxis:v12];
  LODWORD(v13) = 1148846080;
  [v11 setContentCompressionResistancePriority:1 forAxis:v13];
  [(TransitSchedulesStopViewCell *)self setConnectingTransitShieldsLabelView:v11];
  v68 = [v11 topAnchor];
  v72 = v6;
  v66 = [(MapsThemeLabel *)v6 bottomAnchor];
  v64 = [v68 constraintEqualToAnchor:v66 constant:2.0];
  v76[0] = v64;
  v62 = [v11 leadingAnchor];
  v60 = [(MapsThemeLabel *)v6 leadingAnchor];
  v14 = [v62 constraintEqualToAnchor:v60];
  v76[1] = v14;
  v15 = v11;
  v70 = v11;
  v16 = [v11 trailingAnchor];
  v17 = [(TransitSchedulesStopViewCell *)self contentView];
  v18 = [v17 trailingAnchor];
  v19 = [v16 constraintLessThanOrEqualToAnchor:v18 constant:-8.0];
  v76[2] = v19;
  v20 = [v15 bottomAnchor];
  v21 = [(TransitSchedulesStopViewCell *)self contentView];
  v22 = [v21 bottomAnchor];
  v23 = [v20 constraintEqualToAnchor:v22 constant:-10.0];
  v76[3] = v23;
  v24 = +[NSArray arrayWithObjects:v76 count:4];
  connectingTransitShieldsConstraints = self->_connectingTransitShieldsConstraints;
  self->_connectingTransitShieldsConstraints = v24;

  v26 = [(MapsThemeLabel *)v72 bottomAnchor];
  v27 = [v71 bottomAnchor];
  v28 = [v26 constraintLessThanOrEqualToAnchor:v27 constant:-28.0];
  stopTextToBottomConstraint = self->_stopTextToBottomConstraint;
  self->_stopTextToBottomConstraint = v28;

  v69 = [v73 topAnchor];
  v67 = [v71 topAnchor];
  v65 = [v69 constraintEqualToAnchor:v67];
  v75[0] = v65;
  v63 = [v73 bottomAnchor];
  v61 = [v71 bottomAnchor];
  v59 = [v63 constraintEqualToAnchor:v61];
  v75[1] = v59;
  v58 = [v73 leadingAnchor];
  v57 = [v71 leadingAnchor];
  v56 = [v58 constraintEqualToAnchor:v57 constant:16.0];
  v75[2] = v56;
  v55 = [v73 widthAnchor];
  v54 = [v55 constraintEqualToConstant:24.0];
  v75[3] = v54;
  v53 = [(MapsThemeLabel *)v72 topAnchor];
  v52 = [v71 topAnchor];
  v51 = [v53 constraintGreaterThanOrEqualToAnchor:v52 constant:2.0];
  v75[4] = v51;
  v49 = [(MapsThemeLabel *)v72 centerYAnchor];
  v50 = [(TransitSchedulesStopViewCell *)self transitLineStopIndicatorImageView];
  v48 = [v50 centerYAnchor];
  v47 = [v49 constraintEqualToAnchor:v48];
  v75[5] = v47;
  v46 = [(MapsThemeLabel *)v72 leadingAnchor];
  v45 = [v73 trailingAnchor];
  v44 = [v46 constraintEqualToAnchor:v45 constant:8.0];
  v30 = self->_stopTextToBottomConstraint;
  v75[6] = v44;
  v75[7] = v30;
  v43 = [v74 leadingAnchor];
  v42 = [(MapsThemeLabel *)v72 trailingAnchor];
  v41 = [v43 constraintGreaterThanOrEqualToAnchor:v42 constant:8.0];
  v75[8] = v41;
  v31 = [v74 trailingAnchor];
  v32 = [v71 trailingAnchor];
  v33 = [v31 constraintEqualToAnchor:v32 constant:-16.0];
  v75[9] = v33;
  v34 = [v74 firstBaselineAnchor];
  v35 = [(MapsThemeLabel *)v72 firstBaselineAnchor];
  v36 = [v34 constraintEqualToAnchor:v35];
  v75[10] = v36;
  v37 = [v74 bottomAnchor];
  v38 = [v71 bottomAnchor];
  v39 = [v37 constraintLessThanOrEqualToAnchor:v38];
  v75[11] = v39;
  v40 = +[NSArray arrayWithObjects:v75 count:12];
  +[NSLayoutConstraint activateConstraints:v40];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)TransitSchedulesStopViewCell;
  [(TransitSchedulesStopViewCell *)&v4 prepareForReuse];
  v3 = [(TransitSchedulesStopViewCell *)self vehicleImageView];
  [v3 removeFromSuperview];

  [(TransitSchedulesStopViewCell *)self setVehicleImageView:0];
}

- (id)createStationLinkSubview
{
  id v3 = objc_alloc_init((Class)UIView);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v4 = objc_alloc_init(TransitDirectionsColoredLine);
  [(TransitDirectionsColoredLine *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v4];
  [(TransitSchedulesStopViewCell *)self setIncomingTransitLineSection:v4];
  v5 = objc_alloc_init(TransitDirectionsColoredLine);
  [(TransitDirectionsColoredLine *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v5];
  [(TransitSchedulesStopViewCell *)self setOutgoingTransitLineSection:v5];
  id v6 = objc_alloc_init((Class)UIImageView);
  [(TransitSchedulesStopViewCell *)self setTransitLineStopIndicatorImageView:v6];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setContentMode:1];
  [v3 addSubview:v6];
  v39 = [(TransitDirectionsColoredLine *)v4 topAnchor];
  v38 = [v3 topAnchor];
  [v39 constraintEqualToAnchor:v38];
  v37 = v36 = v4;
  v40[0] = v37;
  v35 = [(TransitDirectionsColoredLine *)v4 centerXAnchor];
  v34 = [v3 centerXAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v40[1] = v33;
  v32 = [(TransitDirectionsColoredLine *)v4 widthAnchor];
  v31 = [v32 constraintEqualToConstant:4.0];
  v40[2] = v31;
  v30 = [(TransitDirectionsColoredLine *)v4 bottomAnchor];
  v29 = [v6 topAnchor];
  v28 = [v30 constraintEqualToAnchor:v29 constant:1.0];
  v40[3] = v28;
  v27 = [v6 centerXAnchor];
  v26 = [v3 centerXAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v40[4] = v25;
  v23 = [v6 topAnchor];
  v22 = [v3 topAnchor];
  v21 = [v23 constraintGreaterThanOrEqualToAnchor:v22 constant:2.0];
  v40[5] = v21;
  v20 = [(TransitDirectionsColoredLine *)v5 topAnchor];
  v19 = [v6 bottomAnchor];
  v18 = [v20 constraintEqualToAnchor:v19 constant:-1.0];
  v40[6] = v18;
  v17 = [(TransitDirectionsColoredLine *)v5 bottomAnchor];
  double v7 = [v3 bottomAnchor];
  id v8 = [v17 constraintEqualToAnchor:v7];
  v40[7] = v8;
  double v9 = v5;
  v24 = v5;
  id v10 = [(TransitDirectionsColoredLine *)v5 centerXAnchor];
  id v11 = [v3 centerXAnchor];
  double v12 = [v10 constraintEqualToAnchor:v11];
  v40[8] = v12;
  double v13 = [(TransitDirectionsColoredLine *)v9 widthAnchor];
  v14 = [v13 constraintEqualToConstant:4.0];
  v40[9] = v14;
  v15 = +[NSArray arrayWithObjects:v40 count:10];
  +[NSLayoutConstraint activateConstraints:v15];

  return v3;
}

- (void)createVehicleImageView
{
  if (!self->_vehicleImageView)
  {
    id v3 = [TransitVehicleLineAnnotation alloc];
    objc_super v4 = [(TransitSchedulesStopViewCell *)self transitLine];
    v37 = [(TransitVehicleLineAnnotation *)v3 initWithTransitLine:v4];

    v5 = [(TransitVehiclePositionAnnotationView *)[TransitScheduleCardVehiclePositionAnnotationView alloc] initWithAnnotation:v37 reuseIdentifier:@"TransitVehiclePositionAnnotationView"];
    [(TransitSchedulesStopViewCell *)self setVehicleImageView:v5];

    id v6 = [(TransitSchedulesStopViewCell *)self vehicleImageView];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v7 = [(TransitSchedulesStopViewCell *)self coloredTransitLineContainerView];
    id v8 = [(TransitSchedulesStopViewCell *)self vehicleImageView];
    [v7 addSubview:v8];

    v36 = [(TransitSchedulesStopViewCell *)self vehicleImageView];
    v34 = [v36 centerXAnchor];
    v35 = [(TransitSchedulesStopViewCell *)self coloredTransitLineContainerView];
    v33 = [v35 centerXAnchor];
    v32 = [v34 constraintEqualToAnchor:v33];
    v38[0] = v32;
    v31 = [(TransitSchedulesStopViewCell *)self vehicleImageView];
    v30 = [v31 topAnchor];
    double v9 = [(TransitSchedulesStopViewCell *)self coloredTransitLineContainerView];
    id v10 = [v9 topAnchor];
    id v11 = [v30 constraintGreaterThanOrEqualToAnchor:v10 constant:0.0];
    v38[1] = v11;
    double v12 = [(TransitSchedulesStopViewCell *)self vehicleImageView];
    double v13 = [v12 bottomAnchor];
    v14 = [(TransitSchedulesStopViewCell *)self coloredTransitLineContainerView];
    v15 = [v14 bottomAnchor];
    v16 = [v13 constraintLessThanOrEqualToAnchor:v15 constant:0.0];
    v38[2] = v16;
    v17 = +[NSArray arrayWithObjects:v38 count:3];
    +[NSLayoutConstraint activateConstraints:v17];

    v18 = [(TransitSchedulesStopViewCell *)self vehicleImageView];
    v19 = [v18 centerYAnchor];
    v20 = [(TransitSchedulesStopViewCell *)self transitLineStopIndicatorImageView];
    v21 = [v20 centerYAnchor];
    v22 = [v19 constraintEqualToAnchor:v21];
    vehicleImageAtStationConstraint = self->_vehicleImageAtStationConstraint;
    self->_vehicleImageAtStationConstraint = v22;

    v24 = [(TransitSchedulesStopViewCell *)self vehicleImageView];
    v25 = [v24 bottomAnchor];
    v26 = [(TransitSchedulesStopViewCell *)self outgoingTransitLineSection];
    v27 = [v26 bottomAnchor];
    v28 = [v25 constraintEqualToAnchor:v27];
    vehicleImageLeavingStationConstraint = self->_vehicleImageLeavingStationConstraint;
    self->_vehicleImageLeavingStationConstraint = v28;
  }
}

- (void)setTransitLine:(id)a3 withTransitTripStop:(id)a4 stopType:(unint64_t)a5 colorStyleType:(unint64_t)a6 vehiclePosition:(unint64_t)a7 showTimeZone:(BOOL)a8
{
  BOOL v8 = a8;
  id v42 = a3;
  id v41 = a4;
  if (self->_stopType == a5
    && self->_linkColorStyleType == a6
    && [(GEOTransitLine *)self->_transitLine isEqual:v42]
    && ([(GEOTransitTripStop *)self->_transitTripStop isEqual:v41] & 1) != 0)
  {
    goto LABEL_16;
  }
  objc_storeStrong((id *)&self->_transitLine, a3);
  self->_stopType = a5;
  objc_storeStrong((id *)&self->_transitTripStop, a4);
  self->_linkColorStyleType = a6;
  v15 = [(TransitSchedulesStopViewCell *)self transitTripStop];
  v16 = [v15 displayName];
  v17 = [(TransitSchedulesStopViewCell *)self primaryTextLabel];
  [v17 setText:v16];

  [(TransitSchedulesStopViewCell *)self updatePrimaryTextFont];
  objc_initWeak(&location, self);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100D62BF4;
  v43[3] = &unk_101313138;
  objc_copyWeak(&v44, &location);
  v18 = [(TransitSchedulesStopViewCell *)self primaryTextLabel];
  [v18 setTextColorProvider:v43];

  v19 = [(TransitSchedulesStopViewCell *)self transitTripStop];
  v20 = [v19 departure];

  if ([v20 isCanceled])
  {
    unsigned int v21 = [(TransitSchedulesStopViewCell *)self isHighlightedStation];
    char v22 = v21;
    if (v21)
    {
      a5 = +[NSBundle mainBundle];
      v23 = [(id)a5 localizedStringForKey:@"Schedules Stop Cell Canceled" value:@"localized string not found" table:0];
    }
    else
    {
      v23 = 0;
    }
    v27 = [(TransitSchedulesStopViewCell *)self timeLabel];
    [v27 setText:v23];

    if ((v22 & 1) == 0) {
      goto LABEL_12;
    }
  }
  else
  {
    a5 = [v20 departureDate];
    v23 = [(TransitSchedulesStopViewCell *)self transitTripStop];
    v24 = [v23 timeZone];
    v25 = +[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:a5 inTimeZone:v24 canIncludeDate:0 showTimeZone:v8 useShortFormat:0];
    v26 = [(TransitSchedulesStopViewCell *)self timeLabel];
    [v26 setText:v25];
  }
LABEL_12:
  v28 = [(TransitSchedulesStopViewCell *)self departureTimeColor];
  v29 = [(TransitSchedulesStopViewCell *)self timeLabel];
  [v29 setTextColor:v28];

  v30 = [(TransitSchedulesStopViewCell *)self transitTripStop];
  v31 = [v30 labelItems];
  BOOL v32 = [v31 count] == 0;

  v33 = [(TransitSchedulesStopViewCell *)self connectingTransitShieldsLabelView];
  if (v32)
  {
    [v33 setHidden:1];

    +[NSLayoutConstraint deactivateConstraints:self->_connectingTransitShieldsConstraints];
    stopTextToBottomConstraint = self->_stopTextToBottomConstraint;
    v38 = +[NSArray arrayWithObjects:&stopTextToBottomConstraint count:1];
    +[NSLayoutConstraint activateConstraints:v38];

    v35 = [(TransitSchedulesStopViewCell *)self connectingTransitShieldsLabelView];
    [v35 setLabelItems:0];
  }
  else
  {
    [v33 setHidden:0];

    v47 = self->_stopTextToBottomConstraint;
    v34 = +[NSArray arrayWithObjects:&v47 count:1];
    +[NSLayoutConstraint deactivateConstraints:v34];

    +[NSLayoutConstraint activateConstraints:self->_connectingTransitShieldsConstraints];
    v35 = [(TransitSchedulesStopViewCell *)self transitTripStop];
    v36 = [v35 labelItems];
    v37 = [(TransitSchedulesStopViewCell *)self connectingTransitShieldsLabelView];
    [v37 setLabelItems:v36];
  }
  [(TransitSchedulesStopViewCell *)self updateTransitLinks];

  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);
LABEL_16:
  if (a7)
  {
    [(TransitSchedulesStopViewCell *)self createVehicleImageView];
    v39 = &OBJC_IVAR___TransitSchedulesStopViewCell__vehicleImageAtStationConstraint;
    if (a7 == 1)
    {
      v40 = &OBJC_IVAR___TransitSchedulesStopViewCell__vehicleImageLeavingStationConstraint;
      goto LABEL_21;
    }
    if (a7 == 2)
    {
      v40 = &OBJC_IVAR___TransitSchedulesStopViewCell__vehicleImageAtStationConstraint;
      v39 = &OBJC_IVAR___TransitSchedulesStopViewCell__vehicleImageLeavingStationConstraint;
LABEL_21:
      [*(id *)((char *)&self->super + *v40) setActive:0];
      [*(id *)((char *)&self->super + *v39) setActive:1];
    }
  }
  [(TransitSchedulesStopViewCell *)self setNeedsUpdateConstraints];
}

- (void)updateTransitLinks
{
  id v3 = [(TransitSchedulesStopViewCell *)self transitLine];

  if (v3)
  {
    if (self->_linkColorStyleType == 2)
    {
      objc_super v4 = [(TransitSchedulesStopViewCell *)self theme];
      [v4 transitSchedulesPastStopLinkColor];
    }
    else
    {
      objc_super v4 = [(TransitSchedulesStopViewCell *)self transitLine];
      +[UIColor _mapkit_colorForTransitLine:v4];
    }
    id v23 = (id)objc_claimAutoreleasedReturnValue();

    v5 = [v23 _maps_hexString];
    if ((id)[(TransitSchedulesStopViewCell *)self stopType] == (id)1
      || (id)[(TransitSchedulesStopViewCell *)self stopType] == (id)3)
    {
      uint64_t v6 = +[MKTransitArtwork stationNodeArtworkWithHexColor:v5];
    }
    else
    {
      uint64_t v6 = +[MKTransitArtwork stationNodeOutlinedArtworkWithHexColor:v5];
    }
    double v7 = (void *)v6;
    BOOL v8 = +[MKArtworkDataSourceCache sharedInstance];
    double v9 = +[UIScreen mainScreen];
    [v9 scale];
    double v11 = v10;

    if ([(TransitSchedulesStopViewCell *)self isHighlightedStation]) {
      uint64_t v12 = 5;
    }
    else {
      uint64_t v12 = 3;
    }
    double v13 = [v8 imageForArtwork:v7 size:v12 featureType:2 scale:[self _mapkit_isDarkModeEnabled] nightMode:v11];
    v14 = [(TransitSchedulesStopViewCell *)self transitLineStopIndicatorImageView];
    [v14 setImage:v13];

    unint64_t linkColorStyleType = self->_linkColorStyleType;
    v16 = v23;
    if (linkColorStyleType == 3)
    {
      v14 = [(TransitSchedulesStopViewCell *)self theme];
      v16 = [v14 transitSchedulesPastStopLinkColor];
    }
    v17 = [(TransitSchedulesStopViewCell *)self incomingTransitLineSection];
    [v17 setLineColor:v16];

    if (linkColorStyleType == 3)
    {
    }
    v18 = [(TransitSchedulesStopViewCell *)self outgoingTransitLineSection];
    [v18 setLineColor:v23];

    BOOL v19 = (id)[(TransitSchedulesStopViewCell *)self stopType] == (id)1;
    v20 = [(TransitSchedulesStopViewCell *)self incomingTransitLineSection];
    [v20 setHidden:v19];

    BOOL v21 = (id)[(TransitSchedulesStopViewCell *)self stopType] == (id)3;
    char v22 = [(TransitSchedulesStopViewCell *)self outgoingTransitLineSection];
    [v22 setHidden:v21];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TransitSchedulesStopViewCell;
  id v4 = a3;
  [(MapsThemeCollectionViewListCell *)&v8 traitCollectionDidChange:v4];
  id v5 = [v4 userInterfaceStyle];

  uint64_t v6 = [(TransitSchedulesStopViewCell *)self traitCollection];
  id v7 = [v6 userInterfaceStyle];

  if (v5 != v7) {
    [(TransitSchedulesStopViewCell *)self updateTransitLinks];
  }
}

- (void)updatePrimaryTextFont
{
  if ([(TransitSchedulesStopViewCell *)self isHighlightedStation]) {
    id v3 = &stru_1013214C0;
  }
  else {
    id v3 = &stru_101321300;
  }
  id v5 = objc_retainBlock(v3);
  id v4 = [(TransitSchedulesStopViewCell *)self primaryTextLabel];
  +[DynamicTypeWizard autorefreshLabel:v4 withFontProvider:v5];
}

- (void)setHighlightStation:(BOOL)a3
{
  if (self->_highlightStation != a3)
  {
    self->_highlightStation = a3;
    [(TransitSchedulesStopViewCell *)self updatePrimaryTextFont];
    id v4 = [(TransitSchedulesStopViewCell *)self departureTimeColor];
    id v5 = [(TransitSchedulesStopViewCell *)self timeLabel];
    [v5 setTextColor:v4];

    [(TransitSchedulesStopViewCell *)self layoutIfNeeded];
  }
}

- (id)departureTimeColor
{
  if (self->_linkColorStyleType == 2)
  {
    id v3 = [(TransitSchedulesStopViewCell *)self theme];
    uint64_t v4 = [v3 transitSchedulesPastStopTextColor];
  }
  else
  {
    id v5 = [(TransitSchedulesStopViewCell *)self transitLine];
    id v6 = [v5 departureTimeDisplayStyle];

    id v7 = [(TransitSchedulesStopViewCell *)self transitTripStop];
    objc_super v8 = [v7 departure];
    unint64_t v9 = (unint64_t)[v8 liveStatus];

    BOOL v11 = v6 != (id)1 || v9 != 3;
    if ([(TransitSchedulesStopViewCell *)self isHighlightedStation]
      && v11
      && (v9 & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      uint64_t v12 = +[UIColor systemRedColor];
      goto LABEL_15;
    }
    id v3 = [(TransitSchedulesStopViewCell *)self theme];
    uint64_t v4 = [v3 transitSchedulesOnTimeStopTimeTextColor];
  }
  uint64_t v12 = (void *)v4;

LABEL_15:

  return v12;
}

- (id)primaryTextColor
{
  unint64_t linkColorStyleType = self->_linkColorStyleType;
  id v3 = [(TransitSchedulesStopViewCell *)self theme];
  uint64_t v4 = v3;
  if (linkColorStyleType == 2) {
    [v3 transitSchedulesPastStopTextColor];
  }
  else {
  id v5 = [v3 transitSchedulesOnTimeStopTimeTextColor];
  }

  return v5;
}

- (BOOL)isHighlightedStation
{
  return self->_highlightStation;
}

- (MapsThemeLabel)primaryTextLabel
{
  return self->_primaryTextLabel;
}

- (void)setPrimaryTextLabel:(id)a3
{
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
}

- (MKTransitInfoLabelView)connectingTransitShieldsLabelView
{
  return self->_connectingTransitShieldsLabelView;
}

- (void)setConnectingTransitShieldsLabelView:(id)a3
{
}

- (UIView)coloredTransitLineContainerView
{
  return self->_coloredTransitLineContainerView;
}

- (void)setColoredTransitLineContainerView:(id)a3
{
}

- (UIImageView)transitLineStopIndicatorImageView
{
  return self->_transitLineStopIndicatorImageView;
}

- (void)setTransitLineStopIndicatorImageView:(id)a3
{
}

- (TransitDirectionsColoredLine)incomingTransitLineSection
{
  return self->_incomingTransitLineSection;
}

- (void)setIncomingTransitLineSection:(id)a3
{
}

- (TransitDirectionsColoredLine)outgoingTransitLineSection
{
  return self->_outgoingTransitLineSection;
}

- (void)setOutgoingTransitLineSection:(id)a3
{
}

- (TransitVehiclePositionAnnotationView)vehicleImageView
{
  return self->_vehicleImageView;
}

- (void)setVehicleImageView:(id)a3
{
}

- (unint64_t)stopType
{
  return self->_stopType;
}

- (void)setStopType:(unint64_t)a3
{
  self->_stopType = a3;
}

- (GEOTransitLine)transitLine
{
  return self->_transitLine;
}

- (void)setTransitLine:(id)a3
{
}

- (GEOTransitTripStop)transitTripStop
{
  return self->_transitTripStop;
}

- (void)setTransitTripStop:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitTripStop, 0);
  objc_storeStrong((id *)&self->_transitLine, 0);
  objc_storeStrong((id *)&self->_vehicleImageView, 0);
  objc_storeStrong((id *)&self->_outgoingTransitLineSection, 0);
  objc_storeStrong((id *)&self->_incomingTransitLineSection, 0);
  objc_storeStrong((id *)&self->_transitLineStopIndicatorImageView, 0);
  objc_storeStrong((id *)&self->_coloredTransitLineContainerView, 0);
  objc_storeStrong((id *)&self->_connectingTransitShieldsLabelView, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_primaryTextLabel, 0);
  objc_storeStrong((id *)&self->_stopTextToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_connectingTransitShieldsConstraints, 0);
  objc_storeStrong((id *)&self->_placeholderString, 0);
  objc_storeStrong((id *)&self->_vehicleImageLeavingStationConstraint, 0);

  objc_storeStrong((id *)&self->_vehicleImageAtStationConstraint, 0);
}

@end