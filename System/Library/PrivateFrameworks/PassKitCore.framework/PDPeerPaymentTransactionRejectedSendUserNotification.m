@interface PDPeerPaymentTransactionRejectedSendUserNotification
- (id)_messageString;
- (unint64_t)notificationType;
@end

@implementation PDPeerPaymentTransactionRejectedSendUserNotification

- (unint64_t)notificationType
{
  return 11;
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
    v11 = PKLocalizedPeerPaymentLexingtonString(@"PEER_PAYMENT_TRANSACTION_NOTIFICATION_FAMILY_MEMBER_P2P_SEND_REJECTED", @"%@", v10);
  }
  else
  {
    v11 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_TRANSACTION_REJECTED_NOTIFICATION_TITLE");
  }
  v12 = PKLocalizedPaymentString(@"AMOUNT_FORMAT_REIMBURSEMENT", @"%@", v9);

  v13 = +[NSString stringWithFormat:@"%@\n%@", v11, v12];

  return v13;
}

@end