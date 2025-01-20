@interface BiomeInteractionProcessor
- (_TtC13SiriInference25BiomeInteractionProcessor)init;
- (void)main;
@end

@implementation BiomeInteractionProcessor

- (void)main
{
  v2 = self;
  BiomeInteractionProcessor.main()();
}

- (_TtC13SiriInference25BiomeInteractionProcessor)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC13SiriInference25BiomeInteractionProcessor_appIntentEvent));
  v3 = (char *)self + OBJC_IVAR____TtC13SiriInference25BiomeInteractionProcessor_databaseURL;
  sub_1C68E9968();
  OUTLINED_FUNCTION_2_11();
  (*(void (**)(char *))(v4 + 8))(v3);
  v5 = (char *)self + OBJC_IVAR____TtC13SiriInference25BiomeInteractionProcessor_eventReceivedAt;
  sub_1C68E9B78();
  OUTLINED_FUNCTION_2_11();
  (*(void (**)(char *))(v6 + 8))(v5);
  v7 = (char *)self + OBJC_IVAR____TtC13SiriInference25BiomeInteractionProcessor_siriTasksEvaluator;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

@end