@interface PKStatefulTransferCredential
- (NSString)accountAttestationAnonymizationSalt;
- (NSString)originalShareURL;
- (PKPassShare)share;
- (PKSharingChannelHandle)handle;
- (PKSharingMessage)invitation;
- (PKStatefulTransferCredential)initWithSharingChannelHandle:(id)a3 invitation:(id)a4 share:(id)a5;
- (void)setAccountAttestationAnonymizationSalt:(id)a3;
- (void)setOriginalShareURL:(id)a3;
@end

@implementation PKStatefulTransferCredential

- (PKStatefulTransferCredential)initWithSharingChannelHandle:(id)a3 invitation:(id)a4 share:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKStatefulTransferCredential;
  v12 = [(PKPaymentCredential *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_handle, a3);
    objc_storeStrong((id *)&v13->_invitation, a4);
    objc_storeStrong((id *)&v13->_share, a5);
  }

  return v13;
}

- (PKSharingChannelHandle)handle
{
  return self->_handle;
}

- (PKSharingMessage)invitation
{
  return self->_invitation;
}

- (PKPassShare)share
{
  return self->_share;
}

- (NSString)originalShareURL
{
  return self->_originalShareURL;
}

- (void)setOriginalShareURL:(id)a3
{
}

- (NSString)accountAttestationAnonymizationSalt
{
  return self->_accountAttestationAnonymizationSalt;
}

- (void)setAccountAttestationAnonymizationSalt:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountAttestationAnonymizationSalt, 0);
  objc_storeStrong((id *)&self->_originalShareURL, 0);
  objc_storeStrong((id *)&self->_share, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end