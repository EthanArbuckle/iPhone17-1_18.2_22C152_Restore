@interface PKAddCarKeyPassConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)onlineServicesActivated;
- (BOOL)ownerKeyPairingAvailable;
- (BOOL)passwordEnteredManually;
- (BOOL)proofOfOwnershipPresent;
- (NSString)manufacturerIdentifier;
- (NSString)pairedReaderIdentifier;
- (NSString)password;
- (NSString)productPlanIdentifier;
- (NSString)provisioningTemplateIdentifier;
- (NSString)vehicleName;
- (PKAddCarKeyPassConfiguration)init;
- (PKAddCarKeyPassConfiguration)initWithCoder:(id)a3;
- (PKRadioTechnology)supportedRadioTechnologies;
- (id)description;
- (id)vehicleInitiatedPairingLaunchURL;
- (unint64_t)referralSource;
- (void)encodeWithCoder:(id)a3;
- (void)setManufacturerIdentifier:(NSString *)manufacturerIdentifier;
- (void)setOnlineServicesActivated:(BOOL)a3;
- (void)setOwnerKeyPairingAvailable:(BOOL)a3;
- (void)setPairedReaderIdentifier:(id)a3;
- (void)setPassword:(NSString *)password;
- (void)setPasswordEnteredManually:(BOOL)a3;
- (void)setProductPlanIdentifier:(id)a3;
- (void)setProofOfOwnershipPresent:(BOOL)a3;
- (void)setProvisioningTemplateIdentifier:(NSString *)provisioningTemplateIdentifier;
- (void)setReferralSource:(unint64_t)a3;
- (void)setSupportedRadioTechnologies:(PKRadioTechnology)supportedRadioTechnologies;
- (void)setVehicleName:(id)a3;
@end

@implementation PKAddCarKeyPassConfiguration

- (PKAddCarKeyPassConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKAddCarKeyPassConfiguration;
  v2 = [(PKAddSecureElementPassConfiguration *)&v6 initWithType:1];
  v3 = v2;
  if (v2)
  {
    password = v2->_password;
    v2->_password = (NSString *)&stru_1EE0F5368;
  }
  return v3;
}

