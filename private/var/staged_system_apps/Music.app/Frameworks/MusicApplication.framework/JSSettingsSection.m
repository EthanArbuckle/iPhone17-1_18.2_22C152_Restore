@interface JSSettingsSection
- (NSString)description;
@end

@implementation JSSettingsSection

- (NSString)description
{
  v2 = self;
  JSContainerDetailLink.description.getter();

  NSString v3 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  NSString v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore17JSSettingsSection__items;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_E006F8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11MusicJSCore17JSSettingsSection__headerText;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFDB48);
  v8 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v8)((void *)(v6 - 8), v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC11MusicJSCore17JSSettingsSection__footerText;

  v8(v7, v6);
}

@end