@interface MTTestActionContentPickerViewController
- (_TtC8Podcasts39MTTestActionContentPickerViewController)initWithCoder:(id)a3;
- (_TtC8Podcasts39MTTestActionContentPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation MTTestActionContentPickerViewController

- (_TtC8Podcasts39MTTestActionContentPickerViewController)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC8Podcasts39MTTestActionContentPickerViewController_delegate;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8Podcasts39MTTestActionContentPickerViewController_allowsMultipleSelection) = 1;
  id v5 = a3;

  result = (_TtC8Podcasts39MTTestActionContentPickerViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC8Podcasts39MTTestActionContentPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5 = (char *)self + OBJC_IVAR____TtC8Podcasts39MTTestActionContentPickerViewController_delegate;
  *(_OWORD *)id v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8Podcasts39MTTestActionContentPickerViewController_allowsMultipleSelection) = 1;
  id v6 = a4;

  result = (_TtC8Podcasts39MTTestActionContentPickerViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100054B1C((uint64_t)self + OBJC_IVAR____TtC8Podcasts39MTTestActionContentPickerViewController_delegate, &qword_100603228);
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Podcasts39MTTestActionContentPickerViewController_tableViewController);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10031A538();
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = a3;
  id v6 = self;
  unint64_t v7 = sub_10031F0DC();

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_10031ABEC(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return *(void *)((*(void **)((char *)&self->super.super.super.isa
                                 + OBJC_IVAR____TtC8Podcasts39MTTestActionContentPickerViewController_contentDataSource))[2]
                   + 16);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_10031B324(v5);
  uint64_t v8 = v7;

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_10031B568(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 0;
}

@end