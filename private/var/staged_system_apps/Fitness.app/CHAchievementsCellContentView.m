@interface CHAchievementsCellContentView
+ (BOOL)_shouldShowProgressBar:(id)a3;
+ (BOOL)shouldShowCountForAchievement:(id)a3;
+ (double)cellHeightForAchievement:(id)a3 preferredWidth:(double)a4 appliesLargeCellInsets:(BOOL)a5 locProvider:(id)a6;
+ (double)cellHeightForAchievement:(id)a3 preferredWidth:(double)a4 appliesLargeCellInsets:(BOOL)a5 locProvider:(id)a6 withProgressBar:(BOOL)a7;
+ (double)cellHeightForAchievement:(id)a3 preferredWidth:(double)a4 appliesLargeCellInsets:(BOOL)a5 locProvider:(id)a6 withProgressBar:(BOOL)a7 formatForFriend:(BOOL)a8;
+ (id)monthlyDateFormatter;
+ (id)stringForAchievement:(id)a3 locProvider:(id)a4 formatForFriend:(BOOL)a5;
- (AAUIAchievementResourceProvider)resourceProvider;
- (BOOL)appliesLargeCellInset;
- (BOOL)badgeHidden;
- (CALayer)darkeningLayer;
- (CGRect)badgeRect;
- (CHAchievementsCellContentView)initWithFrame:(CGRect)a3;
- (CHPillLabelView)earnedInstanceCountLabelView;
- (NSLayoutConstraint)countLabelTopConstraint;
- (NSLayoutConstraint)labelFirstBaselineConstraint;
- (NSLayoutConstraint)leadingTextConstraint;
- (NSLayoutConstraint)trailingTextConstraint;
- (NSString)templateUniqueName;
- (UIColor)earnedInstanceCountLabelBackgroundColor;
- (UIImageView)badgeView;
- (UILabel)label;
- (UIProgressView)progressBar;
- (double)preferredWidth;
- (void)_populateProgressBar:(id)a3;
- (void)annotateView:(id)a3 withAchievement:(id)a4;
- (void)applyProgressBarConstraints:(id)a3;
- (void)applyTextBaselineConstraints;
- (void)applyTextLeadingAndTrailingConstraints;
- (void)applyViewConstraints;
- (void)configureWithAchievement:(id)a3 badgeImageFactory:(id)a4 locProvider:(id)a5;
- (void)configureWithAchievement:(id)a3 badgeImageFactory:(id)a4 locProvider:(id)a5 shouldShowProgressBar:(BOOL)a6;
- (void)configureWithAchievement:(id)a3 badgeImageFactory:(id)a4 locProvider:(id)a5 shouldShowProgressBar:(BOOL)a6 formatForFriend:(BOOL)a7;
- (void)fontSizeChanged:(id)a3;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)prepareForReuse;
- (void)setAppliesLargeCellInset:(BOOL)a3;
- (void)setBadgeHidden:(BOOL)a3;
- (void)setBadgeView:(id)a3;
- (void)setCountLabelTopConstraint:(id)a3;
- (void)setDarkeningLayer:(id)a3;
- (void)setEarnedInstanceCount:(int64_t)a3;
- (void)setEarnedInstanceCountLabelBackgroundColor:(id)a3;
- (void)setEarnedInstanceCountLabelView:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLabelFirstBaselineConstraint:(id)a3;
- (void)setLeadingTextConstraint:(id)a3;
- (void)setPreferredWidth:(double)a3;
- (void)setProgressBar:(id)a3;
- (void)setResourceProvider:(id)a3;
- (void)setTemplateUniqueName:(id)a3;
- (void)setTrailingTextConstraint:(id)a3;
@end

@implementation CHAchievementsCellContentView

