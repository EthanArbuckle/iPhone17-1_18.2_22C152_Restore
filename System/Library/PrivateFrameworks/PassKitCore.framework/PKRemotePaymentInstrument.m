@interface PKRemotePaymentInstrument
+ (BOOL)supportsSecureCoding;
+ (PKRemotePaymentInstrument)remotePaymentInstrumentWithProtobuf:(id)a3;
+ (id)sortDescriptorForDefaultPaymentInstrument:(id)a3 paymentSupportedQuery:(id)a4;
+ (id)thumbnailCachePathForManifestHash:(id)a3 size:(CGSize)a4;
- (BOOL)hasAssociatedPeerPaymentAccount;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRemotePaymentInstrument:(id)a3;
- (BOOL)supportsAutomaticSelection;
- (NSArray)associatedWebDomains;
- (NSArray)paymentApplications;
- (NSData)manifestHash;
- (NSDate)ingestedDate;
- (NSNumber)isCobranded;
- (NSString)cobrandName;
- (NSString)displayName;
- (NSString)issuerCountryCode;
- (NSString)organizationName;
- (NSString)passIdentifier;
- (NSString)primaryAccountIdentifier;
- (NSString)primaryAccountNumberSuffix;
- (PKCurrencyAmount)peerPaymentAccountBalance;
- (PKPaymentApplication)primaryPaymentApplication;
- (PKRemotePaymentInstrument)initWithCoder:(id)a3;
- (PKRemotePaymentInstrument)initWithPaymentPass:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)protobuf;
- (id)sortedPaymentApplications:(id)a3 ascending:(BOOL)a4;
- (unint64_t)associatedAccountFeatureIdentifier;
- (unint64_t)hash;
- (unint64_t)peerPaymentAccountState;
- (void)encodeWithCoder:(id)a3;
- (void)setAssociatedAccountFeatureIdentifier:(unint64_t)a3;
- (void)setAssociatedWebDomains:(id)a3;
- (void)setCobrandName:(id)a3;
- (void)setCobranded:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setHasAssociatedPeerPaymentAccount:(BOOL)a3;
- (void)setIngestedDate:(id)a3;
- (void)setIssuerCountryCode:(id)a3;
- (void)setManifestHash:(id)a3;
- (void)setOrganizationName:(id)a3;
- (void)setPassIdentifier:(id)a3;
- (void)setPaymentApplications:(id)a3;
- (void)setPeerPaymentAccountBalance:(id)a3;
- (void)setPeerPaymentAccountState:(unint64_t)a3;
- (void)setPrimaryAccountIdentifier:(id)a3;
- (void)setPrimaryAccountNumberSuffix:(id)a3;
- (void)setPrimaryPaymentApplication:(id)a3;
- (void)setSupportsAutomaticSelection:(BOOL)a3;
@end

@implementation PKRemotePaymentInstrument

+ (id)sortDescriptorForDefaultPaymentInstrument:(id)a3 paymentSupportedQuery:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x1E4F29008];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __126__PKRemotePaymentInstrument_PKPaymentAuthorizationDataModel__sortDescriptorForDefaultPaymentInstrument_paymentSupportedQuery___block_invoke;
  v12[3] = &unk_1E56DFE00;
  id v13 = v5;
  id v14 = v6;
  id v8 = v6;
  id v9 = v5;
  v10 = [v7 sortDescriptorWithKey:@"paymentApplications" ascending:1 comparator:v12];

  return v10;
}

uint64_t __126__PKRemotePaymentInstrument_PKPaymentAuthorizationDataModel__sortDescriptorForDefaultPaymentInstrument_paymentSupportedQuery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) primaryPaymentApplication];
  id v8 = [v7 applicationIdentifier];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = v5;
  uint64_t v9 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    int v11 = 0;
    LOBYTE(v12) = 0;
    uint64_t v13 = *(void *)v38;
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if (v12)
        {
          int v12 = 1;
          if ((v11 & 1) == 0) {
            goto LABEL_8;
          }
        }
        else
        {
          int v12 = [*(id *)(*((void *)&v37 + 1) + 8 * i) canProcessPayment:*(void *)(a1 + 40)];
          if ((v11 & 1) == 0)
          {
LABEL_8:
            v16 = [v15 applicationIdentifier];
            int v17 = [v16 isEqualToString:v8];

            goto LABEL_11;
          }
        }
        int v17 = 0;
LABEL_11:
        v11 |= v17;
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (!v10)
      {
        int v18 = v11 ^ 1;
        goto LABEL_15;
      }
    }
  }
  int v12 = 0;
  int v18 = 1;
