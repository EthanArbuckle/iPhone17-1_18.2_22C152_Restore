@interface TVCatalogModalityDetailViewController
- (NSArray)preferredFocusEnvironments;
- (_TtC9SeymourUI37TVCatalogModalityDetailViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI37TVCatalogModalityDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC9SeymourUI37TVCatalogModalityDetailViewController)initWithStyle:(int64_t)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVCatalogModalityDetailViewController

- (NSArray)preferredFocusEnvironments
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF608E0);
  uint64_t v3 = swift_allocObject();
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC9SeymourUI37TVCatalogModalityDetailViewController_coordinator);
  *(_OWORD *)(v3 + 16) = xmmword_23A80FD70;
  v5 = *(void **)(v4 + qword_268A47FF0);
  *(void *)(v3 + 32) = v5;
  sub_23A7FFC98();
  id v6 = v5;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A0E2A0);
  v7 = (void *)sub_23A7FFC58();
  swift_bridgeObjectRelease();

  return (NSArray *)v7;
}

- (_TtC9SeymourUI37TVCatalogModalityDetailViewController)initWithCoder:(id)a3
{
  result = (_TtC9SeymourUI37TVCatalogModalityDetailViewController *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TVCatalogModalityDetailViewController();
  v2 = (char *)v3.receiver;
  [(TVCatalogModalityDetailViewController *)&v3 viewDidLoad];
  objc_msgSend(v2, sel_showDetailViewController_sender_, *(void *)(*(void *)&v2[OBJC_IVAR____TtC9SeymourUI37TVCatalogModalityDetailViewController_coordinator]+ qword_268A47FD0), 0, v3.receiver, v3.super_class);
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_23A57EC88(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_23A57EF70(a3);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TVCatalogModalityDetailViewController();
  id v6 = a3;
  id v7 = a4;
  id v8 = v9.receiver;
  [(TVCatalogModalityDetailViewController *)&v9 didUpdateFocusInContext:v6 withAnimationCoordinator:v7];
  sub_23A57E3C0(v6);
}

- (_TtC9SeymourUI37TVCatalogModalityDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI37TVCatalogModalityDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI37TVCatalogModalityDetailViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC9SeymourUI37TVCatalogModalityDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI37TVCatalogModalityDetailViewController_coordinator));
}

@end