@interface TPSAnalyticsEventDesiredOutcomePerformed
+ (BOOL)supportsSecureCoding;
+ (id)eventWithTipID:(id)a3 correlationID:(id)a4 displayType:(id)a5 overrideHoldout:(BOOL)a6 lastDisplayedContext:(id)a7 lastHintDisplayedDate:(id)a8 desiredOutcomePerformedDate:(id)a9;
- (NSString)bundleID;
- (NSString)context;
- (NSString)correlationID;
- (NSString)displayType;
- (NSString)experimentCampID;
- (NSString)experimentID;
- (NSString)tipID;
- (TPSAnalyticsEventDesiredOutcomePerformed)initWithCoder:(id)a3;
- (double)timeToDesiredOutcome;
- (id)_initWithTipID:(id)a3 correlationID:(id)a4 displayType:(id)a5 overrideHoldout:(BOOL)a6 context:(id)a7 lastHintDisplayedDate:(id)a8 desiredOutcomePerformedDate:(id)a9;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (int64_t)displayCount;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setContext:(id)a3;
- (void)setCorrelationID:(id)a3;
- (void)setDataProvider:(id)a3;
- (void)setDisplayCount:(int64_t)a3;
- (void)setDisplayType:(id)a3;
- (void)setExperimentCampID:(id)a3;
- (void)setExperimentID:(id)a3;
- (void)setTimeToDesiredOutcome:(double)a3;
- (void)setTipID:(id)a3;
@end

@implementation TPSAnalyticsEventDesiredOutcomePerformed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)eventWithTipID:(id)a3 correlationID:(id)a4 displayType:(id)a5 overrideHoldout:(BOOL)a6 lastDisplayedContext:(id)a7 lastHintDisplayedDate:(id)a8 desiredOutcomePerformedDate:(id)a9
{
  BOOL v11 = a6;
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  id v21 = [[TPSAnalyticsEventDesiredOutcomePerformed alloc] _initWithTipID:v20 correlationID:v19 displayType:v18 overrideHoldout:v11 context:v17 lastHintDisplayedDate:v16 desiredOutcomePerformedDate:v15];

  return v21;
}

- (id)_initWithTipID:(id)a3 correlationID:(id)a4 displayType:(id)a5 overrideHoldout:(BOOL)a6 context:(id)a7 lastHintDisplayedDate:(id)a8 desiredOutcomePerformedDate:(id)a9
{
  BOOL v24 = a6;
  id v25 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v26.receiver = self;
  v26.super_class = (Class)TPSAnalyticsEventDesiredOutcomePerformed;
  id v20 = [(TPSAnalyticsEvent *)&v26 initWithDate:0];
  id v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_tipID, a3);
    objc_storeStrong((id *)&v21->_correlationID, a4);
    objc_storeStrong((id *)&v21->_context, a7);
    objc_storeStrong((id *)&v21->_displayType, a5);
    double v22 = -1.0;
    if (v18 && v19) {
      objc_msgSend(v19, "timeIntervalSinceDate:", v18, -1.0);
    }
    v21->_timeToDesiredOutcome = v22;
    if (v24) {
      objc_storeStrong((id *)&v21->_experimentCampID, @"overrideHoldout");
    }
  }

  return v21;
}

- (TPSAnalyticsEventDesiredOutcomePerformed)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)TPSAnalyticsEventDesiredOutcomePerformed;
  v5 = [(TPSAnalyticsEvent *)&v22 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_ID"];
    tipID = v5->_tipID;
    v5->_tipID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_correlation_ID"];
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundle_ID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];
    context = v5->_context;
    v5->_context = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"experiment_ID"];
    experimentID = v5->_experimentID;
    v5->_experimentID = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"experiment_camp_ID"];
    experimentCampID = v5->_experimentCampID;
    v5->_experimentCampID = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"display_type"];
    displayType = v5->_displayType;
    v5->_displayType = (NSString *)v18;

    [v4 decodeDoubleForKey:@"time_to_desired_outcome"];
    v5->_timeToDesiredOutcome = v20;
    v5->_displayCount = [v4 decodeIntegerForKey:@"display_count"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventDesiredOutcomePerformed;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, @"tip_ID", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_correlationID forKey:@"tip_correlation_ID"];
  [v4 encodeObject:self->_bundleID forKey:@"bundle_ID"];
  [v4 encodeObject:self->_context forKey:@"context"];
  [v4 encodeObject:self->_experimentID forKey:@"experiment_ID"];
  [v4 encodeObject:self->_experimentCampID forKey:@"experiment_ID"];
  [v4 encodeObject:self->_displayType forKey:@"display_type"];
  [v4 encodeDouble:@"time_to_desired_outcome" forKey:self->_timeToDesiredOutcome];
  [v4 encodeInteger:self->_displayCount forKey:@"display_count"];
}

