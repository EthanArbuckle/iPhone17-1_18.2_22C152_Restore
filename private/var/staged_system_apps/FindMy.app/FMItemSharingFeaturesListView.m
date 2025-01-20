@interface FMItemSharingFeaturesListView
- (_TtC6FindMy29FMItemSharingFeaturesListView)init;
- (_TtC6FindMy29FMItemSharingFeaturesListView)initWithCoder:(id)a3;
@end

@implementation FMItemSharingFeaturesListView

- (_TtC6FindMy29FMItemSharingFeaturesListView)init
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMItemSharingFeaturesListView();
  v2 = [(FMSymbolBulletedListView *)&v6 init];
  uint64_t v3 = qword_1006AE280;
  v4 = v2;
  if (v3 != -1) {
    swift_once();
  }
  -[FMItemSharingFeaturesListView setDirectionalLayoutMargins:](v4, "setDirectionalLayoutMargins:", *(double *)&qword_1006D2240, *(double *)algn_1006D2248, xmmword_1006D2250);
  [(FMItemSharingFeaturesListView *)v4 setLayoutMarginsRelativeArrangement:1];
  sub_1003CE1D0();

  return v4;
}

- (_TtC6FindMy29FMItemSharingFeaturesListView)initWithCoder:(id)a3
{
  result = (_TtC6FindMy29FMItemSharingFeaturesListView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

@end