@interface SSVPlaybackLeaseConfiguration
- (NSString)storeFrontSuffix;
- (NSURL)beginLeaseURL;
- (NSURL)certificateURL;
- (NSURL)getAssetURL;
- (NSURL)pastisCertificateURL;
- (NSURL)pastisKeyServerURL;
- (NSURL)provisionMachineURL;
- (NSURL)refreshLeaseURL;
- (NSURL)syncMachineURL;
- (SSVPlaybackLeaseConfiguration)initWithCertificateURL:(id)a3 leaseType:(int64_t)a4 leaseURL:(id)a5 pastisKeyServerURL:(id)a6 provisionMachineURL:(id)a7 storeFrontSuffix:(id)a8 syncMachineURL:(id)a9;
- (SSVPlaybackLeaseConfiguration)initWithCertificateURL:(id)a3 leaseURL:(id)a4 pastisKeyServerURL:(id)a5 provisionMachineURL:(id)a6 storeFrontSuffix:(id)a7 syncMachineURL:(id)a8;
- (SSVPlaybackLeaseConfiguration)initWithURLBagDictionary:(id)a3;
- (SSVPlaybackLeaseConfiguration)initWithURLBagDictionary:(id)a3 leaseType:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)leaseType;
- (void)setBeginLeaseURL:(id)a3;
- (void)setCertificateURL:(id)a3;
- (void)setGetAssetURL:(id)a3;
- (void)setPastisCertificateURL:(id)a3;
- (void)setPastisKeyServerURL:(id)a3;
- (void)setProvisionMachineURL:(id)a3;
- (void)setRefreshLeaseURL:(id)a3;
- (void)setStoreFrontSuffix:(id)a3;
- (void)setSyncMachineURL:(id)a3;
@end

@implementation SSVPlaybackLeaseConfiguration

- (SSVPlaybackLeaseConfiguration)initWithCertificateURL:(id)a3 leaseURL:(id)a4 pastisKeyServerURL:(id)a5 provisionMachineURL:(id)a6 storeFrontSuffix:(id)a7 syncMachineURL:(id)a8
{
  return [(SSVPlaybackLeaseConfiguration *)self initWithCertificateURL:a3 leaseType:0 leaseURL:a4 pastisKeyServerURL:a5 provisionMachineURL:a6 storeFrontSuffix:a7 syncMachineURL:a8];
}

- (SSVPlaybackLeaseConfiguration)initWithCertificateURL:(id)a3 leaseType:(int64_t)a4 leaseURL:(id)a5 pastisKeyServerURL:(id)a6 provisionMachineURL:(id)a7 storeFrontSuffix:(id)a8 syncMachineURL:(id)a9
{
  id v26 = a3;
  id v25 = a5;
  id v24 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  v27.receiver = self;
  v27.super_class = (Class)SSVPlaybackLeaseConfiguration;
  v19 = [(SSVPlaybackLeaseConfiguration *)&v27 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_beginLeaseURL, a5);
    objc_storeStrong((id *)&v20->_certificateURL, a3);
    objc_storeStrong((id *)&v20->_getAssetURL, a5);
    v20->_leaseType = a4;
    objc_storeStrong((id *)&v20->_pastisCertificateURL, a3);
    objc_storeStrong((id *)&v20->_pastisKeyServerURL, a6);
    objc_storeStrong((id *)&v20->_provisionMachineURL, a7);
    objc_storeStrong((id *)&v20->_refreshLeaseURL, a5);
    uint64_t v21 = [v17 copy];
    storeFrontSuffix = v20->_storeFrontSuffix;
    v20->_storeFrontSuffix = (NSString *)v21;

    objc_storeStrong((id *)&v20->_syncMachineURL, a9);
  }

  return v20;
}

- (SSVPlaybackLeaseConfiguration)initWithURLBagDictionary:(id)a3
{
  return [(SSVPlaybackLeaseConfiguration *)self initWithURLBagDictionary:a3 leaseType:0];
}

