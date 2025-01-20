@interface PKProvisioningContinuityDiscoveryRequestMessage
+ (BOOL)supportsSecureCoding;
- (BOOL)configureWithContent:(id)a3;
- (BOOL)isEqual:(id)a3;
- (PKContinuityProximityAdvertisement)advertisement;
- (PKProvisioningContinuityDiscoveryRequestMessage)initWithContinuityType:(unint64_t)a3 advertisement:(id)a4;
- (id)description;
- (unint64_t)continuityType;
@end

@implementation PKProvisioningContinuityDiscoveryRequestMessage

- (PKProvisioningContinuityDiscoveryRequestMessage)initWithContinuityType:(unint64_t)a3 advertisement:(id)a4
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v6 = @"carKey";
  if (a3 != 1) {
    v6 = 0;
  }
  v13[0] = @"continuityType";
  v13[1] = @"advertisement";
  v14[0] = v6;
  v7 = v6;
  v8 = [a4 dictionaryRepresentation];
  v14[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  v12.receiver = self;
  v12.super_class = (Class)PKProvisioningContinuityDiscoveryRequestMessage;
  v10 = [(PKSharingGenericMessage *)&v12 initWithFormat:3 type:2001 genericSharingDict:MEMORY[0x1E4F1CC08] appleSharingDict:v9];

  return v10;
}

- (BOOL)configureWithContent:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKProvisioningContinuityDiscoveryRequestMessage;
  if ([(PKSharingGenericMessage *)&v13 configureWithContent:v4])
  {
    v5 = [v4 PKDictionaryForKey:@"apple"];
    v6 = [v5 PKStringForKey:@"continuityType"];
    self->_unint64_t continuityType = PKProvisioningContinuityDiscoveryRequestTypeFromString(v6);

    unint64_t continuityType = self->_continuityType;
    BOOL v8 = continuityType != 0;
    if (continuityType)
    {
      v9 = [v5 PKDictionaryForKey:@"advertisement"];
      v10 = +[PKContinuityProximityAdvertisement advertisementWithDictionary:v9];
      advertisement = self->_advertisement;
      self->_advertisement = v10;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = [(PKSharingMessage *)self identifier];
  [v3 appendFormat:@"identifier: '%@'; ", v4];

  v5 = PKSharingMessageTypeToString([(PKSharingMessage *)self type]);
  [v3 appendFormat:@"type: '%@'; ", v5];

  if (self->_continuityType == 1) {
    v6 = @"carKey";
  }
  else {
    v6 = 0;
  }
  [v3 appendFormat:@"continuityType: '%@'; ", v6];
  [v3 appendFormat:@"advertisement: '%@'; ", self->_advertisement];
  [v3 appendFormat:@">"];
  v7 = (void *)[v3 copy];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKProvisioningContinuityDiscoveryRequestMessage *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (self)
    {
      v10.receiver = self;
      v10.super_class = (Class)PKProvisioningContinuityDiscoveryRequestMessage;
      if ([(PKSharingGenericMessage *)&v10 isEqual:v6] && self->_continuityType == v6->_continuityType)
      {
        advertisement = self->_advertisement;
        BOOL v8 = v6->_advertisement;
        if (advertisement && v8) {
          LOBYTE(self) = -[PKContinuityProximityAdvertisement isEqual:](advertisement, "isEqual:");
        }
        else {
          LOBYTE(self) = advertisement == v8;
        }
      }
      else
      {
        LOBYTE(self) = 0;
      }
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

- (unint64_t)continuityType
{
  return self->_continuityType;
}

- (PKContinuityProximityAdvertisement)advertisement
{
  return self->_advertisement;
}

- (void).cxx_destruct
{
}

@end