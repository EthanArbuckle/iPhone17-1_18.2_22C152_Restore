@interface _SSCAMLTimeInterval
- (BOOL)isEqual:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)debugDescription;
- (_SSCAMLTimeInterval)initWithStartMCT:(unint64_t)a3 endMCT:(unint64_t)a4 startDate:(id)a5 endDate:(id)a6 timebaseRatio:(double)a7;
- (double)durationMs;
- (double)endMs;
- (double)endSeconds;
- (double)startMs;
- (double)startSeconds;
- (double)timebaseRatio;
- (float)durationSeconds;
- (id)jsonDescription:(unint64_t)a3;
- (unint64_t)durationMachContinuousTime;
- (unint64_t)durationNanoseconds;
- (unint64_t)endMachContinuousTime;
- (unint64_t)endNanoseconds;
- (unint64_t)startMachContinuousTime;
- (unint64_t)startNanoseconds;
@end

@implementation _SSCAMLTimeInterval

- (double)startSeconds
{
  unint64_t v3 = [(_SSCAMLTimeInterval *)self startMachContinuousTime];
  [(_SSCAMLTimeInterval *)self timebaseRatio];
  return v4 * (double)v3 / 1000000000.0;
}

- (double)endSeconds
{
  unint64_t v3 = [(_SSCAMLTimeInterval *)self endMachContinuousTime];
  [(_SSCAMLTimeInterval *)self timebaseRatio];
  return v4 * (double)v3 / 1000000000.0;
}

- (unint64_t)durationMachContinuousTime
{
  unint64_t v3 = [(_SSCAMLTimeInterval *)self endMachContinuousTime];
  return v3 - [(_SSCAMLTimeInterval *)self startMachContinuousTime];
}

- (float)durationSeconds
{
  [(_SSCAMLTimeInterval *)self endSeconds];
  double v4 = v3;
  [(_SSCAMLTimeInterval *)self startSeconds];
  return v4 - v5;
}

- (unint64_t)startNanoseconds
{
  [(_SSCAMLTimeInterval *)self startSeconds];
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)endNanoseconds
{
  [(_SSCAMLTimeInterval *)self endSeconds];
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)durationNanoseconds
{
  [(_SSCAMLTimeInterval *)self durationSeconds];
  return (unint64_t)(float)(v2 * 1000000000.0);
}

- (double)startMs
{
  [(_SSCAMLTimeInterval *)self startSeconds];
  return v2 * 1000.0;
}

- (double)endMs
{
  [(_SSCAMLTimeInterval *)self endSeconds];
  return v2 * 1000.0;
}

- (double)durationMs
{
  [(_SSCAMLTimeInterval *)self durationSeconds];
  return (float)(v2 * 1000.0);
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)[(_SSCAMLTimeInterval *)self jsonDescription:3];
}

- (_SSCAMLTimeInterval)initWithStartMCT:(unint64_t)a3 endMCT:(unint64_t)a4 startDate:(id)a5 endDate:(id)a6 timebaseRatio:(double)a7
{
  id v13 = a5;
  id v14 = a6;
  v15 = v14;
  if (a3 >= a4 || !v13 && v14 || v13 && !v14) {
    goto LABEL_6;
  }
  if (v13)
  {
    [v13 timeIntervalSince1970];
    double v19 = v18;
    [v15 timeIntervalSince1970];
    v16 = 0;
    if (a7 <= 0.0 || v19 >= v20) {
      goto LABEL_7;
    }
  }
  else if (a7 <= 0.0)
  {
LABEL_6:
    v16 = 0;
    goto LABEL_7;
  }
  v23.receiver = self;
  v23.super_class = (Class)_SSCAMLTimeInterval;
  v21 = [(_SSCAMLTimeInterval *)&v23 init];
  p_isa = (id *)&v21->super.isa;
  if (v21)
  {
    v21->_startMachContinuousTime = a3;
    v21->_endMachContinuousTime = a4;
    v21->_timebaseRatio = a7;
    objc_storeStrong((id *)&v21->_startDate, a5);
    objc_storeStrong(p_isa + 2, a6);
  }
  self = p_isa;
  v16 = self;
LABEL_7:

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (_SSCAMLTimeInterval *)a3;
  if (self == v4)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      unint64_t v6 = [(_SSCAMLTimeInterval *)self startMachContinuousTime];
      if (v6 == [(_SSCAMLTimeInterval *)v5 startMachContinuousTime]
        || (unint64_t v7 = [(_SSCAMLTimeInterval *)self endMachContinuousTime],
            v7 != [(_SSCAMLTimeInterval *)v5 endMachContinuousTime])
        || ([(_SSCAMLTimeInterval *)self timebaseRatio],
            double v9 = v8,
            [(_SSCAMLTimeInterval *)v5 timebaseRatio],
            v9 != v10))
      {
        v11 = [(_SSCAMLTimeInterval *)self startDate];
        if (!v11)
        {
          uint64_t v15 = [(_SSCAMLTimeInterval *)v5 startDate];
          if (v15) {
            goto LABEL_25;
          }
        }
        v12 = [(_SSCAMLTimeInterval *)self startDate];
        if (v12)
        {
          id v13 = [(_SSCAMLTimeInterval *)v5 startDate];

          if (v11) {
          if (!v13)
          }
            goto LABEL_23;
        }
        else
        {

          if (v11) {
        }
          }
        v16 = [(_SSCAMLTimeInterval *)self endDate];
        if (!v16)
        {
          uint64_t v15 = [(_SSCAMLTimeInterval *)v5 endDate];
          if (v15)
          {
LABEL_25:
            double v19 = (void *)v15;
            char v14 = 0;
            goto LABEL_34;
          }
        }
        v17 = [(_SSCAMLTimeInterval *)self endDate];
        if (v17)
        {
          double v18 = [(_SSCAMLTimeInterval *)v5 endDate];

          if (v16) {
          if (!v18)
          }
            goto LABEL_23;
        }
        else
        {

          if (v16) {
        }
          }
        double v20 = [(_SSCAMLTimeInterval *)self startDate];

        if (!v20)
        {
          char v14 = 1;
          goto LABEL_35;
        }
        double v19 = [(_SSCAMLTimeInterval *)self startDate];
        v21 = [(_SSCAMLTimeInterval *)v5 startDate];
        if ([v19 isEqualToDate:v21])
        {
          v22 = [(_SSCAMLTimeInterval *)self endDate];
          objc_super v23 = [(_SSCAMLTimeInterval *)v5 endDate];
          char v14 = [v22 isEqualToDate:v23];
        }
        else
        {
          char v14 = 0;
        }

LABEL_34:
        goto LABEL_35;
      }
LABEL_23:
      char v14 = 0;
LABEL_35:

      goto LABEL_36;
    }
    char v14 = 0;
  }
LABEL_36:

  return v14;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (unint64_t)startMachContinuousTime
{
  return self->_startMachContinuousTime;
}

- (unint64_t)endMachContinuousTime
{
  return self->_endMachContinuousTime;
}

- (double)timebaseRatio
{
  return self->_timebaseRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end