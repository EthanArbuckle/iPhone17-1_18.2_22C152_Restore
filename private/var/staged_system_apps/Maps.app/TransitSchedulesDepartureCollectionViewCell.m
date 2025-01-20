@interface TransitSchedulesDepartureCollectionViewCell
- (GEOTransitDeparture)departure;
- (TransitSchedulesDepartureCollectionViewCell)init;
- (TransitSchedulesDepartureCollectionViewCell)initWithFrame:(CGRect)a3;
- (UILabel)liveStatusLabel;
- (UILabel)timeLabel;
- (id)_selectedStatusLabelFontProvider;
- (id)_selectedTimeLabelFontProvider;
- (id)attributedTimeString;
- (id)dateFormatter;
- (id)liveStatusColor;
- (id)realTimeStatusIndicatorColor;
- (id)statusString;
- (id)statusStringAttributes;
- (id)statusStringTextColor;
- (id)timeTextColor;
- (void)configureViews;
- (void)setDeparture:(id)a3;
- (void)setDeparture:(id)a3 withReferenceDate:(id)a4 timeZone:(id)a5 timeDisplayStyle:(unint64_t)a6;
- (void)setLiveStatusLabel:(id)a3;
- (void)setReferenceDate:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTimeLabel:(id)a3;
- (void)updateCellStyling;
- (void)updateLiveStatusLabelFont;
- (void)updateShadow;
- (void)updateStrings;
- (void)updateTimeLabelFont;
@end

@implementation TransitSchedulesDepartureCollectionViewCell

- (TransitSchedulesDepartureCollectionViewCell)init
{
  v5.receiver = self;
  v5.super_class = (Class)TransitSchedulesDepartureCollectionViewCell;
  v2 = [(TransitSchedulesDepartureCollectionViewCell *)&v5 init];
  v3 = v2;
  if (v2) {
    [(TransitSchedulesDepartureCollectionViewCell *)v2 configureViews];
  }
  return v3;
}

- (TransitSchedulesDepartureCollectionViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TransitSchedulesDepartureCollectionViewCell;
  v3 = -[TransitSchedulesDepartureCollectionViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(TransitSchedulesDepartureCollectionViewCell *)v3 configureViews];
  }
  return v4;
}

