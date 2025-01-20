@interface SearchViewController
- (_TtC7NewsUI220SearchViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI220SearchViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)contentScrollView;
- (void)dealloc;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation SearchViewController

- (_TtC7NewsUI220SearchViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DEF889E0();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  swift_retain();
  sub_1DFDF0490();
  swift_release();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(SearchViewController *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220SearchViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI220SearchViewController_blueprintViewController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220SearchViewController_sceneStateManager);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI220SearchViewController_searchAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI220SearchViewController_clearAction));
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC7NewsUI220SearchViewController_offlineProvider;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (_TtC7NewsUI220SearchViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI220SearchViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DEF864D0();
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1DEF868D8();
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(SearchViewController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1DEF88AB8();
}

- (id)contentScrollView
{
  v2 = self;
  sub_1DFDF30E0();
  id v3 = (void *)sub_1DFDF26C0();

  swift_release();
  return v3;
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5 = a3;
  id v6 = self;
  sub_1DEF88CD4();
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4 = a3;
  id v5 = self;
  MEMORY[0x1E01E38A0]();
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v5 = (void *)MEMORY[0x1E01EFB70]((char *)self + OBJC_IVAR____TtC7NewsUI220SearchViewController_searchBar, a2);
  id v6 = a3;
  objc_super v7 = self;
  if (v5)
  {
    objc_msgSend(v5, sel_resignFirstResponder);
  }
  sub_1DFDF3150();
}

@end