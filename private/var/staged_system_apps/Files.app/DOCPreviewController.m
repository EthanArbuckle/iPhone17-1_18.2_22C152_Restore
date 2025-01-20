@interface DOCPreviewController
+ (id)sharedControllerFor:(id)a3;
+ (void)clearSharedControllerFor:(id)a3;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)previewController:(id)a3 shouldAllowKeyCommandWithIdentifier:(unint64_t)a4;
- (BOOL)shouldAppendDefaultDismissActionsForPreviewController:(id)a3;
- (NSArray)keyCommands;
- (QLPreviewControllerDelegate)delegate;
- (_TtC5Files20DOCPreviewController)initWithCoder:(id)a3;
- (_TtC5Files20DOCPreviewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)dismissActionsForPreviewController:(id)a3;
- (id)excludedActivityTypesForPreviewController:(id)a3;
- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4;
- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4;
- (int64_t)modalPresentationStyle;
- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3;
- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4;
- (void)dismissViaKeyCommand;
- (void)documentPicker:(id)a3 didConfirmDocumentsAt:(id)a4;
- (void)duplicate:(id)a3;
- (void)move:(id)a3;
- (void)previewController:(id)a3 didSaveEditedCopyOfPreviewItem:(id)a4 atURL:(id)a5;
- (void)previewController:(id)a3 willSaveEditedItem:(id)a4;
- (void)previewControllerWillDismiss:(id)a3;
- (void)reallyBecomeCurrent:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setModalPresentationStyle:(int64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation DOCPreviewController

- (void)documentPicker:(id)a3 didConfirmDocumentsAt:(id)a4
{
  type metadata accessor for URL();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  v8 = self;
  sub_100491A24(v6);

  swift_bridgeObjectRelease();
}

- (QLPreviewControllerDelegate)delegate
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCPreviewController();
  v2 = [(DOCPreviewController *)&v4 delegate];

  return v2;
}

- (void)setDelegate:(id)a3
{
  objc_super v4 = (_TtC5Files20DOCPreviewController *)a3;
  if (!a3) {
    objc_super v4 = self;
  }
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCPreviewController();
  v5 = self;
  swift_unknownObjectRetain();
  [(DOCPreviewController *)&v6 setDelegate:v4];

  swift_unknownObjectRelease();
}

- (NSArray)keyCommands
{
  v2 = self;
  id v3 = DOCPreviewController.keyCommands.getter();

  if (v3)
  {
    sub_10009E6C4(0, &qword_100708860);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    objc_super v6 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v7 = self;
  }
  char v8 = DOCPreviewController.canPerformAction(_:withSender:)((uint64_t)a3, (uint64_t)v10);

  sub_1000CBBA4((uint64_t)v10, (uint64_t *)&unk_100705D60);
  return v8 & 1;
}

