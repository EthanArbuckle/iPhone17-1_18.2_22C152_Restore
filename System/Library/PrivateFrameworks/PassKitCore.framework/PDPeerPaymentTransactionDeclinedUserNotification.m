@interface PDPeerPaymentTransactionDeclinedUserNotification
- (id)_messageString;
- (id)_titleString;
- (unint64_t)notificationType;
@end

@implementation PDPeerPaymentTransactionDeclinedUserNotification

- (unint64_t)notificationType
{
  return 13;
}

- (id)_titleString
{
  return (id)PKLocalizedPeerPaymentString(@"PEER_PAYMENT_TRANSACTION_DECLINED_NOTIFICATION_TITLE");
}

- (id)_messageString
{
  v2 = [(PDPeerPaymentTransactionUserNotification *)self paymentTransaction];
  unint64_t v3 = (unint64_t)[v2 transactionDeclinedReason] - 1;
  if (v3 > 2) {
    v4 = @"PEER_PAYMENT_TRANSACTION_DECLINED_GENERIC_NOTIFICATION_MESSAGE";
  }
  else {
    v4 = off_100744198[v3];
  }
  v5 = PKLocalizedPeerPaymentString(&v4->isa);

  return v5;
}

@end