@interface RemoteConversationSpeechData
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC14SiriKitRuntime28RemoteConversationSpeechData)init;
- (_TtC14SiriKitRuntime28RemoteConversationSpeechData)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RemoteConversationSpeechData

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14SiriKitRuntime28RemoteConversationSpeechData_userSpecificInfoForRecognizedUser));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14SiriKitRuntime28RemoteConversationSpeechData_userSpecificInfoForUserMeetingSessionThreshold));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14SiriKitRuntime28RemoteConversationSpeechData_speechPackage));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of NLRoutingDecisionMessage.GenAIFallbackSuppressReason?((uint64_t)self + OBJC_IVAR____TtC14SiriKitRuntime28RemoteConversationSpeechData_genAIFallbackSuppressReason);
  v3 = (char *)self + OBJC_IVAR____TtC14SiriKitRuntime28RemoteConversationSpeechData_asrLocation;
  uint64_t v4 = type metadata accessor for ExecutionLocation();
  v6 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v6)((void *)(v4 - 8), v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC14SiriKitRuntime28RemoteConversationSpeechData_nlLocation;

  v6(v5, v4);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  RemoteConversationSpeechData.encode(with:)((NSCoder)v4);
}

+ (BOOL)supportsSecureCoding
{
  return static RemoteConversationSpeechData.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static RemoteConversationSpeechData.supportsSecureCoding = a3;
}

- (_TtC14SiriKitRuntime28RemoteConversationSpeechData)initWithCoder:(id)a3
{
  return (_TtC14SiriKitRuntime28RemoteConversationSpeechData *)RemoteConversationSpeechData.init(coder:)(a3);
}

- (_TtC14SiriKitRuntime28RemoteConversationSpeechData)init
{
  result = (_TtC14SiriKitRuntime28RemoteConversationSpeechData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end