@interface ConnectionManager
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC13appleaccountd17ConnectionManager)init;
- (void)dealloc;
@end

@implementation ConnectionManager

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_100007DD4(v6, v7);

  return v9 & 1;
}

- (_TtC13appleaccountd17ConnectionManager)init
{
  return (_TtC13appleaccountd17ConnectionManager *)sub_1001B4550();
}

- (void)dealloc
{
  v2 = self;
  sub_1001B6314();
}

- (void).cxx_destruct
{
  sub_100008EA8((uint64_t)self + OBJC_IVAR____TtC13appleaccountd17ConnectionManager_custodianDefaults);
  sub_100008EA8((uint64_t)self + OBJC_IVAR____TtC13appleaccountd17ConnectionManager_healthScheduler);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13appleaccountd17ConnectionManager_custodianServiceListener));
  sub_100008EA8((uint64_t)self + OBJC_IVAR____TtC13appleaccountd17ConnectionManager_trustedContactsPreflightScheduler);
  swift_release();
  swift_unknownObjectRelease();

  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC13appleaccountd17ConnectionManager__syncManager;
  uint64_t v4 = sub_100009F04((uint64_t *)&unk_10032ACE0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13appleaccountd17ConnectionManager_notificationServiceListener));

  swift_release();
}

@end