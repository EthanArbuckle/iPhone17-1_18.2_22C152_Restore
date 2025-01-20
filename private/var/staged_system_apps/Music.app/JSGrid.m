@interface JSGrid
@end

@implementation JSGrid

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore6JSGrid__sections;
  uint64_t v4 = sub_100063814(&qword_1010D54F0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11MusicJSCore6JSGrid_delegate;

  sub_100046744((uint64_t)v5);
}

@end