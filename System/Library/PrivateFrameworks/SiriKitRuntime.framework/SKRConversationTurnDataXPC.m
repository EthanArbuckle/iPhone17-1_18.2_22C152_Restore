@interface SKRConversationTurnDataXPC
+ (BOOL)supportsSecureCoding;
- (SKRConversationTurnDataXPC)init;
- (SKRConversationTurnDataXPC)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKRConversationTurnDataXPC

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationTurnDataXPC.encode(with:)((NSCoder)v4);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SKRConversationTurnDataXPC_proxiedRequestContext);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKRConversationTurnDataXPC)initWithCoder:(id)a3
{
  return (SKRConversationTurnDataXPC *)ConversationTurnDataXPC.init(coder:)(a3);
}

- (SKRConversationTurnDataXPC)init
{
  result = (SKRConversationTurnDataXPC *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end