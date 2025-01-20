@interface PKPaymentCredential
+ (BOOL)supportsSecureCoding;
+ (id)fakeRemoteCredentials;
- (BOOL)_isEqualToCredential:(id)a3;
- (BOOL)couldSupportSuperEasyProvisioning;
- (BOOL)isAccountCredential;
- (BOOL)isAccountReferenceCredential;
- (BOOL)isAppleBalanceCredential;
- (BOOL)isCarKeyTerminalPairingCredential;
- (BOOL)isContactlessProductCredential;
- (BOOL)isDeletable;
- (BOOL)isDigitalIssuanceProductCredential;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExternalOfferCredential;
- (BOOL)isHomeKeyCredential;
- (BOOL)isIdentityCredential;
- (BOOL)isIssuerProvisioningExtensionCredential;
- (BOOL)isLocalAppletSubcredentialPassCredential;
- (BOOL)isLocalPassCredential;
- (BOOL)isPeerPaymentCredential;
- (BOOL)isPrecursorCredential;
- (BOOL)isPurchasedProductCredential;
- (BOOL)isRemoteCredential;
- (BOOL)isSafariCredential;
- (BOOL)isShareableCredential;
- (BOOL)isStatefulTransferCredential;
- (BOOL)supportsSuperEasyProvisioning;
- (NSArray)appletTypes;
- (NSArray)metadata;
- (NSArray)paymentApplications;
- (NSString)expiration;
- (NSString)longDescription;
- (NSString)sanitizedPrimaryAccountName;
- (NSString)sanitizedPrimaryAccountNumber;
- (NSString)secureElementReservationGroupIdentifier;
- (PKPaymentCredential)init;
- (PKPaymentCredential)initWithCoder:(id)a3;
- (PKPaymentEligibilityResponse)eligibilityResponse;
- (PKPaymentRequirementsResponse)requirementsResponse;
- (PKSecureElementProvisioningState)state;
- (id)_originalProvisioningDate;
- (id)accountCredential;
- (id)accountReferenceCredential;
- (id)appleBalanceCredential;
- (id)carKeyTerminalPairingCredential;
- (id)contactlessProductCredential;
- (id)detailDescriptionWithEnvironment:(unint64_t)a3;
- (id)digitalIssuanceProductCredential;
- (id)externalOfferCredential;
- (id)homeKeyCredential;
- (id)identityCredential;
- (id)issuerProvisioningExtensionCredential;
- (id)localAppletSubcredentialPassCredential;
- (id)localPassCredential;
- (id)peerPaymentCredential;
- (id)precursorCredential;
- (id)purchasedProductCredential;
- (id)remoteCredential;
- (id)safariCredential;
- (id)setupProductIdentifier;
- (id)shareableCredential;
- (id)statefulTransferCredential;
- (id)underlyingPaymentPass;
- (int64_t)cardType;
- (int64_t)compare:(id)a3 withBackedUpDefaultPaymentPassSerialNumber:(id)a4;
- (int64_t)credentialType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAppletTypes:(id)a3;
- (void)setCardType:(int64_t)a3;
- (void)setCredentialType:(int64_t)a3;
- (void)setDeletable:(BOOL)a3;
- (void)setEligibilityResponse:(id)a3;
- (void)setExpiration:(id)a3;
- (void)setLongDescription:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setPaymentApplications:(id)a3;
- (void)setRequirementsResponse:(id)a3;
- (void)setSanitizedPrimaryAccountName:(id)a3;
- (void)setSanitizedPrimaryAccountNumber:(id)a3;
- (void)setSecureElementReservationGroupIdentifier:(id)a3;
- (void)setState:(id)a3;
@end

@implementation PKPaymentCredential

- (PKPaymentCredential)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentCredential;
  v2 = [(PKPaymentCredential *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(PKSecureElementProvisioningState);
    state = v2->_state;
    v2->_state = v3;
  }
  return v2;
}

