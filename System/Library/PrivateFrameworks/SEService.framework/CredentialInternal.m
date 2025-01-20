@interface CredentialInternal
+ (BOOL)supportsSecureCoding;
- (NSArray)ownerApplications;
- (NSArray)userApplications;
- (NSString)friendlyName;
- (NSUUID)configUUID;
- (NSUUID)identifier;
- (_TtC9SEService18CredentialInternal)init;
- (_TtC9SEService18CredentialInternal)initWithCoder:(id)a3;
- (int64_t)accessLevel;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessLevel:(int64_t)a3;
- (void)setConfigUUID:(id)a3;
- (void)setOwnerApplications:(id)a3;
- (void)setUserApplications:(id)a3;
@end

@implementation CredentialInternal

- (NSUUID)identifier
{
  v2 = (void *)sub_2147ACD38();
  return (NSUUID *)v2;
}

- (NSString)friendlyName
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2147ACF38();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSArray)ownerApplications
{
  return (NSArray *)sub_21472C980();
}

- (void)setOwnerApplications:(id)a3
{
}

- (NSArray)userApplications
{
  return (NSArray *)sub_21472C980();
}

- (void)setUserApplications:(id)a3
{
}

- (NSUUID)configUUID
{
  uint64_t v3 = sub_2147ACD88();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC9SEService18CredentialInternal_configUUID;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = (void *)sub_2147ACD38();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSUUID *)v8;
}

- (void)setConfigUUID:(id)a3
{
  uint64_t v4 = sub_2147ACD88();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2147ACD58();
  v8 = (char *)self + OBJC_IVAR____TtC9SEService18CredentialInternal_configUUID;
  swift_beginAccess();
  v9 = *(void (**)(char *, char *, uint64_t))(v5 + 40);
  uint64_t v10 = self;
  v9(v8, v7, v4);
  swift_endAccess();
}

- (int64_t)accessLevel
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC9SEService18CredentialInternal_accessLevel);
  swift_beginAccess();
  return *v2;
}

- (void)setAccessLevel:(int64_t)a3
{
  uint64_t v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC9SEService18CredentialInternal_accessLevel);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  CredentialInternal.encode(with:)((NSCoder)v4);
}

- (_TtC9SEService18CredentialInternal)initWithCoder:(id)a3
{
  return (_TtC9SEService18CredentialInternal *)CredentialInternal.init(coder:)(a3);
}

- (_TtC9SEService18CredentialInternal)init
{
  result = (_TtC9SEService18CredentialInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC9SEService18CredentialInternal_identifier;
  uint64_t v4 = sub_2147ACD88();
  uint64_t v6 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v6)((void *)(v4 - 8), v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21472CC68(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9SEService18CredentialInternal_state), self->_anon_0[OBJC_IVAR____TtC9SEService18CredentialInternal_state]);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC9SEService18CredentialInternal_configUUID;
  v6(v5, v4);
}

@end