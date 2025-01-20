@interface ICSelectionStateController
- (BOOL)canNavigateBackwards;
- (BOOL)canNavigateForwards;
- (BOOL)hasDeferredItem;
- (BOOL)objectSelectionHasChangedComparedToModel:(id)a3;
- (BOOL)selectedContainerEqualTo:(id)a3;
- (ICActivityStreamSelection)activityStreamSelection;
- (ICItemIdentifier)mostRecentNonSearchContainerItemID;
- (ICItemIdentifier)selectedNoteBrowseContainerItemID;
- (ICSearchResult)currentSelectedSearchResult;
- (ICSelectionStateModelContainerSelectionOptions)containerSelectionOptions;
- (ICSelectionStateModelObjectSelectionOptions)objectSelectionOptions;
- (ICTagSelection)tagSelection;
- (ICTextViewScrollState)scrollState;
- (ICVirtualSmartFolderItemIdentifier)selectedVirtualSmartFolderItemID;
- (NSArray)mostRecentSelections;
- (NSDictionary)currentFirstVisibleObjectIDURLForContainerObjectIDURL;
- (NSManagedObjectID)focusedNoteObjectID;
- (NSManagedObjectID)mostRecentSelectedObjectID;
- (NSManagedObjectID)previousSelectedNoteObjectID;
- (NSManagedObjectID)selectedInvitationObjectID;
- (NSManagedObjectID)selectedNoteBrowseContainerObjectID;
- (NSManagedObjectID)selectedNoteObjectID;
- (NSManagedObjectID)selectedObjectID;
- (_TtC11MobileNotes26ICSelectionStateController)init;
- (_TtC11MobileNotes26ICSelectionStateController)initWithPersistenceConfiguration:(id)a3;
- (_TtP11MobileNotes34ICSelectionStateControllerDelegate_)delegate;
- (id)dataRepresentationWithEditorModel:(id)a3;
- (id)mostRecentSelectedContainer;
- (int64_t)activityStreamViewMode;
- (void)adoptCurrentModelWithArchive:(id)a3 systemPaperAccountAlert:(BOOL)a4 completion:(id)a5;
- (void)adoptDeferredAnimated:(BOOL)a3 startEditing:(BOOL)a4;
- (void)adoptInstantNoteModel:(id)a3 archive:(id)a4;
- (void)adoptModel:(id)a3 withArchive:(id)a4 systemPaperAccountAlert:(BOOL)a5 completion:(id)a6;
- (void)clear;
- (void)dealloc;
- (void)navigateBackwards;
- (void)navigateForwards;
- (void)navigationControllerDidTransitionWithNewContainerItemID:(id)a3 newTagSelection:(id)a4 forgetObjectSelection:(BOOL)a5;
- (void)openURL:(id)a3 rootNoteBrowseViewController:(id)a4 currentNoteContainerViewMode:(int64_t)a5 completion:(id)a6;
- (void)pushAttachmentSelectionWithObjectID:(id)a3 scrollState:(id)a4 startEditing:(BOOL)a5 showInkPicker:(BOOL)a6 dismissOverlayContent:(BOOL)a7 showLatestUpdatesIfAvailable:(BOOL)a8 animated:(BOOL)a9 ensurePresented:(BOOL)a10;
- (void)pushAttachmentSelectionWithObjectID:(id)a3 scrollState:(id)a4 startEditing:(BOOL)a5 showInkPicker:(BOOL)a6 dismissOverlayContent:(BOOL)a7 showLatestUpdatesIfAvailable:(BOOL)a8 animated:(BOOL)a9 ensurePresented:(BOOL)a10 searchResult:(id)a11;
- (void)pushAutoselectedObjectWithObjectID:(id)a3;
- (void)pushContainerSelectionWithObjectID:(id)a3;
- (void)pushContainerSelectionWithObjectID:(id)a3 forceApply:(BOOL)a4 noteBrowseViewController:(id)a5 usingRootViewController:(BOOL)a6 deferUntilDataLoaded:(BOOL)a7 dismissOverlayContent:(id)a8 animated:(BOOL)a9 ensurePresented:(BOOL)a10 ensureSelectedNote:(id)a11 keepEditorShowing:(id)a12 containerSelectionCompletionBlocks:(id)a13;
- (void)pushContainerSelectionWithObjectID:(id)a3 noteBrowseViewController:(id)a4 usingRootViewController:(BOOL)a5 deferUntilDataLoaded:(BOOL)a6 dismissOverlayContent:(id)a7 animated:(BOOL)a8 ensurePresented:(BOOL)a9 ensureSelectedNote:(id)a10 keepEditorShowing:(id)a11 containerSelectionCompletionBlocks:(id)a12;
- (void)pushInvitationWithObjectID:(id)a3 animated:(BOOL)a4;
- (void)pushModel:(id)a3 navigating:(BOOL)a4;
- (void)pushNoteSelectionWithObjectID:(id)a3;
- (void)pushNoteSelectionWithObjectID:(id)a3 scrollState:(id)a4 startEditing:(BOOL)a5 showInkPicker:(BOOL)a6 dismissOverlayContent:(BOOL)a7 showLatestUpdatesIfAvailable:(BOOL)a8 animated:(BOOL)a9 ensurePresented:(BOOL)a10;
- (void)pushNoteSelectionWithObjectID:(id)a3 scrollState:(id)a4 startEditing:(BOOL)a5 showInkPicker:(BOOL)a6 dismissOverlayContent:(BOOL)a7 showLatestUpdatesIfAvailable:(BOOL)a8 animated:(BOOL)a9 ensurePresented:(BOOL)a10 searchResult:(id)a11;
- (void)pushObjectWithObjectID:(id)a3;
- (void)pushSearchResult:(id)a3 animated:(BOOL)a4;
- (void)pushTagSelection:(id)a3;
- (void)setActivityStreamSelection:(id)a3;
- (void)setActivityStreamViewMode:(int64_t)a3;
- (void)setCurrentSelectedSearchResult:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setup;
- (void)setupWithArchive:(id)a3;
- (void)willDismissSearch;
@end

