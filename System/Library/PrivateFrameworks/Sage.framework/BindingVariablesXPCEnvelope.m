@interface BindingVariablesXPCEnvelope
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSDictionary)_bindingVariables;
- (_TtC4Sage27BindingVariablesXPCEnvelope)init;
- (_TtC4Sage27BindingVariablesXPCEnvelope)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BindingVariablesXPCEnvelope

- (NSDictionary)_bindingVariables
{
  if (sub_25B971920())
  {
    v2 = (void *)sub_25B9ECF60();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSDictionary *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return static BindingVariablesXPCEnvelope.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (_TtC4Sage27BindingVariablesXPCEnvelope)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC4Sage27BindingVariablesXPCEnvelope *)BindingVariablesXPCEnvelope.init(coder:)();
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  BindingVariablesXPCEnvelope.encode(with:)((NSCoder)v4);
}

- (_TtC4Sage27BindingVariablesXPCEnvelope)init
{
}

- (void).cxx_destruct
{
}

@end