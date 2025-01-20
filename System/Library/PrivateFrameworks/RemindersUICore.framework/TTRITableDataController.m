@interface TTRITableDataController
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (_TtC15RemindersUICore23TTRITableDataController)init;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
@end

@implementation TTRITableDataController

- (_TtC15RemindersUICore23TTRITableDataController)init
{
  result = (_TtC15RemindersUICore23TTRITableDataController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore23TTRITableDataController_tableView);
  swift_bridgeObjectRelease();
  sub_1B9959584(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC15RemindersUICore23TTRITableDataController_cachedSectionsMetadata), *(void *)&self->tableView[OBJC_IVAR____TtC15RemindersUICore23TTRITableDataController_cachedSectionsMetadata]);
  swift_release();

  swift_release();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = a3;
  v5 = self;
  int64_t v6 = _s15RemindersUICore23TTRITableDataControllerC16numberOfSections2inSiSo11UITableViewC_tF_0();

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  int64_t v8 = sub_1B995AAB8(a4);

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1B996AD50();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B996ACB0();
  id v10 = a3;
  v11 = self;
  id v12 = TTRITableDataController.tableView(_:cellForRowAt:)((uint64_t)v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  uint64_t v6 = (UITableView *)a3;
  uint64_t v7 = self;
  TTRITableDataController.tableView(_:viewForHeaderInSection:)(v8, v6, a4);
  id v10 = v9;

  return v10;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  uint64_t v6 = (UITableView *)a3;
  uint64_t v7 = self;
  TTRITableDataController.tableView(_:viewForFooterInSection:)(v8, v6, a4);
  id v10 = v9;

  return v10;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  double v8 = sub_1B995ADA8(a4);

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_1B995B0BC(a4);
  double v9 = v8;

  return v9;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1B996AD50();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  double v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B996ACB0();
  id v10 = a3;
  v11 = self;
  if (sub_1B994DBE8((uint64_t)v9))
  {
    uint64_t v15 = v12;
    uint64_t v16 = v13;
    uint64_t v17 = v14;
    uint64_t ObjectType = swift_getObjectType();
    char v19 = (*(uint64_t (**)(uint64_t, uint64_t, id, uint64_t, uint64_t))(v15 + 48))(v16, v17, v10, ObjectType, v15);

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {

    char v19 = 0;
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v19 & 1;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1B996AD50();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  double v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B996ACB0();
  id v10 = a3;
  v11 = self;
  if (sub_1B994DBE8((uint64_t)v9))
  {
    uint64_t v15 = v12;
    uint64_t v16 = v13;
    uint64_t v17 = v14;
    uint64_t ObjectType = swift_getObjectType();
    char v19 = (*(uint64_t (**)(uint64_t, uint64_t, id, uint64_t, uint64_t))(v15 + 64))(v16, v17, v10, ObjectType, v15);

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {

    char v19 = 0;
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v19 & 1;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1B996AD50();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  double v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B996ACB0();
  id v10 = a3;
  v11 = self;
  if (sub_1B994D66C((uint64_t)v9))
  {
    uint64_t v13 = v12;
    uint64_t ObjectType = swift_getObjectType();
    char v15 = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 88))(ObjectType, v13);

    swift_unknownObjectRelease();
  }
  else
  {

    char v15 = 0;
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v15 & 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1B996AD50();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  double v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B996ACB0();
  id v10 = a3;
  v11 = self;
  if (sub_1B994D66C((uint64_t)v9))
  {
    uint64_t v13 = v12;
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(char *, id, uint64_t, uint64_t))(v13 + 96))(v9, v10, ObjectType, v13);

    swift_unknownObjectRelease();
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = sub_1B996AD50();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B996ACB0();
  id v12 = a3;
  uint64_t v13 = self;
  if (sub_1B994DBE8((uint64_t)v11))
  {
    uint64_t v17 = v14;
    uint64_t v18 = v15;
    uint64_t v19 = v16;
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(int64_t, uint64_t, uint64_t, id, uint64_t, uint64_t))(v17 + 72))(a4, v18, v19, v12, ObjectType, v17);

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  uint64_t v7 = sub_1B996AD50();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)&v22 - v12;
  MEMORY[0x1F4188790](v14);
  uint64_t v16 = (char *)&v22 - v15;
  sub_1B996ACB0();
  sub_1B996ACB0();
  id v17 = a3;
  uint64_t v18 = self;
  TTRITableDataController.tableView(_:targetIndexPathForMoveFromRowAt:toProposedIndexPath:)((uint64_t)v13, (uint64_t)v10, (uint64_t)v16);

  uint64_t v19 = *(void (**)(char *, uint64_t))(v8 + 8);
  v19(v10, v7);
  v19(v13, v7);
  v20 = (void *)sub_1B996AC70();
  v19(v16, v7);

  return v20;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  uint64_t v7 = sub_1B996AD50();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)&v17 - v12;
  sub_1B996ACB0();
  sub_1B996ACB0();
  id v14 = a3;
  uint64_t v15 = self;
  TTRITableDataController.tableView(_:moveRowAt:to:)((uint64_t)v14, (uint64_t)v13, (uint64_t)v10);

  uint64_t v16 = *(void (**)(char *, uint64_t))(v8 + 8);
  v16(v10, v7);
  v16(v13, v7);
}

@end