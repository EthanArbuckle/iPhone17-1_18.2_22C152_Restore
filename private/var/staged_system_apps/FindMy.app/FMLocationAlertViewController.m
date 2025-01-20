@interface FMLocationAlertViewController
- (_TtC6FindMy29FMLocationAlertViewController)initWithCoder:(id)a3;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cancel;
- (void)saveAlert;
- (void)showRemoveAlert;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMLocationAlertViewController

- (_TtC6FindMy29FMLocationAlertViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000AB4AC();
}

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMLocationAlertViewController(0);
  id v4 = a3;
  v5 = (char *)v6.receiver;
  [(FMLocationAlertViewController *)&v6 traitCollectionDidChange:v4];
  [*(id *)&v5[OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_tableView] reloadData];
}

- (void)cancel
{
  v5[4] = State.rawValue.getter;
  v5[5] = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 1107296256;
  v5[2] = sub_10003C410;
  v5[3] = &unk_100621AF0;
  id v3 = _Block_copy(v5);
  id v4 = self;
  [(FMLocationAlertViewController *)v4 dismissViewControllerAnimated:1 completion:v3];
  _Block_release(v3);
}

- (void)saveAlert
{
  v2 = self;
  sub_100098E08();
}

- (void).cxx_destruct
{
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_delegate);
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_locationAlert, &qword_1006BB9A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_tableView));
  swift_release();
  swift_bridgeObjectRelease();
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_friendForAlert, &qword_1006AF740);
  id v3 = (char *)self + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_alertTarget;
  uint64_t v4 = type metadata accessor for FMFLocationAlertTarget();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_myCurrentLocation, (uint64_t *)&unk_1006AF710);
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_myCurrentUnshiftedLocation, (uint64_t *)&unk_1006AF710);
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_friendLocation, (uint64_t *)&unk_1006AF710);
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_friendUnshiftedLocation, (uint64_t *)&unk_1006AF710);
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_customLocation, (uint64_t *)&unk_1006AF710);
  swift_release();
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController__selectedLocation, (uint64_t *)&unk_1006AF710);
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_selectedLocationTimeZone, &qword_1006AF6D8);
  swift_bridgeObjectRelease();
  v5 = (char *)self + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_triggerType;
  uint64_t v6 = type metadata accessor for FMFLocationAlertTriggerType();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_schedule;
  uint64_t v8 = type metadata accessor for FMFSchedule();
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_removeButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_doneButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_removeCell));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_dateFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_timeFormatterWithTimezone));
  v9 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_timeFormatterNoTimezone);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_10009D9F8(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)showRemoveAlert
{
  v2 = self;
  sub_1000A027C();
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  int64_t v8 = sub_1000AD180(a4);

  return v8;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5 = a3;
  id v6 = self;
  NSString v7 = String._bridgeToObjectiveC()();
  id v8 = [v5 dequeueReusableHeaderFooterViewWithIdentifier:v7];

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  uint64_t v5 = qword_1006ADF08;
  id v6 = a3;
  NSString v7 = self;
  if (v5 != -1) {
    swift_once();
  }
  double v8 = *(double *)&qword_1006D1470;

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  NSString v7 = self;
  sub_1000AD5D4(a4);
  uint64_t v9 = v8;

  if (v9)
  {
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }

  return v10;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  int64_t v6 = sub_1000AD89C();

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  uint64_t v12 = (void *)sub_1000ADEF0((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

@end