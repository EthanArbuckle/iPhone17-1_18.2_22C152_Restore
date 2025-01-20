@interface PommesResultCandidateMessage
- (NSString)debugDescription;
@end

@implementation PommesResultCandidateMessage

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
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16SiriMessageTypes28PommesResultCandidateMessage_pommesResponse));
  v4 = (char *)self + OBJC_IVAR____TtC16SiriMessageTypes28PommesResultCandidateMessage_searchReason;
  sub_25D0BD170();
  OUTLINED_FUNCTION_3_7();
  v7 = *(void (**)(char *, uint64_t))(v6 + 8);
  v7(v4, v5);
}

@end