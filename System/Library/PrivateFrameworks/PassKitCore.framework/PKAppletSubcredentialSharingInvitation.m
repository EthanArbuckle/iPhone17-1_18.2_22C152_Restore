@interface PKAppletSubcredentialSharingInvitation
+ (BOOL)supportsSecureCoding;
+ (id)invitationFromShare:(id)a3 entitlement:(id)a4 withCredential:(id)a5 pass:(id)a6;
- (BOOL)canBeSent;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToInvitation:(id)a3;
- (BOOL)isForWatch;
- (BOOL)isSameInvitationAsInvitation:(id)a3;
- (BOOL)isThirdPartyCrossPlatformInvitation;
- (NSString)activationCode;
- (NSString)brandIdentifier;
- (NSString)deviceModel;
- (NSString)identifier;
- (NSString)issuer;
- (NSString)manufacturerIdentifier;
- (NSString)originatorIDSHandle;
- (NSString)pairedReaderIdentifier;
- (NSString)partnerIdentifier;
- (NSString)recipientName;
- (NSUUID)sharingSessionIdentifier;
- (PKAppletSubcredentialSharingInvitation)initWithCoder:(id)a3;
- (PKAppletSubcredentialSharingInvitation)initWithCrossPlatformInvitation:(id)a3;
- (PKAppletSubcredentialSharingInvitation)initWithIdentifier:(id)a3 sharingSessionIdentifier:(id)a4 originatorIDSHandle:(id)a5 invitationData:(id)a6;
- (PKAppletSubcredentialSharingInvitation)initWithPartnerIdentifier:(id)a3 brandIdentifier:(id)a4 pairedReaderIdentifier:(id)a5 recipientName:(id)a6 entitlement:(unint64_t)a7 supportedRadioTechnologies:(unint64_t)a8;
- (PKSharingCarKeyInvitation)originalInvitationMessage;
- (id)addCarKeyPassConfiguration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataRepresentation;
- (id)description;
- (id)invitationRequestRepresentation;
- (id)sharingConfigurationRepresentation;
- (unint64_t)entitlement;
- (unint64_t)hash;
- (unint64_t)supportedRadioTechnologies;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setActivationCode:(id)a3;
- (void)setBrandIdentifier:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setEntitlement:(unint64_t)a3;
- (void)setForWatch:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIssuer:(id)a3;
- (void)setOriginalInvitationMessage:(id)a3;
- (void)setOriginatorIDSHandle:(id)a3;
- (void)setPairedReaderIdentifier:(id)a3;
- (void)setPartnerIdentifier:(id)a3;
- (void)setRecipientName:(id)a3;
- (void)setSharingSessionIdentifier:(id)a3;
- (void)setSupportedRadioTechnologies:(unint64_t)a3;
@end

@implementation PKAppletSubcredentialSharingInvitation

- (PKAppletSubcredentialSharingInvitation)initWithPartnerIdentifier:(id)a3 brandIdentifier:(id)a4 pairedReaderIdentifier:(id)a5 recipientName:(id)a6 entitlement:(unint64_t)a7 supportedRadioTechnologies:(unint64_t)a8
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v18 = v17;
  if (v14 && v16 && v17)
  {
    v27.receiver = self;
    v27.super_class = (Class)PKAppletSubcredentialSharingInvitation;
    v19 = [(PKAppletSubcredentialSharingInvitation *)&v27 init];
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_partnerIdentifier, a3);
      objc_storeStrong((id *)&v20->_brandIdentifier, a4);
      objc_storeStrong((id *)&v20->_pairedReaderIdentifier, a5);
      objc_storeStrong((id *)&v20->_recipientName, a6);
      v20->_entitlement = a7;
      v20->_supportedRadioTechnologies = a8;
      v20->_type = 0;
    }
    self = v20;
    v21 = self;
  }
  else
  {
    v22 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      v29 = v23;
      _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "Invalid parameters in %@", buf, 0xCu);
    }
    v21 = 0;
  }

  return v21;
}

