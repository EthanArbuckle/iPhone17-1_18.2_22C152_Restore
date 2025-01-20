@interface PKMerchantToken
- (BOOL)isAMPPaymentToken;
- (BOOL)isAppleCashPaymentToken;
- (BOOL)isDeferredPayment;
- (NSString)appleMerchantId;
- (NSString)merchantName;
- (NSString)merchantTokenId;
- (NSString)tokenCategory;
- (NSURL)merchantIconURL;
- (NSURL)merchantTokenManagementURL;
- (PKMerchantToken)initWithDictionary:(id)a3;
- (PKMerchantToken)initWithMerchantTokenId:(id)a3 appleMerchantId:(id)a4 merchantName:(id)a5 merchantIconURL:(id)a6 merchantTokenManagementURL:(id)a7 tokenCategory:(id)a8 isDeferredPayment:(BOOL)a9;
@end

@implementation PKMerchantToken

- (PKMerchantToken)initWithMerchantTokenId:(id)a3 appleMerchantId:(id)a4 merchantName:(id)a5 merchantIconURL:(id)a6 merchantTokenManagementURL:(id)a7 tokenCategory:(id)a8 isDeferredPayment:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v31.receiver = self;
  v31.super_class = (Class)PKMerchantToken;
  v21 = [(PKMerchantToken *)&v31 init];
  if (v21)
  {
    uint64_t v22 = [v15 copy];
    merchantTokenId = v21->_merchantTokenId;
    v21->_merchantTokenId = (NSString *)v22;

    uint64_t v24 = [v16 copy];
    appleMerchantId = v21->_appleMerchantId;
    v21->_appleMerchantId = (NSString *)v24;

    uint64_t v26 = [v17 copy];
    merchantName = v21->_merchantName;
    v21->_merchantName = (NSString *)v26;

    objc_storeStrong((id *)&v21->_merchantIconURL, a6);
    objc_storeStrong((id *)&v21->_merchantTokenManagementURL, a7);
    uint64_t v28 = [v20 copy];
    tokenCategory = v21->_tokenCategory;
    v21->_tokenCategory = (NSString *)v28;

    v21->_isDeferredPayment = a9;
  }

  return v21;
}

- (PKMerchantToken)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v20.receiver = self;
    v20.super_class = (Class)PKMerchantToken;
    v5 = [(PKMerchantToken *)&v20 init];
    if (v5)
    {
      uint64_t v6 = [v4 PKStringForKey:@"merchantTokenId"];
      merchantTokenId = v5->_merchantTokenId;
      v5->_merchantTokenId = (NSString *)v6;

      uint64_t v8 = [v4 PKStringForKey:@"appleMerchantId"];
      appleMerchantId = v5->_appleMerchantId;
      v5->_appleMerchantId = (NSString *)v8;

      uint64_t v10 = [v4 PKStringForKey:@"merchantName"];
      merchantName = v5->_merchantName;
      v5->_merchantName = (NSString *)v10;

      uint64_t v12 = [v4 PKURLForKey:@"merchantIconURL"];
      merchantIconURL = v5->_merchantIconURL;
      v5->_merchantIconURL = (NSURL *)v12;

      uint64_t v14 = [v4 PKURLForKey:@"merchantTokenManagementURL"];
      merchantTokenManagementURL = v5->_merchantTokenManagementURL;
      v5->_merchantTokenManagementURL = (NSURL *)v14;

      uint64_t v16 = [v4 PKStringForKey:@"tokenCategory"];
      tokenCategory = v5->_tokenCategory;
      v5->_tokenCategory = (NSString *)v16;

      id v18 = [v4 PKDictionaryForKey:@"tokenRequestAttributes"];
      v5->_isDeferredPayment = [v18 PKBoolForKey:@"deferredPayment"];
    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (BOOL)isAMPPaymentToken
{
  return [(NSString *)self->_tokenCategory isEqualToString:@"amp_payment_token"];
}

- (BOOL)isAppleCashPaymentToken
{
  return [(NSString *)self->_tokenCategory isEqualToString:@"cash_auto_payment"];
}

- (NSString)merchantTokenId
{
  return self->_merchantTokenId;
}

- (NSString)appleMerchantId
{
  return self->_appleMerchantId;
}

- (NSString)merchantName
{
  return self->_merchantName;
}

- (NSURL)merchantIconURL
{
  return self->_merchantIconURL;
}

- (NSURL)merchantTokenManagementURL
{
  return self->_merchantTokenManagementURL;
}

- (NSString)tokenCategory
{
  return self->_tokenCategory;
}

- (BOOL)isDeferredPayment
{
  return self->_isDeferredPayment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenCategory, 0);
  objc_storeStrong((id *)&self->_merchantTokenManagementURL, 0);
  objc_storeStrong((id *)&self->_merchantIconURL, 0);
  objc_storeStrong((id *)&self->_merchantName, 0);
  objc_storeStrong((id *)&self->_appleMerchantId, 0);
  objc_storeStrong((id *)&self->_merchantTokenId, 0);
}

@end