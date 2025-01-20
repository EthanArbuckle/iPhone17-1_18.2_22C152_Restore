@interface TTRISubtaskListViewController
- (_TtC15RemindersUICore29TTRISubtaskListViewController)initWithCoder:(id)a3;
- (_TtC15RemindersUICore29TTRISubtaskListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC15RemindersUICore29TTRISubtaskListViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation TTRISubtaskListViewController

- (_TtC15RemindersUICore29TTRISubtaskListViewController)initWithCoder:(id)a3
{
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC15RemindersUICore29TTRISubtaskListViewController_viewModel);
  _OWORD *v4 = 0u;
  v4[1] = 0u;
  id v5 = a3;

  result = (_TtC15RemindersUICore29TTRISubtaskListViewController *)sub_1B99708A0();
  __break(1u);
  return result;
}

- (void)willMoveToParentViewController:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = self;
  v7 = v6;
  if (!a3)
  {
    id v8 = [(TTRISubtaskListViewController *)v6 viewIfLoaded];
    if (v8)
    {
      v9 = v8;
      v10 = (void *)UIView.firstResponderDescendant.getter();

      if (v10)
      {
        objc_msgSend(v10, sel_resignFirstResponder);
      }
    }
  }
  v12.receiver = v7;
  v12.super_class = ObjectType;
  id v11 = a3;
  [(TTRISubtaskListViewController *)&v12 willMoveToParentViewController:v11];
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1B91E074C();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1B91E0B0C();
}

- (_TtC15RemindersUICore29TTRISubtaskListViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC15RemindersUICore29TTRISubtaskListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15RemindersUICore29TTRISubtaskListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC15RemindersUICore29TTRISubtaskListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC15RemindersUICore29TTRISubtaskListViewController_viewModel);
  uint64_t v4 = *(void *)((char *)&self->super.super.super._responderFlags
                 + OBJC_IVAR____TtC15RemindersUICore29TTRISubtaskListViewController_viewModel);

  sub_1B91B6518(v3, v4);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  int64_t v7 = sub_1B91E3410();

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1B996AD50();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B996ACB0();
  id v10 = a3;
  id v11 = self;
  objc_super v12 = sub_1B91E12EC((uint64_t)v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1B996AD50();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B996ACB0();
  id v10 = a3;
  id v11 = self;
  sub_1B91E19BC(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v7 = sub_1B996AD50();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  id v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B996ACB0();
  id v11 = a3;
  uint64_t v12 = self;
  sub_1B91E346C();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1B996AD50();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B996ACB0();
  id v10 = a3;
  id v11 = self;
  int64_t v12 = sub_1B91E363C();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

@end