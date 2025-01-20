@interface PKPaymentContactlessProductCredential
- (NSDictionary)readerModeMetadata;
- (NSString)cardSessionToken;
- (NSString)productIdentifier;
- (PKPaymentContactlessProductCredential)init;
- (PKPaymentContactlessProductCredential)initWithPaymentSetupProduct:(id)a3;
- (PKPaymentContactlessProductCredential)initWithPaymentSetupProduct:(id)a3 cardSessionToken:(id)a4;
- (PKPaymentSetupProduct)product;
- (id)setupProductIdentifier;
- (int64_t)_cardTypeFromSetupProductType:(unint64_t)a3;
- (void)setCardSessionToken:(id)a3;
- (void)setProductIdentifier:(id)a3;
- (void)setReaderModeMetadata:(id)a3;
@end

@implementation PKPaymentContactlessProductCredential

- (PKPaymentContactlessProductCredential)init
{
  return [(PKPaymentContactlessProductCredential *)self initWithPaymentSetupProduct:0];
}

- (PKPaymentContactlessProductCredential)initWithPaymentSetupProduct:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentContactlessProductCredential;
  v6 = [(PKPaymentCredential *)&v17 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_11;
  }
  objc_storeStrong((id *)&v6->_product, a3);
  v8 = [v5 configuration];
  v9 = [v8 productIdentifier];
  [(PKPaymentContactlessProductCredential *)v7 setProductIdentifier:v9];

  if (!PKPaymentSetupMergeProductsPartnersAPIEnabled())
  {
    if (([v5 supportedProvisioningMethods] & 1) == 0) {
      goto LABEL_4;
    }
LABEL_7:
    v11 = [v5 provisioningMethodMetadataForType:@"readerMode"];
    v12 = [v11 readerModeMetadata];
    [(PKPaymentContactlessProductCredential *)v7 setReaderModeMetadata:v12];

    goto LABEL_8;
  }
  if ([v5 supportsProvisioningMethodForType:1]) {
    goto LABEL_7;
  }
LABEL_4:
  v10 = [v5 readerModeMetadata];

  if (!v10) {
    goto LABEL_9;
  }
  v11 = [v5 readerModeMetadata];
  [(PKPaymentContactlessProductCredential *)v7 setReaderModeMetadata:v11];
LABEL_8:

LABEL_9:
  v13 = [v5 configuration];
  -[PKPaymentCredential setCardType:](v7, "setCardType:", -[PKPaymentContactlessProductCredential _cardTypeFromSetupProductType:](v7, "_cardTypeFromSetupProductType:", [v13 type]));

  v14 = [v5 configuration];
  uint64_t v15 = [v14 featureIdentifier];

  if (v15) {
    [(PKPaymentCredential *)v7 setCredentialType:PKAccountCredentialType(v15, 0)];
  }
LABEL_11:

  return v7;
}

- (PKPaymentContactlessProductCredential)initWithPaymentSetupProduct:(id)a3 cardSessionToken:(id)a4
{
  id v7 = a4;
  v8 = [(PKPaymentContactlessProductCredential *)self initWithPaymentSetupProduct:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_cardSessionToken, a4);
  }

  return v9;
}

- (int64_t)_cardTypeFromSetupProductType:(unint64_t)a3
{
  if (a3 - 1 > 0xA) {
    return 0;
  }
  else {
    return qword_191674A88[a3 - 1];
  }
}

- (id)setupProductIdentifier
{
  return self->_productIdentifier;
}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
}

- (NSDictionary)readerModeMetadata
{
  return self->_readerModeMetadata;
}

- (void)setReaderModeMetadata:(id)a3
{
}

- (NSString)cardSessionToken
{
  return self->_cardSessionToken;
}

- (void)setCardSessionToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardSessionToken, 0);
  objc_storeStrong((id *)&self->_readerModeMetadata, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_product, 0);
}

@end