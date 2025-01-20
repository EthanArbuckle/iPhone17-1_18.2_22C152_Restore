@interface NPKPeerPaymentTransactionDetails
- (NSArray)availableActions;
- (NSDate)availableActionsFetchDate;
- (NSString)serviceIdentifier;
- (PKPaymentTransaction)transaction;
- (id)description;
- (unint64_t)paymentStatus;
- (void)setAvailableActions:(id)a3;
- (void)setAvailableActionsFetchDate:(id)a3;
- (void)setPaymentStatus:(unint64_t)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation NPKPeerPaymentTransactionDetails

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)NPKPeerPaymentTransactionDetails;
  v3 = [(NPKPeerPaymentTransactionDetails *)&v11 description];
  v4 = [(NPKPeerPaymentTransactionDetails *)self serviceIdentifier];
  v5 = NSStringWithNPKPeerPaymentStatus([(NPKPeerPaymentTransactionDetails *)self paymentStatus]);
  v6 = [(NPKPeerPaymentTransactionDetails *)self availableActions];
  v7 = [(NPKPeerPaymentTransactionDetails *)self transaction];
  v8 = [(NPKPeerPaymentTransactionDetails *)self availableActionsFetchDate];
  v9 = [v3 stringByAppendingFormat:@" (service identifier %@ payment status %@ available actions %@ transaction %@ actionFetchDate:%@)", v4, v5, v6, v7, v8];

  return v9;
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (unint64_t)paymentStatus
{
  return self->_paymentStatus;
}

- (void)setPaymentStatus:(unint64_t)a3
{
  self->_paymentStatus = a3;
}

- (NSArray)availableActions
{
  return self->_availableActions;
}

- (void)setAvailableActions:(id)a3
{
}

- (NSDate)availableActionsFetchDate
{
  return self->_availableActionsFetchDate;
}

- (void)setAvailableActionsFetchDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableActionsFetchDate, 0);
  objc_storeStrong((id *)&self->_availableActions, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end