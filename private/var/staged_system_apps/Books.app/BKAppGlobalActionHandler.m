@interface BKAppGlobalActionHandler
- (BKAppGlobalActionHandler)init;
- (BKAppGlobalActionHandler)initWithSceneManager:(id)a3;
- (BKAppGlobalActionHandlerDelegate)delegate;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (void)books_aboutKeyboardShortcuts:(id)a3;
- (void)books_aboutPrivacy:(id)a3;
- (void)books_aboutServicesAndSupport:(id)a3;
- (void)books_aboutTermsAndConditions:(id)a3;
- (void)books_import:(id)a3;
- (void)books_openRecent:(id)a3;
- (void)books_provideFeedback:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation BKAppGlobalActionHandler

- (void)setDelegate:(id)a3
{
}

- (BKAppGlobalActionHandler)initWithSceneManager:(id)a3
{
  return (BKAppGlobalActionHandler *)sub_10001A968((uint64_t)a3);
}

- (BKAppGlobalActionHandlerDelegate)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (BKAppGlobalActionHandlerDelegate *)Strong;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    v6 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  char v8 = sub_100260254((uint64_t)a3, (uint64_t)v10);

  sub_10005AFE8((uint64_t)v10, (uint64_t *)&unk_100B269C0);
  return v8 & 1;
}

- (void)books_openRecent:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_10026047C((uint64_t)v6);

  sub_10005AFE8((uint64_t)v6, (uint64_t *)&unk_100B269C0);
}

- (void)books_import:(id)a3
{
}

- (void)books_provideFeedback:(id)a3
{
}

- (void)books_aboutKeyboardShortcuts:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_100263240();

  sub_10005AFE8((uint64_t)v6, (uint64_t *)&unk_100B269C0);
}

- (void)books_aboutPrivacy:(id)a3
{
}

- (void)books_aboutTermsAndConditions:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    v5 = self;
  }
  sub_1007F6D10();
  v6 = (void *)sub_1007F6CE0();
  sub_1007F6CB0();

  sub_10005AFE8((uint64_t)v7, (uint64_t *)&unk_100B269C0);
}

- (void)books_aboutServicesAndSupport:(id)a3
{
  uint64_t v5 = sub_100058D18(&qword_100B27720);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    char v8 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v13, 0, sizeof(v13));
    v9 = self;
  }
  uint64_t v10 = sub_1007FE150();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  sub_1007FE100();
  uint64_t v11 = sub_1007FE0F0();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  *(void *)(v12 + 24) = &protocol witness table for MainActor;
  sub_10004BC14((uint64_t)v7, (uint64_t)&unk_100B27730, v12);

  swift_release();
  sub_10005AFE8((uint64_t)v13, (uint64_t *)&unk_100B269C0);
}

- (BKAppGlobalActionHandler)init
{
  result = (BKAppGlobalActionHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___BKAppGlobalActionHandler_delegate;

  sub_10023E454((uint64_t)v3);
}

@end