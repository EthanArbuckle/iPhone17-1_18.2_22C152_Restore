@interface ReplicationXPCServerResponseGetRecords
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)supportsBSXPCSecureCoding;
- (_TtC18ReplicatorServices38ReplicationXPCServerResponseGetRecords)init;
- (_TtC18ReplicatorServices38ReplicationXPCServerResponseGetRecords)initWithBSXPCCoder:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation ReplicationXPCServerResponseGetRecords

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

- (_TtC18ReplicatorServices38ReplicationXPCServerResponseGetRecords)initWithBSXPCCoder:(id)a3
{
  return (_TtC18ReplicatorServices38ReplicationXPCServerResponseGetRecords *)ReplicationXPCServerResponseGetRecords.init(bsxpcCoder:)(a3);
}

- (_TtC18ReplicatorServices38ReplicationXPCServerResponseGetRecords)init
{
  result = (_TtC18ReplicatorServices38ReplicationXPCServerResponseGetRecords *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end