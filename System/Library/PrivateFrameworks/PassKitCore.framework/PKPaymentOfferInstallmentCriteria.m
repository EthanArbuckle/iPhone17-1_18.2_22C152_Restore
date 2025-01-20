@interface PKPaymentOfferInstallmentCriteria
+ (BOOL)supportsSecureCoding;
- (BOOL)eligibleWithConfiguration:(id)a3 ineligibleReason:(unint64_t *)a4;
- (BOOL)hasPreconfiguredOffers;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresChallenge;
- (BOOL)suppressPayInFull;
- (NSArray)maximumAmounts;
- (NSArray)minimumAmounts;
- (NSArray)supportedLanguages;
- (NSSet)associatedApplicationIdentifiers;
- (NSSet)associatedStoreIdentifiers;
- (NSSet)associatedWebDomains;
- (NSSet)supportedCurrencyCodes;
- (NSSet)supportedDeviceRegionCountryCodes;
- (NSSet)supportedMerchantCountryCodes;
- (NSString)issuerName;
- (NSString)localizedPayInFullSubtitleOverride;
- (NSString)localizedPayInFullTitleOverride;
- (NSString)localizedSubtitleOverride;
- (NSString)localizedTitleOverride;
- (NSString)programName;
- (NSURL)appLaunchURL;
- (PKApplyFooterContent)disclosureFooter;
- (PKPaymentOfferDynamicContentIcon)icon;
- (PKPaymentOfferInstallmentCriteria)initWithCoder:(id)a3;
- (PKPaymentOfferInstallmentCriteria)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)paymentNetworkIdentifier;
- (unint64_t)hash;
- (unint64_t)paymentMethodType;
- (void)encodeWithCoder:(id)a3;
- (void)setAppLaunchURL:(id)a3;
- (void)setAssociatedApplicationIdentifiers:(id)a3;
- (void)setAssociatedStoreIdentifiers:(id)a3;
- (void)setAssociatedWebDomains:(id)a3;
- (void)setDisclosureFooter:(id)a3;
- (void)setHasPreconfiguredOffers:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setIssuerName:(id)a3;
- (void)setLocalizedPayInFullSubtitleOverride:(id)a3;
- (void)setLocalizedPayInFullTitleOverride:(id)a3;
- (void)setLocalizedSubtitleOverride:(id)a3;
- (void)setLocalizedTitleOverride:(id)a3;
- (void)setMaximumAmounts:(id)a3;
- (void)setMinimumAmounts:(id)a3;
- (void)setPaymentMethodType:(unint64_t)a3;
- (void)setPaymentNetworkIdentifier:(int64_t)a3;
- (void)setProgramName:(id)a3;
- (void)setRequiresChallenge:(BOOL)a3;
- (void)setSupportedCurrencyCodes:(id)a3;
- (void)setSupportedDeviceRegionCountryCodes:(id)a3;
- (void)setSupportedLanguages:(id)a3;
- (void)setSupportedMerchantCountryCodes:(id)a3;
- (void)setSuppressPayInFull:(BOOL)a3;
@end

@implementation PKPaymentOfferInstallmentCriteria

- (PKPaymentOfferInstallmentCriteria)initWithDictionary:(id)a3
{
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)PKPaymentOfferInstallmentCriteria;
  v5 = [(PKPaymentOfferCriteria *)&v52 initWithDictionary:v4];
  if (v5)
  {
    uint64_t v6 = [v4 PKSetContaining:objc_opt_class() forKey:@"supportedCurrencyCodes"];
    supportedCurrencyCodes = v5->_supportedCurrencyCodes;
    v5->_supportedCurrencyCodes = (NSSet *)v6;

    uint64_t v8 = [v4 PKSetContaining:objc_opt_class() forKey:@"supportedMerchantCountryCodes"];
    supportedMerchantCountryCodes = v5->_supportedMerchantCountryCodes;
    v5->_supportedMerchantCountryCodes = (NSSet *)v8;

    uint64_t v10 = [v4 PKSetContaining:objc_opt_class() forKey:@"supportedDeviceRegionCountryCodes"];
    supportedDeviceRegionCountryCodes = v5->_supportedDeviceRegionCountryCodes;
    v5->_supportedDeviceRegionCountryCodes = (NSSet *)v10;

    uint64_t v12 = [v4 PKArrayContaining:objc_opt_class() forKey:@"supportedLanguages"];
    supportedLanguages = v5->_supportedLanguages;
    v5->_supportedLanguages = (NSArray *)v12;

    v14 = [v4 PKStringForKey:@"paymentNetworkIdentifier"];
    v5->_paymentNetworkIdentifier = PKPaymentCredentialTypeForPaymentNetworkName(v14);

    v15 = [v4 PKStringForKey:@"paymentMethodType"];
    v5->_paymentMethodType = PKPaymentMethodTypeForString(v15);

    uint64_t v16 = [v4 PKStringForKey:@"programName"];
    programName = v5->_programName;
    v5->_programName = (NSString *)v16;

    v18 = [v4 PKStringForKey:@"issuerName"];
    v19 = v18;
    if (!v18)
    {
      v19 = [v4 PKStringForKey:@"productName"];
    }
    objc_storeStrong((id *)&v5->_issuerName, v19);
    if (!v18) {

    }
    v20 = [PKPaymentOfferDynamicContentIcon alloc];
    v21 = [v4 PKDictionaryForKey:@"iconURL"];
    uint64_t v22 = [(PKPaymentOfferDynamicContentIcon *)v20 initWithDictionary:v21];
    icon = v5->_icon;
    v5->_icon = (PKPaymentOfferDynamicContentIcon *)v22;

    v24 = [PKApplyFooterContent alloc];
    v25 = [v4 PKDictionaryForKey:@"disclosureFooter"];
    uint64_t v26 = [(PKApplyFooterContent *)v24 initWithDictionary:v25];
    disclosureFooter = v5->_disclosureFooter;
    v5->_disclosureFooter = (PKApplyFooterContent *)v26;

    v28 = [v4 PKArrayContaining:objc_opt_class() forKey:@"minimumAmounts"];
    uint64_t v29 = objc_msgSend(v28, "pk_createArrayBySafelyApplyingBlock:", &__block_literal_global_133);
    minimumAmounts = v5->_minimumAmounts;
    v5->_minimumAmounts = (NSArray *)v29;

    v31 = [v4 PKArrayContaining:objc_opt_class() forKey:@"maximumAmounts"];
    uint64_t v32 = objc_msgSend(v31, "pk_createArrayBySafelyApplyingBlock:", &__block_literal_global_88_0);
    maximumAmounts = v5->_maximumAmounts;
    v5->_maximumAmounts = (NSArray *)v32;

    uint64_t v34 = [v4 PKSetContaining:objc_opt_class() forKey:@"associatedStoreIdentifiers"];
    associatedStoreIdentifiers = v5->_associatedStoreIdentifiers;
    v5->_associatedStoreIdentifiers = (NSSet *)v34;

    uint64_t v36 = [v4 PKSetContaining:objc_opt_class() forKey:@"associatedApplicationIdentifiers"];
    associatedApplicationIdentifiers = v5->_associatedApplicationIdentifiers;
    v5->_associatedApplicationIdentifiers = (NSSet *)v36;

    v38 = [v4 PKSetContaining:objc_opt_class() forKey:@"associatedWebDomains"];
    uint64_t v39 = objc_msgSend(v38, "pk_setBySafelyApplyingBlock:", &__block_literal_global_92);
    associatedWebDomains = v5->_associatedWebDomains;
    v5->_associatedWebDomains = (NSSet *)v39;

    uint64_t v41 = [v4 PKURLForKey:@"appLaunchURL"];
    appLaunchURL = v5->_appLaunchURL;
    v5->_appLaunchURL = (NSURL *)v41;

    v5->_requiresChallenge = [v4 PKBoolForKey:@"requiresChallenge"];
    v5->_suppressPayInFull = [v4 PKBoolForKey:@"suppressPayInFull"];
    v5->_hasPreconfiguredOffers = [v4 PKBoolForKey:@"hasPreconfiguredOffers"];
    uint64_t v43 = [v4 PKStringForKey:@"localizedPayInFullTitleOverride"];
    localizedPayInFullTitleOverride = v5->_localizedPayInFullTitleOverride;
    v5->_localizedPayInFullTitleOverride = (NSString *)v43;

    uint64_t v45 = [v4 PKStringForKey:@"localizedPayInFullSubtitleOverride"];
    localizedPayInFullSubtitleOverride = v5->_localizedPayInFullSubtitleOverride;
    v5->_localizedPayInFullSubtitleOverride = (NSString *)v45;

    uint64_t v47 = [v4 PKStringForKey:@"localizedTitleOverride"];
    localizedTitleOverride = v5->_localizedTitleOverride;
    v5->_localizedTitleOverride = (NSString *)v47;

    uint64_t v49 = [v4 PKStringForKey:@"localizedSubtitleOverride"];
    localizedSubtitleOverride = v5->_localizedSubtitleOverride;
    v5->_localizedSubtitleOverride = (NSString *)v49;
  }
  return v5;
}

