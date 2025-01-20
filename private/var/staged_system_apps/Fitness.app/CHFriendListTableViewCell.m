@interface CHFriendListTableViewCell
+ (double)measuredHeightWithDisplayMode:(int64_t)a3 formattingManager:(id)a4;
+ (double)preferredHeight;
- (ARUIRingsView)ringsView;
- (CHFriendListTableViewCell)initWithFrame:(CGRect)a3;
- (CHFriendListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImageView)competitionBadgeView;
- (UILabel)detailLineOneLabel;
- (UILabel)detailLineTwoLabel;
- (double)_lastBaseline;
- (int64_t)displayMode;
- (void)_setupCell;
- (void)layoutSubviews;
- (void)setCompetitionBadgeView:(id)a3;
- (void)setDetailLineOneLabel:(id)a3;
- (void)setDetailLineTwoLabel:(id)a3;
- (void)setDisplayMode:(int64_t)a3;
- (void)setFriend:(id)a3 snapshot:(id)a4 formattingManager:(id)a5 animated:(BOOL)a6;
- (void)setRingsView:(id)a3;
@end

@implementation CHFriendListTableViewCell

- (void)_setupCell
{
  v3 = +[UIColor systemBackgroundColor];
  [(CHFriendListTableViewCell *)self setBackgroundColor:v3];

  v4 = sub_10005DB50();
  v5 = [(CHFriendListTableViewCell *)self contentView];
  [v5 setBackgroundColor:v4];

  v6 = [(CHFriendListTableViewCell *)self contentView];
  v7 = [v6 layer];
  [v7 setCornerRadius:12.0];

  v8 = +[UIColor labelColor];
  v9 = [(CHFriendListTableViewCell *)self textLabel];
  [v9 setTextColor:v8];

  v10 = [(CHFriendListTableViewCell *)self textLabel];
  [v10 setLineBreakMode:4];

  id v11 = objc_alloc((Class)UILabel);
  CGFloat y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v15 = [v11 initWithFrame:CGRectZero.origin.x, y, width, height];
  detailLineOneLabel = self->_detailLineOneLabel;
  self->_detailLineOneLabel = v15;

  v17 = [(CHFriendListTableViewCell *)self contentView];
  v18 = [(CHFriendListTableViewCell *)self detailLineOneLabel];
  [v17 addSubview:v18];

  v19 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  detailLineTwoLabel = self->_detailLineTwoLabel;
  self->_detailLineTwoLabel = v19;

  v21 = [(CHFriendListTableViewCell *)self contentView];
  [v21 addSubview:self->_detailLineTwoLabel];

  id v22 = objc_alloc((Class)ARUIRingsView);
  v23 = +[ARUIRingGroup activityRingGroupForRingType:3];
  v24 = [v23 forCompanion];
  v25 = (ARUIRingsView *)[v22 initWithRingGroup:v24];
  ringsView = self->_ringsView;
  self->_ringsView = v25;

  [(CHFriendListTableViewCell *)self valueForSmallWidth:0.788 mediumWidth:0.923 largeWidth:1.0];
  double v28 = v27;
  *(float *)&CGFloat y = v27 * 52.0;
  v29 = [(ARUIRingsView *)self->_ringsView ringGroup];
  LODWORD(v30) = LODWORD(y);
  [v29 setGroupDiameter:v30];

  v31 = [(ARUIRingsView *)self->_ringsView ringGroup];
  *(float *)&CGFloat y = v28 * 6.0;
  LODWORD(v32) = LODWORD(y);
  [v31 setThickness:v32];

  v33 = [(ARUIRingsView *)self->_ringsView ringGroup];
  *(float *)&double v28 = v28 * 1.0;
  LODWORD(v34) = LODWORD(v28);
  [v33 setInterspacing:v34];

  v35 = +[UIColor clearColor];
  [(ARUIRingsView *)self->_ringsView setBackgroundColor:v35];

  id v36 = [(CHFriendListTableViewCell *)self contentView];
  [v36 addSubview:self->_ringsView];
}

- (CHFriendListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CHFriendListTableViewCell;
  v4 = [(CHFriendListTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(CHFriendListTableViewCell *)v4 _setupCell];
  }
  return v5;
}

- (CHFriendListTableViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CHFriendListTableViewCell;
  v3 = -[CHFriendListTableViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CHFriendListTableViewCell *)v3 _setupCell];
  }
  return v4;
}

