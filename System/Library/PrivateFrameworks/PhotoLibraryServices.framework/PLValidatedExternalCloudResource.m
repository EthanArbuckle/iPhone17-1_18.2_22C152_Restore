@interface PLValidatedExternalCloudResource
- (BOOL)isEqualToValidatedExternalResource:(id)a3;
- (NSDate)lastOnDemandDownloadDate;
- (NSDate)lastPrefetchDate;
- (NSDate)masterDateCreated;
- (NSDate)prunedAt;
- (NSString)fingerprint;
- (NSString)stableHash;
- (PLValidatedExternalCloudResource)initWithCloudResource:(id)a3;
- (PLValidatedExternalCloudResource)initWithInternalResource:(id)a3;
- (signed)cloudLocalState;
- (signed)prefetchCount;
- (signed)remoteAvailability;
- (unint64_t)cplType;
- (unint64_t)sourceCplType;
- (void)setCloudLocalState:(signed __int16)a3;
- (void)setCplType:(unint64_t)a3;
- (void)setFingerprint:(id)a3;
- (void)setLastOnDemandDownloadDate:(id)a3;
- (void)setLastPrefetchDate:(id)a3;
- (void)setMasterDateCreated:(id)a3;
- (void)setPrefetchCount:(signed __int16)a3;
- (void)setPrunedAt:(id)a3;
- (void)setRemoteAvailability:(signed __int16)a3;
- (void)setSourceCplType:(unint64_t)a3;
- (void)setStableHash:(id)a3;
@end

@implementation PLValidatedExternalCloudResource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stableHash, 0);
  objc_storeStrong((id *)&self->_fingerprint, 0);
  objc_storeStrong((id *)&self->_prunedAt, 0);
  objc_storeStrong((id *)&self->_lastPrefetchDate, 0);
  objc_storeStrong((id *)&self->_lastOnDemandDownloadDate, 0);
  objc_storeStrong((id *)&self->_masterDateCreated, 0);
}

- (void)setStableHash:(id)a3
{
}

- (NSString)stableHash
{
  return self->_stableHash;
}

- (void)setFingerprint:(id)a3
{
}

- (NSString)fingerprint
{
  return self->_fingerprint;
}

- (void)setPrunedAt:(id)a3
{
}

- (NSDate)prunedAt
{
  return self->_prunedAt;
}

- (void)setPrefetchCount:(signed __int16)a3
{
  self->_prefetchCount = a3;
}

- (signed)prefetchCount
{
  return self->_prefetchCount;
}

- (void)setLastPrefetchDate:(id)a3
{
}

- (NSDate)lastPrefetchDate
{
  return self->_lastPrefetchDate;
}

- (void)setLastOnDemandDownloadDate:(id)a3
{
}

- (NSDate)lastOnDemandDownloadDate
{
  return self->_lastOnDemandDownloadDate;
}

- (void)setMasterDateCreated:(id)a3
{
}

- (NSDate)masterDateCreated
{
  return self->_masterDateCreated;
}

- (void)setCloudLocalState:(signed __int16)a3
{
  self->_cloudLocalState = a3;
}

- (signed)cloudLocalState
{
  return self->_cloudLocalState;
}

- (void)setRemoteAvailability:(signed __int16)a3
{
  self->_remoteAvailability = a3;
}

- (signed)remoteAvailability
{
  return self->_remoteAvailability;
}

- (void)setSourceCplType:(unint64_t)a3
{
  self->_sourceCplType = a3;
}

- (unint64_t)sourceCplType
{
  return self->_sourceCplType;
}

- (void)setCplType:(unint64_t)a3
{
  self->_cplType = a3;
}

- (unint64_t)cplType
{
  return self->_cplType;
}

- (BOOL)isEqualToValidatedExternalResource:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLValidatedExternalCloudResource;
  if ([(PLValidatedExternalResource *)&v12 isEqualToValidatedExternalResource:v4]&& (uint64_t v5 = objc_opt_class(), v5 == objc_opt_class()))
  {
    id v8 = v4;
    int v9 = [(PLValidatedExternalCloudResource *)self cloudLocalState];
    if (v9 == [v8 cloudLocalState]
      && (unint64_t v10 = -[PLValidatedExternalCloudResource cplType](self, "cplType"), v10 == [v8 cplType]))
    {
      unint64_t v11 = [(PLValidatedExternalCloudResource *)self sourceCplType];
      BOOL v6 = v11 == [v8 sourceCplType];
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (PLValidatedExternalCloudResource)initWithInternalResource:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLValidatedExternalCloudResource;
  uint64_t v5 = [(PLValidatedExternalResource *)&v13 init];
  if (v5)
  {
    -[PLValidatedExternalCloudResource setCloudLocalState:](v5, "setCloudLocalState:", [v4 cloudLocalState]);
    BOOL v6 = [v4 cloudMasterDateCreated];
    [(PLValidatedExternalCloudResource *)v5 setMasterDateCreated:v6];

    v7 = [v4 cloudLastOnDemandDownloadDate];
    [(PLValidatedExternalCloudResource *)v5 setLastOnDemandDownloadDate:v7];

    id v8 = [v4 cloudLastPrefetchDate];
    [(PLValidatedExternalCloudResource *)v5 setLastPrefetchDate:v8];

    -[PLValidatedExternalCloudResource setPrefetchCount:](v5, "setPrefetchCount:", [v4 cloudPrefetchCount]);
    int v9 = [v4 cloudPrunedAt];
    [(PLValidatedExternalCloudResource *)v5 setPrunedAt:v9];

    -[PLValidatedExternalCloudResource setSourceCplType:](v5, "setSourceCplType:", (int)[v4 cloudSourceType]);
    unint64_t v10 = [v4 fingerprint];
    [(PLValidatedExternalCloudResource *)v5 setFingerprint:v10];

    unint64_t v11 = [v4 stableHash];
    [(PLValidatedExternalCloudResource *)v5 setStableHash:v11];
  }
  return v5;
}

- (PLValidatedExternalCloudResource)initWithCloudResource:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLValidatedExternalCloudResource;
  uint64_t v5 = [(PLValidatedExternalResource *)&v12 init];
  if (v5)
  {
    -[PLValidatedExternalCloudResource setCloudLocalState:](v5, "setCloudLocalState:", [v4 cloudLocalState]);
    BOOL v6 = [v4 dateCreated];
    [(PLValidatedExternalCloudResource *)v5 setMasterDateCreated:v6];

    v7 = [v4 lastOnDemandDownloadDate];
    [(PLValidatedExternalCloudResource *)v5 setLastOnDemandDownloadDate:v7];

    id v8 = [v4 lastPrefetchDate];
    [(PLValidatedExternalCloudResource *)v5 setLastPrefetchDate:v8];

    -[PLValidatedExternalCloudResource setPrefetchCount:](v5, "setPrefetchCount:", [v4 prefetchCount]);
    int v9 = [v4 prunedAt];
    [(PLValidatedExternalCloudResource *)v5 setPrunedAt:v9];

    -[PLValidatedExternalCloudResource setSourceCplType:](v5, "setSourceCplType:", (int)[v4 sourceType]);
    unint64_t v10 = [v4 fingerprint];
    [(PLValidatedExternalCloudResource *)v5 setFingerprint:v10];
  }
  return v5;
}

@end