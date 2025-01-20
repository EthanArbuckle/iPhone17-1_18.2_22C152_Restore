@interface CRLEditingCoordinator
- (BOOL)areIncomingCollaborativeChangesSuspended;
- (BOOL)canPerformUserAction;
- (BOOL)enableCollaboratorCursors;
- (BOOL)isInRealTimeSyncSession;
- (BOOL)realTimeSessionNeedsAccountUpgrade;
- (BOOL)realTimeSessionUsesEncryption;
- (CRLChangeNotifier)changeNotifier;
- (CRLUndoManager)undoManager;
- (_TtC8Freeform13CRLBoardActor)boardActor;
- (_TtC8Freeform19CRLBoardItemFactory)boardItemFactory;
- (_TtC8Freeform20CRLCommandController)commandController;
- (_TtC8Freeform20CRLFollowCoordinator)followCoordinator;
- (_TtC8Freeform21CRLEditingCoordinator)init;
- (_TtC8Freeform21CRLUIPropertyNotifier)uiPropertyNotifier;
- (_TtC8Freeform22CRLSelectionDispatcher)selectionDispatcher;
- (_TtC8Freeform32CRLCollaboratorCursorCoordinator)collaboratorCursorCoordinator;
- (_TtC8Freeform8CRLBoard)mainBoard;
- (id)boardForPasteboardController:(id)a3;
- (id)boardItemFactoryForPasteboardController:(id)a3;
- (id)sourceContextForPasteboardController:(id)a3;
- (void)addShareObserver:(id)a3;
- (void)canPerformUserActionUsingBlock:(id)a3;
- (void)currentUserGainedEditPermissions;
- (void)currentUserLostEditPermissions;
- (void)didProcessAuxiliaryRealTimeChanges;
- (void)processChanges:(id)a3 forChangeSource:(id)a4;
- (void)removeShareObserver:(id)a3;
- (void)resumeCollaborationWithReason:(id)a3;
- (void)setBoardItemFactory:(id)a3;
- (void)setEnableCollaboratorCursors:(BOOL)a3;
- (void)setRealTimeSessionNeedsAccountUpgrade:(BOOL)a3;
- (void)setRealTimeSessionUsesEncryption:(BOOL)a3;
- (void)shareStateUpdatedWithShare:(id)a3;
- (void)suspendCollaborationWithReason:(id)a3;
- (void)willProcessAuxiliaryRealTimeChanges;
- (void)willRedo;
@end

@implementation CRLEditingCoordinator

- (void)willProcessAuxiliaryRealTimeChanges
{
  v2 = self;
  sub_1007F5524();
}

- (void)didProcessAuxiliaryRealTimeChanges
{
  v2 = self;
  sub_1007F58F4();
}

- (_TtC8Freeform8CRLBoard)mainBoard
{
  return (_TtC8Freeform8CRLBoard *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_mainBoard));
}

- (_TtC8Freeform13CRLBoardActor)boardActor
{
  v2 = (void *)swift_retain();

  return (_TtC8Freeform13CRLBoardActor *)v2;
}

- (_TtC8Freeform20CRLCommandController)commandController
{
  return (_TtC8Freeform20CRLCommandController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                        + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_commandController));
}

- (CRLUndoManager)undoManager
{
  return (CRLUndoManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                   + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_undoManager));
}

- (CRLChangeNotifier)changeNotifier
{
  return (CRLChangeNotifier *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_changeNotifier));
}

- (_TtC8Freeform21CRLUIPropertyNotifier)uiPropertyNotifier
{
  return (_TtC8Freeform21CRLUIPropertyNotifier *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                         + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_uiPropertyNotifier));
}

- (_TtC8Freeform19CRLBoardItemFactory)boardItemFactory
{
  return (_TtC8Freeform19CRLBoardItemFactory *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                       + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_boardItemFactory));
}

- (void)setBoardItemFactory:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_boardItemFactory);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_boardItemFactory) = (Class)a3;
  id v3 = a3;
}

- (_TtC8Freeform22CRLSelectionDispatcher)selectionDispatcher
{
  return (_TtC8Freeform22CRLSelectionDispatcher *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                          + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_selectionDispatcher));
}

- (_TtC8Freeform32CRLCollaboratorCursorCoordinator)collaboratorCursorCoordinator
{
  return (_TtC8Freeform32CRLCollaboratorCursorCoordinator *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_collaboratorCursorCoordinator);
}

