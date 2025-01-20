@interface CRLCommandController
- (BOOL)canRedo;
- (BOOL)canUndo;
- (BOOL)hasIncomingSuspensionInPlaceForCurrentTransaction;
- (BOOL)isGroupOpen;
- (BOOL)isProgressiveEnqueuingInCurrentGroupEnabled;
- (BOOL)isRealTimeSyncProgressiveEnqueuingInCurrentGroupEnabled;
- (BOOL)isRealTimeSyncProgressiveWithSimultaneousRealtimeIncomingInCurrentGroupEnabled;
- (NSString)currentGroupActionString;
- (NSString)redoActionString;
- (NSString)undoActionString;
- (_TtC8Freeform20CRLCommandController)init;
- (_TtC8Freeform20CRLCommandController)initWithBoard:(id)a3 changeNotifier:(id)a4 selectionDispatcher:(id)a5;
- (_TtC8Freeform8CRLBoard)board;
- (int64_t)groupingLevel;
- (int64_t)redoCount;
- (int64_t)undoCount;
- (void)_stepWatermarkContextIfNecessary;
- (void)closeGroup;
- (void)closeGroupWithSelectionBehavior:(id)a3;
- (void)destroyOutermostCommandGroupOnClose;
- (void)enableProgressiveEnqueuingInCurrentGroup;
- (void)enableRealTimeSyncProgressiveEnqueuingInCurrentGroup;
- (void)enableRealTimeSyncProgressiveEnqueuingWithSimultaneousRealtimeIncomingInCurrentGroup;
- (void)enqueueCommand:(id)a3;
- (void)enqueueCommand:(id)a3 withSelectionBehavior:(id)a4;
- (void)enqueueWithNonUndoableCommand:(id)a3;
- (void)enqueueWithRealTimePeerCommand:(id)a3;
- (void)enqueueWithUntrackedCommand:(id)a3;
- (void)openGroup;
- (void)openGroupWithSelectionBehavior:(id)a3;
- (void)redo;
- (void)setCurrentGroupActionString:(id)a3;
- (void)setHasIncomingSuspensionInPlaceForCurrentTransaction:(BOOL)a3;
- (void)undo;
@end

@implementation CRLCommandController

- (void)openGroup
{
}

- (void)closeGroup
{
}

- (void)enqueueCommand:(id)a3
{
}

- (_TtC8Freeform8CRLBoard)board
{
  return (_TtC8Freeform8CRLBoard *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR____TtC8Freeform20CRLCommandController_board));
}

- (_TtC8Freeform20CRLCommandController)initWithBoard:(id)a3 changeNotifier:(id)a4 selectionDispatcher:(id)a5
{
  return (_TtC8Freeform20CRLCommandController *)sub_10078B42C((uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
}

- (void)enqueueCommand:(id)a3 withSelectionBehavior:(id)a4
{
  v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10078BED8(v6, 0, a4, 4, 0);
}

- (void)undo
{
  v2 = self;
  sub_10078DE80();
}

- (void)redo
{
  v2 = self;
  sub_10078E40C();
}

- (BOOL)canUndo
{
  v2 = self;
  BOOL v3 = sub_10078E9CC();

  return v3;
}

- (BOOL)canRedo
{
  v2 = self;
  BOOL v3 = sub_10078EB0C();

  return v3;
}

- (int64_t)undoCount
{
  v2 = self;
  int64_t v3 = sub_10078EC4C();

  return v3;
}

- (int64_t)redoCount
{
  v2 = self;
  int64_t v3 = sub_10078ED84();

  return v3;
}

- (void)enqueueWithNonUndoableCommand:(id)a3
{
  v5 = (double **)((char *)self + OBJC_IVAR____TtC8Freeform20CRLCommandController_nonUserCommandQueue);
  swift_beginAccess();
  v6 = *v5;
  id v7 = a3;
  v8 = self;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v5 = v6;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v6 = sub_100F62618(0, *((void *)v6 + 2) + 1, 1, v6);
    *v5 = v6;
  }
  unint64_t v11 = *((void *)v6 + 2);
  unint64_t v10 = *((void *)v6 + 3);
  if (v11 >= v10 >> 1)
  {
    v6 = sub_100F62618((double *)(v10 > 1), v11 + 1, 1, v6);
    *v5 = v6;
  }
  *((void *)v6 + 2) = v11 + 1;
  v12 = &v6[2 * v11];
  *((void *)v12 + 4) = v7;
  *((unsigned char *)v12 + 40) = 1;
  swift_endAccess();
  sub_10078F194();
}

- (void)enqueueWithUntrackedCommand:(id)a3
{
  v5 = (double **)((char *)self + OBJC_IVAR____TtC8Freeform20CRLCommandController_nonUserCommandQueue);
  swift_beginAccess();
  v6 = *v5;
  id v7 = a3;
  v8 = self;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v5 = v6;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v6 = sub_100F62618(0, *((void *)v6 + 2) + 1, 1, v6);
    *v5 = v6;
  }
  unint64_t v11 = *((void *)v6 + 2);
  unint64_t v10 = *((void *)v6 + 3);
  if (v11 >= v10 >> 1)
  {
    v6 = sub_100F62618((double *)(v10 > 1), v11 + 1, 1, v6);
    *v5 = v6;
  }
  *((void *)v6 + 2) = v11 + 1;
  v12 = &v6[2 * v11];
  *((void *)v12 + 4) = v7;
  *((unsigned char *)v12 + 40) = 2;
  swift_endAccess();
  sub_10078F194();
}