LABEL_15:
  int v30 = v18;

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v31 = v6;
  uint64_t v19 = [v31 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    LOBYTE(v21) = 0;
    unsigned int v22 = 0;
    uint64_t v23 = *(void *)v34;
    while (1)
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(v31);
        }
        v25 = *(void **)(*((void *)&v33 + 1) + 8 * j);
        if (v21)
        {
          int v21 = 1;
          if ((v22 & 1) == 0) {
            goto LABEL_22;
          }
        }
        else
        {
          int v21 = [*(id *)(*((void *)&v33 + 1) + 8 * j) canProcessPayment:*(void *)(a1 + 40)];
          if ((v22 & 1) == 0)
          {
LABEL_22:
            v26 = [v25 applicationIdentifier];
            int v27 = [v26 isEqualToString:v8];

            goto LABEL_25;
          }
        }
        int v27 = 0;
LABEL_25:
        v22 |= v27;
      }
      uint64_t v20 = [v31 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (!v20) {
        goto LABEL_29;
      }
    }
  }
  int v21 = 0;
  unsigned int v22 = 0;
LABEL_29:

  if (((v12 ^ 1) & 1) != 0 || v21)
  {
    if ((v12 | v21 ^ 1) != 1)
    {
      uint64_t v28 = 1;
      goto LABEL_38;
    }
    if ((v12 ^ 1 | v21 ^ 1))
    {
      uint64_t v28 = 0;
      goto LABEL_38;
    }
    if ((v30 | v22))
    {
      uint64_t v28 = v30 & v22 & 1;
      goto LABEL_38;
    }
  }
  uint64_t v28 = -1;
LABEL_38:

  return v28;
}

+ (PKRemotePaymentInstrument)remotePaymentInstrumentWithProtobuf:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_alloc_init(PKRemotePaymentInstrument);
  id v5 = [v3 passID];
  [(PKRemotePaymentInstrument *)v4 setPassIdentifier:v5];

  id v6 = [v3 organizationName];
  [(PKRemotePaymentInstrument *)v4 setOrganizationName:v6];

  v7 = [v3 displayName];
  [(PKRemotePaymentInstrument *)v4 setDisplayName:v7];

  id v8 = (void *)MEMORY[0x1E4F1C9C8];
  [v3 ingestedDate];
  uint64_t v9 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  [(PKRemotePaymentInstrument *)v4 setIngestedDate:v9];

  uint64_t v10 = [v3 primaryAccountNumberSuffix];
  [(PKRemotePaymentInstrument *)v4 setPrimaryAccountNumberSuffix:v10];

  int v11 = [v3 manifestHash];
  [(PKRemotePaymentInstrument *)v4 setManifestHash:v11];

  int v12 = [v3 primaryAccountIdentifier];
  [(PKRemotePaymentInstrument *)v4 setPrimaryAccountIdentifier:v12];

  uint64_t v13 = [v3 associatedWebDomains];
  [(PKRemotePaymentInstrument *)v4 setAssociatedWebDomains:v13];

  -[PKRemotePaymentInstrument setSupportsAutomaticSelection:](v4, "setSupportsAutomaticSelection:", [v3 supportsAutomaticSelection]);
  id v14 = [v3 issuerCountryCode];
  [(PKRemotePaymentInstrument *)v4 setIssuerCountryCode:v14];

  -[PKRemotePaymentInstrument setHasAssociatedPeerPaymentAccount:](v4, "setHasAssociatedPeerPaymentAccount:", [v3 hasAssociatedPeerPaymentAccount]);
  -[PKRemotePaymentInstrument setPeerPaymentAccountState:](v4, "setPeerPaymentAccountState:", [v3 peerPaymentAccountState]);
  if ([v3 hasPeerPaymentAccountBalance]
    && [v3 hasPeerPaymentAccountCurrency])
  {
    if ([v3 hasDecimalAccountBalance])
    {
      v15 = [v3 decimalAccountBalance];
      uint64_t v16 = PKProtoSupportDecimalNumberFromProtobuf(v15);
    }
    else
    {
      if (![v3 hasCustomPrecisionPeerPaymentAccountBalance])
      {
        PKLegacyCurrencyStorageIntegerToDecimal([v3 peerPaymentAccountBalance], 0);
        int v17 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      v15 = [v3 customPrecisionPeerPaymentAccountBalance];
      uint64_t v16 = PKLegacyCurrencyStorageIntegerToDecimal([v15 amount], 1);
    }
    int v17 = (NSDecimalNumber *)v16;

LABEL_9:
    int v18 = [v3 peerPaymentAccountCurrency];
    uint64_t v19 = PKCurrencyAmountCreate(v17, v18, 0);
    [(PKRemotePaymentInstrument *)v4 setPeerPaymentAccountBalance:v19];
  }
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  int v21 = objc_msgSend(v3, "paymentApplications", 0);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = +[PKPaymentApplication applicationWithProtobuf:*(void *)(*((void *)&v31 + 1) + 8 * i)];
        [v20 addObject:v26];
        if (([v26 isAuxiliary] & 1) == 0) {
          [(PKRemotePaymentInstrument *)v4 setPrimaryPaymentApplication:v26];
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v23);
  }

  [(PKRemotePaymentInstrument *)v4 setPaymentApplications:v20];
  if ([v3 hasAssociatedAccountFeatureIdentifier]) {
    uint64_t v27 = [v3 associatedAccountFeatureIdentifier];
  }
  else {
    uint64_t v27 = 0;
  }
  [(PKRemotePaymentInstrument *)v4 setAssociatedAccountFeatureIdentifier:v27];
  if ([v3 hasCobranded])
  {
    uint64_t v28 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "cobranded"));
    [(PKRemotePaymentInstrument *)v4 setCobranded:v28];
  }
  v29 = [v3 cobrandName];
  [(PKRemotePaymentInstrument *)v4 setCobrandName:v29];

  return v4;
}