- (PKAppletSubcredentialSharingInvitation)initWithIdentifier:(id)a3 sharingSessionIdentifier:(id)a4 originatorIDSHandle:(id)a5 invitationData:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v12)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    id v16 = (PKProtobufAppletSubcredentialSharingInvitation *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v16->super.super, OS_LOG_TYPE_DEFAULT))
    {
      v36 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      v43 = (PKProtobufAppletSubcredentialSharingInvitation *)v36;
      v37 = "Invalid parameters in %@ - bad identifier";
      p_super = &v16->super.super;
      goto LABEL_25;
    }
LABEL_27:
    v39 = 0;
    goto LABEL_28;
  }
  id v16 = [[PKProtobufAppletSubcredentialSharingInvitation alloc] initWithData:v15];
  if (!v16) {
    goto LABEL_27;
  }
  v41.receiver = self;
  v41.super_class = (Class)PKAppletSubcredentialSharingInvitation;
  id v17 = [(PKAppletSubcredentialSharingInvitation *)&v41 init];
  self = v17;
  if (v17)
  {
    p_sharingSessionIdentifier = (void **)&v17->_sharingSessionIdentifier;
    objc_storeStrong((id *)&v17->_sharingSessionIdentifier, a4);
    objc_storeStrong((id *)&self->_originatorIDSHandle, a5);
    [(PKProtobufAppletSubcredentialSharingInvitation *)v16 version];
    objc_storeStrong((id *)&self->_identifier, a3);
    v19 = [(PKProtobufAppletSubcredentialSharingInvitation *)v16 partnerIdentifier];
    partnerIdentifier = self->_partnerIdentifier;
    self->_partnerIdentifier = v19;

    v21 = [(PKProtobufAppletSubcredentialSharingInvitation *)v16 brandIdentifier];
    brandIdentifier = self->_brandIdentifier;
    self->_brandIdentifier = v21;

    v23 = [(PKProtobufAppletSubcredentialSharingInvitation *)v16 pairedReaderIdentifier];
    pairedReaderIdentifier = self->_pairedReaderIdentifier;
    self->_pairedReaderIdentifier = v23;

    v25 = [(PKProtobufAppletSubcredentialSharingInvitation *)v16 recipientName];
    recipientName = self->_recipientName;
    self->_recipientName = v25;

    if ([(PKProtobufAppletSubcredentialSharingInvitation *)v16 hasSharingSessionIdentifier])
    {
      objc_super v27 = [(PKProtobufAppletSubcredentialSharingInvitation *)v16 sharingSessionIdentifier];
      if ([v27 length] == 16)
      {
        uint64_t v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", objc_msgSend(v27, "bytes"));
        v29 = *p_sharingSessionIdentifier;
        *p_sharingSessionIdentifier = (void *)v28;
      }
      if (!*p_sharingSessionIdentifier)
      {
        uint64_t v30 = PKLogFacilityTypeGetObject(0x16uLL);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190E10000, v30, OS_LOG_TYPE_DEFAULT, "Received malformed sharing session identifier on invitation!", buf, 2u);
        }
      }
    }
    self->_entitlement = [(PKProtobufAppletSubcredentialSharingInvitation *)v16 entitlement];
    self->_forWatch = [(PKProtobufAppletSubcredentialSharingInvitation *)v16 deviceType] == 1;
    v31 = [(PKProtobufAppletSubcredentialSharingInvitation *)v16 issuer];
    issuer = self->_issuer;
    self->_issuer = v31;

    v33 = [(PKProtobufAppletSubcredentialSharingInvitation *)v16 deviceModel];
    deviceModel = self->_deviceModel;
    self->_deviceModel = v33;

    if ([(PKProtobufAppletSubcredentialSharingInvitation *)v16 supportedRadioTechnologies]) {
      unint64_t v35 = [(PKProtobufAppletSubcredentialSharingInvitation *)v16 supportedRadioTechnologies];
    }
    else {
      unint64_t v35 = 1;
    }
    self->_supportedRadioTechnologies = v35;
    if (self->_partnerIdentifier && self->_pairedReaderIdentifier && self->_issuer && self->_deviceModel)
    {
      self->_type = 0;
      goto LABEL_22;
    }
    v36 = PKLogFacilityTypeGetObject(0x16uLL);
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = 138412290;
    v43 = v16;
    v37 = "Invalid invitation data to deserialize the invitation from: %@";
    p_super = v36;
