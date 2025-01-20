@interface NotificationsStateCommandHandler
- (_TtC7NewsUI232NotificationsStateCommandHandler)init;
- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4;
@end

@implementation NotificationsStateCommandHandler

- (_TtC7NewsUI232NotificationsStateCommandHandler)init
{
  result = (_TtC7NewsUI232NotificationsStateCommandHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI232NotificationsStateCommandHandler_commandCenter);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC7NewsUI232NotificationsStateCommandHandler_notificationCenter);
}

- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4
{
  if (MEMORY[0x1E01EFB70]((char *)self + OBJC_IVAR____TtC7NewsUI232NotificationsStateCommandHandler_commandCenter, a2))
  {
    swift_getObjectType();
    id v7 = a3;
    id v8 = a4;
    v9 = self;
    sub_1DFDF53F0();
    sub_1DFDF1AE0();

    swift_release();
    swift_unknownObjectRelease();
  }
}

@end