@interface TPSAnalyticsEventTipDismissed
+ (BOOL)supportsSecureCoding;
+ (id)eventWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6 dismissType:(id)a7 timeToDismissal:(double)a8 date:(id)a9;
- (NSString)bundleID;
- (NSString)context;
- (NSString)correlationID;
- (NSString)dismissType;
- (NSString)tipID;
- (TPSAnalyticsEventTipDismissed)initWithCoder:(id)a3;
- (double)timeToDismissal;
- (id)_initWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6 dismissType:(id)a7 timeToDismissal:(double)a8 date:(id)a9;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (unint64_t)displayCount;
- (void)encodeWithCoder:(id)a3;
- (void)setDataProvider:(id)a3;
- (void)setDisplayCount:(unint64_t)a3;
- (void)setTimeToDismissal:(double)a3;
@end

@implementation TPSAnalyticsEventTipDismissed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventTipDismissed)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TPSAnalyticsEventTipDismissed;
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

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dismiss_type"];
    dismissType = v5->_dismissType;
    v5->_dismissType = (NSString *)v14;

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"display_count"];
    v5->_displayCount = [v16 unsignedIntegerValue];

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"time_to_dismissal"];
    [v17 doubleValue];
    v5->_timeToDismissal = v18;
  }
  return v5;
}

- (id)_initWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6 dismissType:(id)a7 timeToDismissal:(double)a8 date:(id)a9
{
  id v24 = a3;
  id v23 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v25.receiver = self;
  v25.super_class = (Class)TPSAnalyticsEventTipDismissed;
  objc_super v20 = [(TPSAnalyticsEvent *)&v25 initWithDate:a9];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_tipID, a3);
    objc_storeStrong((id *)&v21->_correlationID, a4);
    objc_storeStrong((id *)&v21->_bundleID, a5);
    objc_storeStrong((id *)&v21->_context, a6);
    objc_storeStrong((id *)&v21->_dismissType, a7);
    v21->_timeToDismissal = a8;
  }

  return v21;
}

+ (id)eventWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6 dismissType:(id)a7 timeToDismissal:(double)a8 date:(id)a9
{
  id v16 = a9;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  v22 = (void *)[objc_alloc((Class)a1) _initWithTipID:v21 correlationID:v20 bundleID:v19 context:v18 dismissType:v17 timeToDismissal:v16 date:a8];

  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TPSAnalyticsEventTipDismissed;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v7 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, @"tip_ID", v7.receiver, v7.super_class);
  [v4 encodeObject:self->_correlationID forKey:@"tip_correlation_ID"];
  [v4 encodeObject:self->_bundleID forKey:@"bundle_ID"];
  [v4 encodeObject:self->_context forKey:@"context"];
  [v4 encodeObject:self->_dismissType forKey:@"dismiss_type"];
  v5 = [NSNumber numberWithUnsignedInteger:self->_displayCount];
  [v4 encodeObject:v5 forKey:@"display_count"];

  uint64_t v6 = [NSNumber numberWithDouble:self->_timeToDismissal];
  [v4 encodeObject:v6 forKey:@"time_to_dismissal"];
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"tip_dismissed"];
}

- (void)setDataProvider:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)TPSAnalyticsEventTipDismissed;
  [(TPSAnalyticsEvent *)&v20 setDataProvider:a3];
  bundleID = self->_bundleID;
  if (bundleID)
  {
    v5 = bundleID;
    uint64_t v6 = self->_bundleID;
    self->_bundleID = v5;
  }
  else
  {
    uint64_t v6 = [(TPSAnalyticsEvent *)self dataProvider];
    objc_super v7 = [v6 bundleIDForIdentifier:self->_tipID];
    uint64_t v8 = self->_bundleID;
    self->_bundleID = v7;
  }
  context = self->_context;
  if (context)
  {
    uint64_t v10 = context;
    v11 = self->_context;
    self->_context = v10;
  }
  else
  {
    v11 = [(TPSAnalyticsEvent *)self dataProvider];
    uint64_t v12 = [v11 contextForIdentifier:self->_tipID];
    v13 = self->_context;
    self->_context = v12;
  }
  if (self->_displayCount)
  {
    self->_displayCount = 1;
  }
  else
  {
    uint64_t v14 = [(TPSAnalyticsEvent *)self dataProvider];
    self->_displayCount = [v14 hintDisplayedCountForIdentifier:self->_tipID];
  }
  correlationID = self->_correlationID;
  if (correlationID)
  {
    id v16 = correlationID;
    id v17 = self->_correlationID;
    self->_correlationID = v16;
  }
  else
  {
    id v17 = [(TPSAnalyticsEvent *)self dataProvider];
    id v18 = [v17 correlationIDForIdentifier:self->_tipID];
    id v19 = self->_correlationID;
    self->_correlationID = v18;
  }
}

- (id)mutableAnalyticsEventRepresentation
{
  v3 = objc_opt_new();
  [v3 setObject:self->_tipID forKeyedSubscript:@"tip_ID"];
  [v3 setObject:self->_correlationID forKeyedSubscript:@"tip_correlation_ID"];
  [v3 setObject:self->_bundleID forKeyedSubscript:@"bundle_ID"];
  [v3 setObject:self->_context forKeyedSubscript:@"context"];
  [v3 setObject:self->_dismissType forKeyedSubscript:@"dismiss_type"];
  id v4 = [NSNumber numberWithUnsignedInteger:self->_displayCount];
  [v3 setObject:v4 forKeyedSubscript:@"display_count"];

  v5 = [NSNumber numberWithDouble:ceil(self->_timeToDismissal)];
  [v3 setObject:v5 forKeyedSubscript:@"time_to_dismissal"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  [v3 setObject:v6 forKeyedSubscript:@"u65_flag"];

  return v3;
}

- (double)timeToDismissal
{
  return self->_timeToDismissal;
}

- (void)setTimeToDismissal:(double)a3
{
  self->_timeToDismissal = a3;
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

- (unint64_t)displayCount
{
  return self->_displayCount;
}

- (void)setDisplayCount:(unint64_t)a3
{
  self->_displayCount = a3;
}

- (NSString)dismissType
{
  return self->_dismissType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissType, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_tipID, 0);
}

@end