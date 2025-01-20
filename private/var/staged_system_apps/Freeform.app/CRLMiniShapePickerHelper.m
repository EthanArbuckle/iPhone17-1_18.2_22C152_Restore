@interface CRLMiniShapePickerHelper
+ (void)dismissMiniShapePickerForEditor:(id)a3;
+ (void)showMiniShapePickerToAddShapeToConnectionLineWithUnscaledPopoverAnchorPoint:(CGPoint)a3 forEditor:(id)a4;
- (_TtC8Freeform24CRLMiniShapePickerHelper)init;
@end

@implementation CRLMiniShapePickerHelper

+ (void)showMiniShapePickerToAddShapeToConnectionLineWithUnscaledPopoverAnchorPoint:(CGPoint)a3 forEditor:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v6 = a4;
  sub_100931E34(v6, x, y);
}

+ (void)dismissMiniShapePickerForEditor:(id)a3
{
  id v4 = a3;
  sub_100B9DB50(a3);
}

- (_TtC8Freeform24CRLMiniShapePickerHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLMiniShapePickerHelper();
  return [(CRLMiniShapePickerHelper *)&v3 init];
}

@end