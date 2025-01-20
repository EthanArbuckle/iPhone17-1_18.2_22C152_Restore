@interface CRLCollaboratorCursorCoordinator
- (BOOL)isPrimarySelectionPathReceiver;
- (BOOL)shouldShowCollaboratorCursors;
- (_TtC8Freeform25CRLSelectionPathValidator)selectionPathValidator;
- (_TtC8Freeform32CRLCollaboratorCursorCoordinator)init;
- (_TtC8Freeform32CRLCollaboratorCursorCoordinator)initWithSelectionPathValidator:(id)a3;
- (id)collaboratorCursorSelectionPathForRenderer:(id)a3 collaboratorPresence:(id)a4;
- (id)selectionStateSnapshot;
- (void)dispatchSelectionPath:(id)a3 withFlags:(unint64_t)a4;
- (void)invalidateCursorWithCollaboratorPresence:(id)a3;
- (void)registerCursorRenderer:(id)a3;
- (void)setShouldShowCollaboratorCursors:(BOOL)a3;
- (void)unregisterCursorRenderer:(id)a3;
- (void)updateCollaboratorOwnershipWithPresenceUUID:(id)a3;
- (void)updateCursorInformationWithSelectionPath:(id)a3 collaboratorPresence:(id)a4;
- (void)validateSelectionStateUsing:(id)a3;
- (void)willTeardownRenderer:(id)a3;
@end

@implementation CRLCollaboratorCursorCoordinator

- (_TtC8Freeform25CRLSelectionPathValidator)selectionPathValidator
{
  return (_TtC8Freeform25CRLSelectionPathValidator *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                             + OBJC_IVAR____TtC8Freeform32CRLCollaboratorCursorCoordinator_selectionPathValidator));
}

- (_TtC8Freeform32CRLCollaboratorCursorCoordinator)initWithSelectionPathValidator:(id)a3
{
  id v3 = a3;
  v4 = (_TtC8Freeform32CRLCollaboratorCursorCoordinator *)sub_100BBE9EC(v3);

  return v4;
}

- (BOOL)shouldShowCollaboratorCursors
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC8Freeform32CRLCollaboratorCursorCoordinator_shouldShowCollaboratorCursors);
}

- (void)setShouldShowCollaboratorCursors:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLCollaboratorCursorCoordinator_shouldShowCollaboratorCursors) = a3;
  id v3 = self;
  sub_100BBBAF8();
}

- (void)registerCursorRenderer:(id)a3
{
}

- (void)unregisterCursorRenderer:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  [a3 setCollaboratorCursorDelegate:0];
  [*(id *)((char *)&v5->super.isa+ OBJC_IVAR____TtC8Freeform32CRLCollaboratorCursorCoordinator__collaboratorCursorRenderers) removeObject:a3];
  swift_unknownObjectRelease();
}

- (void)updateCursorInformationWithSelectionPath:(id)a3 collaboratorPresence:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_100BBC814(a3, v8);
}

- (void)updateCollaboratorOwnershipWithPresenceUUID:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  id v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  sub_100BBCA78((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)invalidateCursorWithCollaboratorPresence:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100BBD120(v4);
}

- (_TtC8Freeform32CRLCollaboratorCursorCoordinator)init
{
  result = (_TtC8Freeform32CRLCollaboratorCursorCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLCollaboratorCursorCoordinator_selectionPathValidator));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform32CRLCollaboratorCursorCoordinator__collaboratorCursorRenderers);
}

- (id)collaboratorCursorSelectionPathForRenderer:(id)a3 collaboratorPresence:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  uint64_t v7 = self;
  id v8 = (void *)sub_100BBEAD4((uint64_t)v6);
  swift_unknownObjectRelease();

  return v8;
}

- (void)willTeardownRenderer:(id)a3
{
}

- (void)dispatchSelectionPath:(id)a3 withFlags:(unint64_t)a4
{
  id v5 = a3;
  id v6 = self;
  sub_10086134C((uint64_t)&_mh_execute_header, (uint64_t)"dispatchSelectionPath(_:withFlags:)", 35, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorCoordinator.swift", 102, 2, 186, (uint64_t)"This should never be sent a real selection path", 47, 2u, (uint64_t)_swiftEmptyArrayStorage);
  sub_100586FD4((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"This should never be sent a real selection path");
  sub_1005871AC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"dispatchSelectionPath(_:withFlags:)", 35, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorCoordinator.swift", 102, 2, 186);
  SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v7, v8);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

- (BOOL)isPrimarySelectionPathReceiver
{
  return 0;
}

- (id)selectionStateSnapshot
{
  return 0;
}

- (void)validateSelectionStateUsing:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100BBEB74();
}

@end