- (CHAchievementsCellContentView)initWithFrame:(CGRect)a3
{
  v34.receiver = self;
  v34.super_class = (Class)CHAchievementsCellContentView;
  v3 = -[CHAchievementsCellContentView initWithFrame:](&v34, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(CHAchievementsCellContentView *)v3 setBackgroundColor:v4];

    uint64_t v5 = +[UIColor fu_systemTextGreyColor];
    earnedInstanceCountLabelBackgroundColor = v3->_earnedInstanceCountLabelBackgroundColor;
    v3->_earnedInstanceCountLabelBackgroundColor = (UIColor *)v5;

    v7 = (AAUIAchievementResourceProvider *)objc_alloc_init((Class)AAUIAchievementResourceProvider);
    resourceProvider = v3->_resourceProvider;
    v3->_resourceProvider = v7;

    v3->_preferredWidth = 100.0;
    id v9 = objc_alloc((Class)UIImageView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v13 = [v9 initWithFrame:CGRectMake(0, 0, width, height)];
    badgeView = v3->_badgeView;
    v3->_badgeView = v13;

    [(UIImageView *)v3->_badgeView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_badgeView setContentMode:4];
    v15 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    label = v3->_label;
    v3->_label = v15;

    v17 = +[UIColor labelColor];
    [(UILabel *)v3->_label setTextColor:v17];

    [(UILabel *)v3->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_label setNumberOfLines:0];
    [(UILabel *)v3->_label setTextAlignment:1];
    [(UILabel *)v3->_label setLineBreakMode:0];
    LODWORD(v18) = 1036831949;
    [(UILabel *)v3->_label _setHyphenationFactor:v18];
    v19 = (UIProgressView *)[objc_alloc((Class)UIProgressView) initWithProgressViewStyle:1];
    progressBar = v3->_progressBar;
    v3->_progressBar = v19;

    v21 = +[ARUIMetricColors briskColors];
    v22 = [v21 gradientLightColor];
    [(UIProgressView *)v3->_progressBar setProgressTintColor:v22];

    v23 = sub_10017859C();
    [(UIProgressView *)v3->_progressBar setTrackTintColor:v23];

    v24 = [(UIProgressView *)v3->_progressBar layer];
    [v24 setCornerRadius:2.0];

    [(UIProgressView *)v3->_progressBar setTranslatesAutoresizingMaskIntoConstraints:0];
    v25 = [(UIProgressView *)v3->_progressBar layer];
    [v25 setMasksToBounds:1];

    [(UIProgressView *)v3->_progressBar setHidden:1];
    [(CHAchievementsCellContentView *)v3 addSubview:v3->_badgeView];
    [(CHAchievementsCellContentView *)v3 addSubview:v3->_label];
    if (AAUIShouldUseNewTrophyCase()) {
      [(CHAchievementsCellContentView *)v3 addSubview:v3->_progressBar];
    }
    v26 = -[CHPillLabelView initWithFrame:]([CHPillLabelView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    earnedInstanceCountLabelView = v3->_earnedInstanceCountLabelView;
    v3->_earnedInstanceCountLabelView = v26;

    [(CHPillLabelView *)v3->_earnedInstanceCountLabelView setPillBackgroundColor:v3->_earnedInstanceCountLabelBackgroundColor];
    [(CHAchievementsCellContentView *)v3 addSubview:v3->_earnedInstanceCountLabelView];
    [(CHAchievementsCellContentView *)v3 applyViewConstraints];
    [(CHAchievementsCellContentView *)v3 fontSizeChanged:0];
    v28 = +[NSNotificationCenter defaultCenter];
    [v28 addObserver:v3 selector:"fontSizeChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];

    uint64_t v29 = +[CALayer layer];
    darkeningLayer = v3->_darkeningLayer;
    v3->_darkeningLayer = (CALayer *)v29;

    id v31 = +[UIColor blackColor];
    -[CALayer setBackgroundColor:](v3->_darkeningLayer, "setBackgroundColor:", [v31 CGColor]);

    v32 = [(CHAchievementsCellContentView *)v3 layer];
    [v32 addSublayer:v3->_darkeningLayer];

    [(CALayer *)v3->_darkeningLayer setOpacity:0.0];
  }
  return v3;
}

+ (id)monthlyDateFormatter
{
  if (qword_10096B608 != -1) {
    dispatch_once(&qword_10096B608, &stru_1008ADE50);
  }
  v2 = (void *)qword_10096B600;

  return v2;
}

+ (id)stringForAchievement:(id)a3 locProvider:(id)a4 formatForFriend:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = +[UIColor labelColor];
  v11 = +[UIColor secondaryLabelColor];
  v12 = [v9 titleForAchievement:v8];
  v13 = [v12 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

  if (!v13)
  {
    v14 = [v8 template];
    v13 = [v14 uniqueName];
  }
  if ([v8 unearned])
  {
    v15 = [v9 unachievedShortDescriptionForAchievement:v8];
  }
  else
  {
    v15 = [v9 achievedShortDescriptionForAchievement:v8];
    if (v5 && [a1 shouldShowCountForAchievement:v8])
    {
      v16 = [v8 relevantEarnedInstance];
      v17 = [v16 earnedDateComponents];

      double v18 = +[NSCalendar currentCalendar];
      [v18 dateFromComponents:v17];
      v20 = uint64_t v19 = v10;

      uint64_t v21 = ACHFormatDateWithStyle();

      uint64_t v10 = v19;
      v15 = (__CFString *)v21;
    }
  }
  if (([(__CFString *)v15 isEqualToString:@"ACHIEVEMENT_UNACHIEVED_SHORT_DESCRIPTION"] & 1) != 0|| [(__CFString *)v15 isEqualToString:@"ACHIEVEMENT_ACHIEVED_SHORT_DESCRIPTION"])
  {

    v15 = &stru_1008D8AB8;
  }
  if ([(__CFString *)v15 length])
  {
    uint64_t v22 = [v13 stringByAppendingString:@"\n"];

    v13 = (void *)v22;
  }
  v23 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];
  id v24 = objc_alloc((Class)NSMutableAttributedString);
  v34[0] = NSFontAttributeName;
  v34[1] = NSForegroundColorAttributeName;
  v35[0] = v23;
  v35[1] = v10;
  v25 = (void *)v10;
  v26 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
  id v27 = [v24 initWithString:v13 attributes:v26];

  if ([(__CFString *)v15 length])
  {
    id v28 = objc_alloc((Class)NSAttributedString);
    v32[0] = NSFontAttributeName;
    v32[1] = NSForegroundColorAttributeName;
    v33[0] = v23;
    v33[1] = v11;
    uint64_t v29 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
    id v30 = [v28 initWithString:v15 attributes:v29];
    [v27 appendAttributedString:v30];
  }

  return v27;
}

+ (BOOL)shouldShowCountForAchievement:(id)a3
{
  id v3 = a3;
  v4 = [v3 template];
  if (![v4 displaysEarnedInstanceCount])
  {

    goto LABEL_6;
  }
  unsigned __int8 v5 = [v3 unearned];

  if (v5)
  {
LABEL_6:
    BOOL v6 = 0;
    goto LABEL_7;
  }
  if (ACHShouldUseNewAwardsSystem())
  {
    BOOL v6 = [v3 earnedInstanceCount] != 0;
  }
  else
  {
    id v8 = [v3 earnedInstances];
    BOOL v6 = [v8 count] != 0;
  }
LABEL_7:

  return v6;
}

+ (double)cellHeightForAchievement:(id)a3 preferredWidth:(double)a4 appliesLargeCellInsets:(BOOL)a5 locProvider:(id)a6
{
  +[CHAchievementsCellContentView cellHeightForAchievement:a3 preferredWidth:a5 appliesLargeCellInsets:a6 locProvider:1 withProgressBar:0 formatForFriend:a4];
  return result;
}

+ (double)cellHeightForAchievement:(id)a3 preferredWidth:(double)a4 appliesLargeCellInsets:(BOOL)a5 locProvider:(id)a6 withProgressBar:(BOOL)a7
{
  +[CHAchievementsCellContentView cellHeightForAchievement:a3 preferredWidth:a5 appliesLargeCellInsets:a6 locProvider:a7 withProgressBar:0 formatForFriend:a4];
  return result;
}

+ (double)cellHeightForAchievement:(id)a3 preferredWidth:(double)a4 appliesLargeCellInsets:(BOOL)a5 locProvider:(id)a6 withProgressBar:(BOOL)a7 formatForFriend:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a6;
  if (v11) {
    a4 = a4 + a4 * -0.05;
  }
  if (qword_10096B618 != -1) {
    dispatch_once(&qword_10096B618, &stru_1008ADE70);
  }
  v16 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];
  [(id)qword_10096B610 setFont:v16];

  v17 = [a1 stringForAchievement:v14 locProvider:v15 formatForFriend:v8];
  [(id)qword_10096B610 setAttributedText:v17];

  [qword_10096B610 sizeThatFits:a4, 1.79769313e308];
  [qword_10096B610 setFrame:0.0, 0.0, a4, v18];
  [(id)qword_10096B610 _lastLineBaselineFrameOriginY];
  [(id)qword_10096B610 _firstBaselineOffsetFromTop];
  if (v9) {
    [a1 _shouldShowProgressBar:v14];
  }
  if (![a1 shouldShowCountForAchievement:v14] || v8)
  {
    uint64_t v19 = [(id)qword_10096B610 font];
    [v19 _scaledValueForValue:12.0];
  }
  UICeilToViewScale();
  double v21 = v20;

  return v21;
}