- (SSVPlaybackLeaseConfiguration)initWithURLBagDictionary:(id)a3 leaseType:(int64_t)a4
{
  id v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SSVPlaybackLeaseConfiguration;
  v7 = [(SSVPlaybackLeaseConfiguration *)&v31 init];
  if (!v7) {
    goto LABEL_22;
  }
  v8 = [v6 objectForKey:@"fps-cert"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v8];
    certificateURL = v7->_certificateURL;
    v7->_certificateURL = (NSURL *)v9;
  }
  v11 = [v6 objectForKey:@"amd-finish-provisioning"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v11];
    provisionMachineURL = v7->_provisionMachineURL;
    v7->_provisionMachineURL = (NSURL *)v12;
  }
  v14 = [v6 objectForKey:@"amd-sync-machine"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v14];
    syncMachineURL = v7->_syncMachineURL;
    v7->_syncMachineURL = (NSURL *)v15;
  }
  id v17 = [v6 objectForKey:@"fps-cert"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v17];
    pastisCertificateURL = v7->_pastisCertificateURL;
    v7->_pastisCertificateURL = (NSURL *)v18;
  }
  v20 = [v6 objectForKey:@"fps-request"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v20];
    pastisKeyServerURL = v7->_pastisKeyServerURL;
    v7->_pastisKeyServerURL = (NSURL *)v21;
  }
  v7->_leaseType = a4;
  if (!a4)
  {
    v23 = SSVLeaseURLBagKeySubscriptionLease;
    goto LABEL_16;
  }
  if (a4 == 1)
  {
    v23 = SSVLeaseURLBagKeyKDLease;
LABEL_16:
    uint64_t v24 = [v6 objectForKey:*v23];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v25 = (NSURL *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v24];
      objc_storeStrong((id *)&v7->_refreshLeaseURL, v25);
      objc_storeStrong((id *)&v7->_getAssetURL, v25);
      beginLeaseURL = v7->_beginLeaseURL;
      v7->_beginLeaseURL = v25;
    }
    v20 = (void *)v24;
  }
  objc_super v27 = [v6 objectForKey:@"storefront-header-suffix"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v28 = [v27 copy];
    storeFrontSuffix = v7->_storeFrontSuffix;
    v7->_storeFrontSuffix = (NSString *)v28;
  }
LABEL_22:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setBeginLeaseURL:self->_beginLeaseURL];
  [v4 setCertificateURL:self->_certificateURL];
  [v4 setGetAssetURL:self->_getAssetURL];
  v4[3] = self->_leaseType;
  [v4 setProvisionMachineURL:self->_provisionMachineURL];
  [v4 setRefreshLeaseURL:self->_refreshLeaseURL];
  [v4 setStoreFrontSuffix:self->_storeFrontSuffix];
  [v4 setSyncMachineURL:self->_syncMachineURL];
  [v4 setPastisKeyServerURL:self->_pastisKeyServerURL];
  [v4 setPastisCertificateURL:self->_pastisCertificateURL];
  return v4;
}

- (NSURL)beginLeaseURL
{
  return self->_beginLeaseURL;
}

- (void)setBeginLeaseURL:(id)a3
{
}

- (NSURL)getAssetURL
{
  return self->_getAssetURL;
}

- (void)setGetAssetURL:(id)a3
{
}

- (int64_t)leaseType
{
  return self->_leaseType;
}

- (NSURL)provisionMachineURL
{
  return self->_provisionMachineURL;
}

- (void)setProvisionMachineURL:(id)a3
{
}

- (NSURL)refreshLeaseURL
{
  return self->_refreshLeaseURL;
}

- (void)setRefreshLeaseURL:(id)a3
{
}

- (NSString)storeFrontSuffix
{
  return self->_storeFrontSuffix;
}

- (void)setStoreFrontSuffix:(id)a3
{
}

- (NSURL)syncMachineURL
{
  return self->_syncMachineURL;
}

- (void)setSyncMachineURL:(id)a3
{
}

- (NSURL)certificateURL
{
  return self->_certificateURL;
}

- (void)setCertificateURL:(id)a3
{
}

- (NSURL)pastisCertificateURL
{
  return self->_pastisCertificateURL;
}

- (void)setPastisCertificateURL:(id)a3
{
}

- (NSURL)pastisKeyServerURL
{
  return self->_pastisKeyServerURL;
}

- (void)setPastisKeyServerURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pastisKeyServerURL, 0);
  objc_storeStrong((id *)&self->_pastisCertificateURL, 0);
  objc_storeStrong((id *)&self->_certificateURL, 0);
  objc_storeStrong((id *)&self->_syncMachineURL, 0);
  objc_storeStrong((id *)&self->_storeFrontSuffix, 0);
  objc_storeStrong((id *)&self->_refreshLeaseURL, 0);
  objc_storeStrong((id *)&self->_provisionMachineURL, 0);
  objc_storeStrong((id *)&self->_getAssetURL, 0);
  objc_storeStrong((id *)&self->_beginLeaseURL, 0);
}

@end