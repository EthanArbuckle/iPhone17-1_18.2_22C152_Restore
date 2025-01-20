@interface JSShelf
@end

@implementation JSShelf

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore7JSShelf__sections;
  uint64_t v4 = sub_100063814(&qword_1010D2450);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11MusicJSCore7JSShelf_containerDetailLink);
}

@end