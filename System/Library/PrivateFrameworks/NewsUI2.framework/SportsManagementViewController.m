@interface SportsManagementViewController
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (_TtC7NewsUI230SportsManagementViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI230SportsManagementViewController)initWithNibName:(id)a3 bundle:(id)a4;
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

@implementation SportsManagementViewController

- (_TtC7NewsUI230SportsManagementViewController)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC7NewsUI230SportsManagementViewController_selectionProvider) = 0;
  swift_unknownObjectWeakInit();
  uint64_t v5 = OBJC_IVAR____TtC7NewsUI230SportsManagementViewController_overscrollView;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1EB0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC7NewsUI230SportsManagementViewController *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (_TtC7NewsUI230SportsManagementViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI230SportsManagementViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI230SportsManagementViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI230SportsManagementViewController_blueprintViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI230SportsManagementViewController_searchController));
  swift_unknownObjectWeakDestroy();
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI230SportsManagementViewController_selectionProvider);
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7NewsUI230SportsManagementViewController_overscrollView);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DF17B788();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(SportsManagementViewController *)&v4 viewDidAppear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4 = self;
  sub_1DF17C014(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1DF17C210();
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(SportsManagementViewController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1DF17D56C();
}

- (void)dismissVC
{
  v2 = self;
  sub_1DFDEE090();
  id v3 = (id)sub_1DFDECB00();
  type metadata accessor for SportsManagementEventHandler();
  sub_1DFDEDE20();

  swift_release();
  swift_release();
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  uint64_t v4 = sub_1DFDE79A0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  objc_super v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DFDE7950();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 0;
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1DF17D77C(v4);
}

- (void)searchBarTextDidEndEditing:(id)a3
{
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  sub_1DFDFDD20();
  id v6 = a3;
  objc_super v7 = self;
  sub_1DF17D324((uint64_t)v6);

  swift_bridgeObjectRelease();
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7NewsUI230SportsManagementViewController_searchController);
  id v5 = a3;
  v10 = self;
  id v6 = objc_msgSend(v4, sel_searchResultsController);
  if (v6)
  {
    objc_super v7 = v6;
    v8 = (void *)swift_dynamicCastObjCProtocolConditional();
    if (v8)
    {
      uint64_t v9 = v8;
      if (objc_msgSend(v8, sel_respondsToSelector_, sel_searchBarCancelButtonClicked_)) {
        objc_msgSend(v9, sel_searchBarCancelButtonClicked_, v5);
      }
    }
  }
  else
  {
  }
}

@end