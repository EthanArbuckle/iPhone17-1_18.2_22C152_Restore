@interface PKPaymentSetupProductCategory
- (BOOL)allowOnManagedAccount;
- (BOOL)needsProducts;
- (NSSet)productIdentifiers;
- (NSSet)regions;
- (NSString)identifier;
- (NSString)localizedDisplayName;
- (NSString)localizedSearchBarDefaultText;
- (NSString)localizedTitle;
- (PKPaymentSetupProductCategory)initWithDictionary:(id)a3;
- (PKPaymentSetupProductImageAssetURLs)imageAssetURLs;
- (PKPaymentSetupProductImageAssets)imageAssets;
- (id)description;
- (id)localizedSubtitleWithIsBridge:(BOOL)a3;
- (unint64_t)capabilities;
- (unint64_t)excludedContexts;
- (void)setCapabilities:(unint64_t)a3;
- (void)setExcludedContexts:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageAssetURLs:(id)a3;
- (void)setImageAssets:(id)a3;
- (void)setLocalizedDisplayName:(id)a3;
- (void)setProductIdentifiers:(id)a3;
- (void)setRegions:(id)a3;
@end

@implementation PKPaymentSetupProductCategory

- (PKPaymentSetupProductCategory)initWithDictionary:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v71.receiver = self;
  v71.super_class = (Class)PKPaymentSetupProductCategory;
  v5 = [(PKPaymentSetupProductCategory *)&v71 init];
  if (!v5) {
    goto LABEL_58;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v4 PKStringForKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 PKStringForKey:@"localizedDisplayName"];
    localizedDisplayName = v5->_localizedDisplayName;
    v5->_localizedDisplayName = (NSString *)v8;

    uint64_t v10 = [v4 PKStringForKey:@"localizedTitle"];
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v10;

    uint64_t v12 = [v4 PKStringForKey:@"localizedSubtitle"];
    localizedSubtitle = v5->_localizedSubtitle;
    v5->_localizedSubtitle = (NSString *)v12;

    uint64_t v14 = [v4 PKStringForKey:@"localizedSearchBarDefaultText"];
    localizedSearchBarDefaultText = v5->_localizedSearchBarDefaultText;
    v5->_localizedSearchBarDefaultText = (NSString *)v14;

    v16 = [PKPaymentSetupProductImageAssetURLs alloc];
    v17 = [v4 PKDictionaryForKey:@"imageAssets"];
    uint64_t v18 = [(PKPaymentSetupProductImageAssetURLs *)v16 initWithImageAssetsDictionary:v17];
    imageAssetURLs = v5->_imageAssetURLs;
    v5->_imageAssetURLs = (PKPaymentSetupProductImageAssetURLs *)v18;

    v20 = objc_alloc_init(PKPaymentSetupProductImageAssets);
    imageAssets = v5->_imageAssets;
    v5->_imageAssets = v20;

    uint64_t v22 = [v4 PKSetForKey:@"productIdentifiers"];
    productIdentifiers = v5->_productIdentifiers;
    v5->_productIdentifiers = (NSSet *)v22;

    v5->_allowOnManagedAccount = [v4 PKBoolForKey:@"allowOnManagedAccount"];
    v24 = [v4 PKStringForKey:@"region"];
    uint64_t v25 = [v24 componentsSeparatedByString:@","];

    if (v25)
    {
      v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v25];
      uint64_t v27 = [v26 copy];
      regions = v5->_regions;
      v5->_regions = (NSSet *)v27;
    }
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v29 = objc_msgSend(v4, "PKArrayForKey:", @"capabilities", v25);
    uint64_t v30 = [v29 countByEnumeratingWithState:&v67 objects:v73 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v68 != v32) {
            objc_enumerationMutation(v29);
          }
          if ([*(id *)(*((void *)&v67 + 1) + 8 * i) isEqualToString:@"nfc"]) {
            v5->_capabilities |= 1uLL;
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v67 objects:v73 count:16];
      }
      while (v31);
    }

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v34 = [v4 PKArrayForKey:@"excludedContexts"];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v63 objects:v72 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v64;
      do
      {
        uint64_t v38 = 0;
        do
        {
          if (*(void *)v64 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = (__CFString *)*(id *)(*((void *)&v63 + 1) + 8 * v38);
          if (v39 == @"setupAssistant") {
            goto LABEL_22;
          }
          v40 = v39;
          if (!v39) {
            goto LABEL_24;
          }
          char v41 = [(__CFString *)v39 isEqualToString:@"setupAssistant"];

          if (v41)
          {
LABEL_22:
            uint64_t v42 = 1;
LABEL_23:
            v5->_excludedContexts |= v42;
            goto LABEL_24;
          }
          v43 = v40;
          if (v43 == @"watch"
            || (v44 = v43,
                char v45 = [(__CFString *)v43 isEqualToString:@"watch"],
                v44,
                (v45 & 1) != 0))
          {
            uint64_t v42 = 2;
            goto LABEL_23;
          }
          v46 = v44;
          if (v46 == @"merchantApp"
            || (v47 = v46,
                int v48 = [(__CFString *)v46 isEqualToString:@"merchantApp"],
                v47,
                v48))
          {
            uint64_t v42 = 4;
            goto LABEL_23;
          }
LABEL_24:
          ++v38;
        }
        while (v36 != v38);
        uint64_t v49 = [v34 countByEnumeratingWithState:&v63 objects:v72 count:16];
        uint64_t v36 = v49;
      }
      while (v49);
    }

    if ([(NSString *)v5->_identifier isEqualToString:@"creditDebit"])
    {
      v50 = v62;
      if (!v5->_localizedTitle)
      {
        uint64_t v51 = PKLocalizedPaymentString(&cfstr_PaymentSetupCr_0.isa, 0);
        v52 = v5->_localizedTitle;
        v5->_localizedTitle = (NSString *)v51;
      }
      if (v5->_localizedSearchBarDefaultText) {
        goto LABEL_57;
      }
      v53 = @"PAYMENT_SETUP_CREDIT_DEBIT_SEARCH_DEFAULT";
      goto LABEL_44;
    }
    v50 = v62;
    if ([(NSString *)v5->_identifier isEqualToString:@"transit"])
    {
      if (!v5->_localizedTitle)
      {
        uint64_t v55 = PKLocalizedPaymentString(&cfstr_PaymentSetupRi.isa, 0);
        v56 = v5->_localizedTitle;
        v5->_localizedTitle = (NSString *)v55;
      }
      if (v5->_localizedSearchBarDefaultText) {
        goto LABEL_57;
      }
      v53 = @"PAYMENT_SETUP_RIDE_TRANSIT_SEARCH_DEFAULT";
LABEL_44:
      uint64_t v57 = PKLocalizedPaymentString(&v53->isa, 0);
      v58 = v5->_localizedSearchBarDefaultText;
      v5->_localizedSearchBarDefaultText = (NSString *)v57;
LABEL_56:

      goto LABEL_57;
    }
    if ([(NSString *)v5->_identifier isEqualToString:@"identity"])
    {
      if (!v5->_localizedTitle)
      {
        uint64_t v59 = PKLocalizedIdentityString(&cfstr_PaymentSetupId_0.isa, 0);
LABEL_55:
        v58 = v5->_localizedTitle;
        v5->_localizedTitle = (NSString *)v59;
        goto LABEL_56;
      }
LABEL_57:

LABEL_58:
      v54 = v5;
      goto LABEL_59;
    }
    if ([(NSString *)v5->_identifier isEqualToString:@"eMoney"])
    {
      if (v5->_localizedTitle) {
        goto LABEL_57;
      }
      v60 = @"PAYMENT_SETUP_EMONEY_TITLE";
    }
    else
    {
      if (![(NSString *)v5->_identifier isEqualToString:@"carKey"] || v5->_localizedTitle) {
        goto LABEL_57;
      }
      v60 = @"PAYMENT_SETUP_CARKEY_TITLE";
    }
    uint64_t v59 = PKLocalizedPaymentString(&v60->isa, 0);
    goto LABEL_55;
  }
  v54 = 0;
