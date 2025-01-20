@interface SKRConversationCommitResult
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (SKRConversationCommitResult)init;
- (SKRConversationCommitResult)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKRConversationCommitResult

- (SKRConversationCommitResult)initWithCoder:(id)a3
{
  return (SKRConversationCommitResult *)ConversationCommitResultXPC.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  outlined consume of Data?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SKRConversationCommitResult_nextPluginActionData), *(void *)&self->type[OBJC_IVAR___SKRConversationCommitResult_nextPluginActionData]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

+ (BOOL)supportsSecureCoding
{
  return static ConversationCommitResultXPC.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static ConversationCommitResultXPC.supportsSecureCoding = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationCommitResultXPC.encode(with:)((NSCoder)v4);
}

- (SKRConversationCommitResult)init
{
  result = (SKRConversationCommitResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end