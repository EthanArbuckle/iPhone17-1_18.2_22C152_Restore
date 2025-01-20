@interface ShortcutsViewController
- (_TtC7NewsUI223ShortcutsViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI223ShortcutsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)startTraversingWithDirection:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation ShortcutsViewController

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  swift_retain();
  sub_1DFDF0490();
  swift_release();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(ShortcutsViewController *)&v5 dealloc];
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI223ShortcutsViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI223ShortcutsViewController_blueprintViewController));
  swift_release();
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI223ShortcutsViewController_selectionProvider);
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI223ShortcutsViewController_pluggableDelegate;
  sub_1DEB1DDEC((uint64_t)v3);
}

- (_TtC7NewsUI223ShortcutsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DFD22E34();
}

- (_TtC7NewsUI223ShortcutsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI223ShortcutsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DFD1FF34();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1DFD205D0();
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(ShortcutsViewController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1DFD22F20();
}

- (void)startTraversingWithDirection:(int64_t)a3
{
  id v3 = self;
  sub_1DFDF3100();
}

@end