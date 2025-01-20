@interface DebugTableViewSource
- (_TtC5TeaUI20DebugTableViewSource)init;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation DebugTableViewSource

- (_TtC5TeaUI20DebugTableViewSource)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectWeakDestroy();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = a3;
  v5 = self;
  int64_t v6 = sub_1B6185FF8();

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = a3;
  int64_t v6 = self;
  int64_t v7 = sub_1B618618C();

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1B61AFCB0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B61AFC40();
  id v10 = a3;
  v11 = self;
  id v12 = sub_1B61862DC((uint64_t)v10, v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1B6186C3C();
  uint64_t v8 = v7;

  if (v8)
  {
    v9 = (void *)sub_1B61B20C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1B61AFCB0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B61AFC40();
  id v10 = a3;
  v11 = self;
  sub_1B6186DB8(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end