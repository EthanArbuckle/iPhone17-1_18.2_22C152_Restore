@interface PLProcessExitAggregatorHistogram
- (id)description;
- (int)duration_0_5;
- (int)duration_10_60;
- (int)duration_5_10;
- (int)duration_60_above;
- (int)duration_unknown;
- (int)total;
- (void)setDuration_0_5:(int)a3;
- (void)setDuration_10_60:(int)a3;
- (void)setDuration_5_10:(int)a3;
- (void)setDuration_60_above:(int)a3;
- (void)setDuration_unknown:(int)a3;
- (void)setTotal:(int)a3;
@end

@implementation PLProcessExitAggregatorHistogram

- (id)description
{
  return (id)[NSString stringWithFormat:@"total=%d, duration_less_than_5s=%d, duration_5s_to_less_than_10s=%d, duration_10s_to_less_than_60s=%d, duration_60s_or_more=%d, duration_unknown=%d", -[PLProcessExitAggregatorHistogram total](self, "total"), -[PLProcessExitAggregatorHistogram duration_0](self, "duration_0"), -[PLProcessExitAggregatorHistogram duration_5](self, "duration_5"), -[PLProcessExitAggregatorHistogram duration_10](self, "duration_10"), -[PLProcessExitAggregatorHistogram duration_60_above](self, "duration_60_above"), -[PLProcessExitAggregatorHistogram duration_unknown](self, "duration_unknown")];
}

- (int)total
{
  return self->_total;
}

- (void)setTotal:(int)a3
{
  self->_total = a3;
}

- (int)duration_0_5
{
  return self->_duration_0_5;
}

- (void)setDuration_0_5:(int)a3
{
  self->_duration_0_5 = a3;
}

- (int)duration_5_10
{
  return self->_duration_5_10;
}

- (void)setDuration_5_10:(int)a3
{
  self->_duration_5_10 = a3;
}

- (int)duration_10_60
{
  return self->_duration_10_60;
}

- (void)setDuration_10_60:(int)a3
{
  self->_duration_10_60 = a3;
}

- (int)duration_60_above
{
  return self->_duration_60_above;
}

- (void)setDuration_60_above:(int)a3
{
  self->_duration_60_above = a3;
}

- (int)duration_unknown
{
  return self->_duration_unknown;
}

- (void)setDuration_unknown:(int)a3
{
  self->_duration_unknown = a3;
}

@end