- (void)layoutSubviews
{
  *(void *)&recta.origin.CGFloat y = self;
  *(void *)&recta.size.double width = CHFriendListTableViewCell;
  [(CGFloat *)(objc_super *)&recta.origin.y layoutSubviews];
  double v3 = sub_1001784A0();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  v10 = [(CHFriendListTableViewCell *)self contentView];
  [v10 frame];
  double v12 = v5 + v11;
  double v14 = v3 + v13;
  double v16 = v15 - (v5 + v9);
  double v18 = v17 - (v3 + v7);
  v19 = [(CHFriendListTableViewCell *)self contentView];
  [v19 setFrame:v12, v14, v16, v18];

  v20 = [(CHFriendListTableViewCell *)self contentView];
  [v20 bounds];
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;

  [(CHFriendListTableViewCell *)self valueForSmallWidth:0.788 mediumWidth:0.923 largeWidth:1.0];
  double v30 = 52.0 * v29 + 1.0;
  [(CHFriendListTableViewCell *)self valueForSmallWidth:17.0 mediumWidth:20.0 largeWidth:22.0];
  double v32 = v31;
  v66.origin.x = v22;
  v66.origin.CGFloat y = v24;
  v66.size.double width = v26;
  v66.size.double height = v28;
  -[ARUIRingsView setFrame:](self->_ringsView, "setFrame:", v32, CGRectGetMidY(v66) + v30 * -0.5, v30, v30);
  [(ARUIRingsView *)self->_ringsView frame];
  double v33 = v32 + CGRectGetMaxX(v67);
  double v34 = [(CHFriendListTableViewCell *)self textLabel];
  v35 = [v34 font];
  [v35 _scaledValueForValue:28.0];
  double v37 = v36;

  v38 = [(CHFriendListTableViewCell *)self textLabel];
  [v38 sizeToFit];

  v39 = [(CHFriendListTableViewCell *)self textLabel];
  [v39 frame];
  double v41 = v40;
  double v43 = v42;

  recta.origin.x = v22;
  v68.origin.x = v22;
  v68.origin.CGFloat y = v24;
  v68.size.double width = v26;
  v68.size.double height = v28;
  CGFloat v44 = CGRectGetMaxX(v68) - v33 + -4.0;
  v45 = [(CHFriendListTableViewCell *)self textLabel];
  [v45 setFrame:v33, v41, v44, v43];

  v46 = [(CHFriendListTableViewCell *)self textLabel];
  [v46 _setFirstLineBaselineFrameOriginY:v37];

  p_detailLineOneLabel = &self->_detailLineOneLabel;
  [(UILabel *)self->_detailLineOneLabel sizeToFit];
  [(UILabel *)self->_detailLineOneLabel frame];
  [(UILabel *)self->_detailLineOneLabel setFrame:v33];
  unint64_t displayMode = self->_displayMode;
  if (displayMode < 4)
  {
    [(UILabel *)*p_detailLineOneLabel _setLastLineBaselineFrameOriginY:v37 + 28.0];
    double v49 = v37 + 28.0 + 28.0;
LABEL_3:
    p_detailLineOneLabel = &self->_detailLineTwoLabel;
    [(UILabel *)self->_detailLineTwoLabel sizeToFit];
    [(UILabel *)self->_detailLineTwoLabel frame];
    [(UILabel *)self->_detailLineTwoLabel setFrame:v33];
LABEL_4:
    -[UILabel _setLastLineBaselineFrameOriginY:](*p_detailLineOneLabel, "_setLastLineBaselineFrameOriginY:", v49, *(void *)&recta.origin.x);
    goto LABEL_5;
  }
  if (displayMode == 4)
  {
    v58 = [(UILabel *)*p_detailLineOneLabel font];
    [v58 _scaledValueForValue:20.0];
    double v60 = v59;

    double v61 = v37 + v60;
    [(UILabel *)*p_detailLineOneLabel _setLastLineBaselineFrameOriginY:v61];
    double v49 = v61 + 28.0;
    goto LABEL_3;
  }
  if (displayMode == 5)
  {
    double v49 = v37 + 42.0;
    goto LABEL_4;
  }
LABEL_5:
  if (self->_competitionBadgeView)
  {
    [(CHFriendListTableViewCell *)self bounds];
    -[UIImageView setFrame:](self->_competitionBadgeView, "setFrame:", CGRectGetWidth(v69) + -34.0 + -21.0, 0.0, 21.0, 21.0);
    competitionBadgeView = self->_competitionBadgeView;
    [(UIImageView *)competitionBadgeView frame];
    double MidX = CGRectGetMidX(v70);
    v71.origin.x = recta.origin.x;
    v71.origin.CGFloat y = v24;
    v71.size.double width = v26;
    v71.size.double height = v28;
    -[UIImageView setCenter:](competitionBadgeView, "setCenter:", MidX, CGRectGetMidY(v71));
  }
  if ((id)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", 0, *(void *)&recta.origin.x) == (id)1)
  {
    v52 = [(CHFriendListTableViewCell *)self textLabel];
    *(void *)&recta.size.double height = v52;
    v53 = [(CHFriendListTableViewCell *)self detailLineOneLabel];
    v63 = v53;
    v54 = [(CHFriendListTableViewCell *)self detailLineTwoLabel];
    v64 = v54;
    v55 = [(CHFriendListTableViewCell *)self ringsView];
    v65 = v55;
    v56 = +[NSArray arrayWithObjects:&recta.size.height count:4];

    if (self->_competitionBadgeView)
    {
      uint64_t v57 = [v56 arrayByAddingObject:];

      v56 = (void *)v57;
    }
    [(CHFriendListTableViewCell *)self ch_transformViewsForRightToLeftLanguages:v56];
  }
}

+ (double)preferredHeight
{
  return 100.0;
}

+ (double)measuredHeightWithDisplayMode:(int64_t)a3 formattingManager:(id)a4
{
  uint64_t v5 = qword_10096B438;
  id v6 = a4;
  if (v5 != -1) {
    dispatch_once(&qword_10096B438, &stru_1008ABC80);
  }
  [(id)qword_10096B430 setDisplayMode:a3];
  [(id)qword_10096B430 setFriend:0 snapshot:0 formattingManager:v6 animated:0];

  [(id)qword_10096B430 layoutIfNeeded];
  double v7 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v7 _scaledValueForValue:21.0];
  double v9 = v8;
  [(id)qword_10096B430 _lastBaseline];
  double v11 = v9 + v10;

  return v11;
}

