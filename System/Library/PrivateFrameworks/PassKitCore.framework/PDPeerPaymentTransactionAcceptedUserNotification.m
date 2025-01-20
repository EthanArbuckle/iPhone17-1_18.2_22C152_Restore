@interface PDPeerPaymentTransactionAcceptedUserNotification
- (id)_messageString;
- (unint64_t)notificationType;
@end

@implementation PDPeerPaymentTransactionAcceptedUserNotification

- (unint64_t)notificationType
{
  return 9;
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
  v8 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_TRANSACTION_ACCEPTED_NOTIFICATION_TITLE");
  v9 = +[NSString stringWithFormat:@"%@\n%@", v8, v7];

  return v9;
}

@end