- (id)protobuf
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(PKProtobufPaymentInstrument);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v4 = [(PKRemotePaymentInstrument *)self paymentApplications];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v31 + 1) + 8 * i) protobuf];
        [(PKProtobufPaymentInstrument *)v3 addPaymentApplications:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [(PKRemotePaymentInstrument *)self displayName];
  [(PKProtobufPaymentInstrument *)v3 setDisplayName:v10];

  int v11 = [(PKRemotePaymentInstrument *)self passIdentifier];
  [(PKProtobufPaymentInstrument *)v3 setPassID:v11];

  int v12 = [(PKRemotePaymentInstrument *)self organizationName];
  [(PKProtobufPaymentInstrument *)v3 setOrganizationName:v12];

  uint64_t v13 = [(PKRemotePaymentInstrument *)self ingestedDate];
  [v13 timeIntervalSinceReferenceDate];
  -[PKProtobufPaymentInstrument setIngestedDate:](v3, "setIngestedDate:");

  id v14 = [(PKRemotePaymentInstrument *)self primaryAccountNumberSuffix];
  [(PKProtobufPaymentInstrument *)v3 setPrimaryAccountNumberSuffix:v14];

  v15 = [(PKRemotePaymentInstrument *)self manifestHash];
  [(PKProtobufPaymentInstrument *)v3 setManifestHash:v15];

  uint64_t v16 = [(PKRemotePaymentInstrument *)self primaryAccountIdentifier];
  [(PKProtobufPaymentInstrument *)v3 setPrimaryAccountIdentifier:v16];

  int v17 = [(PKRemotePaymentInstrument *)self associatedWebDomains];
  int v18 = (void *)[v17 mutableCopy];
  [(PKProtobufPaymentInstrument *)v3 setAssociatedWebDomains:v18];

  [(PKProtobufPaymentInstrument *)v3 setSupportsAutomaticSelection:[(PKRemotePaymentInstrument *)self supportsAutomaticSelection]];
  uint64_t v19 = [(PKRemotePaymentInstrument *)self issuerCountryCode];
  [(PKProtobufPaymentInstrument *)v3 setIssuerCountryCode:v19];

  [(PKProtobufPaymentInstrument *)v3 setHasAssociatedPeerPaymentAccount:[(PKRemotePaymentInstrument *)self hasAssociatedPeerPaymentAccount]];
  [(PKProtobufPaymentInstrument *)v3 setPeerPaymentAccountState:[(PKRemotePaymentInstrument *)self peerPaymentAccountState]];
  id v20 = [(PKRemotePaymentInstrument *)self peerPaymentAccountBalance];

  if (v20)
  {
    int v21 = [(PKRemotePaymentInstrument *)self peerPaymentAccountBalance];
    uint64_t v22 = [v21 currency];
    [(PKProtobufPaymentInstrument *)v3 setPeerPaymentAccountCurrency:v22];

    uint64_t v23 = [(PKRemotePaymentInstrument *)self peerPaymentAccountBalance];
    uint64_t v24 = [v23 amount];

    [(PKProtobufPaymentInstrument *)v3 setPeerPaymentAccountBalance:PKCurrencyDecimalToLegacyStorageInteger(v24, 0)];
    v25 = DecimalToCustomPrecisionProtobuf(v24);
    [(PKProtobufPaymentInstrument *)v3 setCustomPrecisionPeerPaymentAccountBalance:v25];

    v26 = PKProtoSupportProtoDecimalNumberFromDecimalNumber(v24);
    [(PKProtobufPaymentInstrument *)v3 setDecimalAccountBalance:v26];
  }
  [(PKProtobufPaymentInstrument *)v3 setAssociatedAccountFeatureIdentifier:[(PKRemotePaymentInstrument *)self associatedAccountFeatureIdentifier]];
  uint64_t v27 = [(PKRemotePaymentInstrument *)self isCobranded];

  if (v27)
  {
    uint64_t v28 = [(PKRemotePaymentInstrument *)self isCobranded];
    -[PKProtobufPaymentInstrument setCobranded:](v3, "setCobranded:", [v28 BOOLValue]);
  }
  v29 = [(PKRemotePaymentInstrument *)self cobrandName];
  [(PKProtobufPaymentInstrument *)v3 setCobrandName:v29];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKRemotePaymentInstrument)initWithPaymentPass:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PKRemotePaymentInstrument;
  uint64_t v5 = [(PKRemotePaymentInstrument *)&v35 init];
  if (v5)
  {
    uint64_t v6 = [v4 devicePaymentApplications];
    uint64_t v7 = [v6 allObjects];
    paymentApplications = v5->_paymentApplications;
    v5->_paymentApplications = (NSArray *)v7;

    uint64_t v9 = [v4 devicePrimaryPaymentApplication];
    primaryPaymentApplication = v5->_primaryPaymentApplication;
    v5->_primaryPaymentApplication = (PKPaymentApplication *)v9;

    uint64_t v11 = [v4 uniqueID];
    passIdentifier = v5->_passIdentifier;
    v5->_passIdentifier = (NSString *)v11;

    uint64_t v13 = [v4 organizationName];
    organizationName = v5->_organizationName;
    v5->_organizationName = (NSString *)v13;

    uint64_t v15 = [v4 localizedDescription];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v15;

    uint64_t v17 = [v4 ingestedDate];
    ingestedDate = v5->_ingestedDate;
    v5->_ingestedDate = (NSDate *)v17;

    uint64_t v19 = [v4 primaryAccountNumberSuffix];
    primaryAccountNumberSuffix = v5->_primaryAccountNumberSuffix;
    v5->_primaryAccountNumberSuffix = (NSString *)v19;

    uint64_t v21 = [v4 manifestHash];
    manifestHash = v5->_manifestHash;
    v5->_manifestHash = (NSData *)v21;

    uint64_t v23 = [v4 primaryAccountIdentifier];
    primaryAccountIdentifier = v5->_primaryAccountIdentifier;
    v5->_primaryAccountIdentifier = (NSString *)v23;

    v25 = [v4 associatedWebDomains];
    uint64_t v26 = [v25 allObjects];
    associatedWebDomains = v5->_associatedWebDomains;
    v5->_associatedWebDomains = (NSArray *)v26;

    v5->_supportsAutomaticSelection = ([v4 settings] & 0x10) != 0;
    uint64_t v28 = [v4 issuerCountryCode];
    issuerCountryCode = v5->_issuerCountryCode;
    v5->_issuerCountryCode = (NSString *)v28;

    v5->_hasAssociatedPeerPaymentAccount = [v4 hasAssociatedPeerPaymentAccount];
    v5->_associatedAccountFeatureIdentifier = [v4 associatedAccountFeatureIdentifier];
    uint64_t v30 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isCobranded"));
    cobranded = v5->_cobranded;
    v5->_cobranded = (NSNumber *)v30;

    uint64_t v32 = [v4 cobrandName];
    cobrandName = v5->_cobrandName;
    v5->_cobrandName = (NSString *)v32;
  }
  return v5;
}