- (void)setFriend:(id)a3 snapshot:(id)a4 formattingManager:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v60 = a3;
  id v10 = a4;
  id v11 = a5;
  double v12 = +[ASDisplayContext displayContextWithName:kASDisplayContextCompanion];
  double v13 = [v12 nameFont];
  double v14 = [(CHFriendListTableViewCell *)self textLabel];
  [v14 setFont:v13];

  double v15 = [(CHFriendListTableViewCell *)self textLabel];
  double v16 = [v15 font];
  double v17 = [v12 keyColorForDisplayMode:[self displayMode]];
  double v18 = [v60 as_friendListNameStringWithDotPrefix:v16 keyColor:v17];
  v19 = [(CHFriendListTableViewCell *)self textLabel];
  [v19 setAttributedText:v18];

  if ([v10 hasCarriedForwardGoals])
  {
    v20 = 0;
  }
  else
  {
    v20 = [v10 activitySummary];
  }
  [(ARUIRingsView *)self->_ringsView hk_configureWithActivitySummary:v20 animated:v6];
  if ([v10 hasCarriedForwardGoals])
  {
    double v21 = [v10 activitySummary];
    id v22 = [v21 _isStandalonePhoneSummary];

    double v23 = [(ARUIRingsView *)self->_ringsView ringGroup];
    [v23 setIsStandalonePhoneFitnessMode:v22 animated:v6];
  }
  competitionBadgeView = self->_competitionBadgeView;
  if (competitionBadgeView)
  {
    [(UIImageView *)competitionBadgeView removeFromSuperview];
    double v25 = self->_competitionBadgeView;
    self->_competitionBadgeView = 0;
  }
  if ([v60 isAwaitingCompetitionResponseFromMe])
  {
    id v26 = objc_alloc((Class)UIImageView);
    double v27 = ActivitySharingBundle();
    CGFloat v28 = +[UIImage imageNamed:@"InvitationPendingBadge" inBundle:v27];
    double v29 = (UIImageView *)[v26 initWithImage:v28];
    double v30 = self->_competitionBadgeView;
    self->_competitionBadgeView = v29;

    [(CHFriendListTableViewCell *)self addSubview:self->_competitionBadgeView];
  }
  if (!v20) {
    v20 = objc_opt_new();
  }
  int64_t v31 = [(CHFriendListTableViewCell *)self displayMode];
  double v32 = v60;
  switch(v31)
  {
    case 0:
    case 1:
      double v33 = [v20 as_movePercentStringWithContext:v12 snapshot:v10];
      [(UILabel *)self->_detailLineOneLabel setAttributedText:v33];

      uint64_t v34 = [v20 as_moveProgressStringWithContext:v12 formattingManager:v11 snapshot:v10];
      goto LABEL_16;
    case 2:
      v35 = [v20 as_exerciseProgressStringWithContext:v12];
      [(UILabel *)self->_detailLineOneLabel setAttributedText:v35];

      uint64_t v34 = [v20 as_exerciseDurationStringWithContext:v12];
      goto LABEL_16;
    case 3:
      double v36 = [v20 as_stepsStringWithContext:v12];
      [(UILabel *)self->_detailLineOneLabel setAttributedText:v36];

      uint64_t v34 = [v20 as_distanceStringWithContext:v12 formattingManager:v11];
LABEL_16:
      double v37 = (void *)v34;
      [(UILabel *)self->_detailLineTwoLabel setAttributedText:v34];

      v38 = [(CHFriendListTableViewCell *)self contentView];
      v39 = v38;
      detailLineTwoLabel = self->_detailLineTwoLabel;
      goto LABEL_17;
    case 4:
      v52 = [v60 friendWorkouts];
      v53 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v10 snapshotIndex]);
      v54 = [v52 objectForKeyedSubscript:v53];
      v55 = ASWorkoutNameString();
      [(UILabel *)self->_detailLineOneLabel setAttributedText:v55];

      v56 = [v60 friendWorkouts];
      uint64_t v57 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v10 snapshotIndex]);
      v58 = [v56 objectForKeyedSubscript:v57];
      double v59 = ASWorkoutCaloriesString();
      [(UILabel *)self->_detailLineTwoLabel setAttributedText:v59];

      v38 = [(CHFriendListTableViewCell *)self contentView];
      v39 = v38;
      detailLineTwoLabel = self->_detailLineTwoLabel;
