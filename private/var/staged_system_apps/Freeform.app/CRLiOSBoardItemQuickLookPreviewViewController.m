@interface CRLiOSBoardItemQuickLookPreviewViewController
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)staysOpenOnSelectionChange;
- (_TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController)initWithCoder:(id)a3;
- (_TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController)initWithPreviewItems:(id)a3;
- (id)excludedActivityTypesForPreviewController:(id)a3;
- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4;
- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4;
- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3;
- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4;
- (void)previewController:(id)a3 didUpdateContentsOfPreviewItem:(id)a4;
- (void)previewControllerDidDismiss:(id)a3;
- (void)previewControllerWillDismiss:(id)a3;
- (void)validateCommand:(id)a3;
@end

@implementation CRLiOSBoardItemQuickLookPreviewViewController

- (_TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController_previewItem) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController_shouldSaveMarkedUpItem) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController_itemProvider) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController_previewOriginView) = 0;
  v4 = (Freeform::SyncEvent::FetchedRecordZoneChanges::Deletion (__swiftcall **)(CKRecordID, Swift::String))((char *)self + OBJC_IVAR____TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController_onDismiss);
  *v4 = SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:);
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController)initWithPreviewItems:(id)a3
{
  result = (_TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController_itemProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController_previewOriginView));

  swift_release();
}

- (BOOL)staysOpenOnSelectionChange
{
  return 1;
}

- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR____TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController_previewOriginView));
}

- (void)previewControllerWillDismiss:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100758A0C();
}

- (void)previewControllerDidDismiss:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100759278();
}

- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  int64_t v8 = sub_1007592EC(a4);

  swift_unknownObjectRelease();
  return v8;
}

- (id)excludedActivityTypesForPreviewController:(id)a3
{
  sub_1005057FC((uint64_t *)&unk_10167BEF0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10117E810;
  uint64_t v6 = qword_1016700C8;
  id v7 = a3;
  int64_t v8 = self;
  if (v6 != -1) {
    swift_once();
  }
  v9 = (void *)qword_10171C6D0;
  type metadata accessor for ActivityType(0);
  *(void *)(v5 + 56) = v10;
  *(void *)(v5 + 32) = v9;
  id v11 = v9;

  v12.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v12.super.isa;
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  return *(Class *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController_previewItem) != 0;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  uint64_t v6 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController_previewItem);
  if (v6)
  {
    id v7 = a3;
    int64_t v8 = self;
    id v9 = v6;
  }
  else
  {
    id v10 = objc_allocWithZone((Class)NSURL);
    id v11 = a3;
    NSArray v12 = self;
    id v9 = [v10 init];
  }
  swift_unknownObjectRetain();

  return v9;
}

- (void)previewController:(id)a3 didUpdateContentsOfPreviewItem:(id)a4
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController_shouldSaveMarkedUpItem) = 1;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    uint64_t v6 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v7 = self;
  }
  char v8 = sub_1007585C0(a3, (uint64_t)v10);

  sub_100522F00((uint64_t)v10, &qword_101672BF0);
  return v8 & 1;
}

- (void)validateCommand:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CRLiOSBoardItemQuickLookPreviewViewController();
  id v4 = a3;
  id v5 = v7.receiver;
  [(CRLiOSBoardItemQuickLookPreviewViewController *)&v7 validateCommand:v4];
  [v4 action];
  uint64_t v6 = (NSString *)String._bridgeToObjectiveC()();
  NSSelectorFromString(v6);

  if (static Selector.== infix(_:_:)()) {
    [v4 setAttributes:1];
  }
}

@end