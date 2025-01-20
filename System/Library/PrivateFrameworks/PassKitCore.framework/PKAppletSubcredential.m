@interface PKAppletSubcredential
+ (BOOL)supportsSecureCoding;
- (BOOL)canShare;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOnlineImmobilizerToken;
- (BOOL)isShareable;
- (BOOL)isSharedCredential;
- (NSArray)transactionKeyCertificateChain;
- (NSData)readerIdentifier;
- (NSData)transactionKey;
- (NSSet)aliroGroupResolvingKeys;
- (NSString)appletIdentifier;
- (NSString)brandIdentifier;
- (NSString)endpointIdentifier;
- (NSString)identifier;
- (NSString)invitationIdentifier;
- (NSString)isoFormat;
- (NSString)manufacturerIdentifier;
- (NSString)originatorIDSHandle;
- (NSString)pairedReaderIdentifier;
- (NSString)partnerIdentifier;
- (NSUUID)sharingSessionIdentifier;
- (PKAppletSubcredential)initWithCoder:(id)a3;
- (PKAppletSubcredential)initWithDictionary:(id)a3;
- (PKAppletSubcredential)initWithIdentifier:(id)a3;
- (PKAppletSubcredential)initWithKeyInformation:(id)a3;
- (PKAppletSubcredentialSharingConfirguration)sharingConfiguration;
- (PKPassEntitlement)entitlement;
- (PKSubcredentialEncryptedContainer)trackingRequest;
- (id)asDictionary;
- (id)description;
- (int64_t)credentialType;
- (int64_t)state;
- (unint64_t)allSupportedRadioTechnologies;
- (unint64_t)carKeyServerVersion;
- (unint64_t)carKeyVehicleVersion;
- (unint64_t)credentialAuthorityType;
- (unint64_t)credentialState;
- (unint64_t)hash;
- (unint64_t)keyClass;
- (unint64_t)supportedRadioTechnologies;
- (void)encodeWithCoder:(id)a3;
- (void)setAliroGroupResolvingKeys:(id)a3;
- (void)setAllSupportedRadioTechnologies:(unint64_t)a3;
- (void)setAppletIdentifier:(id)a3;
- (void)setBrandIdentifier:(id)a3;
- (void)setCarKeyServerVersion:(unint64_t)a3;
- (void)setCarKeyVehicleVersion:(unint64_t)a3;
- (void)setCredentialAuthorityType:(unint64_t)a3;
- (void)setCredentialState:(unint64_t)a3;
- (void)setCredentialType:(int64_t)a3;
- (void)setEndpointIdentifier:(id)a3;
- (void)setEntitlement:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInvitationIdentifier:(id)a3;
- (void)setIsOnlineImmobilizerToken:(BOOL)a3;
- (void)setIsoFormat:(id)a3;
- (void)setKeyClass:(unint64_t)a3;
- (void)setOriginatorIDSHandle:(id)a3;
- (void)setPairedReaderIdentifier:(id)a3;
- (void)setPartnerIdentifier:(id)a3;
- (void)setReaderIdentifier:(id)a3;
- (void)setSharingConfiguration:(id)a3;
- (void)setSharingSessionIdentifier:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setSupportedRadioTechnologies:(unint64_t)a3;
- (void)setTrackingRequest:(id)a3;
- (void)setTransactionKey:(id)a3;
- (void)setTransactionKeyCertificateChain:(id)a3;
@end

@implementation PKAppletSubcredential

- (NSData)readerIdentifier
{
  return self->_readerIdentifier;
}

- (NSString)pairedReaderIdentifier
{
  return self->_pairedReaderIdentifier;
}

