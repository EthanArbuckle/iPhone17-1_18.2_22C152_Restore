@interface BiomeSiriUIProcessor
- (_TtC13SiriInference20BiomeSiriUIProcessor)init;
- (void)main;
@end

@implementation BiomeSiriUIProcessor

- (void)main
{
  v2 = self;
  BiomeSiriUIProcessor.main()();
}

- (_TtC13SiriInference20BiomeSiriUIProcessor)init
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC13SiriInference20BiomeSiriUIProcessor_siriTasksEvaluator);

  v3 = (char *)self + OBJC_IVAR____TtC13SiriInference20BiomeSiriUIProcessor_intentEventStore;
  uint64_t v4 = sub_1C68EBEF8();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end