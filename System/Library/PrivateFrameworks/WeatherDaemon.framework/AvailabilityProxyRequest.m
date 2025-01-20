@interface AvailabilityProxyRequest
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC13WeatherDaemon24AvailabilityProxyRequest)init;
- (_TtC13WeatherDaemon24AvailabilityProxyRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AvailabilityProxyRequest

+ (BOOL)supportsSecureCoding
{
  return static AvailabilityProxyRequest.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  AvailabilityProxyRequest.encode(with:)((NSCoder)v4);
}

- (_TtC13WeatherDaemon24AvailabilityProxyRequest)initWithCoder:(id)a3
{
  return (_TtC13WeatherDaemon24AvailabilityProxyRequest *)AvailabilityProxyRequest.init(coder:)(a3);
}

- (_TtC13WeatherDaemon24AvailabilityProxyRequest)init
{
}

- (void).cxx_destruct
{
}

@end