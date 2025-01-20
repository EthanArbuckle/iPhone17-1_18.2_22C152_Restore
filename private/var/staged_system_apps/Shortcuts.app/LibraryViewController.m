@interface LibraryViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4;
- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)scrollForNavigationTap;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)keyCommands;
- (UICollectionView)collectionView;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (_TtC9Shortcuts21LibraryViewController)initWithCoder:(id)a3;
- (_TtC9Shortcuts21LibraryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)axCreateButton;
- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 dismissalPreviewForItemAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 dropPreviewParametersForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (void)axDeleteWorkflowAction:(id)a3;
- (void)axDuplicateWorkflowAction:(id)a3;
- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)createWorkflow:(id)a3;
- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6;
- (void)dealloc;
- (void)deleteSelected:(id)a3;
- (void)deleteSelectedWorkflowsFromKeyboard;
- (void)deselectAllCells;
- (void)didBecomeActive:(id)a3;
- (void)didMoveToParentViewController:(id)a3;
- (void)duplicateSelected;
- (void)duplicateSelectedWorkflowsFromKeyboard;
- (void)finishEditing;
- (void)handleEscapeKeyboardPress;
- (void)keyboardWillChange:(id)a3;
- (void)libraryCellDidRequestComposeUI:(id)a3;
- (void)moveSelected;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)openSelectedWorkflowFromKeyboard;
- (void)presentAutoShortcutAppSettings;
- (void)removeSelected:(id)a3;
- (void)runSelectedShortcutFromKeyboard;
- (void)selectAllCells;
- (void)setCollectionView:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)startEditing;
- (void)syncUnavailableItemPressed:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation LibraryViewController

- (void)didMoveToParentViewController:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1000069E8((uint64_t)a3);
}

- (BOOL)canBecomeFirstResponder
{
  v2 = self;
  BOOL v3 = sub_100008A34();

  return v3;
}

- (void)didBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100008168();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_10000EB78((SEL *)&selRef_viewWillLayoutSubviews);
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  double v11 = sub_1000206F4(v8, (uint64_t)v9, a5);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  double v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  double v14 = self;
  sub_100021678(v12, v15, (uint64_t)v11);
  double v17 = v16;
  double v19 = v18;

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  double v20 = v17;
  double v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  sub_10001591C(self, (uint64_t)a2, a3, a4, a5, (void (*)(id))sub_10001FBF8);
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  sub_10001591C(self, (uint64_t)a2, a3, a4, a5, (void (*)(id))sub_1000159A4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)viewLayoutMarginsDidChange
{
  v2 = self;
  sub_10000EB78((SEL *)&selRef_viewLayoutMarginsDidChange);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_10002BB98(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_1000076B4(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100016868();
}

- (void)startEditing
{
  v2 = self;
  sub_100060964();
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  double v6 = self;
  sub_1000609C0(a3, a4);
}

- (void)finishEditing
{
  v2 = self;
  sub_100060E54();
}

- (void)moveSelected
{
  v2 = self;
  sub_100061088();
}

- (void)removeSelected:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v4 = self;
  sub_10006117C();

  swift_bridgeObjectRelease();
}

- (void)deleteSelected:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_100061344(v4);
}

- (void)duplicateSelected
{
  v2 = self;
  sub_100061C58();
}

- (void)selectAllCells
{
  v2 = self;
  sub_1000620D0();
}

- (void)deselectAllCells
{
  v2 = self;
  sub_1000629C0();
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  type metadata accessor for IndexPath();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  uint64_t v8 = self;
  sub_10008172C();
  uint64_t v10 = v9;

  swift_bridgeObjectRelease();

  return v10;
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5
{
  return sub_100083FF0(self, (uint64_t)a2, a3, a4, (uint64_t)a5, sub_10008C920);
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 dismissalPreviewForItemAtIndexPath:(id)a5
{
  return sub_100083FF0(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(void))sub_100083FD0);
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  uint64_t v10 = self;
  sub_100084170((uint64_t)v10, v9, a5);

  swift_unknownObjectRelease();
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  swift_unknownObjectRetain();
  id v12 = self;
  sub_1000942CC((uint64_t)v12, v13, (uint64_t)v10);

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_100029C7C(0, &qword_1000F7698);
  v14.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v14.super.isa;
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  uint64_t v9 = type metadata accessor for IndexPath();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v13 = a3;
  swift_unknownObjectRetain();
  NSArray v14 = self;
  sub_1000946E4((uint64_t)v13, a4);

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_100029C7C(0, &qword_1000F7698);
  v15.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v15.super.isa;
}

- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4
{
  return sub_100094B4C(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(void))sub_100094AA0);
}

- (id)collectionView:(id)a3 dropPreviewParametersForItemAtIndexPath:(id)a4
{
  return sub_100094B4C(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(void))sub_100096894);
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  unsigned __int8 v8 = sub_100094C3C((uint64_t)v7, a4);

  swift_unknownObjectRelease();
  return v8 & 1;
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v9 = sub_100025A08(&qword_1000F5120);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = type metadata accessor for IndexPath();
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v12 = type metadata accessor for IndexPath();
    uint64_t v13 = 1;
  }
  sub_100021594((uint64_t)v11, v13, 1, v12);
  id v14 = a3;
  swift_unknownObjectRetain();
  NSArray v15 = self;
  id v16 = sub_100094D40(v14, a4, (uint64_t)v11);

  swift_unknownObjectRelease();
  sub_1000967DC((uint64_t)v11, &qword_1000F5120);

  return v16;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  sub_1000956D4((uint64_t)v6, a4);

  swift_unknownObjectRelease();
}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  sub_100096620((int)v7, a4);

  swift_unknownObjectRelease();
}

