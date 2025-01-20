@interface MyMagazinesViewController
- (_TtC7NewsUI225MyMagazinesViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI225MyMagazinesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)deselect;
- (void)startTraversingWithDirection:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation MyMagazinesViewController

- (_TtC7NewsUI225MyMagazinesViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI225MyMagazinesViewController_isBeingUsedAsPlugin) = 0;
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC7NewsUI225MyMagazinesViewController_pluggableDelegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC7NewsUI225MyMagazinesViewController_lastComputedSize);
  void *v5 = 0;
  v5[1] = 0;
  uint64_t v6 = OBJC_IVAR____TtC7NewsUI225MyMagazinesViewController_eventManager;
  sub_1DF6D5640();
  swift_allocObject();
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)sub_1DFDECBC0();

  result = (_TtC7NewsUI225MyMagazinesViewController *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (_TtC7NewsUI225MyMagazinesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI225MyMagazinesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI225MyMagazinesViewController_pluggableDelegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI225MyMagazinesViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI225MyMagazinesViewController_blueprintViewController));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI225MyMagazinesViewController_offlineAlertControllerFactory);
  swift_release();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DF6D319C();
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1DF6D3614();
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(MyMagazinesViewController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1DF6D5424();
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