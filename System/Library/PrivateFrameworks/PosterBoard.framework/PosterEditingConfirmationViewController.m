@interface PosterEditingConfirmationViewController
- (_TtC11PosterBoard39PosterEditingConfirmationViewController)initWithCoder:(id)a3;
- (_TtC11PosterBoard39PosterEditingConfirmationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PosterEditingConfirmationViewController

- (void)loadView
{
  v2 = self;
  sub_1D32CB758();
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v7 = a3;
  v8 = self;
  sub_1D32CD000(a3, a4);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PosterEditingConfirmationViewController();
  swift_unknownObjectRetain();
  id v7 = (char *)v8.receiver;
  -[PosterEditingConfirmationViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
  if (MEMORY[0x1D9434A30](&v7[OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_delegate]))
  {
    sub_1D32F8190((uint64_t)v7, a4);
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
  }
}

- (_TtC11PosterBoard39PosterEditingConfirmationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1D3372288();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC11PosterBoard39PosterEditingConfirmationViewController *)sub_1D32CDB0C(v5, v7, a4);
}

- (_TtC11PosterBoard39PosterEditingConfirmationViewController)initWithCoder:(id)a3
{
  return (_TtC11PosterBoard39PosterEditingConfirmationViewController *)sub_1D32CDD44(a3);
}

- (void).cxx_destruct
{
  sub_1D32CE208((uint64_t)self + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_previewStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_lockPreviewImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_homePreviewContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_homePreviewContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_lockPreviewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_homePreviewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_lockPreviewHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_homePreviewHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_lockPreviewLoadingIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_homePreviewLoadingIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_continueButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_customizeHomeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_buttonFont));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_lockPreviewImage));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11PosterBoard39PosterEditingConfirmationViewController_homePreviewView);
}

@end