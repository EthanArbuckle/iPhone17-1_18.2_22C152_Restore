@interface ReplicationXPCServerParametersAddRecords
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)supportsBSXPCSecureCoding;
- (_TtC18ReplicatorServices40ReplicationXPCServerParametersAddRecords)init;
- (_TtC18ReplicatorServices40ReplicationXPCServerParametersAddRecords)initWithBSXPCCoder:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation ReplicationXPCServerParametersAddRecords

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
}

- (_TtC18ReplicatorServices40ReplicationXPCServerParametersAddRecords)initWithBSXPCCoder:(id)a3
{
  return (_TtC18ReplicatorServices40ReplicationXPCServerParametersAddRecords *)ReplicationXPCServerParametersAddRecords.init(bsxpcCoder:)(a3);
}

- (_TtC18ReplicatorServices40ReplicationXPCServerParametersAddRecords)init
{
  result = (_TtC18ReplicatorServices40ReplicationXPCServerParametersAddRecords *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end