LABEL_25:
    _os_log_impl(&dword_190E10000, p_super, OS_LOG_TYPE_DEFAULT, v37, buf, 0xCu);
LABEL_26:

    goto LABEL_27;
  }
LABEL_22:
  self = self;
  v39 = self;
LABEL_28:

  return v39;
}

+ (id)invitationFromShare:(id)a3 entitlement:(id)a4 withCredential:(id)a5 pass:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v12 partnerIdentifier];
  id v15 = [v12 pairedReaderIdentifier];
  uint64_t v16 = [v10 recipientNickname];
  id v17 = (void *)v16;
  if (!v14)
  {
    v33 = PKLogFacilityTypeGetObject(0x16uLL);
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 138412290;
    id v41 = v10;
    v34 = "Invalid state of credential (%@) to create invitation from: missing partnerIdentifier";
LABEL_19:
    _os_log_impl(&dword_190E10000, v33, OS_LOG_TYPE_DEFAULT, v34, buf, 0xCu);
    goto LABEL_20;
  }
  if (!v15)
  {
    v33 = PKLogFacilityTypeGetObject(0x16uLL);
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 138412290;
    id v41 = v10;
    v34 = "Invalid state of credential (%@) to create invitation from: missing pairedReaderIdentifier";
    goto LABEL_19;
  }
  if (!v16)
  {
    v33 = PKLogFacilityTypeGetObject(0x16uLL);
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 138412290;
    id v41 = v10;
    v34 = "Invalid state of shared credential (%@) to create invitation from: missing recipientName";
    goto LABEL_19;
  }
  if (!v11)
  {
    v33 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v10;
      v34 = "Invalid state of shared credential (%@) to create invitation from: missing entitlement";
      goto LABEL_19;
    }
LABEL_20:

    v21 = 0;
    goto LABEL_21;
  }
  id v18 = objc_alloc((Class)a1);
  v19 = [v12 brandIdentifier];
  id v39 = v11;
  v20 = [v11 value];
  v21 = objc_msgSend(v18, "initWithPartnerIdentifier:brandIdentifier:pairedReaderIdentifier:recipientName:entitlement:supportedRadioTechnologies:", v14, v19, v15, v17, objc_msgSend(v20, "unsignedIntegerValue"), objc_msgSend(v12, "supportedRadioTechnologies"));

  v22 = [v10 uuidIdentifier];
  [v21 setSharingSessionIdentifier:v22];

  v23 = [v13 organizationName];
  v24 = [v13 localizedDescription];
  v25 = v24;
  if (v24)
  {
    unint64_t v26 = [v24 length];
    uint64_t v27 = [v23 length];
    uint64_t v28 = v23;
    if (v26 > v27 + 1)
    {
      uint64_t v29 = v27;
      uint64_t v37 = v27 + 1;
      v38 = v28;
      if (objc_msgSend(v25, "hasPrefix:"))
      {
        uint64_t v30 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        int v31 = objc_msgSend(v30, "characterIsMember:", objc_msgSend(v25, "characterAtIndex:", v29));

        if (v31)
        {
          uint64_t v32 = [v25 substringFromIndex:v37];

          v25 = (void *)v32;
        }
      }
      v23 = v38;
    }
  }
  v36 = [v13 organizationName];
  [v21 setIssuer:v36];

  [v21 setDeviceModel:v25];
  v21[13] = 0;

  id v11 = v39;
LABEL_21:

  return v21;
}

