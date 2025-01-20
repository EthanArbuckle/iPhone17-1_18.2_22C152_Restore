@interface SKRConversationFlexibleExecutionSupport
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (SKRConversationFlexibleExecutionSupport)init;
- (SKRConversationFlexibleExecutionSupport)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKRConversationFlexibleExecutionSupport

- (SKRConversationFlexibleExecutionSupport)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)MEMORY[0x1BA9E2DD0](0x6E6F6974706FLL, 0xE600000000000000);
  v7 = (objc_class *)objc_msgSend(v4, sel_decodeIntegerForKey_, v6);

  *(Class *)((char *)&v5->super.isa + OBJC_IVAR___SKRConversationFlexibleExecutionSupport_rawValue) = v7;
  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for ConversationFlexibleExecutionSupportXPC();
  v8 = [(SKRConversationFlexibleExecutionSupport *)&v10 init];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return static ConversationFlexibleExecutionSupportXPC.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static ConversationFlexibleExecutionSupportXPC.supportsSecureCoding = a3;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SKRConversationFlexibleExecutionSupport_rawValue);
  id v5 = a3;
  v6 = self;
  id v7 = (id)MEMORY[0x1BA9E2DD0](0x6E6F6974706FLL, 0xE600000000000000);
  objc_msgSend(v5, sel_encodeInteger_forKey_, v4, v7);
}

- (SKRConversationFlexibleExecutionSupport)init
{
  result = (SKRConversationFlexibleExecutionSupport *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end