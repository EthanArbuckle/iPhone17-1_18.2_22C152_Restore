@interface ConversationCanHandleResult
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC14SiriKitRuntime27ConversationCanHandleResult)init;
- (_TtC14SiriKitRuntime27ConversationCanHandleResult)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ConversationCanHandleResult

- (_TtC14SiriKitRuntime27ConversationCanHandleResult)initWithCoder:(id)a3
{
  return (_TtC14SiriKitRuntime27ConversationCanHandleResult *)ConversationCanHandleResult.init(coder:)(a3);
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return static ConversationCanHandleResult.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static ConversationCanHandleResult.supportsSecureCoding = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationCanHandleResult.encode(with:)((NSCoder)v4);
}

- (_TtC14SiriKitRuntime27ConversationCanHandleResult)init
{
  result = (_TtC14SiriKitRuntime27ConversationCanHandleResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end