- (unint64_t)supportedRadioTechnologies
{
  return self->_supportedRadioTechnologies;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (PKAppletSubcredential)initWithDictionary:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PKAppletSubcredential *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    if (v5->_identifier)
    {
      uint64_t v8 = [v4 PKIntegerForKey:@"state"];
      v5->_state = v8;
      if (v8)
      {
        v9 = [v4 PKDictionaryForKey:@"entitlement"];
        if (!v9
          || (v10 = [[PKPassEntitlement alloc] initWithSubcredentialDictionary:v9 active:1 subcredentialIdentifier:v5->_identifier], entitlement = v5->_entitlement, v5->_entitlement = v10, entitlement, v5->_entitlement))
        {
          v12 = [v4 PKDictionaryForKey:@"sharing"];
          if (v12)
          {
            v13 = [[PKAppletSubcredentialSharingConfirguration alloc] initWithDictionary:v12];
            sharingConfiguration = v5->_sharingConfiguration;
            v5->_sharingConfiguration = v13;
          }
          uint64_t v15 = [v4 PKStringForKey:@"invitationIdentifier"];
          invitationIdentifier = v5->_invitationIdentifier;
          v5->_invitationIdentifier = (NSString *)v15;

          uint64_t v17 = [v4 PKStringForKey:@"partnerIdentifier"];
          partnerIdentifier = v5->_partnerIdentifier;
          v5->_partnerIdentifier = (NSString *)v17;

          uint64_t v19 = [v4 PKStringForKey:@"pairedReaderIdentifier"];
          pairedReaderIdentifier = v5->_pairedReaderIdentifier;
          v5->_pairedReaderIdentifier = (NSString *)v19;

          uint64_t v21 = [v4 PKStringForKey:@"brandIdentifier"];
          brandIdentifier = v5->_brandIdentifier;
          v5->_brandIdentifier = (NSString *)v21;

          uint64_t v23 = [v4 PKStringForKey:@"endpointIdentifier"];
          endpointIdentifier = v5->_endpointIdentifier;
          v5->_endpointIdentifier = (NSString *)v23;

          v5->_isOnlineImmobilizerToken = [v4 PKBoolForKey:@"onlineImmobilizerToken"];
          v25 = [v4 PKStringForKey:@"sharingSessionIdentifier"];
          if (v25)
          {
            uint64_t v26 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v25];
            sharingSessionIdentifier = v5->_sharingSessionIdentifier;
            v5->_sharingSessionIdentifier = (NSUUID *)v26;
          }
          uint64_t v28 = [v4 PKStringForKey:@"originatorIDSHandle"];
          originatorIDSHandle = v5->_originatorIDSHandle;
          v5->_originatorIDSHandle = (NSString *)v28;

          v5->_uint64_t allSupportedRadioTechnologies = [v4 PKIntegerForKey:@"allSupportedRadioTechnologies"];
          uint64_t v30 = [v4 PKIntegerForKey:@"supportedRadioTechnologies"];
          v5->_supportedRadioTechnologies = v30;
          if (!v30)
          {
            uint64_t allSupportedRadioTechnologies = v5->_allSupportedRadioTechnologies;
            if (allSupportedRadioTechnologies) {
              v5->_supportedRadioTechnologies = PKRadioTechnologyForConfigurationTechnology(allSupportedRadioTechnologies);
            }
          }
          uint64_t v32 = [v4 PKStringForKey:@"isoFormat"];
          isoFormat = v5->_isoFormat;
          v5->_isoFormat = (NSString *)v32;

          v5->_credentialType = [v4 PKIntegerForKey:@"paymentNetwork"];
          v34 = [v4 PKStringForKey:@"readerIdentifier"];
          uint64_t v35 = objc_msgSend(v34, "pk_decodeHexadecimal");
          readerIdentifier = v5->_readerIdentifier;
          v5->_readerIdentifier = (NSData *)v35;

          v37 = [v4 PKSetContaining:objc_opt_class() forKey:@"aliroGroupResolvingKeys"];
          uint64_t v38 = objc_msgSend(v37, "pk_setBySafelyApplyingBlock:", &__block_literal_global_159);
          aliroGroupResolvingKeys = v5->_aliroGroupResolvingKeys;
          v5->_aliroGroupResolvingKeys = (NSSet *)v38;

          goto LABEL_14;
        }
        v42 = PKLogFacilityTypeGetObject(0x16uLL);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          int v44 = 138412290;
          v45 = (__CFString *)v9;
          _os_log_impl(&dword_190E10000, v42, OS_LOG_TYPE_DEFAULT, "Invalid credential, invalid dict: %@", (uint8_t *)&v44, 0xCu);
        }
      }
      else
      {
        v9 = PKLogFacilityTypeGetObject(0x16uLL);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v44 = 138412290;
          v45 = @"state";
          _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Invalid credential, missing key: %@", (uint8_t *)&v44, 0xCu);
        }
      }
    }
    else
    {
      v41 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        int v44 = 138412290;
        v45 = @"identifier";
        _os_log_impl(&dword_190E10000, v41, OS_LOG_TYPE_DEFAULT, "Invalid credential, missing key: %@", (uint8_t *)&v44, 0xCu);
      }
    }
    v40 = 0;
    goto LABEL_25;
  }
LABEL_14:
  v40 = v5;
