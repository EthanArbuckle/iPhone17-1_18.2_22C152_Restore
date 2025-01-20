@interface CRLWPStickyNoteLayout
- (BOOL)canBeIntersected;
- (BOOL)canResetTextAndObjectHandles;
- (CGSize)minimumSize;
- (CRLFill)instructionalTextCharacterFill;
- (_TtC8Freeform21CRLWPStickyNoteLayout)initWithInfo:(id)a3;
@end

@implementation CRLWPStickyNoteLayout

- (CGSize)minimumSize
{
  double v2 = 100.0;
  double v3 = 100.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)canBeIntersected
{
  return 0;
}

- (BOOL)canResetTextAndObjectHandles
{
  return 0;
}

- (CRLFill)instructionalTextCharacterFill
{
  id v2 = [objc_allocWithZone((Class)CRLColorFill) initWithRed:0.0 green:0.0 blue:0.0 alpha:0.25];

  return (CRLFill *)v2;
}

- (_TtC8Freeform21CRLWPStickyNoteLayout)initWithInfo:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLWPStickyNoteLayout();
  return [(CRLWPShapeLayout *)&v5 initWithInfo:a3];
}

@end