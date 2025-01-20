@interface CRLSceneRep
- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4;
- (BOOL)directlyManagesLayerContent;
- (_TtC8Freeform11CRLSceneRep)initWithLayout:(id)a3 canvas:(id)a4;
- (void)willUpdateRenderable:(id)a3;
@end

@implementation CRLSceneRep

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)willUpdateRenderable:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100861E3C(a3);
}

- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4
{
  return 0;
}

- (_TtC8Freeform11CRLSceneRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CRLSceneRep();
  return [(CRLCanvasRep *)&v7 initWithLayout:a3 canvas:a4];
}

@end