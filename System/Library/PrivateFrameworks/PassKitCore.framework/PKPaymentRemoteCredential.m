@interface PKPaymentRemoteCredential
- (BOOL)couldSupportSuperEasyProvisioning;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresMetadata;
- (BOOL)supportsSuperEasyProvisioning;
- (NSArray)summaryMetadata;
- (NSArray)transferableFromDevices;
- (NSDate)originalProvisioningDate;
- (NSString)identifier;
- (NSString)identityAccountKeyIdentifier;
- (NSString)ownershipTokenIdentifier;
- (NSString)passTypeIdentifier;
- (NSString)personalizedVehicleIdentifier;
- (NSString)productIdentifier;
- (NSString)serialNumber;
- (NSString)statusDescription;
- (NSString)summaryMetadataDescription;
- (NSString)transferableFromDeviceIdentifier;
- (NSURL)passURL;
- (PKPaymentPass)paymentPass;
- (PKPaymentRemoteCredential)init;
- (PKPaymentRemoteCredential)initWithDictionary:(id)a3;
- (PKPaymentRemoteCredential)initWithIdentifier:(id)a3 status:(int64_t)a4 credentialType:(int64_t)a5 passURL:(id)a6;
- (PKPaymentRemoteCredentialFIDOProfile)fidoProfile;
- (id)description;
- (id)detailDescriptionWithEnvironment:(unint64_t)a3;
- (id)setupProductIdentifier;
- (int64_t)compare:(id)a3;
- (int64_t)status;
- (int64_t)transferType;
- (unint64_t)hash;
- (unint64_t)rank;
- (void)setCouldSupportSuperEasyProvisioning:(BOOL)a3;
- (void)setFidoProfile:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentityAccountKeyIdentifier:(id)a3;
- (void)setOriginalProvisioningDate:(id)a3;
- (void)setOwnershipTokenIdentifier:(id)a3;
- (void)setPassTypeIdentifier:(id)a3;
- (void)setPassURL:(id)a3;
- (void)setPaymentPass:(id)a3;
- (void)setPersonalizedVehicleIdentifier:(id)a3;
- (void)setProductIdentifier:(id)a3;
- (void)setRank:(unint64_t)a3;
- (void)setRequiresMetadata:(BOOL)a3;
- (void)setSerialNumber:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setStatusDescription:(id)a3;
- (void)setSummaryMetadata:(id)a3;
- (void)setSummaryMetadataDescription:(id)a3;
- (void)setSupportsSuperEasyProvisioning:(BOOL)a3;
- (void)setTransferType:(int64_t)a3;
- (void)setTransferableFromDeviceIdentifier:(id)a3;
- (void)setTransferableFromDevices:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation PKPaymentRemoteCredential

- (PKPaymentRemoteCredential)init
{
  return [(PKPaymentRemoteCredential *)self initWithDictionary:0];
}

- (PKPaymentRemoteCredential)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)PKPaymentRemoteCredential;
    v5 = [(PKPaymentCredential *)&v8 init];
    v6 = v5;
    if (v5) {
      [(PKPaymentRemoteCredential *)v5 updateWithDictionary:v4];
    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (PKPaymentRemoteCredential)initWithIdentifier:(id)a3 status:(int64_t)a4 credentialType:(int64_t)a5 passURL:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentRemoteCredential;
  v12 = [(PKPaymentCredential *)&v19 init];
  v13 = v12;
  if (v12)
  {
    [(PKPaymentCredential *)v12 setCredentialType:a5];
    uint64_t v14 = [v10 copy];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    v13->_status = a4;
    uint64_t v16 = [v11 copy];
    passURL = v13->_passURL;
    v13->_passURL = (NSURL *)v16;
  }
  return v13;
}

