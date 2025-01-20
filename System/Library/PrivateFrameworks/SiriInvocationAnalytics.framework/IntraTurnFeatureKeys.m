@interface IntraTurnFeatureKeys
+ (NSString)UEI_CAT_ID_KEY;
+ (NSString)UEI_CAT_ID_SEQUENCE_KEY;
+ (NSString)UEI_HAS_PUNCHOUT;
+ (NSString)UEI_PUNCHOUT_APP;
+ (NSString)UEI_PUNCHOUT_UI;
+ (NSString)UEI_REQUEST_STATUS;
+ (NSString)VALID_ASSISTANT_TURN_KEY;
+ (NSString)VALID_DICTATION_TURN_KEY;
+ (NSString)VALID_TURN_ANNOUNCE_TURN;
+ (NSString)VALID_TURN_ASR_CANCELLED;
+ (NSString)VALID_TURN_CONTAINS_UUFR;
+ (NSString)VALID_TURN_DICTATION_PRODUCT_KEY;
+ (NSString)VALID_TURN_DICTATION_SUCCESS_KEY;
+ (NSString)VALID_TURN_IS_INTERACTIVE_SNIPPET_TURN;
+ (NSString)VALID_TURN_IS_SIRI_TRIGGERLESS;
+ (NSString)VALID_TURN_ORCH_ENDED;
+ (NSString)VALID_TURN_ORCH_REQUEST_CANCELLED_MITIGATED;
+ (NSString)VALID_TURN_PUNCH_OUT;
+ (NSString)VALID_TURN_UEI_REQUEST_STATUS_FAILED;
- (_TtC23SiriInvocationAnalytics20IntraTurnFeatureKeys)init;
@end

@implementation IntraTurnFeatureKeys

+ (NSString)UEI_REQUEST_STATUS
{
  return (NSString *)OUTLINED_FUNCTION_1_11((uint64_t)a1, (uint64_t)a2, (void (*)(void))static IntraTurnFeatureKeys.UEI_REQUEST_STATUS.getter);
}

+ (NSString)UEI_CAT_ID_KEY
{
  v2 = (void *)sub_25CA45978();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSString)UEI_HAS_PUNCHOUT
{
  v2 = (void *)sub_25CA45978();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSString)UEI_PUNCHOUT_APP
{
  v2 = (void *)sub_25CA45978();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSString)UEI_PUNCHOUT_UI
{
  v2 = (void *)sub_25CA45978();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSString)UEI_CAT_ID_SEQUENCE_KEY
{
  v2 = (void *)sub_25CA45978();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSString)VALID_DICTATION_TURN_KEY
{
  return (NSString *)OUTLINED_FUNCTION_1_11((uint64_t)a1, (uint64_t)a2, (void (*)(void))static IntraTurnFeatureKeys.VALID_DICTATION_TURN_KEY.getter);
}

+ (NSString)VALID_TURN_DICTATION_PRODUCT_KEY
{
  return (NSString *)OUTLINED_FUNCTION_1_11((uint64_t)a1, (uint64_t)a2, (void (*)(void))static IntraTurnFeatureKeys.VALID_TURN_DICTATION_PRODUCT_KEY.getter);
}

+ (NSString)VALID_TURN_DICTATION_SUCCESS_KEY
{
  return (NSString *)OUTLINED_FUNCTION_1_11((uint64_t)a1, (uint64_t)a2, (void (*)(void))static IntraTurnFeatureKeys.VALID_TURN_DICTATION_SUCCESS_KEY.getter);
}

+ (NSString)VALID_ASSISTANT_TURN_KEY
{
  return (NSString *)OUTLINED_FUNCTION_1_11((uint64_t)a1, (uint64_t)a2, (void (*)(void))static IntraTurnFeatureKeys.VALID_ASSISTANT_TURN_KEY.getter);
}

+ (NSString)VALID_TURN_CONTAINS_UUFR
{
  return (NSString *)OUTLINED_FUNCTION_1_11((uint64_t)a1, (uint64_t)a2, (void (*)(void))static IntraTurnFeatureKeys.VALID_TURN_CONTAINS_UUFR.getter);
}

+ (NSString)VALID_TURN_ORCH_ENDED
{
  return (NSString *)OUTLINED_FUNCTION_1_11((uint64_t)a1, (uint64_t)a2, (void (*)(void))static IntraTurnFeatureKeys.VALID_TURN_ORCH_ENDED.getter);
}

+ (NSString)VALID_TURN_PUNCH_OUT
{
  return (NSString *)OUTLINED_FUNCTION_1_11((uint64_t)a1, (uint64_t)a2, (void (*)(void))static IntraTurnFeatureKeys.VALID_TURN_PUNCH_OUT.getter);
}

+ (NSString)VALID_TURN_IS_INTERACTIVE_SNIPPET_TURN
{
  return (NSString *)OUTLINED_FUNCTION_1_11((uint64_t)a1, (uint64_t)a2, (void (*)(void))static IntraTurnFeatureKeys.VALID_TURN_IS_INTERACTIVE_SNIPPET_TURN.getter);
}

+ (NSString)VALID_TURN_IS_SIRI_TRIGGERLESS
{
  return (NSString *)OUTLINED_FUNCTION_1_11((uint64_t)a1, (uint64_t)a2, (void (*)(void))static IntraTurnFeatureKeys.VALID_TURN_IS_SIRI_TRIGGERLESS.getter);
}

+ (NSString)VALID_TURN_UEI_REQUEST_STATUS_FAILED
{
  return (NSString *)OUTLINED_FUNCTION_1_11((uint64_t)a1, (uint64_t)a2, (void (*)(void))static IntraTurnFeatureKeys.VALID_TURN_UEI_REQUEST_STATUS_FAILED.getter);
}

+ (NSString)VALID_TURN_ORCH_REQUEST_CANCELLED_MITIGATED
{
  return (NSString *)OUTLINED_FUNCTION_1_11((uint64_t)a1, (uint64_t)a2, (void (*)(void))static IntraTurnFeatureKeys.VALID_TURN_ORCH_REQUEST_CANCELLED_MITIGATED.getter);
}

+ (NSString)VALID_TURN_ASR_CANCELLED
{
  return (NSString *)OUTLINED_FUNCTION_1_11((uint64_t)a1, (uint64_t)a2, (void (*)(void))static IntraTurnFeatureKeys.VALID_TURN_ASR_CANCELLED.getter);
}

+ (NSString)VALID_TURN_ANNOUNCE_TURN
{
  return (NSString *)OUTLINED_FUNCTION_1_11((uint64_t)a1, (uint64_t)a2, (void (*)(void))static IntraTurnFeatureKeys.VALID_TURN_ANNOUNCE_TURN.getter);
}

- (_TtC23SiriInvocationAnalytics20IntraTurnFeatureKeys)init
{
  return (_TtC23SiriInvocationAnalytics20IntraTurnFeatureKeys *)IntraTurnFeatureKeys.init()();
}

@end