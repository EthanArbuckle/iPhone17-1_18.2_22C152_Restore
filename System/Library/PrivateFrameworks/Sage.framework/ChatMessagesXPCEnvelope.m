@interface ChatMessagesXPCEnvelope
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSData)_messages;
- (_TtC4Sage23ChatMessagesXPCEnvelope)init;
- (_TtC4Sage23ChatMessagesXPCEnvelope)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ChatMessagesXPCEnvelope

- (NSData)_messages
{
  return (NSData *)sub_25B971150((uint64_t)self, (uint64_t)a2, sub_25B970C30);
}

+ (BOOL)supportsSecureCoding
{
  return static ChatMessagesXPCEnvelope.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (_TtC4Sage23ChatMessagesXPCEnvelope)initWithCoder:(id)a3
{
  return (_TtC4Sage23ChatMessagesXPCEnvelope *)ChatMessagesXPCEnvelope.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  ChatMessagesXPCEnvelope.encode(with:)((NSCoder)v4);
}

- (_TtC4Sage23ChatMessagesXPCEnvelope)init
{
}

- (void).cxx_destruct
{
}

@end