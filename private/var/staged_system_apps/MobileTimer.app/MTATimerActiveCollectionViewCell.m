@interface MTATimerActiveCollectionViewCell
- (BOOL)_disableRasterizeInAnimations;
- (MTATimerActiveCollectionViewCell)initWithFrame:(CGRect)a3;
- (MTTimer)timer;
- (NSArray)constraints;
- (UIButton)deleteButton;
- (id)titleForTimer:(id)a3;
- (void)cancelTimer:(id)a3;
- (void)didSelectPresetWithDuration:(double)a3;
- (void)pauseResumeTimer:(id)a3;
- (void)refreshUI:(id)a3 animated:(BOOL)a4;
- (void)setConstraints:(id)a3;
- (void)setDeleteButton:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTimer:(id)a3;
- (void)startTimer:(id)a3;
@end

@implementation MTATimerActiveCollectionViewCell

- (MTATimerActiveCollectionViewCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MTATimerActiveCollectionViewCell;
  v3 = -[MTATimerBaseCollectionViewCell initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(MTATimerBaseCollectionViewCell *)v3 timerControlsView];
    v6 = +[UIColor clearColor];
    [v5 applyBackgroundColor:v6];
  }
  return v4;
}

- (void)refreshUI:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  v6 = [(MTATimerBaseCollectionViewCell *)self timerControlsView];
  [v5 remainingTime];
  double v8 = v7;
  [v5 duration];
  double v10 = v9;
  id v11 = [v5 state];
  v12 = [(MTATimerActiveCollectionViewCell *)self titleForTimer:v5];
  [v6 setRemainingTime:v11 duration:v12 state:1 title:v8 forceRefresh:v10];

  v13 = [(MTATimerBaseCollectionViewCell *)self timerControlsView];
  [v5 remainingTime];
  double v15 = v14;

  [v13 setTime:v15];

  [(MTATimerActiveCollectionViewCell *)self setNeedsLayout];
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (id)titleForTimer:(id)a3
{
  id v3 = a3;
  if ([v3 hasDefaultTitle])
  {
    [v3 duration];
    double v5 = v4;

    v6 = +[MTAUtilities durationStringFromInterval:v5];
  }
  else
  {
    v6 = [v3 title];
  }

  return v6;
}

- (void)setHighlighted:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MTATimerActiveCollectionViewCell;
  -[MTATimerActiveCollectionViewCell setHighlighted:](&v9, "setHighlighted:");
  if (a3 || [(MTATimerActiveCollectionViewCell *)self isSelected])
  {
    double v5 = +[UIColor mtui_cellHighlightColor];
    int v6 = 0;
    int v7 = 1;
  }
  else
  {
    double v5 = +[UIColor mtui_foregroundColor];
    int v7 = 0;
    int v6 = 1;
  }
  double v8 = [(MTATimerActiveCollectionViewCell *)self contentView];
  [v8 setBackgroundColor:v5];

  if (v6) {
  if (v7)
  }
}

- (void)setSelected:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MTATimerActiveCollectionViewCell;
  -[MTATimerActiveCollectionViewCell setSelected:](&v9, "setSelected:");
  if (a3 || [(MTATimerActiveCollectionViewCell *)self isHighlighted])
  {
    double v5 = +[UIColor mtui_cellHighlightColor];
    int v6 = 0;
    int v7 = 1;
  }
  else
  {
    double v5 = +[UIColor mtui_foregroundColor];
    int v7 = 0;
    int v6 = 1;
  }
  double v8 = [(MTATimerActiveCollectionViewCell *)self contentView];
  [v8 setBackgroundColor:v5];

  if (v6) {
  if (v7)
  }
}

- (void)startTimer:(id)a3
{
  id v5 = [(MTATimerBaseCollectionViewCell *)self delegate];
  double v4 = [(MTATimerBaseCollectionViewCell *)self timerControlsView];
  [v4 countDownDuration];
  [v5 startTimerForCell:self];
}

- (void)cancelTimer:(id)a3
{
  id v4 = [(MTATimerBaseCollectionViewCell *)self delegate];
  [v4 cancelTimerForCell:self];
}

- (void)pauseResumeTimer:(id)a3
{
  id v4 = [(MTATimerBaseCollectionViewCell *)self delegate];
  [v4 pauseResumeTimerForCell:self];
}

- (void)didSelectPresetWithDuration:(double)a3
{
  id v5 = [(MTATimerBaseCollectionViewCell *)self delegate];
  [v5 startTimerForCell:self withDuration:a3];
}

- (MTTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (UIButton)deleteButton
{
  return self->_deleteButton;
}

- (void)setDeleteButton:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

@end