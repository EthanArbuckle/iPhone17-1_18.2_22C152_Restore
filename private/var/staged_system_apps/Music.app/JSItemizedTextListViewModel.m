@interface JSItemizedTextListViewModel
@end

@implementation JSItemizedTextListViewModel

- (void).cxx_destruct
{
  sub_100046744((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore27JSItemizedTextListViewModel_delegate);
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore27JSItemizedTextListViewModel__items;
  uint64_t v4 = sub_100063814(&qword_1010D4288);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end