@interface CompletePromptResponseElementXPCEnvelope
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSData)_event;
- (_TtC4Sage40CompletePromptResponseElementXPCEnvelope)init;
- (_TtC4Sage40CompletePromptResponseElementXPCEnvelope)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)set_event:(id)a3;
@end

@implementation CompletePromptResponseElementXPCEnvelope

- (NSData)_event
{
  return (NSData *)sub_25B97457C((uint64_t)self, (uint64_t)a2, sub_25B974088);
}

- (void)set_event:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return static CompletePromptResponseElementXPCEnvelope.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (_TtC4Sage40CompletePromptResponseElementXPCEnvelope)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC4Sage40CompletePromptResponseElementXPCEnvelope *)CompletePromptResponseElementXPCEnvelope.init(coder:)(v3, v4, v5);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  CompletePromptResponseElementXPCEnvelope.encode(with:)((NSCoder)v4);
}

- (_TtC4Sage40CompletePromptResponseElementXPCEnvelope)init
{
}

- (void).cxx_destruct
{
}

@end