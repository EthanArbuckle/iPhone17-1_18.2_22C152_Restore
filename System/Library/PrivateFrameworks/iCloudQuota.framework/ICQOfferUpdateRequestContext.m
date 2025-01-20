@interface ICQOfferUpdateRequestContext
- (ACAccount)account;
- (ACAccountStore)accountStore;
- (BOOL)isZeroAction;
- (NSString)buttonId;
- (NSString)offerId;
- (void)setAccount:(id)a3;
- (void)setAccountStore:(id)a3;
- (void)setButtonId:(id)a3;
- (void)setOfferId:(id)a3;
- (void)setZeroAction:(BOOL)a3;
@end

@implementation ICQOfferUpdateRequestContext

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (NSString)buttonId
{
  return self->_buttonId;
}

- (void)setButtonId:(id)a3
{
}

- (NSString)offerId
{
  return self->_offerId;
}

- (void)setOfferId:(id)a3
{
}

- (BOOL)isZeroAction
{
  return self->_zeroAction;
}

- (void)setZeroAction:(BOOL)a3
{
  self->_zeroAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offerId, 0);
  objc_storeStrong((id *)&self->_buttonId, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end