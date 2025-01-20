@interface _OSInactivityPredictorBackupHourEntry_v2
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_OSInactivityPredictorBackupHourEntry_v2)initWithCoder:(id)a3;
- (double)pctLong;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setPctLong:(double)a3;
@end

@implementation _OSInactivityPredictorBackupHourEntry_v2

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(_OSInactivityPredictorBackupHourEntry_v2 *)self pctLong];
  objc_msgSend(v4, "encodeDouble:forKey:", @"pct");
  [(_OSInactivityPredictorBackupHourEntry *)self stdDev];
  objc_msgSend(v4, "encodeDouble:forKey:", @"stdDev");
  [(_OSInactivityPredictorBackupHourEntry *)self averageDuration];
  objc_msgSend(v4, "encodeDouble:forKey:", @"avg");
}

- (_OSInactivityPredictorBackupHourEntry_v2)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (_OSInactivityPredictorBackupHourEntry_v2 *)objc_alloc_init((Class)objc_opt_class());

  [v4 decodeDoubleForKey:@"pct"];
  -[_OSInactivityPredictorBackupHourEntry_v2 setPctLong:](v5, "setPctLong:");
  [v4 decodeDoubleForKey:@"stdDev"];
  -[_OSInactivityPredictorBackupHourEntry setStdDev:](v5, "setStdDev:");
  [v4 decodeDoubleForKey:@"avg"];
  double v7 = v6;

  [(_OSInactivityPredictorBackupHourEntry *)v5 setAverageDuration:v7];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_OSInactivityPredictorBackupHourEntry_v2 *)a3;
  if (self == v4)
  {
    BOOL v15 = 1;
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
        BOOL v15 = 0;
      }
      else
      {
        [(_OSInactivityPredictorBackupHourEntry_v2 *)self pctLong];
        double v13 = v12;
        [(_OSInactivityPredictorBackupHourEntry_v2 *)v5 pctLong];
        BOOL v15 = vabdd_f64(v13, v14) < 0.001;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }

  return v15;
}

- (id)description
{
  v3 = NSString;
  [(_OSInactivityPredictorBackupHourEntry *)self averageDuration];
  uint64_t v5 = v4;
  [(_OSInactivityPredictorBackupHourEntry_v2 *)self pctLong];
  return (id)[v3 stringWithFormat:@"<Inactivity Entry v2: Duration: %.1lfh, %.2f%% Long>", v5, v6];
}

- (double)pctLong
{
  return self->_pctLong;
}

- (void)setPctLong:(double)a3
{
  self->_pctLong = a3;
}

@end