@implementation ICSelectionStateController

- (void)setupWithArchive:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1000282FC(a3);
}

- (NSDictionary)currentFirstVisibleObjectIDURLForContainerObjectIDURL
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_selectionStateAccessQueue);
  v3 = self;
  id v4 = v2;
  sub_10002F214((uint64_t *)&unk_1006A2AC0);
  OS_dispatch_queue.sync<A>(execute:)();

  if (v7)
  {
    type metadata accessor for URL();
    sub_10001DD30((unint64_t *)&unk_10069BA10, (void (*)(uint64_t))&type metadata accessor for URL);
    v5.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v5.super.isa = 0;
  }

  return (NSDictionary *)v5.super.isa;
}

- (void)adoptCurrentModelWithArchive:(id)a3 systemPaperAccountAlert:(BOOL)a4 completion:(id)a5
{
  v8 = (uint64_t (*)())_Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v8 = sub_100290188;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  v11 = self;
  sub_100014A08((uint64_t)v10, a4, v8, v9);
  sub_10002E70C((uint64_t)v8);
}

- (NSManagedObjectID)focusedNoteObjectID
{
  return (NSManagedObjectID *)sub_10002FF1C((char *)self, (uint64_t)a2, &qword_10069D520);
}

- (NSManagedObjectID)selectedNoteBrowseContainerObjectID
{
  return (NSManagedObjectID *)sub_10002FF1C((char *)self, (uint64_t)a2, &qword_10069D520);
}

- (NSManagedObjectID)selectedNoteObjectID
{
  return (NSManagedObjectID *)sub_10002FF1C((char *)self, (uint64_t)a2, &qword_10069D520);
}

- (ICItemIdentifier)selectedNoteBrowseContainerItemID
{
  return (ICItemIdentifier *)sub_10002FF1C((char *)self, (uint64_t)a2, (uint64_t *)&unk_10069E820);
}

- (ICTagSelection)tagSelection
{
  return (ICTagSelection *)sub_10002FF1C((char *)self, (uint64_t)a2, &qword_1006A2AE8);
}

- (void)setDelegate:(id)a3
{
}

- (_TtC11MobileNotes26ICSelectionStateController)initWithPersistenceConfiguration:(id)a3
{
  return (_TtC11MobileNotes26ICSelectionStateController *)sub_10001D474(a3);
}

