@interface TPSAnalyticsEventTipSaved
+ (BOOL)supportsSecureCoding;
+ (id)eventWithTipID:(id)a3 saved:(BOOL)a4 correlationID:(id)a5 collectionID:(id)a6;
- (BOOL)saved;
- (NSString)collectionID;
- (NSString)correlationID;
- (NSString)tipID;
- (TPSAnalyticsEventTipSaved)initWithCoder:(id)a3;
- (id)_initWithTipID:(id)a3 saved:(BOOL)a4 correlationID:(id)a5 collectionID:(id)a6;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setCollectionID:(id)a3;
- (void)setCorrelationID:(id)a3;
- (void)setSaved:(BOOL)a3;
- (void)setTipID:(id)a3;
@end

@implementation TPSAnalyticsEventTipSaved

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventTipSaved)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TPSAnalyticsEventTipSaved;
  v5 = [(TPSAnalyticsEvent *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_ID"];
    tipID = v5->_tipID;
    v5->_tipID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_correlation_ID"];
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"collection_ID"];
    collectionID = v5->_collectionID;
    v5->_collectionID = (NSString *)v10;

    v5->_saved = [v4 decodeBoolForKey:@"save_flag"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventTipSaved;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, @"tip_ID", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_correlationID forKey:@"tip_correlation_ID"];
  [v4 encodeObject:self->_collectionID forKey:@"collection_ID"];
  [v4 encodeBool:self->_saved forKey:@"save_flag"];
}

- (id)_initWithTipID:(id)a3 saved:(BOOL)a4 correlationID:(id)a5 collectionID:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v14 = [MEMORY[0x1E4F1C9C8] date];
  v17.receiver = self;
  v17.super_class = (Class)TPSAnalyticsEventTipSaved;
  v15 = [(TPSAnalyticsEvent *)&v17 initWithDate:v14];

  if (v15)
  {
    objc_storeStrong((id *)&v15->_tipID, a3);
    v15->_saved = a4;
    objc_storeStrong((id *)&v15->_correlationID, a5);
    objc_storeStrong((id *)&v15->_collectionID, a6);
  }

  return v15;
}

+ (id)eventWithTipID:(id)a3 saved:(BOOL)a4 correlationID:(id)a5 collectionID:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = (void *)[objc_alloc((Class)a1) _initWithTipID:v12 saved:v7 correlationID:v11 collectionID:v10];

  return v13;
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"tip_saved"];
}

- (id)mutableAnalyticsEventRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(TPSAnalyticsEventTipSaved *)self tipID];
  [v3 setObject:v4 forKeyedSubscript:@"tip_ID"];

  objc_super v5 = [(TPSAnalyticsEventTipSaved *)self correlationID];
  [v3 setObject:v5 forKeyedSubscript:@"tip_correlation_ID"];

  uint64_t v6 = [(TPSAnalyticsEventTipSaved *)self collectionID];
  [v3 setObject:v6 forKeyedSubscript:@"collection_ID"];

  BOOL v7 = objc_msgSend(NSNumber, "numberWithBool:", -[TPSAnalyticsEventTipSaved saved](self, "saved"));
  [v3 setObject:v7 forKeyedSubscript:@"save_flag"];

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  [v3 setObject:v8 forKeyedSubscript:@"u65_flag"];

  return v3;
}

- (BOOL)saved
{
  return self->_saved;
}

- (void)setSaved:(BOOL)a3
{
  self->_saved = a3;
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

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionID, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_tipID, 0);
}

@end