@interface RTStateTransitionOnePredEl
- (NSDate)primaryStopDate;
- (RTStateTransitionOnePredEl)init;
- (double)density;
- (double)earliestTransTimeStart_s;
- (double)latestTransTimeStart_s;
- (double)predResidualStart_s;
- (double)predResidualStop_s;
- (double)resUncStart_s;
- (double)resUncStop_s;
- (double)yield;
- (int)numOfTrans;
- (unint64_t)motionActivityType;
- (void)setDensity:(double)a3;
- (void)setEarliestTransTimeStart_s:(double)a3;
- (void)setLatestTransTimeStart_s:(double)a3;
- (void)setMotionActivityType:(unint64_t)a3;
- (void)setNumOfTrans:(int)a3;
- (void)setPredResidualStart_s:(double)a3;
- (void)setPredResidualStop_s:(double)a3;
- (void)setPrimaryStopDate:(id)a3;
- (void)setResUncStart_s:(double)a3;
- (void)setResUncStop_s:(double)a3;
- (void)setYield:(double)a3;
@end

@implementation RTStateTransitionOnePredEl

- (RTStateTransitionOnePredEl)init
{
  v5.receiver = self;
  v5.super_class = (Class)RTStateTransitionOnePredEl;
  v2 = [(RTStateTransitionOnePredEl *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(RTStateTransitionOnePredEl *)v2 setNumOfTrans:0];
    [(RTStateTransitionOnePredEl *)v3 setYield:0.0];
    [(RTStateTransitionOnePredEl *)v3 setPredResidualStart_s:0.0];
    [(RTStateTransitionOnePredEl *)v3 setResUncStart_s:-1.0];
    [(RTStateTransitionOnePredEl *)v3 setPredResidualStop_s:0.0];
    [(RTStateTransitionOnePredEl *)v3 setResUncStop_s:-1.0];
    [(RTStateTransitionOnePredEl *)v3 setEarliestTransTimeStart_s:1.0e12];
    [(RTStateTransitionOnePredEl *)v3 setLatestTransTimeStart_s:-1.0e12];
    [(RTStateTransitionOnePredEl *)v3 setDensity:0.0];
    [(RTStateTransitionOnePredEl *)v3 setMotionActivityType:0];
  }
  return v3;
}

- (int)numOfTrans
{
  return self->_numOfTrans;
}

- (void)setNumOfTrans:(int)a3
{
  self->_numOfTrans = a3;
}

- (double)yield
{
  return self->_yield;
}

- (void)setYield:(double)a3
{
  self->_yield = a3;
}

- (double)predResidualStart_s
{
  return self->_predResidualStart_s;
}

- (void)setPredResidualStart_s:(double)a3
{
  self->_predResidualStart_s = a3;
}

- (double)resUncStart_s
{
  return self->_resUncStart_s;
}

- (void)setResUncStart_s:(double)a3
{
  self->_resUncStart_s = a3;
}

- (double)predResidualStop_s
{
  return self->_predResidualStop_s;
}

- (void)setPredResidualStop_s:(double)a3
{
  self->_predResidualStop_s = a3;
}

- (double)resUncStop_s
{
  return self->_resUncStop_s;
}

- (void)setResUncStop_s:(double)a3
{
  self->_resUncStop_s = a3;
}

- (NSDate)primaryStopDate
{
  return self->_primaryStopDate;
}

- (void)setPrimaryStopDate:(id)a3
{
}

- (double)latestTransTimeStart_s
{
  return self->_latestTransTimeStart_s;
}

- (void)setLatestTransTimeStart_s:(double)a3
{
  self->_latestTransTimeStart_s = a3;
}

- (double)earliestTransTimeStart_s
{
  return self->_earliestTransTimeStart_s;
}

- (void)setEarliestTransTimeStart_s:(double)a3
{
  self->_earliestTransTimeStart_s = a3;
}

- (double)density
{
  return self->_density;
}

- (void)setDensity:(double)a3
{
  self->_density = a3;
}

- (unint64_t)motionActivityType
{
  return self->_motionActivityType;
}

- (void)setMotionActivityType:(unint64_t)a3
{
  self->_motionActivityType = a3;
}

- (void).cxx_destruct
{
}

@end