@interface TPSAnalyticsEventAnimationLoadTime
+ (BOOL)supportsSecureCoding;
+ (id)eventWithTipID:(id)a3 animationLoadTime:(double)a4;
- (NSString)tipID;
- (TPSAnalyticsEventAnimationLoadTime)initWithCoder:(id)a3;
- (double)animationLoadTime;
- (id)_initWithTipID:(id)a3 animationLoadTime:(double)a4;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setAnimationLoadTime:(double)a3;
- (void)setTipID:(id)a3;
@end

@implementation TPSAnalyticsEventAnimationLoadTime

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventAnimationLoadTime)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TPSAnalyticsEventAnimationLoadTime;
  v5 = [(TPSAnalyticsEvent *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_ID"];
    tipID = v5->_tipID;
    v5->_tipID = (NSString *)v6;

    [v4 decodeDoubleForKey:@"animation_load_time"];
    v5->_animationLoadTime = v8;
  }

  return v5;
}

- (id)_initWithTipID:(id)a3 animationLoadTime:(double)a4
{
  id v7 = a3;
  double v8 = [MEMORY[0x1E4F1C9C8] date];
  v11.receiver = self;
  v11.super_class = (Class)TPSAnalyticsEventAnimationLoadTime;
  v9 = [(TPSAnalyticsEvent *)&v11 initWithDate:v8];

  if (v9)
  {
    objc_storeStrong((id *)&v9->_tipID, a3);
    v9->_animationLoadTime = a4;
  }

  return v9;
}

+ (id)eventWithTipID:(id)a3 animationLoadTime:(double)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)a1) _initWithTipID:v6 animationLoadTime:a4];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventAnimationLoadTime;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, @"tip_ID", v5.receiver, v5.super_class);
  [v4 encodeDouble:@"animation_load_time" forKey:self->_animationLoadTime];
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"animation_load_time"];
}

- (id)mutableAnalyticsEventRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_tipID forKeyedSubscript:@"tip_ID"];
  id v4 = [NSNumber numberWithDouble:ceil(self->_animationLoadTime)];
  [v3 setObject:v4 forKeyedSubscript:@"animation_load_time"];

  objc_super v5 = objc_msgSend(NSNumber, "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  [v3 setObject:v5 forKeyedSubscript:@"u65_flag"];

  return v3;
}

- (NSString)tipID
{
  return self->_tipID;
}

- (void)setTipID:(id)a3
{
}

- (double)animationLoadTime
{
  return self->_animationLoadTime;
}

- (void)setAnimationLoadTime:(double)a3
{
  self->_animationLoadTime = a3;
}

- (void).cxx_destruct
{
}

@end