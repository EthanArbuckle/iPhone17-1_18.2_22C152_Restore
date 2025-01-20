@interface CRLWPStickyNoteItem
- (BOOL)allowsChangeShape;
- (BOOL)canAspectRatioLockBeChangedByUser;
- (Class)editorClass;
- (Class)layoutClass;
- (Class)repClass;
@end

@implementation CRLWPStickyNoteItem

- (BOOL)canAspectRatioLockBeChangedByUser
{
  return 1;
}

- (Class)layoutClass
{
  type metadata accessor for CRLWPStickyNoteLayout();

  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)repClass
{
  type metadata accessor for CRLWPStickyNoteRep();

  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)editorClass
{
  type metadata accessor for CRLWPStickyNoteEditor();

  return (Class)swift_getObjCClassFromMetadata();
}

- (BOOL)allowsChangeShape
{
  return 0;
}

@end