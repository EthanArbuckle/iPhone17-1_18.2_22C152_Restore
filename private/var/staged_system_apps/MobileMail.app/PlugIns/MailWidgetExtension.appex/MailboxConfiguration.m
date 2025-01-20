@interface MailboxConfiguration
- (BOOL)isInboxMailbox;
- (NSString)bucketBarConfigurationIdentifier;
- (_TtC19MailWidgetExtension20MailboxConfiguration)init;
- (void)setBucketBarConfigurationIdentifier:(id)a3;
- (void)setIsInboxMailbox:(BOOL)a3;
@end

@implementation MailboxConfiguration

- (BOOL)isInboxMailbox
{
  v2 = self;
  sub_10001CB2C();

  return sub_1000896C0() & 1;
}

- (void)setIsInboxMailbox:(BOOL)a3
{
  v3 = self;
  char v4 = sub_1000896D0();
  sub_10001CBE8(v4 & 1);
}

- (NSString)bucketBarConfigurationIdentifier
{
  v2 = self;
  sub_10001CCE8();

  NSString v5 = sub_10008A070();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (void)setBucketBarConfigurationIdentifier:(id)a3
{
  id v4 = a3;
  NSString v5 = self;
  uint64_t v6 = sub_10008A080();
  sub_10001CDB8(v6, v7);
}

- (_TtC19MailWidgetExtension20MailboxConfiguration)init
{
  return (_TtC19MailWidgetExtension20MailboxConfiguration *)sub_10001CF7C();
}

- (void).cxx_destruct
{
}

@end