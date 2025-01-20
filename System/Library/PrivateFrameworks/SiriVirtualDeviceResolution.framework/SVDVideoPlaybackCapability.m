@interface SVDVideoPlaybackCapability
+ (BOOL)supportsSecureCoding;
+ (id)capabilityDescriptionMatchingSupportStatus:(int64_t)a3;
- (SVDVideoPlaybackCapability)initWithCoder:(id)a3;
- (SVDVideoPlaybackCapability)initWithStatus:(int64_t)a3;
- (id)_swiftBacking;
- (int64_t)supportsVideoPlayback;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVDVideoPlaybackCapability

- (void).cxx_destruct
{
}

- (SVDVideoPlaybackCapability)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVDVideoPlaybackCapability;
  v5 = [(SVDVideoPlaybackCapability *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVDVideoPlaybackCapabilityBacking"];
    backing = v5->_backing;
    v5->_backing = (_TtC27SiriVirtualDeviceResolution23VideoPlaybackCapability *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)_swiftBacking
{
  return self->_backing;
}

- (int64_t)supportsVideoPlayback
{
  return [(VideoPlaybackCapability *)self->_backing supportsVideoPlayback];
}

- (SVDVideoPlaybackCapability)initWithStatus:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SVDVideoPlaybackCapability;
  id v4 = [(SVDVideoPlaybackCapability *)&v8 init];
  if (v4)
  {
    v5 = [[_TtC27SiriVirtualDeviceResolution23VideoPlaybackCapability alloc] initWithStatus:a3];
    backing = v4->_backing;
    v4->_backing = v5;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)capabilityDescriptionMatchingSupportStatus:(int64_t)a3
{
  v3 = +[VideoPlaybackCapability capabilityDescriptionMatchingSupportStatus:a3];
  id v4 = [[SVDCapabilityDescription alloc] initWithBacking:v3];

  return v4;
}

@end