LABEL_17:
      [v38 addSubview:detailLineTwoLabel];

      goto LABEL_18;
    case 5:
      v51 = [v20 as_pushesStringWithContext:v12];
      [(UILabel *)self->_detailLineOneLabel setAttributedText:v51];

      [(UILabel *)self->_detailLineTwoLabel removeFromSuperview];
LABEL_18:
      double v32 = v60;
      break;
    default:
      break;
  }
  if (v32)
  {
    if ([v32 isMe])
    {
      double v41 = @"me";
    }
    else
    {
      double v42 = [v60 UUID];
      double v41 = [v42 UUIDString];
    }
    double v43 = [v10 startDate];
    CGFloat v44 = v43;
    if (v43)
    {
      id v45 = v43;
    }
    else
    {
      id v45 = +[NSDate date];
    }
    v46 = v45;

    v47 = +[NSCalendar currentCalendar];
    v48 = +[NSDate date];
    double v49 = [v47 components:16 fromDate:v46 toDate:v48 options:0];

    v50 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"friend_row_%ld_%@", [v49 day], v41);
    [(CHFriendListTableViewCell *)self setAccessibilityIdentifier:v50];
  }
  [(CHFriendListTableViewCell *)self setNeedsLayout];
}

- (double)_lastBaseline
{
  p_detailLineTwoLabel = &self->_detailLineTwoLabel;
  double v4 = [(UILabel *)self->_detailLineTwoLabel superview];

  if (!v4) {
    p_detailLineTwoLabel = &self->_detailLineOneLabel;
  }
  uint64_t v5 = *p_detailLineTwoLabel;

  [(UILabel *)v5 _lastLineBaselineFrameOriginY];
  return result;
}

- (int64_t)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(int64_t)a3
{
  self->_unint64_t displayMode = a3;
}

- (ARUIRingsView)ringsView
{
  return self->_ringsView;
}

- (void)setRingsView:(id)a3
{
}

- (UILabel)detailLineOneLabel
{
  return self->_detailLineOneLabel;
}

- (void)setDetailLineOneLabel:(id)a3
{
}

- (UILabel)detailLineTwoLabel
{
  return self->_detailLineTwoLabel;
}

- (void)setDetailLineTwoLabel:(id)a3
{
}

- (UIImageView)competitionBadgeView
{
  return self->_competitionBadgeView;
}

- (void)setCompetitionBadgeView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_competitionBadgeView, 0);
  objc_storeStrong((id *)&self->_detailLineTwoLabel, 0);
  objc_storeStrong((id *)&self->_detailLineOneLabel, 0);

  objc_storeStrong((id *)&self->_ringsView, 0);
}

@end