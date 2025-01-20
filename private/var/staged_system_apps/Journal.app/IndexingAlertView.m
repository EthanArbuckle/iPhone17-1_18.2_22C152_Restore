@interface IndexingAlertView
- (_TtC7Journal17IndexingAlertView)init;
- (_TtC7Journal17IndexingAlertView)initWithCoder:(id)a3;
- (_TtC7Journal17IndexingAlertView)initWithFrame:(CGRect)a3;
@end

@implementation IndexingAlertView

- (_TtC7Journal17IndexingAlertView)init
{
  uint64_t v3 = OBJC_IVAR____TtC7Journal17IndexingAlertView_bodyLabel;
  id v4 = objc_allocWithZone((Class)UILabel);
  v5 = self;
  *(Class *)((char *)&self->super.super.super.isa + v3) = (Class)[v4 init];

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for IndexingAlertView();
  v6 = -[IndexingAlertView initWithFrame:](&v8, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  sub_1006270B8();

  return v6;
}

- (_TtC7Journal17IndexingAlertView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7Journal17IndexingAlertView_bodyLabel;
  id v6 = objc_allocWithZone((Class)UILabel);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC7Journal17IndexingAlertView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC7Journal17IndexingAlertView)initWithFrame:(CGRect)a3
{
  result = (_TtC7Journal17IndexingAlertView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end