LABEL_59:

  return v54;
}

- (id)localizedSubtitleWithIsBridge:(BOOL)a3
{
  localizedSubtitle = self->_localizedSubtitle;
  if (localizedSubtitle)
  {
    id v4 = localizedSubtitle;
    goto LABEL_6;
  }
  BOOL v5 = a3;
  if ([(NSString *)self->_identifier isEqualToString:@"creditDebit"])
  {
    v7 = @"PAYMENT_SETUP_CREDIT_DEBIT_SUBTITLE";
LABEL_5:
    PKLocalizedPaymentString(&v7->isa, 0);
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if ([(NSString *)self->_identifier isEqualToString:@"transit"])
  {
    if (v5)
    {
      v7 = @"PAYMENT_SETUP_TRANSIT_SUBTITLE_WATCH";
    }
    else if (PKIsPairedWithWatch())
    {
      v7 = @"PAYMENT_SETUP_TRANSIT_SUBTITLE_PHONE_WATCH";
    }
    else
    {
      v7 = @"PAYMENT_SETUP_TRANSIT_SUBTITLE_PHONE";
    }
    goto LABEL_5;
  }
  if ([(NSString *)self->_identifier isEqualToString:@"identity"])
  {
    PKLocalizedIdentityString(&cfstr_PaymentSetupId_1.isa, 0);
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ([(NSString *)self->_identifier isEqualToString:@"eMoney"])
    {
      v7 = @"PAYMENT_SETUP_EMONEY_SUBTITLE";
      goto LABEL_5;
    }
    if ([(NSString *)self->_identifier isEqualToString:@"carKey"])
    {
      v7 = @"PAYMENT_SETUP_CARKEY_SUBTITLE";
      goto LABEL_5;
    }
    id v4 = 0;
  }
LABEL_6:
  return v4;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  [v3 appendFormat:@"localizedDisplayName: '%@'; ", self->_localizedDisplayName];
  [v3 appendFormat:@"productIdentifiers: '%@'; ", self->_productIdentifiers];
  [v3 appendFormat:@">"];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (BOOL)needsProducts
{
  if ([(NSString *)self->_identifier isEqualToString:@"yourCards"]
    || [(NSString *)self->_identifier isEqualToString:@"appExtensions"])
  {
    return 0;
  }
  else
  {
    return ![(NSString *)self->_identifier isEqualToString:@"creditDebit"];
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (void)setLocalizedDisplayName:(id)a3
{
}

- (NSSet)regions
{
  return self->_regions;
}

- (void)setRegions:(id)a3
{
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedSearchBarDefaultText
{
  return self->_localizedSearchBarDefaultText;
}

- (unint64_t)excludedContexts
{
  return self->_excludedContexts;
}

- (void)setExcludedContexts:(unint64_t)a3
{
  self->_excludedContexts = a3;
}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(unint64_t)a3
{
  self->_capabilities = a3;
}

- (PKPaymentSetupProductImageAssetURLs)imageAssetURLs
{
  return self->_imageAssetURLs;
}

- (void)setImageAssetURLs:(id)a3
{
}

- (PKPaymentSetupProductImageAssets)imageAssets
{
  return self->_imageAssets;
}

- (void)setImageAssets:(id)a3
{
}

- (BOOL)allowOnManagedAccount
{
  return self->_allowOnManagedAccount;
}

- (NSSet)productIdentifiers
{
  return self->_productIdentifiers;
}

- (void)setProductIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productIdentifiers, 0);
  objc_storeStrong((id *)&self->_imageAssets, 0);
  objc_storeStrong((id *)&self->_imageAssetURLs, 0);
  objc_storeStrong((id *)&self->_localizedSearchBarDefaultText, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
}

@end