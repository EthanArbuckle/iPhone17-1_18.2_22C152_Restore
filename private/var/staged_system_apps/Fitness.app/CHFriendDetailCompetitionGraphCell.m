@interface CHFriendDetailCompetitionGraphCell
- (CHFriendDetailCompetitionGraphCell)initWithFrame:(CGRect)a3;
- (double)preferredHeight;
- (void)layoutSubviews;
- (void)setCompetition:(id)a3;
@end

@implementation CHFriendDetailCompetitionGraphCell

- (CHFriendDetailCompetitionGraphCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CHFriendDetailCompetitionGraphCell;
  v3 = -[CHFriendDetailCompetitionGraphCell initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[ASCompetitionGraphView companionGraph];
    graphView = v3->_graphView;
    v3->_graphView = (ASCompetitionGraphView *)v4;

    [(CHFriendDetailCompetitionGraphCell *)v3 addSubview:v3->_graphView];
  }
  return v3;
}

- (void)layoutSubviews
{
  [(CHFriendDetailCompetitionGraphCell *)self bounds];
  double Width = CGRectGetWidth(v7);
  [(ASCompetitionGraphView *)self->_graphView preferredHeight];
  -[ASCompetitionGraphView setFrame:](self->_graphView, "setFrame:", 0.0, 0.0, Width, v4);
  graphView = self->_graphView;

  [(ASCompetitionGraphView *)graphView setNeedsLayout];
}

- (void)setCompetition:(id)a3
{
  [(ASCompetitionGraphView *)self->_graphView setCompetition:a3];

  [(CHFriendDetailCompetitionGraphCell *)self setNeedsLayout];
}

- (double)preferredHeight
{
  [(ASCompetitionGraphView *)self->_graphView preferredHeight];
  return result;
}

- (void).cxx_destruct
{
}

@end