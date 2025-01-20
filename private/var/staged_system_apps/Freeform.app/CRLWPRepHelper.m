@interface CRLWPRepHelper
+ (id)forCurrentPlatform:(id)a3;
- (CGPoint)anchorPointForCaretLayer:(BOOL)a3 rotated:(BOOL)a4;
- (CGPoint)positionForCaretLayer:(CGRect)a3;
- (CGRect)boundsForCaretLayer:(CGRect)result;
- (_TtC8Freeform14CRLWPRepHelper)init;
- (double)cornerRadiusForFloatingCaret:(id)a3;
- (double)floatingCaretHeightMult;
- (double)floatingCaretLineSnapAmount;
- (id)colorForGhostCaret;
- (void)addLiftAnimationToFloatingCursor:(id)a3 floatingCaretLayer:(id)a4;
- (void)setFloatingCaretHeightMult:(double)a3;
- (void)setFloatingCaretLineSnapAmount:(double)a3;
@end

@implementation CRLWPRepHelper

+ (id)forCurrentPlatform:(id)a3
{
  v3 = (objc_class *)type metadata accessor for CRLWPRepHelper();
  v4 = (char *)objc_allocWithZone(v3);
  *(void *)&v4[OBJC_IVAR____TtC8Freeform14CRLWPRepHelper_floatingCaretLineSnapAmount] = 0;
  *(void *)&v4[OBJC_IVAR____TtC8Freeform14CRLWPRepHelper_floatingCaretHeightMult] = 0x3FF8000000000000;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v7.receiver = v4;
  v7.super_class = v3;
  id v5 = [super init];

  return v5;
}

- (double)floatingCaretLineSnapAmount
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform14CRLWPRepHelper_floatingCaretLineSnapAmount);
}

- (void)setFloatingCaretLineSnapAmount:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform14CRLWPRepHelper_floatingCaretLineSnapAmount) = a3;
}

- (double)floatingCaretHeightMult
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform14CRLWPRepHelper_floatingCaretHeightMult);
}

- (void)setFloatingCaretHeightMult:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform14CRLWPRepHelper_floatingCaretHeightMult) = a3;
}

- (id)colorForGhostCaret
{
  id v2 = [objc_allocWithZone((Class)CRLColor) initWithRed:0.67 green:0.67 blue:0.67 alpha:1.0];

  return v2;
}

- (CGPoint)anchorPointForCaretLayer:(BOOL)a3 rotated:(BOOL)a4
{
  double v4 = 0.5;
  double v5 = 1.0;
  if (!a3) {
    double v5 = 0.5;
  }
  if (!a4) {
    double v5 = 0.0;
  }
  if (!a4 || !a3) {
    double v4 = 0.0;
  }
  result.y = v4;
  result.x = v5;
  return result;
}

- (CGRect)boundsForCaretLayer:(CGRect)result
{
  double v3 = 0.0;
  double v4 = 0.0;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGPoint)positionForCaretLayer:(CGRect)a3
{
  double v3 = floor(a3.origin.x + a3.size.width * -0.5);
  double v4 = floor(a3.origin.y);
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)cornerRadiusForFloatingCaret:(id)a3
{
  return 0.0;
}

- (void)addLiftAnimationToFloatingCursor:(id)a3 floatingCaretLayer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100727560(v7);
}

- (_TtC8Freeform14CRLWPRepHelper)init
{
  CGPoint result = (_TtC8Freeform14CRLWPRepHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end