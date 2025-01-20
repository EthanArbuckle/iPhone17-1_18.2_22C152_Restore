@interface STAirPlayStatusDomainUserInteraction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
@end

@implementation STAirPlayStatusDomainUserInteraction

- (BOOL)isEqual:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F4F738];
  id v4 = a3;
  v5 = [v3 builderWithObject:v4 ofExpectedClass:objc_opt_class()];

  char v6 = [v5 isEqual];
  return v6;
}

- (unint64_t)hash
{
  v2 = [MEMORY[0x1E4F4F758] builder];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)description
{
  return (NSString *)[(STAirPlayStatusDomainUserInteraction *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(STAirPlayStatusDomainUserInteraction *)self succinctDescriptionBuilder];
  unint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  unint64_t v3 = [(STAirPlayStatusDomainUserInteraction *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  unint64_t v3 = -[STAirPlayStatusDomainUserInteraction _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  id v4 = [v3 build];

  return v4;
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  id v3 = a1;
  if (a1)
  {
    id v5 = a2;
    id v3 = [v3 succinctDescriptionBuilder];
    [v3 setUseDebugDescription:a3];
    [v3 setActiveMultilinePrefix:v5];
  }

  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STAirPlayStatusDomainUserInteraction _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end