- (void)duplicate:(id)a3
{
  if (a3)
  {
    NSArray v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  DOCPreviewController.duplicate(_:)();

  sub_1000CBBA4((uint64_t)v6, (uint64_t *)&unk_100705D60);
}

- (void)move:(id)a3
{
  if (a3)
  {
    NSArray v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  _s5Files20DOCPreviewControllerC4moveyyypSgF_0();

  sub_1000CBBA4((uint64_t)v6, (uint64_t *)&unk_100705D60);
}

+ (id)sharedControllerFor:(id)a3
{
  id v4 = a3;
  id v5 = _s5Files20DOCPreviewControllerC06sharedC03forACSgSo8NSStringCSg_tFZ_0(a3);

  return v5;
}

+ (void)clearSharedControllerFor:(id)a3
{
  if (a3)
  {
    uint64_t v3 = qword_1007052D8;
    id v4 = a3;
    if (v3 != -1) {
      swift_once();
    }
    [qword_10071B4C0 removeObjectForKey:];
  }
  else
  {
    id v4 = (id)static DOCLog.Source.getter();
    static os_log_type_t.debug.getter();
    os_log(_:dso:log:type:_:)();
  }
}

- (_TtC5Files20DOCPreviewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100532498();
}

- (void)dismissViaKeyCommand
{
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  DOCPreviewController.viewWillAppear(_:)(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = sub_1000CBE70(&qword_1007076B0);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v8 = (objc_class *)type metadata accessor for DOCPreviewController();
  v13.receiver = self;
  v13.super_class = v8;
  v9 = self;
  [(DOCPreviewController *)&v13 viewDidAppear:v3];
  sub_10052E6E4();
  uint64_t v10 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (uint64_t)v9 + OBJC_IVAR____TtC5Files20DOCPreviewController_importedURL;
  swift_beginAccess();
  sub_10014B834((uint64_t)v7, v11);
  swift_endAccess();
}

- (int64_t)modalPresentationStyle
{
  return 5;
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCPreviewController();
  [(DOCPreviewController *)&v4 setModalPresentationStyle:a3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4 = self;
  DOCPreviewController.viewWillDisappear(_:)(a3);
}

- (void)reallyBecomeCurrent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10053261C();
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  BOOL v3 = (char *)self + OBJC_IVAR____TtC5Files20DOCPreviewController_source;
  int v4 = self->editingDelegate[OBJC_IVAR____TtC5Files20DOCPreviewController_source];
  if (v4 == 255) {
    return 0;
  }
  uint64_t v5 = *(void *)v3;
  if (v4) {
    return *(void *)(v5 + 16);
  }
  if (!((unint64_t)v5 >> 62)) {
    return *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  char v8 = (void *)*((void *)v3 + 1);
  id v9 = a3;
  uint64_t v10 = self;
  sub_100491D80((id)v5, v8, v4);
  int64_t v11 = _CocoaArrayWrapper.endIndex.getter();
  sub_10039E204(v5, v8, v4);

  return v11;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  uint64_t v6 = (char *)self + OBJC_IVAR____TtC5Files20DOCPreviewController_source;
  int v7 = self->editingDelegate[OBJC_IVAR____TtC5Files20DOCPreviewController_source];
  if (v7 == 255)
  {
    id v16 = objc_allocWithZone((Class)QLItem);
    id v17 = a3;
    v18 = self;
    id v15 = [v16 init];
  }
  else
  {
    uint64_t v10 = *(void **)v6;
    id v9 = (void *)*((void *)v6 + 1);
    id v11 = a3;
    uint64_t v12 = self;
    sub_100491D80(v10, v9, v7);
    sub_10052A44C(a4, (uint64_t)v10, v13, v7 & 1);
    id v15 = v14;
    sub_10039E204((uint64_t)v10, v9, v7);
  }

  return v15;
}

- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  uint64_t v6 = self;
  int64_t v7 = sub_100532914();

  swift_unknownObjectRelease();
  return v7;
}

- (id)dismissActionsForPreviewController:(id)a3
{
  sub_10009E6C4(0, (unint64_t *)&unk_100712F90);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;

  return v3.super.isa;
}

- (BOOL)shouldAppendDefaultDismissActionsForPreviewController:(id)a3
{
  return 1;
}

- (BOOL)previewController:(id)a3 shouldAllowKeyCommandWithIdentifier:(unint64_t)a4
{
  return a4 - 4 < 0xFFFFFFFFFFFFFFFELL;
}

- (void)previewController:(id)a3 willSaveEditedItem:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  int64_t v7 = self;
  sub_100531B9C(a4);

  swift_unknownObjectRelease();
}

- (void)previewController:(id)a3 didSaveEditedCopyOfPreviewItem:(id)a4 atURL:(id)a5
{
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  swift_unknownObjectRetain();
  uint64_t v13 = self;
  sub_100532AE8((uint64_t)a4, (uint64_t)v11);

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)previewControllerWillDismiss:(id)a3
{
  id v5 = (char *)self + OBJC_IVAR____TtC5Files20DOCPreviewController_visibilityDelegate;
  swift_beginAccess();
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v6 = *((void *)v5 + 1);
    swift_getObjectType();
    int64_t v7 = *(void (**)(void))(v6 + 8);
    id v8 = a3;
    uint64_t v9 = self;
    v7();

    swift_unknownObjectRelease();
  }
}

- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  uint64_t v6 = self;
  int64_t v7 = sub_100533020();

  swift_unknownObjectRelease();

  return v7;
}

- (id)excludedActivityTypesForPreviewController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  _s5Files20DOCPreviewControllerC21excludedActivityTypes3forSayypGSo09QLPreviewC0C_tF_0();

  v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (_TtC5Files20DOCPreviewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5Files20DOCPreviewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10003A094((uint64_t)self + OBJC_IVAR____TtC5Files20DOCPreviewController_editingDelegate);
  sub_10003A094((uint64_t)self + OBJC_IVAR____TtC5Files20DOCPreviewController_visibilityDelegate);
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files20DOCPreviewController_configuration));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files20DOCPreviewController_duplicatedNodeObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files20DOCPreviewController_duplicatedNodeSubscriber));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files20DOCPreviewController_itemBeingRenamed));
  sub_10039E204(*(uint64_t *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Files20DOCPreviewController_source), *(void **)&self->super._nonSourceBasedQLItems[OBJC_IVAR____TtC5Files20DOCPreviewController_source], self->editingDelegate[OBJC_IVAR____TtC5Files20DOCPreviewController_source]);
  sub_1000CBBA4((uint64_t)self + OBJC_IVAR____TtC5Files20DOCPreviewController_importedURL, &qword_1007076B0);
  sub_10003A094((uint64_t)self + OBJC_IVAR____TtC5Files20DOCPreviewController_transitioningProvider);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files20DOCPreviewController_observation));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files20DOCPreviewController_linkNavigateInteraction));
  NSArray v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Files20DOCPreviewController_currentUserActivity);
}

@end