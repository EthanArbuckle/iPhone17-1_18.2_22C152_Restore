@interface PDPeerPaymentAssociatedAccountTransactionReceivedUserNotification
- (id)_messageString;
- (unint64_t)notificationType;
@end

@implementation PDPeerPaymentAssociatedAccountTransactionReceivedUserNotification

- (unint64_t)notificationType
{
  return 31;
}

- (id)_messageString
{
  v3 = [(PDPeerPaymentTransactionUserNotification *)self familyMember];
  v4 = [(PDPeerPaymentTransactionUserNotification *)self paymentTransaction];
  unsigned int v5 = [v4 isRecurring];
  v6 = @"PEER_PAYMENT_TRANSACTION_NOTIFICATION_FAMILY_MEMBER_P2P_RECEIVE";
  if (v5) {
    v6 = @"PEER_PAYMENT_TRANSACTION_NOTIFICATION_FAMILY_MEMBER_P2P_RECEIVE_RECURRING";
  }
  v7 = v6;
  v8 = [v3 firstName];
  v9 = [v4 formattedBalanceAdjustmentAmount];
  v10 = [(PDPeerPaymentTransactionUserNotification *)self _formattedCounterpartName];
  v11 = PKLocalizedPeerPaymentLexingtonString(v7, @"%@%@%@", v8, v9, v10);

  return v11;
}

@end