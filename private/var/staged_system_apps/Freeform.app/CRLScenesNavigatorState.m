@interface CRLScenesNavigatorState
- (_TtC8Freeform23CRLScenesNavigatorState)init;
@end

@implementation CRLScenesNavigatorState

- (_TtC8Freeform23CRLScenesNavigatorState)init
{
  return (_TtC8Freeform23CRLScenesNavigatorState *)sub_10080F38C();
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform23CRLScenesNavigatorState__isOpen;
  uint64_t v4 = sub_1005057FC(&qword_10169FCE0);
  v6 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v6)((void *)(v4 - 8), v3, v4);
  v6((char *)self + OBJC_IVAR____TtC8Freeform23CRLScenesNavigatorState__isCompactUI, v4);
  v6((char *)self + OBJC_IVAR____TtC8Freeform23CRLScenesNavigatorState__isLandscapeUI, v4);
  v5 = (char *)self + OBJC_IVAR____TtC8Freeform23CRLScenesNavigatorState__areNavigatorButtonsEnabled;

  v6(v5, v4);
}

@end