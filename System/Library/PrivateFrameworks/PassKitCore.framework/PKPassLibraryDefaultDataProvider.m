@interface PKPassLibraryDefaultDataProvider
- (BOOL)canAddPaymentPass;
- (BOOL)canAddSecureElementPassWithConfiguration:(id)a3;
- (PKPassLibraryDefaultDataProvider)init;
- (PKPassLibraryDefaultDataProvider)initWithPassLibrary:(id)a3;
- (id)passForProvisioningCredentialHash:(id)a3;
- (id)passWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4;
- (id)passWithUniqueID:(id)a3;
- (id)passes;
- (id)paymentPasses;
- (id)peerPaymentPassUniqueID;
- (unint64_t)countOfPasses;
- (void)removePass:(id)a3;
@end

@implementation PKPassLibraryDefaultDataProvider

- (PKPassLibraryDefaultDataProvider)init
{
  v3 = +[PKPassLibrary sharedInstance];
  v4 = [(PKPassLibraryDefaultDataProvider *)self initWithPassLibrary:v3];

  return v4;
}

- (PKPassLibraryDefaultDataProvider)initWithPassLibrary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassLibraryDefaultDataProvider;
  v6 = [(PKPassLibraryDefaultDataProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_library, a3);
  }

  return v7;
}

- (id)passes
{
  return [(PKPassLibrary *)self->_library passes];
}

- (unint64_t)countOfPasses
{
  return [(PKPassLibrary *)self->_library countOfPasses];
}

- (BOOL)canAddPaymentPass
{
  return [(PKPassLibrary *)self->_library canAddPassOfType:1];
}

- (BOOL)canAddSecureElementPassWithConfiguration:(id)a3
{
  return [(PKPassLibrary *)self->_library canAddSecureElementPassWithConfiguration:a3];
}

- (id)paymentPasses
{
  return [(PKPassLibrary *)self->_library passesOfType:1];
}

- (id)passWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  return [(PKPassLibrary *)self->_library passWithPassTypeIdentifier:a3 serialNumber:a4];
}

- (id)passWithUniqueID:(id)a3
{
  return [(PKPassLibrary *)self->_library passWithUniqueID:a3];
}

- (id)peerPaymentPassUniqueID
{
  return [(PKPassLibrary *)self->_library peerPaymentPassUniqueID];
}

- (id)passForProvisioningCredentialHash:(id)a3
{
  return [(PKPassLibrary *)self->_library passForProvisioningCredentialHash:a3];
}

- (void)removePass:(id)a3
{
  library = self->_library;
  id v4 = [a3 uniqueID];
  [(PKPassLibrary *)library removePassWithUniqueID:v4 diagnosticReason:@"Removed via User Interface"];
}

- (void).cxx_destruct
{
}

@end