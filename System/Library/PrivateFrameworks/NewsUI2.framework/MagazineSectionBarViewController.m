@interface MagazineSectionBarViewController
- (_TtC7NewsUI232MagazineSectionBarViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI232MagazineSectionBarViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)deselect;
- (void)startTraversingWithDirection:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation MagazineSectionBarViewController

- (_TtC7NewsUI232MagazineSectionBarViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC7NewsUI232MagazineSectionBarViewController_isBeingUsedAsPlugin) = 0;
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC7NewsUI232MagazineSectionBarViewController_pluggableDelegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = (char *)self + OBJC_IVAR____TtC7NewsUI232MagazineSectionBarViewController_previousSelectedIndexPath;
  uint64_t v6 = sub_1DFDE79A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  id v7 = a3;

  result = (_TtC7NewsUI232MagazineSectionBarViewController *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (_TtC7NewsUI232MagazineSectionBarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI232MagazineSectionBarViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI232MagazineSectionBarViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI232MagazineSectionBarViewController_blueprintViewController));
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI232MagazineSectionBarViewController_offlineProvider);
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI232MagazineSectionBarViewController_pluggableDelegate);
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI232MagazineSectionBarViewController_previousSelectedIndexPath;
  sub_1DEBD5184((uint64_t)v3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DF9A05CC();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1DF9A0964();
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(MagazineSectionBarViewController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1DF9A1F84();
}

- (void)startTraversingWithDirection:(int64_t)a3
{
  v3 = self;
  sub_1DFDF3100();
}

- (void)deselect
{
  v2 = self;
  sub_1DFDF30E0();
  id v3 = (id)sub_1DFDF26C0();
  swift_release();
  objc_msgSend(v3, sel_selectItemAtIndexPath_animated_scrollPosition_, 0, 0, 0);
}

@end