- (PKRemotePaymentInstrument)initWithCoder:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)PKRemotePaymentInstrument;
  uint64_t v5 = [(PKRemotePaymentInstrument *)&v41 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"paymentApplications"];
    paymentApplications = v5->_paymentApplications;
    v5->_paymentApplications = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passID"];
    passIdentifier = v5->_passIdentifier;
    v5->_passIdentifier = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"organizationName"];
    organizationName = v5->_organizationName;
    v5->_organizationName = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ingestedDate"];
    ingestedDate = v5->_ingestedDate;
    v5->_ingestedDate = (NSDate *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryAccountNumberSuffix"];
    primaryAccountNumberSuffix = v5->_primaryAccountNumberSuffix;
    v5->_primaryAccountNumberSuffix = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryPaymentApplication"];
    primaryPaymentApplication = v5->_primaryPaymentApplication;
    v5->_primaryPaymentApplication = (PKPaymentApplication *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manifestHash"];
    manifestHash = v5->_manifestHash;
    v5->_manifestHash = (NSData *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryAccountIdentifier"];
    primaryAccountIdentifier = v5->_primaryAccountIdentifier;
    v5->_primaryAccountIdentifier = (NSString *)v25;

    uint64_t v27 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = objc_opt_class();
    v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"associatedWebDomains"];
    associatedWebDomains = v5->_associatedWebDomains;
    v5->_associatedWebDomains = (NSArray *)v30;

    v5->_supportsAutomaticSelection = [v4 decodeBoolForKey:@"supportsAutomaticSelection"];
    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"issuerCountryCode"];
    issuerCountryCode = v5->_issuerCountryCode;
    v5->_issuerCountryCode = (NSString *)v32;

    v5->_hasAssociatedPeerPaymentAccount = [v4 decodeBoolForKey:@"hasAssociatedPeerPaymentAccount"];
    v5->_peerPaymentAccountState = [v4 decodeIntegerForKey:@"peerPaymentAccountState"];
    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerPaymentAccountBalance"];
    peerPaymentAccountBalance = v5->_peerPaymentAccountBalance;
    v5->_peerPaymentAccountBalance = (PKCurrencyAmount *)v34;

    v5->_associatedAccountFeatureIdentifier = [v4 decodeIntegerForKey:@"associatedAccountFeatureIdentifier"];
    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cobranded"];
    cobranded = v5->_cobranded;
    v5->_cobranded = (NSNumber *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cobrandName"];
    cobrandName = v5->_cobrandName;
    v5->_cobrandName = (NSString *)v38;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  paymentApplications = self->_paymentApplications;
  id v5 = a3;
  [v5 encodeObject:paymentApplications forKey:@"paymentApplications"];
  [v5 encodeObject:self->_passIdentifier forKey:@"passID"];
  [v5 encodeObject:self->_organizationName forKey:@"organizationName"];
  [v5 encodeObject:self->_displayName forKey:@"displayName"];
  [v5 encodeObject:self->_ingestedDate forKey:@"ingestedDate"];
  [v5 encodeObject:self->_primaryAccountNumberSuffix forKey:@"primaryAccountNumberSuffix"];
  [v5 encodeObject:self->_primaryPaymentApplication forKey:@"primaryPaymentApplication"];
  [v5 encodeObject:self->_manifestHash forKey:@"manifestHash"];
  [v5 encodeObject:self->_primaryAccountIdentifier forKey:@"primaryAccountIdentifier"];
  [v5 encodeObject:self->_associatedWebDomains forKey:@"associatedWebDomains"];
  [v5 encodeBool:self->_supportsAutomaticSelection forKey:@"supportsAutomaticSelection"];
  [v5 encodeObject:self->_issuerCountryCode forKey:@"issuerCountryCode"];
  [v5 encodeBool:self->_hasAssociatedPeerPaymentAccount forKey:@"hasAssociatedPeerPaymentAccount"];
  [v5 encodeInteger:self->_peerPaymentAccountState forKey:@"peerPaymentAccountState"];
  [v5 encodeObject:self->_peerPaymentAccountBalance forKey:@"peerPaymentAccountBalance"];
  [v5 encodeInteger:self->_associatedAccountFeatureIdentifier forKey:@"associatedAccountFeatureIdentifier"];
  [v5 encodeObject:self->_cobranded forKey:@"cobranded"];
  [v5 encodeObject:self->_cobrandName forKey:@"cobrandName"];
}

- (id)description
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  passIdentifier = self->_passIdentifier;
  organizationName = self->_organizationName;
  ingestedDate = self->_ingestedDate;
  displayName = self->_displayName;
  id v8 = [(NSData *)self->_manifestHash hexEncoding];
  [v3 appendFormat:@"Display Name: %@\nPass ID: %@\nPass organizationName: %@\nIngested: %@\nManifest: %@\n", displayName, passIdentifier, organizationName, ingestedDate, v8];

  [v3 appendString:@"Applications: \n"];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = self->_paymentApplications;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [*(id *)(*((void *)&v16 + 1) + 8 * i) applicationIdentifier];
        [v3 appendFormat:@"%@\n", v14];
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  [v3 appendString:@"\n\n"];
  return v3;
}

