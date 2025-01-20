@interface LiveActivityScheduleRequest
+ (BOOL)supportsSecureCoding;
- (_TtC10NewsDaemon27LiveActivityScheduleRequest)init;
- (_TtC10NewsDaemon27LiveActivityScheduleRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LiveActivityScheduleRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  LiveActivityScheduleRequest.encode(with:)((NSCoder)v4);
}

- (_TtC10NewsDaemon27LiveActivityScheduleRequest)initWithCoder:(id)a3
{
  return (_TtC10NewsDaemon27LiveActivityScheduleRequest *)LiveActivityScheduleRequest.init(coder:)(a3);
}

- (_TtC10NewsDaemon27LiveActivityScheduleRequest)init
{
  result = (_TtC10NewsDaemon27LiveActivityScheduleRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC10NewsDaemon27LiveActivityScheduleRequest_options;

  sub_1E00F4DB8((uint64_t)v3);
}

@end