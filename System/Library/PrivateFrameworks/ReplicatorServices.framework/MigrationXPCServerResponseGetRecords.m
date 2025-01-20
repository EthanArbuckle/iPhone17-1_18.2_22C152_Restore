@interface MigrationXPCServerResponseGetRecords
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)supportsBSXPCSecureCoding;
- (_TtC18ReplicatorServices36MigrationXPCServerResponseGetRecords)init;
- (_TtC18ReplicatorServices36MigrationXPCServerResponseGetRecords)initWithBSXPCCoder:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation MigrationXPCServerResponseGetRecords

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
  swift_unknownObjectRetain();
  v5 = self;
  MigrationXPCServerResponseGetRecords.encode(withBSXPCCoder:)(a3);
  swift_unknownObjectRelease();
}

- (_TtC18ReplicatorServices36MigrationXPCServerResponseGetRecords)initWithBSXPCCoder:(id)a3
{
  return (_TtC18ReplicatorServices36MigrationXPCServerResponseGetRecords *)MigrationXPCServerResponseGetRecords.init(bsxpcCoder:)(a3);
}

- (_TtC18ReplicatorServices36MigrationXPCServerResponseGetRecords)init
{
  result = (_TtC18ReplicatorServices36MigrationXPCServerResponseGetRecords *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end