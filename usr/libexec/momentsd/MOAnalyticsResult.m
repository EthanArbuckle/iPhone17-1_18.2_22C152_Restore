@interface MOAnalyticsResult
- (BOOL)outlier;
- (NSDate)date;
- (double)actual;
- (double)predict;
- (double)score;
- (void)setActual:(double)a3;
- (void)setDate:(id)a3;
- (void)setOutlier:(BOOL)a3;
- (void)setPredict:(double)a3;
- (void)setScore:(double)a3;
@end

@implementation MOAnalyticsResult

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (double)predict
{
  return self->_predict;
}

- (void)setPredict:(double)a3
{
  self->_predict = a3;
}

- (double)actual
{
  return self->_actual;
}

- (void)setActual:(double)a3
{
  self->_actual = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (BOOL)outlier
{
  return self->_outlier;
}

- (void)setOutlier:(BOOL)a3
{
  self->_outlier = a3;
}

- (void).cxx_destruct
{
}

@end