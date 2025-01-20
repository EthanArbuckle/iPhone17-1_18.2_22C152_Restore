@interface ReadingSettingsDataManager
- (_TtC8BookEPUB26ReadingSettingsDataManager)init;
@end

@implementation ReadingSettingsDataManager

- (_TtC8BookEPUB26ReadingSettingsDataManager)init
{
  result = (_TtC8BookEPUB26ReadingSettingsDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_4F924((uint64_t)self + OBJC_IVAR____TtC8BookEPUB26ReadingSettingsDataManager_delegate);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_39FCC((uint64_t)self + OBJC_IVAR____TtC8BookEPUB26ReadingSettingsDataManager_themeDatabaseManager);
  v3 = (char *)self + OBJC_IVAR____TtC8BookEPUB26ReadingSettingsDataManager_logger;
  uint64_t v4 = sub_2FB8A0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

@end