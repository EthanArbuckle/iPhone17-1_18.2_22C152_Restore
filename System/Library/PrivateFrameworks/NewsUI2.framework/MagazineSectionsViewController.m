@interface MagazineSectionsViewController
- (_TtC7NewsUI230MagazineSectionsViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI230MagazineSectionsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didReceiveMemoryWarning;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation MagazineSectionsViewController

- (_TtC7NewsUI230MagazineSectionsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DF04C14C();
}

- (_TtC7NewsUI230MagazineSectionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI230MagazineSectionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI230MagazineSectionsViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI230MagazineSectionsViewController_barCompressionManager));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI230MagazineSectionsViewController_sectionViewControllerFactory);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super._responderFlags
                     + OBJC_IVAR____TtC7NewsUI230MagazineSectionsViewController_currentSection));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI230MagazineSectionsViewController_currentViewController));
  sub_1DF04A11C(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC7NewsUI230MagazineSectionsViewController_presentation), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC7NewsUI230MagazineSectionsViewController_presentation), *((unsigned char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC7NewsUI230MagazineSectionsViewController_presentation), *((unsigned char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC7NewsUI230MagazineSectionsViewController_presentation+ 1));
  swift_release();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DF049198();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1DF049B78();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = (char *)v6.receiver;
  [(MagazineSectionsViewController *)&v6 viewDidAppear:v3];
  sub_1DFDECB90();
  v5 = (void *)(*(void *)(*(void *)&v4[OBJC_IVAR____TtC7NewsUI230MagazineSectionsViewController_eventHandler]
                            + 32)
                + OBJC_IVAR____TtC7NewsUI226MagazineSectionsInteractor_magazinesBadgingCoordinator);
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  sub_1DED91790();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  sub_1DF049E44((uint64_t)a3);
}

- (void)didReceiveMemoryWarning
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(MagazineSectionsViewController *)&v3 didReceiveMemoryWarning];
  sub_1DFDEE0F0();
}

@end