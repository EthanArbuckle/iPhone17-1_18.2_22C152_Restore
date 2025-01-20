@interface SleepOnboardingFlowTableViewController
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)hksp_presentationStyle;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SleepOnboardingFlowTableViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1AD933B74(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1AD933E8C(a3);
}

- (int64_t)hksp_presentationStyle
{
  return *(int64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_presentationStyle);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1AD93418C();
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  double v8 = SleepOnboardingFlowTableViewController.tableView(_:heightForHeaderInSection:)(v6, a4);

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  double v8 = SleepOnboardingFlowTableViewController.tableView(_:heightForFooterInSection:)(v6, a4);

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1AD9DCF10();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9DCEE0();
  id v11 = a3;
  v12 = self;
  SleepOnboardingFlowTableViewController.tableView(_:didSelectRowAt:)(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

@end