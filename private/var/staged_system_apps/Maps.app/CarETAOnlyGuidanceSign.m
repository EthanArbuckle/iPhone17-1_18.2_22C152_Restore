@interface CarETAOnlyGuidanceSign
+ ($59E334741CCDBB9B6DD47BAE86BD9633)viewMetrics;
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)showsEvLabel;
- (CarETAOnlyGuidanceSign)initWithFrame:(CGRect)a3;
- (GuidanceETA)latestETA;
- (NSLayoutConstraint)bottomConstraint;
- (NSString)subtitleOverride;
- (NSString)title;
- (UILabel)evArrivalInfoLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (id)viewForLastBaselineLayout;
- (unint64_t)numberOfStops;
- (void)_refreshBottomConstraint;
- (void)_updateContents;
- (void)setBottomConstraint:(id)a3;
- (void)setEvArrivalInfoLabel:(id)a3;
- (void)setLatestETA:(id)a3;
- (void)setNumberOfStops:(unint64_t)a3;
- (void)setShowsEvLabel:(BOOL)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setSubtitleOverride:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation CarETAOnlyGuidanceSign

+ ($59E334741CCDBB9B6DD47BAE86BD9633)viewMetrics
{
  *retstr = *($59E334741CCDBB9B6DD47BAE86BD9633 *)ymmword_100F73DA8;
  return result;
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (CarETAOnlyGuidanceSign)initWithFrame:(CGRect)a3
{
  v57.receiver = self;
  v57.super_class = (Class)CarETAOnlyGuidanceSign;
  v3 = -[CarETAOnlyGuidanceSign initWithFrame:](&v57, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v3;
  if (v3)
  {
    LODWORD(v4) = 1148829696;
    [(CarETAOnlyGuidanceSign *)v3 setContentHuggingPriority:1 forAxis:v4];
    [(CarETAOnlyGuidanceSign *)v5 setAccessibilityIdentifier:@"ETAOnlyGuidanceSign"];
    v5->_showsEvLabel = 0;
    id v6 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v10 = [v6 initWithFrame:CGRectZero.origin.x, y, width, height];
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v10;

    [(UILabel *)v5->_titleLabel setAccessibilityIdentifier:@"TitleLabel"];
    v12 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCallout weight:UIFontWeightSemibold];
    [(UILabel *)v5->_titleLabel setFont:v12];

    v13 = +[UIColor labelColor];
    [(UILabel *)v5->_titleLabel setTextColor:v13];

    [(UILabel *)v5->_titleLabel setLineBreakMode:4];
    [(UILabel *)v5->_titleLabel setNumberOfLines:3];
    [(UILabel *)v5->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v14) = 1148829696;
    [(UILabel *)v5->_titleLabel setContentCompressionResistancePriority:1 forAxis:v14];
    LODWORD(v15) = 1148846080;
    [(UILabel *)v5->_titleLabel setContentHuggingPriority:1 forAxis:v15];
    [(CarETAOnlyGuidanceSign *)v5 addSubview:v5->_titleLabel];
    v16 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    subtitleLabel = v5->_subtitleLabel;
    v5->_subtitleLabel = v16;

    [(UILabel *)v5->_subtitleLabel setAccessibilityIdentifier:@"SubtitleLabel"];
    [(UILabel *)v5->_subtitleLabel setLineBreakMode:4];
    v18 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCaption1 weight:UIFontWeightRegular];
    [(UILabel *)v5->_subtitleLabel setFont:v18];

    [(UILabel *)v5->_subtitleLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v5->_subtitleLabel setMinimumScaleFactor:0.699999988];
    [(UILabel *)v5->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = +[UIColor _carSystemPrimaryColor];
    [(UILabel *)v5->_subtitleLabel setTextColor:v19];

    LODWORD(v20) = 1148846080;
    [(UILabel *)v5->_subtitleLabel setContentCompressionResistancePriority:1 forAxis:v20];
    LODWORD(v21) = 1148846080;
    [(UILabel *)v5->_subtitleLabel setContentHuggingPriority:1 forAxis:v21];
    [(CarETAOnlyGuidanceSign *)v5 addSubview:v5->_subtitleLabel];
    v22 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    evArrivalInfoLabel = v5->_evArrivalInfoLabel;
    v5->_evArrivalInfoLabel = v22;

    [(UILabel *)v5->_evArrivalInfoLabel setAccessibilityIdentifier:@"EVArrivalInfoLabel"];
    [(UILabel *)v5->_evArrivalInfoLabel setLineBreakMode:4];
    v24 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCaption1 weight:UIFontWeightRegular];
    [(UILabel *)v5->_evArrivalInfoLabel setFont:v24];

    [(UILabel *)v5->_evArrivalInfoLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v5->_evArrivalInfoLabel setMinimumScaleFactor:0.699999988];
    [(UILabel *)v5->_evArrivalInfoLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v25 = +[UIColor _carSystemPrimaryColor];
    [(UILabel *)v5->_evArrivalInfoLabel setTextColor:v25];

    LODWORD(v26) = 1148846080;
    [(UILabel *)v5->_evArrivalInfoLabel setContentCompressionResistancePriority:1 forAxis:v26];
    LODWORD(v27) = 1148846080;
    [(UILabel *)v5->_evArrivalInfoLabel setContentHuggingPriority:1 forAxis:v27];
    [(CarETAOnlyGuidanceSign *)v5 addSubview:v5->_evArrivalInfoLabel];
    v28 = objc_opt_new();
    v29 = [(UILabel *)v5->_titleLabel firstBaselineAnchor];
    v30 = [(CarETAOnlyGuidanceSign *)v5 topAnchor];
    v31 = [v29 constraintEqualToAnchor:v30 constant:13.0];
    [v28 addObject:v31];

    v32 = [(UILabel *)v5->_titleLabel leadingAnchor];
    v33 = [(CarETAOnlyGuidanceSign *)v5 leadingAnchor];
    v34 = [v32 constraintEqualToAnchor:v33 constant:10.0];
    [v28 addObject:v34];

    v35 = [(UILabel *)v5->_titleLabel trailingAnchor];
    v36 = [(CarETAOnlyGuidanceSign *)v5 trailingAnchor];
    v37 = [v35 constraintEqualToAnchor:v36 constant:-10.0];
    [v28 addObject:v37];

    v38 = [(UILabel *)v5->_subtitleLabel firstBaselineAnchor];
    v39 = [(UILabel *)v5->_titleLabel lastBaselineAnchor];
    v40 = [v38 constraintEqualToAnchor:v39 constant:18.0];
    [v28 addObject:v40];

    v41 = [(UILabel *)v5->_subtitleLabel leadingAnchor];
    v42 = [(CarETAOnlyGuidanceSign *)v5 leadingAnchor];
    v43 = [v41 constraintEqualToAnchor:v42 constant:10.0];
    [v28 addObject:v43];

    v44 = [(UILabel *)v5->_subtitleLabel trailingAnchor];
    v45 = [(CarETAOnlyGuidanceSign *)v5 trailingAnchor];
    v46 = [v44 constraintEqualToAnchor:v45 constant:-10.0];
    [v28 addObject:v46];

    v47 = [(UILabel *)v5->_evArrivalInfoLabel firstBaselineAnchor];
    v48 = [(UILabel *)v5->_subtitleLabel lastBaselineAnchor];
    v49 = [v47 constraintEqualToAnchor:v48 constant:16.0];
    [v28 addObject:v49];

    v50 = [(UILabel *)v5->_evArrivalInfoLabel leadingAnchor];
    v51 = [(CarETAOnlyGuidanceSign *)v5 leadingAnchor];
    v52 = [v50 constraintEqualToAnchor:v51 constant:10.0];
    [v28 addObject:v52];

    v53 = [(UILabel *)v5->_evArrivalInfoLabel trailingAnchor];
    v54 = [(CarETAOnlyGuidanceSign *)v5 trailingAnchor];
    v55 = [v53 constraintEqualToAnchor:v54 constant:-10.0];
    [v28 addObject:v55];

    [(CarETAOnlyGuidanceSign *)v5 _refreshBottomConstraint];
    +[NSLayoutConstraint activateConstraints:v28];
  }
  return v5;
}

- (void)_updateContents
{
  id v3 = objc_alloc_init((Class)NSMutableParagraphStyle);
  LODWORD(v4) = 1036831949;
  [v3 setHyphenationFactor:v4];
  [v3 setLineBreakMode:4];
  NSAttributedStringKey v43 = NSParagraphStyleAttributeName;
  id v44 = v3;
  v5 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  id v6 = objc_alloc((Class)NSAttributedString);
  uint64_t v7 = [(CarETAOnlyGuidanceSign *)self title];
  v8 = (void *)v7;
  if (v7) {
    CFStringRef v9 = (const __CFString *)v7;
  }
  else {
    CFStringRef v9 = &stru_101324E70;
  }
  id v10 = [v6 initWithString:v9 attributes:v5];
  v11 = [(CarETAOnlyGuidanceSign *)self titleLabel];
  [v11 setAttributedText:v10];

  uint64_t v12 = 40;
  if (self->_numberOfStops)
  {
    v13 = +[NSBundle mainBundle];
    double v14 = [v13 localizedStringForKey:@"Number of stops [Route Genius]" value:@"localized string not found" table:0];
    double v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, self->_numberOfStops);
  }
  else
  {
    double v15 = 0;
  }
  v16 = [(CarETAOnlyGuidanceSign *)self latestETA];

  if (v16)
  {
    id v42 = v3;
    id v17 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
    v18 = +[NSBundle mainBundle];
    v19 = [v18 localizedStringForKey:@"00:00 ETA [CarPlay]" value:@"localized string not found" table:0];

    double v20 = [(CarETAOnlyGuidanceSign *)self latestETA];
    uint64_t v12 = [v20 etaDateStringWithAMPMSymbol:0 allowTimeZone:0];

    double v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v12);
    [v17 addObject:v21];
    if (v15)
    {
      v22 = v5;
      v23 = v15;
      [v17 addObject:v15];
    }
    else
    {
      v23 = 0;
      v22 = v5;
      v25 = [(CarETAOnlyGuidanceSign *)self latestETA];
      double v26 = +[NSString _navigation_stringWithMinutes:andAbbreviationType:](NSString, "_navigation_stringWithMinutes:andAbbreviationType:", [v25 remainingMinutes], 1);

      [v17 addObject:v26];
    }
    double v27 = +[NSBundle mainBundle];
    v28 = [v27 localizedStringForKey:@" · [List view details separator]" value:@"localized string not found" table:0];

    v29 = [v17 componentsJoinedByString:v28];
    v30 = [(CarETAOnlyGuidanceSign *)self subtitleLabel];
    [v30 setText:v29];

    v31 = [(CarETAOnlyGuidanceSign *)self subtitleLabel];
    [v31 setNumberOfLines:1];

    v5 = v22;
    double v15 = v23;
    id v3 = v42;
  }
  else if (v15)
  {
    v24 = [(CarETAOnlyGuidanceSign *)self subtitleLabel];
    [v24 setNumberOfLines:0];

    id v17 = [(CarETAOnlyGuidanceSign *)self subtitleLabel];
    [v17 setText:v15];
  }
  else
  {
    v37 = [(CarETAOnlyGuidanceSign *)self subtitleOverride];

    v38 = [(CarETAOnlyGuidanceSign *)self subtitleLabel];
    v39 = v38;
    if (v37)
    {
      [v38 setNumberOfLines:0];

      id v17 = [(CarETAOnlyGuidanceSign *)self subtitleOverride];
      v40 = [(CarETAOnlyGuidanceSign *)self subtitleLabel];
      [v40 setText:v17];
    }
    else
    {
      [v38 setNumberOfLines:1];

      id v17 = +[NSBundle mainBundle];
      v40 = [v17 localizedStringForKey:@"Car_PROACTIVE_Calculating ETA" value:@"localized string not found" table:0];
      v41 = [(CarETAOnlyGuidanceSign *)self subtitleLabel];
      [v41 setText:v40];
    }
  }

  v32 = [(CarETAOnlyGuidanceSign *)self latestETA];
  v33 = [v32 arrivalBatteryCharge];
  [(CarETAOnlyGuidanceSign *)self setShowsEvLabel:v33 != 0];

  unsigned int v34 = [(CarETAOnlyGuidanceSign *)self showsEvLabel];
  if (v34)
  {
    v33 = [(CarETAOnlyGuidanceSign *)self latestETA];
    uint64_t v12 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCaption1 weight:UIFontWeightRegular];
    v35 = [v33 extendedArrivalBatteryChargeStringWithFont:v12];
  }
  else
  {
    v35 = 0;
  }
  v36 = [(CarETAOnlyGuidanceSign *)self evArrivalInfoLabel];
  [v36 setAttributedText:v35];

  if (v34)
  {
  }
}

