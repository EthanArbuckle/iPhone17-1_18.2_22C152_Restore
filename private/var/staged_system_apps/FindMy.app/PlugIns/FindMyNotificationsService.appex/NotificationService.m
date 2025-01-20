@interface NotificationService
- (_TtC26FindMyNotificationsService19NotificationService)init;
- (void)dealloc;
- (void)didReceiveNotificationRequest:(id)a3 withContentHandler:(id)a4;
- (void)serviceExtensionTimeWillExpire;
@end

@implementation NotificationService

- (void)didReceiveNotificationRequest:(id)a3 withContentHandler:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_100016440(v7, (uint64_t)v8, v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)serviceExtensionTimeWillExpire
{
  v2 = self;
  sub_100015570();
}

- (void)dealloc
{
  uint64_t v7 = 0;
  memset(v6, 0, sizeof(v6));
  v3 = (char *)self + OBJC_IVAR____TtC26FindMyNotificationsService19NotificationService_currentContentService;
  swift_beginAccess();
  v4 = self;
  sub_100015A24((uint64_t)v6, (uint64_t)v3);
  swift_endAccess();
  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for NotificationService();
  [(NotificationService *)&v5 dealloc];
}

- (void).cxx_destruct
{
  sub_100015B54(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC26FindMyNotificationsService19NotificationService_contentHandler));
  v3 = (char *)self + OBJC_IVAR____TtC26FindMyNotificationsService19NotificationService_currentContentService;

  sub_100015AF4((uint64_t)v3);
}

- (_TtC26FindMyNotificationsService19NotificationService)init
{
  v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC26FindMyNotificationsService19NotificationService_contentHandler);
  void *v3 = 0;
  v3[1] = 0;
  v4 = (char *)self + OBJC_IVAR____TtC26FindMyNotificationsService19NotificationService_currentContentService;
  objc_super v5 = (objc_class *)type metadata accessor for NotificationService();
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  v7.receiver = self;
  v7.super_class = v5;
  return [(NotificationService *)&v7 init];
}

@end