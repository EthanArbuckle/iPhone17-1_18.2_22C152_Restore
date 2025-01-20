@interface CRLUnknownItem
- (BOOL)isSelectable;
- (Class)layoutClass;
- (Class)repClass;
@end

@implementation CRLUnknownItem

- (BOOL)isSelectable
{
  return 0;
}

- (Class)layoutClass
{
  type metadata accessor for CRLUnknownLayout();

  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)repClass
{
  type metadata accessor for CRLUnknownRep();

  return (Class)swift_getObjCClassFromMetadata();
}

@end