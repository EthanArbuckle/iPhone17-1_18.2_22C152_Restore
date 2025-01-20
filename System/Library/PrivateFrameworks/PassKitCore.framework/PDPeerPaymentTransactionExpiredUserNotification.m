@interface PDPeerPaymentTransactionExpiredUserNotification
- (id)_messageString;
- (unint64_t)notificationType;
@end

@implementation PDPeerPaymentTransactionExpiredUserNotification

- (unint64_t)notificationType
{
  return 10;
}

- (id)_messageString
{
  v2 = [(PDPeerPaymentTransactionUserNotification *)self paymentTransaction];
  v3 = [v2 subtotalCurrencyAmount];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v2 currencyAmount];
  }
  v6 = v5;

  v7 = [v6 minimalFormattedStringValue];
  v8 = PKLocalizedPaymentString(@"AMOUNT_FORMAT_REIMBURSEMENT", @"%@", v7);

  v9 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_TRANSACTION_EXPIRED_NOTIFICATION_TITLE");
  v10 = +[NSString stringWithFormat:@"%@\n%@", v9, v8];

  return v10;
}

@end