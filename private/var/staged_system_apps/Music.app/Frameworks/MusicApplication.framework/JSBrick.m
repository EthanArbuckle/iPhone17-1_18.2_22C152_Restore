@interface JSBrick
@end

@implementation JSBrick

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore7JSBrick__items;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFED40);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end