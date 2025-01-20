@interface QuickScheduleManagementViewRepresentation.Coordinator
- (_TtCV13SleepHealthUI41QuickScheduleManagementViewRepresentation11Coordinator)init;
- (void)quickScheduleManagementViewController:(id)a3 didSave:(id)a4;
- (void)quickScheduleManagementViewController:(id)a3 shouldPresent:(id)a4;
- (void)quickScheduleManagementViewControllerDidCancel:(id)a3;
- (void)quickScheduleManagementViewControllerWillSave:(id)a3;
@end

@implementation QuickScheduleManagementViewRepresentation.Coordinator

- (void)quickScheduleManagementViewControllerWillSave:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AD9900D4("[%{public}s] Will save schedule.");
}

- (void)quickScheduleManagementViewController:(id)a3 didSave:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1AD98FE9C(a4);
}

- (void)quickScheduleManagementViewControllerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AD9900D4("[%{public}s] Did cancel.");
}

- (void)quickScheduleManagementViewController:(id)a3 shouldPresent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1AD9902B4(v7);
}

- (_TtCV13SleepHealthUI41QuickScheduleManagementViewRepresentation11Coordinator)init
{
  result = (_TtCV13SleepHealthUI41QuickScheduleManagementViewRepresentation11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV13SleepHealthUI41QuickScheduleManagementViewRepresentation11Coordinator_parent);
  v3 = *(void **)&self->parent[OBJC_IVAR____TtCV13SleepHealthUI41QuickScheduleManagementViewRepresentation11Coordinator_parent];
  swift_release();

  swift_release();
  swift_unknownObjectWeakDestroy();
}

@end