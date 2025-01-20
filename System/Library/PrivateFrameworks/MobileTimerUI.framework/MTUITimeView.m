@interface MTUITimeView
- (double)time;
- (void)handleLocaleChange;
- (void)setTime:(double)a3;
@end

@implementation MTUITimeView

- (void)setTime:(double)a3
{
  self->_time = a3;
  FormatTime();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(MTUITimeView *)self setText:v4];
}

- (void)handleLocaleChange
{
  ResetTimeFormatter();
  FormatTime();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(MTUITimeView *)self setText:v3];
}

- (double)time
{
  return self->_time;
}

@end