- (ICVirtualSmartFolderItemIdentifier)selectedVirtualSmartFolderItemID
{
  return (ICVirtualSmartFolderItemIdentifier *)sub_10002FF1C((char *)self, (uint64_t)a2, &qword_1006A2AE0);
}

- (NSManagedObjectID)selectedInvitationObjectID
{
  return (NSManagedObjectID *)sub_10002FF1C((char *)self, (uint64_t)a2, &qword_10069D520);
}

- (ICActivityStreamSelection)activityStreamSelection
{
  return (ICActivityStreamSelection *)sub_10002FF1C((char *)self, (uint64_t)a2, &qword_1006A2AD0);
}

- (_TtP11MobileNotes34ICSelectionStateControllerDelegate_)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP11MobileNotes34ICSelectionStateControllerDelegate_ *)Strong;
}

- (void)dealloc
{
  v2 = self;
  sub_1002EDC34();
}

- (void).cxx_destruct
{
  sub_10015E5E8((uint64_t)self + OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_selectionStateAccessQueue));
  id v4 = *(void **)&self->selectionStateAccessQueue[OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_selectionStateQueue];
  uint64_t v3 = *(void *)&self->selectionStateQueue[OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_selectionStateQueue];
  uint64_t v5 = *(void *)&self->selectionStateQueue[OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_selectionStateQueue
                                           + 16];
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_selectionStateQueue));

  sub_10002E70C(v3);
  sub_10002E70C(v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6 = (char *)self + OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_logger;
  uint64_t v7 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_persistenceConfiguration));
  sub_10002977C(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_utilityConfiguration), *(void *)&self->delegate[OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_utilityConfiguration], *(void *)&self->selectionStateAccessQueue[OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_utilityConfiguration], *(void *)&self->selectionStateQueue[OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_utilityConfiguration], *(void **)&self->selectionStateQueue[OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_utilityConfiguration+ 8], *(void **)&self->selectionStateQueue[OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_utilityConfiguration+ 16], *(void *)&self->selectionStateQueue[OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_utilityConfiguration+ 24], *(void *)&self->selectionStateQueue[OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_utilityConfiguration+ 32], *(void *)&self->selectionStateQueue[OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_utilityConfiguration+ 40]);
}

- (void)setup
{
  v2 = self;
  sub_1000282FC(0);
}

- (void)adoptModel:(id)a3 withArchive:(id)a4 systemPaperAccountAlert:(BOOL)a5 completion:(id)a6
{
  id v10 = (uint64_t (*)())_Block_copy(a6);
  if (v10)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v10;
    id v10 = sub_1001A36C4;
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  sub_1002EE450(v12, (uint64_t)v13, a5, v10, v11);
  sub_10002E70C((uint64_t)v10);
}

- (void)adoptDeferredAnimated:(BOOL)a3 startEditing:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v6 = self;
  sub_1002EE7B4(v5, v4);
}

- (void)adoptInstantNoteModel:(id)a3 archive:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1002EF228(v6, (uint64_t)v7);
}

- (id)dataRepresentationWithEditorModel:(id)a3
{
  BOOL v4 = self;
  id v5 = a3;
  uint64_t v6 = sub_1002EF4AC(a3);
  unint64_t v8 = v7;

  if (v8 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_1001A3F54(v6, v8);
  }

  return isa;
}

- (void)clear
{
  v2 = self;
  sub_1002EFA8C();
}

- (void)pushTagSelection:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1002EFDAC(a3);
}

