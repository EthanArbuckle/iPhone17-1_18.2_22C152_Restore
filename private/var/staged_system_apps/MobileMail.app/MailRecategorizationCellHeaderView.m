@interface MailRecategorizationCellHeaderView
- (NSString)title;
- (_TtC10MobileMail34MailRecategorizationCellHeaderView)initWithCoder:(id)a3;
- (_TtC10MobileMail34MailRecategorizationCellHeaderView)initWithFrame:(CGRect)a3;
- (void)setTitle:(id)a3;
@end

@implementation MailRecategorizationCellHeaderView

- (NSString)title
{
  v2 = self;
  MailRecategorizationCellHeaderView.title.getter();
  uint64_t v8 = v3;

  if (v8)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return (NSString *)v6;
}

- (void)setTitle:(id)a3
{
  id v3 = a3;
  v4 = self;
  if (a3)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v5;

    uint64_t v8 = v6;
    uint64_t v9 = v7;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  MailRecategorizationCellHeaderView.title.setter(v8, v9);
}

- (_TtC10MobileMail34MailRecategorizationCellHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC10MobileMail34MailRecategorizationCellHeaderView *)sub_100388D98(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10MobileMail34MailRecategorizationCellHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100389258();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail34MailRecategorizationCellHeaderView_titleLabel));
}

@end