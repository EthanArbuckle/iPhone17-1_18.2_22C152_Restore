@interface CRLiOSFolderGridViewController
- (BOOL)accessibilityPerformEscape;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (NSUndoManager)undoManager;
- (UIWindow)keyboardObserversWindow;
- (_TtC8Freeform30CRLiOSFolderGridViewController)initWithCoder:(id)a3;
- (_TtC8Freeform30CRLiOSFolderGridViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC8Freeform30CRLiOSFolderGridViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)itemThumbnailDataForCloudSharingController:(id)a3;
- (id)itemTitleForCloudSharingController:(id)a3;
- (void)calendarDayDidChange;
- (void)cloudSharingController:(id)a3 failedToSaveShareWithError:(id)a4;
- (void)cloudSharingControllerDidSaveShare:(id)a3;
- (void)cloudSharingControllerDidStopSharing:(id)a3;
- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionViewDidEndMultipleSelectionInteraction:(id)a3;
- (void)dealloc;
- (void)didRecognizeSingleContinuousTouchGesture:(id)a3;
- (void)find:(id)a3;
- (void)handleBoardLibrarySnapshotUpdateWithNotification:(id)a3;
- (void)iCloudStatusDidChangeWithNotification:(id)a3;
- (void)keyboardWillHideOrUndock:(id)a3;
- (void)keyboardWillShowOrDock:(id)a3;
- (void)newBoard:(id)a3;
- (void)observedTraitsDidChange;
- (void)redo:(id)a3;
- (void)reloadAllItems;
- (void)restoreUserActivityState:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)shareFailedWithError:(id)a3 recordID:(id)a4;
- (void)undo:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)validateCommand:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CRLiOSFolderGridViewController

- (NSUndoManager)undoManager
{
  sub_100DB9788();

  return (NSUndoManager *)v2;
}

- (_TtC8Freeform30CRLiOSFolderGridViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100DB98DC();
}

- (_TtC8Freeform30CRLiOSFolderGridViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  sub_100DB98DC();
}

- (void)dealloc
{
  v2 = self;
  sub_100D740CC();
}

- (void).cxx_destruct
{
  sub_100DBFA10((uint64_t)self + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_folder, type metadata accessor for CRLBoardLibraryViewModel.Folder);
  sub_100523398((uint64_t)self + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_delegate);
  sub_100523398((uint64_t)self + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_thumbnailProvider);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController____lazy_storage___diffableDataSource));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_boardPreviewImageCache));
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_gridLayout));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_listLayout));
  sub_100522F00((uint64_t)self + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_iCloudStatusObserver, &qword_101672BF0);
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_100522F00((uint64_t)self + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController__currentSnapshotWithExpandedSections, (uint64_t *)&unk_10169B500);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController____lazy_storage___layoutBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController____lazy_storage___toolbarItemToAddBoard));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController____lazy_storage___toolbarItemToSelectAllOrNone));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController____lazy_storage___editModeToolbarButtonToDuplicateSelectedItems));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController____lazy_storage___emptyFolderViewController));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_emptyFolderBottomConstraint);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100D745C8();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100D75148(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_100D75DAC(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLiOSFolderGridViewController();
  id v4 = v5.receiver;
  [(CRLiOSFolderGridViewController *)&v5 viewWillDisappear:v3];
  [v4 setEditing:0 animated:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  sub_100D7618C(a3);
}

- (void)observedTraitsDidChange
{
  v2 = self;
  sub_100D766E0();
}

- (void)handleBoardLibrarySnapshotUpdateWithNotification:(id)a3
{
}

- (void)reloadAllItems
{
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    v6 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  unsigned __int8 v8 = sub_100D79494((uint64_t)a3, (uint64_t)v10);

  sub_100522F00((uint64_t)v10, &qword_101672BF0);
  return v8 & 1;
}

- (void)validateCommand:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CRLiOSFolderGridViewController();
  id v4 = a3;
  id v5 = v7.receiver;
  [(CRLiOSFolderGridViewController *)&v7 validateCommand:v4];
  [v4 action];
  v6 = (NSString *)String._bridgeToObjectiveC()();
  NSSelectorFromString(v6);

  if (static Selector.== infix(_:_:)() & 1) != 0 && (sub_100D79DE8()) {
    [v4 setAttributes:1];
  }
}

- (void)find:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  sub_100D79C48();

  sub_100522F00((uint64_t)v6, &qword_101672BF0);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)undo:(id)a3
{
}

