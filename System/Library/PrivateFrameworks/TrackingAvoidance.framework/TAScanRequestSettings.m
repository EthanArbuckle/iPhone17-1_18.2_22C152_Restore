@interface TAScanRequestSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (TAScanRequestSettings)initWithCoder:(id)a3;
- (TAScanRequestSettings)initWithDefaults;
- (TAScanRequestSettings)initWithMinVisitEntryDisplayOnDuration:(double)a3 minInterVisitDisplayOnDuration:(double)a4 interVisitScanDelay:(double)a5 maxInterVisitScanRequests:(unint64_t)a6;
- (TAScanRequestSettings)initWithMinVisitEntryDisplayOnDurationOrDefault:(id)a3 minInterVisitDisplayOnDurationOrDefault:(id)a4 interVisitScanDelayOrDefault:(id)a5 maxInterVisitScanRequestsOrDefault:(id)a6;
- (double)interVisitScanDelay;
- (double)minInterVisitDisplayOnDuration;
- (double)minVisitEntryDisplayOnDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)maxInterVisitScanRequests;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TAScanRequestSettings

- (TAScanRequestSettings)initWithDefaults
{
  return [(TAScanRequestSettings *)self initWithMinVisitEntryDisplayOnDurationOrDefault:0 minInterVisitDisplayOnDurationOrDefault:0 interVisitScanDelayOrDefault:0 maxInterVisitScanRequestsOrDefault:0];
}

- (TAScanRequestSettings)initWithMinVisitEntryDisplayOnDuration:(double)a3 minInterVisitDisplayOnDuration:(double)a4 interVisitScanDelay:(double)a5 maxInterVisitScanRequests:(unint64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)TAScanRequestSettings;
  result = [(TAScanRequestSettings *)&v11 init];
  if (result)
  {
    result->_minVisitEntryDisplayOnDuration = a3;
    result->_minInterVisitDisplayOnDuration = a4;
    result->_interVisitScanDelay = a5;
    result->_maxInterVisitScanRequests = a6;
  }
  return result;
}

- (TAScanRequestSettings)initWithMinVisitEntryDisplayOnDurationOrDefault:(id)a3 minInterVisitDisplayOnDurationOrDefault:(id)a4 interVisitScanDelayOrDefault:(id)a5 maxInterVisitScanRequestsOrDefault:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  double v14 = 90.0;
  double v15 = 90.0;
  if (v10)
  {
    [v10 doubleValue];
    double v15 = v16;
  }
  if (v11)
  {
    [v11 doubleValue];
    double v14 = v17;
  }
  if (!v12)
  {
    double v19 = 660.0;
    if (v13) {
      goto LABEL_7;
    }
LABEL_9:
    uint64_t v20 = 2;
    goto LABEL_10;
  }
  [v12 doubleValue];
  double v19 = v18;
  if (!v13) {
    goto LABEL_9;
  }
LABEL_7:
  uint64_t v20 = [v13 unsignedIntegerValue];
LABEL_10:
  v21 = [(TAScanRequestSettings *)self initWithMinVisitEntryDisplayOnDuration:v20 minInterVisitDisplayOnDuration:v15 interVisitScanDelay:v14 maxInterVisitScanRequests:v19];

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TAScanRequestSettings allocWithZone:a3];
  double minVisitEntryDisplayOnDuration = self->_minVisitEntryDisplayOnDuration;
  double minInterVisitDisplayOnDuration = self->_minInterVisitDisplayOnDuration;
  double interVisitScanDelay = self->_interVisitScanDelay;
  unint64_t maxInterVisitScanRequests = self->_maxInterVisitScanRequests;
  return [(TAScanRequestSettings *)v4 initWithMinVisitEntryDisplayOnDuration:maxInterVisitScanRequests minInterVisitDisplayOnDuration:minVisitEntryDisplayOnDuration interVisitScanDelay:minInterVisitDisplayOnDuration maxInterVisitScanRequests:interVisitScanDelay];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TAScanRequestSettings *)a3;
  if (self == v4)
  {
    BOOL v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      [(TAScanRequestSettings *)self minVisitEntryDisplayOnDuration];
      double v7 = v6;
      [(TAScanRequestSettings *)v5 minVisitEntryDisplayOnDuration];
      if (v7 == v8
        && ([(TAScanRequestSettings *)self minInterVisitDisplayOnDuration],
            double v10 = v9,
            [(TAScanRequestSettings *)v5 minInterVisitDisplayOnDuration],
            v10 == v11)
        && ([(TAScanRequestSettings *)self interVisitScanDelay],
            double v13 = v12,
            [(TAScanRequestSettings *)v5 interVisitScanDelay],
            v13 == v14))
      {
        unint64_t v15 = [(TAScanRequestSettings *)self maxInterVisitScanRequests];
        BOOL v16 = v15 == [(TAScanRequestSettings *)v5 maxInterVisitScanRequests];
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAScanRequestSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"VisitDisplayOn"];
  double v6 = v5;
  [v4 decodeDoubleForKey:@"IntervisitDisplayOn"];
  double v8 = v7;
  [v4 decodeDoubleForKey:@"ScanDelay"];
  double v10 = v9;
  uint64_t v11 = [v4 decodeIntegerForKey:@"MaxScanReqs"];

  return [(TAScanRequestSettings *)self initWithMinVisitEntryDisplayOnDuration:v11 minInterVisitDisplayOnDuration:v6 interVisitScanDelay:v8 maxInterVisitScanRequests:v10];
}

- (void)encodeWithCoder:(id)a3
{
  double minVisitEntryDisplayOnDuration = self->_minVisitEntryDisplayOnDuration;
  id v5 = a3;
  [v5 encodeDouble:@"VisitDisplayOn" forKey:minVisitEntryDisplayOnDuration];
  [v5 encodeDouble:@"IntervisitDisplayOn" forKey:self->_minInterVisitDisplayOnDuration];
  [v5 encodeDouble:@"ScanDelay" forKey:self->_interVisitScanDelay];
  [v5 encodeInteger:self->_maxInterVisitScanRequests forKey:@"MaxScanReqs"];
}

- (double)minVisitEntryDisplayOnDuration
{
  return self->_minVisitEntryDisplayOnDuration;
}

- (double)minInterVisitDisplayOnDuration
{
  return self->_minInterVisitDisplayOnDuration;
}

- (double)interVisitScanDelay
{
  return self->_interVisitScanDelay;
}

- (unint64_t)maxInterVisitScanRequests
{
  return self->_maxInterVisitScanRequests;
}

@end