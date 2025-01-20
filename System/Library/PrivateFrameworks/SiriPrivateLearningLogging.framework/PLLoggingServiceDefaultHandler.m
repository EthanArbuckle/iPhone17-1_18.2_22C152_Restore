@interface PLLoggingServiceDefaultHandler
- (_TtC26SiriPrivateLearningLogging30PLLoggingServiceDefaultHandler)init;
- (void)storeInstrumentationWithEvents:(id)a3 completion:(id)a4;
@end

@implementation PLLoggingServiceDefaultHandler

- (void)storeInstrumentationWithEvents:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  sub_21C97C1A8(0, (unint64_t *)&qword_267C93530);
  uint64_t v6 = sub_21C9844D8();
  if (v5)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v5;
    v5 = sub_21C983350;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  sub_21C9831E8(v6, v5, v7);
  sub_21C97A818((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (_TtC26SiriPrivateLearningLogging30PLLoggingServiceDefaultHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PLLoggingServiceDefaultHandler();
  return [(PLLoggingServiceDefaultHandler *)&v3 init];
}

@end