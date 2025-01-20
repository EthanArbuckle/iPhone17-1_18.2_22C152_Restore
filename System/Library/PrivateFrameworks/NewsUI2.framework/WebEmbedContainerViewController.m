@interface WebEmbedContainerViewController
- (_TtC7NewsUI231WebEmbedContainerViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI231WebEmbedContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation WebEmbedContainerViewController

- (_TtC7NewsUI231WebEmbedContainerViewController)initWithCoder:(id)a3
{
  uint64_t v5 = sub_1DFDFA760();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = OBJC_IVAR____TtC7NewsUI231WebEmbedContainerViewController_embedLocation;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E4F808F8], v5);
  id v10 = a3;
  v11 = (objc_class *)sub_1DFDFA750();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *(Class *)((char *)&self->super.super.super.isa + v9) = v11;

  result = (_TtC7NewsUI231WebEmbedContainerViewController *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (_TtC7NewsUI231WebEmbedContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI231WebEmbedContainerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI231WebEmbedContainerViewController_styler);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI231WebEmbedContainerViewController_layoutAttributesFactory);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI231WebEmbedContainerViewController_webEmbedViewController));
  sub_1DEFEF570((uint64_t)self + OBJC_IVAR____TtC7NewsUI231WebEmbedContainerViewController_resource);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI231WebEmbedContainerViewController_embedLocation));
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI231WebEmbedContainerViewController_webEmbedDataSourceService;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DFA523A0();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1DFA53578((uint64_t)a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1DFA536EC();
}

@end