- (void)updateWithDictionary:(id)a3
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 PKStringForKey:@"identifier"];
  identifier = self->_identifier;
  self->_identifier = v5;

  v7 = [v4 PKStringForKey:@"passTypeIdentifier"];
  passTypeIdentifier = self->_passTypeIdentifier;
  self->_passTypeIdentifier = v7;

  uint64_t v9 = [v4 PKNumberForKey:@"status"];
  id v10 = (void *)v9;
  id v11 = &unk_1EE22BC90;
  if (v9) {
    id v11 = (void *)v9;
  }
  id v12 = v11;

  v87 = v12;
  uint64_t v80 = [v12 integerValue];
  -[PKPaymentRemoteCredential setStatus:](self, "setStatus:");
  v13 = [v4 PKURLForKey:@"passURL"];
  [(PKPaymentRemoteCredential *)self setPassURL:v13];

  uint64_t v14 = [v4 PKStringForKey:@"serialNumber"];
  v86 = (void *)v14;
  if (v14)
  {
    [(PKPaymentRemoteCredential *)self setSerialNumber:v14];
  }
  else
  {
    passURL = self->_passURL;
    if (passURL)
    {
      uint64_t v16 = [(NSURL *)passURL lastPathComponent];
      [(PKPaymentRemoteCredential *)self setSerialNumber:v16];
    }
  }
  -[PKPaymentCredential setDeletable:](self, "setDeletable:", [v4 PKBoolForKey:@"isDeletable"]);
  v17 = [v4 objectForKey:@"cardType"];
  if (objc_opt_respondsToSelector()) {
    uint64_t v18 = [v17 integerValue];
  }
  else {
    uint64_t v18 = 0;
  }
  [(PKPaymentCredential *)self setCredentialType:v18];
  [v4 PKStringForKey:@"sanitizedPrimaryAccountNumber"];
  objc_super v19 = v89 = self;
  [(PKPaymentCredential *)v89 setSanitizedPrimaryAccountNumber:v19];

  v20 = [v4 PKStringForKey:@"sanitizedPrimaryAccountName"];
  [(PKPaymentCredential *)v89 setSanitizedPrimaryAccountName:v20];

  v21 = [v4 PKStringForKey:@"expiration"];
  [(PKPaymentCredential *)v89 setExpiration:v21];

  uint64_t v22 = [v4 PKStringForKey:@"nonce"];
  v23 = [(PKPaymentCredential *)v89 state];
  [v23 setNonce:v22];

  v85 = (void *)v22;
  v89->_couldSupportSuperEasyProvisioning = v22 != 0;
  uint64_t v24 = [v4 PKStringForKey:@"longDescription"];
  v84 = (void *)v24;
  if (v24)
  {
    [(PKPaymentCredential *)v89 setLongDescription:v24];
  }
  else
  {
    v25 = PKDisplayablePaymentNetworkNameForPaymentCredentialType(v18);
    [(PKPaymentCredential *)v89 setLongDescription:v25];
  }
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v88 = v4;
  v27 = [v4 PKArrayForKey:@"metadata"];
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v95 objects:v100 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v96;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v96 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = +[PKPaymentCredentialMetadata paymentCredentialMetadataWithConfiguration:*(void *)(*((void *)&v95 + 1) + 8 * i)];
        if (v32) {
          [v26 addObject:v32];
        }
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v95 objects:v100 count:16];
    }
    while (v29);
  }
  v33 = [v88 PKStringForKey:@"paymentCardType"];
  v34 = v33;
  if (v33)
  {
    uint64_t v35 = PKWebServicesPaymentCardTypeFromString(v33);
    uint64_t v36 = 4;
    if (v35 != 5) {
      uint64_t v36 = v35;
    }
    if (v35 == 4) {
      uint64_t v37 = 3;
    }
    else {
      uint64_t v37 = v36;
    }
    [(PKPaymentCredential *)v89 setCardType:v37];
  }
  v83 = v34;
  v38 = [v88 PKStringForKey:@"productIdentifier"];
  if (v38) {
    objc_storeStrong((id *)&v89->_productIdentifier, v38);
  }
  v82 = v38;
  v39 = (void *)[v26 copy];
  [(PKPaymentCredential *)v89 setMetadata:v39];

  id v90 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v41 = [v88 PKArrayForKey:@"summaryMetadata"];
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  uint64_t v42 = [v41 countByEnumeratingWithState:&v91 objects:v99 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v92;
    do
    {
      for (uint64_t j = 0; j != v43; ++j)
      {
        if (*(void *)v92 != v44) {
          objc_enumerationMutation(v41);
        }
        v46 = +[PKPaymentCredentialMetadata paymentCredentialMetadataWithConfiguration:*(void *)(*((void *)&v91 + 1) + 8 * j)];
        if (v46)
        {
          [v40 addObject:v46];
          v47 = [v46 displayString];
          if (v47) {
            [v90 addObject:v47];
          }
        }
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v91 objects:v99 count:16];
    }
    while (v43);
  }
  uint64_t v48 = [v40 copy];
  summaryMetadata = v89->_summaryMetadata;
  v89->_summaryMetadata = (NSArray *)v48;

  if (![v90 count])
  {
    v50 = PKSanitizedPrimaryAccountRepresentationForPaymentCredential(v89);
    if ([v50 length])
    {
      if (v80 == 2)
      {
        uint64_t v51 = PKLocalizedPaymentString(&cfstr_IdmsCardOnFile.isa, &stru_1EE0F6808.isa, v50);

        v50 = (void *)v51;
      }
      [v90 addObject:v50];
    }
  }
  v52 = NSString;
  v53 = [MEMORY[0x1E4F1CA20] currentLocale];
  v54 = [v53 objectForKey:*MEMORY[0x1E4F1C428]];
  uint64_t v55 = [v52 stringWithFormat:@"%@ ", v54];

  v81 = (void *)v55;
  uint64_t v56 = [v90 componentsJoinedByString:v55];
  summaryMetadataDescription = v89->_summaryMetadataDescription;
  v89->_summaryMetadataDescription = (NSString *)v56;

  uint64_t v58 = [v88 PKStringForKey:@"statusDescription"];
  statusDescription = v89->_statusDescription;
  v89->_statusDescription = (NSString *)v58;

  uint64_t v60 = [v88 PKStringForKey:@"ownershipTokenIdentifier"];
  ownershipTokenIdentifier = v89->_ownershipTokenIdentifier;
  v89->_ownershipTokenIdentifier = (NSString *)v60;

  v62 = [PKPaymentRemoteCredentialFIDOProfile alloc];
  v63 = [v88 PKDictionaryForKey:@"fidoProfile"];
  uint64_t v64 = [(PKPaymentRemoteCredentialFIDOProfile *)v62 initWithDictionary:v63];
  fidoProfile = v89->_fidoProfile;
  v89->_fidoProfile = (PKPaymentRemoteCredentialFIDOProfile *)v64;

  v66 = [v88 PKArrayContaining:objc_opt_class() forKey:@"transferableFromDevices"];
  v67 = v66;
  if (v66)
  {
    uint64_t v68 = objc_msgSend(v66, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_283);
    transferableFromDevices = v89->_transferableFromDevices;
    v89->_transferableFromDevices = (NSArray *)v68;
  }
  v70 = [v88 PKStringForKey:@"transferType"];
  v89->_transferType = PKRemoteCredentialTransferTypeFromString(v70);

  if (!v89->_transferType && [(NSArray *)v89->_transferableFromDevices count]) {
    v89->_transferType = 1;
  }
  v89->_supportsSuperEasyProvisioning = [v88 PKBoolForKey:@"supportsFrictionlessProvisioning"];
  v71 = [v88 PKArrayContaining:objc_opt_class() forKey:@"paymentApplications"];
  v72 = objc_msgSend(v71, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_296);

  if ([v72 count]) {
    v73 = v72;
  }
  else {
    v73 = 0;
  }
  [(PKPaymentCredential *)v89 setPaymentApplications:v73];
  uint64_t v74 = [v88 PKDateForKey:@"originalProvisioningDate"];
  originalProvisioningDate = v89->_originalProvisioningDate;
  v89->_originalProvisioningDate = (NSDate *)v74;

  uint64_t v76 = [v88 PKStringForKey:@"identityAccountKeyIdentifier"];
  identityAccountKeyIdentifier = v89->_identityAccountKeyIdentifier;
  v89->_identityAccountKeyIdentifier = (NSString *)v76;

  uint64_t v78 = [v88 PKStringForKey:@"personalizedVehicleIdentifier"];
  personalizedVehicleIdentifier = v89->_personalizedVehicleIdentifier;
  v89->_personalizedVehicleIdentifier = (NSString *)v78;
}

