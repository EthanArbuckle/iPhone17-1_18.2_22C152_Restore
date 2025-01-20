@interface BASessionReadingData
- (BASessionReadingData)init;
- (BASessionReadingData)initWithTimeSpentReading:(int64_t)a3 uniqueBooksRead:(int64_t)a4;
@end

@implementation BASessionReadingData

- (BASessionReadingData)initWithTimeSpentReading:(int64_t)a3 uniqueBooksRead:(int64_t)a4
{
  return (BASessionReadingData *)sub_E2790((char *)self, (uint64_t)a2, a3, a4, &OBJC_IVAR___BASessionReadingData_timeSpentReading, &OBJC_IVAR___BASessionReadingData_uniqueBooksRead, type metadata accessor for BridgedSessionReadingData);
}

- (BASessionReadingData)init
{
  result = (BASessionReadingData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end