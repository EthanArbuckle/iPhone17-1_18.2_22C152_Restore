@interface ConversationParaphraseResultXPC
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC14SiriKitRuntime31ConversationParaphraseResultXPC)init;
- (_TtC14SiriKitRuntime31ConversationParaphraseResultXPC)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ConversationParaphraseResultXPC

+ (BOOL)supportsSecureCoding
{
  return static ConversationParaphraseResultXPC.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static ConversationParaphraseResultXPC.supportsSecureCoding = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationParaphraseResultXPC.encode(with:)((NSCoder)v4);
}

- (_TtC14SiriKitRuntime31ConversationParaphraseResultXPC)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC14SiriKitRuntime31ConversationParaphraseResultXPC *)specialized ConversationParaphraseResultXPC.init(coder:)(v3);

  return v4;
}

- (_TtC14SiriKitRuntime31ConversationParaphraseResultXPC)init
{
  result = (_TtC14SiriKitRuntime31ConversationParaphraseResultXPC *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of ActionParaphrase?((uint64_t)self + OBJC_IVAR____TtC14SiriKitRuntime31ConversationParaphraseResultXPC_paraphrase);

  swift_bridgeObjectRelease();
}

@end