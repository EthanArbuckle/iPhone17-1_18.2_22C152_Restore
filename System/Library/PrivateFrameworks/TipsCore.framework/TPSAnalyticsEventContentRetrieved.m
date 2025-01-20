@interface TPSAnalyticsEventContentRetrieved
+ (BOOL)supportsSecureCoding;
+ (id)eventWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6 serviceError:(id)a7;
+ (id)eventWithTipID:(id)a3 correlationID:(id)a4 serviceError:(id)a5;
- (NSString)bundleID;
- (NSString)context;
- (NSString)correlationID;
- (NSString)serviceError;
- (NSString)tipID;
- (TPSAnalyticsEventContentRetrieved)initWithCoder:(id)a3;
- (id)_initWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6 serviceError:(id)a7;
- (id)_initWithTipID:(id)a3 correlationID:(id)a4 serviceError:(id)a5;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setContext:(id)a3;
- (void)setCorrelationID:(id)a3;
- (void)setDataProvider:(id)a3;
- (void)setServiceError:(id)a3;
- (void)setTipID:(id)a3;
@end

@implementation TPSAnalyticsEventContentRetrieved

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventContentRetrieved)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TPSAnalyticsEventContentRetrieved;
  v5 = [(TPSAnalyticsEvent *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_ID"];
    tipID = v5->_tipID;
    v5->_tipID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_correlation_ID"];
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];
    context = v5->_context;
    v5->_context = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundle_ID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"service_error"];
    serviceError = v5->_serviceError;
    v5->_serviceError = (NSString *)v14;
  }
  return v5;
}

- (id)_initWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6 serviceError:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)TPSAnalyticsEventContentRetrieved;
  objc_super v17 = [(TPSAnalyticsEvent *)&v21 initWithDate:0];
  p_isa = (id *)&v17->super.super.isa;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_tipID, a3);
    objc_storeStrong(p_isa + 5, a4);
    objc_storeStrong(p_isa + 6, a5);
    objc_storeStrong(p_isa + 7, a6);
    objc_storeStrong(p_isa + 8, a7);
  }

  return p_isa;
}

- (id)_initWithTipID:(id)a3 correlationID:(id)a4 serviceError:(id)a5
{
  return [(TPSAnalyticsEventContentRetrieved *)self _initWithTipID:a3 correlationID:a4 bundleID:0 context:0 serviceError:a5];
}

+ (id)eventWithTipID:(id)a3 correlationID:(id)a4 serviceError:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) _initWithTipID:v10 correlationID:v9 serviceError:v8];

  return v11;
}

+ (id)eventWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6 serviceError:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  objc_super v17 = (void *)[objc_alloc((Class)a1) _initWithTipID:v16 correlationID:v15 bundleID:v14 context:v13 serviceError:v12];

  return v17;
}

- (void)setDataProvider:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)TPSAnalyticsEventContentRetrieved;
  [(TPSAnalyticsEvent *)&v19 setDataProvider:a3];
  correlationID = self->_correlationID;
  if (correlationID)
  {
    v5 = correlationID;
    uint64_t v6 = self->_correlationID;
    self->_correlationID = v5;
  }
  else
  {
    uint64_t v6 = [(TPSAnalyticsEvent *)self dataProvider];
    v7 = [v6 correlationIDForIdentifier:self->_tipID];
    id v8 = self->_correlationID;
    self->_correlationID = v7;
  }
  bundleID = self->_bundleID;
  if (bundleID)
  {
    id v10 = bundleID;
    v11 = self->_bundleID;
    self->_bundleID = v10;
  }
  else
  {
    v11 = [(TPSAnalyticsEvent *)self dataProvider];
    id v12 = [v11 bundleIDForIdentifier:self->_tipID];
    id v13 = self->_bundleID;
    self->_bundleID = v12;
  }
  context = self->_context;
  if (context)
  {
    id v15 = context;
    id v16 = self->_context;
    self->_context = v15;
  }
  else
  {
    id v16 = [(TPSAnalyticsEvent *)self dataProvider];
    objc_super v17 = [v16 contextForIdentifier:self->_tipID];
    v18 = self->_context;
    self->_context = v17;
  }
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventContentRetrieved;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, @"tip_ID", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_correlationID forKey:@"tip_correlation_ID"];
  [v4 encodeObject:self->_context forKey:@"context"];
  [v4 encodeObject:self->_bundleID forKey:@"bundle_ID"];
  [v4 encodeObject:self->_serviceError forKey:@"service_error"];
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"content_retrieved"];
}

- (id)mutableAnalyticsEventRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_tipID forKeyedSubscript:@"tip_ID"];
  [v3 setObject:self->_correlationID forKeyedSubscript:@"tip_correlation_ID"];
  [v3 setObject:self->_context forKeyedSubscript:@"context"];
  [v3 setObject:self->_bundleID forKeyedSubscript:@"bundle_ID"];
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

- (NSString)serviceError
{
  return self->_serviceError;
}

- (void)setServiceError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceError, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_tipID, 0);
}

@end