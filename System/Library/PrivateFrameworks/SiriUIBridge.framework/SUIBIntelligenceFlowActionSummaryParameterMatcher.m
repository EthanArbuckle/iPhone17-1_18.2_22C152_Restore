@interface SUIBIntelligenceFlowActionSummaryParameterMatcher
+ (id)matchesIn:(id)a3;
- (SUIBIntelligenceFlowActionSummaryParameterMatcher)init;
@end

@implementation SUIBIntelligenceFlowActionSummaryParameterMatcher

+ (id)matchesIn:(id)a3
{
  uint64_t v3 = sub_25DDACA70();
  static IntelligenceFlowActionSummaryParameterMatcher.matches(in:)(v3, v4);
  swift_bridgeObjectRelease();
  type metadata accessor for BridgedMatch();
  v5 = (void *)sub_25DDACAB0();
  swift_bridgeObjectRelease();
  return v5;
}

- (SUIBIntelligenceFlowActionSummaryParameterMatcher)init
{
  return (SUIBIntelligenceFlowActionSummaryParameterMatcher *)IntelligenceFlowActionSummaryParameterMatcher.init()();
}

@end