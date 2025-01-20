@interface CarWaypointCell
- (BOOL)displaysThirdDetailLine;
- (CarWaypointCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_setupConstraints;
- (void)_setupStyles;
- (void)_setupSubviews;
- (void)_updateLabelColors:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setupWithWaypoint:(id)a3 etaInfo:(id)a4 isRemovable:(BOOL)a5;
@end

@implementation CarWaypointCell

- (CarWaypointCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CarWaypointCell;
  v4 = [(CarWaypointCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(CarWaypointCell *)v4 contentView];
    [v6 setClipsToBounds:1];

    [(CarWaypointCell *)v5 _setupSubviews];
    [(CarWaypointCell *)v5 _setupConstraints];
    [(CarWaypointCell *)v5 _setupStyles];
  }
  return v5;
}

- (void)_setupSubviews
{
  id v3 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  titleLabel = self->_titleLabel;
  self->_titleLabel = v7;

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = [(CarWaypointCell *)self contentView];
  [v9 addSubview:self->_titleLabel];

  v10 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  arrivalLabel = self->_arrivalLabel;
  self->_arrivalLabel = v10;

  [(UILabel *)self->_arrivalLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v12 = [(CarWaypointCell *)self contentView];
  [v12 addSubview:self->_arrivalLabel];

  v13 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  tapToRemoveLabel = self->_tapToRemoveLabel;
  self->_tapToRemoveLabel = v13;

  [(UILabel *)self->_tapToRemoveLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  id v15 = [(CarWaypointCell *)self contentView];
  [v15 addSubview:self->_tapToRemoveLabel];
}

- (void)_setupConstraints
{
  v36 = [(UILabel *)self->_titleLabel firstBaselineAnchor];
  v37 = [(CarWaypointCell *)self contentView];
  v35 = [v37 topAnchor];
  v34 = [v36 constraintEqualToAnchor:v35 constant:20.0];
  v38[0] = v34;
  v32 = [(UILabel *)self->_titleLabel trailingAnchor];
  v33 = [(CarWaypointCell *)self contentView];
  v31 = [v33 trailingAnchor];
  v30 = [v32 constraintEqualToAnchor:v31 constant:-6.0];
  v38[1] = v30;
  v28 = [(UILabel *)self->_titleLabel leadingAnchor];
  v29 = [(CarWaypointCell *)self contentView];
  v27 = [v29 leadingAnchor];
  v26 = [v28 constraintEqualToAnchor:v27 constant:6.0];
  v38[2] = v26;
  v25 = [(UILabel *)self->_arrivalLabel firstBaselineAnchor];
  v24 = [(UILabel *)self->_titleLabel lastBaselineAnchor];
  v23 = [v25 constraintEqualToAnchor:v24 constant:14.0];
  v38[3] = v23;
  v21 = [(UILabel *)self->_arrivalLabel trailingAnchor];
  v22 = [(CarWaypointCell *)self contentView];
  v20 = [v22 trailingAnchor];
  v19 = [v21 constraintEqualToAnchor:v20 constant:-6.0];
  v38[4] = v19;
  v17 = [(UILabel *)self->_arrivalLabel leadingAnchor];
  v18 = [(CarWaypointCell *)self contentView];
  v16 = [v18 leadingAnchor];
  id v15 = [v17 constraintEqualToAnchor:v16 constant:6.0];
  v38[5] = v15;
  v14 = [(UILabel *)self->_tapToRemoveLabel firstBaselineAnchor];
  v13 = [(UILabel *)self->_arrivalLabel lastBaselineAnchor];
  id v3 = [v14 constraintEqualToAnchor:v13 constant:14.0];
  v38[6] = v3;
  v4 = [(UILabel *)self->_tapToRemoveLabel trailingAnchor];
  v5 = [(CarWaypointCell *)self contentView];
  v6 = [v5 trailingAnchor];
  v7 = [v4 constraintEqualToAnchor:v6 constant:-6.0];
  v38[7] = v7;
  objc_super v8 = [(UILabel *)self->_tapToRemoveLabel leadingAnchor];
  v9 = [(CarWaypointCell *)self contentView];
  v10 = [v9 leadingAnchor];
  v11 = [v8 constraintEqualToAnchor:v10 constant:6.0];
  v38[8] = v11;
  v12 = +[NSArray arrayWithObjects:v38 count:9];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)_setupStyles
{
  id v3 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCallout weight:UIFontWeightMedium];
  [(UILabel *)self->_titleLabel setFont:v3];

  v4 = +[UIColor labelColor];
  [(UILabel *)self->_titleLabel setTextColor:v4];

  [(UILabel *)self->_titleLabel setAdjustsFontSizeToFitWidth:0];
  v5 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCaption2 weight:3 grade:UIFontWeightRegular];
  [(UILabel *)self->_arrivalLabel setFont:v5];

  v6 = +[UIColor _carSystemPrimaryColor];
  [(UILabel *)self->_arrivalLabel setTextColor:v6];

  v7 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCaption2 weight:UIFontWeightRegular];
  [(UILabel *)self->_tapToRemoveLabel setFont:v7];

  id v8 = +[UIColor externalSystemRedColor];
  [(UILabel *)self->_tapToRemoveLabel setTextColor:v8];
}