- (void)configureViews
{
  id v41 = objc_alloc_init((Class)MKVibrantView);
  [(TransitSchedulesDepartureCollectionViewCell *)self setBackgroundView:v41];
  [v41 _setCornerRadius:10.0];
  [(TransitSchedulesDepartureCollectionViewCell *)self setAccessibilityIdentifier:@"TransitSchedulesDepartureCollectionViewCell"];
  id v40 = objc_alloc_init((Class)UIView);
  v3 = +[UIColor tertiarySystemBackgroundColor];
  [v40 setBackgroundColor:v3];

  [(TransitSchedulesDepartureCollectionViewCell *)self setSelectedBackgroundView:v40];
  v4 = [v40 layer];
  [v4 setCornerRadius:10.0];

  objc_super v5 = [(TransitSchedulesDepartureCollectionViewCell *)self contentView];
  id v6 = objc_alloc_init((Class)UILabel);
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setTextAlignment:1];
  [v6 setAccessibilityIdentifier:@"TransitSchedulesDepartureCollectionViewCellTimeLabel"];
  [v5 addSubview:v6];
  [(TransitSchedulesDepartureCollectionViewCell *)self setTimeLabel:v6];
  id v7 = objc_alloc_init((Class)UILabel);
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 setTextAlignment:1];
  [v7 setAccessibilityIdentifier:@"TransitSchedulesDepartureCollectionViewCellStatusLabel"];
  [v5 addSubview:v7];
  [(TransitSchedulesDepartureCollectionViewCell *)self setLiveStatusLabel:v7];
  [(TransitSchedulesDepartureCollectionViewCell *)self updateCellStyling];
  v39 = [v6 firstBaselineAnchor];
  v38 = [v5 topAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v36 = [(TransitSchedulesDepartureCollectionViewCell *)self _selectedTimeLabelFontProvider];
  v35 = +[DynamicTypeWizard autoscaledConstraint:v37 constant:v36 withFontProvider:25.0];
  v42[0] = v35;
  v34 = [v6 leadingAnchor];
  v33 = [v5 leadingAnchor];
  v32 = [v34 constraintEqualToAnchor:v33 constant:15.0];
  v42[1] = v32;
  v31 = [v6 trailingAnchor];
  v28 = v5;
  v30 = [v5 trailingAnchor];
  v29 = [v31 constraintEqualToAnchor:v30 constant:-15.0];
  v42[2] = v29;
  v27 = [v7 firstBaselineAnchor];
  v26 = [v6 lastBaselineAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v24 = [(TransitSchedulesDepartureCollectionViewCell *)self _selectedTimeLabelFontProvider];
  v23 = +[DynamicTypeWizard autoscaledConstraint:v25 constant:v24 withFontProvider:18.0];
  v42[3] = v23;
  v22 = [v7 lastBaselineAnchor];
  v21 = [v5 bottomAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v19 = [(TransitSchedulesDepartureCollectionViewCell *)self _selectedStatusLabelFontProvider];
  v18 = +[DynamicTypeWizard autoscaledConstraint:v20 constant:v19 withFontProvider:-11.0];
  v42[4] = v18;
  v8 = [v7 leadingAnchor];
  v9 = [v5 leadingAnchor];
  v10 = [v8 constraintEqualToAnchor:v9 constant:15.0];
  v42[5] = v10;
  v11 = [v7 trailingAnchor];
  v12 = [v5 trailingAnchor];
  v13 = [v11 constraintEqualToAnchor:v12 constant:-15.0];
  v42[6] = v13;
  v14 = +[NSArray arrayWithObjects:v42 count:7];
  +[NSLayoutConstraint activateConstraints:v14];

  LODWORD(v15) = 1148846080;
  [v6 setContentCompressionResistancePriority:0 forAxis:v15];
  LODWORD(v16) = 1148846080;
  [v7 setContentCompressionResistancePriority:0 forAxis:v16];
  [(TransitSchedulesDepartureCollectionViewCell *)self setIsAccessibilityElement:1];
  unint64_t v17 = (unint64_t)[(TransitSchedulesDepartureCollectionViewCell *)self accessibilityTraits];
  [(TransitSchedulesDepartureCollectionViewCell *)self setAccessibilityTraits:UIAccessibilityTraitButton | v17];
}

- (id)_selectedTimeLabelFontProvider
{
  v2 = objc_retainBlock(&stru_1013212E0);

  return v2;
}

- (id)_selectedStatusLabelFontProvider
{
  v2 = objc_retainBlock(&stru_101321380);

  return v2;
}

- (void)setDeparture:(id)a3 withReferenceDate:(id)a4 timeZone:(id)a5 timeDisplayStyle:(unint64_t)a6
{
  id v16 = a3;
  id v11 = a4;
  id v12 = a5;
  if (![(GEOTransitDeparture *)self->_departure isEqual:v16]) {
    goto LABEL_7;
  }
  v13 = [(TransitSchedulesDepartureBaseViewCell *)self timeZone];
  if (![v13 isEqual:v12]
    || [(TransitSchedulesDepartureBaseViewCell *)self timeDisplayStyle] != a6)
  {

    goto LABEL_7;
  }
  v14 = [(TransitSchedulesDepartureBaseViewCell *)self referenceDate];
  unsigned __int8 v15 = [v14 isEqualToDate:v11];

  if ((v15 & 1) == 0)
  {
LABEL_7:
    objc_storeStrong((id *)&self->_departure, a3);
    [(TransitSchedulesDepartureBaseViewCell *)self setTimeDisplayStyle:a6];
    [(TransitSchedulesDepartureCollectionViewCell *)self setReferenceDate:v11];
    [(TransitSchedulesDepartureBaseViewCell *)self setTimeZone:v12];
    [(TransitSchedulesDepartureCollectionViewCell *)self updateStrings];
  }
}

- (void)setReferenceDate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TransitSchedulesDepartureCollectionViewCell;
  [(TransitSchedulesDepartureBaseViewCell *)&v4 setReferenceDate:a3];
  [(TransitSchedulesDepartureCollectionViewCell *)self updateStrings];
}

- (id)attributedTimeString
{
  v3 = [(TransitSchedulesDepartureCollectionViewCell *)self departure];
  objc_super v4 = [(TransitSchedulesDepartureBaseViewCell *)self timeStringForDeparture:v3];
  NSAttributedStringKey v10 = NSForegroundColorAttributeName;
  objc_super v5 = [(TransitSchedulesDepartureCollectionViewCell *)self timeTextColor];
  id v11 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];

  id v7 = [(TransitSchedulesDepartureCollectionViewCell *)self realTimeStatusIndicatorColor];
  v8 = +[NSAttributedString _mapkit_attributedLiveTransitStringFromDepartureString:v4 departure:v3 textAttributes:v6 darkMode:[(TransitSchedulesDepartureCollectionViewCell *)self _mapkit_isDarkModeEnabled] symbolOverrideColor:v7];

  return v8;
}