- (void)pushContainerSelectionWithObjectID:(id)a3
{
  swift_unknownObjectRetain();
  id v5 = self;
  sub_1002F0FA0((uint64_t)a3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  swift_unknownObjectRelease();
}

- (void)pushContainerSelectionWithObjectID:(id)a3 noteBrowseViewController:(id)a4 usingRootViewController:(BOOL)a5 deferUntilDataLoaded:(BOOL)a6 dismissOverlayContent:(id)a7 animated:(BOOL)a8 ensurePresented:(BOOL)a9 ensureSelectedNote:(id)a10 keepEditorShowing:(id)a11 containerSelectionCompletionBlocks:(id)a12
{
  swift_unknownObjectRetain();
  id v21 = a4;
  id v20 = a7;
  id v16 = a10;
  id v17 = a11;
  id v18 = a12;
  v19 = self;
  sub_1002F0FA0((uint64_t)a3, 0, (uint64_t)a4, a5, a6, a7, a8, a9, a10, a11, a12);
  swift_unknownObjectRelease();
}

- (void)pushContainerSelectionWithObjectID:(id)a3 forceApply:(BOOL)a4 noteBrowseViewController:(id)a5 usingRootViewController:(BOOL)a6 deferUntilDataLoaded:(BOOL)a7 dismissOverlayContent:(id)a8 animated:(BOOL)a9 ensurePresented:(BOOL)a10 ensureSelectedNote:(id)a11 keepEditorShowing:(id)a12 containerSelectionCompletionBlocks:(id)a13
{
  swift_unknownObjectRetain();
  id v22 = a5;
  id v21 = a8;
  id v17 = a11;
  id v18 = a12;
  id v19 = a13;
  id v20 = self;
  sub_1002F0FA0((uint64_t)a3, a4, (uint64_t)a5, a6, a7, a8, a9, a10, a11, a12, a13);
  swift_unknownObjectRelease();
}

- (void)pushAutoselectedObjectWithObjectID:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1002F153C(a3);
}

- (void)pushNoteSelectionWithObjectID:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1002F19F4(a3, 0, 0, 0, 0, 0, 0, 0, 0);
}

- (void)pushNoteSelectionWithObjectID:(id)a3 scrollState:(id)a4 startEditing:(BOOL)a5 showInkPicker:(BOOL)a6 dismissOverlayContent:(BOOL)a7 showLatestUpdatesIfAvailable:(BOOL)a8 animated:(BOOL)a9 ensurePresented:(BOOL)a10
{
}

- (void)pushNoteSelectionWithObjectID:(id)a3 scrollState:(id)a4 startEditing:(BOOL)a5 showInkPicker:(BOOL)a6 dismissOverlayContent:(BOOL)a7 showLatestUpdatesIfAvailable:(BOOL)a8 animated:(BOOL)a9 ensurePresented:(BOOL)a10 searchResult:(id)a11
{
}

- (void)pushAttachmentSelectionWithObjectID:(id)a3 scrollState:(id)a4 startEditing:(BOOL)a5 showInkPicker:(BOOL)a6 dismissOverlayContent:(BOOL)a7 showLatestUpdatesIfAvailable:(BOOL)a8 animated:(BOOL)a9 ensurePresented:(BOOL)a10
{
}

- (void)pushAttachmentSelectionWithObjectID:(id)a3 scrollState:(id)a4 startEditing:(BOOL)a5 showInkPicker:(BOOL)a6 dismissOverlayContent:(BOOL)a7 showLatestUpdatesIfAvailable:(BOOL)a8 animated:(BOOL)a9 ensurePresented:(BOOL)a10 searchResult:(id)a11
{
}

- (void)pushInvitationWithObjectID:(id)a3 animated:(BOOL)a4
{
  id v7 = a3;
  unint64_t v8 = self;
  sub_1002F1650(a3, a4);
}

- (void)pushObjectWithObjectID:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1002F2890(a3);
}

- (void)navigationControllerDidTransitionWithNewContainerItemID:(id)a3 newTagSelection:(id)a4 forgetObjectSelection:(BOOL)a5
{
  swift_unknownObjectRetain();
  id v9 = a4;
  id v10 = self;
  sub_1002F2F68((uint64_t)a3, a4, a5);
  swift_unknownObjectRelease();
}

- (void)pushSearchResult:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  sub_1002F3634(v6, a4);
}

- (void)pushModel:(id)a3 navigating:(BOOL)a4
{
  if (a3)
  {
    id v7 = self;
    id v6 = (char *)a3;
    sub_1002EE050(v6, 1, 0, 0, a4);
  }
}

- (void)willDismissSearch
{
  v2 = self;
  sub_1002F3A30();
}

- (void)openURL:(id)a3 rootNoteBrowseViewController:(id)a4 currentNoteContainerViewMode:(int64_t)a5 completion:(id)a6
{
  uint64_t v10 = sub_10002F214(&qword_10069B310);
  __chkstk_darwin(v10 - 8);
  id v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = (void (*)(uint64_t))_Block_copy(a6);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v14 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v12, 0, 1, v14);
  }
  else
  {
    uint64_t v15 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  }
  if (v13)
  {
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v13;
    id v13 = (void (*)(uint64_t))sub_1001A36CC;
  }
  else
  {
    uint64_t v16 = 0;
  }
  id v17 = a4;
  id v18 = self;
  sub_1002FA638((uint64_t)v12, a4, v13, v16);
  sub_10002E70C((uint64_t)v13);

  sub_10002B754((uint64_t)v12, &qword_10069B310);
}

