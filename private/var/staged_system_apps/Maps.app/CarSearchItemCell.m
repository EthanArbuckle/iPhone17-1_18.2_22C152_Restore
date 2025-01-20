@interface CarSearchItemCell
+ (id)distanceFormatter;
+ (id)reuseIdentifier;
- (BOOL)_hasRealTimeChargerInfo:(id)a3;
- (BOOL)displaysThirdDetailLine;
- (BOOL)hasChargerNumberString;
- (BOOL)shouldShowRating;
- (BOOL)shouldShowThirdLine;
- (CarSearchItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CarSearchItemCellModel)model;
- (CarStarRatingView)ratingView;
- (UILabel)leadingSubtitleLabel;
- (UILabel)titleLabel;
- (UILabel)trailingSubtitleLabel;
- (_TtC4Maps28CarSearchResultEVChargerView)evChargerInfoView;
- (id)_detourDistanceString;
- (id)_etaString;
- (id)_evChargerConstraints:(id)a3;
- (id)_firstLineString;
- (id)_leftSecondLineString;
- (id)_rightSecondLineString;
- (id)accessibilityIdentifier;
- (int64_t)cellStyle;
- (void)_refreshRouteETAIfCalculating;
- (void)_updateLabelColors:(BOOL)a3;
- (void)_updateSubtitle;
- (void)expectUpdatedRouteETA;
- (void)prepareForReuse;
- (void)setCellStyle:(int64_t)a3;
- (void)setEvChargerInfoView:(id)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setLeadingSubtitleLabel:(id)a3;
- (void)setModel:(id)a3;
- (void)setRatingView:(id)a3;
- (void)setRouteETA:(id)a3 animated:(BOOL)a4;
- (void)setTitleLabel:(id)a3;
- (void)setTrailingSubtitleLabel:(id)a3;
- (void)setupStyles;
- (void)setupSubviews;
- (void)setupWithModel:(id)a3 cellStyle:(int64_t)a4;
- (void)updateConstraints;
@end

@implementation CarSearchItemCell

+ (id)distanceFormatter
{
  if (qword_10160F238 != -1) {
    dispatch_once(&qword_10160F238, &stru_1012F1958);
  }
  v2 = (void *)qword_10160F230;

  return v2;
}

+ (id)reuseIdentifier
{
  return @"CarSearchResultCellReuseIdentifier";
}

- (CarSearchItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CarSearchItemCell;
  v4 = [(CarSearchItemCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(CarSearchItemCell *)v4 contentView];
    [v6 setClipsToBounds:1];

    [(CarSearchItemCell *)v5 setupSubviews];
    [(CarSearchItemCell *)v5 setupStyles];
  }
  return v5;
}

- (id)accessibilityIdentifier
{
  return @"CarSearchItemCell";
}