LABEL_25:

  return v40;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appletIdentifier, 0);
  objc_storeStrong((id *)&self->_readerIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionKeyCertificateChain, 0);
  objc_storeStrong((id *)&self->_transactionKey, 0);
  objc_storeStrong((id *)&self->_trackingRequest, 0);
  objc_storeStrong((id *)&self->_aliroGroupResolvingKeys, 0);
  objc_storeStrong((id *)&self->_isoFormat, 0);
  objc_storeStrong((id *)&self->_originatorIDSHandle, 0);
  objc_storeStrong((id *)&self->_sharingSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_endpointIdentifier, 0);
  objc_storeStrong((id *)&self->_brandIdentifier, 0);
  objc_storeStrong((id *)&self->_pairedReaderIdentifier, 0);
  objc_storeStrong((id *)&self->_partnerIdentifier, 0);
  objc_storeStrong((id *)&self->_invitationIdentifier, 0);
  objc_storeStrong((id *)&self->_sharingConfiguration, 0);
  objc_storeStrong((id *)&self->_entitlement, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (PKAppletSubcredential)initWithKeyInformation:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PKAppletSubcredential *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 publicKeyIdentifier];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 keyType];
    switch(v8)
    {
      case 1:
        v12 = [v4 alishaKeyInformation];
        v37 = [v12 trackingRequest];
        if (v37)
        {
          uint64_t v38 = [[PKSubcredentialEncryptedContainer alloc] initWithRequest:v37];
          trackingRequest = v5->_trackingRequest;
          v5->_trackingRequest = v38;
        }
        v5->_credentialState = 21;
        v40 = [v12 revocationAttestation];

        if (v40)
        {
          uint64_t v41 = 129;
        }
        else
        {
          v42 = [v12 trackingReceipt];

          if (!v42) {
            goto LABEL_16;
          }
          uint64_t v41 = 15;
        }
        v5->_credentialState = v41;
LABEL_16:
        id obj = 0;
        id v69 = 0;
        uint64_t v43 = [v12 invitationIdentifier];
        invitationIdentifier = v5->_invitationIdentifier;
        v5->_invitationIdentifier = (NSString *)v43;

        v45 = [v12 pairedEntityIdentifier];
        uint64_t v46 = PKCredentialRoutingInformationFromPairedEntityIdentifer(v45, &v69, &obj);
        partnerIdentifier = v5->_partnerIdentifier;
        v5->_partnerIdentifier = (NSString *)v46;

        objc_storeStrong((id *)&v5->_brandIdentifier, obj);
        objc_storeStrong((id *)&v5->_pairedReaderIdentifier, v69);
        uint64_t v48 = [v12 localIdentifier];
        endpointIdentifier = v5->_endpointIdentifier;
        v5->_endpointIdentifier = (NSString *)v48;

        v5->_isOnlineImmobilizerToken = [v12 onlineImmobilizerToken];
        v50 = [v12 supportedTransports];
        v5->_uint64_t allSupportedRadioTechnologies = PKRadioTechnologyFromNumbers(v50);

        v5->_supportedRadioTechnologies = PKRadioTechnologyForConfigurationTechnology(v5->_allSupportedRadioTechnologies);
        if (!v5->_partnerIdentifier || !v5->_pairedReaderIdentifier || !v5->_brandIdentifier)
        {
          v66 = PKLogFacilityTypeGetObject(0x16uLL);
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          {
            v67 = [v12 pairedEntityIdentifier];
            *(_DWORD *)buf = 138412290;
            v72 = v67;
            _os_log_impl(&dword_190E10000, v66, OS_LOG_TYPE_DEFAULT, "Unable to parse paired entity identifier: %@", buf, 0xCu);
          }
          uint64_t v35 = 0;
          goto LABEL_8;
        }
        v5->_credentialType = 301;
        uint64_t v51 = [v12 ownerIDSIdentifier];
        originatorIDSHandle = v5->_originatorIDSHandle;
        v5->_originatorIDSHandle = (NSString *)v51;

        uint64_t v53 = [v12 sharingSessionUUID];
        sharingSessionIdentifier = v5->_sharingSessionIdentifier;
        v5->_sharingSessionIdentifier = (NSUUID *)v53;

        if ([v12 vehicleSupportsSharingPassword])
        {
          v55 = objc_alloc_init(PKAppletSubcredentialSharingConfirguration);
          sharingConfiguration = v5->_sharingConfiguration;
          v5->_sharingConfiguration = v55;

          v57 = [PKPassShareActivationOptions alloc];
          v58 = +[PKPassShareActivationOption vehicleEnteredPin];
          v70 = v58;
          v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
          v60 = [(PKPassShareActivationOptions *)v57 initWithOptions:v59];

          [(PKAppletSubcredentialSharingConfirguration *)v5->_sharingConfiguration setActivationOptions:v60];
        }
        uint64_t v61 = [v12 agreedFrameworkVersion];
        if (v61 == 257) {
          uint64_t v62 = 2;
        }
        else {
          uint64_t v62 = 1;
        }
        if (v61 == 768) {
          uint64_t v62 = 3;
        }
        v5->_carKeyVehicleVersion = v62;
        if ([v12 agreedVehicleServerVersion] == 768) {
          uint64_t v63 = 2;
        }
        else {
          uint64_t v63 = 1;
        }
        v5->_carKeyServerVersion = v63;
        if ([v12 fleetVehicle]) {
          uint64_t v64 = 2;
        }
        else {
          uint64_t v64 = 1;
        }
        v5->_keyClass = v64;
        if ([v12 serverIssued]) {
          uint64_t v65 = 2;
        }
        else {
          uint64_t v65 = 1;
        }
        v5->_credentialAuthorityType = v65;

LABEL_6:
        break;
      case 2:
      case 4:
        v5->_credentialState = 21;
        BOOL v9 = v8 == 2;
        v5->_supportedRadioTechnologies = v9;
        v5->_uint64_t allSupportedRadioTechnologies = v9;
        uint64_t v10 = [v4 publicKeyIdentifier];
        v11 = v5->_endpointIdentifier;
        v5->_endpointIdentifier = (NSString *)v10;

        v12 = [v4 hydraKeyInformation];
        uint64_t v13 = [v12 certificateChain];
        transactionKeyCertificateChain = v5->_transactionKeyCertificateChain;
        v5->_transactionKeyCertificateChain = (NSArray *)v13;

        uint64_t v15 = [(NSArray *)v5->_transactionKeyCertificateChain lastObject];
        transactionKey = v5->_transactionKey;
        v5->_transactionKey = (NSData *)v15;

        uint64_t v17 = [v12 appletIdentifier];
        v18 = [v17 hexEncoding];
        uint64_t v19 = [v18 uppercaseString];
        appletIdentifier = v5->_appletIdentifier;
        v5->_appletIdentifier = (NSString *)v19;

        v5->_credentialType = 130;
        unint64_t v21 = 2;
        goto LABEL_5;
      case 3:
      case 5:
        v5->_credentialState = 21;
        BOOL v22 = v8 == 3;
        v5->_supportedRadioTechnologies = v22;
        v5->_uint64_t allSupportedRadioTechnologies = v22;
        uint64_t v23 = [v4 publicKeyIdentifier];
        v24 = v5->_endpointIdentifier;
        v5->_endpointIdentifier = (NSString *)v23;

        v12 = [v4 homeKeyInformation];
        uint64_t v25 = [v12 publicKey];
        uint64_t v26 = v5->_transactionKey;
        v5->_transactionKey = (NSData *)v25;

        v27 = [v12 appletIdentifier];
        uint64_t v28 = [v27 hexEncoding];
        uint64_t v29 = [v28 uppercaseString];
        uint64_t v30 = v5->_appletIdentifier;
        v5->_appletIdentifier = (NSString *)v29;

        uint64_t v31 = [v12 readerIdentifier];
        readerIdentifier = v5->_readerIdentifier;
        v5->_readerIdentifier = (NSData *)v31;

        uint64_t v33 = [(NSData *)v5->_readerIdentifier hexEncoding];
        pairedReaderIdentifier = v5->_pairedReaderIdentifier;
        v5->_pairedReaderIdentifier = (NSString *)v33;

        v5->_credentialType = 133;
        unint64_t v21 = 1;
LABEL_5:
        *(int64x2_t *)&v5->_keyClass = vdupq_n_s64(v21);
        goto LABEL_6;
      default:
        break;
    }
  }
  uint64_t v35 = v5;