- (PKPaymentCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentCredential;
  v5 = [(PKPaymentCredential *)&v19 init];
  if (v5)
  {
    v5->_credentialType = [v4 decodeIntegerForKey:@"credentialType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sanitizedPrimaryAccountNumber"];
    sanitizedPrimaryAccountNumber = v5->_sanitizedPrimaryAccountNumber;
    v5->_sanitizedPrimaryAccountNumber = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sanitizedPrimaryAccountName"];
    sanitizedPrimaryAccountName = v5->_sanitizedPrimaryAccountName;
    v5->_sanitizedPrimaryAccountName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expiration"];
    expiration = v5->_expiration;
    v5->_expiration = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"longDescription"];
    longDescription = v5->_longDescription;
    v5->_longDescription = (NSString *)v12;

    v5->_cardType = [v4 decodeIntegerForKey:@"cardType"];
    v5->_deletable = [v4 decodeBoolForKey:@"isDeletable"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secureElementReservationGroupIdentifier"];
    secureElementReservationGroupIdentifier = v5->_secureElementReservationGroupIdentifier;
    v5->_secureElementReservationGroupIdentifier = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
    state = v5->_state;
    v5->_state = (PKSecureElementProvisioningState *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t credentialType = self->_credentialType;
  id v5 = a3;
  [v5 encodeInteger:credentialType forKey:@"credentialType"];
  [v5 encodeObject:self->_sanitizedPrimaryAccountNumber forKey:@"sanitizedPrimaryAccountNumber"];
  [v5 encodeObject:self->_sanitizedPrimaryAccountName forKey:@"sanitizedPrimaryAccountName"];
  [v5 encodeObject:self->_expiration forKey:@"expiration"];
  [v5 encodeObject:self->_longDescription forKey:@"longDescription"];
  [v5 encodeInteger:self->_cardType forKey:@"cardType"];
  [v5 encodeBool:self->_deletable forKey:@"isDeletable"];
  [v5 encodeObject:self->_secureElementReservationGroupIdentifier forKey:@"secureElementReservationGroupIdentifier"];
  [v5 encodeObject:self->_state forKey:@"state"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPaymentCredential *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PKPaymentCredential *)self _isEqualToCredential:v4];
  }

  return v5;
}

- (BOOL)_isEqualToCredential:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)v4[6];
  uint64_t v6 = self->_longDescription;
  v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    uint64_t v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9) {
      goto LABEL_7;
    }
    BOOL v10 = [(NSString *)v6 isEqualToString:v7];

    if (!v10) {
      goto LABEL_33;
    }
  }
  if (self->_deletable != *((unsigned __int8 *)v4 + 8)) {
    goto LABEL_33;
  }
  v11 = (void *)v4[5];
  uint64_t v6 = self->_expiration;
  uint64_t v12 = v11;
  if (v6 == v12)
  {
  }
  else
  {
    uint64_t v8 = v12;
    if (!v6 || !v12) {
      goto LABEL_7;
    }
    BOOL v13 = [(NSString *)v6 isEqualToString:v12];

    if (!v13) {
      goto LABEL_33;
    }
  }
  uint64_t v14 = (void *)v4[3];
  uint64_t v6 = self->_sanitizedPrimaryAccountNumber;
  v15 = v14;
  if (v6 == v15)
  {

    goto LABEL_23;
  }
  uint64_t v8 = v15;
  if (!v6 || !v15)
  {
LABEL_7:

LABEL_33:
    char v22 = 0;
    goto LABEL_34;
  }
  BOOL v16 = [(NSString *)v6 isEqualToString:v15];

  if (!v16) {
    goto LABEL_33;
  }
LABEL_23:
  v17 = (void *)v4[4];
  uint64_t v6 = self->_sanitizedPrimaryAccountName;
  v18 = v17;
  if (v6 == v18)
  {

    goto LABEL_29;
  }
  uint64_t v8 = v18;
  if (!v6 || !v18) {
    goto LABEL_7;
  }
  BOOL v19 = [(NSString *)v6 isEqualToString:v18];

  if (!v19) {
    goto LABEL_33;
  }
LABEL_29:
  if (self->_cardType != v4[7]) {
    goto LABEL_33;
  }
  metadata = self->_metadata;
  v21 = (NSArray *)v4[8];
  if (metadata && v21) {
    char v22 = -[NSArray isEqual:](metadata, "isEqual:");
  }
  else {
    char v22 = metadata == v21;
  }
