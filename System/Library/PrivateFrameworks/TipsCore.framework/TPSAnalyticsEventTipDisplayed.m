@interface TPSAnalyticsEventTipDisplayed
+ (BOOL)supportsSecureCoding;
+ (id)eventWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6 displayType:(unint64_t)a7 usageFlags:(unint64_t)a8 experiment:(id)a9 overrideHoldout:(BOOL)a10 date:(id)a11;
- (BOOL)overrideHoldout;
- (NSString)bundleID;
- (NSString)context;
- (NSString)correlationID;
- (NSString)tipID;
- (TPSAnalyticsEventTipDisplayed)initWithCoder:(id)a3;
- (TPSExperiment)experiment;
- (id)_initWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6 displayType:(unint64_t)a7 usageFlags:(unint64_t)a8 experiment:(id)a9 overrideHoldout:(BOOL)a10 date:(id)a11;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (unint64_t)displayCount;
- (unint64_t)displayType;
- (unint64_t)usageFlags;
- (void)encodeWithCoder:(id)a3;
- (void)setDataProvider:(id)a3;
- (void)setDisplayCount:(unint64_t)a3;
- (void)setOverrideHoldout:(BOOL)a3;
@end

@implementation TPSAnalyticsEventTipDisplayed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventTipDisplayed)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TPSAnalyticsEventTipDisplayed;
  v5 = [(TPSAnalyticsEvent *)&v20 initWithCoder:v4];
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

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"display_type"];
    v5->_displayType = [v14 unsignedIntegerValue];

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"usage_flags"];
    v5->_usageFlags = [v15 unsignedIntegerValue];

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"display_count"];
    v5->_displayCount = [v16 unsignedIntegerValue];

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"experiment"];
    experiment = v5->_experiment;
    v5->_experiment = (TPSExperiment *)v17;

    v5->_overrideHoldout = [v4 decodeBoolForKey:@"override_holdout"];
  }

  return v5;
}

- (id)_initWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6 displayType:(unint64_t)a7 usageFlags:(unint64_t)a8 experiment:(id)a9 overrideHoldout:(BOOL)a10 date:(id)a11
{
  id v25 = a3;
  id v24 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a9;
  v26.receiver = self;
  v26.super_class = (Class)TPSAnalyticsEventTipDisplayed;
  v19 = [(TPSAnalyticsEvent *)&v26 initWithDate:a11];
  objc_super v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_tipID, a3);
    objc_storeStrong((id *)&v20->_correlationID, a4);
    objc_storeStrong((id *)&v20->_bundleID, a5);
    objc_storeStrong((id *)&v20->_context, a6);
    v20->_displayType = a7;
    v20->_usageFlags = a8;
    objc_storeStrong((id *)&v20->_experiment, a9);
    v20->_overrideHoldout = a10;
  }

  return v20;
}

+ (id)eventWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6 displayType:(unint64_t)a7 usageFlags:(unint64_t)a8 experiment:(id)a9 overrideHoldout:(BOOL)a10 date:(id)a11
{
  id v18 = a11;
  id v19 = a9;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  LOBYTE(v26) = a10;
  id v24 = (void *)[objc_alloc((Class)a1) _initWithTipID:v23 correlationID:v22 bundleID:v21 context:v20 displayType:a7 usageFlags:a8 experiment:v19 overrideHoldout:v26 date:v18];

  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TPSAnalyticsEventTipDisplayed;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v8 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, @"tip_ID", v8.receiver, v8.super_class);
  [v4 encodeObject:self->_correlationID forKey:@"tip_correlation_ID"];
  [v4 encodeObject:self->_bundleID forKey:@"bundle_ID"];
  [v4 encodeObject:self->_context forKey:@"context"];
  v5 = [NSNumber numberWithUnsignedInteger:self->_displayType];
  [v4 encodeObject:v5 forKey:@"display_type"];

  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_usageFlags];
  [v4 encodeObject:v6 forKey:@"usage_flags"];

  v7 = [NSNumber numberWithUnsignedInteger:self->_displayCount];
  [v4 encodeObject:v7 forKey:@"display_count"];

  [v4 encodeObject:self->_experiment forKey:@"experiment"];
  [v4 encodeBool:self->_overrideHoldout forKey:@"override_holdout"];
}

- (void)setDataProvider:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TPSAnalyticsEventTipDisplayed;
  [(TPSAnalyticsEvent *)&v10 setDataProvider:a3];
  if (self->_displayCount)
  {
    self->_displayCount = 1;
  }
  else
  {
    id v4 = [(TPSAnalyticsEvent *)self dataProvider];
    self->_displayCount = [v4 hintDisplayedCountForIdentifier:self->_tipID];
  }
  correlationID = self->_correlationID;
  if (correlationID)
  {
    uint64_t v6 = correlationID;
    v7 = self->_correlationID;
    self->_correlationID = v6;
  }
  else
  {
    v7 = [(TPSAnalyticsEvent *)self dataProvider];
    objc_super v8 = [v7 correlationIDForIdentifier:self->_tipID];
    v9 = self->_correlationID;
    self->_correlationID = v8;
  }
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"tip_displayed"];
}

- (id)mutableAnalyticsEventRepresentation
{
  v3 = objc_opt_new();
  [v3 setObject:self->_tipID forKeyedSubscript:@"tip_ID"];
  [v3 setObject:self->_correlationID forKeyedSubscript:@"tip_correlation_ID"];
  [v3 setObject:self->_bundleID forKeyedSubscript:@"bundle_ID"];
  [v3 setObject:self->_context forKeyedSubscript:@"context"];
  id v4 = +[TPSAnalyticsCommonDefines displayTypeStringForDisplayType:self->_displayType];
  [v3 setObject:v4 forKeyedSubscript:@"display_type"];

  v5 = [NSNumber numberWithUnsignedInteger:self->_displayCount];
  [v3 setObject:v5 forKeyedSubscript:@"display_count"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[TPSExperiment identifier](self->_experiment, "identifier"));
  v7 = [v6 stringValue];
  [v3 setObject:v7 forKeyedSubscript:@"experiment_ID"];

  if (self->_overrideHoldout)
  {
    [v3 setObject:@"overrideHoldout" forKeyedSubscript:@"experiment_camp_ID"];
  }
  else
  {
    objc_super v8 = +[TPSAnalyticsCommonDefines experimentCampIDStringForCamp:[(TPSExperiment *)self->_experiment camp]];
    [v3 setObject:v8 forKeyedSubscript:@"experiment_camp_ID"];
  }
  v9 = objc_msgSend(NSNumber, "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  [v3 setObject:v9 forKeyedSubscript:@"u65_flag"];

  return v3;
}

- (NSString)tipID
{
  return self->_tipID;
}

- (NSString)correlationID
{
  return self->_correlationID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)context
{
  return self->_context;
}

- (unint64_t)displayType
{
  return self->_displayType;
}

- (unint64_t)usageFlags
{
  return self->_usageFlags;
}

- (unint64_t)displayCount
{
  return self->_displayCount;
}

- (void)setDisplayCount:(unint64_t)a3
{
  self->_displayCount = a3;
}

- (BOOL)overrideHoldout
{
  return self->_overrideHoldout;
}

- (void)setOverrideHoldout:(BOOL)a3
{
  self->_overrideHoldout = a3;
}

- (TPSExperiment)experiment
{
  return self->_experiment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experiment, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_tipID, 0);
}

@end