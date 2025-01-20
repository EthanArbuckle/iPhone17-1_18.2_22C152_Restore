@interface PLLoggingServiceStore
+ (PLLoggingServiceStore)sharedInstance;
- (PLLoggingServiceStore)init;
- (void)storeInstrumentationWithEvents:(id)a3 completion:(id)a4;
@end

@implementation PLLoggingServiceStore

- (PLLoggingServiceStore)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLLoggingServiceStore;
  return [(PLLoggingServiceStore *)&v3 init];
}

+ (PLLoggingServiceStore)sharedInstance
{
  if (qword_267C933F8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_267C93528;
  return (PLLoggingServiceStore *)v2;
}

- (void)storeInstrumentationWithEvents:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  sub_21C97A7D8();
  unint64_t v6 = sub_21C9844D8();
  if (v5)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v5;
    v5 = sub_21C97A860;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = qword_267C93418;
  v9 = self;
  if (v8 != -1) {
    swift_once();
  }
  sub_21C98381C(v6, (uint64_t)v5, v7);
  sub_21C97A818((uint64_t)v5);

  swift_bridgeObjectRelease();
}

@end