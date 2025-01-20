@interface PKPendingStatefulTransferProvisioning
+ (BOOL)supportsSecureCoding;
- (BOOL)representsCredential:(id)a3;
- (BOOL)representsPass:(id)a3;
- (NSString)accountAttestationAnonymizationSalt;
- (NSString)originalShareURL;
- (NSString)transportIdentifier;
- (PKPassShare)share;
- (PKPendingStatefulTransferProvisioning)init;
- (PKPendingStatefulTransferProvisioning)initWithCoder:(id)a3;
- (PKPendingStatefulTransferProvisioning)initWithTransportIdentifier:(id)a3 invitation:(id)a4 share:(id)a5;
- (PKSharingMessage)invitation;
- (id)credential;
- (id)credentialWithHandle:(id)a3;
- (id)initForDatabase;
- (id)type;
- (void)_copyIntoPendingProvision:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountAttestationAnonymizationSalt:(id)a3;
- (void)setInvitation:(id)a3;
- (void)setOriginalShareURL:(id)a3;
- (void)setShare:(id)a3;
- (void)setTransportIdentifier:(id)a3;
@end

@implementation PKPendingStatefulTransferProvisioning

- (PKPendingStatefulTransferProvisioning)init
{
  return 0;
}

- (id)initForDatabase
{
  v3.receiver = self;
  v3.super_class = (Class)PKPendingStatefulTransferProvisioning;
  return [(PKPendingStatefulTransferProvisioning *)&v3 init];
}

- (PKPendingStatefulTransferProvisioning)initWithTransportIdentifier:(id)a3 invitation:(id)a4 share:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v11 identifier];
  v18.receiver = self;
  v18.super_class = (Class)PKPendingStatefulTransferProvisioning;
  v13 = [(PKPendingProvisioning *)&v18 initWithUniqueIdentifier:v12 status:1];

  if (v13)
  {
    objc_storeStrong((id *)&v13->_transportIdentifier, a3);
    objc_storeStrong((id *)&v13->_invitation, a4);
    invitation = v13->_invitation;
    id v15 = objc_alloc_init(MEMORY[0x1E4F29128]);
    v16 = [v15 UUIDString];
    [(PKSharingMessage *)invitation setIdentifier:v16];

    objc_storeStrong((id *)&v13->_share, a5);
  }

  return v13;
}

- (id)type
{
  return @"StatefulTransfer";
}

- (BOOL)representsCredential:(id)a3
{
  id v4 = a3;
  if ([v4 isStatefulTransferCredential])
  {
    v5 = [v4 statefulTransferCredential];
    v6 = [v5 handle];
    v7 = [v6 transportIdentifier];
    transportIdentifier = self->_transportIdentifier;
    id v9 = v7;
    id v10 = transportIdentifier;
    if (v9 == v10)
    {
    }
    else
    {
      id v11 = v10;
      LOBYTE(v12) = 0;
      if (!v9 || !v10)
      {
        v14 = v9;
LABEL_42:

        goto LABEL_43;
      }
      BOOL v13 = [(NSString *)v9 isEqualToString:v10];

      if (!v13)
      {
        LOBYTE(v12) = 0;
LABEL_43:

        goto LABEL_44;
      }
    }
    v40 = v6;
    v14 = [v5 invitation];
    id v15 = [v14 identifier];
    v16 = [(PKSharingMessage *)self->_invitation identifier];
    id v11 = v15;
    v17 = v16;
    objc_super v18 = v17;
    if (v11 == v17)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v17;
      v20 = v11;
      if (!v11 || !v17) {
        goto LABEL_40;
      }
      BOOL v21 = [(NSString *)v11 isEqualToString:v17];

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_41:

        v6 = v40;
        goto LABEL_42;
      }
    }
    v38 = [v5 share];
    v22 = [v38 identifier];
    v23 = [(PKPassShare *)self->_share identifier];
    v19 = v22;
    v24 = v23;
    v39 = v24;
    if (v19 != v24)
    {
      LOBYTE(v12) = 0;
      if (v19)
      {
        v25 = v24;
        v37 = v19;
        if (v24)
        {
          BOOL v26 = [(NSString *)v19 isEqualToString:v24];

          if (!v26)
          {
            LOBYTE(v12) = 0;
LABEL_39:
            v20 = (NSString *)v38;

LABEL_40:
            goto LABEL_41;
          }
LABEL_22:
          v36 = v14;
          v27 = [v5 originalShareURL];
          originalShareURL = self->_originalShareURL;
          v25 = v27;
          v29 = originalShareURL;
          if (v25 == v29)
          {
          }
          else
          {
            v30 = v29;
            LOBYTE(v12) = 0;
            if (!v25 || !v29)
            {
              v37 = v25;
LABEL_36:

              v14 = v36;
              goto LABEL_37;
            }
            BOOL v12 = [(NSString *)v25 isEqualToString:v29];

            if (!v12)
            {
              v14 = v36;
LABEL_38:

              goto LABEL_39;
            }
          }
          v37 = v25;
          v31 = [v5 accountAttestationAnonymizationSalt];
          accountAttestationAnonymizationSalt = self->_accountAttestationAnonymizationSalt;
          v30 = v31;
          v33 = accountAttestationAnonymizationSalt;
          v34 = v33;
          if (v30 == v33)
          {
            LOBYTE(v12) = 1;
          }
          else
          {
            LOBYTE(v12) = 0;
            if (v30 && v33) {
              LOBYTE(v12) = [(NSString *)v30 isEqualToString:v33];
            }
          }

          v25 = v30;
          goto LABEL_36;
        }
      }
      else
      {
        v25 = v24;
        v37 = 0;
      }
LABEL_37:

      v25 = v37;
      goto LABEL_38;
    }

    goto LABEL_22;
  }
  LOBYTE(v12) = 0;
