@interface FigaroEventFieldViewController
- (_TtC5JSApp30FigaroEventFieldViewController)initWithCoder:(id)a3;
- (_TtC5JSApp30FigaroEventFieldViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC5JSApp30FigaroEventFieldViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)viewDidLoad;
@end

@implementation FigaroEventFieldViewController

- (_TtC5JSApp30FigaroEventFieldViewController)initWithCoder:(id)a3
{
  result = (_TtC5JSApp30FigaroEventFieldViewController *)sub_86F70();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FigaroEventFieldViewController();
  id v2 = v7.receiver;
  [(FigaroEventFieldViewController *)&v7 viewDidLoad];
  id v3 = [v2 tableView];
  if (v3)
  {
    v4 = v3;
    type metadata accessor for FigaroEventFieldCell();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    NSString v6 = sub_86830();
    [v4 registerClass:ObjCClassFromMetadata forCellReuseIdentifier:v6];
  }
  else
  {
    __break(1u);
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(void **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5JSApp30FigaroEventFieldViewController_data))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = *(void *)(self + OBJC_IVAR____TtC5JSApp30FigaroEventFieldViewController_data);
    if (*(void *)(v4 + 16) > (unint64_t)a4) {
      return *(void *)(*(void *)(v4 + 8 * a4 + 32) + 16);
    }
  }
  __break(1u);
  return self;
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
  v12 = (void *)sub_472A0(v10, (unint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (_TtC5JSApp30FigaroEventFieldViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC5JSApp30FigaroEventFieldViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5JSApp30FigaroEventFieldViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5JSApp30FigaroEventFieldViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end