- (void)setupSubviews
{
  id v3 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  titleLabel = self->_titleLabel;
  self->_titleLabel = v7;

  [(UILabel *)self->_titleLabel setAccessibilityIdentifier:@"TitleLabel"];
  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v9) = 1148846080;
  [(UILabel *)self->_titleLabel setContentHuggingPriority:1 forAxis:v9];
  LODWORD(v10) = 1148846080;
  [(UILabel *)self->_titleLabel setContentHuggingPriority:0 forAxis:v10];
  LODWORD(v11) = 1148829696;
  [(UILabel *)self->_titleLabel setContentCompressionResistancePriority:0 forAxis:v11];
  v12 = [(CarSearchItemCell *)self contentView];
  [v12 addSubview:self->_titleLabel];

  v13 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  leadingSubtitleLabel = self->_leadingSubtitleLabel;
  self->_leadingSubtitleLabel = v13;

  [(UILabel *)self->_leadingSubtitleLabel setAccessibilityIdentifier:@"LeadingSubtitleLabel"];
  [(UILabel *)self->_leadingSubtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v15) = 1148846080;
  [(UILabel *)self->_leadingSubtitleLabel setContentHuggingPriority:1 forAxis:v15];
  LODWORD(v16) = 1148846080;
  [(UILabel *)self->_leadingSubtitleLabel setContentHuggingPriority:0 forAxis:v16];
  v17 = [(CarSearchItemCell *)self contentView];
  [v17 addSubview:self->_leadingSubtitleLabel];

  v18 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  trailingSubtitleLabel = self->_trailingSubtitleLabel;
  self->_trailingSubtitleLabel = v18;

  [(UILabel *)self->_trailingSubtitleLabel setAccessibilityIdentifier:@"TrailingSubtitleLabel"];
  [(UILabel *)self->_trailingSubtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v20) = 1148846080;
  [(UILabel *)self->_trailingSubtitleLabel setContentHuggingPriority:1 forAxis:v20];
  LODWORD(v21) = 1144750080;
  [(UILabel *)self->_trailingSubtitleLabel setContentHuggingPriority:0 forAxis:v21];
  LODWORD(v22) = 1148846080;
  [(UILabel *)self->_trailingSubtitleLabel setContentCompressionResistancePriority:1 forAxis:v22];
  v23 = [(CarSearchItemCell *)self contentView];
  [v23 addSubview:self->_trailingSubtitleLabel];

  v24 = objc_alloc_init(CarStarRatingView);
  ratingView = self->_ratingView;
  self->_ratingView = v24;

  [(CarStarRatingView *)self->_ratingView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v26) = 1148846080;
  [(CarStarRatingView *)self->_ratingView setContentCompressionResistancePriority:1 forAxis:v26];
  LODWORD(v27) = 1148846080;
  [(CarStarRatingView *)self->_ratingView setContentHuggingPriority:1 forAxis:v27];
  v28 = [(CarSearchItemCell *)self contentView];
  [v28 addSubview:self->_ratingView];

  v29 = -[CarSearchResultEVChargerView initWithFrame:]([_TtC4Maps28CarSearchResultEVChargerView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  evChargerInfoView = self->_evChargerInfoView;
  self->_evChargerInfoView = v29;

  [(CarSearchResultEVChargerView *)self->_evChargerInfoView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v31) = 1148846080;
  [(CarSearchResultEVChargerView *)self->_evChargerInfoView setContentHuggingPriority:1 forAxis:v31];
  LODWORD(v32) = 1144750080;
  [(CarSearchResultEVChargerView *)self->_evChargerInfoView setContentHuggingPriority:0 forAxis:v32];
  LODWORD(v33) = 1148846080;
  [(CarSearchResultEVChargerView *)self->_evChargerInfoView setContentCompressionResistancePriority:1 forAxis:v33];
  id v34 = [(CarSearchItemCell *)self contentView];
  [v34 addSubview:self->_evChargerInfoView];
}

- (void)setupStyles
{
  id v3 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCallout weight:UIFontWeightMedium];
  v4 = [(CarSearchItemCell *)self titleLabel];
  [v4 setFont:v3];

  v5 = +[UIColor labelColor];
  v6 = [(CarSearchItemCell *)self titleLabel];
  [v6 setTextColor:v5];

  v7 = [(CarSearchItemCell *)self titleLabel];
  [v7 setAdjustsFontSizeToFitWidth:0];

  objc_super v8 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCaption2 weight:3 grade:UIFontWeightRegular];
  double v9 = [(CarSearchItemCell *)self leadingSubtitleLabel];
  [v9 setFont:v8];

  double v10 = +[UIColor _carSystemPrimaryColor];
  double v11 = [(CarSearchItemCell *)self leadingSubtitleLabel];
  [v11 setTextColor:v10];

  v12 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCaption2 weight:3 grade:UIFontWeightRegular];
  v13 = [(CarSearchItemCell *)self trailingSubtitleLabel];
  [v13 setFont:v12];

  id v15 = +[UIColor _carSystemPrimaryColor];
  v14 = [(CarSearchItemCell *)self trailingSubtitleLabel];
  [v14 setTextColor:v15];
}

