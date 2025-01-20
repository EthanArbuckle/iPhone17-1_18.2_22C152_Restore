@interface ReplicationXPCServerParametersRecordValue
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)supportsBSXPCSecureCoding;
- (_TtC18ReplicatorServices41ReplicationXPCServerParametersRecordValue)init;
- (_TtC18ReplicatorServices41ReplicationXPCServerParametersRecordValue)initWithBSXPCCoder:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation ReplicationXPCServerParametersRecordValue

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

- (_TtC18ReplicatorServices41ReplicationXPCServerParametersRecordValue)initWithBSXPCCoder:(id)a3
{
  return (_TtC18ReplicatorServices41ReplicationXPCServerParametersRecordValue *)sub_25B328D44((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_25B3311DC);
}

- (_TtC18ReplicatorServices41ReplicationXPCServerParametersRecordValue)init
{
  result = (_TtC18ReplicatorServices41ReplicationXPCServerParametersRecordValue *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_25B2CA2C4(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC18ReplicatorServices41ReplicationXPCServerParametersRecordValue_data), *(void *)&self->version[OBJC_IVAR____TtC18ReplicatorServices41ReplicationXPCServerParametersRecordValue_data]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ReplicatorServices41ReplicationXPCServerParametersRecordValue_fileHandle));
  swift_bridgeObjectRelease();
}

@end