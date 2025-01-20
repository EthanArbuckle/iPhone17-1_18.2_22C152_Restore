@interface CMPedometerEntry
- (CLExtendedStepCountEntry)pedEntry;
- (CMPedometerEntry)initWithStepEntry:(CLExtendedStepCountEntry *)a3;
- (double)deltaActiveTime;
- (double)deltaDist;
- (double)pedometerArmConstrainedState;
- (double)speedCurrent;
- (double)speedInstant;
- (double)stepCadenceCurrent;
- (id)date;
- (id)firstStepTime;
- (id)lastStepTime;
- (unsigned)deltaSteps;
@end

@implementation CMPedometerEntry

- (CMPedometerEntry)initWithStepEntry:(CLExtendedStepCountEntry *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CMPedometerEntry;
  v4 = [(CMPedometerEntry *)&v7 init];
  v5 = v4;
  if (v4) {
    memcpy(&v4->pedEntry, a3, sizeof(v4->pedEntry));
  }
  return v5;
}

- (id)date
{
  return +[NSDate dateWithTimeIntervalSinceReferenceDate:self->pedEntry.base.startTime];
}

- (id)firstStepTime
{
  return +[NSDate dateWithTimeIntervalSinceReferenceDate:self->pedEntry.addition.firstStepTime];
}

- (id)lastStepTime
{
  return +[NSDate dateWithTimeIntervalSinceReferenceDate:self->pedEntry.addition.lastStepTime];
}

- (double)deltaActiveTime
{
  return self->pedEntry.addition.incrementalActiveTime;
}

- (unsigned)deltaSteps
{
  return self->pedEntry.addition.incrementalSteps;
}

- (double)deltaDist
{
  return self->pedEntry.base.rawDistance;
}

- (double)speedInstant
{
  double incrementalActiveTime = self->pedEntry.addition.incrementalActiveTime;
  double result = 0.0;
  if (incrementalActiveTime > 0.01) {
    return self->pedEntry.base.rawDistance / incrementalActiveTime;
  }
  return result;
}

- (double)speedCurrent
{
  double rawPace = self->pedEntry.addition.rawPace;
  double v3 = 1.0 / rawPace;
  BOOL v4 = rawPace <= 0.01;
  double result = 0.0;
  if (!v4) {
    return v3;
  }
  return result;
}

- (double)stepCadenceCurrent
{
  return self->pedEntry.base.currentCadence;
}

- (double)pedometerArmConstrainedState
{
  LOBYTE(v2) = self->pedEntry.base.pedometerArmConstrainedState;
  return (double)v2;
}

- (CLExtendedStepCountEntry)pedEntry
{
  return (CLExtendedStepCountEntry *)memcpy(retstr, &self->pedEntry, sizeof(CLExtendedStepCountEntry));
}

@end