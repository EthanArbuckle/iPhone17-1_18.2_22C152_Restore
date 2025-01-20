@interface BKAnalyticsDebugViewController
- (BKAnalyticsDebugViewController)init;
- (BKAnalyticsDebugViewController)initWithCoder:(id)a3;
- (BKAnalyticsDebugViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (BKAnalyticsDebugViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)jitterLowBoundTextFieldChangeWithTextField:(id)a3;
- (void)jitterUpperBoundTextFieldChangeWithTextField:(id)a3;
- (void)viewDidLoad;
@end

@implementation BKAnalyticsDebugViewController

- (BKAnalyticsDebugViewController)init
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___BKAnalyticsDebugViewController_analyticsDatas) = (Class)_swiftEmptyArrayStorage;
  uint64_t v3 = OBJC_IVAR___BKAnalyticsDebugViewController_analyticsJitterEnabled;
  v4 = self;
  *((unsigned char *)&self->super.super.super.super.isa + v3) = sub_1007F42B0() & 1;

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for AnalyticsDebugViewController();
  return [(BKAnalyticsDebugViewController *)&v6 initWithStyle:2];
}

- (BKAnalyticsDebugViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___BKAnalyticsDebugViewController_analyticsDatas) = (Class)_swiftEmptyArrayStorage;
  uint64_t v4 = OBJC_IVAR___BKAnalyticsDebugViewController_analyticsJitterEnabled;
  id v5 = a3;
  *((unsigned char *)&self->super.super.super.super.isa + v4) = sub_1007F42B0() & 1;

  result = (BKAnalyticsDebugViewController *)sub_1007FF260();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1003F6488();
}

- (void)jitterLowBoundTextFieldChangeWithTextField:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1003F72A8(v4, (void (*)(uint64_t))&static Defaults.analyticsJitterLowBoundValue.setter);
}

- (void)jitterUpperBoundTextFieldChangeWithTextField:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1003F72A8(v4, (void (*)(uint64_t))&static Defaults.analyticsJitterUpperBoundValue.setter);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (*(void **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BKAnalyticsDebugViewController_analyticsDatas))[2];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1007F2E40();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F2DE0();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_1003F69C0(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  NSString v4 = sub_1007FDC30();

  return v4;
}

- (BKAnalyticsDebugViewController)initWithStyle:(int64_t)a3
{
  result = (BKAnalyticsDebugViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BKAnalyticsDebugViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (BKAnalyticsDebugViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end