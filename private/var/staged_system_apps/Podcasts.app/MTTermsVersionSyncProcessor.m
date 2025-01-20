@interface MTTermsVersionSyncProcessor
- (BOOL)hasLocalChanges;
- (BOOL)mergeData:(id)a3 mismatch:(BOOL)a4;
- (BOOL)requiresNextGetTransaction;
- (MTTermsVersionSyncProcessor)initWithStorage:(id)a3;
- (MTTermsVersionSyncStorageProviding)storageProvider;
- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5;
- (id)versionForGetTransaction:(id)a3 key:(id)a4;
- (int64_t)operationTypeForSET;
- (void)completeTransactionWithNewVersion:(id)a3 mismatch:(BOOL)a4 finishedBlock:(id)a5;
- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)setStorageProvider:(id)a3;
- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)transaction:(id)a3 didProcessResponseWithDomainVersion:(id)a4;
@end

@implementation MTTermsVersionSyncProcessor

- (MTTermsVersionSyncProcessor)initWithStorage:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTTermsVersionSyncProcessor;
  v5 = [(MTTermsVersionSyncProcessor *)&v8 init];
  v6 = v5;
  if (v5) {
    [(MTTermsVersionSyncProcessor *)v5 setStorageProvider:v4];
  }

  return v6;
}

- (int64_t)operationTypeForSET
{
  return 8;
}

- (BOOL)hasLocalChanges
{
  v2 = [(MTTermsVersionSyncProcessor *)self storageProvider];
  unsigned __int8 v3 = [v2 cloudSyncIsDirty];

  return v3;
}

- (BOOL)requiresNextGetTransaction
{
  return !+[MTPrivacyUtil allowReporting];
}

- (id)versionForGetTransaction:(id)a3 key:(id)a4
{
  id v4 = [(MTTermsVersionSyncProcessor *)self storageProvider];
  v5 = [v4 cloudSyncVersion];

  return v5;
}

- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5
{
  v7 = [(MTTermsVersionSyncProcessor *)self storageProvider];
  if (![(MZKeyValueStoreNode *)v7 cloudSyncIsDirty])
  {
    v18 = 0;
LABEL_8:

    goto LABEL_10;
  }
  objc_super v8 = [(MTTermsVersionSyncProcessor *)self storageProvider];
  v9 = [v8 deviceAgreedTermsVersion];

  if (v9)
  {
    v7 = objc_alloc_init(MZKeyValueStoreNode);
    v10 = [(MTTermsVersionSyncProcessor *)self storageProvider];
    v11 = [v10 deviceAgreedTermsVersion];
    id v12 = [v11 integerValue];

    v13 = [(MTTermsVersionSyncProcessor *)self storageProvider];
    v14 = [v13 accountAgreedTermsVersion];
    id v15 = [v14 integerValue];

    if ((uint64_t)v12 <= (uint64_t)v15) {
      id v16 = v15;
    }
    else {
      id v16 = v12;
    }
    v17 = +[NSNumber numberWithInteger:v16];
    [(MZKeyValueStoreNode *)v7 setNumberValue:v17];

    v18 = [(MZKeyValueStoreNode *)v7 value];
    v19 = [(MTTermsVersionSyncProcessor *)self storageProvider];
    *a5 = [v19 cloudSyncVersion];

    goto LABEL_8;
  }
  v18 = 0;
LABEL_10:

  return v18;
}

- (void)transaction:(id)a3 didProcessResponseWithDomainVersion:(id)a4
{
  id v5 = a4;
  id v6 = [(MTTermsVersionSyncProcessor *)self storageProvider];
  [v6 setPodcastsDomainVersion:v5];
}

- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v10 = a7;
  id v11 = a6;
  [(MTTermsVersionSyncProcessor *)self completeTransactionWithNewVersion:v11 mismatch:[(MTTermsVersionSyncProcessor *)self mergeData:a4 mismatch:0] finishedBlock:v10];
}

- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
}

- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v10 = a7;
  id v11 = a6;
  [(MTTermsVersionSyncProcessor *)self completeTransactionWithNewVersion:v11 mismatch:[(MTTermsVersionSyncProcessor *)self mergeData:a4 mismatch:1] finishedBlock:v10];
}

- (BOOL)mergeData:(id)a3 mismatch:(BOOL)a4
{
  id v6 = a3;
  v7 = objc_alloc_init(MZKeyValueStoreNode);
  [(MZKeyValueStoreNode *)v7 setValue:v6];

  objc_super v8 = [(MTTermsVersionSyncProcessor *)self storageProvider];
  v9 = [v8 deviceAgreedTermsVersion];
  if (v9)
  {
  }
  else
  {
    id v10 = [(MTTermsVersionSyncProcessor *)self storageProvider];
    id v11 = [v10 accountAgreedTermsVersion];

    if (!v11)
    {
      v19 = 0;
      goto LABEL_8;
    }
  }
  id v12 = [(MTTermsVersionSyncProcessor *)self storageProvider];
  v13 = [v12 deviceAgreedTermsVersion];
  id v14 = [v13 integerValue];

  id v15 = [(MTTermsVersionSyncProcessor *)self storageProvider];
  id v16 = [v15 accountAgreedTermsVersion];
  id v17 = [v16 integerValue];

  if ((uint64_t)v14 <= (uint64_t)v17) {
    id v18 = v17;
  }
  else {
    id v18 = v14;
  }
  v19 = +[NSNumber numberWithInteger:v18];
LABEL_8:
  if ([(MZKeyValueStoreNode *)v7 hasData])
  {
    v20 = [(MZKeyValueStoreNode *)v7 numberValue];
    id v21 = [v20 integerValue];
    if ((uint64_t)v21 >= (uint64_t)[v19 integerValue])
    {
      id v22 = [v20 integerValue];
      if ((uint64_t)v22 >= (uint64_t)[v19 integerValue])
      {
        id v23 = v20;

        a4 = 0;
        v19 = v23;
      }
    }
    else
    {
      a4 = 1;
    }
  }
  v24 = [(MTTermsVersionSyncProcessor *)self storageProvider];
  [v24 setAccountAgreedTermsVersion:v19];

  return a4;
}

- (void)completeTransactionWithNewVersion:(id)a3 mismatch:(BOOL)a4 finishedBlock:(id)a5
{
  BOOL v5 = a4;
  id v11 = (void (**)(id, BOOL))a5;
  id v8 = a3;
  v9 = [(MTTermsVersionSyncProcessor *)self storageProvider];
  [v9 setCloudSyncVersion:v8];

  id v10 = [(MTTermsVersionSyncProcessor *)self storageProvider];
  [v10 setCloudSyncIsDirty:v5];

  v11[2](v11, v5);
}

- (MTTermsVersionSyncStorageProviding)storageProvider
{
  return self->_storageProvider;
}

- (void)setStorageProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end