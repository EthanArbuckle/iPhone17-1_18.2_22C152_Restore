@interface UnpreventableHoverGestureRecognizer
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (_TtC23ShelfKitCollectionViews35UnpreventableHoverGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
@end

@implementation UnpreventableHoverGestureRecognizer

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (_TtC23ShelfKitCollectionViews35UnpreventableHoverGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    sub_385640();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtC23ShelfKitCollectionViews35UnpreventableHoverGestureRecognizer *)sub_195438((uint64_t)v6, (uint64_t)a4);
}

@end