@interface PKSEConsistencyCheckDeviceCredentialISO18013Properties
- (BOOL)hasKeyMeterial;
- (NSString)isoIdentifier;
- (PKSEConsistencyCheckDeviceCredentialISO18013Properties)init;
- (id)description;
@end

@implementation PKSEConsistencyCheckDeviceCredentialISO18013Properties

- (PKSEConsistencyCheckDeviceCredentialISO18013Properties)init
{
  return 0;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  v4 = v3;
  if (self->_hasKeyMeterial) {
    v5 = @"Y";
  }
  else {
    v5 = @"N";
  }
  [v3 appendFormat:@"hasKeyMaterial: '%@'; ", v5];
  [v4 appendFormat:@"isoIdentifier: '%@'; ", self->_isoIdentifier];
  [v4 appendFormat:@">"];
  return v4;
}

- (BOOL)hasKeyMeterial
{
  return self->_hasKeyMeterial;
}

- (NSString)isoIdentifier
{
  return self->_isoIdentifier;
}

- (void).cxx_destruct
{
}

@end