PKCurrencyAmount *__56__PKPaymentOfferInstallmentCriteria_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKCurrencyAmount alloc] initWithDictionary:v2];

  return v3;
}

PKCurrencyAmount *__56__PKPaymentOfferInstallmentCriteria_initWithDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKCurrencyAmount alloc] initWithDictionary:v2];

  return v3;
}

id __56__PKPaymentOfferInstallmentCriteria_initWithDictionary___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F1CB10];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithString:v3];

  return v4;
}

- (BOOL)suppressPayInFull
{
  return (PKPaymentOffersForceSuppressPayInFull() & 1) != 0 || self->_suppressPayInFull;
}

- (BOOL)eligibleWithConfiguration:(id)a3 ineligibleReason:(unint64_t *)a4
{
  id v6 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PKPaymentOfferInstallmentCriteria;
  if ([(PKPaymentOfferCriteria *)&v32 eligibleWithConfiguration:v6 ineligibleReason:a4])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unint64_t v16 = 0;
      char v15 = 1;
      if (!a4) {
        goto LABEL_38;
      }
      goto LABEL_37;
    }
    id v7 = v6;
    uint64_t v8 = [v7 amount];
    v9 = [v7 currencyCode];
    uint64_t v10 = [v7 merchantCountryCode];
    v27 = [v7 deviceRegion];
    uint64_t v26 = [v7 supportedNetworks];
    uint64_t v11 = [v7 merchantCapabilities];
    v25 = PKPaymentNetworkNameForPaymentCredentialType(self->_paymentNetworkIdentifier);
    uint64_t v12 = [v7 payLaterSuppressionMode];
    char v13 = [v7 options];
    if (v8)
    {
      if (v9)
      {
        if (v10)
        {
          if (v27)
          {
            char v14 = v13;
            if ([(NSSet *)self->_supportedCurrencyCodes count]
              && ![(NSSet *)self->_supportedCurrencyCodes containsObject:v9])
            {
              char v15 = 0;
              unint64_t v16 = 7;
            }
            else if ([(NSSet *)self->_supportedMerchantCountryCodes count] {
                   && ![(NSSet *)self->_supportedMerchantCountryCodes containsObject:v10])
            }
            {
              char v15 = 0;
              unint64_t v16 = 8;
            }
            else if ([(NSSet *)self->_supportedDeviceRegionCountryCodes count] {
                   && ![(NSSet *)self->_supportedDeviceRegionCountryCodes containsObject:v27])
            }
            {
              char v15 = 0;
              unint64_t v16 = 9;
            }
            else if (v26 && v25 && ![v26 containsObject:v25])
            {
              char v15 = 0;
              unint64_t v16 = 10;
            }
            else if (v12)
            {
              char v15 = 0;
              unint64_t v16 = 11;
            }
            else if (+[PKPaymentApplication paymentApplicationSupportsMerchantCapabilties:v11 paymentType:self->_paymentMethodType])
            {
              if (v14)
              {
                char v15 = 0;
                unint64_t v16 = 15;
              }
              else if ((v14 & 2) != 0)
              {
                char v15 = 0;
                unint64_t v16 = 16;
              }
              else if ((v14 & 4) != 0)
              {
                char v15 = 0;
                unint64_t v16 = 17;
              }
              else
              {
                v24 = PKCurrencyAmountCreate(v8, v9, 0);
                maximumAmounts = self->_maximumAmounts;
                v30[0] = MEMORY[0x1E4F143A8];
                v30[1] = 3221225472;
                v30[2] = __80__PKPaymentOfferInstallmentCriteria_eligibleWithConfiguration_ineligibleReason___block_invoke;
                v30[3] = &unk_1E56EB7F0;
                v18 = v9;
                v31 = v18;
                v19 = [(NSArray *)maximumAmounts pk_firstObjectPassingTest:v30];
                minimumAmounts = self->_minimumAmounts;
                v28[0] = MEMORY[0x1E4F143A8];
                v28[1] = 3221225472;
                v28[2] = __80__PKPaymentOfferInstallmentCriteria_eligibleWithConfiguration_ineligibleReason___block_invoke_2;
                v28[3] = &unk_1E56EB7F0;
                uint64_t v29 = v18;
                v21 = [(NSArray *)minimumAmounts pk_firstObjectPassingTest:v28];
                if (v21 && ([v24 currencyAmountLessThanCurrencyAmount:v21] & 1) != 0)
                {
                  char v15 = 0;
                  unint64_t v16 = 13;
                }
                else if (v19)
                {
                  int v23 = [v24 currencyAmountGreaterThanCurrencyAmount:v19];
                  if (v23) {
                    unint64_t v16 = 14;
                  }
                  else {
                    unint64_t v16 = 0;
                  }
                  char v15 = v23 ^ 1;
                }
                else
                {
                  unint64_t v16 = 0;
                  char v15 = 1;
                }
              }
            }
            else
            {
              char v15 = 0;
              unint64_t v16 = 12;
            }
          }
          else
          {
            char v15 = 0;
            unint64_t v16 = 6;
          }
        }
        else
        {
          char v15 = 0;
          unint64_t v16 = 5;
        }
      }
      else
      {
        char v15 = 0;
        unint64_t v16 = 4;
      }
    }
    else
    {
      char v15 = 0;
      unint64_t v16 = 3;
    }

    if (a4) {
LABEL_37:
    }
      *a4 = v16;
  }
  else
  {
    char v15 = 0;
  }
