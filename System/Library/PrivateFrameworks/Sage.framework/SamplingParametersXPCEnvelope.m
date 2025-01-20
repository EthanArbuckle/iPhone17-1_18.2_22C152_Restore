@interface SamplingParametersXPCEnvelope
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSData)_parameters;
- (_TtC4Sage29SamplingParametersXPCEnvelope)init;
- (_TtC4Sage29SamplingParametersXPCEnvelope)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SamplingParametersXPCEnvelope

- (NSData)_parameters
{
  return (NSData *)sub_25B97457C((uint64_t)self, (uint64_t)a2, sub_25B972200);
}

+ (BOOL)supportsSecureCoding
{
  return static SamplingParametersXPCEnvelope.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (_TtC4Sage29SamplingParametersXPCEnvelope)initWithCoder:(id)a3
{
  return (_TtC4Sage29SamplingParametersXPCEnvelope *)SamplingParametersXPCEnvelope.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  SamplingParametersXPCEnvelope.encode(with:)((NSCoder)v4);
}

- (_TtC4Sage29SamplingParametersXPCEnvelope)init
{
}

- (void).cxx_destruct
{
}

@end