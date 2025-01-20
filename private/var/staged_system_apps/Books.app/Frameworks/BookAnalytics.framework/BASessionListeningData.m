@interface BASessionListeningData
- (BASessionListeningData)init;
- (BASessionListeningData)initWithTimeSpentListening:(int64_t)a3 uniqueAudiobooksListened:(int64_t)a4;
@end

@implementation BASessionListeningData

- (BASessionListeningData)initWithTimeSpentListening:(int64_t)a3 uniqueAudiobooksListened:(int64_t)a4
{
  return (BASessionListeningData *)sub_E2790((char *)self, (uint64_t)a2, a3, a4, &OBJC_IVAR___BASessionListeningData_timeSpentListening, &OBJC_IVAR___BASessionListeningData_uniqueAudiobooksListened, type metadata accessor for BridgedSessionListeningData);
}

- (BASessionListeningData)init
{
  result = (BASessionListeningData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end