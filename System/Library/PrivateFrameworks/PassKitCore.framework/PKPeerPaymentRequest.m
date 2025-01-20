@interface PKPeerPaymentRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)hasUndeterminedRecipient;
- (BOOL)isEqual:(id)a3;
- (BOOL)isP2P;
- (PKPeerPaymentQuote)peerPaymentQuote;
- (PKPeerPaymentRequest)initWithCoder:(id)a3;
- (PKPeerPaymentRequest)initWithPeerPaymentQuote:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasUndeterminedRecipient:(BOOL)a3;
@end

@implementation PKPeerPaymentRequest

- (PKPeerPaymentRequest)initWithPeerPaymentQuote:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PKPeerPaymentRequest;
  v6 = [(PKPaymentRequest *)&v28 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_peerPaymentQuote, a3);
    [(PKPaymentRequest *)v7 setRequestType:9];
    v8 = [MEMORY[0x1E4F1CAD0] set];
    [(PKPaymentRequest *)v7 setRequiredShippingContactFields:v8];

    v9 = [MEMORY[0x1E4F1CAD0] set];
    [(PKPaymentRequest *)v7 setRequiredBillingContactFields:v9];

    v10 = [v5 totalReceiveAmountCurrency];
    [(PKPaymentRequest *)v7 setCurrencyCode:v10];

    v11 = [v5 firstQuoteItemOfType:1];
    v12 = v11;
    if (v11)
    {
      v13 = [v11 merchantIdentifier];
      [(PKPaymentRequest *)v7 setMerchantIdentifier:v13];

      v14 = [v12 supportedNetworks];
      [(PKPaymentRequest *)v7 setSupportedNetworks:v14];

      -[PKPaymentRequest setMerchantCapabilities:](v7, "setMerchantCapabilities:", [v12 merchantCapabilities]);
      v15 = [v12 countryCode];
      [(PKPaymentRequest *)v7 setCountryCode:v15];

      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v17 = [v12 countryCode];
      objc_msgSend(v16, "pk_safelyAddObject:", v17);

      v18 = [v12 supportedFundingSourceCountryCodes];
      uint64_t v19 = [v18 count];

      if (v19)
      {
        v20 = [v12 supportedFundingSourceCountryCodes];
        [v16 unionSet:v20];
      }
      v21 = (void *)[v16 copy];
      [(PKPaymentRequest *)v7 setSupportedCountries:v21];

      v22 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"post", 0);
      [(PKPaymentRequest *)v7 setRequiredBillingContactFields:v22];
    }
    uint64_t v23 = [v5 firstQuoteItemOfType:3];
    uint64_t v24 = [v5 firstQuoteItemOfType:4];
    if (v23 | v24)
    {
      [(PKPaymentRequest *)v7 setConfirmationStyle:1];
      if (v24)
      {
        [(PKPaymentRequest *)v7 setSupportsInstantFundsIn:1];
        v25 = [(id)v24 supportedNetworks];
        [(PKPaymentRequest *)v7 setSupportedNetworks:v25];

        v26 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"post", 0);
        [(PKPaymentRequest *)v7 setRequiredBillingContactFields:v26];
      }
    }
    [(PKPaymentRequest *)v7 setClientCallbackTimeout:65.0];
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13.receiver = self;
    v13.super_class = (Class)PKPeerPaymentRequest;
    if ([(PKPaymentRequest *)&v13 isEqual:v4])
    {
      id v5 = (unsigned __int8 *)v4;
      peerPaymentQuote = self->_peerPaymentQuote;
      v7 = [v5 peerPaymentQuote];
      v8 = v7;
      if (peerPaymentQuote) {
        BOOL v9 = v7 == 0;
      }
      else {
        BOOL v9 = 1;
      }
      if (v9)
      {

        if (peerPaymentQuote == v8)
        {
LABEL_12:
          BOOL v10 = self->_hasUndeterminedRecipient == v5[544];
          goto LABEL_13;
        }
      }
      else
      {
        BOOL v11 = [(PKPeerPaymentQuote *)peerPaymentQuote isEqual:v7];

        if (v11) {
          goto LABEL_12;
        }
      }
      BOOL v10 = 0;
LABEL_13:

      goto LABEL_14;
    }
  }
  BOOL v10 = 0;
LABEL_14:

  return v10;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_peerPaymentQuote];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentRequest;
  id v5 = [(PKPaymentRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerPaymentQuote"];
    peerPaymentQuote = v5->_peerPaymentQuote;
    v5->_peerPaymentQuote = (PKPeerPaymentQuote *)v6;

    v5->_hasUndeterminedRecipient = [v4 decodeBoolForKey:@"hasUndeterminedRecipient"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentRequest;
  id v4 = a3;
  [(PKPaymentRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_peerPaymentQuote, @"peerPaymentQuote", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_hasUndeterminedRecipient forKey:@"hasUndeterminedRecipient"];
}

- (BOOL)isP2P
{
  return (([(PKPeerPaymentQuote *)self->_peerPaymentQuote destinationType] - 1) & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (PKPeerPaymentQuote)peerPaymentQuote
{
  return self->_peerPaymentQuote;
}

- (BOOL)hasUndeterminedRecipient
{
  return self->_hasUndeterminedRecipient;
}

- (void)setHasUndeterminedRecipient:(BOOL)a3
{
  self->_hasUndeterminedRecipient = a3;
}

- (void).cxx_destruct
{
}

@end