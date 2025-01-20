@interface CRLUnknownLayout
- (BOOL)isSelectable;
- (Class)repClassOverride;
- (_TtC8Freeform16CRLUnknownLayout)initWithInfo:(id)a3;
@end

@implementation CRLUnknownLayout

- (BOOL)isSelectable
{
  return 0;
}

- (Class)repClassOverride
{
  type metadata accessor for CRLUnknownRep();

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC8Freeform16CRLUnknownLayout)initWithInfo:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLUnknownLayout();
  return [(CRLCanvasLayout *)&v5 initWithInfo:a3];
}

@end