PKExternalDestinationDevice *__50__PKPaymentRemoteCredential_updateWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKExternalDestinationDevice alloc] initWithDictionary:v2];

  return v3;
}

PKProvisioningPaymentApplication *__50__PKPaymentRemoteCredential_updateWithDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKProvisioningPaymentApplication alloc] initWithDictionary:v2];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPaymentRemoteCredential *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v19.receiver = self;
      v19.super_class = (Class)PKPaymentRemoteCredential;
      if (![(PKPaymentCredential *)&v19 isEqual:v5])
      {
LABEL_24:
        BOOL v11 = 0;
LABEL_25:

        goto LABEL_26;
      }
      identifier = v5->_identifier;
      v7 = self->_identifier;
      objc_super v8 = identifier;
      if (v7 == v8)
      {
      }
      else
      {
        uint64_t v9 = v8;
        if (v7) {
          BOOL v10 = v8 == 0;
        }
        else {
          BOOL v10 = 1;
        }
        if (v10)
        {
LABEL_10:

          goto LABEL_24;
        }
        BOOL v12 = [(NSString *)v7 isEqualToString:v8];

        if (!v12) {
          goto LABEL_24;
        }
      }
      summaryMetadata = self->_summaryMetadata;
      uint64_t v14 = v5->_summaryMetadata;
      if (summaryMetadata && v14)
      {
        if ((-[NSArray isEqual:](summaryMetadata, "isEqual:") & 1) == 0) {
          goto LABEL_24;
        }
      }
      else if (summaryMetadata != v14)
      {
        goto LABEL_24;
      }
      summaryMetadataDescription = v5->_summaryMetadataDescription;
      v7 = self->_summaryMetadataDescription;
      uint64_t v16 = summaryMetadataDescription;
      if (v7 == v16)
      {

        goto LABEL_28;
      }
      uint64_t v9 = v16;
      if (v7 && v16)
      {
        BOOL v17 = [(NSString *)v7 isEqualToString:v16];

        if (!v17) {
          goto LABEL_24;
        }
LABEL_28:
        BOOL v11 = self->_requiresMetadata == v5->_requiresMetadata;
        goto LABEL_25;
      }
      goto LABEL_10;
    }
    BOOL v11 = 0;
  }