- (_TtC8Freeform20CRLFollowCoordinator)followCoordinator
{
  return (_TtC8Freeform20CRLFollowCoordinator *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                        + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_followCoordinator));
}

- (BOOL)enableCollaboratorCursors
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = self;
  static Published.subscript.getter();
  swift_release();
  swift_release();

  return v5;
}

- (void)setEnableCollaboratorCursors:(BOOL)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = self;
  static Published.subscript.setter();
  sub_10081A3D8();
}

- (void)addShareObserver:(id)a3
{
}

- (void)removeShareObserver:(id)a3
{
}

- (void)canPerformUserActionUsingBlock:(id)a3
{
  id v4 = _Block_copy(a3);
  _Block_copy(v4);
  BOOL v5 = self;
  sub_10081D9E4((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (BOOL)canPerformUserAction
{
  v2 = self;
  BOOL v3 = sub_10081BA04();

  return v3;
}

- (BOOL)isInRealTimeSyncSession
{
  uint64_t v3 = sub_1005057FC((uint64_t *)&unk_10169A1A0);
  __chkstk_darwin(v3 - 8, v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_mainBoard)
     + OBJC_IVAR____TtC8Freeform8CRLBoard_realTimeSessionInfo;
  swift_beginAccess();
  sub_100522E9C((uint64_t)v7, (uint64_t)v6, (uint64_t *)&unk_10169A1A0);
  uint64_t v8 = type metadata accessor for CRLBoard.RealTimeSessionInfo(0);
  LOBYTE(v7) = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v6, 1, v8) != 1;
  sub_100522F00((uint64_t)v6, (uint64_t *)&unk_10169A1A0);
  return (char)v7;
}

- (BOOL)realTimeSessionUsesEncryption
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_realTimeSessionUsesEncryption);
}

- (void)setRealTimeSessionUsesEncryption:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_realTimeSessionUsesEncryption) = a3;
}

- (BOOL)realTimeSessionNeedsAccountUpgrade
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_realTimeSessionNeedsAccountUpgrade);
}

- (void)setRealTimeSessionNeedsAccountUpgrade:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_realTimeSessionNeedsAccountUpgrade) = a3;
}

- (void)suspendCollaborationWithReason:(id)a3
{
}

- (void)resumeCollaborationWithReason:(id)a3
{
}

- (BOOL)areIncomingCollaborativeChangesSuspended
{
  return sub_10081BCFC() & 1;
}

- (void)willRedo
{
  v2 = self;
  sub_10081BD78();
}

- (void)shareStateUpdatedWithShare:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10081BF14(a3);
}

- (void)currentUserLostEditPermissions
{
  v2 = self;
  sub_10081C1F4();
}

- (void)currentUserGainedEditPermissions
{
  v2 = self;
  sub_10081C248();
}

- (_TtC8Freeform21CRLEditingCoordinator)init
{
  result = (_TtC8Freeform21CRLEditingCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_collaboratorCursorCoordinator));

  swift_release();
  swift_release();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator__enableCollaboratorCursors;
  uint64_t v4 = sub_1005057FC(&qword_10169FCE0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  sub_100522F00((uint64_t)self + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_crlaxAnyRemoteEditDidHappenCancellable, &qword_101681D68);
}

- (void)processChanges:(id)a3 forChangeSource:(id)a4
{
  type metadata accessor for CRLChangeRecord();
  unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_unknownObjectRetain();
  v6 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_10081C6EC(v5);

  swift_bridgeObjectRelease();
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0((uint64_t)&v7);
}

- (id)boardForPasteboardController:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_mainBoard));
}

- (id)boardItemFactoryForPasteboardController:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_boardItemFactory));
}

- (id)sourceContextForPasteboardController:(id)a3
{
  uint64_t v3 = *(char **)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_mainBoard)
                + OBJC_IVAR____TtC8Freeform8CRLBoard_store);
  uint64_t v4 = (objc_class *)type metadata accessor for CRLPasteboardSourceContext();
  unint64_t v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR____TtC8Freeform26CRLPasteboardSourceContext__store] = v3;
  v6 = *(void **)&v3[OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_crdtContext];
  *(void *)&v5[OBJC_IVAR____TtC8Freeform26CRLPasteboardSourceContext__sourceContext] = v6;
  v11.receiver = v5;
  v11.super_class = v4;
  uint64_t v7 = v3;
  id v8 = v6;
  v9 = [(CRLEditingCoordinator *)&v11 init];

  return v9;
}

@end