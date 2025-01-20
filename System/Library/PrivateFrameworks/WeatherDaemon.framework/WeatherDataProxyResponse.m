@interface WeatherDataProxyResponse
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC13WeatherDaemon24WeatherDataProxyResponse)init;
- (_TtC13WeatherDaemon24WeatherDataProxyResponse)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WeatherDataProxyResponse

+ (BOOL)supportsSecureCoding
{
  return static WeatherDataProxyResponse.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  WeatherDataProxyResponse.encode(with:)((NSCoder)v4);
}

- (_TtC13WeatherDaemon24WeatherDataProxyResponse)initWithCoder:(id)a3
{
  return (_TtC13WeatherDaemon24WeatherDataProxyResponse *)WeatherDataProxyResponse.init(coder:)(a3);
}

- (_TtC13WeatherDaemon24WeatherDataProxyResponse)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC13WeatherDaemon24WeatherDataProxyResponse_error;
  sub_1A95971B4((uint64_t)v3);
}

@end