LABEL_38:

  return v15;
}

uint64_t __80__PKPaymentOfferInstallmentCriteria_eligibleWithConfiguration_ineligibleReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 currency];
  id v4 = v3;
  v5 = *(void **)(a1 + 32);
  if (v3 && v5) {
    uint64_t v6 = objc_msgSend(v3, "isEqual:");
  }
  else {
    uint64_t v6 = v3 == v5;
  }

  return v6;
}

uint64_t __80__PKPaymentOfferInstallmentCriteria_eligibleWithConfiguration_ineligibleReason___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 currency];
  id v4 = v3;
  v5 = *(void **)(a1 + 32);
  if (v3 && v5) {
    uint64_t v6 = objc_msgSend(v3, "isEqual:");
  }
  else {
    uint64_t v6 = v3 == v5;
  }

  return v6;
}

- (id)dictionaryRepresentation
{
  v24.receiver = self;
  v24.super_class = (Class)PKPaymentOfferInstallmentCriteria;
  id v3 = [(PKPaymentOfferCriteria *)&v24 dictionaryRepresentation];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(NSSet *)self->_supportedCurrencyCodes allObjects];
  [v4 setObject:v5 forKeyedSubscript:@"supportedCurrencyCodes"];

  uint64_t v6 = [(NSSet *)self->_supportedMerchantCountryCodes allObjects];
  [v4 setObject:v6 forKeyedSubscript:@"supportedMerchantCountryCodes"];

  id v7 = [(NSSet *)self->_supportedDeviceRegionCountryCodes allObjects];
  [v4 setObject:v7 forKeyedSubscript:@"supportedDeviceRegionCountryCodes"];

  [v4 setObject:self->_supportedLanguages forKeyedSubscript:@"supportedLanguages"];
  uint64_t v8 = PKPaymentNetworkNameForPaymentCredentialType(self->_paymentNetworkIdentifier);
  [v4 setObject:v8 forKeyedSubscript:@"paymentNetworkIdentifier"];

  v9 = PKPaymentMethodTypeToString(self->_paymentMethodType);
  [v4 setObject:v9 forKeyedSubscript:@"paymentMethodType"];

  [v4 setObject:self->_programName forKeyedSubscript:@"programName"];
  [v4 setObject:self->_issuerName forKeyedSubscript:@"issuerName"];
  uint64_t v10 = [(PKPaymentOfferDynamicContentIcon *)self->_icon dictionaryRepresentation];
  [v4 setObject:v10 forKeyedSubscript:@"iconURL"];

  uint64_t v11 = [(PKApplyFooterContent *)self->_disclosureFooter dictionaryRepresentation];
  [v4 setObject:v11 forKeyedSubscript:@"disclosureFooter"];

  id v12 = [(NSArray *)self->_minimumAmounts pk_createArrayBySafelyApplyingBlock:&__block_literal_global_103_1];
  [v4 setObject:v12 forKeyedSubscript:@"minimumAmounts"];

  id v13 = [(NSArray *)self->_maximumAmounts pk_createArrayBySafelyApplyingBlock:&__block_literal_global_105];
  [v4 setObject:v13 forKeyedSubscript:@"maximumAmounts"];

  char v14 = [(NSSet *)self->_associatedStoreIdentifiers allObjects];
  [v4 setObject:v14 forKeyedSubscript:@"associatedStoreIdentifiers"];

  char v15 = [(NSURL *)self->_appLaunchURL absoluteString];
  [v4 setObject:v15 forKeyedSubscript:@"appLaunchURL"];

  unint64_t v16 = [NSNumber numberWithBool:self->_requiresChallenge];
  [v4 setObject:v16 forKeyedSubscript:@"requiresChallenge"];

  v17 = [(NSSet *)self->_associatedWebDomains pk_setByApplyingBlock:&__block_literal_global_108];
  v18 = [v17 allObjects];
  [v4 setObject:v18 forKeyedSubscript:@"associatedWebDomains"];

  v19 = [(NSSet *)self->_associatedApplicationIdentifiers allObjects];
  [v4 setObject:v19 forKeyedSubscript:@"associatedApplicationIdentifiers"];

  v20 = [NSNumber numberWithBool:self->_suppressPayInFull];
  [v4 setObject:v20 forKeyedSubscript:@"suppressPayInFull"];

  v21 = [NSNumber numberWithBool:self->_hasPreconfiguredOffers];
  [v4 setObject:v21 forKeyedSubscript:@"hasPreconfiguredOffers"];

  [v4 setObject:self->_localizedPayInFullTitleOverride forKeyedSubscript:@"localizedPayInFullTitleOverride"];
  [v4 setObject:self->_localizedPayInFullSubtitleOverride forKeyedSubscript:@"localizedPayInFullSubtitleOverride"];
  [v4 setObject:self->_localizedTitleOverride forKeyedSubscript:@"localizedTitleOverride"];
  [v4 setObject:self->_localizedSubtitleOverride forKeyedSubscript:@"localizedSubtitleOverride"];
  uint64_t v22 = (void *)[v4 copy];

  return v22;
}

