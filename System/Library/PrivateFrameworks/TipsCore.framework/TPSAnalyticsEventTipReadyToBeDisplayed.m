@interface TPSAnalyticsEventTipReadyToBeDisplayed
+ (BOOL)supportsSecureCoding;
+ (id)eventWithTipID:(id)a3 correlationID:(id)a4;
+ (id)eventWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6 displayType:(id)a7;
- (NSString)bundleID;
- (NSString)context;
- (NSString)correlationID;
- (NSString)displayType;
- (NSString)tipID;
- (TPSAnalyticsEventTipReadyToBeDisplayed)initWithCoder:(id)a3;
- (id)_initWithTipID:(id)a3 correlationID:(id)a4;
- (id)_initWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6 displayType:(id)a7;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setContext:(id)a3;
- (void)setCorrelationID:(id)a3;
- (void)setDataProvider:(id)a3;
- (void)setDisplayType:(id)a3;
- (void)setTipID:(id)a3;
@end

@implementation TPSAnalyticsEventTipReadyToBeDisplayed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventTipReadyToBeDisplayed)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TPSAnalyticsEventTipReadyToBeDisplayed;
  v5 = [(TPSAnalyticsEvent *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_ID"];
    tipID = v5->_tipID;
    v5->_tipID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_correlation_ID"];
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"display_type"];
    displayType = v5->_displayType;
    v5->_displayType = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundle_ID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];
    context = v5->_context;
    v5->_context = (NSString *)v14;
  }
  return v5;
}

- (id)_initWithTipID:(id)a3 correlationID:(id)a4
{
  return [(TPSAnalyticsEventTipReadyToBeDisplayed *)self _initWithTipID:a3 correlationID:a4 bundleID:0 context:0 displayType:0];
}

- (id)_initWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6 displayType:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)TPSAnalyticsEventTipReadyToBeDisplayed;
  objc_super v17 = [(TPSAnalyticsEvent *)&v21 initWithDate:0];
  p_isa = (id *)&v17->super.super.isa;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_tipID, a3);
    objc_storeStrong(p_isa + 5, a4);
    objc_storeStrong(p_isa + 8, a7);
    objc_storeStrong(p_isa + 6, a5);
    objc_storeStrong(p_isa + 7, a6);
  }

  return p_isa;
}

+ (id)eventWithTipID:(id)a3 correlationID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)[objc_alloc((Class)a1) _initWithTipID:v7 correlationID:v6];

  return v8;
}

+ (id)eventWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6 displayType:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  objc_super v17 = (void *)[objc_alloc((Class)a1) _initWithTipID:v16 correlationID:v15 bundleID:v14 context:v13 displayType:v12];

  return v17;
}

- (void)setDataProvider:(id)a3
{
  v24.receiver = self;
  v24.super_class = (Class)TPSAnalyticsEventTipReadyToBeDisplayed;
  [(TPSAnalyticsEvent *)&v24 setDataProvider:a3];
  bundleID = self->_bundleID;
  if (bundleID)
  {
    v5 = bundleID;
    id v6 = self->_bundleID;
    self->_bundleID = v5;
  }
  else
  {
    id v6 = [(TPSAnalyticsEvent *)self dataProvider];
    id v7 = [v6 bundleIDForIdentifier:self->_tipID];
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
    id v12 = [v11 contextForIdentifier:self->_tipID];
    id v13 = self->_context;
    self->_context = v12;
  }
  correlationID = self->_correlationID;
  if (correlationID)
  {
    id v15 = correlationID;
    id v16 = self->_correlationID;
    self->_correlationID = v15;
  }
  else
  {
    id v16 = [(TPSAnalyticsEvent *)self dataProvider];
    objc_super v17 = [v16 correlationIDForIdentifier:self->_tipID];
    v18 = self->_correlationID;
    self->_correlationID = v17;
  }
  displayType = self->_displayType;
  if (displayType)
  {
    id v20 = displayType;
    objc_super v21 = self->_displayType;
    self->_displayType = v20;
  }
  else
  {
    objc_super v21 = [(TPSAnalyticsEvent *)self dataProvider];
    v22 = [v21 displayTypeForIdentifier:self->_tipID];
    v23 = self->_displayType;
    self->_displayType = v22;
  }
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventTipReadyToBeDisplayed;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, @"tip_ID", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_correlationID forKey:@"tip_correlation_ID"];
  [v4 encodeObject:self->_displayType forKey:@"display_type"];
  [v4 encodeObject:self->_bundleID forKey:@"bundle_ID"];
  [v4 encodeObject:self->_context forKey:@"context"];
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"tip_ready_to_be_displayed"];
}

- (id)mutableAnalyticsEventRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_tipID forKeyedSubscript:@"tip_ID"];
  [v3 setObject:self->_correlationID forKeyedSubscript:@"tip_correlation_ID"];
  [v3 setObject:self->_displayType forKeyedSubscript:@"display_type"];
  [v3 setObject:self->_bundleID forKeyedSubscript:@"bundle_ID"];
  [v3 setObject:self->_context forKeyedSubscript:@"context"];
  return v3;
}

- (NSString)tipID
{
  return self->_tipID;
}

- (void)setTipID:(id)a3
{
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
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_tipID, 0);
}

@end