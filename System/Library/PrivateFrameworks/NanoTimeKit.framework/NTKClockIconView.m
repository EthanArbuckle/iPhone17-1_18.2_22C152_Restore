@interface NTKClockIconView
- (BOOL)paused;
- (double)fullDiameter;
- (id)borrowCircleView;
- (id)borrowTimeView;
- (void)setFullDiameter:(double)a3;
- (void)setPaused:(BOOL)a3;
@end

@implementation NTKClockIconView

- (id)borrowCircleView
{
  return 0;
}

- (id)borrowTimeView
{
  return 0;
}

- (double)fullDiameter
{
  return self->_fullDiameter;
}

- (void)setFullDiameter:(double)a3
{
  self->_fullDiameter = a3;
}

- (BOOL)paused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

@end