LABEL_44:

  return v12;
}

- (BOOL)representsPass:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(PKSharingMessage *)self->_invitation readerIdentifier];
    if (v5)
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v6 = [v4 devicePaymentApplications];
      uint64_t v22 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v22)
      {
        uint64_t v7 = *(void *)v29;
        v23 = v6;
        uint64_t v21 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v29 != v7) {
              objc_enumerationMutation(v6);
            }
            id v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            long long v24 = 0u;
            long long v25 = 0u;
            long long v26 = 0u;
            long long v27 = 0u;
            id v10 = [v9 subcredentials];
            uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
            if (v11)
            {
              uint64_t v12 = v11;
              uint64_t v13 = *(void *)v25;
              while (2)
              {
                for (uint64_t j = 0; j != v12; ++j)
                {
                  if (*(void *)v25 != v13) {
                    objc_enumerationMutation(v10);
                  }
                  id v15 = [*(id *)(*((void *)&v24 + 1) + 8 * j) pairedReaderIdentifier];
                  id v16 = v5;
                  v17 = v16;
                  if (v15 == v16)
                  {

LABEL_26:
                    BOOL v19 = 1;
                    v6 = v23;
                    goto LABEL_28;
                  }
                  if (v15)
                  {
                    char v18 = [v15 isEqualToString:v16];

                    if (v18) {
                      goto LABEL_26;
                    }
                  }
                  else
                  {
                  }
                }
                uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
                v6 = v23;
                uint64_t v7 = v21;
                if (v12) {
                  continue;
                }
                break;
              }
            }
          }
          BOOL v19 = 0;
          uint64_t v22 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v22);
      }
      else
      {
        BOOL v19 = 0;
      }
LABEL_28:
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (id)credential
{
  id v3 = +[PKSharingExistingChannelDescriptor existingForTransportIdentifier:self->_transportIdentifier];
  id v4 = +[PKSharingChannelHandle createHandleForDescriptor:v3 queue:MEMORY[0x1E4F14428]];
  if (v4)
  {
    v5 = [(PKPendingStatefulTransferProvisioning *)self credentialWithHandle:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)credentialWithHandle:(id)a3
{
  id v4 = a3;
  v5 = [[PKStatefulTransferCredential alloc] initWithSharingChannelHandle:v4 invitation:self->_invitation share:self->_share];

  [(PKStatefulTransferCredential *)v5 setOriginalShareURL:self->_originalShareURL];
  [(PKStatefulTransferCredential *)v5 setAccountAttestationAnonymizationSalt:self->_accountAttestationAnonymizationSalt];
  v6 = [(PKPendingProvisioning *)self provisioningState];

  if (v6)
  {
    uint64_t v7 = [(PKPendingProvisioning *)self provisioningState];
    [(PKPaymentCredential *)v5 setState:v7];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPendingStatefulTransferProvisioning)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPendingStatefulTransferProvisioning;
  v5 = [(PKPendingProvisioning *)&v20 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transportIdentifier"];
    transportIdentifier = v5->_transportIdentifier;
    v5->_transportIdentifier = (NSString *)v6;

    id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v9 = objc_opt_class();
    id v10 = objc_msgSend(v8, "initWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"invitation"];
    invitation = v5->_invitation;
    v5->_invitation = (PKSharingMessage *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"share"];
    share = v5->_share;
    v5->_share = (PKPassShare *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalShareURL"];
    originalShareURL = v5->_originalShareURL;
    v5->_originalShareURL = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountAttestationAnonymizationSalt"];
    accountAttestationAnonymizationSalt = v5->_accountAttestationAnonymizationSalt;
    v5->_accountAttestationAnonymizationSalt = (NSString *)v17;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPendingStatefulTransferProvisioning;
  id v4 = a3;
  [(PKPendingProvisioning *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_transportIdentifier, @"transportIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_invitation forKey:@"invitation"];
  [v4 encodeObject:self->_share forKey:@"share"];
  [v4 encodeObject:self->_originalShareURL forKey:@"originalShareURL"];
  [v4 encodeObject:self->_accountAttestationAnonymizationSalt forKey:@"accountAttestationAnonymizationSalt"];
}

- (void)_copyIntoPendingProvision:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PKPendingStatefulTransferProvisioning;
  id v4 = a3;
  [(PKPendingProvisioning *)&v13 _copyIntoPendingProvision:v4];
  uint64_t v5 = [(NSString *)self->_transportIdentifier copy];
  uint64_t v6 = (void *)*((void *)v4 + 7);
  *((void *)v4 + 7) = v5;

  objc_storeStrong((id *)v4 + 8, self->_invitation);
  uint64_t v7 = [(PKPassShare *)self->_share copy];
  id v8 = (void *)*((void *)v4 + 9);
  *((void *)v4 + 9) = v7;

  uint64_t v9 = [(NSString *)self->_originalShareURL copy];
  id v10 = (void *)*((void *)v4 + 10);
  *((void *)v4 + 10) = v9;

  uint64_t v11 = [(NSString *)self->_accountAttestationAnonymizationSalt copy];
  uint64_t v12 = (void *)*((void *)v4 + 11);
  *((void *)v4 + 11) = v11;
}

- (NSString)transportIdentifier
{
  return self->_transportIdentifier;
}

- (void)setTransportIdentifier:(id)a3
{
}

- (PKSharingMessage)invitation
{
  return self->_invitation;
}

- (void)setInvitation:(id)a3
{
}

- (PKPassShare)share
{
  return self->_share;
}

- (void)setShare:(id)a3
{
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
  objc_storeStrong((id *)&self->_transportIdentifier, 0);
}

@end