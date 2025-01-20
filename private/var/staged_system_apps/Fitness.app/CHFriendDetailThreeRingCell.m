@interface CHFriendDetailThreeRingCell
- (CHFriendDetailThreeRingCell)initWithFrame:(CGRect)a3;
- (double)preferredHeight;
- (double)preferredWidth;
- (void)_setupCell;
- (void)layoutSubviews;
- (void)setActivitySummary:(id)a3 animated:(BOOL)a4;
- (void)setHidden:(BOOL)a3;
- (void)setIsStandalonePhoneFitnessMode:(BOOL)a3;
@end

@implementation CHFriendDetailThreeRingCell

- (void)_setupCell
{
  id v3 = objc_alloc((Class)ARUIRingsView);
  v4 = +[ARUIRingGroup activityRingGroupForRingType:3];
  v5 = [v4 forCompanion];
  v6 = (ARUIRingsView *)[v3 initWithRingGroup:v5];
  ringsView = self->_ringsView;
  self->_ringsView = v6;

  v8 = [(ARUIRingsView *)self->_ringsView ringGroup];
  [v8 setGroupDiameter:5.62950094e14];

  v9 = [(ARUIRingsView *)self->_ringsView ringGroup];
  LODWORD(v10) = 13.0;
  [v9 setThickness:v10];

  v11 = [(ARUIRingsView *)self->_ringsView ringGroup];
  LODWORD(v12) = 1071225242;
  [v11 setInterspacing:v12];

  v13 = +[UIColor clearColor];
  [(ARUIRingsView *)self->_ringsView setBackgroundColor:v13];

  v14 = self->_ringsView;

  [(CHFriendDetailThreeRingCell *)self addSubview:v14];
}

- (CHFriendDetailThreeRingCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CHFriendDetailThreeRingCell;
  id v3 = -[CHFriendDetailThreeRingCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CHFriendDetailThreeRingCell *)v3 _setupCell];
  }
  return v4;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)CHFriendDetailThreeRingCell;
  [(CHFriendDetailThreeRingCell *)&v5 layoutSubviews];
  if (self->_isFriendHidingDataFromMe) {
    double v3 = 48.0;
  }
  else {
    double v3 = 128.0;
  }
  -[ARUIRingsView setFrame:](self->_ringsView, "setFrame:", 17.0, 21.0, v3, v3);
  if ((id)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:0] == (id)1)
  {
    ringsView = self->_ringsView;
    v4 = +[NSArray arrayWithObjects:&ringsView count:1];
    [(CHFriendDetailThreeRingCell *)self ch_transformViewsForRightToLeftLanguages:v4];
  }
}

- (double)preferredHeight
{
  return dbl_10074E3C0[!self->_isFriendHidingDataFromMe];
}

- (double)preferredWidth
{
  return dbl_10074E3D0[!self->_isFriendHidingDataFromMe];
}

- (void)setActivitySummary:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  self->_isFriendHidingDataFromMe = 0;
  objc_storeStrong((id *)&self->_activitySummary, a3);
  id v7 = a3;
  [(ARUIRingsView *)self->_ringsView hk_configureWithActivitySummary:v7 animated:v4];
}

- (void)setHidden:(BOOL)a3
{
  self->_isFriendHidingDataFromMe = a3;
  if (a3)
  {
    activitySummary = self->_activitySummary;
    self->_activitySummary = 0;

    ringsView = self->_ringsView;
    [(ARUIRingsView *)ringsView hk_configureWithActivitySummary:0 animated:0];
  }
}

- (void)setIsStandalonePhoneFitnessMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ARUIRingsView *)self->_ringsView ringGroup];
  [v4 setIsStandalonePhoneFitnessMode:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activitySummary, 0);

  objc_storeStrong((id *)&self->_ringsView, 0);
}

@end