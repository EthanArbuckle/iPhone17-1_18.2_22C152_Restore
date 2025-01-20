@interface _OSInactivityPredictorBackupHourEntry_v1
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_OSInactivityPredictorBackupHourEntry_v1)initWithCoder:(id)a3;
- (id)description;
- (int)count;
- (void)encodeWithCoder:(id)a3;
- (void)setCount:(int)a3;
@end

@implementation _OSInactivityPredictorBackupHourEntry_v1

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[_OSInactivityPredictorBackupHourEntry_v1 count](self, "count"), @"count");
  [(_OSInactivityPredictorBackupHourEntry *)self stdDev];
  objc_msgSend(v4, "encodeDouble:forKey:", @"stdDev");
  [(_OSInactivityPredictorBackupHourEntry *)self averageDuration];
  objc_msgSend(v4, "encodeDouble:forKey:", @"avg");
}

- (_OSInactivityPredictorBackupHourEntry_v1)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (_OSInactivityPredictorBackupHourEntry_v1 *)objc_alloc_init((Class)objc_opt_class());

  -[_OSInactivityPredictorBackupHourEntry_v1 setCount:](v5, "setCount:", [v4 decodeIntForKey:@"count"]);
  [v4 decodeDoubleForKey:@"stdDev"];
  -[_OSInactivityPredictorBackupHourEntry setStdDev:](v5, "setStdDev:");
  [v4 decodeDoubleForKey:@"avg"];
  double v7 = v6;

  [(_OSInactivityPredictorBackupHourEntry *)v5 setAverageDuration:v7];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_OSInactivityPredictorBackupHourEntry_v1 *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      [(_OSInactivityPredictorBackupHourEntry *)self averageDuration];
      double v7 = v6;
      [(_OSInactivityPredictorBackupHourEntry *)v5 averageDuration];
      if (vabdd_f64(v7, v8) >= 0.01
        || ([(_OSInactivityPredictorBackupHourEntry *)self stdDev],
            double v10 = v9,
            [(_OSInactivityPredictorBackupHourEntry *)v5 stdDev],
            vabdd_f64(v10, v11) >= 0.01))
      {
        BOOL v13 = 0;
      }
      else
      {
        int count = self->_count;
        BOOL v13 = count == [(_OSInactivityPredictorBackupHourEntry_v1 *)v5 count];
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (id)description
{
  v3 = NSString;
  [(_OSInactivityPredictorBackupHourEntry *)self averageDuration];
  return (id)[v3 stringWithFormat:@"<Inactivity Entry v1: Duration: %.1lfh, %d Total>", v4, -[_OSInactivityPredictorBackupHourEntry_v1 count](self, "count")];
}

- (int)count
{
  return self->_count;
}

- (void)setCount:(int)a3
{
  self->_int count = a3;
}

@end