- (void)updateStrings
{
  v3 = [(TransitSchedulesDepartureCollectionViewCell *)self attributedTimeString];
  objc_super v4 = [(TransitSchedulesDepartureCollectionViewCell *)self timeLabel];
  [v4 setAttributedText:v3];

  objc_super v5 = [(TransitSchedulesDepartureCollectionViewCell *)self statusString];
  id v6 = [(TransitSchedulesDepartureCollectionViewCell *)self liveStatusLabel];
  [v6 setAttributedText:v5];

  id v7 = +[NSBundle mainBundle];
  id v13 = [v7 localizedStringForKey:@"[Transit Schedule] Departure cell accessibility label" value:@"localized string not found" table:0];

  v8 = [(TransitSchedulesDepartureCollectionViewCell *)self timeLabel];
  v9 = [v8 accessibilityLabel];
  NSAttributedStringKey v10 = [(TransitSchedulesDepartureCollectionViewCell *)self liveStatusLabel];
  id v11 = [v10 accessibilityLabel];
  id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v9, v11);
  [(TransitSchedulesDepartureCollectionViewCell *)self setAccessibilityLabel:v12];
}

- (id)statusStringAttributes
{
  NSAttributedStringKey v5 = NSForegroundColorAttributeName;
  v2 = [(TransitSchedulesDepartureCollectionViewCell *)self statusStringTextColor];
  id v6 = v2;
  v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return v3;
}

