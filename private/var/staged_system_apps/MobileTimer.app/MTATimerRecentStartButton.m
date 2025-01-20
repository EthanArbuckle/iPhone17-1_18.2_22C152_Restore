@interface MTATimerRecentStartButton
- (MTATimerRecentStartButton)initWithFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation MTATimerRecentStartButton

- (MTATimerRecentStartButton)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTATimerRecentStartButton;
  v3 = -[MTATimerRecentStartButton initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor mtui_startResumeButtonTintColor];
    [(MTATimerRecentStartButton *)v3 setBackgroundColor:v4];

    v5 = +[UIColor mtui_startResumeButtonTextColor];
    [(MTATimerRecentStartButton *)v3 setTitleColor:v5 forState:0];
  }
  return v3;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MTATimerRecentStartButton;
  -[MTATimerRecentStartButton setHighlighted:](&v6, "setHighlighted:");
  if (v3) {
    +[UIColor mtui_disabledStartButtonTintColor];
  }
  else {
  v5 = +[UIColor mtui_startResumeButtonTintColor];
  }
  [(MTATimerRecentStartButton *)self setBackgroundColor:v5];
}

@end