- (id)sortedPaymentApplications:(id)a3 ascending:(BOOL)a4
{
  return PKSortedPaymentApplicationsByAID(a3, self->_primaryPaymentApplication, a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKRemotePaymentInstrument allocWithZone:](PKRemotePaymentInstrument, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_passIdentifier copyWithZone:a3];
  passIdentifier = v5->_passIdentifier;
  v5->_passIdentifier = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_organizationName copyWithZone:a3];
  organizationName = v5->_organizationName;
  v5->_organizationName = (NSString *)v8;

  uint64_t v10 = [(NSData *)self->_manifestHash copyWithZone:a3];
  manifestHash = v5->_manifestHash;
  v5->_manifestHash = (NSData *)v10;

  uint64_t v12 = [(NSString *)self->_displayName copyWithZone:a3];
  displayName = v5->_displayName;
  v5->_displayName = (NSString *)v12;

  uint64_t v14 = [(NSString *)self->_primaryAccountNumberSuffix copyWithZone:a3];
  primaryAccountNumberSuffix = v5->_primaryAccountNumberSuffix;
  v5->_primaryAccountNumberSuffix = (NSString *)v14;

  uint64_t v16 = [(NSString *)self->_primaryAccountIdentifier copyWithZone:a3];
  primaryAccountIdentifier = v5->_primaryAccountIdentifier;
  v5->_primaryAccountIdentifier = (NSString *)v16;

  uint64_t v18 = [(NSArray *)self->_paymentApplications copyWithZone:a3];
  paymentApplications = v5->_paymentApplications;
  v5->_paymentApplications = (NSArray *)v18;

  id v20 = [(PKPaymentApplication *)self->_primaryPaymentApplication copyWithZone:a3];
  primaryPaymentApplication = v5->_primaryPaymentApplication;
  v5->_primaryPaymentApplication = v20;

  uint64_t v22 = [(NSDate *)self->_ingestedDate copyWithZone:a3];
  ingestedDate = v5->_ingestedDate;
  v5->_ingestedDate = (NSDate *)v22;

  uint64_t v24 = [(NSArray *)self->_associatedWebDomains copyWithZone:a3];
  associatedWebDomains = v5->_associatedWebDomains;
  v5->_associatedWebDomains = (NSArray *)v24;

  v5->_supportsAutomaticSelection = self->_supportsAutomaticSelection;
  uint64_t v26 = [(NSString *)self->_issuerCountryCode copyWithZone:a3];
  issuerCountryCode = v5->_issuerCountryCode;
  v5->_issuerCountryCode = (NSString *)v26;

  v5->_hasAssociatedPeerPaymentAccount = self->_hasAssociatedPeerPaymentAccount;
  v5->_peerPaymentAccountState = self->_peerPaymentAccountState;
  uint64_t v28 = [(PKCurrencyAmount *)self->_peerPaymentAccountBalance copyWithZone:a3];
  peerPaymentAccountBalance = v5->_peerPaymentAccountBalance;
  v5->_peerPaymentAccountBalance = v28;

  v5->_associatedAccountFeatureIdentifier = self->_associatedAccountFeatureIdentifier;
  uint64_t v30 = [(NSNumber *)self->_cobranded copyWithZone:a3];
  cobranded = v5->_cobranded;
  v5->_cobranded = (NSNumber *)v30;

  uint64_t v32 = [(NSString *)self->_cobrandName copyWithZone:a3];
  cobrandName = v5->_cobrandName;
  v5->_cobrandName = (NSString *)v32;

  return v5;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_passIdentifier];
  [v3 safelyAddObject:self->_organizationName];
  [v3 safelyAddObject:self->_displayName];
  [v3 safelyAddObject:self->_ingestedDate];
  [v3 safelyAddObject:self->_primaryAccountNumberSuffix];
  [v3 safelyAddObject:self->_primaryPaymentApplication];
  [v3 safelyAddObject:self->_manifestHash];
  [v3 safelyAddObject:self->_primaryAccountIdentifier];
  [v3 safelyAddObject:self->_associatedWebDomains];
  [v3 safelyAddObject:self->_issuerCountryCode];
  [v3 safelyAddObject:self->_cobranded];
  [v3 safelyAddObject:self->_cobrandName];
  uint64_t v4 = PKCombinedHash(17, self->_paymentApplications);
  uint64_t v5 = PKCombinedHash(v4, v3);
  unint64_t v6 = self->_associatedAccountFeatureIdentifier - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKRemotePaymentInstrument *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKRemotePaymentInstrument *)self isEqualToRemotePaymentInstrument:v5];

  return v6;
}

