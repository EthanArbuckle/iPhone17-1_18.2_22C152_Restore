@interface CHFriendDetailCompetitionTotalWinsCell
- (CHFriendDetailCompetitionTotalWinsCell)initWithFrame:(CGRect)a3;
- (double)preferredHeightForFriend:(id)a3;
- (void)_updateConfigurationForStandalone:(BOOL)a3;
- (void)layoutSubviews;
- (void)setFriend:(id)a3 competition:(id)a4;
@end

@implementation CHFriendDetailCompetitionTotalWinsCell

- (CHFriendDetailCompetitionTotalWinsCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CHFriendDetailCompetitionTotalWinsCell;
  v3 = -[CHFriendDetailCompetitionTotalWinsCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CHFriendDetailCompetitionTotalWinsCell *)v3 _updateConfigurationForStandalone:0];
  }
  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CHFriendDetailCompetitionTotalWinsCell;
  [(CHFriendDetailCompetitionTotalWinsCell *)&v3 layoutSubviews];
  [(CHFriendDetailCompetitionTotalWinsCell *)self bounds];
  -[ASCompetitionScoreView setFrame:](self->_scoreView, "setFrame:");
}

- (void)setFriend:(id)a3 competition:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (self->_standalone != ([v7 isCompetitionActive] ^ 1)) {
    -[CHFriendDetailCompetitionTotalWinsCell _updateConfigurationForStandalone:](self, "_updateConfigurationForStandalone:");
  }
  [(ASCompetitionScoreView *)self->_scoreView setFriend:v7 competition:v6];
}

- (double)preferredHeightForFriend:(id)a3
{
  +[ASCompetitionScoreView preferredHeightForConfiguration:self->_configuration friend:a3];
  return result;
}

- (void)_updateConfigurationForStandalone:(BOOL)a3
{
  BOOL v3 = a3;
  self->_standalone = a3;
  [(ASCompetitionScoreView *)self->_scoreView removeFromSuperview];
  if (v3) {
    +[ASCompetitionScoreViewConfiguration companionTotalWinsStandaloneFriendDetailConfiguration];
  }
  else {
  v5 = +[ASCompetitionScoreViewConfiguration companionTotalWinsFriendDetailConfiguration];
  }
  configuration = self->_configuration;
  self->_configuration = v5;

  id v7 = (ASCompetitionScoreView *)[objc_alloc((Class)ASCompetitionScoreView) initWithConfiguration:self->_configuration];
  scoreView = self->_scoreView;
  self->_scoreView = v7;

  v9 = self->_scoreView;

  [(CHFriendDetailCompetitionTotalWinsCell *)self addSubview:v9];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_friend, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_scoreView, 0);
}

@end