- (void)setupWithModel:(id)a3 cellStyle:(int64_t)a4
{
  id v26 = a3;
  [(CarSearchItemCell *)self setModel:v26];
  [(CarSearchItemCell *)self setCellStyle:a4];
  v6 = [(CarSearchItemCell *)self _firstLineString];
  v7 = [(CarSearchItemCell *)self titleLabel];
  [v7 setText:v6];

  [(CarSearchItemCell *)self _updateSubtitle];
  objc_super v8 = [(CarSearchItemCell *)self ratingView];
  double v9 = [v26 mapItem];
  [v8 setupWithMapItem:v9];

  uint64_t v10 = [(CarSearchItemCell *)self shouldShowRating] ^ 1;
  double v11 = [(CarSearchItemCell *)self ratingView];
  [v11 setHidden:v10];

  [(CarSearchItemCell *)self _updateLabelColors:[(CarSearchItemCell *)self isHighlighted]];
  v12 = [v26 mapItem];
  v13 = [v12 _realTimeAvailableEVCharger];

  uint64_t v14 = +[EVChargerUtility realTimeEVChargerStatusWithEvCharger:v13];
  id v15 = +[UIColor _carSystemSecondaryColor];
  if ([(CarSearchItemCell *)self _hasRealTimeChargerInfo:v26])
  {
    if (v14 == 1)
    {
      uint64_t v16 = +[UIColor systemGreenColor];

      id v15 = (void *)v16;
    }
    [(CarSearchResultEVChargerView *)self->_evChargerInfoView setTextAndIconColor:v15 status:v14];
    evChargerInfoView = self->_evChargerInfoView;
    v18 = [v26 evChargerLabelText];
    [(CarSearchResultEVChargerView *)evChargerInfoView updateContentsWithPlugStatus:v14 displayString:v18];
  }
  else
  {
    v19 = [(CarSearchItemCell *)self model];
    double v20 = [v19 chargerNumberString];
    id v21 = [v20 length];

    if (!v21) {
      goto LABEL_10;
    }
    [(CarSearchResultEVChargerView *)self->_evChargerInfoView setTextAndIconColor:v15 status:0];
    double v22 = self->_evChargerInfoView;
    v23 = [(CarSearchItemCell *)self model];
    v24 = [v23 chargerNumberString];
    [(CarSearchResultEVChargerView *)v22 updateContentsWithPlugStatus:0 displayString:v24];

    id v25 = 0;
    if ([v26 isShowingStops]) {
      id v25 = [v26 isRecent];
    }
    v18 = [(CarSearchResultEVChargerView *)self->_evChargerInfoView leadingIcon];
    [v18 setHidden:v25];
  }

LABEL_10:
  [(CarSearchItemCell *)self setNeedsUpdateConstraints];
}

- (BOOL)_hasRealTimeChargerInfo:(id)a3
{
  id v3 = a3;
  if (MapsFeature_IsEnabled_RealTimeEVCharger())
  {
    v4 = [v3 mapItem];
    v5 = [v4 _geoMapItem];
    unsigned __int8 v6 = [v5 _hasEVCharger];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)_updateSubtitle
{
  id v3 = [(CarSearchItemCell *)self _rightSecondLineString];
  v4 = [(CarSearchItemCell *)self trailingSubtitleLabel];
  [v4 setText:v3];

  id v6 = [(CarSearchItemCell *)self _leftSecondLineString];
  v5 = [(CarSearchItemCell *)self leadingSubtitleLabel];
  [v5 setText:v6];
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)CarSearchItemCell;
  [(CarSearchItemCell *)&v5 prepareForReuse];
  [(CarSearchItemCell *)self setModel:0];
  routeETA = self->_routeETA;
  self->_routeETA = 0;

  [(CarSearchResultEVChargerView *)self->_evChargerInfoView resetContents];
  self->_calculatingRouteETA = 0;
  [(NSTimer *)self->_delayedCalculatingTimer invalidate];
  delayedCalculatingTimer = self->_delayedCalculatingTimer;
  self->_delayedCalculatingTimer = 0;
}