- (void)setDataProvider:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)TPSAnalyticsEventDesiredOutcomePerformed;
  [(TPSAnalyticsEvent *)&v25 setDataProvider:a3];
  correlationID = self->_correlationID;
  if (correlationID)
  {
    objc_super v5 = correlationID;
    uint64_t v6 = self->_correlationID;
    self->_correlationID = v5;
  }
  else
  {
    uint64_t v6 = [(TPSAnalyticsEvent *)self dataProvider];
    v7 = [v6 correlationIDForIdentifier:self->_tipID];
    uint64_t v8 = self->_correlationID;
    self->_correlationID = v7;
  }
  if (self->_displayCount)
  {
    self->_displayCount = 1;
  }
  else
  {
    v9 = [(TPSAnalyticsEvent *)self dataProvider];
    self->_displayCount = [v9 hintDisplayedCountForIdentifier:self->_tipID];
  }
  bundleID = self->_bundleID;
  if (bundleID)
  {
    BOOL v11 = bundleID;
    uint64_t v12 = self->_bundleID;
    self->_bundleID = v11;
  }
  else
  {
    uint64_t v12 = [(TPSAnalyticsEvent *)self dataProvider];
    v13 = [v12 bundleIDForIdentifier:self->_tipID];
    uint64_t v14 = self->_bundleID;
    self->_bundleID = v13;
  }
  experimentID = self->_experimentID;
  if (experimentID)
  {
    uint64_t v16 = experimentID;
    id v17 = self->_experimentID;
    self->_experimentID = v16;
  }
  else
  {
    id v17 = [(TPSAnalyticsEvent *)self dataProvider];
    uint64_t v18 = [v17 experimentID];
    id v19 = self->_experimentID;
    self->_experimentID = v18;
  }
  experimentCampID = self->_experimentCampID;
  if (experimentCampID)
  {
    id v21 = experimentCampID;
    objc_super v22 = self->_experimentCampID;
    self->_experimentCampID = v21;
  }
  else
  {
    objc_super v22 = [(TPSAnalyticsEvent *)self dataProvider];
    v23 = [v22 experimentCampID];
    BOOL v24 = self->_experimentCampID;
    self->_experimentCampID = v23;
  }
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"desired_outcome_performed"];
}

- (id)mutableAnalyticsEventRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_tipID forKeyedSubscript:@"tip_ID"];
  [v3 setObject:self->_correlationID forKeyedSubscript:@"tip_correlation_ID"];
  [v3 setObject:self->_bundleID forKeyedSubscript:@"bundle_ID"];
  [v3 setObject:self->_context forKeyedSubscript:@"context"];
  [v3 setObject:self->_experimentID forKeyedSubscript:@"experiment_ID"];
  [v3 setObject:self->_experimentCampID forKeyedSubscript:@"experiment_camp_ID"];
  [v3 setObject:self->_displayType forKeyedSubscript:@"display_type"];
  id v4 = [NSNumber numberWithInteger:self->_displayCount];
  [v3 setObject:v4 forKeyedSubscript:@"display_count"];

  double timeToDesiredOutcome = self->_timeToDesiredOutcome;
  if (timeToDesiredOutcome == -1.0)
  {
    [v3 setObject:0 forKeyedSubscript:@"time_to_desired_outcome"];
  }
  else
  {
    uint64_t v6 = [NSNumber numberWithInteger:(uint64_t)timeToDesiredOutcome];
    [v3 setObject:v6 forKeyedSubscript:@"time_to_desired_outcome"];
  }
  v7 = objc_msgSend(NSNumber, "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  [v3 setObject:v7 forKeyedSubscript:@"u65_flag"];

  return v3;
}

- (NSString)tipID
{
  return self->_tipID;
}

- (void)setTipID:(id)a3
{
}

- (double)timeToDesiredOutcome
{
  return self->_timeToDesiredOutcome;
}

- (void)setTimeToDesiredOutcome:(double)a3
{
  self->_double timeToDesiredOutcome = a3;
}

- (int64_t)displayCount
{
  return self->_displayCount;
}

- (void)setDisplayCount:(int64_t)a3
{
  self->_displayCount = a3;
}

- (NSString)correlationID
{
  return self->_correlationID;
}

- (void)setCorrelationID:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSString)experimentID
{
  return self->_experimentID;
}

- (void)setExperimentID:(id)a3
{
}

- (NSString)experimentCampID
{
  return self->_experimentCampID;
}

- (void)setExperimentCampID:(id)a3
{
}

- (NSString)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_experimentCampID, 0);
  objc_storeStrong((id *)&self->_experimentID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_tipID, 0);
}

@end