@interface PKAuxiliaryCapabilityUnregisteredRequirements
- (NSArray)requirementIdentifiers;
- (NSString)dpanIdentifier;
- (PKAuxiliaryCapabilityUnregisteredRequirements)initWithDictionary:(id)a3;
@end

@implementation PKAuxiliaryCapabilityUnregisteredRequirements

- (PKAuxiliaryCapabilityUnregisteredRequirements)initWithDictionary:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [v4 PKStringForKey:@"dpanIdentifier"];
    v6 = [v4 PKArrayContaining:objc_opt_class() forKey:@"requirementIdentifiers"];

    v7 = 0;
    if (v5 && v6)
    {
      v11.receiver = self;
      v11.super_class = (Class)PKAuxiliaryCapabilityUnregisteredRequirements;
      v8 = [(PKAuxiliaryCapabilityUnregisteredRequirements *)&v11 init];
      p_isa = (id *)&v8->super.isa;
      if (v8)
      {
        objc_storeStrong((id *)&v8->_dpanIdentifier, v5);
        objc_storeStrong(p_isa + 2, v6);
      }
      self = p_isa;
      v7 = self;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (NSArray)requirementIdentifiers
{
  return self->_requirementIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requirementIdentifiers, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
}

@end