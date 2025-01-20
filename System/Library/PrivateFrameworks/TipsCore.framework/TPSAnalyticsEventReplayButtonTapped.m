@interface TPSAnalyticsEventReplayButtonTapped
+ (BOOL)supportsSecureCoding;
+ (id)eventWithTipID:(id)a3 collectionID:(id)a4 correlationID:(id)a5;
- (NSString)collectionID;
- (NSString)correlationID;
- (NSString)tipID;
- (TPSAnalyticsEventReplayButtonTapped)initWithCoder:(id)a3;
- (id)_initWithTipID:(id)a3 collectionID:(id)a4 correlationID:(id)a5;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setCollectionID:(id)a3;
- (void)setCorrelationID:(id)a3;
- (void)setTipID:(id)a3;
@end

@implementation TPSAnalyticsEventReplayButtonTapped

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventReplayButtonTapped)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TPSAnalyticsEventReplayButtonTapped;
  v5 = [(TPSAnalyticsEvent *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_ID"];
    tipID = v5->_tipID;
    v5->_tipID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_collection_ID"];
    collectionID = v5->_collectionID;
    v5->_collectionID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_correlation_ID"];
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSString *)v10;
  }
  return v5;
}

- (id)_initWithTipID:(id)a3 collectionID:(id)a4 correlationID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [MEMORY[0x1E4F1C9C8] date];
  v15.receiver = self;
  v15.super_class = (Class)TPSAnalyticsEventReplayButtonTapped;
  objc_super v13 = [(TPSAnalyticsEvent *)&v15 initWithDate:v12];

  if (v13)
  {
    objc_storeStrong((id *)&v13->_tipID, a3);
    objc_storeStrong((id *)&v13->_collectionID, a4);
    objc_storeStrong((id *)&v13->_correlationID, a5);
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

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventReplayButtonTapped;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, @"tip_ID", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_collectionID forKey:@"tip_collection_ID"];
  [v4 encodeObject:self->_correlationID forKey:@"tip_correlation_ID"];
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"replay_button"];
}

- (id)mutableAnalyticsEventRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(TPSAnalyticsEventReplayButtonTapped *)self tipID];
  [v3 setObject:v4 forKeyedSubscript:@"tip_ID"];

  objc_super v5 = [(TPSAnalyticsEventReplayButtonTapped *)self collectionID];
  [v3 setObject:v5 forKeyedSubscript:@"tip_collection_ID"];

  uint64_t v6 = [(TPSAnalyticsEventReplayButtonTapped *)self correlationID];
  [v3 setObject:v6 forKeyedSubscript:@"tip_correlation_ID"];

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

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
}

- (NSString)correlationID
{
  return self->_correlationID;
}

- (void)setCorrelationID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
  objc_storeStrong((id *)&self->_tipID, 0);
}

@end