@interface AnswerCallIntentHandler
- (_TtC16SiriPhoneIntents23AnswerCallIntentHandler)init;
- (void)handleAnswerCall:(INAnswerCallIntent *)a3 completion:(id)a4;
@end

@implementation AnswerCallIntentHandler

- (void)handleAnswerCall:(INAnswerCallIntent *)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  _runTaskForBridgedAsyncMethod(_:)((uint64_t)&async function pointer to partial apply for @objc closure #1 in AnswerCallIntentHandler.handle(intent:), (uint64_t)v7);
}

- (_TtC16SiriPhoneIntents23AnswerCallIntentHandler)init
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16SiriPhoneIntents23AnswerCallIntentHandler_callCenter);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16SiriPhoneIntents23AnswerCallIntentHandler_answerCallIntentHandlerDataSource);
  v3 = (char *)self + OBJC_IVAR____TtC16SiriPhoneIntents23AnswerCallIntentHandler_deviceState;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end