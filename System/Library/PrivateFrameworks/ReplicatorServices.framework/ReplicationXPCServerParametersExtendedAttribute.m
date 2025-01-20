@interface ReplicationXPCServerParametersExtendedAttribute
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)supportsBSXPCSecureCoding;
- (_TtC18ReplicatorServices47ReplicationXPCServerParametersExtendedAttribute)init;
- (_TtC18ReplicatorServices47ReplicationXPCServerParametersExtendedAttribute)initWithBSXPCCoder:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation ReplicationXPCServerParametersExtendedAttribute

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

- (_TtC18ReplicatorServices47ReplicationXPCServerParametersExtendedAttribute)initWithBSXPCCoder:(id)a3
{
  return (_TtC18ReplicatorServices47ReplicationXPCServerParametersExtendedAttribute *)sub_25B328D44((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_25B330EE4);
}

- (_TtC18ReplicatorServices47ReplicationXPCServerParametersExtendedAttribute)init
{
  result = (_TtC18ReplicatorServices47ReplicationXPCServerParametersExtendedAttribute *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC18ReplicatorServices47ReplicationXPCServerParametersExtendedAttribute_data);
  unint64_t v4 = *(void *)&self->name[OBJC_IVAR____TtC18ReplicatorServices47ReplicationXPCServerParametersExtendedAttribute_data];
  sub_25B2CA2C4(v3, v4);
}

@end