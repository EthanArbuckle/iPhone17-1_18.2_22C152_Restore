@interface RPBroadcastConfiguration
+ (BOOL)supportsSecureCoding;
- (NSDictionary)videoCompressionProperties;
- (NSTimeInterval)clipDuration;
- (RPBroadcastConfiguration)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setClipDuration:(NSTimeInterval)clipDuration;
- (void)setVideoCompressionProperties:(NSDictionary *)videoCompressionProperties;
@end

@implementation RPBroadcastConfiguration

- (RPBroadcastConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RPBroadcastConfiguration;
  v5 = [(RPBroadcastConfiguration *)&v11 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clipDuration"];
    [v6 doubleValue];
    v5->_clipDuration = v7;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"videoCompressionProperties"];
    videoCompressionProperties = v5->_videoCompressionProperties;
    v5->_videoCompressionProperties = (NSDictionary *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = +[NSNumber numberWithDouble:self->_clipDuration];
  [v7 encodeObject:v4 forKey:@"clipDuration"];

  v5 = [(NSDictionary *)self->_videoCompressionProperties allValues];
  id v6 = [v5 count];

  if (v6) {
    [v7 encodeObject:self->_videoCompressionProperties forKey:@"videoCompressionProperties"];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSTimeInterval)clipDuration
{
  return self->_clipDuration;
}

- (void)setClipDuration:(NSTimeInterval)clipDuration
{
  self->_clipDuration = clipDuration;
}

- (NSDictionary)videoCompressionProperties
{
  return self->_videoCompressionProperties;
}

- (void)setVideoCompressionProperties:(NSDictionary *)videoCompressionProperties
{
}

- (void).cxx_destruct
{
}

@end