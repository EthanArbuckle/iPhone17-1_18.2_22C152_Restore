@interface PKPendingStatefulTransferProvisioningReference
+ (BOOL)supportsSecureCoding;
- (BOOL)representsCredential:(id)a3;
- (BOOL)representsPass:(id)a3;
- (NSString)accountAttestationAnonymizationSalt;
- (NSString)invitationURL;
- (PKPassShare)share;
- (PKPendingStatefulTransferProvisioningReference)init;
- (PKPendingStatefulTransferProvisioningReference)initWithCoder:(id)a3;
- (PKPendingStatefulTransferProvisioningReference)initWithInvitationURL:(id)a3 share:(id)a4;
- (id)type;
- (void)_copyIntoPendingProvision:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountAttestationAnonymizationSalt:(id)a3;
@end

@implementation PKPendingStatefulTransferProvisioningReference

- (PKPendingStatefulTransferProvisioningReference)init
{
  return 0;
}

- (PKPendingStatefulTransferProvisioningReference)initWithInvitationURL:(id)a3 share:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v8 identifier];
  v12.receiver = self;
  v12.super_class = (Class)PKPendingStatefulTransferProvisioningReference;
  v10 = [(PKPendingProvisioning *)&v12 initWithUniqueIdentifier:v9 status:1];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_invitationURL, a3);
    objc_storeStrong((id *)&v10->_share, a4);
  }

  return v10;
}

- (id)type
{
  return @"StatefulTransferReference";
}

- (BOOL)representsCredential:(id)a3
{
  return 0;
}

- (BOOL)representsPass:(id)a3
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPendingStatefulTransferProvisioningReference)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPendingStatefulTransferProvisioningReference;
  v5 = [(PKPendingProvisioning *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"invitationURL"];
    invitationURL = v5->_invitationURL;
    v5->_invitationURL = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"share"];
    share = v5->_share;
    v5->_share = (PKPassShare *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountAttestationAnonymizationSalt"];
    accountAttestationAnonymizationSalt = v5->_accountAttestationAnonymizationSalt;
    v5->_accountAttestationAnonymizationSalt = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPendingStatefulTransferProvisioningReference;
  id v4 = a3;
  [(PKPendingProvisioning *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_invitationURL, @"invitationURL", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_share forKey:@"share"];
  [v4 encodeObject:self->_accountAttestationAnonymizationSalt forKey:@"accountAttestationAnonymizationSalt"];
}

- (void)_copyIntoPendingProvision:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PKPendingStatefulTransferProvisioningReference;
  id v4 = a3;
  [(PKPendingProvisioning *)&v11 _copyIntoPendingProvision:v4];
  uint64_t v5 = [(NSString *)self->_invitationURL copy];
  uint64_t v6 = (void *)v4[7];
  v4[7] = v5;

  uint64_t v7 = [(PKPassShare *)self->_share copy];
  uint64_t v8 = (void *)v4[8];
  v4[8] = v7;

  uint64_t v9 = [(NSString *)self->_accountAttestationAnonymizationSalt copy];
  uint64_t v10 = (void *)v4[9];
  v4[9] = v9;
}

- (NSString)invitationURL
{
  return self->_invitationURL;
}

- (PKPassShare)share
{
  return self->_share;
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
  objc_storeStrong((id *)&self->_share, 0);
  objc_storeStrong((id *)&self->_invitationURL, 0);
}

@end