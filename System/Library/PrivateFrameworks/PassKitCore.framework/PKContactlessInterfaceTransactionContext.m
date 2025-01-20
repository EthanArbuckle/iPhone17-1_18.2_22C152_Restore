@interface PKContactlessInterfaceTransactionContext
- (BOOL)isIncompatible;
- (BOOL)success;
- (NSArray)activatedPaymentApplications;
- (NSArray)valueAddedServicePasses;
- (NSArray)valueAddedServiceTransactions;
- (NSDate)date;
- (NSString)appletIdentifier;
- (NSString)credentialIdentifier;
- (PKContactlessInterfaceTransactionContext)initWithPaymentPass:(id)a3 activatedPaymentApplications:(id)a4;
- (PKExpressTransactionState)expressState;
- (PKFelicaAppletHistory)felicaHistory;
- (PKPaymentApplication)paymentApplication;
- (PKPaymentPass)paymentPass;
- (PKPaymentTransaction)transaction;
- (PKTransitAppletHistory)transitHistory;
- (void)setAppletIdentifier:(id)a3;
- (void)setCredentialIdentifier:(id)a3;
- (void)setDate:(id)a3;
- (void)setExpressState:(id)a3;
- (void)setIncompatible:(BOOL)a3;
- (void)setPaymentApplication:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)setTransaction:(id)a3;
- (void)setTransitHistory:(id)a3;
- (void)setValueAddedServicePasses:(id)a3;
- (void)setValueAddedServiceTransactions:(id)a3;
@end

@implementation PKContactlessInterfaceTransactionContext

- (PKContactlessInterfaceTransactionContext)initWithPaymentPass:(id)a3 activatedPaymentApplications:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKContactlessInterfaceTransactionContext;
  v9 = [(PKContactlessInterfaceTransactionContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paymentPass, a3);
    objc_storeStrong((id *)&v10->_activatedPaymentApplications, a4);
  }

  return v10;
}

- (PKFelicaAppletHistory)felicaHistory
{
  return (PKFelicaAppletHistory *)[(PKTransitAppletHistory *)self->_transitHistory felicaHistory];
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (BOOL)isIncompatible
{
  return self->_incompatible;
}

- (void)setIncompatible:(BOOL)a3
{
  self->_incompatible = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (PKPaymentApplication)paymentApplication
{
  return self->_paymentApplication;
}

- (void)setPaymentApplication:(id)a3
{
}

- (NSArray)activatedPaymentApplications
{
  return self->_activatedPaymentApplications;
}

- (NSString)appletIdentifier
{
  return self->_appletIdentifier;
}

- (void)setAppletIdentifier:(id)a3
{
}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (void)setCredentialIdentifier:(id)a3
{
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (NSArray)valueAddedServicePasses
{
  return self->_valueAddedServicePasses;
}

- (void)setValueAddedServicePasses:(id)a3
{
}

- (NSArray)valueAddedServiceTransactions
{
  return self->_valueAddedServiceTransactions;
}

- (void)setValueAddedServiceTransactions:(id)a3
{
}

- (PKTransitAppletHistory)transitHistory
{
  return self->_transitHistory;
}

- (void)setTransitHistory:(id)a3
{
}

- (PKExpressTransactionState)expressState
{
  return self->_expressState;
}

- (void)setExpressState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expressState, 0);
  objc_storeStrong((id *)&self->_transitHistory, 0);
  objc_storeStrong((id *)&self->_valueAddedServiceTransactions, 0);
  objc_storeStrong((id *)&self->_valueAddedServicePasses, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
  objc_storeStrong((id *)&self->_appletIdentifier, 0);
  objc_storeStrong((id *)&self->_activatedPaymentApplications, 0);
  objc_storeStrong((id *)&self->_paymentApplication, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end