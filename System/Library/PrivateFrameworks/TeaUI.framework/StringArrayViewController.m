@interface StringArrayViewController
- (_TtC5TeaUI25StringArrayViewController)initWithCoder:(id)a3;
- (_TtC5TeaUI25StringArrayViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)doAdd;
- (void)keyboardWillChangeFrameWithNotification:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation StringArrayViewController

- (_TtC5TeaUI25StringArrayViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B6041028();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1B60410E0();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1B6041390(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1B6041444(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1B6041548();
}

- (void)doAdd
{
  v2 = self;
  sub_1B6041650();
}

- (void)keyboardWillChangeFrameWithNotification:(id)a3
{
  uint64_t v4 = sub_1B61AF6F0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B61AF6B0();
  v8 = self;
  sub_1B604182C((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return sub_1B6041958();
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1B61AFCB0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B61AFC40();
  id v10 = a3;
  v11 = self;
  id v12 = sub_1B60419B8(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = sub_1B61AFCB0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B61AFC40();
  id v12 = a3;
  v13 = self;
  sub_1B6041F40(v12, a4, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  sub_1B60421A4();
  if (v4)
  {
    uint64_t v5 = (void *)sub_1B61B20C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (_TtC5TeaUI25StringArrayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1B61B20F0();
  }
  id v5 = a4;
  sub_1B604225C();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

@end