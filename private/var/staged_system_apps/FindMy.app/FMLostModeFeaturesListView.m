@interface FMLostModeFeaturesListView
- (_TtC6FindMy26FMLostModeFeaturesListView)init;
- (_TtC6FindMy26FMLostModeFeaturesListView)initWithCoder:(id)a3;
@end

@implementation FMLostModeFeaturesListView

- (_TtC6FindMy26FMLostModeFeaturesListView)init
{
  uint64_t v3 = OBJC_IVAR____TtC6FindMy26FMLostModeFeaturesListView_featureDisclosureLabel;
  id v4 = objc_allocWithZone((Class)UILabel);
  v5 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)[v4 init];

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for FMLostModeFeaturesListView();
  v6 = [(FMSymbolBulletedListView *)&v8 init];
  sub_1003CCA88();
  sub_1003CCBCC();

  return v6;
}

- (_TtC6FindMy26FMLostModeFeaturesListView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC6FindMy26FMLostModeFeaturesListView_featureDisclosureLabel;
  id v6 = objc_allocWithZone((Class)UILabel);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC6FindMy26FMLostModeFeaturesListView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMLostModeFeaturesListView_featureDisclosureLabel));
}

@end