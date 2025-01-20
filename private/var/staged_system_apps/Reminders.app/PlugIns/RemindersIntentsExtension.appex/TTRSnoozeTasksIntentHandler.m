@interface TTRSnoozeTasksIntentHandler
- (_TtC25RemindersIntentsExtension27TTRSnoozeTasksIntentHandler)init;
- (void)handleSnoozeTasks:(id)a3 completion:(id)a4;
- (void)resolveNextTriggerTimeForSnoozeTasks:(id)a3 withCompletion:(id)a4;
- (void)resolveTasksForSnoozeTasks:(id)a3 withCompletion:(id)a4;
@end

@implementation TTRSnoozeTasksIntentHandler

- (void)resolveTasksForSnoozeTasks:(id)a3 withCompletion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_100014F28(v8, (uint64_t)sub_100018490, v7);

  swift_release();
}

- (void)resolveNextTriggerTimeForSnoozeTasks:(id)a3 withCompletion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  id v8 = self;
  sub_100016D0C(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)handleSnoozeTasks:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  id v8 = self;
  sub_100017710(v7, (uint64_t)v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (_TtC25RemindersIntentsExtension27TTRSnoozeTasksIntentHandler)init
{
  result = (_TtC25RemindersIntentsExtension27TTRSnoozeTasksIntentHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsExtension27TTRSnoozeTasksIntentHandler_store));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsExtension27TTRSnoozeTasksIntentHandler_queue));

  swift_release();
}

@end