LABEL_34:

  return v22;
}

- (BOOL)supportsSuperEasyProvisioning
{
  return 0;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_longDescription];
  [v3 safelyAddObject:self->_expiration];
  [v3 safelyAddObject:self->_sanitizedPrimaryAccountNumber];
  [v3 safelyAddObject:self->_metadata];
  [v3 safelyAddObject:self->_sanitizedPrimaryAccountName];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_cardType - v4 + 32 * v4;
  unint64_t v6 = self->_deletable - v5 + 32 * v5;

  return v6;
}

- (id)detailDescriptionWithEnvironment:(unint64_t)a3
{
  return 0;
}

- (id)setupProductIdentifier
{
  return 0;
}

- (NSArray)appletTypes
{
  v2 = [(PKPaymentCredential *)self paymentApplications];
  v3 = objc_msgSend(v2, "pk_arrayByApplyingBlock:", &__block_literal_global_84);

  return (NSArray *)v3;
}

uint64_t __34__PKPaymentCredential_appletTypes__block_invoke(uint64_t a1, void *a2)
{
  return [a2 appletTypeIdentifier];
}

- (PKPaymentRequirementsResponse)requirementsResponse
{
  return [(PKSecureElementProvisioningState *)self->_state requirementsResponse];
}

- (void)setRequirementsResponse:(id)a3
{
}

- (PKPaymentEligibilityResponse)eligibilityResponse
{
  return [(PKSecureElementProvisioningState *)self->_state eligibilityResponse];
}

- (void)setEligibilityResponse:(id)a3
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

- (NSString)sanitizedPrimaryAccountNumber
{
  return self->_sanitizedPrimaryAccountNumber;
}

- (void)setSanitizedPrimaryAccountNumber:(id)a3
{
}

- (NSString)sanitizedPrimaryAccountName
{
  return self->_sanitizedPrimaryAccountName;
}

- (void)setSanitizedPrimaryAccountName:(id)a3
{
}

- (NSString)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(id)a3
{
}

- (NSString)longDescription
{
  return self->_longDescription;
}

- (void)setLongDescription:(id)a3
{
}

- (int64_t)cardType
{
  return self->_cardType;
}

- (void)setCardType:(int64_t)a3
{
  self->_cardType = a3;
}

- (BOOL)isDeletable
{
  return self->_deletable;
}

- (void)setDeletable:(BOOL)a3
{
  self->_deletable = a3;
}

- (NSArray)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (BOOL)couldSupportSuperEasyProvisioning
{
  return self->_couldSupportSuperEasyProvisioning;
}

- (NSArray)paymentApplications
{
  return self->_paymentApplications;
}

- (void)setPaymentApplications:(id)a3
{
}

- (void)setAppletTypes:(id)a3
{
}

- (NSString)secureElementReservationGroupIdentifier
{
  return self->_secureElementReservationGroupIdentifier;
}

- (void)setSecureElementReservationGroupIdentifier:(id)a3
{
}

- (PKSecureElementProvisioningState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_secureElementReservationGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_appletTypes, 0);
  objc_storeStrong((id *)&self->_paymentApplications, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_longDescription, 0);
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_sanitizedPrimaryAccountName, 0);
  objc_storeStrong((id *)&self->_sanitizedPrimaryAccountNumber, 0);
}

