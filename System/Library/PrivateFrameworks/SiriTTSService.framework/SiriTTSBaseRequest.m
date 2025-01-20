@interface SiriTTSBaseRequest
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (NSString)sandboxToken;
- (NSURL)outputPath;
- (NSUUID)interactionLinkId;
- (NSUUID)logLinkId;
- (SiriTTSBaseRequest)init;
- (SiriTTSBaseRequest)initWithCoder:(id)a3;
- (id)didReportInstrument;
- (void)encodeWithCoder:(id)a3;
- (void)setDidReportInstrument:(id)a3;
- (void)setInteractionLinkId:(id)a3;
- (void)setLogLinkId:(id)a3;
- (void)setOutputPath:(id)a3;
- (void)setSandboxToken:(id)a3;
@end

@implementation SiriTTSBaseRequest

- (NSURL)outputPath
{
  return (NSURL *)sub_19CDD1DAC(self, (uint64_t)a2, &qword_1EB534BB0, (void (*)(void))sub_19CDD14D4, MEMORY[0x1E4F276F0], MEMORY[0x1E4F276D8]);
}

- (void)setOutputPath:(id)a3
{
}

- (NSString)sandboxToken
{
  return (NSString *)sub_19CDD6E7C((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_19CDD1B9C);
}

- (void)setSandboxToken:(id)a3
{
}

- (NSUUID)logLinkId
{
  return (NSUUID *)sub_19CDD1DAC(self, (uint64_t)a2, &qword_1EB534068, (void (*)(void))sub_19CDD1C5C, MEMORY[0x1E4F27990], MEMORY[0x1E4F27980]);
}

- (void)setLogLinkId:(id)a3
{
}

- (NSUUID)interactionLinkId
{
  return (NSUUID *)sub_19CDD1DAC(self, (uint64_t)a2, &qword_1EB534068, (void (*)(void))sub_19CDD1E98, MEMORY[0x1E4F27990], MEMORY[0x1E4F27980]);
}

- (void)setInteractionLinkId:(id)a3
{
}

- (id)didReportInstrument
{
  uint64_t v2 = sub_19CDD21AC();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 1107296256;
    v6[2] = sub_19CDCE0D0;
    v6[3] = &block_descriptor_1;
    v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setDidReportInstrument:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_19CDDD4D8;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  sub_19CDD233C((uint64_t)v4, v5);
}

- (SiriTTSBaseRequest)init
{
  return (SiriTTSBaseRequest *)sub_19CDD24F0();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_19CDD2600(v4);
}

- (SiriTTSBaseRequest)initWithCoder:(id)a3
{
  return (SiriTTSBaseRequest *)BaseRequest.init(coder:)(a3);
}

- (NSString)description
{
  return (NSString *)sub_19CDD8FE8(self, (uint64_t)a2, (void (*)(void))sub_19CDD318C);
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_92();
  sub_19CDAE810((uint64_t)self + OBJC_IVAR___SiriTTSBaseRequest_accessoryId, &qword_1EB534068);
  sub_19CDAE810((uint64_t)self + OBJC_IVAR___SiriTTSBaseRequest_outputPath, &qword_1EB534BB0);
  swift_bridgeObjectRelease();
  sub_19CDAE810((uint64_t)self + OBJC_IVAR___SiriTTSBaseRequest_logLinkId, &qword_1EB534068);
  sub_19CDAE810((uint64_t)self + OBJC_IVAR___SiriTTSBaseRequest_interactionLinkId, &qword_1EB534068);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SiriTTSBaseRequest_didReportInstrument);
  sub_19CDD9244(v3);
}

@end