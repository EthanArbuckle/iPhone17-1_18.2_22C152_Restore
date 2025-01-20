@interface PDPeerPaymentAssociatedAccountTransactionSendUserNotification
- (id)_messageString;
- (unint64_t)notificationType;
@end

@implementation PDPeerPaymentAssociatedAccountTransactionSendUserNotification

- (unint64_t)notificationType
{
  return 34;
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

  unsigned int v9 = [v4 isRecurring];
  v10 = @"PEER_PAYMENT_TRANSACTION_NOTIFICATION_FAMILY_MEMBER_P2P_SEND";
  if (v9) {
    v10 = @"PEER_PAYMENT_TRANSACTION_NOTIFICATION_FAMILY_MEMBER_P2P_SEND_RECURRING";
  }
  v11 = v10;
  v12 = [v3 firstName];
  v13 = [v8 minimalFormattedStringValue];
  v14 = [(PDPeerPaymentTransactionUserNotification *)self _formattedCounterpartName];
  v15 = PKLocalizedPeerPaymentLexingtonString(v11, @"%@%@%@", v12, v13, v14);

  return v15;
}

@end