- (void)updateConstraints
{
  v69.receiver = self;
  v69.super_class = (Class)CarSearchItemCell;
  [(CarSearchItemCell *)&v69 updateConstraints];
  if (self->_currentConstraints) {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  }
  v68 = +[NSMutableArray array];
  id v3 = [(UILabel *)self->_titleLabel firstBaselineAnchor];
  v64 = v3;
  v66 = [(CarSearchItemCell *)self contentView];
  uint64_t v4 = [v66 topAnchor];
  v62 = (void *)v4;
  unsigned int v5 = [(CarSearchItemCell *)self displaysThirdDetailLine];
  double v6 = 19.0;
  if (v5) {
    double v6 = 20.0;
  }
  v60 = [v3 constraintEqualToAnchor:v4 constant:v6];
  v71[0] = v60;
  v55 = [(UILabel *)self->_titleLabel trailingAnchor];
  v57 = [(CarSearchItemCell *)self contentView];
  v54 = [v57 trailingAnchor];
  v53 = [v55 constraintEqualToAnchor:v54 constant:-6.0];
  v71[1] = v53;
  v51 = [(UILabel *)self->_titleLabel leadingAnchor];
  v52 = [(CarSearchItemCell *)self contentView];
  v50 = [v52 leadingAnchor];
  v49 = [v51 constraintEqualToAnchor:v50 constant:6.0];
  v71[2] = v49;
  p_leadingSubtitleLabel = &self->_leadingSubtitleLabel;
  objc_super v8 = [(UILabel *)self->_leadingSubtitleLabel firstBaselineAnchor];
  v48 = v8;
  uint64_t v9 = [(UILabel *)self->_titleLabel firstBaselineAnchor];
  v47 = (void *)v9;
  unsigned int v10 = [(CarSearchItemCell *)self displaysThirdDetailLine];
  double v11 = 17.0;
  if (v10) {
    double v11 = 14.0;
  }
  v46 = [v8 constraintEqualToAnchor:v9 constant:v11];
  v71[3] = v46;
  v44 = [(UILabel *)*p_leadingSubtitleLabel leadingAnchor];
  v45 = [(CarSearchItemCell *)self contentView];
  v43 = [v45 leadingAnchor];
  v42 = [v44 constraintEqualToAnchor:v43 constant:6.0];
  v71[4] = v42;
  v41 = [(UILabel *)self->_trailingSubtitleLabel firstBaselineAnchor];
  v40 = [(UILabel *)*p_leadingSubtitleLabel firstBaselineAnchor];
  v12 = [v41 constraintEqualToAnchor:v40];
  v71[5] = v12;
  v13 = [(UILabel *)self->_trailingSubtitleLabel leadingAnchor];
  v59 = &self->_leadingSubtitleLabel;
  uint64_t v14 = [(UILabel *)*p_leadingSubtitleLabel trailingAnchor];
  id v15 = [v13 constraintEqualToAnchor:v14 constant:3.0];
  v71[6] = v15;
  uint64_t v16 = [(UILabel *)self->_trailingSubtitleLabel trailingAnchor];
  v17 = [(CarSearchItemCell *)self contentView];
  v18 = [v17 trailingAnchor];
  v19 = [v16 constraintLessThanOrEqualToAnchor:v18 constant:-6.0];
  v71[7] = v19;
  double v20 = +[NSArray arrayWithObjects:v71 count:8];
  [v68 addObjectsFromArray:v20];

  if ([(CarSearchItemCell *)self displaysThirdDetailLine])
  {
    unsigned int v21 = [(CarSearchItemCell *)self shouldShowRating];
    double v22 = &self->_leadingSubtitleLabel;
    p_ratingView = (id *)&self->_leadingSubtitleLabel;
    if (v21) {
      p_ratingView = (id *)&self->_ratingView;
    }
    id v24 = *p_ratingView;
    v67 = [v24 firstBaselineAnchor];
    v65 = [(UILabel *)*v59 firstBaselineAnchor];
    v63 = [v67 constraintEqualToAnchor:v65 constant:14.0];
    v70[0] = v63;
    v58 = [v24 leadingAnchor];
    v61 = [(CarSearchItemCell *)self contentView];
    v56 = [v61 leadingAnchor];
    id v25 = [v58 constraintEqualToAnchor:v56 constant:6.0];
    v70[1] = v25;
    id v26 = [v24 trailingAnchor];
    double v27 = [(CarSearchItemCell *)self contentView];
    v28 = [v27 trailingAnchor];
    v29 = [v26 constraintLessThanOrEqualToAnchor:v28 constant:-6.0];
    v70[2] = v29;
    v30 = +[NSArray arrayWithObjects:v70 count:3];
    double v31 = v68;
    [v68 addObjectsFromArray:v30];

    double v32 = [v24 firstBaselineAnchor];
    double v33 = [(CarSearchItemCell *)self _evChargerConstraints:v32];
  }
  else
  {
    double v22 = &self->_leadingSubtitleLabel;
    double v32 = [(UILabel *)*v59 firstBaselineAnchor];
    double v33 = [(CarSearchItemCell *)self _evChargerConstraints:v32];
    double v31 = v68;
  }
  [v31 addObjectsFromArray:v33];

  id v34 = (NSArray *)[v31 copy];
  currentConstraints = self->_currentConstraints;
  self->_currentConstraints = v34;

  +[NSLayoutConstraint activateConstraints:self->_currentConstraints];
  float v36 = 750.0;
  if ((id)[(CarSearchItemCell *)self cellStyle] == (id)2) {
    float v37 = 999.0;
  }
  else {
    float v37 = 750.0;
  }
  if ((id)[(CarSearchItemCell *)self cellStyle] != (id)2) {
    float v36 = 999.0;
  }
  *(float *)&double v38 = v37;
  [(UILabel *)*v22 setContentCompressionResistancePriority:0 forAxis:v38];
  *(float *)&double v39 = v36;
  [(UILabel *)self->_trailingSubtitleLabel setContentCompressionResistancePriority:0 forAxis:v39];
}

