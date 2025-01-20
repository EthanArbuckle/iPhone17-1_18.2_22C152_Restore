@interface PuzzleContinuePlayingViewController
- (_TtC7NewsUI235PuzzleContinuePlayingViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI235PuzzleContinuePlayingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PuzzleContinuePlayingViewController

- (_TtC7NewsUI235PuzzleContinuePlayingViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC7NewsUI235PuzzleContinuePlayingViewController_isBeingUsedAsPlugin) = 0;
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC7NewsUI235PuzzleContinuePlayingViewController_pluggableDelegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = (char *)self + OBJC_IVAR____TtC7NewsUI235PuzzleContinuePlayingViewController_lastComputedSize;
  *(void *)v5 = 0;
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  id v6 = a3;

  result = (_TtC7NewsUI235PuzzleContinuePlayingViewController *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (_TtC7NewsUI235PuzzleContinuePlayingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI235PuzzleContinuePlayingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI235PuzzleContinuePlayingViewController_pluggableDelegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI235PuzzleContinuePlayingViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI235PuzzleContinuePlayingViewController_blueprintViewController));
  swift_release();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DECAD678();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1DECAD894();
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(PuzzleContinuePlayingViewController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1DECAF460();
}

@end