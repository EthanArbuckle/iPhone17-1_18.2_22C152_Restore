@interface NotificationSourceMonitorLSObserver
- (_TtC21UserNotificationsCore35NotificationSourceMonitorLSObserver)init;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)cache:(id)a3 willEvictObject:(id)a4;
@end

@implementation NotificationSourceMonitorLSObserver

- (void)applicationsDidInstall:(id)a3
{
}

- (void)applicationsDidUninstall:(id)a3
{
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  sub_260A85280();
  swift_unknownObjectRelease();
  sub_2609F240C((uint64_t)v7);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

- (_TtC21UserNotificationsCore35NotificationSourceMonitorLSObserver)init
{
  result = (_TtC21UserNotificationsCore35NotificationSourceMonitorLSObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore35NotificationSourceMonitorLSObserver_workspace));
  swift_unknownObjectWeakDestroy();
  v3 = (char *)self + OBJC_IVAR____TtC21UserNotificationsCore35NotificationSourceMonitorLSObserver_delegate;

  sub_26094056C((uint64_t)v3);
}

@end