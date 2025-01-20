@interface SettingsHeaderView
- (_TtC7Journal18SettingsHeaderView)initWithCoder:(id)a3;
- (_TtC7Journal18SettingsHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation SettingsHeaderView

- (_TtC7Journal18SettingsHeaderView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal18SettingsHeaderView_headerType) = 0;
  v8 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal18SettingsHeaderView_titleText);
  void *v8 = 0;
  v8[1] = 0;
  v9 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal18SettingsHeaderView_subTitle);
  v10 = (objc_class *)type metadata accessor for SettingsHeaderView();
  void *v9 = 0;
  v9[1] = 0;
  v12.receiver = self;
  v12.super_class = v10;
  return -[SettingsHeaderView initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
}

- (_TtC7Journal18SettingsHeaderView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal18SettingsHeaderView_headerType) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal18SettingsHeaderView_titleText);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal18SettingsHeaderView_subTitle);
  void *v5 = 0;
  v5[1] = 0;
  id v6 = a3;

  result = (_TtC7Journal18SettingsHeaderView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end