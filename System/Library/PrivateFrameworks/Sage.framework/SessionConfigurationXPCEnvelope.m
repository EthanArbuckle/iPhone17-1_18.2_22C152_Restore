@interface SessionConfigurationXPCEnvelope
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSData)_configuration;
- (_TtC4Sage31SessionConfigurationXPCEnvelope)init;
- (_TtC4Sage31SessionConfigurationXPCEnvelope)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)set_configuration:(id)a3;
@end

@implementation SessionConfigurationXPCEnvelope

- (NSData)_configuration
{
  return (NSData *)sub_25B97457C((uint64_t)self, (uint64_t)a2, sub_25B97387C);
}

- (void)set_configuration:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return static SessionConfigurationXPCEnvelope.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (_TtC4Sage31SessionConfigurationXPCEnvelope)initWithCoder:(id)a3
{
  return (_TtC4Sage31SessionConfigurationXPCEnvelope *)SessionConfigurationXPCEnvelope.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  SessionConfigurationXPCEnvelope.encode(with:)((NSCoder)v4);
}

- (_TtC4Sage31SessionConfigurationXPCEnvelope)init
{
}

- (void).cxx_destruct
{
}

@end