- (void)enqueueWithRealTimePeerCommand:(id)a3
{
  v5 = (double **)((char *)self + OBJC_IVAR____TtC8Freeform20CRLCommandController_nonUserCommandQueue);
  swift_beginAccess();
  v6 = *v5;
  id v7 = a3;
  v8 = self;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v5 = v6;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v6 = sub_100F62618(0, *((void *)v6 + 2) + 1, 1, v6);
    *v5 = v6;
  }
  unint64_t v11 = *((void *)v6 + 2);
  unint64_t v10 = *((void *)v6 + 3);
  if (v11 >= v10 >> 1)
  {
    v6 = sub_100F62618((double *)(v10 > 1), v11 + 1, 1, v6);
    *v5 = v6;
  }
  *((void *)v6 + 2) = v11 + 1;
  v12 = &v6[2 * v11];
  *((void *)v12 + 4) = v7;
  *((unsigned char *)v12 + 40) = 3;
  swift_endAccess();
  sub_10078F194();
}

- (NSString)undoActionString
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform20CRLCommandController_commandHistory);
  swift_beginAccess();
  sub_100BAE490(*v2);
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSString)redoActionString
{
  v2 = (char *)self + OBJC_IVAR____TtC8Freeform20CRLCommandController_commandHistory;
  swift_beginAccess();
  sub_100BAE490(*((void *)v2 + 1));
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSString)currentGroupActionString
{
  v2 = self;
  sub_10078F42C();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)setCurrentGroupActionString:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  id v7 = self;
  sub_10078F5CC(v4, v6);
}

- (int64_t)groupingLevel
{
  NSString v3 = (unint64_t *)((char *)self + OBJC_IVAR____TtC8Freeform20CRLCommandController_openGroupDatas);
  swift_beginAccess();
  unint64_t v4 = *v3;
  if (!(v4 >> 62)) {
    return *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v7 = self;
  swift_bridgeObjectRetain();
  int64_t v5 = _CocoaArrayWrapper.endIndex.getter();

  swift_bridgeObjectRelease();
  return v5;
}

- (BOOL)isGroupOpen
{
  NSString v3 = (unint64_t *)((char *)self + OBJC_IVAR____TtC8Freeform20CRLCommandController_openGroupDatas);
  swift_beginAccess();
  unint64_t v4 = *v3;
  if (v4 >> 62)
  {
    id v7 = self;
    swift_bridgeObjectRetain();
    uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  return v5 > 0;
}

- (BOOL)hasIncomingSuspensionInPlaceForCurrentTransaction
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC8Freeform20CRLCommandController_hasIncomingSuspensionInPlaceForCurrentTransaction);
}

- (void)setHasIncomingSuspensionInPlaceForCurrentTransaction:(BOOL)a3
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC8Freeform20CRLCommandController_hasIncomingSuspensionInPlaceForCurrentTransaction) = a3;
}

- (void)openGroupWithSelectionBehavior:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10078F988(a3);
}

- (void)closeGroupWithSelectionBehavior:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10078FB90((char *)a3);
}

- (void)destroyOutermostCommandGroupOnClose
{
  v2 = self;
  sub_100790004();
}

- (void)enableProgressiveEnqueuingInCurrentGroup
{
  v2 = self;
  sub_100790370();
}

- (BOOL)isProgressiveEnqueuingInCurrentGroupEnabled
{
  v2 = self;
  char v3 = sub_1007906B0();

  return v3 & 1;
}

- (void)enableRealTimeSyncProgressiveEnqueuingInCurrentGroup
{
  v2 = self;
  sub_1007907B8();
}

- (void)enableRealTimeSyncProgressiveEnqueuingWithSimultaneousRealtimeIncomingInCurrentGroup
{
  v2 = self;
  sub_100790D74();
}

- (BOOL)isRealTimeSyncProgressiveEnqueuingInCurrentGroupEnabled
{
  v2 = self;
  char v3 = sub_100791360();

  return v3 & 1;
}

- (BOOL)isRealTimeSyncProgressiveWithSimultaneousRealtimeIncomingInCurrentGroupEnabled
{
  v2 = self;
  char v3 = sub_10079149C();

  return v3 & 1;
}

- (void)_stepWatermarkContextIfNecessary
{
  v2 = self;
  sub_1007915A0();
}

- (_TtC8Freeform20CRLCommandController)init
{
  result = (_TtC8Freeform20CRLCommandController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform20CRLCommandController__currentSelectionBehavior));

  swift_bridgeObjectRelease();
}

@end