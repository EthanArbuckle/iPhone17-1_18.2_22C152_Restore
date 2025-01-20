@interface FigaroEventViewController
- (_TtC5JSApp25FigaroEventViewController)initWithCoder:(id)a3;
- (_TtC5JSApp25FigaroEventViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC5JSApp25FigaroEventViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation FigaroEventViewController

- (_TtC5JSApp25FigaroEventViewController)initWithCoder:(id)a3
{
  result = (_TtC5JSApp25FigaroEventViewController *)sub_86F70();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_67D1C();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = &OBJC_IVAR____TtC5JSApp25FigaroEventViewController_eventFields;
  if (a4) {
    v4 = &OBJC_IVAR____TtC5JSApp25FigaroEventViewController_baseFields;
  }
  return (*(void **)((char *)&self->super.super.super.super.isa + *v4))[2];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  NSString v4 = sub_86830();
  swift_bridgeObjectRelease();

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_86010();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_85FE0();
  id v10 = a3;
  v11 = self;
  id v12 = sub_67F30(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_86010();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_85FE0();
  id v10 = a3;
  v11 = self;
  sub_68470(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC5JSApp25FigaroEventViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC5JSApp25FigaroEventViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5JSApp25FigaroEventViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5JSApp25FigaroEventViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end