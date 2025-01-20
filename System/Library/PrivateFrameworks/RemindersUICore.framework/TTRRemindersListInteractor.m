@interface TTRRemindersListInteractor
- (OS_dispatch_queue)callbackQueue;
- (_TtC15RemindersUICore26TTRRemindersListInteractor)init;
- (void)notifyEventFromSaveRequest:(id)a3;
@end

@implementation TTRRemindersListInteractor

- (_TtC15RemindersUICore26TTRRemindersListInteractor)init
{
  result = (_TtC15RemindersUICore26TTRRemindersListInteractor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B90D88A0((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore26TTRRemindersListInteractor_delegate);
  sub_1B90D88A0((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore26TTRRemindersListInteractor_optimisticUpdatesDelegate);

  sub_1B917A8BC(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC15RemindersUICore26TTRRemindersListInteractor_defaultListType));
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore26TTRRemindersListInteractor_committer);
  sub_1B90CCA68((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore26TTRRemindersListInteractor_fixedUndoContext, &qword_1EB9AF268);

  swift_release();
}

- (OS_dispatch_queue)callbackQueue
{
  uint64_t v3 = sub_1B996E5F0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B90BFD68(0, (unint64_t *)&qword_1EB9B5FA0);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E4FBCB50], v3);
  v7 = self;
  v8 = (void *)sub_1B996F890();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (OS_dispatch_queue *)v8;
}

- (void)notifyEventFromSaveRequest:(id)a3
{
  sub_1B90BFD68(0, (unint64_t *)&unk_1EB9AD9B0);
  sub_1B90F1D40(&qword_1E9EFD0E8, (unint64_t *)&unk_1EB9AD9B0);
  uint64_t v4 = sub_1B996F260();
  uint64_t v5 = self;
  TTRRemindersListInteractor.notifyEvent(fromSaveRequest:)(v4);

  swift_bridgeObjectRelease();
}

@end