- (void)applyViewConstraints
{
  id v3 = [(CHAchievementsCellContentView *)self badgeView];
  v4 = [v3 leadingAnchor];
  unsigned __int8 v5 = [(CHAchievementsCellContentView *)self leadingAnchor];
  BOOL v6 = [v4 constraintEqualToAnchor:v5];
  [v6 setActive:1];

  v7 = [(CHAchievementsCellContentView *)self badgeView];
  BOOL v8 = [v7 topAnchor];
  BOOL v9 = [(CHAchievementsCellContentView *)self topAnchor];
  uint64_t v10 = [v8 constraintEqualToAnchor:v9];
  [v10 setActive:1];

  BOOL v11 = [(CHAchievementsCellContentView *)self badgeView];
  v12 = [v11 trailingAnchor];
  v13 = [(CHAchievementsCellContentView *)self trailingAnchor];
  id v14 = [v12 constraintEqualToAnchor:v13];
  [v14 setActive:1];

  id v15 = [(CHAchievementsCellContentView *)self badgeView];
  v16 = [v15 heightAnchor];
  v17 = [(UIImageView *)self->_badgeView widthAnchor];
  double v18 = [v16 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  [(CHAchievementsCellContentView *)self applyTextLeadingAndTrailingConstraints];
  [(CHAchievementsCellContentView *)self applyTextBaselineConstraints];
  uint64_t v19 = [(CHAchievementsCellContentView *)self earnedInstanceCountLabelView];
  double v20 = [v19 centerXAnchor];
  double v21 = [(CHAchievementsCellContentView *)self centerXAnchor];
  uint64_t v22 = [v20 constraintEqualToAnchor:v21];
  [v22 setActive:1];

  v23 = [(CHAchievementsCellContentView *)self earnedInstanceCountLabelView];
  id v24 = [v23 topAnchor];
  v25 = [(CHAchievementsCellContentView *)self label];
  v26 = [v25 lastBaselineAnchor];
  id v27 = [v24 constraintEqualToAnchor:v26 constant:6.0];
  [(CHAchievementsCellContentView *)self setCountLabelTopConstraint:v27];

  id v28 = [(CHAchievementsCellContentView *)self countLabelTopConstraint];
  [v28 setActive:1];
}

- (void)applyTextLeadingAndTrailingConstraints
{
  double v3 = 0.0;
  if ([(CHAchievementsCellContentView *)self appliesLargeCellInset])
  {
    [(CHAchievementsCellContentView *)self preferredWidth];
    double v3 = v4 * 0.025;
  }
  unsigned __int8 v5 = [(CHAchievementsCellContentView *)self label];
  BOOL v6 = [v5 leadingAnchor];
  v7 = [(CHAchievementsCellContentView *)self leadingAnchor];
  BOOL v8 = [v6 constraintEqualToAnchor:v7 constant:v3];
  [(CHAchievementsCellContentView *)self setLeadingTextConstraint:v8];

  BOOL v9 = [(CHAchievementsCellContentView *)self label];
  uint64_t v10 = [v9 trailingAnchor];
  BOOL v11 = [(CHAchievementsCellContentView *)self trailingAnchor];
  v12 = [v10 constraintEqualToAnchor:v11 constant:-v3];
  [(CHAchievementsCellContentView *)self setTrailingTextConstraint:v12];

  v13 = [(CHAchievementsCellContentView *)self leadingTextConstraint];
  v16[0] = v13;
  id v14 = [(CHAchievementsCellContentView *)self trailingTextConstraint];
  v16[1] = v14;
  id v15 = +[NSArray arrayWithObjects:v16 count:2];
  +[NSLayoutConstraint activateConstraints:v15];
}

- (void)applyTextBaselineConstraints
{
  if ([(CHAchievementsCellContentView *)self appliesLargeCellInset]) {
    double v3 = 17.0;
  }
  else {
    double v3 = 9.0;
  }
  double v4 = [(CHAchievementsCellContentView *)self label];
  unsigned __int8 v5 = [v4 firstBaselineAnchor];
  BOOL v6 = [(CHAchievementsCellContentView *)self badgeView];
  v7 = [v6 bottomAnchor];
  BOOL v8 = [(CHAchievementsCellContentView *)self label];
  BOOL v9 = [v8 font];
  [v9 _scaledValueForValue:v3];
  uint64_t v10 = [v5 constraintEqualToAnchor:v7 constant:];
  [(CHAchievementsCellContentView *)self setLabelFirstBaselineConstraint:v10];

  id v11 = [(CHAchievementsCellContentView *)self labelFirstBaselineConstraint];
  [v11 setActive:1];
}

- (void)applyProgressBarConstraints:(id)a3
{
  id v24 = a3;
  if (AAUIShouldUseNewTrophyCase()
    && [(id)objc_opt_class() _shouldShowProgressBar:v24])
  {
    double v4 = [(CHAchievementsCellContentView *)self progressBar];
    unsigned __int8 v5 = [v4 leadingAnchor];
    BOOL v6 = [(CHAchievementsCellContentView *)self leadingAnchor];
    v7 = [v5 constraintEqualToAnchor:v6 constant:5.0];
    [v7 setActive:1];

    BOOL v8 = [(CHAchievementsCellContentView *)self progressBar];
    BOOL v9 = [v8 trailingAnchor];
    uint64_t v10 = [(CHAchievementsCellContentView *)self trailingAnchor];
    id v11 = [v9 constraintEqualToAnchor:v10 constant:-5.0];
    [v11 setActive:1];

    v12 = +[UIApplication sharedApplication];
    v13 = [v12 preferredContentSizeCategory];
    LODWORD(v10) = UIContentSizeCategoryIsAccessibilityCategory(v13);

    if (v10) {
      double v14 = 8.0;
    }
    else {
      double v14 = 4.0;
    }
    id v15 = [(CHAchievementsCellContentView *)self progressBar];
    v16 = [v15 layer];
    [v16 setCornerRadius:v14 * 0.5];

    v17 = [(CHAchievementsCellContentView *)self progressBar];
    double v18 = [v17 heightAnchor];
    uint64_t v19 = [v18 constraintEqualToConstant:v14];
    [v19 setActive:1];

    double v20 = [(CHAchievementsCellContentView *)self progressBar];
    double v21 = [v20 bottomAnchor];
    uint64_t v22 = [(CHAchievementsCellContentView *)self bottomAnchor];
    v23 = [v21 constraintEqualToAnchor:v22 constant:-15.0];
    [v23 setActive:1];
  }
}

- (void)fontSizeChanged:(id)a3
{
  double v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];
  unsigned __int8 v5 = [(CHAchievementsCellContentView *)self label];
  [v5 setFont:v4];

  BOOL v6 = [(CHAchievementsCellContentView *)self labelFirstBaselineConstraint];
  [v6 setActive:0];

  [(CHAchievementsCellContentView *)self applyTextBaselineConstraints];
}