- (UICollectionView)collectionView
{
  v2 = self;
  id v3 = sub_100026038();

  return (UICollectionView *)v3;
}

- (void)setCollectionView:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1000972A4((uint64_t)v4);
}

- (void)dealloc
{
  v2 = self;
  sub_100098194();
}

- (void).cxx_destruct
{
  sub_10002D6C4((uint64_t)self + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_delegate);
  swift_bridgeObjectRelease();
  swift_release();
  type metadata accessor for LibraryConfiguration();
  sub_10001C094();
  sub_100016618();
  v3();
  swift_release();
  sub_1000260C8(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___layoutMetrics), *(void *)&self->database[OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___layoutMetrics], *(void **)&self->delegate[OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___layoutMetrics], *(void **)&self->delegate[OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___layoutMetrics + 8], *(void *)&self->groups[OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___layoutMetrics], *(void *)&self->shortcutMoveService[OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___layoutMetrics], *(void *)&self->hasLoadedInitialData[OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___layoutMetrics], *(void *)&self->$__lazy_storage_$_dataSource[OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___layoutMetrics+ 7], *(void *)&self->$__lazy_storage_$_layoutMetrics[OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___layoutMetrics+ 7], *(void **)&self->$__lazy_storage_$_layoutMetrics[OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___layoutMetrics+ 15]);
  sub_10002B290(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___editingItems));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_flowLayout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_searchController));
  sub_100026E90(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___toolbarViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_customPlusButton));
  sub_100026E90(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___createButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_customEditButton));
  sub_100026E90(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage____editButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_customLayoutButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___layoutButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___overflowMenuButtonItem));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_customSyncUnavailableButtonItem));
  sub_100026E90(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___syncUnavailableButtonItem));
  swift_bridgeObjectRelease();
  sub_100025E44((uint64_t)self + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_tip, &qword_1000F7920);
  swift_release();

  swift_bridgeObjectRelease();
}

- (_TtC9Shortcuts21LibraryViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000984FC();
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_10009891C(a3);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v13, 0, sizeof(v13));
    id v11 = a5;
    uint64_t v12 = self;
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_4;
  }
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v9 = a5;
  uint64_t v10 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  if (a5)
  {
LABEL_4:
    type metadata accessor for NSKeyValueChangeKey(0);
    sub_1000100DC(&qword_1000F78F0, type metadata accessor for NSKeyValueChangeKey);
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
LABEL_7:
  sub_1000989C0();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100025E44((uint64_t)v13, &qword_1000F7670);
}

- (void)keyboardWillChange:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1000998F4(v4);
}

- (void)createWorkflow:(id)a3
{
  id v5 = a3;
  id v4 = self;
  sub_100099ACC();
}

- (void)presentAutoShortcutAppSettings
{
  v2 = self;
  sub_100099C84();
}

- (void)syncUnavailableItemPressed:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100099FB0();
}

- (NSArray)keyCommands
{
  v2 = self;
  uint64_t v3 = sub_10009A468();

  if (v3)
  {
    sub_100029C7C(0, &qword_1000F5258);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void)duplicateSelectedWorkflowsFromKeyboard
{
  v2 = self;
  sub_10009ABA0();
}

- (void)deleteSelectedWorkflowsFromKeyboard
{
  v2 = self;
  sub_10009AC80();
}

- (void)openSelectedWorkflowFromKeyboard
{
  v2 = self;
  sub_10009AD04();
}

- (void)handleEscapeKeyboardPress
{
  v2 = self;
  sub_10009AE08();
}

- (void)runSelectedShortcutFromKeyboard
{
  v2 = self;
  sub_10009AEA4();
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  sub_10009C114();
  return result;
}

- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  LOBYTE(self) = sub_10009B70C();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  sub_10009B830();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  sub_10009C114();
  return result;
}

- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  sub_10009C114();
  return result;
}

- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  sub_10009C1C0(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)axCreateButton
{
  v2 = self;
  sub_10009C9C4();
  NSArray v4 = v3;

  return v4;
}

- (void)axDeleteWorkflowAction:(id)a3
{
  id v5 = a3;
  NSArray v4 = self;
  sub_10009CA0C(v5);
}

- (void)axDuplicateWorkflowAction:(id)a3
{
  id v5 = a3;
  NSArray v4 = self;
  sub_10009CED0(v5);
}

- (_TtC9Shortcuts21LibraryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  sub_10009D004();
}

- (BOOL)scrollForNavigationTap
{
  v2 = self;
  char v3 = sub_10009D2EC();

  return v3 & 1;
}

- (void)libraryCellDidRequestComposeUI:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1000ACA68((uint64_t)v4);
}

- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6
{
  sub_100029C7C(0, (unint64_t *)&qword_1000F53D8);
  sub_1000A1460();
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = a3;
  id v9 = self;
  sub_1000AFA68();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end