- (id)_evChargerConstraints:(id)a3
{
  if (self->_evChargerInfoView)
  {
    id v4 = a3;
    unsigned int v5 = +[NSMutableArray array];
    unsigned int v21 = [(CarSearchResultEVChargerView *)self->_evChargerInfoView firstBaselineAnchor];
    double v20 = [v21 constraintEqualToAnchor:v4 constant:4.0];

    v22[0] = v20;
    v18 = [(CarSearchResultEVChargerView *)self->_evChargerInfoView leadingAnchor];
    v19 = [(CarSearchItemCell *)self contentView];
    v17 = [v19 leadingAnchor];
    uint64_t v16 = [v18 constraintEqualToAnchor:v17 constant:6.0];
    v22[1] = v16;
    double v6 = [(CarSearchResultEVChargerView *)self->_evChargerInfoView trailingAnchor];
    v7 = [(CarSearchItemCell *)self contentView];
    objc_super v8 = [v7 trailingAnchor];
    uint64_t v9 = [v6 constraintLessThanOrEqualToAnchor:v8 constant:-6.0];
    v22[2] = v9;
    unsigned int v10 = [(CarSearchResultEVChargerView *)self->_evChargerInfoView bottomAnchor];
    double v11 = [(CarSearchItemCell *)self contentView];
    v12 = [v11 bottomAnchor];
    v13 = [v10 constraintLessThanOrEqualToAnchor:v12 constant:-4.0];
    v22[3] = v13;
    uint64_t v14 = +[NSArray arrayWithObjects:v22 count:4];
    [v5 addObjectsFromArray:v14];
  }
  else
  {
    unsigned int v5 = &__NSArray0__struct;
  }

  return v5;
}

- (BOOL)displaysThirdDetailLine
{
  if ([(CarSearchItemCell *)self shouldShowRating]) {
    return 1;
  }

  return [(CarSearchItemCell *)self shouldShowThirdLine];
}

- (BOOL)shouldShowRating
{
  id v3 = [(CarSearchItemCell *)self model];
  id v4 = [v3 rating];
  if (v4)
  {
    unsigned int v5 = [(CarSearchItemCell *)self model];
    BOOL v6 = ([v5 shouldShowChargerlabel] & 1) == 0
      && (id)[(CarSearchItemCell *)self cellStyle] != (id)1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)shouldShowThirdLine
{
  id v3 = [(CarSearchItemCell *)self model];
  if ([v3 shouldShowChargerlabel]) {
    BOOL v4 = (id)[(CarSearchItemCell *)self cellStyle] != (id)1;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)hasChargerNumberString
{
  v2 = [(CarSearchItemCell *)self model];
  id v3 = [v2 chargerNumberString];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CarSearchItemCell;
  [(CarSearchItemCell *)&v6 setHighlighted:a3 animated:a4];
  [(CarSearchItemCell *)self _updateLabelColors:v4];
}

- (void)_updateLabelColors:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    +[UIColor _carSystemFocusLabelColor];
  }
  else {
  unsigned int v5 = +[UIColor labelColor];
  }
  objc_super v6 = [(CarSearchItemCell *)self titleLabel];
  [v6 setTextColor:v5];

  if ((id)[(CarSearchItemCell *)self cellStyle] == (id)2) {
    +[UIColor systemGreenColor];
  }
  else {
  id v15 = +[UIColor _carSystemPrimaryColor];
  }
  v7 = v15;
  if (v3)
  {
    v7 = +[UIColor _carSystemFocusLabelColor];
  }
  objc_super v8 = [(CarSearchItemCell *)self leadingSubtitleLabel];
  [v8 setTextColor:v7];

  if (v3)
  {

    +[UIColor _carSystemFocusLabelColor];
  }
  else
  {
    +[UIColor _carSystemPrimaryColor];
  uint64_t v9 = };
  unsigned int v10 = [(CarSearchItemCell *)self trailingSubtitleLabel];
  [v10 setTextColor:v9];

  double v11 = [(CarSearchItemCell *)self ratingView];
  [v11 setHighlighted:v3];

  v12 = [(CarSearchItemCell *)self model];
  if ([v12 isRecent])
  {
    v13 = [(CarSearchItemCell *)self model];
    unsigned int v14 = [v13 isShowingStops];

    if (!v14) {
      goto LABEL_19;
    }
    if (v3) {
      +[UIColor _carSystemFocusLabelColor];
    }
    else {
    v12 = +[UIColor _carSystemPrimaryColor];
    }
    [(CarSearchResultEVChargerView *)self->_evChargerInfoView updateLabelColors:v12];
  }

LABEL_19:
}

