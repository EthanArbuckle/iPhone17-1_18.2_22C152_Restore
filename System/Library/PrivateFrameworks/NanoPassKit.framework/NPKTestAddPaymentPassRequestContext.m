@interface NPKTestAddPaymentPassRequestContext
- (NSString)cardEncryptionScheme;
- (NSString)cardFlow;
- (NSString)cardID;
- (NSString)cardIssuer;
- (NSString)cardPNO;
- (NSString)cardProduct;
- (NSString)cardType;
- (void)setCardEncryptionScheme:(id)a3;
- (void)setCardFlow:(id)a3;
- (void)setCardID:(id)a3;
- (void)setCardIssuer:(id)a3;
- (void)setCardPNO:(id)a3;
- (void)setCardProduct:(id)a3;
- (void)setCardType:(id)a3;
@end

@implementation NPKTestAddPaymentPassRequestContext

- (NSString)cardPNO
{
  return self->_cardPNO;
}

- (void)setCardPNO:(id)a3
{
}

- (NSString)cardFlow
{
  return self->_cardFlow;
}

- (void)setCardFlow:(id)a3
{
}

- (NSString)cardID
{
  return self->_cardID;
}

- (void)setCardID:(id)a3
{
}

- (NSString)cardType
{
  return self->_cardType;
}

- (void)setCardType:(id)a3
{
}

- (NSString)cardIssuer
{
  return self->_cardIssuer;
}

- (void)setCardIssuer:(id)a3
{
}

- (NSString)cardProduct
{
  return self->_cardProduct;
}

- (void)setCardProduct:(id)a3
{
}

- (NSString)cardEncryptionScheme
{
  return self->_cardEncryptionScheme;
}

- (void)setCardEncryptionScheme:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardEncryptionScheme, 0);
  objc_storeStrong((id *)&self->_cardProduct, 0);
  objc_storeStrong((id *)&self->_cardIssuer, 0);
  objc_storeStrong((id *)&self->_cardType, 0);
  objc_storeStrong((id *)&self->_cardID, 0);
  objc_storeStrong((id *)&self->_cardFlow, 0);
  objc_storeStrong((id *)&self->_cardPNO, 0);
}

@end