- (id)vehicleInitiatedPairingLaunchURL
{
  v3 = [(PKAddSecureElementPassConfiguration *)self issuerIdentifier];
  v4 = PKVehicleInitiatedPairingLaunchURL(v3, self->_supportedRadioTechnologies, self->_provisioningTemplateIdentifier, self->_referralSource);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKAddCarKeyPassConfiguration;
  id v4 = a3;
  [(PKAddSecureElementPassConfiguration *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_password, @"password", v6.receiver, v6.super_class);
  v5 = PKSubcredentialPairingReferralSourceToString(self->_referralSource);
  [v4 encodeObject:v5 forKey:@"referralSource"];

  [v4 encodeInteger:self->_supportedRadioTechnologies forKey:@"supportedRadioTechnologies"];
  [v4 encodeObject:self->_provisioningTemplateIdentifier forKey:@"provisioningTemplateIdentifier"];
  [v4 encodeObject:self->_manufacturerIdentifier forKey:@"manufacturerIdentifier"];
  [v4 encodeObject:self->_pairedReaderIdentifier forKey:@"pairedReaderIdentifier"];
  [v4 encodeObject:self->_productPlanIdentifier forKey:@"productPlanIdentifier"];
  [v4 encodeObject:self->_vehicleName forKey:@"vehicleName"];
  [v4 encodeBool:self->_ownerKeyPairingAvailable forKey:@"ownerKeyPairingAvailable"];
  [v4 encodeBool:self->_proofOfOwnershipPresent forKey:@"proofOfOwnershipPresent"];
  [v4 encodeBool:self->_onlineServicesActivated forKey:@"onlineServicesActivated"];
  [v4 encodeBool:self->_passwordEnteredManually forKey:@"passwordEnteredManually"];
}

- (PKAddCarKeyPassConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKAddCarKeyPassConfiguration;
  v5 = [(PKAddSecureElementPassConfiguration *)&v20 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"password"];
    password = v5->_password;
    v5->_password = (NSString *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referralSource"];
    v5->_referralSource = PKSubcredentialPairingReferralSourceFromString(v8);

    v5->_supportedRadioTechnologies = [v4 decodeIntegerForKey:@"supportedRadioTechnologies"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"provisioningTemplateIdentifier"];
    provisioningTemplateIdentifier = v5->_provisioningTemplateIdentifier;
    v5->_provisioningTemplateIdentifier = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manufacturerIdentifier"];
    manufacturerIdentifier = v5->_manufacturerIdentifier;
    v5->_manufacturerIdentifier = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pairedReaderIdentifier"];
    pairedReaderIdentifier = v5->_pairedReaderIdentifier;
    v5->_pairedReaderIdentifier = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productPlanIdentifier"];
    productPlanIdentifier = v5->_productPlanIdentifier;
    v5->_productPlanIdentifier = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vehicleName"];
    vehicleName = v5->_vehicleName;
    v5->_vehicleName = (NSString *)v17;

    v5->_ownerKeyPairingAvailable = [v4 decodeBoolForKey:@"ownerKeyPairingAvailable"];
    v5->_proofOfOwnershipPresent = [v4 decodeBoolForKey:@"proofOfOwnershipPresent"];
    v5->_onlineServicesActivated = [v4 decodeBoolForKey:@"onlineServicesActivated"];
    v5->_passwordEnteredManually = [v4 decodeBoolForKey:@"passwordEnteredManually"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"manufacturerIdentifier: '%@'; ", self->_manufacturerIdentifier];
  id v4 = [(PKAddSecureElementPassConfiguration *)self issuerIdentifier];
  [v3 appendFormat:@"issuerIdentifier: '%@'; ", v4];

  objc_msgSend(v3, "appendFormat:", @"provisioningTemplateIdentifier: '%@'; ",
    self->_provisioningTemplateIdentifier);
  [v3 appendFormat:@"pairedReaderIdentifier: '%@'; ", self->_pairedReaderIdentifier];
  [v3 appendFormat:@"productPlanIdentifier: '%@'; ", self->_productPlanIdentifier];
  [v3 appendFormat:@"vehicleName: '%@'; ", self->_vehicleName];
  if ([(NSString *)self->_password length]) {
    v5 = @"Yes";
  }
  else {
    v5 = @"No";
  }
  [v3 appendFormat:@"hasPassword: '%@'; ", v5];
  if (self->_passwordEnteredManually) {
    uint64_t v6 = @"Yes";
  }
  else {
    uint64_t v6 = @"No";
  }
  [v3 appendFormat:@"passwordEnteredManually: '%@'; ", v6];
  [v3 appendFormat:@">"];
  return v3;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(NSString *)password
{
}

- (PKRadioTechnology)supportedRadioTechnologies
{
  return self->_supportedRadioTechnologies;
}

- (void)setSupportedRadioTechnologies:(PKRadioTechnology)supportedRadioTechnologies
{
  self->_supportedRadioTechnologies = supportedRadioTechnologies;
}

- (NSString)manufacturerIdentifier
{
  return self->_manufacturerIdentifier;
}

- (void)setManufacturerIdentifier:(NSString *)manufacturerIdentifier
{
}

- (NSString)provisioningTemplateIdentifier
{
  return self->_provisioningTemplateIdentifier;
}

- (void)setProvisioningTemplateIdentifier:(NSString *)provisioningTemplateIdentifier
{
}

- (unint64_t)referralSource
{
  return self->_referralSource;
}

- (void)setReferralSource:(unint64_t)a3
{
  self->_referralSource = a3;
}

- (NSString)pairedReaderIdentifier
{
  return self->_pairedReaderIdentifier;
}

- (void)setPairedReaderIdentifier:(id)a3
{
}

- (NSString)productPlanIdentifier
{
  return self->_productPlanIdentifier;
}

- (void)setProductPlanIdentifier:(id)a3
{
}

- (NSString)vehicleName
{
  return self->_vehicleName;
}

- (void)setVehicleName:(id)a3
{
}

- (BOOL)ownerKeyPairingAvailable
{
  return self->_ownerKeyPairingAvailable;
}

- (void)setOwnerKeyPairingAvailable:(BOOL)a3
{
  self->_ownerKeyPairingAvailable = a3;
}

- (BOOL)proofOfOwnershipPresent
{
  return self->_proofOfOwnershipPresent;
}

- (void)setProofOfOwnershipPresent:(BOOL)a3
{
  self->_proofOfOwnershipPresent = a3;
}

- (BOOL)onlineServicesActivated
{
  return self->_onlineServicesActivated;
}

- (void)setOnlineServicesActivated:(BOOL)a3
{
  self->_onlineServicesActivated = a3;
}

- (BOOL)passwordEnteredManually
{
  return self->_passwordEnteredManually;
}

- (void)setPasswordEnteredManually:(BOOL)a3
{
  self->_passwordEnteredManually = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleName, 0);
  objc_storeStrong((id *)&self->_productPlanIdentifier, 0);
  objc_storeStrong((id *)&self->_pairedReaderIdentifier, 0);
  objc_storeStrong((id *)&self->_provisioningTemplateIdentifier, 0);
  objc_storeStrong((id *)&self->_manufacturerIdentifier, 0);
  objc_storeStrong((id *)&self->_password, 0);
}

@end