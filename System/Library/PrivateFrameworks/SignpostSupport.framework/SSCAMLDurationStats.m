@interface SSCAMLDurationStats
- (NSString)debugDescription;
- (SSCAMLDurationStats)initWithCount:(unint64_t)a3 totalMs:(double)a4 minMs:(double)a5 maxMs:(double)a6 stddevMs:(double)a7;
- (SSCAMLDurationStats)initWithMeasuredValue:(id)a3;
- (double)averageMs;
- (double)averageNs;
- (double)averageSec;
- (double)maxMs;
- (double)maxNs;
- (double)maxSec;
- (double)minMs;
- (double)minNs;
- (double)minSec;
- (double)stddevMs;
- (double)stddevNs;
- (double)stddevSec;
- (double)totalMs;
- (double)totalNs;
- (double)totalSec;
- (id)dictionaryRepresentation;
- (id)jsonDescription:(unint64_t)a3;
- (unint64_t)durationCount;
@end

@implementation SSCAMLDurationStats

- (SSCAMLDurationStats)initWithCount:(unint64_t)a3 totalMs:(double)a4 minMs:(double)a5 maxMs:(double)a6 stddevMs:(double)a7
{
  v13.receiver = self;
  v13.super_class = (Class)SSCAMLDurationStats;
  result = [(SSCAMLDurationStats *)&v13 init];
  if (result)
  {
    result->_durationCount = a3;
    result->_totalMs = a4;
    result->_minMs = a5;
    result->_maxMs = a6;
    result->_stddevMs = a7;
  }
  return result;
}

- (SSCAMLDurationStats)initWithMeasuredValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 count];
  v6 = [v4 total];
  [v6 doubleValue];
  double v8 = v7;
  v9 = [v4 min];
  [v9 doubleValue];
  double v11 = v10;
  v12 = [v4 max];
  [v12 doubleValue];
  double v14 = v13;
  v15 = [v4 stddev];

  [v15 doubleValue];
  v17 = [(SSCAMLDurationStats *)self initWithCount:v5 totalMs:v8 minMs:v11 maxMs:v14 stddevMs:v16];

  return v17;
}

- (id)dictionaryRepresentation
{
  v17[6] = *MEMORY[0x1E4F143B8];
  v16[0] = kSSCAMLDurationStatsKey_Count;
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SSCAMLDurationStats durationCount](self, "durationCount"));
  v17[0] = v3;
  v16[1] = kSSCAMLDurationStatsKey_Average;
  id v4 = NSNumber;
  [(SSCAMLDurationStats *)self averageMs];
  uint64_t v5 = objc_msgSend(v4, "numberWithDouble:");
  v17[1] = v5;
  v16[2] = kSSCAMLDurationStatsKey_Total;
  v6 = NSNumber;
  [(SSCAMLDurationStats *)self totalMs];
  double v7 = objc_msgSend(v6, "numberWithDouble:");
  v17[2] = v7;
  v16[3] = kSSCAMLDurationStatsKey_Min;
  double v8 = NSNumber;
  [(SSCAMLDurationStats *)self minMs];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  v17[3] = v9;
  v16[4] = kSSCAMLDurationStatsKey_Max;
  double v10 = NSNumber;
  [(SSCAMLDurationStats *)self maxMs];
  double v11 = objc_msgSend(v10, "numberWithDouble:");
  v17[4] = v11;
  v16[5] = kSSCAMLDurationStatsKey_StdDev;
  v12 = NSNumber;
  [(SSCAMLDurationStats *)self stddevMs];
  double v13 = objc_msgSend(v12, "numberWithDouble:");
  v17[5] = v13;
  double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:6];

  return v14;
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)[(SSCAMLDurationStats *)self jsonDescription:3];
}

- (double)averageMs
{
  if (![(SSCAMLDurationStats *)self durationCount]) {
    return 0.0;
  }
  [(SSCAMLDurationStats *)self totalMs];
  return v3 / (double)[(SSCAMLDurationStats *)self durationCount];
}

- (double)averageSec
{
  [(SSCAMLDurationStats *)self averageMs];
  return v2 / 1000.0;
}

- (double)totalSec
{
  [(SSCAMLDurationStats *)self totalMs];
  return v2 / 1000.0;
}

- (double)minSec
{
  [(SSCAMLDurationStats *)self minMs];
  return v2 / 1000.0;
}

- (double)maxSec
{
  [(SSCAMLDurationStats *)self maxMs];
  return v2 / 1000.0;
}

- (double)stddevSec
{
  [(SSCAMLDurationStats *)self stddevMs];
  return v2 / 1000.0;
}

- (double)averageNs
{
  [(SSCAMLDurationStats *)self averageMs];
  return v2 * 1000000.0;
}

- (double)totalNs
{
  [(SSCAMLDurationStats *)self totalMs];
  return v2 * 1000000.0;
}

- (double)minNs
{
  [(SSCAMLDurationStats *)self minMs];
  return v2 * 1000000.0;
}

- (double)maxNs
{
  [(SSCAMLDurationStats *)self maxMs];
  return v2 * 1000000.0;
}

- (double)stddevNs
{
  [(SSCAMLDurationStats *)self stddevMs];
  return v2 * 1000000.0;
}

- (unint64_t)durationCount
{
  return self->_durationCount;
}

- (double)totalMs
{
  return self->_totalMs;
}

- (double)minMs
{
  return self->_minMs;
}

- (double)maxMs
{
  return self->_maxMs;
}

- (double)stddevMs
{
  return self->_stddevMs;
}

@end