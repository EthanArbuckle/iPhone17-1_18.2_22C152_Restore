@interface ChannelPickerViewController
- (_TtC7NewsUI227ChannelPickerViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI227ChannelPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissVC;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation ChannelPickerViewController

- (_TtC7NewsUI227ChannelPickerViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7NewsUI227ChannelPickerViewController_searchController) = 0;
  swift_unknownObjectWeakInit();
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC7NewsUI227ChannelPickerViewController_selectionProvider) = 0;
  swift_unknownObjectWeakInit();
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC7NewsUI227ChannelPickerViewController_postPurchaseOnboardingTransitionDelegate);
  void *v5 = 0;
  v5[1] = 0;
  id v6 = a3;

  result = (_TtC7NewsUI227ChannelPickerViewController *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (_TtC7NewsUI227ChannelPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI227ChannelPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI227ChannelPickerViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI227ChannelPickerViewController_blueprintViewController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI227ChannelPickerViewController_searchModule);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI227ChannelPickerViewController_searchController));
  sub_1DEE55E5C(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI227ChannelPickerViewController_pickerType), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC7NewsUI227ChannelPickerViewController_pickerType));
  swift_unknownObjectWeakDestroy();
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI227ChannelPickerViewController_selectionProvider);
  swift_unknownObjectRelease();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DF33B1C0();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(ChannelPickerViewController *)&v4 viewDidAppear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4 = self;
  sub_1DF33B9F0(a3);
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  [(ChannelPickerViewController *)&v15 viewWillLayoutSubviews];
  id v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC7NewsUI227ChannelPickerViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
  if (v3)
  {
    objc_super v4 = v3;
    id v5 = objc_msgSend(v2, sel_view);
    if (v5)
    {
      id v6 = v5;
      objc_msgSend(v5, sel_bounds);
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;

      objc_msgSend(v4, sel_setFrame_, v8, v10, v12, v14);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(ChannelPickerViewController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1DF33D848();
}

- (void)dismissVC
{
  v2 = self;
  sub_1DF33BD74();
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1DF33DA00(v4);
}

- (void)searchBarTextDidEndEditing:(id)a3
{
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  sub_1DFDFDD20();
  id v6 = a3;
  objc_super v7 = self;
  sub_1DF33D2F8((uint64_t)v6);

  swift_bridgeObjectRelease();
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1DF33D4B4((uint64_t)v4);
}

@end