- (void)navigateBackwards
{
  v2 = self;
  sub_1002F48CC();
}

- (void)navigateForwards
{
  v2 = self;
  sub_1002F5130();
}

- (ICSelectionStateModelContainerSelectionOptions)containerSelectionOptions
{
  return (ICSelectionStateModelContainerSelectionOptions *)sub_1002F5FE8((char *)self, (uint64_t)a2, (void (*)(void))type metadata accessor for ICSelectionStateModel.ContainerSelectionOptions);
}

- (NSManagedObjectID)selectedObjectID
{
  return (NSManagedObjectID *)sub_10002FF1C((char *)self, (uint64_t)a2, &qword_10069D520);
}

- (NSManagedObjectID)previousSelectedNoteObjectID
{
  return (NSManagedObjectID *)sub_10002FF1C((char *)self, (uint64_t)a2, &qword_10069D520);
}

- (ICSelectionStateModelObjectSelectionOptions)objectSelectionOptions
{
  return (ICSelectionStateModelObjectSelectionOptions *)sub_1002F5FE8((char *)self, (uint64_t)a2, (void (*)(void))type metadata accessor for ICSelectionStateModel.ObjectSelectionOptions);
}

- (ICTextViewScrollState)scrollState
{
  return (ICTextViewScrollState *)sub_10002FF1C((char *)self, (uint64_t)a2, &qword_1006A2AD8);
}

- (void)setActivityStreamSelection:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_1002F6388(a3);
}

- (int64_t)activityStreamViewMode
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_selectionStateAccessQueue);
  uint64_t v3 = self;
  id v4 = v2;
  OS_dispatch_queue.sync<A>(execute:)();

  return v6;
}

- (void)setActivityStreamViewMode:(int64_t)a3
{
  id v4 = self;
  sub_1002F6754(a3);
}

- (ICSearchResult)currentSelectedSearchResult
{
  return (ICSearchResult *)sub_10002FF1C((char *)self, (uint64_t)a2, &qword_10069D9B0);
}

- (void)setCurrentSelectedSearchResult:(id)a3
{
  id v5 = a3;
  int64_t v6 = self;
  sub_1002F6A88(a3);
}

- (ICItemIdentifier)mostRecentNonSearchContainerItemID
{
  return (ICItemIdentifier *)sub_10002FF1C((char *)self, (uint64_t)a2, (uint64_t *)&unk_10069E820);
}

- (id)mostRecentSelectedContainer
{
  return sub_10002FF1C((char *)self, (uint64_t)a2, &qword_1006A2AB8);
}

- (NSManagedObjectID)mostRecentSelectedObjectID
{
  return (NSManagedObjectID *)sub_10002FF1C((char *)self, (uint64_t)a2, &qword_10069D520);
}

- (BOOL)canNavigateBackwards
{
  return sub_1002F7A9C((char *)self);
}

- (BOOL)canNavigateForwards
{
  return sub_1002F7A9C((char *)self);
}

- (BOOL)hasDeferredItem
{
  return sub_1002F7A9C((char *)self);
}

- (BOOL)objectSelectionHasChangedComparedToModel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_selectionStateAccessQueue);
  id v5 = a3;
  int64_t v6 = self;
  id v7 = v4;
  OS_dispatch_queue.sync<A>(execute:)();

  return v9;
}

- (BOOL)selectedContainerEqualTo:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11MobileNotes26ICSelectionStateController_selectionStateAccessQueue);
  swift_unknownObjectRetain();
  id v5 = self;
  id v6 = v4;
  OS_dispatch_queue.sync<A>(execute:)();
  swift_unknownObjectRelease();

  return v8;
}

- (NSArray)mostRecentSelections
{
  v2 = self;
  sub_1002F83F8();

  type metadata accessor for ICSelectionStateModel(0);
  v3.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (_TtC11MobileNotes26ICSelectionStateController)init
{
  result = (_TtC11MobileNotes26ICSelectionStateController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end