@interface JSGridSection
- (NSString)description;
@end

@implementation JSGridSection

- (NSString)description
{
  v2 = self;
  JSGridSection.description.getter();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  NSString v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore13JSGridSection_delegate;

  sub_100046744((uint64_t)v3);
}

@end