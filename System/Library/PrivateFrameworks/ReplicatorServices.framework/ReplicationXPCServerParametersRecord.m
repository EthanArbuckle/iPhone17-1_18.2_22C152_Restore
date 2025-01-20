@interface ReplicationXPCServerParametersRecord
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)supportsBSXPCSecureCoding;
- (NSString)description;
- (_TtC18ReplicatorServices36ReplicationXPCServerParametersRecord)init;
- (_TtC18ReplicatorServices36ReplicationXPCServerParametersRecord)initWithBSXPCCoder:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation ReplicationXPCServerParametersRecord

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (NSString)description
{
  v2 = self;
  ReplicationXPCServerParametersRecord.description.getter();

  v3 = (void *)sub_25B37F970();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
}

- (_TtC18ReplicatorServices36ReplicationXPCServerParametersRecord)initWithBSXPCCoder:(id)a3
{
  return (_TtC18ReplicatorServices36ReplicationXPCServerParametersRecord *)ReplicationXPCServerParametersRecord.init(bsxpcCoder:)(a3);
}

- (_TtC18ReplicatorServices36ReplicationXPCServerParametersRecord)init
{
  result = (_TtC18ReplicatorServices36ReplicationXPCServerParametersRecord *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_25B330E84((uint64_t)self + OBJC_IVAR____TtC18ReplicatorServices36ReplicationXPCServerParametersRecord_id, type metadata accessor for ReplicatorRecord.ID);
  v3 = (char *)self + OBJC_IVAR____TtC18ReplicatorServices36ReplicationXPCServerParametersRecord_version;
  uint64_t v4 = sub_25B37F640();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  sub_25B2E344C((uint64_t)self + OBJC_IVAR____TtC18ReplicatorServices36ReplicationXPCServerParametersRecord_expiration, &qword_26B340F80);
}

@end