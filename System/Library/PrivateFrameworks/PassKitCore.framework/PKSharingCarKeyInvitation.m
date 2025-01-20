@interface PKSharingCarKeyInvitation
+ (BOOL)supportsSecureCoding;
+ (id)_activationOptionsFromDictionary:(id)a3;
+ (void)_mergeActivationOptions:(id)a3 intoDictionary:(id)a4;
- (BOOL)configureWithContent:(id)a3;
- (NSString)brandIdentifier;
- (NSString)partnerIdentifier;
- (NSString)readerIdentifier;
- (NSString)vehicleIssuer;
- (NSString)vehicleModel;
- (PKPassShareActivationOptions)activationOptions;
- (PKSharingCarKeyInvitation)initWithRawInvite:(id)a3 shareIdentifier:(id)a4 radioTechnology:(unint64_t)a5 vehicleModel:(id)a6 vehicleIssuer:(id)a7 readerIdentifier:(id)a8 partnerIdentifier:(id)a9 brandIdentifier:(id)a10 carKeySharingDict:(id)a11 proprietaryData:(id)a12 activationOptions:(id)a13 displayInformation:(id)a14;
- (PKSharingMesageProprietaryData)proprietaryData;
- (unint64_t)radioTechnology;
@end

@implementation PKSharingCarKeyInvitation

- (PKSharingCarKeyInvitation)initWithRawInvite:(id)a3 shareIdentifier:(id)a4 radioTechnology:(unint64_t)a5 vehicleModel:(id)a6 vehicleIssuer:(id)a7 readerIdentifier:(id)a8 partnerIdentifier:(id)a9 brandIdentifier:(id)a10 carKeySharingDict:(id)a11 proprietaryData:(id)a12 activationOptions:(id)a13 displayInformation:(id)a14
{
  v14 = self;
  v15 = 0;
  if (a3 && a4)
  {
    v41 = (objc_class *)MEMORY[0x1E4F1CA60];
    char v44 = a5;
    id v39 = a14;
    id v42 = a13;
    id v45 = a12;
    id v21 = a11;
    id v22 = a10;
    id v23 = a9;
    id v24 = a8;
    id v43 = a7;
    id v25 = a6;
    id v26 = a4;
    id v27 = a3;
    id v28 = objc_alloc_init(v41);
    v29 = [v27 hexEncoding];

    [v28 setObject:v29 forKeyedSubscript:@"sharingData"];
    [v28 setObject:v26 forKeyedSubscript:@"sharingId"];

    [v28 setObject:v25 forKeyedSubscript:@"model"];
    [v28 setObject:v22 forKeyedSubscript:@"brand"];
    [v28 setObject:v24 forKeyedSubscript:@"vehicleIdentifier"];
    +[PKSharingCarKeyInvitation _mergeActivationOptions:v42 intoDictionary:v28];

    v30 = (void *)[v21 mutableCopy];
    v31 = PKRadioTechnologiesToString(v44);
    [v30 setObject:v31 forKeyedSubscript:@"radioTechnologies"];

    [v30 setObject:v25 forKeyedSubscript:@"vehicleModel"];
    [v30 setObject:v43 forKeyedSubscript:@"vehicleIssuer"];

    [v30 setObject:v24 forKeyedSubscript:@"readerIdentifier"];
    [v30 setObject:v23 forKeyedSubscript:@"partnerIdentifier"];

    [v30 setObject:v22 forKeyedSubscript:@"brandIdentifier"];
    v32 = [v45 dictionaryRepresentation];

    v33 = (void *)[v32 mutableCopy];
    v34 = v33;
    if (v33) {
      id v35 = v33;
    }
    else {
      id v35 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    v36 = v35;

    [v36 setObject:v30 forKeyedSubscript:@"carKey"];
    v46.receiver = self;
    v46.super_class = (Class)PKSharingCarKeyInvitation;
    v37 = [(PKSharingGenericMessage *)&v46 initWithFormat:2 type:1 genericSharingDict:v28 appleSharingDict:v36 displayInformation:v39];

    v14 = v37;
    v15 = v14;
  }

  return v15;
}

- (BOOL)configureWithContent:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PKSharingCarKeyInvitation;
  BOOL v4 = [(PKSharingCarKeyMessage *)&v13 configureWithContent:a3];
  if (v4)
  {
    v5 = [PKSharingMesageProprietaryData alloc];
    v6 = [(PKSharingGenericMessage *)self appleSharingDict];
    v7 = [(PKSharingMesageProprietaryData *)v5 initWithDictionary:v6];
    proprietaryData = self->_proprietaryData;
    self->_proprietaryData = v7;

    v9 = [(PKSharingGenericMessage *)self genericSharingDict];
    v10 = +[PKSharingCarKeyInvitation _activationOptionsFromDictionary:v9];
    activationOptions = self->_activationOptions;
    self->_activationOptions = v10;
  }
  return v4;
}

