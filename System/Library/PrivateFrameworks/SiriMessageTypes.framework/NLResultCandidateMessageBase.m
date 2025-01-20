@interface NLResultCandidateMessageBase
- (NSString)description;
@end

@implementation NLResultCandidateMessageBase

- (NSString)description
{
  v2 = self;
  sub_25CFEECE8();

  v3 = (void *)sub_25D0BD2D0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_25D0BD080();
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_2_3();
  v3();
  sub_25CF960F4((uint64_t)self + OBJC_IVAR____TtC16SiriMessageTypes28NLResultCandidateMessageBase_fallbackParse, &qword_26B364038);
  sub_25CF960F4((uint64_t)self + OBJC_IVAR____TtC16SiriMessageTypes28NLResultCandidateMessageBase_languageVariantResult, &qword_26B364030);
  swift_bridgeObjectRelease();
}

@end