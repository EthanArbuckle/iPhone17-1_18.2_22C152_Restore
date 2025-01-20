@interface WiFiAwareDataSessionStatisticsHistogramBin
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (WiFiAwareDataSessionStatisticsHistogramBin)initWithBinStart:(double)a3 binEnd:(double)a4 value:(double)a5;
- (WiFiAwareDataSessionStatisticsHistogramBin)initWithCoder:(id)a3;
- (double)binEnd;
- (double)binStart;
- (double)value;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setValue:(double)a3;
@end

@implementation WiFiAwareDataSessionStatisticsHistogramBin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WiFiAwareDataSessionStatisticsHistogramBin)initWithBinStart:(double)a3 binEnd:(double)a4 value:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)WiFiAwareDataSessionStatisticsHistogramBin;
  result = [(WiFiAwareDataSessionStatisticsHistogramBin *)&v9 init];
  if (result)
  {
    result->_binStart = a3;
    result->_binEnd = a4;
    result->_value = a5;
  }
  return result;
}

- (WiFiAwareDataSessionStatisticsHistogramBin)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsHistogramBin.binStart"];
  [v5 doubleValue];
  double v7 = v6;

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsHistogramBin.binEnd"];
  [v8 doubleValue];
  double v10 = v9;

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionStatisticsHistogramBin.value"];

  [v11 doubleValue];
  double v13 = v12;

  return [(WiFiAwareDataSessionStatisticsHistogramBin *)self initWithBinStart:v7 binEnd:v10 value:v13];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  [(WiFiAwareDataSessionStatisticsHistogramBin *)self binStart];
  double v6 = objc_msgSend(v4, "numberWithDouble:");
  [v5 encodeObject:v6 forKey:@"WiFiAwareDataSessionStatisticsHistogramBin.binStart"];

  double v7 = NSNumber;
  [(WiFiAwareDataSessionStatisticsHistogramBin *)self binEnd];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  [v5 encodeObject:v8 forKey:@"WiFiAwareDataSessionStatisticsHistogramBin.binEnd"];

  double v9 = NSNumber;
  [(WiFiAwareDataSessionStatisticsHistogramBin *)self value];
  objc_msgSend(v9, "numberWithDouble:");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v10 forKey:@"WiFiAwareDataSessionStatisticsHistogramBin.value"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WiFiAwareDataSessionStatisticsHistogramBin *)a3;
  if (self == v4)
  {
    id v5 = 0;
LABEL_8:
    BOOL v15 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v15 = 0;
    id v5 = 0;
    goto LABEL_10;
  }
  id v5 = v4;
  [(WiFiAwareDataSessionStatisticsHistogramBin *)self binStart];
  double v7 = v6;
  [(WiFiAwareDataSessionStatisticsHistogramBin *)v5 binStart];
  if (vabdd_f64(v7, v8) < 2.22044605e-16)
  {
    [(WiFiAwareDataSessionStatisticsHistogramBin *)self binEnd];
    double v10 = v9;
    [(WiFiAwareDataSessionStatisticsHistogramBin *)v5 binEnd];
    if (vabdd_f64(v10, v11) < 2.22044605e-16)
    {
      [(WiFiAwareDataSessionStatisticsHistogramBin *)self value];
      double v13 = v12;
      [(WiFiAwareDataSessionStatisticsHistogramBin *)v5 value];
      if (vabdd_f64(v13, v14) < 2.22044605e-16) {
        goto LABEL_8;
      }
    }
  }
  BOOL v15 = 0;
LABEL_10:

  return v15;
}

- (id)description
{
  v3 = NSString;
  [(WiFiAwareDataSessionStatisticsHistogramBin *)self binStart];
  uint64_t v5 = (uint64_t)v4;
  [(WiFiAwareDataSessionStatisticsHistogramBin *)self binEnd];
  uint64_t v7 = (uint64_t)v6;
  [(WiFiAwareDataSessionStatisticsHistogramBin *)self value];
  return (id)objc_msgSend(v3, "stringWithFormat:", @"[<%lld...%lld> = %lld]", v5, v7, (uint64_t)v8);
}

- (double)binStart
{
  return self->_binStart;
}

- (double)binEnd
{
  return self->_binEnd;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

@end