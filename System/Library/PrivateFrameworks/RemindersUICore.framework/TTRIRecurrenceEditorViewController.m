@interface TTRIRecurrenceEditorViewController
- (_TtC15RemindersUICore34TTRIRecurrenceEditorViewController)initWithCoder:(id)a3;
- (_TtC15RemindersUICore34TTRIRecurrenceEditorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC15RemindersUICore34TTRIRecurrenceEditorViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)didMoveToParentViewController:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TTRIRecurrenceEditorViewController

- (_TtC15RemindersUICore34TTRIRecurrenceEditorViewController)initWithCoder:(id)a3
{
  result = (_TtC15RemindersUICore34TTRIRecurrenceEditorViewController *)sub_1B99708A0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1B93D3C9C();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1B93D3E04(a3);
}

- (void)didMoveToParentViewController:(id)a3
{
  if (!a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B93D6348();

    swift_unknownObjectRelease();
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (!a4)
  {
    v4 = (void *)self;
    id v5 = a3;
    id v6 = v4;
    swift_unknownObjectRetain();
    v7 = sub_1B93D6A0C();
    swift_unknownObjectRelease();
    int64_t v8 = v7[2];

    swift_bridgeObjectRelease();
    return v8;
  }
  int64_t v8 = a4;
  if (a4 == 1) {
    return v8;
  }
  __break(1u);
  return self;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1B996AD50();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (uint64_t *)((char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1B996ACB0();
  id v10 = a3;
  v11 = self;
  id v12 = sub_1B93D4300(v10, v9);

  (*(void (**)(void *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (a4 == 1
    && (*(void **)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC15RemindersUICore34TTRIRecurrenceEditorViewController_presenter))[8])
  {
    _s15RemindersUICore21TTRProcessEnvironmentV24dictionaryRepresentationSDyS2SGvg_0();
    v4 = (void *)sub_1B996E9B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1B996AD50();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B996ACB0();
  id v10 = a3;
  v11 = self;
  sub_1B93D557C();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = sub_1B996AD50();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B996ACB0();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  sub_1B93D5660(v13, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (_TtC15RemindersUICore34TTRIRecurrenceEditorViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC15RemindersUICore34TTRIRecurrenceEditorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15RemindersUICore34TTRIRecurrenceEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC15RemindersUICore34TTRIRecurrenceEditorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end