@interface TSBackgroundFetchJournalEntry
- (NSDate)date;
- (NSString)reason;
- (TSBackgroundFetchJournalEntry)init;
- (TSBackgroundFetchJournalEntry)initWithReason:(id)a3 date:(id)a4;
@end

@implementation TSBackgroundFetchJournalEntry

- (NSString)reason
{
  BackgroundFetchJournalEntry.reason.getter();
  v2 = (void *)sub_191EE80E0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSDate)date
{
  uint64_t v2 = sub_191EE7640();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  BackgroundFetchJournalEntry.date.getter((uint64_t)v5);
  v6 = (void *)sub_191EE75A0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

  return (NSDate *)v6;
}

- (TSBackgroundFetchJournalEntry)initWithReason:(id)a3 date:(id)a4
{
  uint64_t v4 = sub_191EE7640();
  MEMORY[0x1F4188790](v4 - 8);
  sub_191EE8110();
  sub_191EE7600();
  return (TSBackgroundFetchJournalEntry *)BackgroundFetchJournalEntry.init(reason:date:)();
}

- (TSBackgroundFetchJournalEntry)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR___TSBackgroundFetchJournalEntry_date;
  uint64_t v4 = sub_191EE7640();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end