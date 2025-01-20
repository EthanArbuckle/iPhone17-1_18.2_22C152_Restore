@interface CHFriendDetailCompetitionScoreCell
- (CHFriendDetailCompetitionScoreCell)initWithFrame:(CGRect)a3;
- (double)preferredHeightForFriend:(id)a3;
- (void)layoutSubviews;
- (void)setFriend:(id)a3 competition:(id)a4;
@end

@implementation CHFriendDetailCompetitionScoreCell

- (CHFriendDetailCompetitionScoreCell)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CHFriendDetailCompetitionScoreCell;
  v3 = -[CHFriendDetailCompetitionScoreCell initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[ASCompetitionScoreViewConfiguration companionTotalScoreFriendDetailConfiguration];
    configuration = v3->_configuration;
    v3->_configuration = (ASCompetitionScoreViewConfiguration *)v4;

    v6 = (ASCompetitionScoreView *)[objc_alloc((Class)ASCompetitionScoreView) initWithConfiguration:v3->_configuration];
    scoreView = v3->_scoreView;
    v3->_scoreView = v6;

    [(CHFriendDetailCompetitionScoreCell *)v3 addSubview:v3->_scoreView];
  }
  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CHFriendDetailCompetitionScoreCell;
  [(CHFriendDetailCompetitionScoreCell *)&v3 layoutSubviews];
  [(CHFriendDetailCompetitionScoreCell *)self bounds];
  -[ASCompetitionScoreView setFrame:](self->_scoreView, "setFrame:");
}

- (void)setFriend:(id)a3 competition:(id)a4
{
}

- (double)preferredHeightForFriend:(id)a3
{
  +[ASCompetitionScoreView preferredHeightForConfiguration:self->_configuration friend:a3];
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_friend, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_scoreView, 0);
}

@end