uint64_t __61__PKPaymentOfferInstallmentCriteria_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

uint64_t __61__PKPaymentOfferInstallmentCriteria_dictionaryRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

uint64_t __61__PKPaymentOfferInstallmentCriteria_dictionaryRepresentation__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 absoluteString];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPaymentOfferInstallmentCriteria *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v5;
        v62.receiver = self;
        v62.super_class = (Class)PKPaymentOfferInstallmentCriteria;
        if ([(PKPaymentOfferCriteria *)&v62 isEqual:v6])
        {
          supportedCurrencyCodes = self->_supportedCurrencyCodes;
          uint64_t v8 = v6->_supportedCurrencyCodes;
          if (supportedCurrencyCodes) {
            BOOL v9 = v8 == 0;
          }
          else {
            BOOL v9 = 1;
          }
          if (v9)
          {
            if (supportedCurrencyCodes != v8) {
              goto LABEL_103;
            }
          }
          else
          {
            char v11 = -[NSSet isEqual:](supportedCurrencyCodes, "isEqual:");
            if ((v11 & 1) == 0) {
              goto LABEL_103;
            }
          }
          supportedMerchantCountryCodes = self->_supportedMerchantCountryCodes;
          id v13 = v6->_supportedMerchantCountryCodes;
          if (supportedMerchantCountryCodes && v13)
          {
            if ((-[NSSet isEqual:](supportedMerchantCountryCodes, "isEqual:") & 1) == 0) {
              goto LABEL_103;
            }
          }
          else if (supportedMerchantCountryCodes != v13)
          {
            goto LABEL_103;
          }
          supportedDeviceRegionCountryCodes = self->_supportedDeviceRegionCountryCodes;
          char v15 = v6->_supportedDeviceRegionCountryCodes;
          if (supportedDeviceRegionCountryCodes && v15)
          {
            if ((-[NSSet isEqual:](supportedDeviceRegionCountryCodes, "isEqual:") & 1) == 0) {
              goto LABEL_103;
            }
          }
          else if (supportedDeviceRegionCountryCodes != v15)
          {
            goto LABEL_103;
          }
          supportedLanguages = self->_supportedLanguages;
          v17 = v6->_supportedLanguages;
          if (supportedLanguages && v17)
          {
            if ((-[NSArray isEqual:](supportedLanguages, "isEqual:") & 1) == 0) {
              goto LABEL_103;
            }
          }
          else if (supportedLanguages != v17)
          {
            goto LABEL_103;
          }
          if (self->_paymentNetworkIdentifier != v6->_paymentNetworkIdentifier
            || self->_paymentMethodType != v6->_paymentMethodType
            || self->_requiresChallenge != v6->_requiresChallenge)
          {
            goto LABEL_103;
          }
          programName = v6->_programName;
          v19 = self->_programName;
          v20 = programName;
          if (v19 == v20)
          {
          }
          else
          {
            v21 = v20;
            BOOL v10 = 0;
            if (!v19 || !v20) {
              goto LABEL_112;
            }
            uint64_t v22 = v20;
            BOOL v23 = [(NSString *)v19 isEqualToString:v20];

            if (!v23) {
              goto LABEL_103;
            }
          }
          issuerName = v6->_issuerName;
          v19 = self->_issuerName;
          v25 = issuerName;
          if (v19 == v25)
          {
          }
          else
          {
            v21 = v25;
            BOOL v10 = 0;
            if (!v19 || !v25) {
              goto LABEL_112;
            }
            uint64_t v26 = v25;
            BOOL v27 = [(NSString *)v19 isEqualToString:v25];

            if (!v27) {
              goto LABEL_103;
            }
          }
          icon = self->_icon;
          uint64_t v29 = v6->_icon;
          if (icon && v29)
          {
            if (!-[PKPaymentOfferDynamicContentIcon isEqual:](icon, "isEqual:")) {
              goto LABEL_103;
            }
          }
          else if (icon != v29)
          {
            goto LABEL_103;
          }
          disclosureFooter = self->_disclosureFooter;
          v31 = v6->_disclosureFooter;
          if (disclosureFooter && v31)
          {
            if (!-[PKApplyFooterContent isEqual:](disclosureFooter, "isEqual:")) {
              goto LABEL_103;
            }
          }
          else if (disclosureFooter != v31)
          {
            goto LABEL_103;
          }
          minimumAmounts = self->_minimumAmounts;
          v33 = v6->_minimumAmounts;
          if (minimumAmounts && v33)
          {
            if ((-[NSArray isEqual:](minimumAmounts, "isEqual:") & 1) == 0) {
              goto LABEL_103;
            }
          }
          else if (minimumAmounts != v33)
          {
            goto LABEL_103;
          }
          maximumAmounts = self->_maximumAmounts;
          v35 = v6->_maximumAmounts;
          if (maximumAmounts && v35)
          {
            if ((-[NSArray isEqual:](maximumAmounts, "isEqual:") & 1) == 0) {
              goto LABEL_103;
            }
          }
          else if (maximumAmounts != v35)
          {
            goto LABEL_103;
          }
          associatedStoreIdentifiers = self->_associatedStoreIdentifiers;
          v37 = v6->_associatedStoreIdentifiers;
          if (associatedStoreIdentifiers && v37)
          {
            if ((-[NSSet isEqual:](associatedStoreIdentifiers, "isEqual:") & 1) == 0) {
              goto LABEL_103;
            }
          }
          else if (associatedStoreIdentifiers != v37)
          {
            goto LABEL_103;
          }
          appLaunchURL = self->_appLaunchURL;
          uint64_t v39 = v6->_appLaunchURL;
          if (appLaunchURL && v39)
          {
            if ((-[NSURL isEqual:](appLaunchURL, "isEqual:") & 1) == 0) {
              goto LABEL_103;
            }
          }
          else if (appLaunchURL != v39)
          {
            goto LABEL_103;
          }
          associatedWebDomains = self->_associatedWebDomains;
          uint64_t v41 = v6->_associatedWebDomains;
          if (associatedWebDomains && v41)
          {
            if ((-[NSSet isEqual:](associatedWebDomains, "isEqual:") & 1) == 0) {
              goto LABEL_103;
            }
          }
          else if (associatedWebDomains != v41)
          {
            goto LABEL_103;
          }
          associatedApplicationIdentifiers = self->_associatedApplicationIdentifiers;
          uint64_t v43 = v6->_associatedApplicationIdentifiers;
          if (associatedApplicationIdentifiers && v43)
          {
            if ((-[NSSet isEqual:](associatedApplicationIdentifiers, "isEqual:") & 1) == 0) {
              goto LABEL_103;
            }
LABEL_85:
            if (self->_suppressPayInFull != v6->_suppressPayInFull
              || self->_hasPreconfiguredOffers != v6->_hasPreconfiguredOffers)
            {
              goto LABEL_103;
            }
            localizedPayInFullTitleOverride = v6->_localizedPayInFullTitleOverride;
            v19 = self->_localizedPayInFullTitleOverride;
            uint64_t v45 = localizedPayInFullTitleOverride;
            if (v19 == v45)
            {
            }
            else
            {
              v21 = v45;
              BOOL v10 = 0;
              if (!v19 || !v45) {
                goto LABEL_112;
              }
              v46 = v45;
              BOOL v47 = [(NSString *)v19 isEqualToString:v45];

              if (!v47) {
                goto LABEL_103;
              }
            }
            localizedPayInFullSubtitleOverride = v6->_localizedPayInFullSubtitleOverride;
            v19 = self->_localizedPayInFullSubtitleOverride;
            uint64_t v49 = localizedPayInFullSubtitleOverride;
            if (v19 == v49)
            {
            }
            else
            {
              v21 = v49;
              BOOL v10 = 0;
              if (!v19 || !v49) {
                goto LABEL_112;
              }
              v50 = v49;
              BOOL v51 = [(NSString *)v19 isEqualToString:v49];

              if (!v51) {
                goto LABEL_103;
              }
            }
            localizedTitleOverride = v6->_localizedTitleOverride;
            v19 = self->_localizedTitleOverride;
            v53 = localizedTitleOverride;
            if (v19 == v53)
            {

LABEL_107:
              localizedSubtitleOverride = self->_localizedSubtitleOverride;
              v58 = v6->_localizedSubtitleOverride;
              v19 = localizedSubtitleOverride;
              v59 = v58;
              if (v19 == v59)
              {
                BOOL v10 = 1;
                v21 = v19;
              }
              else
              {
                v21 = v59;
                BOOL v10 = 0;
                if (v19 && v59)
                {
                  v60 = v59;
                  BOOL v61 = [(NSString *)v19 isEqualToString:v59];
                  v21 = v60;
                  BOOL v10 = v61;
                }
              }
              goto LABEL_112;
            }
            v21 = v53;
            BOOL v10 = 0;
            if (v19 && v53)
            {
              v54 = v53;
              BOOL v55 = [(NSString *)v19 isEqualToString:v53];

              if (!v55) {
                goto LABEL_103;
              }
              goto LABEL_107;
            }
LABEL_112:

            goto LABEL_104;
          }
          if (associatedApplicationIdentifiers == v43) {
            goto LABEL_85;
          }
        }
