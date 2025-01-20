@interface WiFiUsageLQMAnalysisSamplingRate
- (WiFiUsageLQMAnalysisSamplingRate)initWithValue:(id)a3;
- (id)description;
- (unsigned)samplingBase;
- (unsigned)samplingRate;
@end

@implementation WiFiUsageLQMAnalysisSamplingRate

- (WiFiUsageLQMAnalysisSamplingRate)initWithValue:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WiFiUsageLQMAnalysisSamplingRate;
  v5 = [(WiFiUsageLQMAnalysisSamplingRate *)&v11 init];
  v5->_samplingBase = 100;
  [v4 doubleValue];
  unsigned int v7 = v6;
  v5->_samplingRate = v6;
  int v8 = 5;
  do
  {
    if (v6 == (double)v7) {
      break;
    }
    double v6 = v6 * 10.0;
    unsigned int v7 = v6;
    int v9 = 10 * v5->_samplingBase;
    v5->_samplingRate = v6;
    v5->_samplingBase = v9;
    --v8;
  }
  while (v8);

  return v5;
}

- (id)description
{
  LODWORD(v2) = self->_samplingRate;
  LODWORD(v3) = self->_samplingBase;
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%.03f%%", (double)v2 * 100.0 / (double)v3);
}

- (unsigned)samplingRate
{
  return self->_samplingRate;
}

- (unsigned)samplingBase
{
  return self->_samplingBase;
}

@end