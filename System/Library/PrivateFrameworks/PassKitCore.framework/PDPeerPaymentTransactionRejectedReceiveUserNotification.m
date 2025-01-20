@interface PDPeerPaymentTransactionRejectedReceiveUserNotification
- (id)_messageString;
- (unint64_t)notificationType;
@end

@implementation PDPeerPaymentTransactionRejectedReceiveUserNotification

- (unint64_t)notificationType
{
  return 35;
}

- (id)_messageString
{
  v3 = [(PDPeerPaymentTransactionUserNotification *)self familyMember];
  v4 = [(PDPeerPaymentTransactionUserNotification *)self paymentTransaction];
  v5 = [v4 subtotalCurrencyAmount];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [v4 currencyAmount];
  }
  v8 = v7;

  v9 = [v8 minimalFormattedStringValue];
  if (v3)
  {
    v10 = [v3 firstName];
    v11 = PKLocalizedPeerPaymentLexingtonString(@"PEER_PAYMENT_TRANSACTION_NOTIFICATION_FAMILY_MEMBER_P2P_RECEIVE_REJECTED", @"%@", v10);

    uint64_t v12 = PKLocalizedPaymentString(@"AMOUNT_FORMAT_REIMBURSEMENT", @"%@", v9);

    v9 = (void *)v12;
  }
  else
  {
    v11 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_TRANSACTION_REJECTED_NOTIFICATION_TITLE");
  }
  v13 = +[NSString stringWithFormat:@"%@\n%@", v11, v9];

  return v13;
}

@end