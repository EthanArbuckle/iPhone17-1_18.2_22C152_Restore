@interface CreateEvent.IntentHandler
- (_TtCO19SiriCalendarIntents11CreateEvent13IntentHandler)init;
- (void)confirmCreateEvent:(INCreateEventIntent *)a3 completion:(id)a4;
- (void)handleCreateEvent:(INCreateEventIntent *)a3 completion:(id)a4;
- (void)resolveDateTimeRangeForCreateEvent:(INCreateEventIntent *)a3 withCompletion:(id)a4;
- (void)resolveLocationForCreateEvent:(INCreateEventIntent *)a3 withCompletion:(id)a4;
- (void)resolveParticipantsForCreateEvent:(INCreateEventIntent *)a3 withCompletion:(id)a4;
- (void)resolveTitleForCreateEvent:(INCreateEventIntent *)a3 withCompletion:(id)a4;
@end

@implementation CreateEvent.IntentHandler

- (void)resolveTitleForCreateEvent:(INCreateEventIntent *)a3 withCompletion:(id)a4
{
}

- (void)resolveDateTimeRangeForCreateEvent:(INCreateEventIntent *)a3 withCompletion:(id)a4
{
}

- (void)resolveParticipantsForCreateEvent:(INCreateEventIntent *)a3 withCompletion:(id)a4
{
}

- (void)resolveLocationForCreateEvent:(INCreateEventIntent *)a3 withCompletion:(id)a4
{
}

- (void)confirmCreateEvent:(INCreateEventIntent *)a3 completion:(id)a4
{
}

- (void)handleCreateEvent:(INCreateEventIntent *)a3 completion:(id)a4
{
}

- (_TtCO19SiriCalendarIntents11CreateEvent13IntentHandler)init
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtCO19SiriCalendarIntents11CreateEvent13IntentHandler_correctionsFlowProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtCO19SiriCalendarIntents11CreateEvent13IntentHandler_featureManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtCO19SiriCalendarIntents11CreateEvent13IntentHandler_eventProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtCO19SiriCalendarIntents11CreateEvent13IntentHandler_deviceState);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtCO19SiriCalendarIntents11CreateEvent13IntentHandler_locationProvider);
  swift_release();
}

@end