@interface DaemonDataSource
- (_TtC19MailWidgetExtension16DaemonDataSource)init;
@end

@implementation DaemonDataSource

- (_TtC19MailWidgetExtension16DaemonDataSource)init
{
  return (_TtC19MailWidgetExtension16DaemonDataSource *)sub_100012DF0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19MailWidgetExtension16DaemonDataSource_messagesDataSource));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19MailWidgetExtension16DaemonDataSource_statusDataSource));
  swift_release();

  swift_release();
}

@end