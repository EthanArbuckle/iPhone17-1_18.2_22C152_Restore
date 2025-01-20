@interface SportsFavoritesViewController
- (_TtC7NewsUI229SportsFavoritesViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI229SportsFavoritesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)startTraversingWithDirection:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation SportsFavoritesViewController

- (_TtC7NewsUI229SportsFavoritesViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI229SportsFavoritesViewController_isBeingUsedAsPlugin) = 0;
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC7NewsUI229SportsFavoritesViewController_pluggableDelegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = (char *)self + OBJC_IVAR____TtC7NewsUI229SportsFavoritesViewController_lastComputedSize;
  *(void *)v5 = 0;
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC7NewsUI229SportsFavoritesViewController_selectionProvider) = 0;
  swift_unknownObjectWeakInit();
  id v6 = a3;

  result = (_TtC7NewsUI229SportsFavoritesViewController *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (_TtC7NewsUI229SportsFavoritesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI229SportsFavoritesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI229SportsFavoritesViewController_pluggableDelegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI229SportsFavoritesViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI229SportsFavoritesViewController_blueprintViewController));
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI229SportsFavoritesViewController_selectionProvider;
  sub_1DEB1DDEC((uint64_t)v3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DEC33CC0();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_1DEC34040(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1DEC34270();
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(SportsFavoritesViewController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1DEC35F08();
}

- (void)startTraversingWithDirection:(int64_t)a3
{
  v3 = self;
  sub_1DFDF3100();
}

@end