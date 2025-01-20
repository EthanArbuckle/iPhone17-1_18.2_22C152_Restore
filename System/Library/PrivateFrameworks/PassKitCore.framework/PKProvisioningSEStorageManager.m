@interface PKProvisioningSEStorageManager
- (PKProvisioningSEStorageManager)init;
- (PKProvisioningSEStorageManager)initWithWebService:(id)a3;
- (void)debugPerformSECleanup:(id)a3;
- (void)debugReservationDescriptions:(id)a3;
- (void)deleteReservation:(id)a3 completion:(id)a4;
- (void)reserveStorageForAppletTypes:(id)a3 metadata:(id)a4 completion:(id)a5;
@end

@implementation PKProvisioningSEStorageManager

- (PKProvisioningSEStorageManager)init
{
  v3 = +[PKPaymentWebService sharedService];
  v4 = [(PKProvisioningSEStorageManager *)self initWithWebService:v3];

  return v4;
}

- (PKProvisioningSEStorageManager)initWithWebService:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKProvisioningSEStorageManager;
    v5 = [(PKProvisioningSEStorageManager *)&v10 init];
    if (v5)
    {
      v6 = [[_PKProvisioningSEStorageManager alloc] initWithWebService:v4];
      manager = v5->_manager;
      v5->_manager = v6;
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)reserveStorageForAppletTypes:(id)a3 metadata:(id)a4 completion:(id)a5
{
}

- (void)deleteReservation:(id)a3 completion:(id)a4
{
}

- (void)debugReservationDescriptions:(id)a3
{
}

- (void)debugPerformSECleanup:(id)a3
{
}

- (void).cxx_destruct
{
}

@end