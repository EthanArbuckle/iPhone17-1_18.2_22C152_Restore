@interface MOFeedbackAssistant
+ (void)triggerFeedbackAssistantFlowWithFlowIdentifier:(id)a3;
- (_TtC8momentsd19MOFeedbackAssistant)init;
@end

@implementation MOFeedbackAssistant

+ (void)triggerFeedbackAssistantFlowWithFlowIdentifier:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;
  swift_getObjCClassMetadata();
  static MOFeedbackAssistant.triggerFeedbackAssistantFlow(flowIdentifier:)(v3, v5);

  swift_bridgeObjectRelease();
}

- (_TtC8momentsd19MOFeedbackAssistant)init
{
  return (_TtC8momentsd19MOFeedbackAssistant *)@objc MOFeedbackAssistantLogger.init()(self, (uint64_t)a2, type metadata accessor for MOFeedbackAssistant);
}

@end