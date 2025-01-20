@interface TPSAnalyticsEventTipTimeSpent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithTipID:(id)a3 collectionID:(id)a4 correlationID:(id)a5;
- (NSString)collectionID;
- (NSString)correlationID;
- (NSString)tipID;
- (TPSAnalyticsEventTipTimeSpent)initWithCoder:(id)a3;
- (double)timeSpent;
- (id)_initWithTipID:(id)a3 collectionID:(id)a4 correlationID:(id)a5;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setCollectionID:(id)a3;
- (void)setCorrelationID:(id)a3;
- (void)setTimeSpent:(double)a3;
- (void)setTipID:(id)a3;
@end

@implementation TPSAnalyticsEventTipTimeSpent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventTipTimeSpent)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TPSAnalyticsEventTipTimeSpent;
  v5 = [(TPSAnalyticsEvent *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"tip_ID"];
    tipID = v5->_tipID;
    v5->_tipID = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:v6 forKey:@"collection_ID"];
    collectionID = v5->_collectionID;
    v5->_collectionID = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:v6 forKey:@"tip_correlation_ID"];
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSString *)v11;

    [v4 decodeDoubleForKey:@"time_spent"];
    v5->_timeSpent = v13;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventTipTimeSpent;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, @"tip_ID", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_collectionID forKey:@"collection_ID"];
  [v4 encodeObject:self->_correlationID forKey:@"tip_correlation_ID"];
  [v4 encodeDouble:@"time_spent" forKey:self->_timeSpent];
}

- (id)_initWithTipID:(id)a3 collectionID:(id)a4 correlationID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [MEMORY[0x1E4F1C9C8] date];
  v15.receiver = self;
  v15.super_class = (Class)TPSAnalyticsEventTipTimeSpent;
  double v13 = [(TPSAnalyticsEvent *)&v15 initWithDate:v12];

  if (v13)
  {
    objc_storeStrong((id *)&v13->_tipID, a3);
    objc_storeStrong((id *)&v13->_collectionID, a4);
    objc_storeStrong((id *)&v13->_correlationID, a5);
    v13->_timeSpent = 0.0;
  }

  return v13;
}

+ (id)eventWithTipID:(id)a3 collectionID:(id)a4 correlationID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) _initWithTipID:v10 collectionID:v9 correlationID:v8];

  return v11;
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"time_spent"];
}

- (id)mutableAnalyticsEventRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_tipID forKeyedSubscript:@"tip_ID"];
  [v3 setObject:self->_correlationID forKeyedSubscript:@"tip_correlation_ID"];
  [v3 setObject:self->_collectionID forKeyedSubscript:@"collection_ID"];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  [v3 setObject:v4 forKeyedSubscript:@"u65_flag"];

  objc_super v5 = [NSNumber numberWithInteger:(uint64_t)self->_timeSpent];
  [v3 setObject:v5 forKeyedSubscript:@"time_spent"];

  return v3;
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
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

- (double)timeSpent
{
  return self->_timeSpent;
}

- (void)setTimeSpent:(double)a3
{
  self->_timeSpent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_tipID, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
}

@end