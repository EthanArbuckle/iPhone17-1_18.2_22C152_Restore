@interface ChangeTrackingAccountProvider
- (NSString)accountDescription;
- (NSString)accountID;
- (REMObjectID)rem_accountObjectID;
- (_TtC7reminddP33_38651BD03EE367A00C80EB4E8CAA4E4629ChangeTrackingAccountProvider)init;
- (_TtC7reminddP33_45435200B10504FC9CF3E682DD4A9AA229ChangeTrackingAccountProvider)init;
- (id)loggingDescription;
- (void)setAccountDescription:(id)a3;
- (void)setAccountID:(id)a3;
- (void)setRem_accountObjectID:(id)a3;
@end

@implementation ChangeTrackingAccountProvider

- (NSString)accountID
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setAccountID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC7reminddP33_38651BD03EE367A00C80EB4E8CAA4E4629ChangeTrackingAccountProvider_accountID);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (REMObjectID)rem_accountObjectID
{
  return (REMObjectID *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                + OBJC_IVAR____TtC7reminddP33_45435200B10504FC9CF3E682DD4A9AA229ChangeTrackingAccountProvider_rem_accountObjectID));
}

- (void)setRem_accountObjectID:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC7reminddP33_38651BD03EE367A00C80EB4E8CAA4E4629ChangeTrackingAccountProvider_rem_accountObjectID);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC7reminddP33_38651BD03EE367A00C80EB4E8CAA4E4629ChangeTrackingAccountProvider_rem_accountObjectID) = (Class)a3;
  id v3 = a3;
}

- (NSString)accountDescription
{
  if (*(void *)&self->accountID[OBJC_IVAR____TtC7reminddP33_45435200B10504FC9CF3E682DD4A9AA229ChangeTrackingAccountProvider_accountDescription])
  {
    swift_bridgeObjectRetain();
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setAccountDescription:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v6 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC7reminddP33_38651BD03EE367A00C80EB4E8CAA4E4629ChangeTrackingAccountProvider_accountDescription);
  *uint64_t v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (id)loggingDescription
{
  NSString v2 = self;
  sub_1001929F4();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v3;
}

- (_TtC7reminddP33_38651BD03EE367A00C80EB4E8CAA4E4629ChangeTrackingAccountProvider)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC7reminddP33_38651BD03EE367A00C80EB4E8CAA4E4629ChangeTrackingAccountProvider_accountID);
  *uint64_t v4 = 0;
  v4[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC7reminddP33_38651BD03EE367A00C80EB4E8CAA4E4629ChangeTrackingAccountProvider_rem_accountObjectID) = 0;
  uint64_t v5 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC7reminddP33_38651BD03EE367A00C80EB4E8CAA4E4629ChangeTrackingAccountProvider_accountDescription);
  void *v5 = 0;
  v5[1] = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(ChangeTrackingAccountProvider *)&v7 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7reminddP33_45435200B10504FC9CF3E682DD4A9AA229ChangeTrackingAccountProvider_rem_accountObjectID));

  swift_bridgeObjectRelease();
}

- (_TtC7reminddP33_45435200B10504FC9CF3E682DD4A9AA229ChangeTrackingAccountProvider)init
{
  result = (_TtC7reminddP33_45435200B10504FC9CF3E682DD4A9AA229ChangeTrackingAccountProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end