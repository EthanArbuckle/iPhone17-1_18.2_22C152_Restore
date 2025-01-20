@interface PKPaymentTransactionIconRequest
- (BOOL)ignoreLogoURL;
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (NSArray)completionHandlers;
- (NSString)cacheKey;
- (PKMerchant)merchant;
- (PKPayLaterMerchant)payLaterMerchant;
- (PKPaymentTransaction)transaction;
- (id)logoURL;
- (unint64_t)hash;
- (void)setCacheKey:(id)a3;
- (void)setCompletionHandlers:(id)a3;
- (void)setIgnoreLogoURL:(BOOL)a3;
- (void)setMerchant:(id)a3;
- (void)setPayLaterMerchant:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setTransaction:(id)a3;
@end

@implementation PKPaymentTransactionIconRequest

- (id)logoURL
{
  if (self->_transaction)
  {
    v2 = [(PKPaymentTransaction *)self->_transaction merchant];
    uint64_t v3 = [v2 logoImageURL];
LABEL_3:
    v4 = (void *)v3;

    goto LABEL_6;
  }
  if (self->_merchant)
  {
    v4 = [(PKMerchant *)self->_merchant logoImageURL];
  }
  else
  {
    payLaterMerchant = self->_payLaterMerchant;
    if (payLaterMerchant)
    {
      v2 = [(PKPayLaterMerchant *)payLaterMerchant mapsBrand];
      uint64_t v3 = [v2 logoURL];
      goto LABEL_3;
    }
    v4 = 0;
  }
LABEL_6:

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (double *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (self->_size.width == v4[7] ? (BOOL v5 = self->_size.height == v4[8]) : (BOOL v5 = 0), v5))
  {
    v7 = (void *)*((void *)v4 + 5);
    v8 = self->_cacheKey;
    v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {
      char v6 = 1;
    }
    else
    {
      char v6 = 0;
      if (v8 && v9) {
        char v6 = [(NSString *)v8 isEqualToString:v9];
      }
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  [(NSString *)self->_cacheKey hash];
  PKDoubleHash();

  return PKDoubleHash();
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (PKMerchant)merchant
{
  return self->_merchant;
}

- (void)setMerchant:(id)a3
{
}

- (PKPayLaterMerchant)payLaterMerchant
{
  return self->_payLaterMerchant;
}

- (void)setPayLaterMerchant:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (NSString)cacheKey
{
  return self->_cacheKey;
}

- (void)setCacheKey:(id)a3
{
}

- (NSArray)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
}

- (BOOL)ignoreLogoURL
{
  return self->_ignoreLogoURL;
}

- (void)setIgnoreLogoURL:(BOOL)a3
{
  self->_ignoreLogoURL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_payLaterMerchant, 0);
  objc_storeStrong((id *)&self->_merchant, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end