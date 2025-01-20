@interface TTRIBoardColumnCollectionView
- (_TtC9Reminders29TTRIBoardColumnCollectionView)initWithCoder:(id)a3;
- (_TtC9Reminders29TTRIBoardColumnCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation TTRIBoardColumnCollectionView

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  sub_100513F00();
  sub_100513F40();
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a4;
  v8 = self;
  sub_100513C7C(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (_TtC9Reminders29TTRIBoardColumnCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  return -[TTRIBoardColumnCollectionView initWithFrame:collectionViewLayout:](&v10, "initWithFrame:collectionViewLayout:", a4, x, y, width, height);
}

- (_TtC9Reminders29TTRIBoardColumnCollectionView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(TTRIBoardColumnCollectionView *)&v5 initWithCoder:a3];
}

@end