@interface PKActivityEventPeerPaymentTransaction
- (BOOL)isEqualToActivityEvent:(id)a3;
- (PKActivityEventPeerPaymentTransaction)initWithTransaction:(id)a3 relatedTopUpWithdrawlTransaction:(id)a4 relatedTopUpDepositTransaction:(id)a5 unread:(BOOL)a6;
- (PKPaymentTransaction)relatedTopUpFundingSourceWithdrawlTransaction;
- (PKPaymentTransaction)relatedTopUpPeerPaymentAccountDepositTransaction;
- (id)eventType;
- (unint64_t)hash;
@end

@implementation PKActivityEventPeerPaymentTransaction

- (PKActivityEventPeerPaymentTransaction)initWithTransaction:(id)a3 relatedTopUpWithdrawlTransaction:(id)a4 relatedTopUpDepositTransaction:(id)a5 unread:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKActivityEventPeerPaymentTransaction;
  v13 = [(PKActivityEventTransaction *)&v16 initWithTransaction:a3 unread:v6];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_relatedTopUpPeerPaymentAccountDepositTransaction, a5);
    objc_storeStrong((id *)&v14->_relatedTopUpFundingSourceWithdrawlTransaction, a4);
  }

  return v14;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)PKActivityEventPeerPaymentTransaction;
  unint64_t v3 = [(PKActivityEventTransaction *)&v6 hash];
  unint64_t v4 = [(PKPaymentTransaction *)self->_relatedTopUpFundingSourceWithdrawlTransaction hash] - v3 + 32 * v3;
  return [(PKPaymentTransaction *)self->_relatedTopUpPeerPaymentAccountDepositTransaction hash] - v4 + 32 * v4;
}

- (BOOL)isEqualToActivityEvent:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v9 = 0;
    goto LABEL_12;
  }
  v5 = v4;
  v14.receiver = self;
  v14.super_class = (Class)PKActivityEventPeerPaymentTransaction;
  if ([(PKActivityEventTransaction *)&v14 isEqualToActivityEvent:v5])
  {
    relatedTopUpFundingSourceWithdrawlTransaction = self->_relatedTopUpFundingSourceWithdrawlTransaction;
    v7 = (PKPaymentTransaction *)v5[6];
    if (relatedTopUpFundingSourceWithdrawlTransaction) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      if (relatedTopUpFundingSourceWithdrawlTransaction == v7)
      {
LABEL_14:
        relatedTopUpPeerPaymentAccountDepositTransaction = self->_relatedTopUpPeerPaymentAccountDepositTransaction;
        id v12 = (PKPaymentTransaction *)v5[7];
        if (relatedTopUpPeerPaymentAccountDepositTransaction) {
          BOOL v13 = v12 == 0;
        }
        else {
          BOOL v13 = 1;
        }
        if (v13) {
          BOOL v9 = relatedTopUpPeerPaymentAccountDepositTransaction == v12;
        }
        else {
          BOOL v9 = -[PKPaymentTransaction isEqual:](relatedTopUpPeerPaymentAccountDepositTransaction, "isEqual:");
        }
        goto LABEL_10;
      }
    }
    else if (-[PKPaymentTransaction isEqual:](relatedTopUpFundingSourceWithdrawlTransaction, "isEqual:"))
    {
      goto LABEL_14;
    }
  }
  BOOL v9 = 0;
LABEL_10:

LABEL_12:
  return v9;
}

- (id)eventType
{
  return @"peerPaymentTransaction";
}

- (PKPaymentTransaction)relatedTopUpFundingSourceWithdrawlTransaction
{
  return self->_relatedTopUpFundingSourceWithdrawlTransaction;
}

- (PKPaymentTransaction)relatedTopUpPeerPaymentAccountDepositTransaction
{
  return self->_relatedTopUpPeerPaymentAccountDepositTransaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedTopUpPeerPaymentAccountDepositTransaction, 0);
  objc_storeStrong((id *)&self->_relatedTopUpFundingSourceWithdrawlTransaction, 0);
}

@end