- (unint64_t)radioTechnology
{
  v2 = [(PKSharingCarKeyMessage *)self carKeySharingDict];
  v3 = [v2 PKStringForKey:@"radioTechnologies"];

  unint64_t v4 = PKRadioTechnologiesFromString(v3);
  return v4;
}

- (NSString)vehicleModel
{
  v3 = [(PKSharingCarKeyMessage *)self carKeySharingDict];
  unint64_t v4 = [v3 PKStringForKey:@"vehicleModel"];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [(PKSharingGenericMessage *)self genericSharingDict];
    id v6 = [v7 PKStringForKey:@"model"];
  }
  return (NSString *)v6;
}

- (NSString)vehicleIssuer
{
  v2 = [(PKSharingCarKeyMessage *)self carKeySharingDict];
  v3 = [v2 PKStringForKey:@"vehicleIssuer"];

  return (NSString *)v3;
}

- (NSString)readerIdentifier
{
  v3 = [(PKSharingCarKeyMessage *)self carKeySharingDict];
  unint64_t v4 = [v3 PKStringForKey:@"readerIdentifier"];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [(PKSharingGenericMessage *)self genericSharingDict];
    id v6 = [v7 PKStringForKey:@"vehicleIdentifier"];
  }
  return (NSString *)v6;
}

- (NSString)partnerIdentifier
{
  v2 = [(PKSharingCarKeyMessage *)self carKeySharingDict];
  v3 = [v2 PKStringForKey:@"partnerIdentifier"];

  return (NSString *)v3;
}

- (NSString)brandIdentifier
{
  v3 = [(PKSharingCarKeyMessage *)self carKeySharingDict];
  unint64_t v4 = [v3 PKStringForKey:@"brandIdentifier"];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [(PKSharingGenericMessage *)self genericSharingDict];
    id v6 = [v7 PKStringForKey:@"brand"];
  }
  return (NSString *)v6;
}

+ (void)_mergeActivationOptions:(id)a3 intoDictionary:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    if ([v5 containsOptionOfType:1])
    {
      v7 = @"DevicePIN";
      v8 = [v5 optionOfType:1];
      uint64_t v9 = [v8 valueLength];
      if (v9)
      {
        uint64_t v10 = v9;
        v11 = [NSNumber numberWithInteger:v9];
        [v6 setObject:v11 forKeyedSubscript:@"pinLength"];

        v12 = [NSNumber numberWithInteger:v10];
        [v6 setObject:v12 forKeyedSubscript:@"pinCodeLength"];
      }
    }
    else
    {
      v7 = @"VehicleActivation";
      v8 = [v5 identifiers];
      [v6 setObject:v8 forKeyedSubscript:@"activationOptions"];
    }

    v14[0] = v7;
    objc_super v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [v6 setObject:v13 forKeyedSubscript:@"authType"];
  }
}

+ (id)_activationOptionsFromDictionary:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    uint64_t v9 = 0;
    goto LABEL_27;
  }
  unint64_t v4 = [v3 PKArrayContaining:objc_opt_class() forKey:@"authType"];
  id v5 = [v4 firstObject];
  id v6 = @"DevicePIN";
  if (v5 == v6)
  {

LABEL_12:
    v11 = [[PKPassShareActivationOption alloc] initWithDefaultIdentifierForType:1];
    v12 = [v3 PKNumberForKey:@"pinLength"];
    if (v12
      || ([v3 PKNumberForKey:@"pinCodeLength"],
          (v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[PKPassShareActivationOption setValueLength:](v11, "setValueLength:", [v12 integerValue]);
    }
    objc_super v13 = [PKPassShareActivationOptions alloc];
    v18[0] = v11;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    uint64_t v9 = [(PKPassShareActivationOptions *)v13 initWithOptions:v14];

    goto LABEL_25;
  }
  v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
  }
  else
  {
    int v10 = [(__CFString *)v5 isEqualToString:v6];

    if (v10) {
      goto LABEL_12;
    }
  }
  if (v5) {
    BOOL v15 = @"VehicleActivation" == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    if (v5 == @"VehicleActivation")
    {
LABEL_24:
      v11 = [v3 PKArrayContaining:objc_opt_class() forKey:@"activationOptions"];
      uint64_t v9 = [[PKPassShareActivationOptions alloc] initWithCarKeyIdentifiers:v11];
LABEL_25:

      goto LABEL_26;
    }
  }
  else
  {
    char v16 = -[__CFString isEqual:](v5, "isEqual:");
    if (v16) {
      goto LABEL_24;
    }
  }
  uint64_t v9 = 0;
LABEL_26:

LABEL_27:
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSharingMesageProprietaryData)proprietaryData
{
  return self->_proprietaryData;
}

- (PKPassShareActivationOptions)activationOptions
{
  return self->_activationOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationOptions, 0);
  objc_storeStrong((id *)&self->_proprietaryData, 0);
}

@end