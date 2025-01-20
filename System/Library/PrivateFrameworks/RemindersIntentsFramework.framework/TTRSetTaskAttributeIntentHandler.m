@interface TTRSetTaskAttributeIntentHandler
- (_TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler)init;
- (void)handleSetTaskAttribute:(id)a3 completion:(id)a4;
- (void)resolveContactEventTriggerForSetTaskAttribute:(id)a3 completion:(id)a4;
- (void)resolveTargetTaskForSetTaskAttribute:(id)a3 withCompletion:(id)a4;
- (void)resolveTaskTitleForSetTaskAttribute:(id)a3 withCompletion:(id)a4;
- (void)resolveTemporalEventTriggerForSetTaskAttribute:(id)a3 completion:(id)a4;
@end

@implementation TTRSetTaskAttributeIntentHandler

- (void)resolveTargetTaskForSetTaskAttribute:(id)a3 withCompletion:(id)a4
{
}

- (void)resolveTaskTitleForSetTaskAttribute:(id)a3 withCompletion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_25AF568D8(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)resolveContactEventTriggerForSetTaskAttribute:(id)a3 completion:(id)a4
{
}

- (void)resolveTemporalEventTriggerForSetTaskAttribute:(id)a3 completion:(id)a4
{
}

- (void)handleSetTaskAttribute:(id)a3 completion:(id)a4
{
}

- (_TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler)init
{
  result = (_TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_store));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_queue));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_contactRepresentationResolver);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_dataSource);
  v3 = (char *)self + OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_timeProvider;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end