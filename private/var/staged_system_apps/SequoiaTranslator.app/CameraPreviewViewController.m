@interface CameraPreviewViewController
- (_TtC17SequoiaTranslator27CameraPreviewViewController)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator27CameraPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)applicationDidResume;
- (void)applicationWillSuspend;
- (void)debugTapInteractionWithRecognizer:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CameraPreviewViewController

- (_TtC17SequoiaTranslator27CameraPreviewViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100158E0C();
}

- (_TtC17SequoiaTranslator27CameraPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  sub_100158E0C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10014FBBC();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3 = self;
  sub_100158F3C();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_100150014((uint64_t)a4, width, height);

  swift_unknownObjectRelease();
}

- (void)applicationWillSuspend
{
  v2 = self;
  sub_10015013C();
}

- (void)applicationDidResume
{
  v2 = self;
  sub_100150274();
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v3 = self;
  sub_100159004();
}

- (void)debugTapInteractionWithRecognizer:(id)a3
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_translationBridge);
  if (v3)
  {
    id v5 = a3;
    v6 = self;
    id v7 = v3;
    VisualTranslationViewBridge.showDebugMenu()();
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_conversation));
  swift_release();
  sub_100013384((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_delegate);
  id v3 = *(void **)&self->context[OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController__staticImage];
  char v4 = self->delegate[OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController__staticImage];
  swift_release();
  swift_release();
  sub_10010D860(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_dataScannerVC));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_translationBridge));
  sub_10000B070((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_contextObserver, (uint64_t *)&unk_1002F02C0);
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_noTextFoundTimer));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_materialView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_topReflectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_bottomReflectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_topConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_bottomConstraint));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_launchPrerequisitesDebounceTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_eventInteraction));
  swift_release();

  swift_release();
}

@end