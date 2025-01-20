@interface CRLSelectionDispatcher
- (_TtC8Freeform22CRLSelectionDispatcher)init;
- (id)receivers;
- (void)clearSelectionStateSnapshots;
- (void)snapshotSelectionState;
- (void)validateSelections;
@end

@implementation CRLSelectionDispatcher

- (id)receivers
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC8Freeform22CRLSelectionDispatcher_receivers));
}

- (void)snapshotSelectionState
{
  v2 = self;
  sub_100F6D458();
}

- (void)clearSelectionStateSnapshots
{
}

- (void)validateSelections
{
  v2 = self;
  sub_100F6DFD4();
}

- (_TtC8Freeform22CRLSelectionDispatcher)init
{
  uint64_t v3 = OBJC_IVAR____TtC8Freeform22CRLSelectionDispatcher_receivers;
  v4 = self;
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)[v4 weakObjectsHashTable];
  uint64_t v6 = OBJC_IVAR____TtC8Freeform22CRLSelectionDispatcher_selectionStateSnapshots;
  *(Class *)((char *)&v5->super.isa + v6) = (Class)[self weakToStrongObjectsMapTable];

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for CRLSelectionDispatcher();
  return [(CRLSelectionDispatcher *)&v8 init];
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform22CRLSelectionDispatcher_selectionStateSnapshots);
}

@end