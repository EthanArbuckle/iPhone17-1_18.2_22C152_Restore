@interface JSSettingsItemToggle
- (NSString)description;
@end

@implementation JSSettingsItemToggle

- (NSString)description
{
  v2 = self;
  JSSettingsItemToggle.description.getter();

  NSString v3 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC11MusicJSCore20JSSettingsItemToggle__isToggled;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_DE0398);
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end