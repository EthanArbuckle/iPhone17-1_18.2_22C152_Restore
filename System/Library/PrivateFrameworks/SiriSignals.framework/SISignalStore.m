@interface SISignalStore
- (BOOL)logWithData:(id)a3 signalType:(id)a4 intentId:(id)a5 timestamp:(id)a6 error:(id *)a7;
- (SISignalStore)init;
@end

@implementation SISignalStore

- (SISignalStore)init
{
  return (SISignalStore *)SignalStore.init()();
}

- (BOOL)logWithData:(id)a3 signalType:(id)a4 intentId:(id)a5 timestamp:(id)a6 error:(id *)a7
{
  v14 = a7;
  uint64_t v8 = sub_1C6BA6EA8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C6BA77B8();
  sub_1C6BA77B8();
  sub_1C6BA6E58();
  swift_unknownObjectRetain();
  v12 = self;
  sub_1C6B813DC();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  return 1;
}

- (void).cxx_destruct
{
}

@end