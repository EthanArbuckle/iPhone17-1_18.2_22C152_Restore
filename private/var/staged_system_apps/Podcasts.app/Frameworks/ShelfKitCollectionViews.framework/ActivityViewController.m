@interface ActivityViewController
- (_TtC23ShelfKitCollectionViews22ActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4;
- (id)_titleForActivity:(id)a3;
@end

@implementation ActivityViewController

- (id)_titleForActivity:(id)a3
{
  v4 = self;
  id v5 = a3;
  sub_268BF0();
  uint64_t v7 = v6;

  if (v7)
  {
    NSString v8 = sub_384380();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }

  return v8;
}

- (_TtC23ShelfKitCollectionViews22ActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4
{
  result = (_TtC23ShelfKitCollectionViews22ActivityViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end