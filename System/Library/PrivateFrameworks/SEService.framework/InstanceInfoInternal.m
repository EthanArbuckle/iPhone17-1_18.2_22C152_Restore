@interface InstanceInfoInternal
+ (BOOL)supportsSecureCoding;
- (NSData)instanceAID;
- (NSData)lifeCycleState;
- (NSData)moduleAID;
- (NSData)packageAID;
- (NSData)securityDomainAID;
- (NSData)securityDomainKeyInfo;
- (_TtC9SEService20InstanceInfoInternal)init;
- (_TtC9SEService20InstanceInfoInternal)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation InstanceInfoInternal

- (NSData)instanceAID
{
  return (NSData *)sub_21474A728((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC9SEService20InstanceInfoInternal_instanceAID);
}

- (NSData)packageAID
{
  return (NSData *)sub_21474A728((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC9SEService20InstanceInfoInternal_packageAID);
}

- (NSData)moduleAID
{
  return (NSData *)sub_21474A728((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC9SEService20InstanceInfoInternal_moduleAID);
}

- (NSData)securityDomainAID
{
  return (NSData *)sub_21474A728((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC9SEService20InstanceInfoInternal_securityDomainAID);
}

- (NSData)securityDomainKeyInfo
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9SEService20InstanceInfoInternal_securityDomainKeyInfo);
  unint64_t v3 = *(void *)&self->instanceAID[OBJC_IVAR____TtC9SEService20InstanceInfoInternal_securityDomainKeyInfo];
  if (v3 >> 60 == 15)
  {
    v4 = 0;
  }
  else
  {
    uint64_t v5 = *v2;
    sub_21472BBA4(*v2, v3);
    v4 = (void *)sub_2147ACCA8();
    sub_21474B19C(v5, v3);
  }
  return (NSData *)v4;
}

- (NSData)lifeCycleState
{
  return (NSData *)sub_21474A728((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC9SEService20InstanceInfoInternal_lifeCycleState);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  InstanceInfoInternal.encode(with:)((NSCoder)v4);
}

- (_TtC9SEService20InstanceInfoInternal)initWithCoder:(id)a3
{
  return (_TtC9SEService20InstanceInfoInternal *)InstanceInfoInternal.init(coder:)(a3);
}

- (_TtC9SEService20InstanceInfoInternal)init
{
  result = (_TtC9SEService20InstanceInfoInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_21472BBFC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9SEService20InstanceInfoInternal_instanceAID), *(void *)&self->instanceAID[OBJC_IVAR____TtC9SEService20InstanceInfoInternal_instanceAID]);
  sub_21472BBFC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9SEService20InstanceInfoInternal_packageAID), *(void *)&self->instanceAID[OBJC_IVAR____TtC9SEService20InstanceInfoInternal_packageAID]);
  sub_21472BBFC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9SEService20InstanceInfoInternal_moduleAID), *(void *)&self->instanceAID[OBJC_IVAR____TtC9SEService20InstanceInfoInternal_moduleAID]);
  sub_21472BBFC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9SEService20InstanceInfoInternal_securityDomainAID), *(void *)&self->instanceAID[OBJC_IVAR____TtC9SEService20InstanceInfoInternal_securityDomainAID]);
  sub_21474B19C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9SEService20InstanceInfoInternal_securityDomainKeyInfo), *(void *)&self->instanceAID[OBJC_IVAR____TtC9SEService20InstanceInfoInternal_securityDomainKeyInfo]);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9SEService20InstanceInfoInternal_lifeCycleState);
  unint64_t v4 = *(void *)&self->instanceAID[OBJC_IVAR____TtC9SEService20InstanceInfoInternal_lifeCycleState];
  sub_21472BBFC(v3, v4);
}

@end