LABEL_8:

  return v35;
}

- (PKAppletSubcredential)initWithIdentifier:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(PKAppletSubcredential *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

uint64_t __44__PKAppletSubcredential_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pk_decodeHexadecimal");
}

- (id)asDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKeyedSubscript:@"identifier"];
  }
  uint64_t v6 = [NSNumber numberWithInteger:self->_state];
  [v4 setObject:v6 forKeyedSubscript:@"state"];

  v7 = [NSNumber numberWithBool:self->_isOnlineImmobilizerToken];
  [v4 setObject:v7 forKeyedSubscript:@"onlineImmobilizerToken"];

  entitlement = self->_entitlement;
  if (entitlement)
  {
    BOOL v9 = [(PKPassEntitlement *)entitlement subcredentialDictionaryRepresentation];
    [v4 setObject:v9 forKeyedSubscript:@"entitlement"];
  }
  sharingConfiguration = self->_sharingConfiguration;
  if (sharingConfiguration)
  {
    v11 = [(PKAppletSubcredentialSharingConfirguration *)sharingConfiguration asDictionary];
    [v4 setObject:v11 forKeyedSubscript:@"sharing"];
  }
  invitationIdentifier = self->_invitationIdentifier;
  if (invitationIdentifier) {
    [v4 setObject:invitationIdentifier forKeyedSubscript:@"invitationIdentifier"];
  }
  partnerIdentifier = self->_partnerIdentifier;
  if (partnerIdentifier) {
    [v4 setObject:partnerIdentifier forKeyedSubscript:@"partnerIdentifier"];
  }
  pairedReaderIdentifier = self->_pairedReaderIdentifier;
  if (pairedReaderIdentifier) {
    [v4 setObject:pairedReaderIdentifier forKeyedSubscript:@"pairedReaderIdentifier"];
  }
  brandIdentifier = self->_brandIdentifier;
  if (brandIdentifier) {
    [v4 setObject:brandIdentifier forKeyedSubscript:@"brandIdentifier"];
  }
  endpointIdentifier = self->_endpointIdentifier;
  if (endpointIdentifier) {
    [v4 setObject:endpointIdentifier forKeyedSubscript:@"endpointIdentifier"];
  }
  sharingSessionIdentifier = self->_sharingSessionIdentifier;
  if (sharingSessionIdentifier) {
    [v4 setObject:sharingSessionIdentifier forKeyedSubscript:@"sharingSessionIdentifier"];
  }
  originatorIDSHandle = self->_originatorIDSHandle;
  if (originatorIDSHandle) {
    [v4 setObject:originatorIDSHandle forKeyedSubscript:@"originatorIDSHandle"];
  }
  uint64_t v19 = [NSNumber numberWithUnsignedInteger:self->_allSupportedRadioTechnologies];
  [v4 setObject:v19 forKeyedSubscript:@"allSupportedRadioTechnologies"];

  v20 = [NSNumber numberWithUnsignedInteger:self->_supportedRadioTechnologies];
  [v4 setObject:v20 forKeyedSubscript:@"supportedRadioTechnologies"];

  [v4 setObject:self->_isoFormat forKeyedSubscript:@"isoFormat"];
  unint64_t v21 = [NSNumber numberWithInteger:self->_credentialType];
  [v4 setObject:v21 forKeyedSubscript:@"paymentNetwork"];

  BOOL v22 = [(NSData *)self->_readerIdentifier hexEncoding];
  [v4 setObject:v22 forKeyedSubscript:@"readerIdentifier"];

  uint64_t v23 = [(NSSet *)self->_aliroGroupResolvingKeys pk_setByApplyingBlock:&__block_literal_global_115];
  [v4 setObject:v23 forKeyedSubscript:@"aliroGroupResolvingKeys"];

  v24 = (void *)[v4 copy];
  return v24;
}

