@interface DRIMainViewController
- (BOOL)previewController:(id)a3 shouldAllowKeyCommandWithIdentifier:(unint64_t)a4;
- (BOOL)shouldAppendDefaultDismissActionsForPreviewController:(id)a3;
- (DOCConfiguration)configuration;
- (_TtC5Files21DRIMainViewController)initWithCoder:(id)a3;
- (_TtC5Files21DRIMainViewController)initWithConfiguration:(id)a3;
- (id)dismissActionsForPreviewController:(id)a3;
- (id)excludedActivityTypesForPreviewController:(id)a3;
- (id)initForOpeningContentTypes:(id)a3;
- (id)initForOpeningFilesWithContentTypes:(id)a3;
- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4;
- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4;
- (void)documentBrowser:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentBrowser:(id)a3 didPickImportedURLs:(id)a4;
- (void)previewController:(id)a3 didSaveEditedCopyOfPreviewItem:(id)a4 atURL:(id)a5;
- (void)previewController:(id)a3 willSaveEditedItem:(id)a4;
- (void)previewControllerDidDismiss:(id)a3;
- (void)viewDidLoad;
@end

@implementation DRIMainViewController

- (DOCConfiguration)configuration
{
  v2 = self;
  id v3 = sub_10005AFB0();

  return (DOCConfiguration *)v3;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10001C774();
}

- (id)initForOpeningContentTypes:(id)a3
{
  if (a3)
  {
    type metadata accessor for UTType();
    uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return sub_10000A668(v3);
}

- (void)documentBrowser:(id)a3 didPickDocumentsAtURLs:(id)a4
{
}

- (void)documentBrowser:(id)a3 didPickImportedURLs:(id)a4
{
}

- (void)previewControllerDidDismiss:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1003966F0(v4);
}

- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  v7 = sub_10039D78C();

  swift_unknownObjectRelease();

  return v7;
}

- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  int64_t v7 = sub_10039D934();

  swift_unknownObjectRelease();
  return v7;
}

- (id)dismissActionsForPreviewController:(id)a3
{
  type metadata accessor for DOCPreviewController();
  swift_dynamicCastClass();
  sub_10009E6C4(0, (unint64_t *)&unk_100712F90);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

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
  type metadata accessor for DOCPreviewController();
  if (swift_dynamicCastClass())
  {
    id v7 = a3;
    swift_unknownObjectRetain();
    v8 = self;
    sub_100531B9C(a4);

    swift_unknownObjectRelease();
  }
}

- (id)excludedActivityTypesForPreviewController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10039DB2C();

  v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (void)previewController:(id)a3 didSaveEditedCopyOfPreviewItem:(id)a4 atURL:(id)a5
{
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  swift_unknownObjectRetain();
  v13 = self;
  sub_10039DC2C((uint64_t)v12, (uint64_t)a4, (uint64_t)v11);

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (id)initForOpeningFilesWithContentTypes:(id)a3
{
  if (a3) {
    uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v3 = 0;
  }
  return sub_100397090(v3);
}

- (_TtC5Files21DRIMainViewController)initWithCoder:(id)a3
{
  return (_TtC5Files21DRIMainViewController *)sub_1003971F8(a3);
}

- (_TtC5Files21DRIMainViewController)initWithConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC5Files21DRIMainViewController *)sub_10039DF44((uint64_t)v3);

  return v4;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DRIMainViewController_currentQuickLookPreviewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DRIMainViewController_currentQuickLookPreviewItemObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DRIMainViewController_currentLocationTitleObserver));
  sub_1000CBBA4((uint64_t)self + OBJC_IVAR____TtC5Files21DRIMainViewController_currentQuickLookURL, &qword_1007076B0);
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Files21DRIMainViewController____lazy_storage___internalConfiguration);
}

@end