- (void)setupWithWaypoint:(id)a3 etaInfo:(id)a4 isRemovable:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 name];
  [(UILabel *)self->_titleLabel setText:v10];

  v11 = GEOResultRefinementSort_ptr;
  if (!v5)
  {
    [(UILabel *)self->_tapToRemoveLabel setText:0];
    if (!v9) {
      goto LABEL_8;
    }
LABEL_18:
    v29 = +[GuidanceETA etaStringFromEtaLegInfo:v9 includingAMPMSymbols:1];
    goto LABEL_22;
  }
  v12 = +[CarDisplayController sharedInstance];
  unsigned int v13 = [v12 supportsTouchInteractionModel];

  v14 = +[NSBundle mainBundle];
  id v15 = v14;
  if (v13) {
    CFStringRef v16 = @"Car_Waypoint_TapToRemove";
  }
  else {
    CFStringRef v16 = @"Car_Waypoint_SelectToRemove";
  }
  v17 = [v14 localizedStringForKey:v16 value:@"localized string not found" table:0];
  [(UILabel *)self->_tapToRemoveLabel setText:v17];

  if (v9) {
    goto LABEL_18;
  }
LABEL_8:
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v18 = +[MNNavigationService sharedService];
  v19 = [v18 displayEtaInfo];
  v20 = [v19 legInfos];

  id v21 = [v20 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v36;
LABEL_10:
    uint64_t v24 = 0;
    while (1)
    {
      if (*(void *)v36 != v23) {
        objc_enumerationMutation(v20);
      }
      v25 = *(void **)(*((void *)&v35 + 1) + 8 * v24);
      v26 = [v25 waypointID];
      v27 = [v8 uniqueID];
      unsigned __int8 v28 = [v26 isEqual:v27];

      if (v28) {
        break;
      }
      if (v22 == (id)++v24)
      {
        id v22 = [v20 countByEnumeratingWithState:&v35 objects:v41 count:16];
        if (v22) {
          goto LABEL_10;
        }
        goto LABEL_16;
      }
    }
    id v9 = v25;

    v11 = GEOResultRefinementSort_ptr;
    if (!v9) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_16:

  v11 = GEOResultRefinementSort_ptr;
LABEL_19:
  v30 = sub_100015DB4();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    v31 = [v8 shortDescription];
    *(_DWORD *)buf = 138412290;
    v40 = v31;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to get etaInfo for waypoint: %@", buf, 0xCu);
  }
  v29 = 0;
  id v9 = 0;
LABEL_22:
  if ([v29 length])
  {
    v32 = [v11[504] mainBundle];
    v33 = [v32 localizedStringForKey:@"[Navigation] <time> ETA" value:@"localized string not found" table:0];
    v34 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v33, v29);

    v29 = v32;
  }
  else
  {
    v34 = 0;
  }

  [(UILabel *)self->_arrivalLabel setText:v34];
}

- (BOOL)displaysThirdDetailLine
{
  return 1;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CarWaypointCell;
  [(CarWaypointCell *)&v6 setHighlighted:a3 animated:a4];
  [(CarWaypointCell *)self _updateLabelColors:v4];
}

- (void)_updateLabelColors:(BOOL)a3
{
  if (a3)
  {
    BOOL v4 = +[UIColor _carSystemFocusLabelColor];
    [(UILabel *)self->_titleLabel setTextColor:v4];

    +[UIColor _carSystemFocusLabelColor];
  }
  else
  {
    BOOL v5 = +[UIColor labelColor];
    [(UILabel *)self->_titleLabel setTextColor:v5];

    +[UIColor _carSystemPrimaryColor];
  }
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)self->_arrivalLabel setTextColor:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapToRemoveLabel, 0);
  objc_storeStrong((id *)&self->_arrivalLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_contactImageView, 0);
}

@end