- (void)setAppliesLargeCellInset:(BOOL)a3
{
  if (self->_appliesLargeCellInset != a3)
  {
    self->_appliesLargeCellInset = a3;
    double v4 = [(CHAchievementsCellContentView *)self leadingTextConstraint];
    [v4 setActive:0];

    unsigned __int8 v5 = [(CHAchievementsCellContentView *)self trailingTextConstraint];
    [v5 setActive:0];

    [(CHAchievementsCellContentView *)self applyTextLeadingAndTrailingConstraints];
    [(CHAchievementsCellContentView *)self fontSizeChanged:0];
  }
}

- (void)layoutSublayersOfLayer:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CHAchievementsCellContentView;
  id v4 = a3;
  [(CHAchievementsCellContentView *)&v14 layoutSublayersOfLayer:v4];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  v13 = [(CHAchievementsCellContentView *)self darkeningLayer];
  [v13 setFrame:v6, v8, v10, v12];
}

- (void)setBadgeHidden:(BOOL)a3
{
  BOOL v3 = a3;
  self->_badgeHidden = a3;
  id v4 = [(CHAchievementsCellContentView *)self badgeView];
  [v4 setHidden:v3];
}

- (CGRect)badgeRect
{
  v2 = [(CHAchievementsCellContentView *)self badgeView];
  [v2 frame];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;

  uint64_t v11 = v4;
  uint64_t v12 = v6;
  uint64_t v13 = v8;
  uint64_t v14 = v10;

  return CGRectInset(*(CGRect *)&v11, 10.0, 10.0);
}

