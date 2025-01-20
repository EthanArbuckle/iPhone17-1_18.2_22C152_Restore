@interface SportsFavoritesSyncViewController
- (_TtC7NewsUI233SportsFavoritesSyncViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC7NewsUI233SportsFavoritesSyncViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)doConfirmationAction;
- (void)doDeferAction;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation SportsFavoritesSyncViewController

- (void)doConfirmationAction
{
}

- (void)doDeferAction
{
}

- (_TtC7NewsUI233SportsFavoritesSyncViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC7NewsUI233SportsFavoritesSyncViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7NewsUI233SportsFavoritesSyncViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC7NewsUI233SportsFavoritesSyncViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI233SportsFavoritesSyncViewController_styler);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI233SportsFavoritesSyncViewController_app);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI233SportsFavoritesSyncViewController_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI233SportsFavoritesSyncViewController_confirmationButton));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC7NewsUI233SportsFavoritesSyncViewController_deferButton);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DF54AD64();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = (char *)v5.receiver;
  [(OBBaseWelcomeController *)&v5 viewDidAppear:v3];
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)&v4[OBJC_IVAR____TtC7NewsUI233SportsFavoritesSyncViewController_eventHandler] + 88), *(void *)(*(void *)&v4[OBJC_IVAR____TtC7NewsUI233SportsFavoritesSyncViewController_eventHandler] + 112));
  sub_1DFDE87E0();
  __swift_project_boxed_opaque_existential_1(&v4[OBJC_IVAR____TtC7NewsUI233SportsFavoritesSyncViewController_app], *(void *)&v4[OBJC_IVAR____TtC7NewsUI233SportsFavoritesSyncViewController_app + 24]);
  objc_msgSend((id)sub_1DFDF5150(), sel_setIsActive_, 1, v5.receiver, v5.super_class);

  swift_unknownObjectRelease();
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_1DF54B658(a3);
}

- (void)viewWillLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)swift_getObjectType();
  [(SportsFavoritesSyncViewController *)&v2 viewWillLayoutSubviews];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_1DF54B7B4((uint64_t)a3);
}

@end