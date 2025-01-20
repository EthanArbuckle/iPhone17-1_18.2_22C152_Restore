@interface PKPeerPaymentIdentityManager
- (BOOL)isSharingLastName;
- (BOOL)isSharingProfilePicture;
- (NSData)profilePictureData;
- (NSString)displayName;
- (NSString)firstName;
- (NSString)lastName;
- (PKPeerPaymentIdentityManager)init;
- (PKPeerPaymentIdentityManagerDelegate)delegate;
- (PKPeerPaymentProfileAppearanceData)appearanceData;
- (void)commitUpdatesIfNeeded;
- (void)peerPaymentIdentityManager:(id)a3 didUpdateProfileAppearanceData:(id)a4;
- (void)setDelegate:(id)a3;
- (void)toggleSharingLastName;
- (void)toggleSharingProfilePicture;
@end

@implementation PKPeerPaymentIdentityManager

- (PKPeerPaymentIdentityManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentIdentityManager;
  v2 = [(PKPeerPaymentIdentityManager *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_PKPeerPaymentIdentityManager);
    internalManager = v2->_internalManager;
    v2->_internalManager = v3;

    [(_PKPeerPaymentIdentityManager *)v2->_internalManager setDelegate:v2];
  }
  return v2;
}

- (void)commitUpdatesIfNeeded
{
}

- (PKPeerPaymentProfileAppearanceData)appearanceData
{
  return [(_PKPeerPaymentIdentityManager *)self->_internalManager appearanceData];
}

- (NSString)firstName
{
  return [(_PKPeerPaymentIdentityManager *)self->_internalManager firstName];
}

- (NSString)lastName
{
  return [(_PKPeerPaymentIdentityManager *)self->_internalManager lastName];
}

- (BOOL)isSharingLastName
{
  return [(_PKPeerPaymentIdentityManager *)self->_internalManager shareLastName];
}

- (NSData)profilePictureData
{
  return [(_PKPeerPaymentIdentityManager *)self->_internalManager profilePictureData];
}

- (BOOL)isSharingProfilePicture
{
  return [(_PKPeerPaymentIdentityManager *)self->_internalManager shareProfilePicture];
}

- (NSString)displayName
{
  v2 = [(_PKPeerPaymentIdentityManager *)self->_internalManager appearanceData];
  v3 = [v2 displayName];

  return (NSString *)v3;
}

- (void)toggleSharingLastName
{
  internalManager = self->_internalManager;
  uint64_t v3 = [(PKPeerPaymentIdentityManager *)self isSharingLastName] ^ 1;

  [(_PKPeerPaymentIdentityManager *)internalManager setShareLastName:v3];
}

- (void)toggleSharingProfilePicture
{
  internalManager = self->_internalManager;
  uint64_t v3 = [(PKPeerPaymentIdentityManager *)self isSharingProfilePicture] ^ 1;

  [(_PKPeerPaymentIdentityManager *)internalManager setShareProfilePicture:v3];
}

- (void)peerPaymentIdentityManager:(id)a3 didUpdateProfileAppearanceData:(id)a4
{
  id v6 = [(PKPeerPaymentIdentityManager *)self delegate];
  v5 = [(PKPeerPaymentIdentityManager *)self appearanceData];
  [v6 peerPaymentIdentityManager:self didUpdateAppearanceData:v5];
}

- (PKPeerPaymentIdentityManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPeerPaymentIdentityManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_internalManager, 0);
}

@end