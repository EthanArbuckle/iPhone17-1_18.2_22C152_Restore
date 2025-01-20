@interface BKAppAccountActionHandler
- (BKAppAccountActionHandler)init;
- (BKAppAccountActionHandler)initWithSceneManager:(id)a3;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4;
- (void)books_authorizeThisComputer:(id)a3;
- (void)books_deauthorizeThisComputer:(id)a3;
- (void)books_toggleSignedIn:(id)a3;
- (void)books_viewMyAccount:(id)a3;
- (void)dealloc;
- (void)validateCommand:(id)a3;
@end

@implementation BKAppAccountActionHandler

- (BKAppAccountActionHandler)initWithSceneManager:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1007F6D10();
  id v5 = a3;
  v6 = (void *)sub_1007F6CE0();
  id v7 = [self sharedProvider];
  id v8 = objc_allocWithZone(ObjectType);
  v9 = (BKAppAccountActionHandler *)sub_10001F4D8(v5, v6, v7);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v9;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKAppAccountActionHandler_accountsProvider);
  id v5 = self;
  [v4 removeObserver:v5 accountTypes:1];
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(BKAppAccountActionHandler *)&v6 dealloc];
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKAppAccountActionHandler_accountsProvider);
}

- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4
{
  uint64_t v5 = sub_100058D18(&qword_100B27720);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1007FE150();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_1007FE100();
  v9 = self;
  uint64_t v10 = sub_1007FE0F0();
  v11 = (void *)swift_allocObject();
  v11[2] = v10;
  v11[3] = &protocol witness table for MainActor;
  v11[4] = v9;
  sub_10004BC14((uint64_t)v7, (uint64_t)&unk_100B3B970, (uint64_t)v11);

  swift_release();
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    uint64_t v6 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v7 = self;
  }
  char v8 = sub_100592320((uint64_t)a3, (uint64_t)v10);

  sub_10006CA38((uint64_t)v10);
  return v8 & 1;
}

- (void)validateCommand:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100592554(v4);
}

- (void)books_authorizeThisComputer:(id)a3
{
}

- (void)books_deauthorizeThisComputer:(id)a3
{
}

- (void)books_toggleSignedIn:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    uint64_t v5 = self;
  }
  sub_100592CA4();

  sub_10006CA38((uint64_t)v6);
}

- (void)books_viewMyAccount:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v6 = 0u;
    long long v7 = 0u;
    uint64_t v5 = self;
  }
  [*(id *)((char *)&self->super.super.isa + OBJC_IVAR___BKAppAccountActionHandler_sceneManager) requestAccountInfoScene:v6, v7];

  sub_10006CA38((uint64_t)&v6);
}

- (BKAppAccountActionHandler)init
{
  result = (BKAppAccountActionHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end