- (id)statusString
{
  v3 = [(TransitSchedulesDepartureCollectionViewCell *)self statusStringAttributes];
  objc_super v4 = [(TransitSchedulesDepartureCollectionViewCell *)self departure];
  unsigned int v5 = [v4 isCanceled];

  if (v5)
  {
    id v6 = objc_alloc((Class)NSAttributedString);
    id v7 = +[NSBundle mainBundle];
    v8 = v7;
    CFStringRef v9 = @"Schedules Departure cell status - Canceled";
LABEL_5:
    v14 = [v7 localizedStringForKey:v9 value:@"localized string not found" table:0];
    id v15 = [v6 initWithString:v14 attributes:v3];

    goto LABEL_13;
  }
  NSAttributedStringKey v10 = [(TransitSchedulesDepartureCollectionViewCell *)self departure];
  uint64_t v11 = [v10 liveStatus] == 0;

  id v12 = [(TransitSchedulesDepartureCollectionViewCell *)self departure];
  id v13 = [(TransitSchedulesDepartureBaseViewCell *)self referenceDate];
  LODWORD(v11) = [v12 isPastDepartureRelativeToDate:v13 usingGracePeriod:v11];

  if (v11)
  {
    id v6 = objc_alloc((Class)NSAttributedString);
    id v7 = +[NSBundle mainBundle];
    v8 = v7;
    CFStringRef v9 = @"Schedules Departure cell status - Departed";
    goto LABEL_5;
  }
  id v16 = [(TransitSchedulesDepartureCollectionViewCell *)self departure];
  unint64_t v17 = [v16 liveStatusString];

  if (v17)
  {
    id v18 = objc_alloc((Class)MKServerFormattedStringParameters);
    MKFormattedStringOptionsMakeDefault();
    id v19 = [v18 initWithOptions:&v33 variableOverrides:0];
    id v20 = [objc_alloc((Class)MKServerFormattedString) initWithGeoServerString:v17 parameters:v19];
    v21 = [v20 multiPartAttributedStringWithAttributes:&__NSDictionary0__struct];
    v22 = [v21 attributedString];

    if ([(TransitSchedulesDepartureCollectionViewCell *)self isSelected])
    {
      id v15 = v22;
    }
    else
    {
      id v29 = objc_alloc((Class)NSAttributedString);
      v30 = [v22 string];
      v31 = [(TransitSchedulesDepartureCollectionViewCell *)self statusStringAttributes];
      id v15 = [v29 initWithString:v30 attributes:v31];
    }
  }
  else
  {
    v23 = [(TransitSchedulesDepartureCollectionViewCell *)self departure];
    id v19 = [(TransitSchedulesDepartureBaseViewCell *)self emphasizedLowFrequencyDepartureDateForDeparture:v23];

    v24 = [(TransitSchedulesDepartureCollectionViewCell *)self dateFormatter];
    v25 = [v24 stringFromDate:v19];

    v26 = [(TransitSchedulesDepartureCollectionViewCell *)self departure];
    int64_t v27 = [(TransitSchedulesDepartureBaseViewCell *)self effectiveLiveStatusForDeparture:v26];

    v28 = +[NSString _navigation_formattedDescriptionForLiveStatus:v27 updatedDepartureTimeString:v25];
    id v15 = [objc_alloc((Class)NSAttributedString) initWithString:v28 attributes:v3];
  }
LABEL_13:

  return v15;
}

- (id)dateFormatter
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007CD5F0;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  if (qword_10160F990 != -1) {
    dispatch_once(&qword_10160F990, block);
  }
  return (id)qword_10160F988;
}

- (void)updateCellStyling
{
  v3 = [(TransitSchedulesDepartureCollectionViewCell *)self attributedTimeString];
  objc_super v4 = [(TransitSchedulesDepartureCollectionViewCell *)self timeLabel];
  [v4 setAttributedText:v3];

  unsigned int v5 = [(TransitSchedulesDepartureCollectionViewCell *)self statusString];
  id v6 = [(TransitSchedulesDepartureCollectionViewCell *)self liveStatusLabel];
  [v6 setAttributedText:v5];

  [(TransitSchedulesDepartureCollectionViewCell *)self updateTimeLabelFont];
  [(TransitSchedulesDepartureCollectionViewCell *)self updateLiveStatusLabelFont];
  [(TransitSchedulesDepartureCollectionViewCell *)self updateShadow];

  [(TransitSchedulesDepartureCollectionViewCell *)self invalidateIntrinsicContentSize];
}

- (void)updateTimeLabelFont
{
  if ([(TransitSchedulesDepartureCollectionViewCell *)self isSelected])
  {
    v3 = [(TransitSchedulesDepartureCollectionViewCell *)self _selectedTimeLabelFontProvider];
    unsigned int v5 = objc_retainBlock(v3);
  }
  else
  {
    unsigned int v5 = objc_retainBlock(&stru_101321320);
  }
  objc_super v4 = [(TransitSchedulesDepartureCollectionViewCell *)self timeLabel];
  +[DynamicTypeWizard autorefreshLabel:v4 withFontProvider:v5];
}

