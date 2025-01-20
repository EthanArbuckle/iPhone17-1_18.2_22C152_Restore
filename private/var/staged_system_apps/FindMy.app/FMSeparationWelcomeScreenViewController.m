@interface FMSeparationWelcomeScreenViewController
- (_TtC6FindMy39FMSeparationWelcomeScreenViewController)initWithCoder:(id)a3;
- (_TtC6FindMy39FMSeparationWelcomeScreenViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissPresentedVCWithSender:(id)a3;
- (void)nextAction;
- (void)secondaryAction;
- (void)viewDidLayoutSubviews;
@end

@implementation FMSeparationWelcomeScreenViewController

- (_TtC6FindMy39FMSeparationWelcomeScreenViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1004EC8CC();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1004EBBE8();
}

- (void)nextAction
{
  v2 = self;
  sub_1004EBD64();
}

- (void)secondaryAction
{
  v2 = self;
  sub_1004EBF94();
}

- (void)dismissPresentedVCWithSender:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  id v5 = [(FMSeparationWelcomeScreenViewController *)v4 presentedViewController];
  if (v5)
  {
    v6 = v5;
    v8[4] = State.rawValue.getter;
    v8[5] = 0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 1107296256;
    v8[2] = sub_10003C410;
    v8[3] = &unk_100642988;
    v7 = _Block_copy(v8);
    [v6 dismissViewControllerAnimated:1 completion:v7];
    _Block_release(v7);
  }
  else
  {
  }
  sub_10002CEFC((uint64_t)v9);
}

- (_TtC6FindMy39FMSeparationWelcomeScreenViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6FindMy39FMSeparationWelcomeScreenViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy39FMSeparationWelcomeScreenViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy39FMSeparationWelcomeScreenViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy39FMSeparationWelcomeScreenViewController_scrollContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy39FMSeparationWelcomeScreenViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy39FMSeparationWelcomeScreenViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy39FMSeparationWelcomeScreenViewController_actionButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy39FMSeparationWelcomeScreenViewController_secondaryActionButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy39FMSeparationWelcomeScreenViewController_informativeImage));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC6FindMy39FMSeparationWelcomeScreenViewController_heightConstraint);
}

@end