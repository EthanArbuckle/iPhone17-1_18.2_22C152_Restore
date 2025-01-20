@interface SettingsFooterView
- (_TtC7Journal18SettingsFooterView)initWithCoder:(id)a3;
- (_TtC7Journal18SettingsFooterView)initWithFrame:(CGRect)a3;
@end

@implementation SettingsFooterView

- (_TtC7Journal18SettingsFooterView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC7Journal18SettingsFooterView_footerLabel;
  type metadata accessor for SettingsHeaderFooterLabel();
  id v9 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v10 = self;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)[v9 init];

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for SettingsFooterView();
  v11 = -[SettingsFooterView initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
  sub_10022D134();

  return v11;
}

- (_TtC7Journal18SettingsFooterView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7Journal18SettingsFooterView_footerLabel;
  type metadata accessor for SettingsHeaderFooterLabel();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC7Journal18SettingsFooterView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end