uint64_t __37__PKAppletSubcredential_asDictionary__block_invoke(uint64_t a1, void *a2)
{
  return [a2 hexEncoding];
}

- (BOOL)canShare
{
  BOOL v3 = [(PKAppletSubcredential *)self isShareable];
  if (v3) {
    LOBYTE(v3) = [(PKAppletSubcredentialSharingConfirguration *)self->_sharingConfiguration numberOfShareableCredentials] != 0;
  }
  return v3;
}

- (BOOL)isShareable
{
  int64_t state = self->_state;
  return (state == 15 || state == 1)
      && [(PKAppletSubcredentialSharingConfirguration *)self->_sharingConfiguration maxNumberOfSharedCredentials] != 0;
}

- (BOOL)isSharedCredential
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (![(NSString *)self->_endpointIdentifier hasPrefix:@"DIGK.OWNR"])
  {
    if ([(NSString *)self->_endpointIdentifier hasPrefix:@"DIGK.FRND"]) {
      return 1;
    }
    id v4 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      endpointIdentifier = self->_endpointIdentifier;
      int v6 = 138412290;
      v7 = endpointIdentifier;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Unexpected endpoint ID (%@), assuming key is not shared", (uint8_t *)&v6, 0xCu);
    }
  }
  return 0;
}

