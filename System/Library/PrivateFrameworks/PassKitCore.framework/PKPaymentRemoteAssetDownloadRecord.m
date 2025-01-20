@interface PKPaymentRemoteAssetDownloadRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)hasOutstandingRemoteAssetTasks;
- (NSDictionary)remoteAssetsByRecordName;
- (NSDictionary)remoteAssetsByTaskIdentifier;
- (NSURL)passURL;
- (PKPaymentRemoteAssetDownloadRecord)init;
- (PKPaymentRemoteAssetDownloadRecord)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeRemoteCloudStoreAssetForRecordName:(id)a3;
- (void)removeRemoteURLAssetForTaskIdentifier:(id)a3;
- (void)setPassURL:(id)a3;
- (void)setRemoteAssetsByRecordName:(id)a3;
- (void)setRemoteAssetsByTaskIdentifier:(id)a3;
- (void)setRemoteCloudStoreAsset:(id)a3 forRecordName:(id)a4;
- (void)setRemoteURLAsset:(id)a3 forTaskIdentifier:(id)a4;
@end

@implementation PKPaymentRemoteAssetDownloadRecord

- (PKPaymentRemoteAssetDownloadRecord)init
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentRemoteAssetDownloadRecord;
  v2 = [(PKPaymentRemoteAssetDownloadRecord *)&v8 init];
  if (v2)
  {
    v3 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    remoteAssetsByTaskIdentifier = v2->_remoteAssetsByTaskIdentifier;
    v2->_remoteAssetsByTaskIdentifier = v3;

    v5 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    remoteAssetsByRecordName = v2->_remoteAssetsByRecordName;
    v2->_remoteAssetsByRecordName = v5;
  }
  return v2;
}

- (PKPaymentRemoteAssetDownloadRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPaymentRemoteAssetDownloadRecord;
  v5 = [(PKPaymentBackgroundDownloadRecord *)&v20 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passURL"];
    [(PKPaymentRemoteAssetDownloadRecord *)v5 setPassURL:v6];

    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
    v12 = [v4 decodeObjectOfClasses:v11 forKey:@"remoteAssets"];
    [(PKPaymentRemoteAssetDownloadRecord *)v5 setRemoteAssetsByTaskIdentifier:v12];

    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v13, "setWithObjects:", v14, v15, v16, objc_opt_class(), 0);
    v18 = [v4 decodeObjectOfClasses:v17 forKey:@"remoteCloudAssets"];
    [(PKPaymentRemoteAssetDownloadRecord *)v5 setRemoteAssetsByRecordName:v18];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentRemoteAssetDownloadRecord;
  id v4 = a3;
  [(PKPaymentBackgroundDownloadRecord *)&v8 encodeWithCoder:v4];
  v5 = [(PKPaymentRemoteAssetDownloadRecord *)self passURL];
  [v4 encodeObject:v5 forKey:@"passURL"];

  v6 = [(PKPaymentRemoteAssetDownloadRecord *)self remoteAssetsByTaskIdentifier];
  [v4 encodeObject:v6 forKey:@"remoteAssets"];

  v7 = [(PKPaymentRemoteAssetDownloadRecord *)self remoteAssetsByRecordName];
  [v4 encodeObject:v7 forKey:@"remoteCloudAssets"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)hasOutstandingRemoteAssetTasks
{
  v3 = [(PKPaymentRemoteAssetDownloadRecord *)self remoteAssetsByTaskIdentifier];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(PKPaymentRemoteAssetDownloadRecord *)self remoteAssetsByRecordName];
    BOOL v4 = [v5 count] != 0;
  }
  return v4;
}

- (void)setRemoteURLAsset:(id)a3 forTaskIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(PKPaymentRemoteAssetDownloadRecord *)self remoteAssetsByTaskIdentifier];
  objc_super v8 = (void *)[v9 mutableCopy];
  [v8 setObject:v7 forKey:v6];

  [(PKPaymentRemoteAssetDownloadRecord *)self setRemoteAssetsByTaskIdentifier:v8];
}

- (void)setRemoteCloudStoreAsset:(id)a3 forRecordName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(PKPaymentRemoteAssetDownloadRecord *)self remoteAssetsByRecordName];
  objc_super v8 = (void *)[v9 mutableCopy];
  [v8 setObject:v7 forKey:v6];

  [(PKPaymentRemoteAssetDownloadRecord *)self setRemoteAssetsByRecordName:v8];
}

- (void)removeRemoteURLAssetForTaskIdentifier:(id)a3
{
  id v4 = a3;
  id v6 = [(PKPaymentRemoteAssetDownloadRecord *)self remoteAssetsByTaskIdentifier];
  v5 = (void *)[v6 mutableCopy];
  [v5 removeObjectForKey:v4];

  [(PKPaymentRemoteAssetDownloadRecord *)self setRemoteAssetsByTaskIdentifier:v5];
}

- (void)removeRemoteCloudStoreAssetForRecordName:(id)a3
{
  id v4 = a3;
  id v6 = [(PKPaymentRemoteAssetDownloadRecord *)self remoteAssetsByRecordName];
  v5 = (void *)[v6 mutableCopy];
  [v5 removeObjectForKey:v4];

  [(PKPaymentRemoteAssetDownloadRecord *)self setRemoteAssetsByRecordName:v5];
}

- (NSURL)passURL
{
  return self->_passURL;
}

- (void)setPassURL:(id)a3
{
}

- (NSDictionary)remoteAssetsByTaskIdentifier
{
  return self->_remoteAssetsByTaskIdentifier;
}

- (void)setRemoteAssetsByTaskIdentifier:(id)a3
{
}

- (NSDictionary)remoteAssetsByRecordName
{
  return self->_remoteAssetsByRecordName;
}

- (void)setRemoteAssetsByRecordName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAssetsByRecordName, 0);
  objc_storeStrong((id *)&self->_remoteAssetsByTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_passURL, 0);
}

@end