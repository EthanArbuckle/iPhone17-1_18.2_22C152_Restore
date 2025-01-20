@interface TPSAnalyticsEventTipTapped
+ (BOOL)supportsSecureCoding;
+ (id)eventWithTipID:(id)a3 correlationID:(id)a4;
+ (id)eventWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6;
- (NSString)bundleID;
- (NSString)context;
- (NSString)correlationID;
- (NSString)tipID;
- (TPSAnalyticsEventTipTapped)initWithCoder:(id)a3;
- (id)_initWithTipID:(id)a3 correlationID:(id)a4;
- (id)_initWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (unint64_t)displayType;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setContext:(id)a3;
- (void)setCorrelationID:(id)a3;
- (void)setDataProvider:(id)a3;
- (void)setTipID:(id)a3;
@end

@implementation TPSAnalyticsEventTipTapped

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventTipTapped)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TPSAnalyticsEventTipTapped;
  v5 = [(TPSAnalyticsEvent *)&v16 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_ID"];
    tipID = v5->_tipID;
    v5->_tipID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_correlation_ID"];
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSString *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"display_type"];
    v5->_displayType = [v10 unsignedIntegerValue];

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundle_ID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];
    context = v5->_context;
    v5->_context = (NSString *)v13;
  }
  return v5;
}

- (id)_initWithTipID:(id)a3 correlationID:(id)a4
{
  return [(TPSAnalyticsEventTipTapped *)self _initWithTipID:a3 correlationID:a4 bundleID:0 context:0];
}

- (id)_initWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TPSAnalyticsEventTipTapped;
  v15 = [(TPSAnalyticsEvent *)&v18 initWithDate:0];
  objc_super v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_tipID, a3);
    objc_storeStrong((id *)&v16->_correlationID, a4);
    v16->_displayType = 2;
    objc_storeStrong((id *)&v16->_bundleID, a5);
    objc_storeStrong((id *)&v16->_context, a6);
  }

  return v16;
}

+ (id)eventWithTipID:(id)a3 correlationID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)[objc_alloc((Class)a1) _initWithTipID:v7 correlationID:v6];

  return v8;
}

+ (id)eventWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)[objc_alloc((Class)a1) _initWithTipID:v13 correlationID:v12 bundleID:v11 context:v10];

  return v14;
}

- (void)setDataProvider:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)TPSAnalyticsEventTipTapped;
  [(TPSAnalyticsEvent *)&v19 setDataProvider:a3];
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
  correlationID = self->_correlationID;
  if (correlationID)
  {
    id v10 = correlationID;
    id v11 = self->_correlationID;
    self->_correlationID = v10;
  }
  else
  {
    id v11 = [(TPSAnalyticsEvent *)self dataProvider];
    id v12 = [v11 correlationIDForIdentifier:self->_tipID];
    id v13 = self->_correlationID;
    self->_correlationID = v12;
  }
  context = self->_context;
  if (context)
  {
    v15 = context;
    objc_super v16 = self->_context;
    self->_context = v15;
  }
  else
  {
    objc_super v16 = [(TPSAnalyticsEvent *)self dataProvider];
    v17 = [v16 contextForIdentifier:self->_tipID];
    objc_super v18 = self->_context;
    self->_context = v17;
  }
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPSAnalyticsEventTipTapped;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, @"tip_ID", v6.receiver, v6.super_class);
  [v4 encodeObject:self->_correlationID forKey:@"tip_correlation_ID"];
  v5 = [NSNumber numberWithUnsignedInteger:self->_displayType];
  [v4 encodeObject:v5 forKey:@"display_type"];

  [v4 encodeObject:self->_bundleID forKey:@"bundle_ID"];
  [v4 encodeObject:self->_context forKey:@"context"];
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"tip_tapped"];
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

- (unint64_t)displayType
{
  return self->_displayType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_tipID, 0);
}

@end