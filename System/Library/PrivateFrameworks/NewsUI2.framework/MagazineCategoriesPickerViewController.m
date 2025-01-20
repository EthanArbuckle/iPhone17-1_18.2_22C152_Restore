@interface MagazineCategoriesPickerViewController
- (_TtC7NewsUI238MagazineCategoriesPickerViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI238MagazineCategoriesPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)closeButtonTappedWithSender:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation MagazineCategoriesPickerViewController

- (_TtC7NewsUI238MagazineCategoriesPickerViewController)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC7NewsUI238MagazineCategoriesPickerViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  uint64_t v5 = OBJC_IVAR____TtC7NewsUI238MagazineCategoriesPickerViewController_coverViewManager;
  sub_1DFDF1780();
  swift_allocObject();
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_1DFDF1770();
  uint64_t v7 = OBJC_IVAR____TtC7NewsUI238MagazineCategoriesPickerViewController_eventManager;
  sub_1DF312B4C(0, &qword_1EAC287E0, (uint64_t (*)(void))sub_1DF1069AC, (uint64_t)&type metadata for MagazineCategoriesPickerViewController.Event, MEMORY[0x1E4FAA950]);
  swift_allocObject();
  *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)sub_1DFDECBC0();

  result = (_TtC7NewsUI238MagazineCategoriesPickerViewController *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (void)closeButtonTappedWithSender:(id)a3
{
  v4 = (_TtC7NewsUI238MagazineCategoriesPickerViewController *)a3;
  uint64_t v7 = self;
  uint64_t v5 = (_TtC7NewsUI238MagazineCategoriesPickerViewController *)[(MagazineCategoriesPickerViewController *)v7 parentViewController];
  if (v5)
  {
    id v6 = v5;
    [(MagazineCategoriesPickerViewController *)v5 dismissViewControllerAnimated:1 completion:0];

    v4 = v7;
    uint64_t v7 = v6;
  }
}

- (_TtC7NewsUI238MagazineCategoriesPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI238MagazineCategoriesPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI238MagazineCategoriesPickerViewController_delegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI238MagazineCategoriesPickerViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI238MagazineCategoriesPickerViewController_blueprintViewController));
  swift_release();
  swift_release();
  swift_release();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DF310FE4();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1DF3115F8();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(MagazineCategoriesPickerViewController *)&v5 viewDidAppear:v3];
  sub_1DFDECB90();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_1DF311820((uint64_t)a3);
}

@end