- (PKAppletSubcredentialSharingInvitation)initWithCrossPlatformInvitation:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PKAppletSubcredentialSharingInvitation;
  v6 = [(PKAppletSubcredentialSharingInvitation *)&v24 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = 1;
    uint64_t v8 = [v5 shareIdentifier];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    uint64_t v10 = [v5 vehicleModel];
    deviceModel = v7->_deviceModel;
    v7->_deviceModel = (NSString *)v10;

    uint64_t v12 = [v5 vehicleIssuer];
    issuer = v7->_issuer;
    v7->_issuer = (NSString *)v12;

    v7->_supportedRadioTechnologies = [v5 radioTechnology];
    uint64_t v14 = [v5 readerIdentifier];
    pairedReaderIdentifier = v7->_pairedReaderIdentifier;
    v7->_pairedReaderIdentifier = (NSString *)v14;

    uint64_t v16 = [v5 brandIdentifier];
    brandIdentifier = v7->_brandIdentifier;
    v7->_brandIdentifier = (NSString *)v16;

    uint64_t v18 = [v5 partnerIdentifier];
    partnerIdentifier = v7->_partnerIdentifier;
    v7->_partnerIdentifier = (NSString *)v18;

    v20 = [v5 shareSessionIdentifier];
    if (v20)
    {
      uint64_t v21 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v20];
      sharingSessionIdentifier = v7->_sharingSessionIdentifier;
      v7->_sharingSessionIdentifier = (NSUUID *)v21;
    }
    objc_storeStrong((id *)&v7->_originalInvitationMessage, a3);
  }
  return v7;
}

- (BOOL)isThirdPartyCrossPlatformInvitation
{
  if (self->_type != 1) {
    return 0;
  }
  v2 = [(PKSharingCarKeyInvitation *)self->_originalInvitationMessage proprietaryData];
  BOOL v3 = v2 == 0;

  return v3;
}

- (id)dataRepresentation
{
  v8[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_alloc_init(PKProtobufAppletSubcredentialSharingInvitation);
  [(PKProtobufAppletSubcredentialSharingInvitation *)v3 setVersion:0];
  if (self->_identifier) {
    -[PKProtobufAppletSubcredentialSharingInvitation setIdentifier:](v3, "setIdentifier:");
  }
  if (self->_partnerIdentifier) {
    -[PKProtobufAppletSubcredentialSharingInvitation setPartnerIdentifier:](v3, "setPartnerIdentifier:");
  }
  if (self->_brandIdentifier) {
    -[PKProtobufAppletSubcredentialSharingInvitation setBrandIdentifier:](v3, "setBrandIdentifier:");
  }
  if (self->_pairedReaderIdentifier) {
    -[PKProtobufAppletSubcredentialSharingInvitation setPairedReaderIdentifier:](v3, "setPairedReaderIdentifier:");
  }
  if (self->_recipientName) {
    -[PKProtobufAppletSubcredentialSharingInvitation setRecipientName:](v3, "setRecipientName:");
  }
  [(PKProtobufAppletSubcredentialSharingInvitation *)v3 setEntitlement:LODWORD(self->_entitlement)];
  sharingSessionIdentifier = self->_sharingSessionIdentifier;
  if (sharingSessionIdentifier)
  {
    v8[0] = 0;
    v8[1] = 0;
    [(NSUUID *)sharingSessionIdentifier getUUIDBytes:v8];
    id v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v8 length:16];
    [(PKProtobufAppletSubcredentialSharingInvitation *)v3 setSharingSessionIdentifier:v5];
  }
  [(PKProtobufAppletSubcredentialSharingInvitation *)v3 setDeviceType:self->_forWatch];
  if (self->_deviceModel) {
    -[PKProtobufAppletSubcredentialSharingInvitation setDeviceModel:](v3, "setDeviceModel:");
  }
  if (self->_issuer) {
    -[PKProtobufAppletSubcredentialSharingInvitation setIssuer:](v3, "setIssuer:");
  }
  if (self->_supportedRadioTechnologies) {
    -[PKProtobufAppletSubcredentialSharingInvitation setSupportedRadioTechnologies:](v3, "setSupportedRadioTechnologies:");
  }
  v6 = [(PKProtobufAppletSubcredentialSharingInvitation *)v3 data];

  return v6;
}

