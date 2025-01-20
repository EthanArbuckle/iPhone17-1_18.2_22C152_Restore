@interface PKPaymentPurchasedProductCredential
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPaymentPurchasedProductCredential:(id)a3;
- (NSString)productIdentifier;
- (NSString)statusDescription;
- (NSString)summaryMetadataDescription;
- (PKPaymentPurchasedProductCredential)initWithPaymentSetupProduct:(id)a3 purchase:(id)a4;
- (PKPaymentSetupProduct)product;
- (PKServiceProviderPurchase)purchase;
- (id)metadata;
- (id)setupProductIdentifier;
- (unint64_t)hash;
- (void)setProduct:(id)a3;
- (void)setProductIdentifier:(id)a3;
@end

@implementation PKPaymentPurchasedProductCredential

- (PKPaymentPurchasedProductCredential)initWithPaymentSetupProduct:(id)a3 purchase:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(PKPaymentCredential *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_product, a3);
    v11 = [v7 configuration];
    v12 = [v11 productIdentifier];
    uint64_t v13 = [v12 copy];
    productIdentifier = v10->_productIdentifier;
    v10->_productIdentifier = (NSString *)v13;

    objc_storeStrong((id *)&v10->_purchase, a4);
    v15 = [v7 displayName];
    v16 = (void *)[v15 copy];
    [(PKPaymentCredential *)v10 setLongDescription:v16];
  }
  return v10;
}

- (id)metadata
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(PKServiceProviderPurchase *)self->_purchase visibleTransactionIdentifier];
  if (v4
    || ([(PKServiceProviderPurchase *)self->_purchase identifier],
        (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v18[0] = @"valueType";
    v18[1] = @"value";
    v19[0] = @"text";
    v19[1] = v4;
    v18[2] = @"localizedDisplayName";
    v5 = PKLocalizedPaymentString(&cfstr_SetupPurchaseT.isa, 0);
    v19[2] = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];

    id v7 = +[PKPaymentCredentialMetadata paymentCredentialMetadataWithConfiguration:v6];
    [v3 addObject:v7];
  }
  id v8 = [(PKServiceProviderPurchase *)self->_purchase purchaseDate];
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E4F28D48];
    v10 = [MEMORY[0x1E4F1CAF0] localTimeZone];
    v11 = [v9 stringFromDate:v8 timeZone:v10 formatOptions:1907];

    v16[0] = @"valueType";
    v16[1] = @"value";
    v17[0] = @"date";
    v17[1] = v11;
    v17[2] = @"EdMMMyyyy";
    v16[2] = @"displayFormat";
    v16[3] = @"localizedDisplayName";
    v12 = PKLocalizedPaymentString(&cfstr_SetupPurchaseD.isa, 0);
    v17[3] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];

    v14 = +[PKPaymentCredentialMetadata paymentCredentialMetadataWithConfiguration:v13];
    [v3 addObject:v14];
  }
  return v3;
}

- (NSString)summaryMetadataDescription
{
  uint64_t v3 = [(PKServiceProviderPurchase *)self->_purchase purchaseDate];
  v4 = (void *)v3;
  if (v3)
  {
    v5 = PKShortDateString(v3);
    v6 = PKLocalizedPaymentString(&cfstr_SetupPurchaseS.isa, &stru_1EE0F6808.isa, v5);
  }
  else
  {
    v6 = [(PKPaymentPurchasedProductCredential *)self statusDescription];
  }

  return (NSString *)v6;
}

- (NSString)statusDescription
{
  v2 = [(PKServiceProviderPurchase *)self->_purchase state];
  switch((unint64_t)v2)
  {
    case 0uLL:
      uint64_t v3 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Invalid purchase state: Unknown", v6, 2u);
      }

      v2 = &stru_1EE0F5368;
      break;
    case 1uLL:
      v4 = @"SETUP_PURCHASE_STATE_METADATA_PENDING";
      goto LABEL_8;
    case 2uLL:
      v4 = @"SETUP_PURCHASE_STATE_METADATA_COMPLETE";
      goto LABEL_8;
    case 3uLL:
      v4 = @"SETUP_PURCHASE_STATE_METADATA_REFUNDED";
LABEL_8:
      PKLocalizedPaymentString(&v4->isa, 0);
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }
  return (NSString *)v2;
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(PKPaymentPurchasedProductCredential *)self statusDescription];
  [v3 safelyAddObject:v4];

  v5 = [(PKPaymentPurchasedProductCredential *)self metadata];
  [v3 safelyAddObject:v5];

  [v3 safelyAddObject:self->_productIdentifier];
  [v3 safelyAddObject:self->_purchase];
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentPurchasedProductCredential;
  id v6 = [(PKPaymentCredential *)&v9 hash];
  unint64_t v7 = PKCombinedHash((uint64_t)v6, v3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(PKPaymentPurchasedProductCredential *)self isEqualToPaymentPurchasedProductCredential:v4];

  return v5;
}

- (BOOL)isEqualToPaymentPurchasedProductCredential:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PKPaymentPurchasedProductCredential *)self statusDescription];
  id v6 = [v4 statusDescription];
  id v7 = v5;
  id v8 = v6;
  objc_super v9 = v8;
  if (v7 == v8)
  {

    goto LABEL_7;
  }
  BOOL v10 = 0;
  v11 = v8;
  v12 = v7;
  if (!v7 || !v8) {
    goto LABEL_23;
  }
  int v13 = [v7 isEqualToString:v8];

  if (v13)
  {
LABEL_7:
    v12 = [(PKPaymentPurchasedProductCredential *)self metadata];
    uint64_t v14 = [v4 metadata];
    v11 = (void *)v14;
    if (v12 && v14)
    {
      if (([v12 isEqual:v14] & 1) == 0) {
        goto LABEL_22;
      }
    }
    else if (v12 != (void *)v14)
    {
      goto LABEL_22;
    }
    v15 = (void *)v4[14];
    v16 = self->_productIdentifier;
    v17 = v15;
    if (v16 == v17)
    {

      goto LABEL_18;
    }
    v18 = v17;
    if (v16 && v17)
    {
      BOOL v19 = [(NSString *)v16 isEqualToString:v17];

      if (!v19) {
        goto LABEL_22;
      }
LABEL_18:
      purchase = self->_purchase;
      v21 = (PKServiceProviderPurchase *)v4[15];
      if (purchase && v21) {
        BOOL v10 = -[PKServiceProviderPurchase isEqual:](purchase, "isEqual:");
      }
      else {
        BOOL v10 = purchase == v21;
      }
      goto LABEL_23;
    }

LABEL_22:
    BOOL v10 = 0;
LABEL_23:

    goto LABEL_24;
  }
  BOOL v10 = 0;
LABEL_24:

  return v10;
}

- (id)setupProductIdentifier
{
  return self->_productIdentifier;
}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (void)setProduct:(id)a3
{
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
}

- (PKServiceProviderPurchase)purchase
{
  return self->_purchase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchase, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_product, 0);
}

@end