- (BOOL)isEqualToRemotePaymentInstrument:(id)a3
{
  uint64_t v4 = a3;
  paymentApplications = self->_paymentApplications;
  BOOL v6 = (NSArray *)v4[12];
  if (paymentApplications) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (paymentApplications != v6) {
      goto LABEL_54;
    }
  }
  else
  {
    char v8 = -[NSArray isEqual:](paymentApplications, "isEqual:");
    if ((v8 & 1) == 0) {
      goto LABEL_54;
    }
  }
  primaryPaymentApplication = self->_primaryPaymentApplication;
  uint64_t v10 = (PKPaymentApplication *)v4[13];
  if (primaryPaymentApplication && v10)
  {
    if (!-[PKPaymentApplication isEqual:](primaryPaymentApplication, "isEqual:")) {
      goto LABEL_54;
    }
  }
  else if (primaryPaymentApplication != v10)
  {
    goto LABEL_54;
  }
  uint64_t v11 = (void *)v4[2];
  uint64_t v12 = self->_passIdentifier;
  uint64_t v13 = v11;
  if (v12 == v13)
  {
  }
  else
  {
    uint64_t v14 = v13;
    if (!v12 || !v13) {
      goto LABEL_53;
    }
    BOOL v15 = [(NSString *)v12 isEqualToString:v13];

    if (!v15) {
      goto LABEL_54;
    }
  }
  uint64_t v16 = (void *)v4[3];
  uint64_t v12 = self->_organizationName;
  long long v17 = v16;
  if (v12 == v17)
  {
  }
  else
  {
    uint64_t v14 = v17;
    if (!v12 || !v17) {
      goto LABEL_53;
    }
    BOOL v18 = [(NSString *)v12 isEqualToString:v17];

    if (!v18) {
      goto LABEL_54;
    }
  }
  long long v19 = (void *)v4[5];
  uint64_t v12 = self->_displayName;
  id v20 = v19;
  if (v12 == v20)
  {
  }
  else
  {
    uint64_t v14 = v20;
    if (!v12 || !v20) {
      goto LABEL_53;
    }
    BOOL v21 = [(NSString *)v12 isEqualToString:v20];

    if (!v21) {
      goto LABEL_54;
    }
  }
  ingestedDate = self->_ingestedDate;
  uint64_t v23 = (NSDate *)v4[14];
  if (ingestedDate && v23)
  {
    if ((-[NSDate isEqual:](ingestedDate, "isEqual:") & 1) == 0) {
      goto LABEL_54;
    }
  }
  else if (ingestedDate != v23)
  {
    goto LABEL_54;
  }
  manifestHash = self->_manifestHash;
  uint64_t v25 = (NSData *)v4[4];
  if (manifestHash && v25)
  {
    if ((-[NSData isEqual:](manifestHash, "isEqual:") & 1) == 0) {
      goto LABEL_54;
    }
  }
  else if (manifestHash != v25)
  {
    goto LABEL_54;
  }
  uint64_t v26 = (void *)v4[6];
  uint64_t v12 = self->_primaryAccountNumberSuffix;
  uint64_t v27 = v26;
  if (v12 == v27)
  {
  }
  else
  {
    uint64_t v14 = v27;
    if (!v12 || !v27) {
      goto LABEL_53;
    }
    BOOL v28 = [(NSString *)v12 isEqualToString:v27];

    if (!v28) {
      goto LABEL_54;
    }
  }
  v29 = (void *)v4[7];
  uint64_t v12 = self->_primaryAccountIdentifier;
  uint64_t v30 = v29;
  if (v12 == v30)
  {

    goto LABEL_57;
  }
  uint64_t v14 = v30;
  if (!v12 || !v30)
  {
LABEL_53:

    goto LABEL_54;
  }
  BOOL v31 = [(NSString *)v12 isEqualToString:v30];

  if (!v31) {
    goto LABEL_54;
  }
