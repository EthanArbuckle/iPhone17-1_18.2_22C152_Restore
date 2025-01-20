@interface JSSettingsItemToggle
- (NSString)description;
@end

@implementation JSSettingsItemToggle

- (NSString)description
{
  v2 = self;
  JSSettingsItemToggle.description.getter();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC11MusicJSCore20JSSettingsItemToggle__isToggled;
  uint64_t v3 = sub_100063814(&qword_10109C180);
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end