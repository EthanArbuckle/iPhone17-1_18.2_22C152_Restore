@interface AirQualityScaleProxyRequest
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC13WeatherDaemon27AirQualityScaleProxyRequest)init;
- (_TtC13WeatherDaemon27AirQualityScaleProxyRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AirQualityScaleProxyRequest

+ (BOOL)supportsSecureCoding
{
  return static AirQualityScaleProxyRequest.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  AirQualityScaleProxyRequest.encode(with:)((NSCoder)v4);
}

- (_TtC13WeatherDaemon27AirQualityScaleProxyRequest)initWithCoder:(id)a3
{
  return (_TtC13WeatherDaemon27AirQualityScaleProxyRequest *)AirQualityScaleProxyRequest.init(coder:)(a3);
}

- (_TtC13WeatherDaemon27AirQualityScaleProxyRequest)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC13WeatherDaemon27AirQualityScaleProxyRequest_options;
  sub_1A959E148((uint64_t)v3);
}

@end