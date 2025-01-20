@interface RDDebounceableCKDatabaseNotification
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)subscriptionOwnerUserRecordName;
- (_TtC7remindd36RDDebounceableCKDatabaseNotification)init;
- (_TtC7remindd36RDDebounceableCKDatabaseNotification)initWithDatabaseScope:(int64_t)a3 subscriptionOwnerUserRecordName:(id)a4;
- (int64_t)databaseScope;
- (int64_t)hash;
- (void)setDatabaseScope:(int64_t)a3;
- (void)setSubscriptionOwnerUserRecordName:(id)a3;
@end

@implementation RDDebounceableCKDatabaseNotification

- (int64_t)databaseScope
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7remindd36RDDebounceableCKDatabaseNotification_databaseScope);
}

- (void)setDatabaseScope:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd36RDDebounceableCKDatabaseNotification_databaseScope) = (Class)a3;
}

- (NSString)subscriptionOwnerUserRecordName
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setSubscriptionOwnerUserRecordName:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC7remindd36RDDebounceableCKDatabaseNotification_subscriptionOwnerUserRecordName);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (_TtC7remindd36RDDebounceableCKDatabaseNotification)initWithDatabaseScope:(int64_t)a3 subscriptionOwnerUserRecordName:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd36RDDebounceableCKDatabaseNotification_databaseScope) = (Class)a3;
  v7 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC7remindd36RDDebounceableCKDatabaseNotification_subscriptionOwnerUserRecordName);
  uint64_t *v7 = v6;
  v7[1] = v8;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for RDDebounceableCKDatabaseNotification();
  return [(RDDebounceableCKDatabaseNotification *)&v10 init];
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_1000E61C4((uint64_t)v8);

  sub_1000966BC((uint64_t)v8, &qword_100908190);
  return v6 & 1;
}

- (int64_t)hash
{
  NSString v2 = self;
  uint64_t v3 = Int.hashValue.getter();
  swift_bridgeObjectRetain();
  uint64_t v4 = String.hashValue.getter();

  swift_bridgeObjectRelease();
  return v4 ^ v3;
}

- (NSString)description
{
  NSString v2 = self;
  sub_1000E640C();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC7remindd36RDDebounceableCKDatabaseNotification)init
{
  result = (_TtC7remindd36RDDebounceableCKDatabaseNotification *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end