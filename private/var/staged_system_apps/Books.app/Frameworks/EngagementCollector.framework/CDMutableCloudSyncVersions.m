@interface CDMutableCloudSyncVersions
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC19EngagementCollector26CDMutableCloudSyncVersions)init;
- (_TtC19EngagementCollector26CDMutableCloudSyncVersions)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CDMutableCloudSyncVersions

- (NSString)description
{
  v2 = self;
  sub_21EE4();

  NSString v3 = sub_380A0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22208(v4);
}

- (_TtC19EngagementCollector26CDMutableCloudSyncVersions)initWithCoder:(id)a3
{
  return (_TtC19EngagementCollector26CDMutableCloudSyncVersions *)CDMutableCloudSyncVersions.init(coder:)(a3);
}

- (_TtC19EngagementCollector26CDMutableCloudSyncVersions)init
{
  result = (_TtC19EngagementCollector26CDMutableCloudSyncVersions *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  NSString v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyToken);
}

@end