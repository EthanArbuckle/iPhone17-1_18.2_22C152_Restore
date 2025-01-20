@interface PommesTRPCandidateMessage
- (NSString)debugDescription;
@end

@implementation PommesTRPCandidateMessage

- (NSString)debugDescription
{
  v2 = self;
  sub_25CF69C08();

  v3 = (void *)sub_25D0BD2D0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  sub_25D0BCFE0();
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_2_3();
  v3();
  swift_bridgeObjectRelease();
  sub_25D00E868(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC16SiriMessageTypes25PommesTRPCandidateMessage_pommesResult), self->super.super.super.super._anon_0[OBJC_IVAR____TtC16SiriMessageTypes25PommesTRPCandidateMessage_pommesResult]);
  v4 = (char *)self + OBJC_IVAR____TtC16SiriMessageTypes25PommesTRPCandidateMessage_searchReason;
  sub_25D0BD170();
  OUTLINED_FUNCTION_3_7();
  v7 = *(void (**)(char *, uint64_t))(v6 + 8);
  v7(v4, v5);
}

@end