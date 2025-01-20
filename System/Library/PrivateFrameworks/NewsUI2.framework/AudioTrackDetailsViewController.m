@interface AudioTrackDetailsViewController
- (BOOL)accessibilityPerformEscape;
- (_TtC7NewsUI231AudioTrackDetailsViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI231AudioTrackDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)didTapCloseButton;
- (void)didTapPlayPauseButton;
- (void)didTapReadButton;
- (void)loadView;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation AudioTrackDetailsViewController

- (_TtC7NewsUI231AudioTrackDetailsViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7NewsUI231AudioTrackDetailsViewController_trackView;
  type metadata accessor for AudioTrackDetailsView();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC7NewsUI231AudioTrackDetailsViewController *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (_TtC7NewsUI231AudioTrackDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI231AudioTrackDetailsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI231AudioTrackDetailsViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI231AudioTrackDetailsViewController_trackView));
  sub_1DEA68988((uint64_t)self + OBJC_IVAR____TtC7NewsUI231AudioTrackDetailsViewController_track, type metadata accessor for AudioFeedTrack);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI231AudioTrackDetailsViewController_listeningProgressManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI231AudioTrackDetailsViewController_logoCache);
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI231AudioTrackDetailsViewController_artworkCache;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (void)loadView
{
  v2 = self;
  AudioTrackDetailsViewController.loadView()();
}

- (void)viewDidLoad
{
  v2 = self;
  AudioTrackDetailsViewController.viewDidLoad()();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  AudioTrackDetailsViewController.viewDidLayoutSubviews()();
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(AudioTrackDetailsViewController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1DF350C4C();
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  v12 = _s7NewsUI231AudioTrackDetailsViewControllerC012presentationG012forPresented10presenting6sourceSo014UIPresentationG0CSgSo06UIViewG0C_ALSgALtF_0(v8, a4);

  return v12;
}

- (void)didTapPlayPauseButton
{
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v6[4] = sub_1DF351C40;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 1107296256;
  v6[2] = sub_1DE9744A8;
  v6[3] = &block_descriptor_19_1;
  id v4 = _Block_copy(v6);
  id v5 = self;
  swift_release();
  [(AudioTrackDetailsViewController *)v5 dismissViewControllerAnimated:1 completion:v4];
  _Block_release(v4);
}

- (void)didTapReadButton
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = self;
  v6[4] = sub_1DF351BCC;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 1107296256;
  v6[2] = sub_1DE9744A8;
  v6[3] = &block_descriptor_96;
  id v4 = _Block_copy(v6);
  id v5 = self;
  swift_release();
  [(AudioTrackDetailsViewController *)v5 dismissViewControllerAnimated:1 completion:v4];
  _Block_release(v4);
}

- (void)didTapCloseButton
{
}

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

@end