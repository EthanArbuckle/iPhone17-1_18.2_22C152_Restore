@interface JSFlowcase
@end

@implementation JSFlowcase

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC11MusicJSCore10JSFlowcase__items;
  uint64_t v3 = sub_100063814(&qword_1010D5370);
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end