- (id)sharingConfigurationRepresentation
{
  if (self->_forWatch) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  id v4 = objc_alloc(MEMORY[0x1E4F5F4E0]);
  unint64_t entitlement = self->_entitlement;
  recipientName = self->_recipientName;
  v7 = [(PKAppletSubcredentialSharingInvitation *)self dataRepresentation];
  uint64_t v8 = (void *)[v4 initWithProfile:entitlement displayName:recipientName metaData:v7 targetDeviceType:v3];

  return v8;
}

- (id)invitationRequestRepresentation
{
  if (self->_originatorIDSHandle)
  {
    if (self->_sharingSessionIdentifier)
    {
      v2 = (void *)[objc_alloc(MEMORY[0x1E4F5F4D8]) initWithSharingSessionIdentifier:self->_sharingSessionIdentifier ownerIdsIdentifier:self->_originatorIDSHandle];
      goto LABEL_10;
    }
    uint64_t v3 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v7 = 0;
      id v4 = "Missing session handle while creating invitation request";
      id v5 = (uint8_t *)&v7;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v3 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = 0;
      id v4 = "Missing originator IDS handle while creating invitation request";
      id v5 = (uint8_t *)&v8;
LABEL_8:
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
    }
  }

  v2 = 0;
LABEL_10:
  return v2;
}

- (BOOL)isSameInvitationAsInvitation:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  identifier = self->_identifier;
  if (identifier)
  {
    __int16 v7 = [v4 identifier];
    LOBYTE(v8) = [(NSString *)identifier isEqualToString:v7];
  }
  else
  {
    pairedReaderIdentifier = self->_pairedReaderIdentifier;
    if (pairedReaderIdentifier
      && ([v4 pairedReaderIdentifier],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          BOOL v11 = [(NSString *)pairedReaderIdentifier isEqualToString:v10],
          v10,
          !v11))
    {
      LOBYTE(v8) = 0;
    }
    else
    {
      sharingSessionIdentifier = self->_sharingSessionIdentifier;
      if (!sharingSessionIdentifier
        || ([v5 sharingSessionIdentifier],
            id v13 = objc_claimAutoreleasedReturnValue(),
            int v8 = [(NSUUID *)sharingSessionIdentifier isEqual:v13],
            v13,
            v8))
      {
        LOBYTE(v8) = 1;
      }
    }
  }

  return v8;
}

- (BOOL)canBeSent
{
  return self->_partnerIdentifier
      && self->_pairedReaderIdentifier
      && self->_recipientName
      && self->_issuer
      && self->_deviceModel != 0;
}

- (id)addCarKeyPassConfiguration
{
  uint64_t v3 = objc_alloc_init(PKAddCarKeyPassConfiguration);
  [(PKAddCarKeyPassConfiguration *)v3 setSupportedRadioTechnologies:self->_supportedRadioTechnologies];
  id v4 = self->_brandIdentifier;
  uint64_t v5 = [(PKAppletSubcredentialSharingInvitation *)self manufacturerIdentifier];
  v6 = (void *)v5;
  if (v4) {
    uint64_t v7 = (uint64_t)v4;
  }
  else {
    uint64_t v7 = v5;
  }
  [(PKAddSecureElementPassConfiguration *)v3 setIssuerIdentifier:v7];
  [(PKAddCarKeyPassConfiguration *)v3 setManufacturerIdentifier:v6];
  [(PKAddCarKeyPassConfiguration *)v3 setPairedReaderIdentifier:self->_pairedReaderIdentifier];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKAppletSubcredentialSharingInvitation *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKAppletSubcredentialSharingInvitation *)self isEqualToInvitation:v5];

  return v6;
}

