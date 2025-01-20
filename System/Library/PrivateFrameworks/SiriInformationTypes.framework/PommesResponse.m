@interface PommesResponse
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)description;
- (_TtC21SiriInformationSearch14PommesResponse)init;
- (_TtC21SiriInformationSearch14PommesResponse)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PommesResponse

+ (BOOL)supportsSecureCoding
{
  return static PommesResponse.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static PommesResponse.supportsSecureCoding = a3;
}

- (_TtC21SiriInformationSearch14PommesResponse)initWithCoder:(id)a3
{
  uint64_t ObjectType = swift_getObjectType();
  memset(__src, 0, 24);
  *(void *)&__src[24] = 0xF000000000000000;
  memset(&__src[32], 0, 17);
  memset(&__src[56], 0, 24);
  *(_OWORD *)&__src[80] = xmmword_25C97FEE0;
  *(void *)&__src[96] = 0xF000000000000000;
  __src[104] = 0;
  memset(&__src[112], 0, 48);
  *(_WORD *)&__src[160] = 255;
  memset(&__src[168], 0, 32);
  *(void *)&__src[200] = MEMORY[0x263F8EE78];
  memset(&__src[208], 0, 18);
  memset(&__src[232], 0, 40);
  *(_OWORD *)&__src[272] = xmmword_25C97FEE0;
  *(void *)&__src[288] = 0xF000000000000000;
  memset(&__src[296], 0, 25);
  id v5 = a3;
  closure #1 in PommesResponse.init(coder:)((uint64_t)__src, v5);
  memcpy(v8, __src, 0x141uLL);
  v6 = (_TtC21SiriInformationSearch14PommesResponse *)(*(uint64_t (**)(unsigned char *))(ObjectType + 312))(v8);

  swift_deallocPartialClassInstance();
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  PommesResponse.encode(with:)((NSCoder)v4);
}

- (NSString)description
{
  v2 = self;
  uint64_t v3 = PommesResponse.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x261198B80](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (_TtC21SiriInformationSearch14PommesResponse)init
{
  result = (_TtC21SiriInformationSearch14PommesResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_conversationContext), *(void *)&self->experiences[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_conversationContext]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation?(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pegasusDomainFlowStepLog), *(void *)&self->experiences[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pegasusDomainFlowStepLog]);
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation?(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pegasusDomainUserSensitiveTier1Log), *(void *)&self->experiences[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pegasusDomainUserSensitiveTier1Log]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of PommesCandidateId?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pommesCandidateId), *(void *)&self->experiences[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pommesCandidateId], *(void *)&self->clientResults[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pommesCandidateId], *(void *)&self->conversationContext[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pommesCandidateId], self->conversationContext[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pommesCandidateId + 8]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_encodedNLUserParses), *(void *)&self->experiences[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_encodedNLUserParses]);
  outlined consume of Data._Representation?(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_encodedNLFallbackParse), *(void *)&self->experiences[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_encodedNLFallbackParse]);

  swift_bridgeObjectRelease();
}

@end