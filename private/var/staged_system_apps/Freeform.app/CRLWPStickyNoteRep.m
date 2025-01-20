@interface CRLWPStickyNoteRep
- (BOOL)allowsColorDrop;
- (BOOL)canMakePathEditable;
- (BOOL)shouldSelectInfoWhenTargetOfDrag:(id)a3;
- (CGImage)newShadowImageWithSize:(CGSize)a3 shadow:(id)a4 drawSelector:(SEL)a5 unflipped:(BOOL)a6;
- (_TtC8Freeform18CRLWPStickyNoteRep)initWithLayout:(id)a3 canvas:(id)a4;
- (void)becameNotSelected;
- (void)becameSelected;
@end

@implementation CRLWPStickyNoteRep

- (BOOL)allowsColorDrop
{
  return 0;
}

- (BOOL)canMakePathEditable
{
  return 0;
}

- (void)becameSelected
{
  v2 = self;
  sub_1005CFF78();
}

- (void)becameNotSelected
{
  v2 = self;
  sub_1005D01B8();
}

- (BOOL)shouldSelectInfoWhenTargetOfDrag:(id)a3
{
  return 0;
}

- (CGImage)newShadowImageWithSize:(CGSize)a3 shadow:(id)a4 drawSelector:(SEL)a5 unflipped:(BOOL)a6
{
  double height = a3.height;
  double width = a3.width;
  id v11 = a4;
  v12 = self;
  v13 = [(CRLCanvasRep *)v12 layout];
  v14 = [(CRLCanvasAbstractLayout *)v13 geometryInRoot];

  id v15 = v11;
  v16 = v12;
  v17 = (CGImage *)sub_1005D0AF4(v14, v15, (uint64_t)a5, a6, v16, (uint64_t)v15, (uint64_t)a5, a6, width, height);

  return v17;
}

- (_TtC8Freeform18CRLWPStickyNoteRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CRLWPStickyNoteRep();
  return [(CRLWPShapeRep *)&v7 initWithLayout:a3 canvas:a4];
}

@end