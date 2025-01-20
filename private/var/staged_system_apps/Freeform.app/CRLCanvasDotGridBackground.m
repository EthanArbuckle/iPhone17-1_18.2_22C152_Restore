@interface CRLCanvasDotGridBackground
- (CGPoint)alignmentPointForPoint:(CGPoint)a3;
- (CGPoint)originPointForAlignedInsertingRect:(CGRect)a3;
- (CGPoint)originPointForAligningRect:(CGRect)a3;
- (Class)layerClass;
- (Class)viewClass;
- (_TtC8Freeform26CRLCanvasDotGridBackground)initWithICC:(id)a3;
- (void)snapDistanceForViewScale:(double)a1;
@end

@implementation CRLCanvasDotGridBackground

- (Class)layerClass
{
  type metadata accessor for CRLCanvasDotGridLayer();

  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)viewClass
{
  type metadata accessor for CRLCanvasDotGridBackgroundView();

  return (Class)swift_getObjCClassFromMetadata();
}

- (CGPoint)originPointForAligningRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  sub_100ACFAF0(x);
  double v9 = v8;
  sub_100ACFAF0(y);
  double v11 = v10;
  if (sub_1003E86EC())
  {
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    CGFloat MaxX = CGRectGetMaxX(v22);
    v23.origin.CGFloat x = x;
    v23.origin.CGFloat y = y;
    v23.size.CGFloat width = width;
    v23.size.CGFloat height = height;
    CGFloat MinY = CGRectGetMinY(v23);
    sub_100ACFAF0(MaxX);
    double v15 = MaxX + v14;
    sub_100ACFAF0(MinY);
    double v17 = v16;

    double v18 = sub_100064680(v15, MinY + v17, MaxX);
    double v19 = sub_100064698(x, y, v18);
  }
  else
  {

    double v20 = y + v11;
    double v19 = x + v9;
  }
  result.CGFloat y = v20;
  result.CGFloat x = v19;
  return result;
}

- (CGPoint)originPointForAlignedInsertingRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  sub_100ACFAF0(x);
  double v9 = v8;
  sub_100ACFAF0(y);
  double v11 = v10;
  if (sub_1003E86EC())
  {
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    CGFloat MaxX = CGRectGetMaxX(v22);
    v23.origin.CGFloat x = x;
    v23.origin.CGFloat y = y;
    v23.size.CGFloat width = width;
    v23.size.CGFloat height = height;
    CGFloat MinY = CGRectGetMinY(v23);
    sub_100ACFAF0(MaxX);
    double v15 = MaxX + v14;
    sub_100ACFAF0(MinY);
    double v17 = v16;

    double v18 = sub_100064680(v15, MinY + v17, MaxX);
    double v19 = sub_100064698(x, y, v18);
  }
  else
  {

    double v20 = y + v11;
    double v19 = x + v9;
  }
  result.CGFloat y = v20;
  result.CGFloat x = v19;
  return result;
}

- (CGPoint)alignmentPointForPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v5 = self;
  sub_100ACFAF0(x);
  double v7 = x + v6;
  sub_100ACFAF0(y);
  double v9 = v8;

  double v10 = y + v9;
  double v11 = v7;
  result.CGFloat y = v10;
  result.CGFloat x = v11;
  return result;
}

- (_TtC8Freeform26CRLCanvasDotGridBackground)initWithICC:(id)a3
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLCanvasBackground();
  return [(CRLCanvasBackground *)&v5 init];
}

- (void)snapDistanceForViewScale:(double)a1
{
  if (a1 <= 0.0)
  {
    sub_10086134C((uint64_t)&_mh_execute_header, (uint64_t)"snapDistance(forViewScale:)", 27, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasDotGridBackground.swift", 96, 2, 39, (uint64_t)"viewScale must be greater than 0", 32, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1005598CC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"snapDistance(forViewScale:)", 27, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasDotGridBackground.swift", 96, 2, 39);
  }
}

@end