LABEL_103:
        BOOL v10 = 0;
LABEL_104:

        goto LABEL_105;
      }
    }
    BOOL v10 = 0;
  }
LABEL_105:

  return v10;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_supportedCurrencyCodes];
  [v3 safelyAddObject:self->_supportedMerchantCountryCodes];
  [v3 safelyAddObject:self->_supportedDeviceRegionCountryCodes];
  [v3 safelyAddObject:self->_supportedLanguages];
  [v3 safelyAddObject:self->_programName];
  [v3 safelyAddObject:self->_issuerName];
  [v3 safelyAddObject:self->_icon];
  [v3 safelyAddObject:self->_disclosureFooter];
  [v3 safelyAddObject:self->_minimumAmounts];
  [v3 safelyAddObject:self->_maximumAmounts];
  [v3 safelyAddObject:self->_associatedStoreIdentifiers];
  [v3 safelyAddObject:self->_appLaunchURL];
  [v3 safelyAddObject:self->_associatedWebDomains];
  [v3 safelyAddObject:self->_associatedApplicationIdentifiers];
  [v3 safelyAddObject:self->_localizedPayInFullTitleOverride];
  [v3 safelyAddObject:self->_localizedPayInFullSubtitleOverride];
  [v3 safelyAddObject:self->_localizedTitleOverride];
  [v3 safelyAddObject:self->_localizedSubtitleOverride];
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentOfferInstallmentCriteria;
  id v4 = [(PKPaymentOfferCriteria *)&v12 hash];
  uint64_t v5 = PKCombinedHash((uint64_t)v4, v3);
  int64_t v6 = self->_paymentNetworkIdentifier - v5 + 32 * v5;
  unint64_t v7 = self->_paymentMethodType - v6 + 32 * v6;
  uint64_t v8 = self->_requiresChallenge - v7 + 32 * v7;
  uint64_t v9 = self->_suppressPayInFull - v8 + 32 * v8;
  unint64_t v10 = self->_hasPreconfiguredOffers - v9 + 32 * v9;

  return v10;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = [(PKPaymentOfferCriteria *)self identifier];
  [v3 appendFormat:@"identifier: '%@'; ", v4];

  uint64_t v5 = PKPaymentOfferCriteriaTypeToString([(PKPaymentOfferCriteria *)self type]);
  [v3 appendFormat:@"type: '%@'; ", v5];

  int64_t v6 = PKPaymentOfferCriteriaEligibilityToString([(PKPaymentOfferCriteria *)self eligibility]);
  [v3 appendFormat:@"eligibility: '%@'; ", v6];

  unint64_t v7 = [(PKPaymentOfferCriteria *)self passSerialNumber];
  [v3 appendFormat:@"passSerialNumber: '%@'; ", v7];

  uint64_t v8 = [(PKPaymentOfferCriteria *)self passTypeIdentifier];
  [v3 appendFormat:@"passTypeIdentifier: '%@'; ", v8];

  uint64_t v9 = [(PKPaymentOfferCriteria *)self fpanIdentifier];
  [v3 appendFormat:@"fpanIdentifier: '%@'; ", v9];

  [v3 appendFormat:@"supportedCurrencyCodes: '%@'; ", self->_supportedCurrencyCodes];
  objc_msgSend(v3, "appendFormat:", @"supportedMerchantCountryCodes: '%@'; ",
    self->_supportedMerchantCountryCodes);
  objc_msgSend(v3, "appendFormat:", @"supportedDeviceRegionCountryCodes: '%@'; ",
    self->_supportedDeviceRegionCountryCodes);
  [v3 appendFormat:@"supportedLanguages: '%@'; ", self->_supportedLanguages];
  [v3 appendFormat:@"productName: '%@'; ", self->_programName];
  [v3 appendFormat:@"issuerName: '%@'; ", self->_issuerName];
  [v3 appendFormat:@"icon: '%@'; ", self->_icon];
  [v3 appendFormat:@"disclosureFooter: '%@'; ", self->_disclosureFooter];
  [v3 appendFormat:@"minimumAmounts: '%@'; ", self->_minimumAmounts];
  [v3 appendFormat:@"maximumAmounts: '%@'; ", self->_maximumAmounts];
  [v3 appendFormat:@"associatedStoreIdentifiers: '%@'; ", self->_associatedStoreIdentifiers];
  [v3 appendFormat:@"appLaunchURL: '%@'; ", self->_appLaunchURL];
  [v3 appendFormat:@"associatedWebDomains: '%@'; ", self->_associatedWebDomains];
  objc_msgSend(v3, "appendFormat:", @"associatedApplicationIdentifiers: '%@'; ",
    self->_associatedApplicationIdentifiers);
  unint64_t v10 = PKPaymentNetworkNameForPaymentCredentialType(self->_paymentNetworkIdentifier);
  [v3 appendFormat:@"paymentNetworkIdentifier: '%@'; ", v10];

  char v11 = PKPaymentMethodTypeToString(self->_paymentMethodType);
  [v3 appendFormat:@"paymentMethodType: '%@'; ", v11];

  if (self->_requiresChallenge) {
    objc_super v12 = @"YES";
  }
  else {
    objc_super v12 = @"NO";
  }
  [v3 appendFormat:@"requiresChallenge: '%@'; ", v12];
  if (self->_suppressPayInFull) {
    id v13 = @"YES";
  }
  else {
    id v13 = @"NO";
  }
  [v3 appendFormat:@"suppressPayInFull: '%@'; ", v13];
  if (self->_hasPreconfiguredOffers) {
    char v14 = @"YES";
  }
  else {
    char v14 = @"NO";
  }
  [v3 appendFormat:@"hasPreconfiguredOffers: '%@'; ", v14];
  objc_msgSend(v3, "appendFormat:", @"localizedPayInFullTitleOverride: '%@'; ",
    self->_localizedPayInFullTitleOverride);
  objc_msgSend(v3, "appendFormat:", @"localizedPayInFullSubtitleOverride: '%@'; ",
    self->_localizedPayInFullSubtitleOverride);
  [v3 appendFormat:@"localizedTitleOverride: '%@'; ", self->_localizedTitleOverride];
  [v3 appendFormat:@"localizedSubtitleOverride: '%@'; ", self->_localizedSubtitleOverride];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferInstallmentCriteria)initWithCoder:(id)a3
{
  id v4 = a3;
  v70.receiver = self;
  v70.super_class = (Class)PKPaymentOfferInstallmentCriteria;
  uint64_t v5 = [(PKPaymentOfferCriteria *)&v70 initWithCoder:v4];
  if (v5)
  {
    int64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"supportedCurrencyCodes"];
    supportedCurrencyCodes = v5->_supportedCurrencyCodes;
    v5->_supportedCurrencyCodes = (NSSet *)v9;

    char v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    id v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"supportedMerchantCountryCodes"];
    supportedMerchantCountryCodes = v5->_supportedMerchantCountryCodes;
    v5->_supportedMerchantCountryCodes = (NSSet *)v14;

    unint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"supportedDeviceRegionCountryCodes"];
    supportedDeviceRegionCountryCodes = v5->_supportedDeviceRegionCountryCodes;
    v5->_supportedDeviceRegionCountryCodes = (NSSet *)v19;

    v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    BOOL v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"supportedLanguages"];
    supportedLanguages = v5->_supportedLanguages;
    v5->_supportedLanguages = (NSArray *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"programName"];
    programName = v5->_programName;
    v5->_programName = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"issuerName"];
    issuerName = v5->_issuerName;
    v5->_issuerName = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iconURL"];
    icon = v5->_icon;
    v5->_icon = (PKPaymentOfferDynamicContentIcon *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"disclosureFooter"];
    disclosureFooter = v5->_disclosureFooter;
    v5->_disclosureFooter = (PKApplyFooterContent *)v32;

    uint64_t v34 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v35 = objc_opt_class();
    uint64_t v36 = objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
    uint64_t v37 = [v4 decodeObjectOfClasses:v36 forKey:@"minimumAmounts"];
    minimumAmounts = v5->_minimumAmounts;
    v5->_minimumAmounts = (NSArray *)v37;

    uint64_t v39 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v40 = objc_opt_class();
    uint64_t v41 = objc_msgSend(v39, "setWithObjects:", v40, objc_opt_class(), 0);
    uint64_t v42 = [v4 decodeObjectOfClasses:v41 forKey:@"maximumAmounts"];
    maximumAmounts = v5->_maximumAmounts;
    v5->_maximumAmounts = (NSArray *)v42;

    id v44 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v45 = objc_opt_class();
    v46 = objc_msgSend(v44, "initWithObjects:", v45, objc_opt_class(), 0);
    uint64_t v47 = [v4 decodeObjectOfClasses:v46 forKey:@"associatedStoreIdentifiers"];
    associatedStoreIdentifiers = v5->_associatedStoreIdentifiers;
    v5->_associatedStoreIdentifiers = (NSSet *)v47;

    id v49 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v50 = objc_opt_class();
    BOOL v51 = objc_msgSend(v49, "initWithObjects:", v50, objc_opt_class(), 0);
    uint64_t v52 = [v4 decodeObjectOfClasses:v51 forKey:@"associatedApplicationIdentifiers"];
    associatedApplicationIdentifiers = v5->_associatedApplicationIdentifiers;
    v5->_associatedApplicationIdentifiers = (NSSet *)v52;

    uint64_t v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appLaunchURL"];
    appLaunchURL = v5->_appLaunchURL;
    v5->_appLaunchURL = (NSURL *)v54;

    id v56 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v57 = objc_opt_class();
    v58 = objc_msgSend(v56, "initWithObjects:", v57, objc_opt_class(), 0);
    uint64_t v59 = [v4 decodeObjectOfClasses:v58 forKey:@"associatedWebDomains"];
    associatedWebDomains = v5->_associatedWebDomains;
    v5->_associatedWebDomains = (NSSet *)v59;

    v5->_paymentNetworkIdentifier = [v4 decodeIntegerForKey:@"paymentNetworkIdentifier"];
    v5->_paymentMethodType = [v4 decodeIntegerForKey:@"paymentMethodType"];
    v5->_requiresChallenge = [v4 decodeBoolForKey:@"requiresChallenge"];
    v5->_suppressPayInFull = [v4 decodeBoolForKey:@"suppressPayInFull"];
    v5->_hasPreconfiguredOffers = [v4 decodeBoolForKey:@"hasPreconfiguredOffers"];
    uint64_t v61 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedPayInFullTitleOverride"];
    localizedPayInFullTitleOverride = v5->_localizedPayInFullTitleOverride;
    v5->_localizedPayInFullTitleOverride = (NSString *)v61;

    uint64_t v63 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedPayInFullSubtitleOverride"];
    localizedPayInFullSubtitleOverride = v5->_localizedPayInFullSubtitleOverride;
    v5->_localizedPayInFullSubtitleOverride = (NSString *)v63;

    uint64_t v65 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedTitleOverride"];
    localizedTitleOverride = v5->_localizedTitleOverride;
    v5->_localizedTitleOverride = (NSString *)v65;

    uint64_t v67 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedSubtitleOverride"];
    localizedSubtitleOverride = v5->_localizedSubtitleOverride;
    v5->_localizedSubtitleOverride = (NSString *)v67;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentOfferInstallmentCriteria;
  id v4 = a3;
  [(PKPaymentOfferCriteria *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_supportedCurrencyCodes, @"supportedCurrencyCodes", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_supportedMerchantCountryCodes forKey:@"supportedMerchantCountryCodes"];
  [v4 encodeObject:self->_supportedDeviceRegionCountryCodes forKey:@"supportedDeviceRegionCountryCodes"];
  [v4 encodeObject:self->_supportedLanguages forKey:@"supportedLanguages"];
  [v4 encodeObject:self->_programName forKey:@"programName"];
  [v4 encodeObject:self->_issuerName forKey:@"issuerName"];
  [v4 encodeObject:self->_icon forKey:@"iconURL"];
  [v4 encodeObject:self->_disclosureFooter forKey:@"disclosureFooter"];
  [v4 encodeObject:self->_minimumAmounts forKey:@"minimumAmounts"];
  [v4 encodeObject:self->_maximumAmounts forKey:@"maximumAmounts"];
  [v4 encodeObject:self->_associatedStoreIdentifiers forKey:@"associatedStoreIdentifiers"];
  [v4 encodeObject:self->_associatedApplicationIdentifiers forKey:@"associatedApplicationIdentifiers"];
  [v4 encodeObject:self->_appLaunchURL forKey:@"appLaunchURL"];
  [v4 encodeObject:self->_associatedWebDomains forKey:@"associatedWebDomains"];
  [v4 encodeInteger:self->_paymentNetworkIdentifier forKey:@"paymentNetworkIdentifier"];
  [v4 encodeInteger:self->_paymentMethodType forKey:@"paymentMethodType"];
  [v4 encodeBool:self->_requiresChallenge forKey:@"requiresChallenge"];
  [v4 encodeBool:self->_suppressPayInFull forKey:@"suppressPayInFull"];
  [v4 encodeBool:self->_hasPreconfiguredOffers forKey:@"hasPreconfiguredOffers"];
  [v4 encodeObject:self->_localizedPayInFullTitleOverride forKey:@"localizedPayInFullTitleOverride"];
  [v4 encodeObject:self->_localizedPayInFullSubtitleOverride forKey:@"localizedPayInFullSubtitleOverride"];
  [v4 encodeObject:self->_localizedTitleOverride forKey:@"localizedTitleOverride"];
  [v4 encodeObject:self->_localizedSubtitleOverride forKey:@"localizedSubtitleOverride"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v43.receiver = self;
  v43.super_class = (Class)PKPaymentOfferInstallmentCriteria;
  objc_super v5 = -[PKPaymentOfferCriteria copyWithZone:](&v43, sel_copyWithZone_);
  uint64_t v6 = [(NSSet *)self->_supportedCurrencyCodes copyWithZone:a3];
  uint64_t v7 = (void *)v5[8];
  v5[8] = v6;

  uint64_t v8 = [(NSSet *)self->_supportedMerchantCountryCodes copyWithZone:a3];
  uint64_t v9 = (void *)v5[9];
  v5[9] = v8;

  uint64_t v10 = [(NSSet *)self->_supportedDeviceRegionCountryCodes copyWithZone:a3];
  char v11 = (void *)v5[10];
  v5[10] = v10;

  uint64_t v12 = [(NSArray *)self->_supportedLanguages copyWithZone:a3];
  id v13 = (void *)v5[11];
  v5[11] = v12;

  uint64_t v14 = [(NSString *)self->_programName copyWithZone:a3];
  char v15 = (void *)v5[18];
  v5[18] = v14;

  uint64_t v16 = [(NSString *)self->_issuerName copyWithZone:a3];
  uint64_t v17 = (void *)v5[19];
  v5[19] = v16;

  id v18 = [(PKPaymentOfferDynamicContentIcon *)self->_icon copyWithZone:a3];
  uint64_t v19 = (void *)v5[20];
  v5[20] = v18;

  id v20 = [(PKApplyFooterContent *)self->_disclosureFooter copyWithZone:a3];
  v21 = (void *)v5[21];
  v5[21] = v20;

  uint64_t v22 = [(NSArray *)self->_minimumAmounts copyWithZone:a3];
  BOOL v23 = (void *)v5[22];
  v5[22] = v22;

  uint64_t v24 = [(NSArray *)self->_maximumAmounts copyWithZone:a3];
  v25 = (void *)v5[23];
  v5[23] = v24;

  uint64_t v26 = [(NSSet *)self->_associatedStoreIdentifiers copyWithZone:a3];
  BOOL v27 = (void *)v5[24];
  v5[24] = v26;

  uint64_t v28 = [(NSSet *)self->_associatedApplicationIdentifiers copyWithZone:a3];
  uint64_t v29 = (void *)v5[25];
  v5[25] = v28;

  uint64_t v30 = [(NSURL *)self->_appLaunchURL copyWithZone:a3];
  v31 = (void *)v5[27];
  v5[27] = v30;

  uint64_t v32 = [(NSSet *)self->_associatedWebDomains copyWithZone:a3];
  v33 = (void *)v5[26];
  v5[26] = v32;

  v5[12] = self->_paymentNetworkIdentifier;
  v5[13] = self->_paymentMethodType;
  *((unsigned char *)v5 + 56) = self->_requiresChallenge;
  *((unsigned char *)v5 + 57) = self->_suppressPayInFull;
  *((unsigned char *)v5 + 58) = self->_hasPreconfiguredOffers;
  uint64_t v34 = [(NSString *)self->_localizedPayInFullTitleOverride copyWithZone:a3];
  uint64_t v35 = (void *)v5[14];
  v5[14] = v34;

  uint64_t v36 = [(NSString *)self->_localizedPayInFullSubtitleOverride copyWithZone:a3];
  uint64_t v37 = (void *)v5[15];
  v5[15] = v36;

  uint64_t v38 = [(NSString *)self->_localizedTitleOverride copyWithZone:a3];
  uint64_t v39 = (void *)v5[16];
  v5[16] = v38;

  uint64_t v40 = [(NSString *)self->_localizedSubtitleOverride copyWithZone:a3];
  uint64_t v41 = (void *)v5[17];
  v5[17] = v40;

  return v5;
}

- (NSSet)supportedCurrencyCodes
{
  return self->_supportedCurrencyCodes;
}

- (void)setSupportedCurrencyCodes:(id)a3
{
}

- (NSSet)supportedMerchantCountryCodes
{
  return self->_supportedMerchantCountryCodes;
}

- (void)setSupportedMerchantCountryCodes:(id)a3
{
}

- (NSSet)supportedDeviceRegionCountryCodes
{
  return self->_supportedDeviceRegionCountryCodes;
}

- (void)setSupportedDeviceRegionCountryCodes:(id)a3
{
}

- (NSArray)supportedLanguages
{
  return self->_supportedLanguages;
}

- (void)setSupportedLanguages:(id)a3
{
}

- (int64_t)paymentNetworkIdentifier
{
  return self->_paymentNetworkIdentifier;
}

- (void)setPaymentNetworkIdentifier:(int64_t)a3
{
  self->_paymentNetworkIdentifier = a3;
}

- (unint64_t)paymentMethodType
{
  return self->_paymentMethodType;
}

- (void)setPaymentMethodType:(unint64_t)a3
{
  self->_paymentMethodType = a3;
}

- (BOOL)requiresChallenge
{
  return self->_requiresChallenge;
}

- (void)setRequiresChallenge:(BOOL)a3
{
  self->_requiresChallenge = a3;
}

- (void)setSuppressPayInFull:(BOOL)a3
{
  self->_suppressPayInFull = a3;
}

- (BOOL)hasPreconfiguredOffers
{
  return self->_hasPreconfiguredOffers;
}

- (void)setHasPreconfiguredOffers:(BOOL)a3
{
  self->_hasPreconfiguredOffers = a3;
}

- (NSString)localizedPayInFullTitleOverride
{
  return self->_localizedPayInFullTitleOverride;
}

- (void)setLocalizedPayInFullTitleOverride:(id)a3
{
}

- (NSString)localizedPayInFullSubtitleOverride
{
  return self->_localizedPayInFullSubtitleOverride;
}

- (void)setLocalizedPayInFullSubtitleOverride:(id)a3
{
}

- (NSString)localizedTitleOverride
{
  return self->_localizedTitleOverride;
}

- (void)setLocalizedTitleOverride:(id)a3
{
}

- (NSString)localizedSubtitleOverride
{
  return self->_localizedSubtitleOverride;
}

- (void)setLocalizedSubtitleOverride:(id)a3
{
}

- (NSString)programName
{
  return self->_programName;
}

- (void)setProgramName:(id)a3
{
}

- (NSString)issuerName
{
  return self->_issuerName;
}

- (void)setIssuerName:(id)a3
{
}

- (PKPaymentOfferDynamicContentIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (PKApplyFooterContent)disclosureFooter
{
  return self->_disclosureFooter;
}

- (void)setDisclosureFooter:(id)a3
{
}

- (NSArray)minimumAmounts
{
  return self->_minimumAmounts;
}

- (void)setMinimumAmounts:(id)a3
{
}

- (NSArray)maximumAmounts
{
  return self->_maximumAmounts;
}

- (void)setMaximumAmounts:(id)a3
{
}

- (NSSet)associatedStoreIdentifiers
{
  return self->_associatedStoreIdentifiers;
}

- (void)setAssociatedStoreIdentifiers:(id)a3
{
}

- (NSSet)associatedApplicationIdentifiers
{
  return self->_associatedApplicationIdentifiers;
}

- (void)setAssociatedApplicationIdentifiers:(id)a3
{
}

- (NSSet)associatedWebDomains
{
  return self->_associatedWebDomains;
}

- (void)setAssociatedWebDomains:(id)a3
{
}

- (NSURL)appLaunchURL
{
  return self->_appLaunchURL;
}

- (void)setAppLaunchURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLaunchURL, 0);
  objc_storeStrong((id *)&self->_associatedWebDomains, 0);
  objc_storeStrong((id *)&self->_associatedApplicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_associatedStoreIdentifiers, 0);
  objc_storeStrong((id *)&self->_maximumAmounts, 0);
  objc_storeStrong((id *)&self->_minimumAmounts, 0);
  objc_storeStrong((id *)&self->_disclosureFooter, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_issuerName, 0);
  objc_storeStrong((id *)&self->_programName, 0);
  objc_storeStrong((id *)&self->_localizedSubtitleOverride, 0);
  objc_storeStrong((id *)&self->_localizedTitleOverride, 0);
  objc_storeStrong((id *)&self->_localizedPayInFullSubtitleOverride, 0);
  objc_storeStrong((id *)&self->_localizedPayInFullTitleOverride, 0);
  objc_storeStrong((id *)&self->_supportedLanguages, 0);
  objc_storeStrong((id *)&self->_supportedDeviceRegionCountryCodes, 0);
  objc_storeStrong((id *)&self->_supportedMerchantCountryCodes, 0);
  objc_storeStrong((id *)&self->_supportedCurrencyCodes, 0);
}

@end