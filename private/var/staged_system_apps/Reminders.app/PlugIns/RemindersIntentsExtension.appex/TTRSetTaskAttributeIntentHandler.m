@interface TTRSetTaskAttributeIntentHandler
- (_TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler)init;
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
  sub_10000BCA8(v7, (uint64_t)v6);
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

- (_TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler)init
{
  result = (_TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_store));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_queue));
  sub_10000A4D4((uint64_t)self+ OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_contactRepresentationResolver);
  sub_10000A4D4((uint64_t)self + OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_dataSource);
  v3 = (char *)self + OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_timeProvider;

  sub_10000A4D4((uint64_t)v3);
}

@end