- (NSString)manufacturerIdentifier
{
  v2 = [(NSString *)self->_partnerIdentifier componentsSeparatedByString:@"."];
  if ((unint64_t)[v2 count] < 2)
  {
    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = [v2 objectAtIndexedSubscript:1];
  }

  return (NSString *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v13 = a3;
  [v13 encodeObject:identifier forKey:@"identifier"];
  [v13 encodeInteger:self->_state forKey:@"state"];
  [v13 encodeObject:self->_entitlement forKey:@"entitlement"];
  [v13 encodeObject:self->_sharingConfiguration forKey:@"sharing"];
  [v13 encodeObject:self->_invitationIdentifier forKey:@"invitationIdentifier"];
  [v13 encodeObject:self->_partnerIdentifier forKey:@"partnerIdentifier"];
  [v13 encodeObject:self->_pairedReaderIdentifier forKey:@"pairedReaderIdentifier"];
  [v13 encodeObject:self->_brandIdentifier forKey:@"brandIdentifier"];
  [v13 encodeObject:self->_endpointIdentifier forKey:@"endpointIdentifier"];
  [v13 encodeBool:self->_isOnlineImmobilizerToken forKey:@"onlineImmobilizerToken"];
  [v13 encodeInteger:self->_credentialState forKey:@"credentialState"];
  [v13 encodeObject:self->_trackingRequest forKey:@"trackingRequest"];
  [v13 encodeObject:self->_sharingSessionIdentifier forKey:@"sharingSessionIdentifier"];
  [v13 encodeObject:self->_originatorIDSHandle forKey:@"originatorIDSHandle"];
  [v13 encodeInteger:self->_allSupportedRadioTechnologies forKey:@"allSupportedRadioTechnologies"];
  [v13 encodeInteger:self->_supportedRadioTechnologies forKey:@"supportedRadioTechnologies"];
  [v13 encodeObject:self->_transactionKeyCertificateChain forKey:@"transactionKeyCertificateChain"];
  [v13 encodeObject:self->_transactionKey forKey:@"transactionKey"];
  [v13 encodeObject:self->_appletIdentifier forKey:@"appletIdentifier"];
  [v13 encodeInteger:self->_credentialType forKey:@"paymentNetwork"];
  [v13 encodeObject:self->_readerIdentifier forKey:@"readerIdentifier"];
  id v5 = PKAppletSubcredentialCarKeyVehicleVersionToString(self->_carKeyVehicleVersion);
  [v13 encodeObject:v5 forKey:@"vehicleVersion"];

  int v6 = PKAppletSubcredentialCarKeyServerVersionToString(self->_carKeyServerVersion);
  [v13 encodeObject:v6 forKey:@"serverVersion"];

  unint64_t keyClass = self->_keyClass;
  uint64_t v8 = @"private";
  if (keyClass != 1) {
    uint64_t v8 = 0;
  }
  if (keyClass == 2) {
    BOOL v9 = @"fleet";
  }
  else {
    BOOL v9 = v8;
  }
  [v13 encodeObject:v9 forKey:@"keyClass"];
  unint64_t credentialAuthorityType = self->_credentialAuthorityType;
  v11 = @"secure-element";
  if (credentialAuthorityType != 1) {
    v11 = 0;
  }
  if (credentialAuthorityType == 2) {
    v12 = @"server";
  }
  else {
    v12 = v11;
  }
  [v13 encodeObject:v12 forKey:@"credentialAuthority"];
  [v13 encodeObject:self->_isoFormat forKey:@"isoFormat"];
  [v13 encodeObject:self->_aliroGroupResolvingKeys forKey:@"aliroGroupResolvingKeys"];
}

- (PKAppletSubcredential)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PKAppletSubcredential *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_int64_t state = [v4 decodeIntegerForKey:@"state"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entitlement"];
    entitlement = v5->_entitlement;
    v5->_entitlement = (PKPassEntitlement *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharing"];
    sharingConfiguration = v5->_sharingConfiguration;
    v5->_sharingConfiguration = (PKAppletSubcredentialSharingConfirguration *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"invitationIdentifier"];
    invitationIdentifier = v5->_invitationIdentifier;
    v5->_invitationIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"partnerIdentifier"];
    partnerIdentifier = v5->_partnerIdentifier;
    v5->_partnerIdentifier = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"brandIdentifier"];
    brandIdentifier = v5->_brandIdentifier;
    v5->_brandIdentifier = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pairedReaderIdentifier"];
    pairedReaderIdentifier = v5->_pairedReaderIdentifier;
    v5->_pairedReaderIdentifier = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endpointIdentifier"];
    endpointIdentifier = v5->_endpointIdentifier;
    v5->_endpointIdentifier = (NSString *)v20;

    v5->_isOnlineImmobilizerToken = [v4 decodeBoolForKey:@"onlineImmobilizerToken"];
    v5->_credentialState = [v4 decodeIntegerForKey:@"credentialState"];
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trackingRequest"];
    trackingRequest = v5->_trackingRequest;
    v5->_trackingRequest = (PKSubcredentialEncryptedContainer *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharingSessionIdentifier"];
    sharingSessionIdentifier = v5->_sharingSessionIdentifier;
    v5->_sharingSessionIdentifier = (NSUUID *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originatorIDSHandle"];
    originatorIDSHandle = v5->_originatorIDSHandle;
    v5->_originatorIDSHandle = (NSString *)v26;

    v5->_uint64_t allSupportedRadioTechnologies = [v4 decodeIntegerForKey:@"allSupportedRadioTechnologies"];
    v5->_supportedRadioTechnologies = [v4 decodeIntegerForKey:@"supportedRadioTechnologies"];
    id v28 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = objc_msgSend(v28, "initWithObjects:", v29, objc_opt_class(), 0);
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"transactionKeyCertificateChain"];
    transactionKeyCertificateChain = v5->_transactionKeyCertificateChain;
    v5->_transactionKeyCertificateChain = (NSArray *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionKey"];
    transactionKey = v5->_transactionKey;
    v5->_transactionKey = (NSData *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appletIdentifier"];
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSString *)v35;

    v5->_credentialType = [v4 decodeIntegerForKey:@"paymentNetwork"];
    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"readerIdentifier"];
    readerIdentifier = v5->_readerIdentifier;
    v5->_readerIdentifier = (NSData *)v37;

    v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vehicleVersion"];
    v5->_carKeyVehicleVersion = PKAppletSubcredentialCarKeyVehicleVersionFromString(v39);

    v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serverVersion"];
    v5->_carKeyServerVersion = PKAppletSubcredentialCarKeyServerVersionFromString(v40);

    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyClass"];
    v5->_unint64_t keyClass = PKAppletSubcredentialKeyClassFromString(v41);

    v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentialAuthority"];
    v5->_unint64_t credentialAuthorityType = PKAppletSubcredentialCredentialAuthorityTypeFromString(v42);

    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isoFormat"];
    isoFormat = v5->_isoFormat;
    v5->_isoFormat = (NSString *)v43;

    v45 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v46 = objc_opt_class();
    v47 = objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
    uint64_t v48 = [v4 decodeObjectOfClasses:v47 forKey:@"aliroGroupResolvingKeys"];
    aliroGroupResolvingKeys = v5->_aliroGroupResolvingKeys;
    v5->_aliroGroupResolvingKeys = (NSSet *)v48;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  BOOL v3 = [(NSSet *)self->_aliroGroupResolvingKeys allObjects];
  unint64_t v4 = [v3 count];
  uint64_t v35 = v3;
  if (v4 < 4)
  {
    id v5 = objc_msgSend(v3, "pk_arrayByApplyingBlock:", &__block_literal_global_128_0);
    v34 = [v5 componentsJoinedByString:@", "];
  }
  else
  {
    v34 = objc_msgSend([NSString alloc], "initWithFormat:", @"..%lu keys..", v4);
  }
  uint64_t v33 = NSString;
  uint64_t v32 = objc_opt_class();
  long long v31 = *(_OWORD *)&self->_identifier;
  partnerIdentifier = self->_partnerIdentifier;
  unint64_t credentialState = self->_credentialState;
  BOOL isOnlineImmobilizerToken = self->_isOnlineImmobilizerToken;
  invitationIdentifier = self->_invitationIdentifier;
  pairedReaderIdentifier = self->_pairedReaderIdentifier;
  int64_t credentialType = self->_credentialType;
  sharingConfiguration = self->_sharingConfiguration;
  sharingSessionIdentifier = self->_sharingSessionIdentifier;
  originatorIDSHandle = self->_originatorIDSHandle;
  endpointIdentifier = self->_endpointIdentifier;
  entitlement = self->_entitlement;
  readerIdentifier = self->_readerIdentifier;
  appletIdentifier = self->_appletIdentifier;
  brandIdentifier = self->_brandIdentifier;
  uint64_t v10 = PKRadioTechnologiesToString(self->_supportedRadioTechnologies);
  v11 = PKRadioTechnologiesToString(self->_allSupportedRadioTechnologies);
  uint64_t v12 = PKAppletSubcredentialCarKeyVehicleVersionToString(self->_carKeyVehicleVersion);
  uint64_t v13 = PKAppletSubcredentialCarKeyServerVersionToString(self->_carKeyServerVersion);
  uint64_t v14 = (void *)v13;
  uint64_t v15 = @"private";
  unint64_t keyClass = self->_keyClass;
  unint64_t credentialAuthorityType = self->_credentialAuthorityType;
  if (keyClass != 1) {
    uint64_t v15 = 0;
  }
  if (keyClass == 2) {
    uint64_t v15 = @"fleet";
  }
  uint64_t v18 = @"secure-element";
  if (credentialAuthorityType != 1) {
    uint64_t v18 = 0;
  }
  if (credentialAuthorityType == 2) {
    uint64_t v18 = @"server";
  }
  objc_msgSend(v33, "stringWithFormat:", @"<%@: %p; identifier: %@; state %ld (%ld); entitlement: %@; invitationIdentifier: %@; partnerIdentifier: %@; pairedReaderIdentifier: %@; brandIdentifier: %@; endpointIdentifier: %@; isOnlineImmobilizerToken: %d; sharing config: %@; shared info: %@ (%@); appletIdentifier: %@; paymentNetwork: %lu; readerIdentifier: %@; key supports: %@; vehicle supports: %@; vehicle version: %@; server version: %@; key class: %@; CA type: %@; aliroGroupResolvingKeys: [%@];>",
    v32,
    self,
    v31,
    credentialState,
    entitlement,
    invitationIdentifier,
    partnerIdentifier,
    pairedReaderIdentifier,
    brandIdentifier,
    endpointIdentifier,
    isOnlineImmobilizerToken,
    sharingConfiguration,
    originatorIDSHandle,
    sharingSessionIdentifier,
    appletIdentifier,
    credentialType,
    readerIdentifier,
    v10,
    v11,
    v12,
    v13,
    v15,
    v18,
  uint64_t v19 = v34);

  return v19;
}

uint64_t __36__PKAppletSubcredential_description__block_invoke(uint64_t a1, void *a2)
{
  return [a2 hexEncoding];
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_identifier];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    identifier = self->_identifier;
    uint64_t v6 = (NSString *)v4[2];
    if (identifier && v6) {
      char v7 = -[NSString isEqual:](identifier, "isEqual:");
    }
    else {
      char v7 = identifier == v6;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_int64_t state = a3;
}

- (PKPassEntitlement)entitlement
{
  return self->_entitlement;
}

- (void)setEntitlement:(id)a3
{
}

- (int64_t)credentialType
{
  return self->_credentialType;
}

- (void)setCredentialType:(int64_t)a3
{
  self->_int64_t credentialType = a3;
}

- (PKAppletSubcredentialSharingConfirguration)sharingConfiguration
{
  return self->_sharingConfiguration;
}

- (void)setSharingConfiguration:(id)a3
{
}

- (NSString)invitationIdentifier
{
  return self->_invitationIdentifier;
}

- (void)setInvitationIdentifier:(id)a3
{
}

- (NSString)partnerIdentifier
{
  return self->_partnerIdentifier;
}

- (void)setPartnerIdentifier:(id)a3
{
}

- (void)setPairedReaderIdentifier:(id)a3
{
}

- (NSString)brandIdentifier
{
  return self->_brandIdentifier;
}

- (void)setBrandIdentifier:(id)a3
{
}

- (BOOL)isOnlineImmobilizerToken
{
  return self->_isOnlineImmobilizerToken;
}

- (void)setIsOnlineImmobilizerToken:(BOOL)a3
{
  self->_BOOL isOnlineImmobilizerToken = a3;
}

- (void)setSupportedRadioTechnologies:(unint64_t)a3
{
  self->_supportedRadioTechnologies = a3;
}

- (unint64_t)allSupportedRadioTechnologies
{
  return self->_allSupportedRadioTechnologies;
}

- (void)setAllSupportedRadioTechnologies:(unint64_t)a3
{
  self->_uint64_t allSupportedRadioTechnologies = a3;
}

- (NSString)endpointIdentifier
{
  return self->_endpointIdentifier;
}

- (void)setEndpointIdentifier:(id)a3
{
}

- (NSUUID)sharingSessionIdentifier
{
  return self->_sharingSessionIdentifier;
}

- (void)setSharingSessionIdentifier:(id)a3
{
}

- (NSString)originatorIDSHandle
{
  return self->_originatorIDSHandle;
}

- (void)setOriginatorIDSHandle:(id)a3
{
}

- (NSString)isoFormat
{
  return self->_isoFormat;
}

- (void)setIsoFormat:(id)a3
{
}

- (NSSet)aliroGroupResolvingKeys
{
  return self->_aliroGroupResolvingKeys;
}

- (void)setAliroGroupResolvingKeys:(id)a3
{
}

- (unint64_t)credentialState
{
  return self->_credentialState;
}

- (void)setCredentialState:(unint64_t)a3
{
  self->_unint64_t credentialState = a3;
}

- (PKSubcredentialEncryptedContainer)trackingRequest
{
  return self->_trackingRequest;
}

- (void)setTrackingRequest:(id)a3
{
}

- (NSData)transactionKey
{
  return self->_transactionKey;
}

- (void)setTransactionKey:(id)a3
{
}

- (NSArray)transactionKeyCertificateChain
{
  return self->_transactionKeyCertificateChain;
}

- (void)setTransactionKeyCertificateChain:(id)a3
{
}

- (void)setReaderIdentifier:(id)a3
{
}

- (NSString)appletIdentifier
{
  return self->_appletIdentifier;
}

- (void)setAppletIdentifier:(id)a3
{
}

- (unint64_t)carKeyVehicleVersion
{
  return self->_carKeyVehicleVersion;
}

- (void)setCarKeyVehicleVersion:(unint64_t)a3
{
  self->_carKeyVehicleVersion = a3;
}

- (unint64_t)carKeyServerVersion
{
  return self->_carKeyServerVersion;
}

- (void)setCarKeyServerVersion:(unint64_t)a3
{
  self->_carKeyServerVersion = a3;
}

- (unint64_t)keyClass
{
  return self->_keyClass;
}

- (void)setKeyClass:(unint64_t)a3
{
  self->_unint64_t keyClass = a3;
}

- (unint64_t)credentialAuthorityType
{
  return self->_credentialAuthorityType;
}

- (void)setCredentialAuthorityType:(unint64_t)a3
{
  self->_unint64_t credentialAuthorityType = a3;
}

@end