LABEL_57:
  associatedWebDomains = self->_associatedWebDomains;
  objc_super v35 = (NSArray *)v4[17];
  if (associatedWebDomains && v35)
  {
    if ((-[NSArray isEqual:](associatedWebDomains, "isEqual:") & 1) == 0) {
      goto LABEL_54;
    }
  }
  else if (associatedWebDomains != v35)
  {
    goto LABEL_54;
  }
  issuerCountryCode = self->_issuerCountryCode;
  long long v37 = (NSString *)v4[8];
  if (issuerCountryCode && v37)
  {
    if ((-[NSString isEqual:](issuerCountryCode, "isEqual:") & 1) == 0) {
      goto LABEL_54;
    }
  }
  else if (issuerCountryCode != v37)
  {
    goto LABEL_54;
  }
  if (self->_peerPaymentAccountState != v4[16]
    || self->_hasAssociatedPeerPaymentAccount != *((unsigned __int8 *)v4 + 9))
  {
    goto LABEL_54;
  }
  peerPaymentAccountBalance = self->_peerPaymentAccountBalance;
  long long v39 = (PKCurrencyAmount *)v4[15];
  if (peerPaymentAccountBalance && v39)
  {
    if (!-[PKCurrencyAmount isEqual:](peerPaymentAccountBalance, "isEqual:")) {
      goto LABEL_54;
    }
  }
  else if (peerPaymentAccountBalance != v39)
  {
    goto LABEL_54;
  }
  if (self->_associatedAccountFeatureIdentifier != v4[9]) {
    goto LABEL_54;
  }
  cobranded = self->_cobranded;
  objc_super v41 = (NSNumber *)v4[10];
  if (cobranded && v41)
  {
    if (-[NSNumber isEqual:](cobranded, "isEqual:")) {
      goto LABEL_80;
    }
LABEL_54:
    char v32 = 0;
    goto LABEL_55;
  }
  if (cobranded != v41) {
    goto LABEL_54;
  }
