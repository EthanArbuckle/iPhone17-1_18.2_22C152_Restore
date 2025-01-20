@interface CRLFileLayout
- (BOOL)wantsNormalLayoutDuringDynamicRotation;
- (CGSize)minimumSize;
- (_TtC8Freeform13CRLFileLayout)initWithInfo:(id)a3;
@end

@implementation CRLFileLayout

- (BOOL)wantsNormalLayoutDuringDynamicRotation
{
  return 1;
}

- (CGSize)minimumSize
{
  double v2 = 150.0;
  double v3 = 150.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC8Freeform13CRLFileLayout)initWithInfo:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLFileLayout();
  return [(CRLCanvasLayout *)&v5 initWithInfo:a3];
}

@end