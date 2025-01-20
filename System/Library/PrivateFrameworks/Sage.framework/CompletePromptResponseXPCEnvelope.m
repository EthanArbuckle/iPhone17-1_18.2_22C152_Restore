@interface CompletePromptResponseXPCEnvelope
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSData)_completion;
- (_TtC4Sage33CompletePromptResponseXPCEnvelope)init;
- (_TtC4Sage33CompletePromptResponseXPCEnvelope)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)set_completion:(id)a3;
@end

@implementation CompletePromptResponseXPCEnvelope

- (NSData)_completion
{
  return (NSData *)sub_25B97457C((uint64_t)self, (uint64_t)a2, sub_25B9745DC);
}

- (void)set_completion:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return static CompletePromptResponseXPCEnvelope.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (_TtC4Sage33CompletePromptResponseXPCEnvelope)initWithCoder:(id)a3
{
  return (_TtC4Sage33CompletePromptResponseXPCEnvelope *)CompletePromptResponseXPCEnvelope.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  CompletePromptResponseXPCEnvelope.encode(with:)((NSCoder)v4);
}

- (_TtC4Sage33CompletePromptResponseXPCEnvelope)init
{
}

- (void).cxx_destruct
{
}

@end