@interface NestedHorizontalShelfCollectionViewFlowLayout
- (BOOL)flipsHorizontallyInOppositeLayoutDirection;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4;
- (_TtC8AppStore45NestedHorizontalShelfCollectionViewFlowLayout)init;
- (_TtC8AppStore45NestedHorizontalShelfCollectionViewFlowLayout)initWithCoder:(id)a3;
@end

@implementation NestedHorizontalShelfCollectionViewFlowLayout

- (_TtC8AppStore45NestedHorizontalShelfCollectionViewFlowLayout)init
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for NestedHorizontalShelfCollectionViewFlowLayout();
  v2 = [(NestedHorizontalShelfCollectionViewFlowLayout *)&v4 init];
  [(NestedHorizontalShelfCollectionViewFlowLayout *)v2 setScrollDirection:1];
  return v2;
}

- (_TtC8AppStore45NestedHorizontalShelfCollectionViewFlowLayout)initWithCoder:(id)a3
{
  result = (_TtC8AppStore45NestedHorizontalShelfCollectionViewFlowLayout *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  v8 = self;
  sub_10063D994(v7, v6, x, y);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

@end