- (void)setShowsEvLabel:(BOOL)a3
{
  if (self->_showsEvLabel != a3)
  {
    self->_showsEvLabel = a3;
    [(CarETAOnlyGuidanceSign *)self _refreshBottomConstraint];
  }
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToString:self->_title] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_title, a3);
    [(CarETAOnlyGuidanceSign *)self _updateContents];
  }
}

- (void)setNumberOfStops:(unint64_t)a3
{
  if (self->_numberOfStops != a3)
  {
    self->_numberOfStops = a3;
    [(CarETAOnlyGuidanceSign *)self _updateContents];
  }
}

- (void)setSubtitleOverride:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToString:self->_subtitleOverride] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_subtitleOverride, a3);
    [(CarETAOnlyGuidanceSign *)self _updateContents];
  }
}

- (void)setLatestETA:(id)a3
{
  id v5 = (GuidanceETA *)a3;
  if (self->_latestETA != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_latestETA, a3);
    [(CarETAOnlyGuidanceSign *)self _updateContents];
    id v5 = v6;
  }
}

- (void)_refreshBottomConstraint
{
  if (self->_bottomConstraint)
  {
    bottomConstraint = self->_bottomConstraint;
    id v3 = +[NSArray arrayWithObjects:&bottomConstraint count:1];
    +[NSLayoutConstraint deactivateConstraints:v3];
  }
  uint64_t v4 = 3;
  if (!self->_showsEvLabel) {
    uint64_t v4 = 2;
  }
  id v5 = *(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CarETAOnlyGuidanceSign__showsEvLabel[v4]);
  id v6 = [v5 lastBaselineAnchor];
  uint64_t v7 = [(CarETAOnlyGuidanceSign *)self bottomAnchor];
  LODWORD(v8) = 1148829696;
  CFStringRef v9 = [v6 constraintEqualToAnchor:v7 constant:0.0 priority:v8];
  id v10 = self->_bottomConstraint;
  self->_bottomConstraint = v9;

  uint64_t v12 = self->_bottomConstraint;
  v11 = +[NSArray arrayWithObjects:&v12 count:1];

  +[NSLayoutConstraint activateConstraints:v11];
}

- (id)viewForLastBaselineLayout
{
  if ([(CarETAOnlyGuidanceSign *)self showsEvLabel]) {
    [(CarETAOnlyGuidanceSign *)self evArrivalInfoLabel];
  }
  else {
  id v3 = [(CarETAOnlyGuidanceSign *)self subtitleLabel];
  }

  return v3;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitleOverride
{
  return self->_subtitleOverride;
}

- (unint64_t)numberOfStops
{
  return self->_numberOfStops;
}

- (GuidanceETA)latestETA
{
  return self->_latestETA;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UILabel)evArrivalInfoLabel
{
  return self->_evArrivalInfoLabel;
}

- (void)setEvArrivalInfoLabel:(id)a3
{
}

- (BOOL)showsEvLabel
{
  return self->_showsEvLabel;
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
  objc_storeStrong((id *)&self->_evArrivalInfoLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_latestETA, 0);
  objc_storeStrong((id *)&self->_subtitleOverride, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_bottomConstraint, 0);
}

@end