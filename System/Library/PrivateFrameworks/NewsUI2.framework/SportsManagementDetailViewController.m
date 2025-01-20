@interface SportsManagementDetailViewController
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (_TtC7NewsUI236SportsManagementDetailViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI236SportsManagementDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissVC;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation SportsManagementDetailViewController

- (_TtC7NewsUI236SportsManagementDetailViewController)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC7NewsUI236SportsManagementDetailViewController_selectionProvider) = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC7NewsUI236SportsManagementDetailViewController *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (_TtC7NewsUI236SportsManagementDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI236SportsManagementDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI236SportsManagementDetailViewController_blueprintViewController));
  sub_1DF3A8964((uint64_t)self + OBJC_IVAR____TtC7NewsUI236SportsManagementDetailViewController_model, (uint64_t (*)(void))type metadata accessor for SportsDetailModel);
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI236SportsManagementDetailViewController_selectionProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI236SportsManagementDetailViewController_titleViewProvider);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DF3A702C();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(SportsManagementDetailViewController *)&v4 viewDidAppear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4 = self;
  sub_1DF3A75A8(a3);
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  [(SportsManagementDetailViewController *)&v15 viewWillLayoutSubviews];
  id v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC7NewsUI236SportsManagementDetailViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
  if (v3)
  {
    objc_super v4 = v3;
    id v5 = objc_msgSend(v2, sel_view);
    if (v5)
    {
      v6 = v5;
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
  [(SportsManagementDetailViewController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1DF3A8784();
}

- (void)dismissVC
{
  v2 = self;
  sub_1DFDEE090();
  id v3 = (id)sub_1DFDECB00();
  type metadata accessor for SportsManagementDetailEventHandler();
  sub_1DFDEDEB0();

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

@end