@interface JSGrid
@end

@implementation JSGrid

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore6JSGrid__sections;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFFC00);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11MusicJSCore6JSGrid_delegate;

  sub_1A500((uint64_t)v5);
}

@end