- (id)_firstLineString
{
  int64_t v3 = [(CarSearchItemCell *)self cellStyle];
  switch(v3)
  {
    case 2:
      goto LABEL_4;
    case 1:
      BOOL v4 = [(CarSearchItemCell *)self model];
      objc_super v6 = [v4 mapItem];
      unsigned int v5 = [v6 _addressFormattedAsName];

      goto LABEL_6;
    case 0:
LABEL_4:
      BOOL v4 = [(CarSearchItemCell *)self model];
      unsigned int v5 = [v4 firstLine];
LABEL_6:

      goto LABEL_8;
  }
  unsigned int v5 = 0;
LABEL_8:

  return v5;
}

- (id)_leftSecondLineString
{
  unint64_t v3 = [(CarSearchItemCell *)self cellStyle];
  if (v3 >= 2)
  {
    if (v3 != 2)
    {
      unsigned int v5 = 0;
      goto LABEL_7;
    }
    BOOL v4 = [(CarSearchItemCell *)self model];
    objc_super v6 = [v4 mapItem];
    unsigned int v5 = [v6 _maps_detourTextForIdiom:3];
  }
  else
  {
    BOOL v4 = [(CarSearchItemCell *)self model];
    unsigned int v5 = [v4 secondLine];
  }

LABEL_7:

  return v5;
}

- (id)_rightSecondLineString
{
  int64_t v3 = [(CarSearchItemCell *)self cellStyle];
  if (v3 == 2)
  {
    uint64_t v7 = [(CarSearchItemCell *)self _detourDistanceString];
  }
  else
  {
    if (v3 != 1)
    {
      if (v3)
      {
        objc_super v6 = 0;
      }
      else
      {
        BOOL v4 = [(CarSearchItemCell *)self model];
        unsigned int v5 = [v4 mapItem];
        if (v5)
        {
          objc_super v6 = [(CarSearchItemCell *)self _etaString];
        }
        else
        {
          objc_super v6 = 0;
        }
      }
      goto LABEL_12;
    }
    uint64_t v7 = [(CarSearchItemCell *)self _etaString];
  }
  objc_super v6 = (void *)v7;
LABEL_12:

  return v6;
}

- (id)_etaString
{
  if (self->_calculatingRouteETA)
  {
    int64_t v3 = +[NSBundle mainBundle];
    BOOL v4 = [v3 localizedStringForKey:@"Calculating... [CarPlay]" value:@"localized string not found" table:0];

    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    routeETA = self->_routeETA;
    if (routeETA)
    {
      [(_MKRouteETA *)routeETA travelTime];
      if (v10 > 0.0)
      {
        BOOL v4 = +[NSString _maps_stringWithRemainingTime:](NSString, "_maps_stringWithRemainingTime:");
        if (v4)
        {
LABEL_3:
          unsigned int v5 = [(CarSearchItemCell *)self traitCollection];
          id v6 = [v5 layoutDirection];

          uint64_t v7 = +[NSBundle mainBundle];
          objc_super v8 = [v7 localizedStringForKey:@".[List view details separator]" value:@"localized string not found" table:0];

          if (v6 == (id)1) {
            +[NSString stringWithFormat:@"%@ %@", v4, v8];
          }
          else {
          double v11 = +[NSString stringWithFormat:@"%@ %@", v8, v4];
          }

          goto LABEL_11;
        }
      }
    }
  }
  double v11 = 0;
LABEL_11:

  return v11;
}