LABEL_80:
  cobrandName = self->_cobrandName;
  uint64_t v43 = (NSString *)v4[11];
  if (cobrandName && v43) {
    char v32 = -[NSString isEqual:](cobrandName, "isEqual:");
  }
  else {
    char v32 = cobrandName == v43;
  }
LABEL_55:

  return v32;
}

- (NSString)passIdentifier
{
  return self->_passIdentifier;
}

- (void)setPassIdentifier:(id)a3
{
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
}

- (NSData)manifestHash
{
  return self->_manifestHash;
}

- (void)setManifestHash:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)primaryAccountNumberSuffix
{
  return self->_primaryAccountNumberSuffix;
}

- (void)setPrimaryAccountNumberSuffix:(id)a3
{
}

- (NSString)primaryAccountIdentifier
{
  return self->_primaryAccountIdentifier;
}

- (void)setPrimaryAccountIdentifier:(id)a3
{
}

- (NSString)issuerCountryCode
{
  return self->_issuerCountryCode;
}

- (void)setIssuerCountryCode:(id)a3
{
}

- (unint64_t)associatedAccountFeatureIdentifier
{
  return self->_associatedAccountFeatureIdentifier;
}

- (void)setAssociatedAccountFeatureIdentifier:(unint64_t)a3
{
  self->_associatedAccountFeatureIdentifier = a3;
}

- (NSNumber)isCobranded
{
  return self->_cobranded;
}

- (void)setCobranded:(id)a3
{
}

- (NSString)cobrandName
{
  return self->_cobrandName;
}

- (void)setCobrandName:(id)a3
{
}

- (NSArray)paymentApplications
{
  return self->_paymentApplications;
}

- (void)setPaymentApplications:(id)a3
{
}

- (PKPaymentApplication)primaryPaymentApplication
{
  return self->_primaryPaymentApplication;
}

- (void)setPrimaryPaymentApplication:(id)a3
{
}

- (NSDate)ingestedDate
{
  return self->_ingestedDate;
}

- (void)setIngestedDate:(id)a3
{
}

- (BOOL)supportsAutomaticSelection
{
  return self->_supportsAutomaticSelection;
}

- (void)setSupportsAutomaticSelection:(BOOL)a3
{
  self->_supportsAutomaticSelection = a3;
}

- (PKCurrencyAmount)peerPaymentAccountBalance
{
  return self->_peerPaymentAccountBalance;
}

- (void)setPeerPaymentAccountBalance:(id)a3
{
}

- (BOOL)hasAssociatedPeerPaymentAccount
{
  return self->_hasAssociatedPeerPaymentAccount;
}

- (void)setHasAssociatedPeerPaymentAccount:(BOOL)a3
{
  self->_hasAssociatedPeerPaymentAccount = a3;
}

- (unint64_t)peerPaymentAccountState
{
  return self->_peerPaymentAccountState;
}

- (void)setPeerPaymentAccountState:(unint64_t)a3
{
  self->_peerPaymentAccountState = a3;
}

- (NSArray)associatedWebDomains
{
  return self->_associatedWebDomains;
}

- (void)setAssociatedWebDomains:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedWebDomains, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccountBalance, 0);
  objc_storeStrong((id *)&self->_ingestedDate, 0);
  objc_storeStrong((id *)&self->_primaryPaymentApplication, 0);
  objc_storeStrong((id *)&self->_paymentApplications, 0);
  objc_storeStrong((id *)&self->_cobrandName, 0);
  objc_storeStrong((id *)&self->_cobranded, 0);
  objc_storeStrong((id *)&self->_issuerCountryCode, 0);
  objc_storeStrong((id *)&self->_primaryAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_primaryAccountNumberSuffix, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_manifestHash, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_passIdentifier, 0);
}

+ (id)thumbnailCachePathForManifestHash:(id)a3 size:(CGSize)a4
{
  uint64_t v4 = [NSString stringWithFormat:@"%@#%ld-%ld", a3, llround(a4.width), llround(a4.height)];
  uint64_t v5 = PKRemoteInstrumentThumbnailsCachePath();
  BOOL v6 = [v5 stringByAppendingPathComponent:v4];

  return v6;
}

@end