- (BOOL)isEqualToInvitation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKAppletSubcredentialSharingInvitation *)self identifier];
  BOOL v6 = [v4 identifier];

  if (v5 && v6) {
    char v7 = [v5 isEqual:v6];
  }
  else {
    char v7 = v5 == v6;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(PKAppletSubcredentialSharingInvitation *)self identifier];
  unint64_t v3 = [v2 hash] + 527;

  return v3;
}

- (id)description
{
  unint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  BOOL v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  char v7 = [(PKAppletSubcredentialSharingInvitation *)self identifier];
  [v6 appendFormat:@"identifier: '%@'; ", v7];

  [v6 appendFormat:@"partner ID: '%@'; ", self->_partnerIdentifier];
  [v6 appendFormat:@"brand ID: '%@'; ", self->_brandIdentifier];
  [v6 appendFormat:@"reader ID: '%@'; ", self->_pairedReaderIdentifier];
  [v6 appendFormat:@"session ID: '%@'; ", self->_sharingSessionIdentifier];
  [v6 appendFormat:@"recipientName: '%@'; ", self->_recipientName];
  [v6 appendFormat:@"issuer: '%@'; ", self->_issuer];
  [v6 appendFormat:@"model: '%@'; ", self->_deviceModel];
  objc_msgSend(v6, "appendFormat:", @"managementEnabled: '%lu'; ", self->_supportedRadioTechnologies);
  objc_msgSend(v6, "appendFormat:", @"type: '%lu'; ", self->_type);
  [v6 appendFormat:@"originalInvitationMessage: '%@'; ", self->_originalInvitationMessage];
  [v6 appendFormat:@">"];
  int v8 = [NSString stringWithString:v6];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_partnerIdentifier forKey:@"partnerIdentifier"];
  [v5 encodeObject:self->_brandIdentifier forKey:@"brandIdentifier"];
  [v5 encodeObject:self->_pairedReaderIdentifier forKey:@"pairedReaderIdentifier"];
  [v5 encodeObject:self->_recipientName forKey:@"recipientName"];
  [v5 encodeObject:self->_sharingSessionIdentifier forKey:@"sharingSessionIdentifier"];
  [v5 encodeInteger:self->_entitlement forKey:@"entitlement"];
  [v5 encodeInteger:self->_forWatch forKey:@"forWatch"];
  [v5 encodeObject:self->_issuer forKey:@"issuer"];
  [v5 encodeObject:self->_deviceModel forKey:@"deviceModel"];
  [v5 encodeObject:self->_originatorIDSHandle forKey:@"originatorIDSHandle"];
  [v5 encodeInteger:self->_supportedRadioTechnologies forKey:@"supportedRadioTechnologies"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeObject:self->_originalInvitationMessage forKey:@"invitationMessageIdentifier"];
  [v5 encodeObject:self->_activationCode forKey:@"activationCode"];
}

- (PKAppletSubcredentialSharingInvitation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PKAppletSubcredentialSharingInvitation *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"partnerIdentifier"];
    partnerIdentifier = v5->_partnerIdentifier;
    v5->_partnerIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"brandIdentifier"];
    brandIdentifier = v5->_brandIdentifier;
    v5->_brandIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pairedReaderIdentifier"];
    pairedReaderIdentifier = v5->_pairedReaderIdentifier;
    v5->_pairedReaderIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipientName"];
    recipientName = v5->_recipientName;
    v5->_recipientName = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharingSessionIdentifier"];
    sharingSessionIdentifier = v5->_sharingSessionIdentifier;
    v5->_sharingSessionIdentifier = (NSUUID *)v16;

    v5->_unint64_t entitlement = [v4 decodeIntegerForKey:@"entitlement"];
    v5->_forWatch = [v4 decodeIntegerForKey:@"forWatch"] != 0;
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"issuer"];
    issuer = v5->_issuer;
    v5->_issuer = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceModel"];
    deviceModel = v5->_deviceModel;
    v5->_deviceModel = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originatorIDSHandle"];
    originatorIDSHandle = v5->_originatorIDSHandle;
    v5->_originatorIDSHandle = (NSString *)v22;

    v5->_supportedRadioTechnologies = [v4 decodeIntegerForKey:@"supportedRadioTechnologies"];
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"invitationMessageIdentifier"];
    originalInvitationMessage = v5->_originalInvitationMessage;
    v5->_originalInvitationMessage = (PKSharingCarKeyInvitation *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activationCode"];
    activationCode = v5->_activationCode;
    v5->_activationCode = (NSString *)v26;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setIdentifier:self->_identifier];
  [v4 setPartnerIdentifier:self->_partnerIdentifier];
  [v4 setBrandIdentifier:self->_brandIdentifier];
  [v4 setPairedReaderIdentifier:self->_pairedReaderIdentifier];
  [v4 setRecipientName:self->_recipientName];
  [v4 setSharingSessionIdentifier:self->_sharingSessionIdentifier];
  [v4 setEntitlement:self->_entitlement];
  [v4 setIssuer:self->_issuer];
  [v4 setDeviceModel:self->_deviceModel];
  [v4 setForWatch:self->_forWatch];
  [v4 setOriginatorIDSHandle:self->_originatorIDSHandle];
  [v4 setSupportedRadioTechnologies:self->_supportedRadioTechnologies];
  v4[13] = self->_type;
  [v4 setOriginalInvitationMessage:self->_originalInvitationMessage];
  return v4;
}

