@interface TTRAddTasksIntentHandler
- (_TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler)init;
- (void)handleAddTasks:(id)a3 completion:(id)a4;
- (void)resolveContactEventTriggerForAddTasks:(id)a3 completion:(id)a4;
- (void)resolveSpatialEventTriggerForAddTasks:(id)a3 withCompletion:(id)a4;
- (void)resolveTargetTaskListForAddTasks:(id)a3 completion:(id)a4;
- (void)resolveTargetTaskListMembersForAddTasks:(id)a3 withCompletion:(id)a4;
- (void)resolveTaskReferenceForAddTasks:(id)a3 withCompletion:(id)a4;
- (void)resolveTaskTitlesForAddTasks:(id)a3 withCompletion:(id)a4;
- (void)resolveTemporalEventTriggerForAddTasks:(id)a3 completion:(id)a4;
@end

@implementation TTRAddTasksIntentHandler

- (void)resolveTargetTaskListForAddTasks:(id)a3 completion:(id)a4
{
}

- (void)resolveTaskTitlesForAddTasks:(id)a3 withCompletion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_25AF4B450(v8, (uint64_t)sub_25AF550CC, v7);

  swift_release();
}

- (void)resolveSpatialEventTriggerForAddTasks:(id)a3 withCompletion:(id)a4
{
}

- (void)resolveTemporalEventTriggerForAddTasks:(id)a3 completion:(id)a4
{
}

- (void)resolveTaskReferenceForAddTasks:(id)a3 withCompletion:(id)a4
{
}

- (void)resolveTargetTaskListMembersForAddTasks:(id)a3 withCompletion:(id)a4
{
}

- (void)resolveContactEventTriggerForAddTasks:(id)a3 completion:(id)a4
{
}

- (void)handleAddTasks:(id)a3 completion:(id)a4
{
}

- (_TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler)init
{
  result = (_TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_store));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_queue));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_dataSource);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_contactRepresentationResolver);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_userActivityProvider);
  v3 = (char *)self + OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_timeProvider;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end