LABEL_26:

  return v11;
}

- (void)setSupportsSuperEasyProvisioning:(BOOL)a3
{
  self->_supportsSuperEasyProvisioning = a3;
}

- (BOOL)supportsSuperEasyProvisioning
{
  return self->_supportsSuperEasyProvisioning;
}

- (void)setCouldSupportSuperEasyProvisioning:(BOOL)a3
{
  self->_couldSupportSuperEasyProvisioning = a3;
}

- (BOOL)couldSupportSuperEasyProvisioning
{
  return self->_couldSupportSuperEasyProvisioning;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_summaryMetadata];
  [v3 safelyAddObject:self->_summaryMetadataDescription];
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentRemoteCredential;
  id v4 = [(PKPaymentCredential *)&v8 hash];
  uint64_t v5 = PKCombinedHash((uint64_t)v4, v3);
  unint64_t v6 = self->_requiresMetadata - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  identifier = (__CFString *)self->_identifier;
  if (!identifier) {
    identifier = @"n/a";
  }
  id v4 = NSString;
  uint64_t v5 = identifier;
  unint64_t v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  objc_super v8 = [v4 stringWithFormat:@"<%@ %p>: Identifier: %@", v7, self, v5];

  return v8;
}

- (id)detailDescriptionWithEnvironment:(unint64_t)a3
{
  if (self->_transferType == 2) {
    goto LABEL_2;
  }
  if ([(PKPaymentCredential *)self cardType] == 4)
  {
    if (a3 != 1)
    {
LABEL_2:
      v3 = 0;
      goto LABEL_7;
    }
    v3 = PKLocalizedIdentityString(&cfstr_PrecursorPassS.isa, 0);
  }
  else
  {
    v3 = [(PKPaymentRemoteCredential *)self summaryMetadataDescription];
  }
LABEL_7:
  return v3;
}

