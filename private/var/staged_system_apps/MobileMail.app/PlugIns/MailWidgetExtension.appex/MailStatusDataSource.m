@interface MailStatusDataSource
- (_TtC19MailWidgetExtension20MailStatusDataSource)init;
- (void)messageRepository:(id)a3 query:(id)a4 countDidChange:(int64_t)a5;
@end

@implementation MailStatusDataSource

- (_TtC19MailWidgetExtension20MailStatusDataSource)init
{
  return (_TtC19MailWidgetExtension20MailStatusDataSource *)sub_100026C94();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19MailWidgetExtension20MailStatusDataSource_messageRepository));
  sub_10000ADA0();
  sub_10000ADA0();
}

- (void)messageRepository:(id)a3 query:(id)a4 countDidChange:(int64_t)a5
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100026E78((uint64_t)a3, a4, a5);
}

@end