- (id)_detourDistanceString
{
  if (self->_calculatingRouteETA)
  {
    int64_t v3 = +[NSBundle mainBundle];
    BOOL v4 = [v3 localizedStringForKey:@"Calculating... [CarPlay]" value:@"localized string not found" table:0];
  }
  else
  {
    routeETA = self->_routeETA;
    if (!routeETA
      || ([(_MKRouteETA *)routeETA distance], v10 <= 0.0)
      || (double v11 = v10, (id)[(CarSearchItemCell *)self cellStyle] != (id)2))
    {
      BOOL v4 = 0;
      goto LABEL_11;
    }
    int64_t v3 = +[NSString _navigation_localizedStringForDistance:0 detail:1 unitFormat:0 locale:0 useMetric:0 useYards:v11];
    v12 = +[NSBundle mainBundle];
    v13 = [v12 localizedStringForKey:@"%@ miles away" value:@"localized string not found" table:0];
    BOOL v4 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v3);
  }
  if (v4)
  {
    unsigned int v5 = [(CarSearchItemCell *)self _leftSecondLineString];

    if (v5)
    {
      id v6 = +[NSBundle mainBundle];
      uint64_t v7 = [v6 localizedStringForKey:@" · [List view details separator]" value:@"localized string not found" table:0];

      uint64_t v8 = +[NSString stringWithFormat:@"%@%@", v7, v4];

      BOOL v4 = (void *)v8;
    }
  }
LABEL_11:

  return v4;
}

- (void)setRouteETA:(id)a3 animated:(BOOL)a4
{
  id v9 = a3;
  [v9 travelTime];
  if (v5 >= 0.0 || !self->_routeETA)
  {
    [v9 travelTime];
    if (v6 < 0.0) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = v9;
    }
    objc_storeStrong((id *)&self->_routeETA, v7);
    self->_calculatingRouteETA = 0;
    [(NSTimer *)self->_delayedCalculatingTimer invalidate];
    delayedCalculatingTimer = self->_delayedCalculatingTimer;
    self->_delayedCalculatingTimer = 0;

    [(CarSearchItemCell *)self _updateSubtitle];
  }
}

- (void)_refreshRouteETAIfCalculating
{
  if (self->_calculatingRouteETA) {
    [(CarSearchItemCell *)self _updateSubtitle];
  }
  delayedCalculatingTimer = self->_delayedCalculatingTimer;
  self->_delayedCalculatingTimer = 0;
}

- (void)expectUpdatedRouteETA
{
  if (!self->_routeETA && (!self->_calculatingRouteETA || !self->_delayedCalculatingTimer))
  {
    self->_calculatingRouteETA = 1;
    objc_initWeak(&location, self);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1005E4C64;
    v5[3] = &unk_1012E73C8;
    objc_copyWeak(&v6, &location);
    int64_t v3 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v5 block:0.5];
    delayedCalculatingTimer = self->_delayedCalculatingTimer;
    self->_delayedCalculatingTimer = v3;

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (CarSearchItemCellModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)leadingSubtitleLabel
{
  return self->_leadingSubtitleLabel;
}

- (void)setLeadingSubtitleLabel:(id)a3
{
}

- (UILabel)trailingSubtitleLabel
{
  return self->_trailingSubtitleLabel;
}

- (void)setTrailingSubtitleLabel:(id)a3
{
}

- (_TtC4Maps28CarSearchResultEVChargerView)evChargerInfoView
{
  return self->_evChargerInfoView;
}

- (void)setEvChargerInfoView:(id)a3
{
}

- (CarStarRatingView)ratingView
{
  return self->_ratingView;
}

- (void)setRatingView:(id)a3
{
}

- (int64_t)cellStyle
{
  return self->_cellStyle;
}

- (void)setCellStyle:(int64_t)a3
{
  self->_cellStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingView, 0);
  objc_storeStrong((id *)&self->_evChargerInfoView, 0);
  objc_storeStrong((id *)&self->_trailingSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_leadingSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_currentConstraints, 0);
  objc_storeStrong((id *)&self->_delayedCalculatingTimer, 0);

  objc_storeStrong((id *)&self->_routeETA, 0);
}

@end