- (void)setEarnedInstanceCount:(int64_t)a3
{
  uint64_t v5 = [(CHAchievementsCellContentView *)self earnedInstanceCountLabelView];
  id v6 = v5;
  if (a3 < 1)
  {
    [v5 setHidden:1];
  }
  else
  {
    [v5 setHidden:0];

    id v6 = [(CHAchievementsCellContentView *)self earnedInstanceCountLabelView];
    [v6 setIntegerValue:a3];
  }
}

- (void)configureWithAchievement:(id)a3 badgeImageFactory:(id)a4 locProvider:(id)a5
{
}

- (void)configureWithAchievement:(id)a3 badgeImageFactory:(id)a4 locProvider:(id)a5 shouldShowProgressBar:(BOOL)a6
{
}

- (void)configureWithAchievement:(id)a3 badgeImageFactory:(id)a4 locProvider:(id)a5 shouldShowProgressBar:(BOOL)a6 formatForFriend:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v12)
  {
    [(CHAchievementsCellContentView *)self setHidden:1];
    goto LABEL_24;
  }
  [(CHAchievementsCellContentView *)self setHidden:0];
  id v15 = [v12 template];
  v16 = [v15 uniqueName];
  [(CHAchievementsCellContentView *)self setTemplateUniqueName:v16];

  if (![(id)objc_opt_class() shouldShowCountForAchievement:v12] || v7)
  {
    double v18 = self;
    id v17 = 0;
  }
  else
  {
    if (!ACHShouldUseNewAwardsSystem())
    {
      uint64_t v19 = [v12 earnedInstances];
      -[CHAchievementsCellContentView setEarnedInstanceCount:](self, "setEarnedInstanceCount:", [v19 count]);

      goto LABEL_10;
    }
    id v17 = [v12 earnedInstanceCount];
    double v18 = self;
  }
  [(CHAchievementsCellContentView *)v18 setEarnedInstanceCount:v17];
