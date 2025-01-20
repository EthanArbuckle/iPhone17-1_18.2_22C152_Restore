@interface AvailabilityProxyResponse
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC13WeatherDaemon25AvailabilityProxyResponse)init;
- (_TtC13WeatherDaemon25AvailabilityProxyResponse)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AvailabilityProxyResponse

+ (BOOL)supportsSecureCoding
{
  return static AvailabilityProxyResponse.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  AvailabilityProxyResponse.encode(with:)((NSCoder)v4);
}

- (_TtC13WeatherDaemon25AvailabilityProxyResponse)initWithCoder:(id)a3
{
  return (_TtC13WeatherDaemon25AvailabilityProxyResponse *)AvailabilityProxyResponse.init(coder:)(a3);
}

- (_TtC13WeatherDaemon25AvailabilityProxyResponse)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC13WeatherDaemon25AvailabilityProxyResponse_error;
  sub_1A95971B4((uint64_t)v3);
}

@end