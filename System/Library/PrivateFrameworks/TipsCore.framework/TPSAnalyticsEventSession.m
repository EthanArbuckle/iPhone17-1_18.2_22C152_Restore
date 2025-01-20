@interface TPSAnalyticsEventSession
+ (BOOL)supportsSecureCoding;
+ (id)eventWithCollectionsViewed:(int64_t)a3 tipsViewed:(int64_t)a4;
- (TPSAnalyticsEventSession)initWithCoder:(id)a3;
- (id)_initWithCollectionsViewed:(int64_t)a3 tipsViewed:(int64_t)a4;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (int64_t)collectionsViewed;
- (int64_t)tipsViewed;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TPSAnalyticsEventSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TPSAnalyticsEventSession;
  v5 = [(TPSAnalyticsEvent *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_collectionsViewed = [v4 decodeIntegerForKey:@"collections_viewed"];
    v5->_tipsViewed = [v4 decodeIntegerForKey:@"tips_viewed"];
  }

  return v5;
}

- (id)_initWithCollectionsViewed:(int64_t)a3 tipsViewed:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TPSAnalyticsEventSession;
  id result = [(TPSAnalyticsEvent *)&v7 initWithDate:0];
  if (result)
  {
    *((void *)result + 4) = a3;
    *((void *)result + 5) = a4;
  }
  return result;
}

+ (id)eventWithCollectionsViewed:(int64_t)a3 tipsViewed:(int64_t)a4
{
  id v4 = (void *)[objc_alloc((Class)a1) _initWithCollectionsViewed:a3 tipsViewed:a4];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventSession;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_collectionsViewed, @"collections_viewed", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_tipsViewed forKey:@"tips_viewed"];
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"session"];
}

- (id)mutableAnalyticsEventRepresentation
{
  v3 = objc_opt_new();
  id v4 = [NSNumber numberWithInteger:self->_collectionsViewed];
  [v3 setObject:v4 forKeyedSubscript:@"collections_viewed"];

  objc_super v5 = [NSNumber numberWithInteger:self->_tipsViewed];
  [v3 setObject:v5 forKeyedSubscript:@"tips_viewed"];

  v6 = objc_msgSend(NSNumber, "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  [v3 setObject:v6 forKeyedSubscript:@"u65_flag"];

  return v3;
}

- (int64_t)collectionsViewed
{
  return self->_collectionsViewed;
}

- (int64_t)tipsViewed
{
  return self->_tipsViewed;
}

@end