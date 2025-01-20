@interface CHFriendListCompetitionTableViewCell
+ (double)preferredHeightForConfiguration:(id)a3 friend:(id)a4;
- (CHFriendListCompetitionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (double)_sectionWidth;
- (void)layoutSubviews;
- (void)setFriend:(id)a3;
@end

@implementation CHFriendListCompetitionTableViewCell

- (CHFriendListCompetitionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v26.receiver = self;
  v26.super_class = (Class)CHFriendListCompetitionTableViewCell;
  v4 = [(CHFriendListCompetitionTableViewCell *)&v26 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = +[UIColor systemBackgroundColor];
    [(CHFriendListCompetitionTableViewCell *)v4 setBackgroundColor:v5];

    v6 = sub_10005DB50();
    v7 = [(CHFriendListCompetitionTableViewCell *)v4 contentView];
    [v7 setBackgroundColor:v6];

    v8 = [(CHFriendListCompetitionTableViewCell *)v4 contentView];
    v9 = [v8 layer];
    [v9 setCornerRadius:12.0];

    uint64_t v10 = +[ASCompetitionScoreViewConfiguration companionFriendListConfiguration];
    configuration = v4->_configuration;
    v4->_configuration = (ASCompetitionScoreViewConfiguration *)v10;

    [(ASCompetitionScoreViewConfiguration *)v4->_configuration setSideMargin:16.0];
    [(ASCompetitionScoreViewConfiguration *)v4->_configuration setMinimumMiddleMargin:0.0];
    v12 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    [(ASCompetitionScoreViewConfiguration *)v4->_configuration setNameFont:v12];

    v13 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
    [(ASCompetitionScoreViewConfiguration *)v4->_configuration setPrimaryScoreFont:v13];

    v14 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
    [(ASCompetitionScoreViewConfiguration *)v4->_configuration setPrimaryScoreUnitFont:v14];

    v15 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
    [(ASCompetitionScoreViewConfiguration *)v4->_configuration setSecondaryScoreFont:v15];

    [(CHFriendListCompetitionTableViewCell *)v4 _sectionWidth];
    [(ASCompetitionScoreViewConfiguration *)v4->_configuration setOpponentScoreViewWidth:v16 + 10.0];
    v17 = (ASCompetitionScoreView *)[objc_alloc((Class)ASCompetitionScoreView) initWithConfiguration:v4->_configuration];
    scoreView = v4->_scoreView;
    v4->_scoreView = v17;

    v19 = [(CHFriendListCompetitionTableViewCell *)v4 contentView];
    [v19 addSubview:v4->_scoreView];

    v20 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    daysRemainingLabel = v4->_daysRemainingLabel;
    v4->_daysRemainingLabel = v20;

    v22 = +[UIColor as_lightCompetitionGold];
    [(UILabel *)v4->_daysRemainingLabel setTextColor:v22];

    v23 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
    [(UILabel *)v4->_daysRemainingLabel setFont:v23];

    [(UILabel *)v4->_daysRemainingLabel setNumberOfLines:0];
    [(UILabel *)v4->_daysRemainingLabel setLineBreakMode:0];
    [(UILabel *)v4->_daysRemainingLabel setTextAlignment:2];
    v24 = [(CHFriendListCompetitionTableViewCell *)v4 contentView];
    [v24 addSubview:v4->_daysRemainingLabel];
  }
  return v4;
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)CHFriendListCompetitionTableViewCell;
  [(CHFriendListCompetitionTableViewCell *)&v27 layoutSubviews];
  double v3 = sub_1001784A0();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  uint64_t v10 = [(CHFriendListCompetitionTableViewCell *)self contentView];
  [v10 frame];
  double v12 = v5 + v11;
  double v14 = v3 + v13;
  double v16 = v15 - (v5 + v9);
  double v18 = v17 - (v3 + v7);
  v19 = [(CHFriendListCompetitionTableViewCell *)self contentView];
  [v19 setFrame:v12, v14, v16, v18];

  v20 = [(CHFriendListCompetitionTableViewCell *)self contentView];
  [v20 bounds];
  double Width = CGRectGetWidth(v29);

  v22 = [(CHFriendListCompetitionTableViewCell *)self contentView];
  [v22 bounds];
  double Height = CGRectGetHeight(v30);

  -[ASCompetitionScoreView setFrame:](self->_scoreView, "setFrame:", 0.0, 0.0, Width, Height);
  [(CHFriendListCompetitionTableViewCell *)self _sectionWidth];
  -[UILabel sizeThatFits:](self->_daysRemainingLabel, "sizeThatFits:");
  -[UILabel setFrame:](self->_daysRemainingLabel, "setFrame:", Width + -16.0 - v24, (Height - v25) * 0.5, v24, v25);
  if ((id)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:0] == (id)1)
  {
    daysRemainingLabel = self->_daysRemainingLabel;
    objc_super v26 = +[NSArray arrayWithObjects:&daysRemainingLabel count:1];
    [(CHFriendListCompetitionTableViewCell *)self ch_transformViewsForRightToLeftLanguages:v26];
  }
}

- (double)_sectionWidth
{
  v2 = +[UIScreen mainScreen];
  [v2 bounds];
  double v4 = v3;

  sub_1001784A0();
  return (v4 - v5 + -32.0 - v6) / 3.0;
}

- (void)setFriend:(id)a3
{
  scoreView = self->_scoreView;
  id v5 = a3;
  double v6 = [v5 currentCompetition];
  [(ASCompetitionScoreView *)scoreView setFriend:v5 competition:v6];

  double v7 = [v5 as_competitionStageString];
  [(UILabel *)self->_daysRemainingLabel setText:v7];

  id v10 = [v5 UUID];

  double v8 = [v10 UUIDString];
  double v9 = +[NSString stringWithFormat:@"friend_competition_row_%@", v8];
  [(CHFriendListCompetitionTableViewCell *)self setAccessibilityIdentifier:v9];
}

+ (double)preferredHeightForConfiguration:(id)a3 friend:(id)a4
{
  +[ASCompetitionScoreView preferredHeightForConfiguration:a3 friend:a4];
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daysRemainingLabel, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_scoreView, 0);
}

@end