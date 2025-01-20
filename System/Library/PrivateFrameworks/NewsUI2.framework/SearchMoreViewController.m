@interface SearchMoreViewController
- (_TtC7NewsUI224SearchMoreViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI224SearchMoreViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation SearchMoreViewController

- (_TtC7NewsUI224SearchMoreViewController)initWithCoder:(id)a3
{
  result = (_TtC7NewsUI224SearchMoreViewController *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (_TtC7NewsUI224SearchMoreViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI224SearchMoreViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI224SearchMoreViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI224SearchMoreViewController_blueprintViewController));
  swift_unknownObjectRelease();
  swift_release();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DF229408();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1DF22963C();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_1DF22980C(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(SearchMoreViewController *)&v5 viewWillDisappear:v3];
  swift_getObjectType();
  sub_1DFDF2040();
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(SearchMoreViewController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1DF22A770();
}

@end