- (void)updateLiveStatusLabelFont
{
  if ([(TransitSchedulesDepartureCollectionViewCell *)self isSelected])
  {
    v3 = [(TransitSchedulesDepartureCollectionViewCell *)self _selectedStatusLabelFontProvider];
    unsigned int v5 = objc_retainBlock(v3);
  }
  else
  {
    unsigned int v5 = objc_retainBlock(&stru_101321340);
  }
  objc_super v4 = [(TransitSchedulesDepartureCollectionViewCell *)self liveStatusLabel];
  +[DynamicTypeWizard autorefreshLabel:v4 withFontProvider:v5];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TransitSchedulesDepartureCollectionViewCell;
  [(TransitSchedulesDepartureCollectionViewCell *)&v4 setSelected:a3];
  [(TransitSchedulesDepartureCollectionViewCell *)self updateCellStyling];
}

- (void)updateShadow
{
  v3 = [(TransitSchedulesDepartureCollectionViewCell *)self selectedBackgroundView];
  id v9 = [v3 layer];

  if ([(TransitSchedulesDepartureCollectionViewCell *)self isSelected])
  {
    id v4 = +[UIColor blackColor];
    id v5 = [v4 colorWithAlphaComponent:0.140000001];
    [v9 setShadowColor:[v5 CGColor]];

    double v6 = 1.0;
    float v7 = 1.0;
  }
  else
  {
    id v4 = +[UIColor clearColor];
    [v9 setShadowColor:[v4 CGColor]];
    float v7 = 0.0;
    double v6 = 0.0;
  }

  [v9 setShadowOffset:0.0, v6];
  [v9 setShadowRadius:v6];
  *(float *)&double v8 = v7;
  [v9 setShadowOpacity:v8];
}

- (id)timeTextColor
{
  unsigned __int8 v2 = [(TransitSchedulesDepartureCollectionViewCell *)self isSelected];
  v3 = +[UIColor labelColor];
  id v4 = v3;
  if ((v2 & 1) == 0)
  {
    uint64_t v5 = [v3 colorWithAlphaComponent:0.699999988];

    id v4 = (void *)v5;
  }

  return v4;
}

- (id)realTimeStatusIndicatorColor
{
  if ([(TransitSchedulesDepartureCollectionViewCell *)self isSelected])
  {
    v3 = [(TransitSchedulesDepartureCollectionViewCell *)self liveStatusColor];
  }
  else
  {
    id v4 = +[UIColor labelColor];
    v3 = [v4 colorWithAlphaComponent:0.800000012];
  }

  return v3;
}

- (id)statusStringTextColor
{
  if ([(TransitSchedulesDepartureCollectionViewCell *)self isSelected])
  {
    v3 = [(TransitSchedulesDepartureCollectionViewCell *)self liveStatusColor];
  }
  else
  {
    id v4 = +[UIColor labelColor];
    v3 = [v4 colorWithAlphaComponent:0.400000006];
  }

  return v3;
}

- (id)liveStatusColor
{
  v3 = [(TransitSchedulesDepartureCollectionViewCell *)self departure];
  unsigned int v4 = [v3 isPastDeparture];

  if (v4)
  {
    +[UIColor secondaryLabelColor];
  }
  else
  {
    double v6 = [(TransitSchedulesDepartureCollectionViewCell *)self departure];
    [(TransitSchedulesDepartureBaseViewCell *)self effectiveLiveStatusForDeparture:v6];

    MKTransitLiveDepartureColorForViewWithLiveStatus();
  uint64_t v5 = };

  return v5;
}

- (GEOTransitDeparture)departure
{
  return self->_departure;
}

- (void)setDeparture:(id)a3
{
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
}

- (UILabel)liveStatusLabel
{
  return self->_liveStatusLabel;
}

- (void)setLiveStatusLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liveStatusLabel, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);

  objc_storeStrong((id *)&self->_departure, 0);
}

@end