- (NSString)manufacturerIdentifier
{
  v2 = [(NSString *)self->_partnerIdentifier componentsSeparatedByString:@"."];
  if ((unint64_t)[v2 count] < 2)
  {
    unint64_t v3 = 0;
  }
  else
  {
    unint64_t v3 = [v2 objectAtIndexedSubscript:1];
  }

  return (NSString *)v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)originatorIDSHandle
{
  return self->_originatorIDSHandle;
}

- (void)setOriginatorIDSHandle:(id)a3
{
}

- (NSString)partnerIdentifier
{
  return self->_partnerIdentifier;
}

- (void)setPartnerIdentifier:(id)a3
{
}

- (NSString)brandIdentifier
{
  return self->_brandIdentifier;
}

- (void)setBrandIdentifier:(id)a3
{
}

- (NSString)pairedReaderIdentifier
{
  return self->_pairedReaderIdentifier;
}

- (void)setPairedReaderIdentifier:(id)a3
{
}

- (NSString)recipientName
{
  return self->_recipientName;
}

- (void)setRecipientName:(id)a3
{
}

- (NSUUID)sharingSessionIdentifier
{
  return self->_sharingSessionIdentifier;
}

- (void)setSharingSessionIdentifier:(id)a3
{
}

- (unint64_t)entitlement
{
  return self->_entitlement;
}

- (void)setEntitlement:(unint64_t)a3
{
  self->_unint64_t entitlement = a3;
}

- (NSString)issuer
{
  return self->_issuer;
}

- (void)setIssuer:(id)a3
{
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
}

- (BOOL)isForWatch
{
  return self->_forWatch;
}

- (void)setForWatch:(BOOL)a3
{
  self->_forWatch = a3;
}

- (unint64_t)supportedRadioTechnologies
{
  return self->_supportedRadioTechnologies;
}

- (void)setSupportedRadioTechnologies:(unint64_t)a3
{
  self->_supportedRadioTechnologies = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (PKSharingCarKeyInvitation)originalInvitationMessage
{
  return self->_originalInvitationMessage;
}

- (void)setOriginalInvitationMessage:(id)a3
{
}

- (NSString)activationCode
{
  return self->_activationCode;
}

- (void)setActivationCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationCode, 0);
  objc_storeStrong((id *)&self->_originalInvitationMessage, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_issuer, 0);
  objc_storeStrong((id *)&self->_sharingSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_recipientName, 0);
  objc_storeStrong((id *)&self->_pairedReaderIdentifier, 0);
  objc_storeStrong((id *)&self->_brandIdentifier, 0);
  objc_storeStrong((id *)&self->_partnerIdentifier, 0);
  objc_storeStrong((id *)&self->_originatorIDSHandle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end