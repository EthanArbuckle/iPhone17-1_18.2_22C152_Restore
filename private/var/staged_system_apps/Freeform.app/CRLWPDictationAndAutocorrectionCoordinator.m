@interface CRLWPDictationAndAutocorrectionCoordinator
- (BOOL)isPrimarySelectionPathReceiver;
- (_TtC8Freeform25CRLSelectionPathValidator)selectionPathValidator;
- (id)selectionStateSnapshot;
- (void)setIsPrimarySelectionPathReceiver:(BOOL)a3;
- (void)validateSelectionStateUsing:(id)a3;
@end

@implementation CRLWPDictationAndAutocorrectionCoordinator

- (_TtC8Freeform25CRLSelectionPathValidator)selectionPathValidator
{
  return (_TtC8Freeform25CRLSelectionPathValidator *)*(id *)self->selectionPathValidator;
}

- (BOOL)isPrimarySelectionPathReceiver
{
  return self->isPrimarySelectionPathReceiver[0];
}

- (void)setIsPrimarySelectionPathReceiver:(BOOL)a3
{
  self->isPrimarySelectionPathReceiver[0] = a3;
}

- (id)selectionStateSnapshot
{
  swift_beginAccess();
  swift_retain();
  uint64_t v3 = swift_bridgeObjectRetain();
  sub_1007ADE2C(v3, (uint64_t)self);
  swift_release();
  swift_bridgeObjectRelease();

  return 0;
}

- (void)validateSelectionStateUsing:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_1007AE710();

  swift_release();
}

@end