LABEL_10:
  double v20 = [v12 template];
  double v21 = [v20 sourceName];
  unsigned int v22 = [v21 isEqualToString:kASCompetitionsAchievementTemplateSourceIdentifier];

  if (v22) {
    +[UIColor as_lightCompetitionGold];
  }
  else {
  v23 = +[UIColor secondaryLabelColor];
  }
  [(CHAchievementsCellContentView *)self setEarnedInstanceCountLabelBackgroundColor:v23];

  [(CHAchievementsCellContentView *)self preferredWidth];
  double v25 = v24;
  [(CHAchievementsCellContentView *)self preferredWidth];
  double v27 = v26;
  if (objc_msgSend(v13, "hasCachedThumbnailImageForAchievement:size:", v12, v25, v26))
  {
    id v28 = [v13 thumbnailImageForAchievement:v12 size:v25];
    uint64_t v29 = [(CHAchievementsCellContentView *)self badgeView];
    [v29 setImage:v28];
  }
  else
  {
    id v30 = dispatch_get_global_queue(25, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001607E0;
    block[3] = &unk_1008ADE98;
    id v40 = v13;
    double v43 = v25;
    double v44 = v27;
    id v41 = v12;
    v42 = self;
    dispatch_async(v30, block);
  }
  id v31 = [(id)objc_opt_class() stringForAchievement:v12 locProvider:v14 formatForFriend:v7];
  v32 = [(CHAchievementsCellContentView *)self label];
  [v32 setAttributedText:v31];

  if (AAUIShouldUseNewTrophyCase() && v8)
  {
    [(CHAchievementsCellContentView *)self _populateProgressBar:v12];
    [(CHAchievementsCellContentView *)self applyProgressBarConstraints:v12];
  }
  v33 = [(CHAchievementsCellContentView *)self templateUniqueName];

  if (v33)
  {
    unsigned int v34 = [v12 unearned];
    v35 = &off_1008AE4F0;
    if (!v34) {
      v35 = &off_1008AE4E8;
    }
    v36 = *v35;
    v37 = [(CHAchievementsCellContentView *)self templateUniqueName];
    v38 = +[NSString stringWithFormat:@"%@_%@", v37, v36];
    [(CHAchievementsCellContentView *)self setAccessibilityIdentifier:v38];
  }
  [(CHAchievementsCellContentView *)self annotateView:self->_badgeView withAchievement:v12];
LABEL_24:
}

