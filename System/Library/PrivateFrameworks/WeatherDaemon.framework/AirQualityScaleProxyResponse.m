@interface AirQualityScaleProxyResponse
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC13WeatherDaemon28AirQualityScaleProxyResponse)init;
- (_TtC13WeatherDaemon28AirQualityScaleProxyResponse)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AirQualityScaleProxyResponse

+ (BOOL)supportsSecureCoding
{
  return static AirQualityScaleProxyResponse.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  AirQualityScaleProxyResponse.encode(with:)((NSCoder)v4);
}

- (_TtC13WeatherDaemon28AirQualityScaleProxyResponse)initWithCoder:(id)a3
{
  return (_TtC13WeatherDaemon28AirQualityScaleProxyResponse *)AirQualityScaleProxyResponse.init(coder:)(a3);
}

- (_TtC13WeatherDaemon28AirQualityScaleProxyResponse)init
{
}

- (void).cxx_destruct
{
  sub_1A95654FC((uint64_t)self + OBJC_IVAR____TtC13WeatherDaemon28AirQualityScaleProxyResponse_scale, (uint64_t)v3, &qword_1EB6DB100);
  sub_1A95C1B88(v3, sub_1A95C1BF4);
  sub_1A95971B4((uint64_t)self + OBJC_IVAR____TtC13WeatherDaemon28AirQualityScaleProxyResponse_error);
}

@end