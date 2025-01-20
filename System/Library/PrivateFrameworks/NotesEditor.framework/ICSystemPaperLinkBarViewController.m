@interface ICSystemPaperLinkBarViewController
- (ICSystemPaperLinkBarViewController)initWithCoder:(id)a3;
- (ICSystemPaperLinkBarViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (ICSystemPaperLinkBarViewController)initWithNoteEditorViewController:(id)a3 textView:(id)a4;
- (void)didTapAddLinkButtonWithButton:(id)a3;
- (void)refresh;
- (void)updateLinkBarLayers;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation ICSystemPaperLinkBarViewController

- (ICSystemPaperLinkBarViewController)initWithNoteEditorViewController:(id)a3 textView:(id)a4
{
  return (ICSystemPaperLinkBarViewController *)SystemPaperLinkBarViewController.init(noteEditorViewController:textView:)(a3, a4);
}

- (ICSystemPaperLinkBarViewController)initWithCoder:(id)a3
{
}

- (void)updateLinkBarLayers
{
  v2 = self;
  sub_20C0E21D4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_20C0E2510();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_20C0E38C0();
}

- (void)didTapAddLinkButtonWithButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20C0E3A1C(v4);
}

- (void)refresh
{
  v2 = self;
  sub_20C0E5B14();
}

- (ICSystemPaperLinkBarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (ICSystemPaperLinkBarViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSystemPaperLinkBarViewController_linkController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSystemPaperLinkBarViewController_addLinkClient));
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_release();
  swift_release();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSystemPaperLinkBarViewController_linkDescriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSystemPaperLinkBarViewController_addLinkButton));

  swift_bridgeObjectRelease();
}

@end