+ (BOOL)_shouldShowProgressBar:(id)a3
{
  id v3 = a3;
  if (AAUIShouldUseNewTrophyCase() && [v3 unearned])
  {
    uint64_t v4 = [v3 goal];
    if (v4)
    {
      uint64_t v5 = [v3 progress];
      BOOL v6 = v5 != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_populateProgressBar:(id)a3
{
  id v14 = a3;
  if ([(id)objc_opt_class() _shouldShowProgressBar:v14])
  {
    uint64_t v4 = [v14 template];
    uint64_t v5 = [v4 canonicalUnit];

    BOOL v6 = [v14 goal];
    [v6 doubleValueForUnit:v5];
    double v8 = v7;

    uint64_t v9 = [v14 progress];
    [v9 doubleValueForUnit:v5];
    double v11 = v10;

    if (v8 == 0.0)
    {
      p_progressBar = &self->_progressBar;
    }
    else
    {
      double v13 = v11 / v8;
      if (v11 / v8 < 2.22044605e-16) {
        double v13 = 0.01;
      }
      p_progressBar = &self->_progressBar;
      *(float *)&double v13 = v13;
      [(UIProgressView *)*p_progressBar setProgress:v13];
    }
    [(UIProgressView *)*p_progressBar setHidden:v8 == 0.0];
  }
  else
  {
    [(UIProgressView *)self->_progressBar setHidden:1];
  }
}

- (void)prepareForReuse
{
  [(UIImageView *)self->_badgeView setImage:0];
  progressBar = self->_progressBar;

  [(UIProgressView *)progressBar setHidden:1];
}

- (void)setEarnedInstanceCountLabelBackgroundColor:(id)a3
{
  p_earnedInstanceCountLabelBackgroundColor = &self->_earnedInstanceCountLabelBackgroundColor;
  objc_storeStrong((id *)&self->_earnedInstanceCountLabelBackgroundColor, a3);
  id v6 = a3;
  double v7 = *p_earnedInstanceCountLabelBackgroundColor;
  id v8 = [(CHAchievementsCellContentView *)self earnedInstanceCountLabelView];
  [v8 setPillBackgroundColor:v7];
}

- (double)preferredWidth
{
  return self->_preferredWidth;
}

- (void)setPreferredWidth:(double)a3
{
  self->_preferredWidth = a3;
}

- (BOOL)appliesLargeCellInset
{
  return self->_appliesLargeCellInset;
}

- (UIColor)earnedInstanceCountLabelBackgroundColor
{
  return self->_earnedInstanceCountLabelBackgroundColor;
}

- (BOOL)badgeHidden
{
  return self->_badgeHidden;
}

- (UIImageView)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeView:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (UIProgressView)progressBar
{
  return self->_progressBar;
}

- (void)setProgressBar:(id)a3
{
}

- (CHPillLabelView)earnedInstanceCountLabelView
{
  return self->_earnedInstanceCountLabelView;
}

- (void)setEarnedInstanceCountLabelView:(id)a3
{
}

- (NSLayoutConstraint)leadingTextConstraint
{
  return self->_leadingTextConstraint;
}

- (void)setLeadingTextConstraint:(id)a3
{
}

- (NSLayoutConstraint)trailingTextConstraint
{
  return self->_trailingTextConstraint;
}

- (void)setTrailingTextConstraint:(id)a3
{
}

- (NSLayoutConstraint)labelFirstBaselineConstraint
{
  return self->_labelFirstBaselineConstraint;
}

- (void)setLabelFirstBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)countLabelTopConstraint
{
  return self->_countLabelTopConstraint;
}

- (void)setCountLabelTopConstraint:(id)a3
{
}

- (AAUIAchievementResourceProvider)resourceProvider
{
  return self->_resourceProvider;
}

- (void)setResourceProvider:(id)a3
{
}

- (CALayer)darkeningLayer
{
  return self->_darkeningLayer;
}

- (void)setDarkeningLayer:(id)a3
{
}

- (NSString)templateUniqueName
{
  return self->_templateUniqueName;
}

- (void)setTemplateUniqueName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateUniqueName, 0);
  objc_storeStrong((id *)&self->_darkeningLayer, 0);
  objc_storeStrong((id *)&self->_resourceProvider, 0);
  objc_storeStrong((id *)&self->_countLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_labelFirstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_trailingTextConstraint, 0);
  objc_storeStrong((id *)&self->_leadingTextConstraint, 0);
  objc_storeStrong((id *)&self->_earnedInstanceCountLabelView, 0);
  objc_storeStrong((id *)&self->_progressBar, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);

  objc_storeStrong((id *)&self->_earnedInstanceCountLabelBackgroundColor, 0);
}

- (void)annotateView:(id)a3 withAchievement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10069AFDC((uint64_t)v6, a4);
}

@end