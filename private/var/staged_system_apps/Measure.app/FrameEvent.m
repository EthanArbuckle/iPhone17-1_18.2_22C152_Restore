@interface FrameEvent
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC7Measure10FrameEvent)init;
- (_TtC7Measure10FrameEvent)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FrameEvent

- (NSString)description
{
  v2 = self;
  sub_10017EB70();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC7Measure10FrameEvent)initWithCoder:(id)a3
{
  sub_10017EDB0(a3);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10017F094(v4);
}

- (_TtC7Measure10FrameEvent)init
{
  result = (_TtC7Measure10FrameEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end