@interface VBManagerViewBridge
+ (id)makeVBManagerViewControllerWithAuthenticationCallback:(id)a3;
- (VBManagerViewBridge)init;
@end

@implementation VBManagerViewBridge

+ (id)makeVBManagerViewControllerWithAuthenticationCallback:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  id v5 = _s26TextToSpeechVoiceBankingUI19VBManagerViewBridgeC04makegH10Controller22authenticationCallbackSo06UIViewK0Cy10Foundation4UUIDV_SStc_tFZ_0((uint64_t)sub_25F48F39C, v4);
  swift_release();

  return v5;
}

- (VBManagerViewBridge)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VBManagerViewBridge();
  return [(VBManagerViewBridge *)&v3 init];
}

@end