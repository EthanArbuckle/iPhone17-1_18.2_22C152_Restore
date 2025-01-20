@interface SSGameSessionInterval
- (BOOL)includeTimelines;
- (BOOL)supportsSEM;
- (NSArray)triggeringGameModeIntervals;
- (NSArray)triggeringSEMIntervals;
- (NSDate)earliestDate;
- (NSDate)endDate;
- (NSDate)latestDate;
- (NSDate)startDate;
- (NSString)debugDescription;
- (SSGameSessionInterval)initWithIncludeTimelines:(BOOL)a3 timebaseRatio:(double)a4;
- (double)durationMs;
- (double)endMs;
- (double)endSeconds;
- (double)startMs;
- (double)startSeconds;
- (double)timebaseRatio;
- (float)durationSeconds;
- (id)dictionaryRepresentation;
- (id)jsonDescription:(unint64_t)a3;
- (unint64_t)durationMachContinuousTime;
- (unint64_t)durationNanoseconds;
- (unint64_t)earliestMCT;
- (unint64_t)endMachContinuousTime;
- (unint64_t)endNanoseconds;
- (unint64_t)latestMCT;
- (unint64_t)startMachContinuousTime;
- (unint64_t)startNanoseconds;
- (void)setEarliestDate:(id)a3;
- (void)setEarliestMCT:(unint64_t)a3;
- (void)setEndDate:(id)a3;
- (void)setEndMachContinuousTime:(unint64_t)a3;
- (void)setLatestDate:(id)a3;
- (void)setLatestMCT:(unint64_t)a3;
- (void)setStartDate:(id)a3;
- (void)setStartMachContinuousTime:(unint64_t)a3;
@end

@implementation SSGameSessionInterval

- (double)startSeconds
{
  unint64_t v3 = [(SSGameSessionInterval *)self startMachContinuousTime];
  [(SSGameSessionInterval *)self timebaseRatio];
  return v4 * (double)v3 / 1000000000.0;
}

- (double)endSeconds
{
  unint64_t v3 = [(SSGameSessionInterval *)self endMachContinuousTime];
  [(SSGameSessionInterval *)self timebaseRatio];
  return v4 * (double)v3 / 1000000000.0;
}

- (unint64_t)durationMachContinuousTime
{
  unint64_t v3 = [(SSGameSessionInterval *)self endMachContinuousTime];
  return v3 - [(SSGameSessionInterval *)self startMachContinuousTime];
}

- (float)durationSeconds
{
  [(SSGameSessionInterval *)self endSeconds];
  double v4 = v3;
  [(SSGameSessionInterval *)self startSeconds];
  return v4 - v5;
}

- (unint64_t)startNanoseconds
{
  [(SSGameSessionInterval *)self startSeconds];
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)endNanoseconds
{
  [(SSGameSessionInterval *)self endSeconds];
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)durationNanoseconds
{
  [(SSGameSessionInterval *)self durationSeconds];
  return (unint64_t)(float)(v2 * 1000000000.0);
}

- (double)startMs
{
  [(SSGameSessionInterval *)self startSeconds];
  return v2 * 1000.0;
}

- (double)endMs
{
  [(SSGameSessionInterval *)self endSeconds];
  return v2 * 1000.0;
}

- (double)durationMs
{
  [(SSGameSessionInterval *)self durationSeconds];
  return (float)(v2 * 1000.0);
}

- (SSGameSessionInterval)initWithIncludeTimelines:(BOOL)a3 timebaseRatio:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SSGameSessionInterval;
  result = [(SSGameSessionInterval *)&v7 init];
  if (result)
  {
    result->_includeTimelines = a3;
    result->_timebaseRatio = a4;
  }
  return result;
}

- (id)dictionaryRepresentation
{
  double v3 = _timeIntervalDict(self);
  double v4 = objc_msgSend(NSNumber, "numberWithBool:", -[SSGameSessionInterval supportsSEM](self, "supportsSEM"));
  [v3 setObject:v4 forKeyedSubscript:kSSGameSessionKey_SupportsSEM];

  return v3;
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)[(SSGameSessionInterval *)self jsonDescription:3];
}

- (BOOL)includeTimelines
{
  return self->_includeTimelines;
}

- (BOOL)supportsSEM
{
  return self->_supportsSEM;
}

- (NSArray)triggeringSEMIntervals
{
  return self->_triggeringSEMIntervals;
}

- (NSArray)triggeringGameModeIntervals
{
  return self->_triggeringGameModeIntervals;
}

- (unint64_t)earliestMCT
{
  return self->_earliestMCT;
}

- (void)setEarliestMCT:(unint64_t)a3
{
  self->_earliestMCT = a3;
}

- (unint64_t)latestMCT
{
  return self->_latestMCT;
}

- (void)setLatestMCT:(unint64_t)a3
{
  self->_latestMCT = a3;
}

- (NSDate)earliestDate
{
  return self->_earliestDate;
}

- (void)setEarliestDate:(id)a3
{
}

- (NSDate)latestDate
{
  return self->_latestDate;
}

- (void)setLatestDate:(id)a3
{
}

- (double)timebaseRatio
{
  return self->_timebaseRatio;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (unint64_t)startMachContinuousTime
{
  return self->_startMachContinuousTime;
}

- (void)setStartMachContinuousTime:(unint64_t)a3
{
  self->_startMachContinuousTime = a3;
}

- (unint64_t)endMachContinuousTime
{
  return self->_endMachContinuousTime;
}

- (void)setEndMachContinuousTime:(unint64_t)a3
{
  self->_endMachContinuousTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_latestDate, 0);
  objc_storeStrong((id *)&self->_earliestDate, 0);
  objc_storeStrong((id *)&self->_triggeringGameModeIntervals, 0);

  objc_storeStrong((id *)&self->_triggeringSEMIntervals, 0);
}

@end