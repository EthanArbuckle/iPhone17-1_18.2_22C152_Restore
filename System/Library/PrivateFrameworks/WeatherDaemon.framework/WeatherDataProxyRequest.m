@interface WeatherDataProxyRequest
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC13WeatherDaemon23WeatherDataProxyRequest)init;
- (_TtC13WeatherDaemon23WeatherDataProxyRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WeatherDataProxyRequest

+ (BOOL)supportsSecureCoding
{
  return static WeatherDataProxyRequest.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  WeatherDataProxyRequest.encode(with:)((NSCoder)v4);
}

- (_TtC13WeatherDaemon23WeatherDataProxyRequest)initWithCoder:(id)a3
{
  return (_TtC13WeatherDaemon23WeatherDataProxyRequest *)WeatherDataProxyRequest.init(coder:)(a3);
}

- (_TtC13WeatherDaemon23WeatherDataProxyRequest)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC13WeatherDaemon23WeatherDataProxyRequest_options;
  sub_1A959E148((uint64_t)v3);
}

@end