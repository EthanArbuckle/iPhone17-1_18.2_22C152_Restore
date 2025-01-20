@interface TextSizeControlViewController
- (CGSize)preferredContentSize;
- (_TtC12NewsArticles29TextSizeControlViewController)initWithCoder:(id)a3;
- (_TtC12NewsArticles29TextSizeControlViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation TextSizeControlViewController

- (_TtC12NewsArticles29TextSizeControlViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BF5DF1B4();
}

- (_TtC12NewsArticles29TextSizeControlViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12NewsArticles29TextSizeControlViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles29TextSizeControlViewController_styler);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles29TextSizeControlViewController_divider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles29TextSizeControlViewController_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles29TextSizeControlViewController_increaseButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles29TextSizeControlViewController_increaseAction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles29TextSizeControlViewController_decreaseButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles29TextSizeControlViewController_decreaseAction);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BF5DE6D0();
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(TextSizeControlViewController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1BF5DF320();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1BF5DF040();
}

- (CGSize)preferredContentSize
{
  double v2 = 200.0;
  double v3 = 40.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

@end