@interface PaperKitExtensionDocumentViewController
- (_TtC8PaperKit39PaperKitExtensionDocumentViewController)initWithCoder:(id)a3;
- (_TtC8PaperKit39PaperKitExtensionDocumentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PaperKitExtensionDocumentViewController

- (_TtC8PaperKit39PaperKitExtensionDocumentViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized PaperKitExtensionDocumentViewController.init(coder:)();
}

- (void)viewDidLoad
{
  v2 = self;
  PaperKitExtensionDocumentViewController.viewDidLoad()();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  PaperKitExtensionDocumentViewController.viewWillLayoutSubviews()();
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PaperKitExtensionDocumentViewController();
  id v2 = v3.receiver;
  [(PaperKitExtensionDocumentViewController *)&v3 viewDidLayoutSubviews];
  PaperKitExtensionDocumentViewController.adjustScaleAndInterpageSpacing()();
}

- (_TtC8PaperKit39PaperKitExtensionDocumentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8PaperKit39PaperKitExtensionDocumentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit39PaperKitExtensionDocumentViewController_inlineView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit39PaperKitExtensionDocumentViewController_thumbnailView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit39PaperKitExtensionDocumentViewController_collapseThumbnailsConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit39PaperKitExtensionDocumentViewController_paperDocumentViewController));
  swift_release();
  swift_bridgeObjectRelease();
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit39PaperKitExtensionDocumentViewController_delegate);
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit39PaperKitExtensionDocumentViewController_liveStreamMessenger);
  swift_unknownObjectRelease();
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit39PaperKitExtensionDocumentViewController_textualContextProvider);
  swift_unknownObjectWeakDestroy();
}

@end