@interface MTATimerRecentCollectionViewCell
- (unint64_t)defaultViewStyle;
- (void)deleteRecent:(id)a3;
- (void)startTimer:(id)a3;
- (void)updateWithDuration:(id)a3;
@end

@implementation MTATimerRecentCollectionViewCell

- (void)updateWithDuration:(id)a3
{
  id v10 = a3;
  v4 = [(MTATimerBaseCollectionViewCell *)self timerControlsView];
  [v10 duration];
  double v6 = v5;
  v7 = [v10 title];
  if (v7)
  {
    [v4 setDurationTime:v7 title:v6];
  }
  else
  {
    [v10 duration];
    v8 = +[MTAUtilities durationStringFromInterval:](MTAUtilities, "durationStringFromInterval:");
    [v4 setDurationTime:v8 title:v6];
  }
  v9 = [(MTATimerBaseCollectionViewCell *)self timerControlsView];
  [v9 setState:0];
}

- (unint64_t)defaultViewStyle
{
  return 7;
}

- (void)startTimer:(id)a3
{
  id v4 = [(MTATimerBaseCollectionViewCell *)self delegate];
  [v4 startRecentTimerForCell:self];
}

- (void)deleteRecent:(id)a3
{
  id v4 = [(MTATimerBaseCollectionViewCell *)self delegate];
  [v4 deleteRecentTimerForCell:self];
}

@end