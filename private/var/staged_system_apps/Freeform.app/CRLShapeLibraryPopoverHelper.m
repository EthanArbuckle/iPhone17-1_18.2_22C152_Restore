@interface CRLShapeLibraryPopoverHelper
+ (void)changeShapeForEditor:(id)a3 shapePathSource:(id)a4 interactiveCanvasController:(id)a5;
+ (void)dismissShapeLibraryForEditor:(id)a3;
+ (void)showShapeLibraryForEditor:(id)a3;
+ (void)showShapeLibraryPopoverToAddShapeToConnectionLineWithUnscaledPopoverAnchorPoint:(CGPoint)a3 forEditor:(id)a4;
- (_TtC8Freeform28CRLShapeLibraryPopoverHelper)init;
@end

@implementation CRLShapeLibraryPopoverHelper

+ (void)changeShapeForEditor:(id)a3 shapePathSource:(id)a4 interactiveCanvasController:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  sub_100A57E88(v7, (uint64_t)v8, v9);
}

+ (void)showShapeLibraryForEditor:(id)a3
{
  id v3 = a3;
  sub_100A58B10(v3);
}

+ (void)showShapeLibraryPopoverToAddShapeToConnectionLineWithUnscaledPopoverAnchorPoint:(CGPoint)a3 forEditor:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v6 = a4;
  sub_100A590A0(v6, x, y);
}

+ (void)dismissShapeLibraryForEditor:(id)a3
{
  id v4 = a3;
  sub_100A59534(a3);
}

- (_TtC8Freeform28CRLShapeLibraryPopoverHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLShapeLibraryPopoverHelper();
  return [(CRLShapeLibraryPopoverHelper *)&v3 init];
}

@end