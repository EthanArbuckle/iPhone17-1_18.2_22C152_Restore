@interface FMSymbolBulletedListView
- (_TtC6FindMy24FMSymbolBulletedListView)init;
- (_TtC6FindMy24FMSymbolBulletedListView)initWithCoder:(id)a3;
- (_TtC6FindMy24FMSymbolBulletedListView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FMSymbolBulletedListView

- (_TtC6FindMy24FMSymbolBulletedListView)init
{
  return (_TtC6FindMy24FMSymbolBulletedListView *)sub_1003837FC();
}

- (_TtC6FindMy24FMSymbolBulletedListView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC6FindMy24FMSymbolBulletedListView_headerView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for FMSymbolBulletedListHeaderView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy24FMSymbolBulletedListView_bulletViews) = (Class)_swiftEmptyArrayStorage;

  result = (_TtC6FindMy24FMSymbolBulletedListView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FMSymbolBulletedListView();
  id v4 = a3;
  id v5 = v11.receiver;
  [(FMSymbolBulletedListView *)&v11 traitCollectionDidChange:v4];
  if (qword_1006AE100 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_1006D1C08;
  id v7 = objc_allocWithZone((Class)UIFontMetrics);
  id v8 = [v7 initForTextStyle:v6];
  if (qword_1006AE248 != -1) {
    swift_once();
  }
  [v8 scaledValueForValue:*(double *)&qword_1006D2158];
  double v10 = v9;

  [v5 setSpacing:v10];
}

- (_TtC6FindMy24FMSymbolBulletedListView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy24FMSymbolBulletedListView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMSymbolBulletedListView_headerView));

  swift_bridgeObjectRelease();
}

@end