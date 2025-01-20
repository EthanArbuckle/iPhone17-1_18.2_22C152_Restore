@interface SearchInteractor
- (_TtC8BookEPUB16SearchInteractor)init;
@end

@implementation SearchInteractor

- (_TtC8BookEPUB16SearchInteractor)init
{
  result = (_TtC8BookEPUB16SearchInteractor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_4F924((uint64_t)self + OBJC_IVAR____TtC8BookEPUB16SearchInteractor_delegate);
  v3 = (char *)self + OBJC_IVAR____TtC8BookEPUB16SearchInteractor_log;
  uint64_t v4 = sub_2FB8A0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_unknownObjectRelease();
}

@end