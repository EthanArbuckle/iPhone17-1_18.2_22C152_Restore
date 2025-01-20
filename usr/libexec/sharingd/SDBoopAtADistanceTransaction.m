@interface SDBoopAtADistanceTransaction
- (BOOL)isInitiator;
- (NSDate)connectionDate;
- (NSError)error;
- (NSUUID)identifier;
- (_TtC16DaemoniOSLibrary28SDBoopAtADistanceTransaction)init;
@end

@implementation SDBoopAtADistanceTransaction

- (NSUUID)identifier
{
  return (NSUUID *)sub_1002A7244(self, (uint64_t)a2, (uint64_t (*)(void))&type metadata accessor for UUID, (void (*)(void))&SFAirDropClient.BoopAtADistance.Transaction.identifier.getter, (uint64_t (*)(void))&UUID._bridgeToObjectiveC());
}

- (NSDate)connectionDate
{
  return (NSDate *)sub_1002A7244(self, (uint64_t)a2, (uint64_t (*)(void))&type metadata accessor for Date, (void (*)(void))&SFAirDropClient.BoopAtADistance.Transaction.connectionDate.getter, (uint64_t (*)(void))&Date._bridgeToObjectiveC());
}

- (NSError)error
{
  return (NSError *)0;
}

- (BOOL)isInitiator
{
  v2 = self;
  char v3 = SFAirDropClient.BoopAtADistance.Transaction.isInitiator.getter();

  return v3 & 1;
}

- (_TtC16DaemoniOSLibrary28SDBoopAtADistanceTransaction)init
{
  result = (_TtC16DaemoniOSLibrary28SDBoopAtADistanceTransaction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary28SDBoopAtADistanceTransaction_inner;
  uint64_t v3 = type metadata accessor for SFAirDropClient.BoopAtADistance.Transaction();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end