- (NSString)summaryMetadataDescription
{
  if (self->_requiresMetadata && ![(NSArray *)self->_summaryMetadata count])
  {
    PKLocalizedPaymentString(&cfstr_LoadingMetadat.isa, 0);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_summaryMetadataDescription;
  }
  return v3;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPaymentCredential *)self cardType];
  if (v5 < [v4 cardType]) {
    goto LABEL_7;
  }
  uint64_t v6 = [(PKPaymentCredential *)self cardType];
  if (v6 <= [v4 cardType])
  {
    uint64_t v7 = [(PKPaymentCredential *)self credentialType];
    if (v7 >= [v4 credentialType])
    {
      uint64_t v8 = [(PKPaymentCredential *)self credentialType];
      if (v8 > [v4 credentialType]) {
        goto LABEL_5;
      }
      unint64_t rank = self->_rank;
      if (rank >= [v4 rank])
      {
        unint64_t v12 = self->_rank;
        int64_t v9 = v12 > [v4 rank];
        goto LABEL_8;
      }
    }
LABEL_7:
    int64_t v9 = -1;
    goto LABEL_8;
  }
LABEL_5:
  int64_t v9 = 1;
LABEL_8:

  return v9;
}

- (id)setupProductIdentifier
{
  return self->_productIdentifier;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSURL)passURL
{
  return self->_passURL;
}

- (void)setPassURL:(id)a3
{
}

- (NSArray)summaryMetadata
{
  return self->_summaryMetadata;
}

- (void)setSummaryMetadata:(id)a3
{
}

- (void)setSummaryMetadataDescription:(id)a3
{
}

- (NSString)statusDescription
{
  return self->_statusDescription;
}

- (void)setStatusDescription:(id)a3
{
}

- (NSString)ownershipTokenIdentifier
{
  return self->_ownershipTokenIdentifier;
}

- (void)setOwnershipTokenIdentifier:(id)a3
{
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (void)setPaymentPass:(id)a3
{
}

- (unint64_t)rank
{
  return self->_rank;
}

- (void)setRank:(unint64_t)a3
{
  self->_unint64_t rank = a3;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
}

- (BOOL)requiresMetadata
{
  return self->_requiresMetadata;
}

- (void)setRequiresMetadata:(BOOL)a3
{
  self->_requiresMetadata = a3;
}

- (PKPaymentRemoteCredentialFIDOProfile)fidoProfile
{
  return self->_fidoProfile;
}

- (void)setFidoProfile:(id)a3
{
}

- (NSDate)originalProvisioningDate
{
  return self->_originalProvisioningDate;
}

- (void)setOriginalProvisioningDate:(id)a3
{
}

- (NSString)identityAccountKeyIdentifier
{
  return self->_identityAccountKeyIdentifier;
}

- (void)setIdentityAccountKeyIdentifier:(id)a3
{
}

- (NSString)personalizedVehicleIdentifier
{
  return self->_personalizedVehicleIdentifier;
}

- (void)setPersonalizedVehicleIdentifier:(id)a3
{
}

- (NSArray)transferableFromDevices
{
  return self->_transferableFromDevices;
}

- (void)setTransferableFromDevices:(id)a3
{
}

- (int64_t)transferType
{
  return self->_transferType;
}

- (void)setTransferType:(int64_t)a3
{
  self->_transferType = a3;
}

- (NSString)transferableFromDeviceIdentifier
{
  return self->_transferableFromDeviceIdentifier;
}

- (void)setTransferableFromDeviceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferableFromDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_transferableFromDevices, 0);
  objc_storeStrong((id *)&self->_personalizedVehicleIdentifier, 0);
  objc_storeStrong((id *)&self->_identityAccountKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_originalProvisioningDate, 0);
  objc_storeStrong((id *)&self->_fidoProfile, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_ownershipTokenIdentifier, 0);
  objc_storeStrong((id *)&self->_statusDescription, 0);
  objc_storeStrong((id *)&self->_summaryMetadata, 0);
  objc_storeStrong((id *)&self->_passURL, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_summaryMetadataDescription, 0);
}

@end