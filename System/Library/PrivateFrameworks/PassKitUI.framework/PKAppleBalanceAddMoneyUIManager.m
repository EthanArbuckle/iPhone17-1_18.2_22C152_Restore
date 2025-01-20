@interface PKAppleBalanceAddMoneyUIManager
- (PKAppleBalanceAddMoneyUIManager)initWithAccount:(id)a3;
- (void)presentAMSRedeemGiftcardFromViewController:(id)a3 webViewDelegate:(id)a4;
- (void)presentAddMoneyFromViewController:(id)a3 dtuConfiguration:(id)a4 inStoreToken:(id)a5;
- (void)presentAddMoneyInterstitialFromViewController:(id)a3 dtuConfiguration:(id)a4 inStoreToken:(id)a5;
- (void)presentDirectTopUpFromViewController:(id)a3 context:(int64_t)a4 configuration:(id)a5 promotion:(id)a6 completion:(id)a7;
- (void)presentInStoreTopUpFromViewController:(id)a3 context:(int64_t)a4 token:(id)a5;
@end

@implementation PKAppleBalanceAddMoneyUIManager

- (PKAppleBalanceAddMoneyUIManager)initWithAccount:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAppleBalanceAddMoneyUIManager;
  v5 = [(PKAppleBalanceAddMoneyUIManager *)&v9 init];
  if (v5)
  {
    v6 = [[_PKAppleBalanceAddMoneyUIManager alloc] initWithAccount:v4];
    manager = v5->_manager;
    v5->_manager = v6;
  }
  return v5;
}

- (void)presentAddMoneyFromViewController:(id)a3 dtuConfiguration:(id)a4 inStoreToken:(id)a5
{
}

- (void)presentAddMoneyInterstitialFromViewController:(id)a3 dtuConfiguration:(id)a4 inStoreToken:(id)a5
{
}

- (void)presentDirectTopUpFromViewController:(id)a3 context:(int64_t)a4 configuration:(id)a5 promotion:(id)a6 completion:(id)a7
{
}

- (void)presentAMSRedeemGiftcardFromViewController:(id)a3 webViewDelegate:(id)a4
{
}

- (void)presentInStoreTopUpFromViewController:(id)a3 context:(int64_t)a4 token:(id)a5
{
}

- (void).cxx_destruct
{
}

@end