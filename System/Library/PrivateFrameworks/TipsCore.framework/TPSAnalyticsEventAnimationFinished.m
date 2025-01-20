@interface TPSAnalyticsEventAnimationFinished
+ (BOOL)supportsSecureCoding;
+ (id)eventWithTipID:(id)a3 animationFinished:(BOOL)a4 animationSource:(id)a5 collectionID:(id)a6 correlationID:(id)a7;
- (BOOL)animationFinished;
- (NSString)animationSource;
- (NSString)collectionID;
- (NSString)correlationID;
- (NSString)tipID;
- (TPSAnalyticsEventAnimationFinished)initWithCoder:(id)a3;
- (id)_initWithTipID:(id)a3 animationFinished:(BOOL)a4 animationSource:(id)a5 collectionID:(id)a6 correlationID:(id)a7;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setAnimationFinished:(BOOL)a3;
- (void)setCollectionID:(id)a3;
- (void)setCorrelationID:(id)a3;
- (void)setTipID:(id)a3;
@end

@implementation TPSAnalyticsEventAnimationFinished

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventAnimationFinished)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TPSAnalyticsEventAnimationFinished;
  v5 = [(TPSAnalyticsEvent *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_ID"];
    tipID = v5->_tipID;
    v5->_tipID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"animation_source"];
    animationSource = v5->_animationSource;
    v5->_animationSource = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"collection_ID"];
    collectionID = v5->_collectionID;
    v5->_collectionID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_correlation_ID"];
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSString *)v12;

    v5->_animationFinished = [v4 decodeBoolForKey:@"animation_finished"];
  }

  return v5;
}

- (id)_initWithTipID:(id)a3 animationFinished:(BOOL)a4 animationSource:(id)a5 collectionID:(id)a6 correlationID:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)TPSAnalyticsEventAnimationFinished;
  v17 = [(TPSAnalyticsEvent *)&v20 initWithDate:0];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_tipID, a3);
    objc_storeStrong((id *)&v18->_animationSource, a5);
    v18->_animationFinished = a4;
    objc_storeStrong((id *)&v18->_collectionID, a6);
    objc_storeStrong((id *)&v18->_correlationID, a7);
  }

  return v18;
}

+ (id)eventWithTipID:(id)a3 animationFinished:(BOOL)a4 animationSource:(id)a5 collectionID:(id)a6 correlationID:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  id v16 = (void *)[objc_alloc((Class)a1) _initWithTipID:v15 animationFinished:v9 animationSource:v14 collectionID:v13 correlationID:v12];

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventAnimationFinished;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, @"tip_ID", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_animationSource forKey:@"animation_source"];
  [v4 encodeObject:self->_collectionID forKey:@"collection_ID"];
  [v4 encodeObject:self->_correlationID forKey:@"tip_correlation_ID"];
  [v4 encodeBool:self->_animationFinished forKey:@"animation_finished"];
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"animation_finished"];
}

- (id)mutableAnalyticsEventRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(TPSAnalyticsEventAnimationFinished *)self tipID];
  [v3 setObject:v4 forKeyedSubscript:@"tip_ID"];

  objc_super v5 = [NSNumber numberWithBool:self->_animationFinished];
  [v3 setObject:v5 forKeyedSubscript:@"animation_finished"];

  uint64_t v6 = [(TPSAnalyticsEventAnimationFinished *)self animationSource];
  [v3 setObject:v6 forKeyedSubscript:@"animation_source"];

  v7 = [(TPSAnalyticsEventAnimationFinished *)self collectionID];
  [v3 setObject:v7 forKeyedSubscript:@"collection_ID"];

  uint64_t v8 = [(TPSAnalyticsEventAnimationFinished *)self correlationID];
  [v3 setObject:v8 forKeyedSubscript:@"tip_correlation_ID"];

  BOOL v9 = objc_msgSend(NSNumber, "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  [v3 setObject:v9 forKeyedSubscript:@"u65_flag"];

  return v3;
}

- (BOOL)animationFinished
{
  return self->_animationFinished;
}

- (void)setAnimationFinished:(BOOL)a3
{
  self->_animationFinished = a3;
}

- (NSString)animationSource
{
  return self->_animationSource;
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
  objc_storeStrong((id *)&self->_animationSource, 0);
}

@end