- (BOOL)isRemoteCredential
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)remoteCredential
{
  if ([(PKPaymentCredential *)self isRemoteCredential]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isPrecursorCredential
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)precursorCredential
{
  if ([(PKPaymentCredential *)self isPrecursorCredential]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isLocalPassCredential
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)localPassCredential
{
  if ([(PKPaymentCredential *)self isLocalPassCredential]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isPeerPaymentCredential
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)peerPaymentCredential
{
  if ([(PKPaymentCredential *)self isPeerPaymentCredential]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isContactlessProductCredential
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)contactlessProductCredential
{
  if ([(PKPaymentCredential *)self isContactlessProductCredential]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isDigitalIssuanceProductCredential
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)digitalIssuanceProductCredential
{
  if ([(PKPaymentCredential *)self isDigitalIssuanceProductCredential]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isPurchasedProductCredential
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)purchasedProductCredential
{
  if ([(PKPaymentCredential *)self isPurchasedProductCredential]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isAccountCredential
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)accountCredential
{
  if ([(PKPaymentCredential *)self isAccountCredential]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isAccountReferenceCredential
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)accountReferenceCredential
{
  if ([(PKPaymentCredential *)self isAccountReferenceCredential]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isShareableCredential
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)shareableCredential
{
  if ([(PKPaymentCredential *)self isShareableCredential]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isIdentityCredential
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)identityCredential
{
  if ([(PKPaymentCredential *)self isIdentityCredential]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isLocalAppletSubcredentialPassCredential
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)localAppletSubcredentialPassCredential
{
  if ([(PKPaymentCredential *)self isLocalAppletSubcredentialPassCredential]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isIssuerProvisioningExtensionCredential
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)issuerProvisioningExtensionCredential
{
  if ([(PKPaymentCredential *)self isIssuerProvisioningExtensionCredential]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isHomeKeyCredential
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)homeKeyCredential
{
  if ([(PKPaymentCredential *)self isHomeKeyCredential]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isSafariCredential
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)safariCredential
{
  if ([(PKPaymentCredential *)self isSafariCredential]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isCarKeyTerminalPairingCredential
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)carKeyTerminalPairingCredential
{
  if ([(PKPaymentCredential *)self isCarKeyTerminalPairingCredential]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (id)_originalProvisioningDate
{
  if ([(PKPaymentCredential *)self isRemoteCredential])
  {
    v3 = [(PKPaymentCredential *)self remoteCredential];
    uint64_t v4 = [v3 originalProvisioningDate];
LABEL_9:

    goto LABEL_10;
  }
  if ([(PKPaymentCredential *)self isAccountCredential]) {
    goto LABEL_7;
  }
  if ([(PKPaymentCredential *)self isPeerPaymentCredential])
  {
    int64_t v5 = [(PKPaymentCredential *)self peerPaymentCredential];
LABEL_8:
    v3 = v5;
    unint64_t v6 = [v5 account];
    uint64_t v4 = [v6 createdDate];

    goto LABEL_9;
  }
  if ([(PKPaymentCredential *)self isAccountCredential])
  {
LABEL_7:
    int64_t v5 = [(PKPaymentCredential *)self accountCredential];
    goto LABEL_8;
  }
  uint64_t v4 = 0;
LABEL_10:
  return v4;
}

- (int64_t)compare:(id)a3 withBackedUpDefaultPaymentPassSerialNumber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PKPaymentCredential *)self remoteCredential];
  BOOL v9 = [v8 serialNumber];
  char v10 = [v9 isEqualToString:v7];

  if (v10) {
    goto LABEL_3;
  }
  v11 = [(PKPaymentCredential *)self underlyingPaymentPass];
  uint64_t v12 = [v11 serialNumber];
  char v13 = [v12 isEqualToString:v7];

  if (v13) {
    goto LABEL_3;
  }
  BOOL v16 = [v6 remoteCredential];
  v17 = [v16 serialNumber];
  char v18 = [v17 isEqualToString:v7];

  if (v18)
  {
LABEL_6:
    int64_t v14 = 1;
    goto LABEL_4;
  }
  int v19 = __112__PKPaymentCredential_PKPaymentCredentialSubclassAdditions__compare_withBackedUpDefaultPaymentPassSerialNumber___block_invoke(self);
  int v20 = __112__PKPaymentCredential_PKPaymentCredentialSubclassAdditions__compare_withBackedUpDefaultPaymentPassSerialNumber___block_invoke(v6);
  if (!v19)
  {
    if (v20) {
      goto LABEL_6;
    }
    BOOL v26 = [(PKPaymentCredential *)self isPurchasedProductCredential];
    int v27 = [v6 isPurchasedProductCredential];
    if (v26)
    {
      if (!v27) {
        goto LABEL_3;
      }
      v28 = [(PKPaymentCredential *)self purchasedProductCredential];
      v29 = [v6 purchasedProductCredential];
      v30 = [v28 purchase];
      v31 = [v30 purchaseDate];
      v32 = [v29 purchase];
      v33 = [v32 purchaseDate];
      int64_t v14 = [v31 compare:v33];

      goto LABEL_18;
    }
    if (v27) {
      goto LABEL_6;
    }
    BOOL v36 = [(PKPaymentCredential *)self isIssuerProvisioningExtensionCredential];
    int v37 = [v6 isIssuerProvisioningExtensionCredential];
    if (!v36)
    {
      if (v37) {
        goto LABEL_6;
      }
      BOOL v41 = [(PKPaymentCredential *)self isSafariCredential];
      unsigned int v42 = [v6 isSafariCredential];
      if (!v41)
      {
        int64_t v14 = v42;
        goto LABEL_4;
      }
      if (!v42) {
        goto LABEL_3;
      }
      v28 = [(PKPaymentCredential *)self longDescription];
      v29 = [v6 longDescription];
      int64_t v14 = [v28 compare:v29];
LABEL_19:

      goto LABEL_4;
    }
    if (!v37) {
      goto LABEL_3;
    }
    v28 = [(PKPaymentCredential *)self issuerProvisioningExtensionCredential];
    v29 = [v6 issuerProvisioningExtensionCredential];
    v30 = [v28 entry];
    v31 = [v29 entry];
    v38 = [v30 title];
    uint64_t v39 = [v31 title];
    v40 = (void *)v39;
    if (v38 && v39)
    {
      int64_t v14 = [v38 compare:v39];
    }
    else
    {
      int64_t v14 = v39 != 0;
      if (v38)
      {
        int64_t v14 = -1;
        goto LABEL_60;
      }
    }
    if (!v14)
    {
      v43 = [v30 addRequestConfiguration];
      uint64_t v44 = [v43 primaryAccountSuffix];

      v38 = (void *)v44;
      v45 = [v31 addRequestConfiguration];
      uint64_t v46 = [v45 primaryAccountSuffix];

      if (v38 && v46)
      {
        int64_t v14 = [v38 compare:v46];
      }
      else
      {
        int64_t v14 = v46 != 0;
        if (v38)
        {
          int64_t v14 = -1;
LABEL_59:
          v40 = (void *)v46;
          goto LABEL_60;
        }
      }
      if (!v14)
      {
        if (v28 > v29) {
          int64_t v14 = -1;
        }
        else {
          int64_t v14 = v28 < v29;
        }
      }
      goto LABEL_59;
    }
LABEL_60:

LABEL_18:
    goto LABEL_19;
  }
  if (!v20) {
    goto LABEL_3;
  }
  int64_t v21 = [(PKPaymentCredential *)self cardType];
  uint64_t v22 = [v6 cardType];
  if (v21 == v22) {
    goto LABEL_10;
  }
  if (v21 && v22)
  {
    if (v21 >= v22)
    {
      if (v21 > v22) {
        goto LABEL_6;
      }
LABEL_10:
      uint64_t v23 = [(PKPaymentCredential *)self _originalProvisioningDate];
      uint64_t v24 = [v6 _originalProvisioningDate];
      v25 = (void *)v24;
      if (v23 && v24)
      {
        int64_t v14 = [(id)v23 compare:v24];
        if (v14)
        {
LABEL_30:

          goto LABEL_4;
        }
      }
      else
      {
        if (v23) {
          int64_t v14 = -1;
        }
        else {
          int64_t v14 = 1;
        }
        if (v23 | v24) {
          goto LABEL_30;
        }
      }
      v34 = [(PKPaymentCredential *)self longDescription];
      v35 = [v6 longDescription];
      int64_t v14 = [v34 compare:v35];

      goto LABEL_30;
    }
LABEL_3:
    int64_t v14 = -1;
    goto LABEL_4;
  }
  if (v21) {
    int64_t v14 = -1;
  }
  else {
    int64_t v14 = 1;
  }
  if (!(v22 | v21)) {
    goto LABEL_10;
  }
LABEL_4:

  return v14;
}

uint64_t __112__PKPaymentCredential_PKPaymentCredentialSubclassAdditions__compare_withBackedUpDefaultPaymentPassSerialNumber___block_invoke(void *a1)
{
  id v1 = a1;
  if (([v1 isRemoteCredential] & 1) != 0
    || ([v1 isAccountCredential] & 1) != 0
    || ([v1 isPeerPaymentCredential] & 1) != 0
    || ([v1 isAppleBalanceCredential] & 1) != 0
    || ([v1 isShareableCredential] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 isHomeKeyCredential];
  }

  return v2;
}

- (id)underlyingPaymentPass
{
  if ([(PKPaymentCredential *)self isRemoteCredential])
  {
    v3 = [(PKPaymentCredential *)self remoteCredential];
LABEL_15:
    id v6 = v3;
    uint64_t v8 = [v3 paymentPass];
    goto LABEL_16;
  }
  if ([(PKPaymentCredential *)self isPeerPaymentCredential])
  {
    uint64_t v4 = [(PKPaymentCredential *)self peerPaymentCredential];
    int64_t v5 = [v4 account];
    id v6 = [v5 associatedPassUniqueID];

    id v7 = +[PKPassLibrary sharedInstance];
    uint64_t v8 = [v7 passWithUniqueID:v6];

LABEL_16:
    goto LABEL_17;
  }
  if ([(PKPaymentCredential *)self isLocalAppletSubcredentialPassCredential])
  {
    v3 = [(PKPaymentCredential *)self localAppletSubcredentialPassCredential];
    goto LABEL_15;
  }
  if ([(PKPaymentCredential *)self isHomeKeyCredential])
  {
    v3 = [(PKPaymentCredential *)self homeKeyCredential];
    goto LABEL_15;
  }
  if ([(PKPaymentCredential *)self isLocalPassCredential])
  {
    v3 = [(PKPaymentCredential *)self localPassCredential];
    goto LABEL_15;
  }
  if ([(PKPaymentCredential *)self isAccountCredential])
  {
    v3 = [(PKPaymentCredential *)self accountCredential];
    goto LABEL_15;
  }
  if ([(PKPaymentCredential *)self isPrecursorCredential])
  {
    v3 = [(PKPaymentCredential *)self precursorCredential];
    goto LABEL_15;
  }
  uint64_t v8 = 0;
LABEL_17:
  return v8;
}

- (BOOL)isAppleBalanceCredential
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)appleBalanceCredential
{
  if ([(PKPaymentCredential *)self isAppleBalanceCredential]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isStatefulTransferCredential
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)statefulTransferCredential
{
  if ([(PKPaymentCredential *)self isStatefulTransferCredential]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isExternalOfferCredential
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)externalOfferCredential
{
  if ([(PKPaymentCredential *)self isExternalOfferCredential]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

+ (id)fakeRemoteCredentials
{
  v64[9] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  v63[0] = @"identifier";
  v63[1] = @"status";
  v64[0] = @"1234";
  v64[1] = &unk_1EE22BD80;
  v63[2] = @"cardType";
  v63[3] = @"sanitizedPrimaryAccountNumber";
  v64[2] = &unk_1EE22BD98;
  v64[3] = @"1234";
  v63[4] = @"expiration";
  v63[5] = @"longDescription";
  v64[4] = @"12/34";
  v64[5] = @"Suica Card - Available";
  v63[6] = @"summaryMetadata";
  v63[7] = @"paymentCardType";
  v64[6] = &unk_1EE22AFA0;
  v64[7] = @"transit";
  v63[8] = @"metadata";
  v64[8] = &unk_1EE22AFB8;
  v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:9];
  v3 = [[PKPaymentRemoteCredential alloc] initWithDictionary:v45];
  [v2 addObject:v3];

  v61[0] = @"identifier";
  v61[1] = @"status";
  v62[0] = @"5678";
  v62[1] = &unk_1EE22BD80;
  v61[2] = @"cardType";
  v61[3] = @"paymentCardType";
  v62[2] = &unk_1EE22BD98;
  v62[3] = @"transit";
  v61[4] = @"sanitizedPrimaryAccountNumber";
  v61[5] = @"expiration";
  v62[4] = @"5678";
  v62[5] = @"12/30";
  v61[6] = @"longDescription";
  v61[7] = @"summaryMetadata";
  v62[6] = @"Suica Card - Available";
  v62[7] = &unk_1EE22AFD0;
  v61[8] = @"metadata";
  v62[8] = &unk_1EE22AFE8;
  uint64_t v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:9];
  uint64_t v4 = [[PKPaymentRemoteCredential alloc] initWithDictionary:v44];
  [v2 addObject:v4];

  v59[0] = @"identifier";
  v59[1] = @"status";
  v60[0] = @"1999";
  v60[1] = &unk_1EE22BDB0;
  v59[2] = @"cardType";
  v59[3] = @"sanitizedPrimaryAccountNumber";
  v60[2] = &unk_1EE22BD98;
  v60[3] = @"1999";
  v59[4] = @"expiration";
  v59[5] = @"longDescription";
  v60[4] = @"12/30";
  v60[5] = @"Suica Card - Already Provisioned";
  v59[6] = @"summaryMetadata";
  v59[7] = @"paymentCardType";
  v60[6] = &unk_1EE22B000;
  v60[7] = @"transit";
  v59[8] = @"metadata";
  v60[8] = &unk_1EE22B018;
  v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:9];
  int64_t v5 = [[PKPaymentRemoteCredential alloc] initWithDictionary:v43];
  [v2 addObject:v5];

  v57[0] = @"identifier";
  v57[1] = @"status";
  v58[0] = @"2999";
  v58[1] = &unk_1EE22BDC8;
  v57[2] = @"cardType";
  v57[3] = @"sanitizedPrimaryAccountNumber";
  v58[2] = &unk_1EE22BD98;
  v58[3] = @"8888";
  v57[4] = @"expiration";
  v57[5] = @"longDescription";
  v58[4] = @"12/32";
  v58[5] = @"Suica Card - Blacklisted";
  v57[6] = @"statusDescription";
  v57[7] = @"summaryMetadata";
  v58[6] = @"It is not possible to add this card at the moment. It will be available in within 24 hours.";
  v58[7] = &unk_1EE22B030;
  v57[8] = @"paymentCardType";
  v57[9] = @"metadata";
  v58[8] = @"transit";
  v58[9] = &unk_1EE22B048;
  unsigned int v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:10];
  id v6 = [[PKPaymentRemoteCredential alloc] initWithDictionary:v42];
  [v2 addObject:v6];

  v55[0] = @"identifier";
  v55[1] = @"status";
  v56[0] = @"29999";
  v56[1] = &unk_1EE22BDE0;
  v55[2] = @"cardType";
  v55[3] = @"sanitizedPrimaryAccountNumber";
  v56[2] = &unk_1EE22BD98;
  v56[3] = @"8888";
  v55[4] = @"expiration";
  v55[5] = @"longDescription";
  v56[4] = @"12/32";
  v56[5] = @"Suica Card - Transfer";
  v55[6] = @"statusDescription";
  v55[7] = @"summaryMetadata";
  v56[6] = @"It is not possible to add this card at the moment. It will be available in within 24 hours.";
  v56[7] = &unk_1EE22B060;
  v55[8] = @"metadata";
  v55[9] = @"paymentCardType";
  v56[8] = &unk_1EE22B078;
  v56[9] = @"transit";
  v55[10] = @"transferableFromDevices";
  v56[10] = &unk_1EE22B090;
  BOOL v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:11];
  v40 = [[PKPaymentRemoteCredential alloc] initWithDictionary:v41];
  objc_msgSend(v2, "addObject:");
  v53[0] = @"identifier";
  v53[1] = @"status";
  v54[0] = @"299399";
  v54[1] = &unk_1EE22BDE0;
  v53[2] = @"cardType";
  v53[3] = @"sanitizedPrimaryAccountNumber";
  v54[2] = &unk_1EE22BD98;
  v54[3] = @"8388";
  v53[4] = @"expiration";
  v53[5] = @"longDescription";
  v54[4] = @"12/32";
  v54[5] = @"Suica Card2 - Transfer";
  v53[6] = @"statusDescription";
  v53[7] = @"summaryMetadata";
  v54[6] = @"It is not possible to add this card at the moment. It will be available in within 24 hours.";
  v54[7] = &unk_1EE22B060;
  v53[8] = @"metadata";
  v53[9] = @"paymentCardType";
  v54[8] = &unk_1EE22B078;
  v54[9] = @"transit";
  v53[10] = @"transferableFromDevices";
  v54[10] = &unk_1EE22B0A8;
  uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:11];
  v38 = [[PKPaymentRemoteCredential alloc] initWithDictionary:v39];
  objc_msgSend(v2, "addObject:");
  id v7 = [[PKPaymentRemoteCredential alloc] initWithDictionary:&unk_1EE22D9D8];
  [v2 addObject:v7];

  uint64_t v8 = [[PKPaymentRemoteCredential alloc] initWithDictionary:&unk_1EE22DA00];
  [v2 addObject:v8];

  BOOL v9 = [[PKPaymentRemoteCredential alloc] initWithDictionary:&unk_1EE22DA28];
  [v2 addObject:v9];

  char v10 = [[PKPaymentRemoteCredential alloc] initWithDictionary:&unk_1EE22DA50];
  [v2 addObject:v10];

  v11 = [[PKPaymentRemoteCredential alloc] initWithDictionary:&unk_1EE22DA78];
  [v2 addObject:v11];

  uint64_t v12 = [[PKPaymentRemoteCredential alloc] initWithDictionary:&unk_1EE22DAA0];
  [v2 addObject:v12];

  char v13 = (void *)[&unk_1EE22DAA0 mutableCopy];
  int64_t v14 = [[PKPaymentRemoteCredential alloc] initWithDictionary:&unk_1EE22DAC8];
  [v2 addObject:v14];

  v15 = [[PKPaymentRemoteCredential alloc] initWithDictionary:&unk_1EE22DAF0];
  [v2 addObject:v15];

  BOOL v16 = [[PKPaymentRemoteCredential alloc] initWithDictionary:&unk_1EE22DB18];
  v17 = v2;
  [v2 addObject:v16];

  char v18 = 0;
  for (int i = 0; i != 5; ++i)
  {
    int v20 = v18;
    char v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"%d", (i + 10000));

    [v13 setObject:v18 forKeyedSubscript:@"identifier"];
    [v13 setObject:v18 forKeyedSubscript:@"sanitizedPrimaryAccountNumber"];
    [v13 setObject:v18 forKeyedSubscript:@"sanitizedPrimaryAccountNumber"];
    [v13 setObject:v18 forKeyedSubscript:@"sanitizedPrimaryAccountPrefix"];
    int64_t v21 = [PKPaymentRemoteCredential alloc];
    uint64_t v22 = (void *)[v13 copy];
    uint64_t v23 = [(PKPaymentRemoteCredential *)v21 initWithDictionary:v22];
    [v17 addObject:v23];
  }
  uint64_t v24 = objc_alloc_init(PKAccount);
  [(PKAccount *)v24 setFeature:2];
  id v25 = objc_alloc_init(MEMORY[0x1E4F29128]);
  BOOL v26 = [v25 UUIDString];
  [(PKAccount *)v24 setAccountIdentifier:v26];

  int v37 = [[PKAccountCredential alloc] initWithAccount:v24];
  objc_msgSend(v17, "addObject:");
  v51[0] = @"identifier";
  v51[1] = @"status";
  v52[0] = @"909090";
  v52[1] = &unk_1EE22BD80;
  v51[2] = @"cardType";
  v51[3] = @"longDescription";
  v52[2] = &unk_1EE22BE70;
  v52[3] = @"Apple Account";
  v51[4] = @"sanitizedPrimaryAccountNumber";
  v51[5] = @"paymentCardType";
  v52[4] = @"1234";
  v52[5] = @"payment";
  v51[6] = @"summaryMetadata";
  v52[6] = &unk_1EE22B0C0;
  int v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:7];
  v28 = [[PKPaymentRemoteCredential alloc] initWithDictionary:v27];
  [v17 addObject:v28];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v29 = v17;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = 0;
    uint64_t v33 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v47 != v33) {
          objc_enumerationMutation(v29);
        }
        [*(id *)(*((void *)&v46 + 1) + 8 * j) setDeletable:((v32 + j) & 1) == 0];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v46 objects:v50 count:16];
      v32 += j;
    }
    while (v31);
  }

  v35 = (void *)[v29 copy];
  return v35;
}

@end