- (void)redo:(id)a3
{
}

- (void)restoreUserActivityState:(id)a3
{
  id v5 = a3;
  id v4 = self;
  sub_100D7A8D0(v5);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v5 = a3;
  v6 = self;
  sub_100D7F3B8(v5, a4);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_100D7FA34(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return self & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
}

- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_100DB9F44();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return self & 1;
}

- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_isCurrentlyInMultipleSelectionInteraction) = 1;
  id v11 = a3;
  v12 = self;
  if (![(CRLiOSFolderGridViewController *)v12 isEditing]
    || ![v11 isEditing])
  {
    [(CRLiOSFolderGridViewController *)v12 setEditing:1 animated:1];
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)collectionViewDidEndMultipleSelectionInteraction:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_isCurrentlyInMultipleSelectionInteraction) = 0;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  id v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  uint64_t v13 = self;
  id v14 = sub_100DBA194(v12, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);

  return v14;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  uint64_t v9 = self;
  sub_100D827C8(v10, v8, a5);

  swift_unknownObjectRelease();
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
}

- (_TtC8Freeform30CRLiOSFolderGridViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8Freeform30CRLiOSFolderGridViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)newBoard:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    BOOL v5 = self;
  }
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_100A85B40(self);

    swift_unknownObjectRelease();
  }
  else
  {
  }
  sub_100522F00((uint64_t)v6, &qword_101672BF0);
}

- (id)itemTitleForCloudSharingController:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  NSString v6 = [v4 share];
  if (v6)
  {
    static CKShare.SystemFieldKey.title.getter();
    sub_10050BF48(0, &qword_101672C00);
    CKRecordKeyValueSetting.subscript.getter();

    swift_bridgeObjectRelease();
    if (v8)
    {
      NSString v6 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
    }
    else
    {
      NSString v6 = 0;
    }
  }
  else
  {
  }

  return v6;
}

- (void)cloudSharingControllerDidStopSharing:(id)a3
{
  uint64_t v4 = qword_10166FBE0;
  id v5 = a3;
  NSString v6 = self;
  if (v4 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v7 = (id)static OS_os_log.shareState;
  uint64_t v8 = static os_log_type_t.default.getter();
  sub_100BAC898((uint64_t)v7, (uint64_t)&_mh_execute_header, v8, (uint64_t)"Stopped sharing", 15, 2, (uint64_t)_swiftEmptyArrayStorage);
}

- (void)cloudSharingControllerDidSaveShare:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100D8C3CC(v4);
}

- (void)cloudSharingController:(id)a3 failedToSaveShareWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_100DBB878((uint64_t)v8);
}

- (id)itemThumbnailDataForCloudSharingController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  Class isa = (Class)[v4 share];
  if (isa)
  {
    static CKShare.SystemFieldKey.thumbnailImageData.getter();
    sub_10050BF48(0, &qword_101672C00);
    CKRecordKeyValueSetting.subscript.getter();

    swift_bridgeObjectRelease();
    Class isa = 0;
    if (v9 >> 60 != 15)
    {
      Class isa = Data._bridgeToObjectiveC()().super.isa;
      sub_100514260(v8, v9);
    }
  }
  else
  {
  }

  return isa;
}

- (void)iCloudStatusDidChangeWithNotification:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100D7E954();
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100D9857C(v4);
}

- (void)didRecognizeSingleContinuousTouchGesture:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  sub_100D98690((uint64_t)v6);

  sub_100522F00((uint64_t)v6, &qword_101672BF0);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100D9CF2C(v4);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  sub_100D9D320((uint64_t)v6, a4);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100D9D5E8(v4);
}

- (void)calendarDayDidChange
{
}

- (void)shareFailedWithError:(id)a3 recordID:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = self;
  sub_100D9FC94((uint64_t)v8, v6);
}

- (UIWindow)keyboardObserversWindow
{
  v2 = self;
  result = (UIWindow *)[(CRLiOSFolderGridViewController *)v2 view];
  if (result)
  {
    id v4 = result;
    id v5 = [(UIWindow *)result window];

    return (UIWindow *)v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)keyboardWillShowOrDock:(id)a3
{
}

- (void)keyboardWillHideOrUndock:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  id v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  double v9 = *(double *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_keyboardHeight);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_keyboardHeight) = 0;
  id v10 = self;
  sub_100D83A34(v9);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (BOOL)accessibilityPerformEscape
{
  v2 = self;
  char v3 = sub_10101EE0C();

  return v3 & 1;
}

@end