@interface EmptyBackgroundFetchJournal
- (NSArray)entries;
- (void)addEntryWithReason:(id)a3;
@end

@implementation EmptyBackgroundFetchJournal

- (void)addEntryWithReason:(id)a3
{
  sub_191EE8110();

  swift_bridgeObjectRelease();
}

- (NSArray)entries
{
  type metadata accessor for BackgroundFetchJournalEntry();
  v2 = (void *)sub_191EE8510();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

@end