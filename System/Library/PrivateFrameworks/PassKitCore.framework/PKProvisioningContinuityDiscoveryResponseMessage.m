@interface PKProvisioningContinuityDiscoveryResponseMessage
+ (BOOL)supportsSecureCoding;
- (BOOL)configureWithContent:(id)a3;
- (BOOL)isEqual:(id)a3;
- (PKContinuityProximityVerification)proximityVerification;
- (PKProvisioningContinuityDiscoveryResponseMessage)init;
- (PKProvisioningContinuityDiscoveryResponseMessage)initWithProximityVerification:(id)a3;
- (id)description;
@end

@implementation PKProvisioningContinuityDiscoveryResponseMessage

- (PKProvisioningContinuityDiscoveryResponseMessage)init
{
  return [(PKProvisioningContinuityDiscoveryResponseMessage *)self initWithProximityVerification:0];
}

- (PKProvisioningContinuityDiscoveryResponseMessage)initWithProximityVerification:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = [v5 dictionaryRepresentation];

  [v6 setObject:v7 forKeyedSubscript:@"proximityVerification"];
  v10.receiver = self;
  v10.super_class = (Class)PKProvisioningContinuityDiscoveryResponseMessage;
  v8 = [(PKSharingGenericMessage *)&v10 initWithFormat:3 type:2002 genericSharingDict:MEMORY[0x1E4F1CC08] appleSharingDict:v6];

  return v8;
}

- (BOOL)configureWithContent:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKProvisioningContinuityDiscoveryResponseMessage;
  BOOL v5 = [(PKSharingGenericMessage *)&v11 configureWithContent:v4];
  if (v5)
  {
    id v6 = [v4 PKDictionaryForKey:@"apple"];
    v7 = [v6 PKDictionaryForKey:@"proximityVerification"];
    if (v7)
    {
      v8 = +[PKContinuityProximityVerification verificationWithDictionary:v7];
      proximityVerification = self->_proximityVerification;
      self->_proximityVerification = v8;
    }
  }

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = [(PKSharingMessage *)self identifier];
  [v3 appendFormat:@"identifier: '%@'; ", v4];

  [v3 appendFormat:@"proximityVerification: '%@'; ", self->_proximityVerification];
  BOOL v5 = PKSharingMessageTypeToString([(PKSharingMessage *)self type]);
  [v3 appendFormat:@"type: '%@'; ", v5];

  [v3 appendFormat:@">"];
  id v6 = (void *)[v3 copy];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKProvisioningContinuityDiscoveryResponseMessage *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (self)
    {
      v7.receiver = self;
      v7.super_class = (Class)PKProvisioningContinuityDiscoveryResponseMessage;
      LOBYTE(self) = [(PKSharingGenericMessage *)&v7 isEqual:v5];
    }
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKContinuityProximityVerification)proximityVerification
{
  return self->_proximityVerification;
}

- (void).cxx_destruct
{
}

@end