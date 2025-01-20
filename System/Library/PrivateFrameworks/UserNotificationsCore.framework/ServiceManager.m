@interface ServiceManager
- (NSString)description;
- (_TtC21UserNotificationsCore14ServiceManager)init;
- (void)categoryRepository:(id)a3 didChangeCategoriesForBundleIdentifier:(id)a4;
- (void)contentProtectionStateChangedForFirstUnlock:(BOOL)a3;
- (void)notificationRepository:(id)a3 didPerformUpdates:(id)a4 forBundleIdentifier:(id)a5;
@end

@implementation ServiceManager

- (_TtC21UserNotificationsCore14ServiceManager)init
{
  return (_TtC21UserNotificationsCore14ServiceManager *)ServiceManager.init()();
}

- (void).cxx_destruct
{
  sub_26093FEC8((uint64_t)self + OBJC_IVAR____TtC21UserNotificationsCore14ServiceManager_workingDirectory, (uint64_t *)&unk_26B3F7910);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore14ServiceManager_notificationService));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore14ServiceManager_settingsPersistenceListener));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore14ServiceManager_contentProtectionManager));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore14ServiceManager_coreServiceClient));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore14ServiceManager_systemServiceClient));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore14ServiceManager_attachmentsRepository));
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore14ServiceManager_idsCloudReceiver));
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore14ServiceManager_cloudSenderPriorityObserver));
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (void)contentProtectionStateChangedForFirstUnlock:(BOOL)a3
{
  v4 = self;
  ServiceManager.contentProtectionStateChanged(forFirstUnlock:)(a3);
}

- (void)notificationRepository:(id)a3 didPerformUpdates:(id)a4 forBundleIdentifier:(id)a5
{
  sub_2608DED7C(0, (unint64_t *)&unk_26B3FC9B0);
  unint64_t v7 = sub_260A84D70();
  uint64_t v8 = sub_260A84BC0();
  uint64_t v10 = v9;
  swift_unknownObjectRetain();
  v11 = self;
  ServiceManager.notificationRepository(_:didPerform:forBundleIdentifier:)((uint64_t)a3, v7, v8, v10);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)categoryRepository:(id)a3 didChangeCategoriesForBundleIdentifier:(id)a4
{
  uint64_t v5 = sub_260A84BC0();
  uint64_t v7 = v6;
  self;
  if (swift_dynamicCastObjCClass()
    || (uint64_t v8 = *(Class *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC21UserNotificationsCore14ServiceManager_systemServiceClient)) == 0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_unknownObjectRetain();
    uint64_t v9 = self;
    id v10 = v8;
    sub_260A76A00(v5, v7);
    swift_unknownObjectRelease();

    swift_bridgeObjectRelease();
  }
}

- (NSString)description
{
  v2 = self;
  ServiceManager.description.getter();

  v3 = (void *)sub_260A84BB0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

@end