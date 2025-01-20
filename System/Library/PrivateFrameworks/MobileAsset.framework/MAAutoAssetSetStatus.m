@interface MAAutoAssetSetStatus
+ (BOOL)supportsSecureCoding;
+ (id)_shortTermLockFilenameNormalizedComponent:(id)a3;
+ (id)newCurrentLockUsageDetailed:(id)a3;
+ (id)newCurrentLockUsageSummary:(id)a3;
+ (id)newSelectorsForStagingSummary:(id)a3;
+ (id)shortTermLockFilename:(id)a3 forAssetSetIdentifier:(id)a4 forSetAtomicInstance:(id)a5;
- (BOOL)downloadUserInitiated;
- (BOOL)haveReceivedLookupResponse;
- (BOOL)vendingAtomicInstanceForConfiguredEntries;
- (MAAutoAssetSetNotifications)currentNotifications;
- (MAAutoAssetSetPolicy)currentNeedPolicy;
- (MAAutoAssetSetPolicy)schedulerPolicy;
- (MAAutoAssetSetPolicy)stagerPolicy;
- (MAAutoAssetSetProgress)downloadProgress;
- (MAAutoAssetSetStatus)initWithCoder:(id)a3;
- (NSArray)atomicInstancesDownloaded;
- (NSArray)configuredAssetEntries;
- (NSArray)latestDowloadedAtomicInstanceEntries;
- (NSArray)newerDiscoveredAtomicEntries;
- (NSDate)catalogLastTimeChecked;
- (NSDate)catalogPostedDate;
- (NSDate)downloadedCatalogLastTimeChecked;
- (NSDate)downloadedCatalogPostedDate;
- (NSDictionary)allDownloadedAtomicInstanceEntries;
- (NSDictionary)currentLockUsage;
- (NSDictionary)selectorsForStaging;
- (NSError)availableForUseError;
- (NSError)newerVersionError;
- (NSString)assetSetIdentifier;
- (NSString)catalogCachedAssetSetID;
- (NSString)clientDomainName;
- (NSString)downloadedCatalogCachedAssetSetID;
- (NSString)latestDownloadedAtomicInstance;
- (NSString)newerAtomicInstanceDiscovered;
- (NSURL)catalogDownloadedFromLive;
- (NSURL)downloadedCatalogDownloadedFromLive;
- (id)copy;
- (id)description;
- (id)initStatusForClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 withAtomicInstancesDownloaded:(id)a5 withNewerAtomicInstanceDiscovered:(id)a6 withNewerDiscoveredAtomicEntries:(id)a7 withLatestDownloadedAtomicInstance:(id)a8 withLatestDowloadedAtomicInstanceEntries:(id)a9 withAllDownloadedAtomicInstanceEntries:(id)a10 withCurrentNotifications:(id)a11 withCurrentNeedPolicy:(id)a12 withSchedulerPolicy:(id)a13 withStagerPolicy:(id)a14 withDownloadUserInitiated:(BOOL)a15 withDownloadProgress:(id)a16 withDownloadedNetworkBytes:(int64_t)a17 withDownloadedFilesystemBytes:(int64_t)a18 withCurrentLockUsage:(id)a19 withSelectorsForStaging:(id)a20 withAvailableForUseError:(id)a21 withNewerVersionError:(id)a22;
- (id)initStatusForClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 withConfiguredAssetEntries:(id)a5 withAtomicInstancesDownloaded:(id)a6 withCatalogCachedAssetSetID:(id)a7 withCatalogDownloadedFromLive:(id)a8 withCatalogLastTimeChecked:(id)a9 withCatalogPostedDate:(id)a10 withNewerAtomicInstanceDiscovered:(id)a11 withNewerDiscoveredAtomicEntries:(id)a12 withLatestDownloadedAtomicInstance:(id)a13 withLatestDowloadedAtomicInstanceEntries:(id)a14 withCurrentNotifications:(id)a15 withCurrentNeedPolicy:(id)a16 withSchedulerPolicy:(id)a17 withStagerPolicy:(id)a18 withDownloadUserInitiated:(BOOL)a19 withDownloadProgress:(id)a20 withDownloadedNetworkBytes:(int64_t)a21 withDownloadedFilesystemBytes:(int64_t)a22 withCurrentLockUsage:(id)a23 withSelectorsForStaging:(id)a24 withAvailableForUseError:(id)a25 withNewerVersionError:(id)a26;
- (id)initStatusForClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 withConfiguredAssetEntries:(id)a5 withAtomicInstancesDownloaded:(id)a6 withCatalogCachedAssetSetID:(id)a7 withCatalogDownloadedFromLive:(id)a8 withCatalogLastTimeChecked:(id)a9 withCatalogPostedDate:(id)a10 withNewerAtomicInstanceDiscovered:(id)a11 withNewerDiscoveredAtomicEntries:(id)a12 withLatestDownloadedAtomicInstance:(id)a13 withLatestDowloadedAtomicInstanceEntries:(id)a14 withDownloadedCatalogCachedAssetSetID:(id)a15 withDownloadedCatalogDownloadedFromLive:(id)a16 withDownloadedCatalogLastTimeChecked:(id)a17 withDownloadedCatalogPostedDate:(id)a18 withCurrentNotifications:(id)a19 withCurrentNeedPolicy:(id)a20 withSchedulerPolicy:(id)a21 withStagerPolicy:(id)a22 havingReceivedLookupResponse:(BOOL)a23 vendingAtomicInstanceForConfiguredEntries:(BOOL)a24 withDownloadUserInitiated:(BOOL)a25 withDownloadProgress:(id)a26 withDownloadedNetworkBytes:(int64_t)a27 withDownloadedFilesystemBytes:(int64_t)a28 withCurrentLockUsage:(id)a29 withSelectorsForStaging:(id)a30 withAvailableForUseError:(id)a31 withNewerVersionError:(id)a32;
- (id)initStatusForClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 withConfiguredAssetEntries:(id)a5 withAtomicInstancesDownloaded:(id)a6 withCatalogCachedAssetSetID:(id)a7 withCatalogDownloadedFromLive:(id)a8 withCatalogLastTimeChecked:(id)a9 withCatalogPostedDate:(id)a10 withNewerAtomicInstanceDiscovered:(id)a11 withNewerDiscoveredAtomicEntries:(id)a12 withLatestDownloadedAtomicInstance:(id)a13 withLatestDowloadedAtomicInstanceEntries:(id)a14 withDownloadedCatalogCachedAssetSetID:(id)a15 withDownloadedCatalogDownloadedFromLive:(id)a16 withDownloadedCatalogLastTimeChecked:(id)a17 withDownloadedCatalogPostedDate:(id)a18 withCurrentNotifications:(id)a19 withCurrentNeedPolicy:(id)a20 withSchedulerPolicy:(id)a21 withStagerPolicy:(id)a22 havingReceivedLookupResponse:(BOOL)a23 withDownloadUserInitiated:(BOOL)a24 withDownloadProgress:(id)a25 withDownloadedNetworkBytes:(int64_t)a26 withDownloadedFilesystemBytes:(int64_t)a27 withCurrentLockUsage:(id)a28 withSelectorsForStaging:(id)a29 withAvailableForUseError:(id)a30 withNewerVersionError:(id)a31;
- (id)initStatusForClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 withConfiguredAssetEntries:(id)a5 withAtomicInstancesDownloaded:(id)a6 withCatalogCachedAssetSetID:(id)a7 withCatalogDownloadedFromLive:(id)a8 withCatalogLastTimeChecked:(id)a9 withCatalogPostedDate:(id)a10 withNewerAtomicInstanceDiscovered:(id)a11 withNewerDiscoveredAtomicEntries:(id)a12 withLatestDownloadedAtomicInstance:(id)a13 withLatestDowloadedAtomicInstanceEntries:(id)a14 withDownloadedCatalogCachedAssetSetID:(id)a15 withDownloadedCatalogDownloadedFromLive:(id)a16 withDownloadedCatalogLastTimeChecked:(id)a17 withDownloadedCatalogPostedDate:(id)a18 withCurrentNotifications:(id)a19 withCurrentNeedPolicy:(id)a20 withSchedulerPolicy:(id)a21 withStagerPolicy:(id)a22 withDownloadUserInitiated:(BOOL)a23 withDownloadProgress:(id)a24 withDownloadedNetworkBytes:(int64_t)a25 withDownloadedFilesystemBytes:(int64_t)a26 withCurrentLockUsage:(id)a27 withSelectorsForStaging:(id)a28 withAvailableForUseError:(id)a29 withNewerVersionError:(id)a30;
- (id)initStatusForClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 withConfiguredAssetEntries:(id)a5 withAtomicInstancesDownloaded:(id)a6 withNewerAtomicInstanceDiscovered:(id)a7 withNewerDiscoveredAtomicEntries:(id)a8 withLatestDownloadedAtomicInstance:(id)a9 withLatestDowloadedAtomicInstanceEntries:(id)a10 withAllDownloadedAtomicInstanceEntries:(id)a11 withCurrentNotifications:(id)a12 withCurrentNeedPolicy:(id)a13 withSchedulerPolicy:(id)a14 withStagerPolicy:(id)a15 withDownloadUserInitiated:(BOOL)a16 withDownloadProgress:(id)a17 withDownloadedNetworkBytes:(int64_t)a18 withDownloadedFilesystemBytes:(int64_t)a19 withCurrentLockUsage:(id)a20 withSelectorsForStaging:(id)a21 withAvailableForUseError:(id)a22 withNewerVersionError:(id)a23;
- (id)summary;
- (int64_t)downloadedFilesystemBytes;
- (int64_t)downloadedNetworkBytes;
- (void)encodeWithCoder:(id)a3;
- (void)setAllDownloadedAtomicInstanceEntries:(id)a3;
- (void)setAtomicInstancesDownloaded:(id)a3;
- (void)setAvailableForUseError:(id)a3;
- (void)setCatalogCachedAssetSetID:(id)a3;
- (void)setCatalogDownloadedFromLive:(id)a3;
- (void)setCatalogLastTimeChecked:(id)a3;
- (void)setCatalogPostedDate:(id)a3;
- (void)setConfiguredAssetEntries:(id)a3;
- (void)setCurrentLockUsage:(id)a3;
- (void)setCurrentNeedPolicy:(id)a3;
- (void)setCurrentNotifications:(id)a3;
- (void)setDownloadProgress:(id)a3;
- (void)setDownloadUserInitiated:(BOOL)a3;
- (void)setDownloadedCatalogCachedAssetSetID:(id)a3;
- (void)setDownloadedCatalogDownloadedFromLive:(id)a3;
- (void)setDownloadedCatalogLastTimeChecked:(id)a3;
- (void)setDownloadedCatalogPostedDate:(id)a3;
- (void)setDownloadedFilesystemBytes:(int64_t)a3;
- (void)setDownloadedNetworkBytes:(int64_t)a3;
- (void)setHaveReceivedLookupResponse:(BOOL)a3;
- (void)setLatestDowloadedAtomicInstanceEntries:(id)a3;
- (void)setLatestDownloadedAtomicInstance:(id)a3;
- (void)setNewerAtomicInstanceDiscovered:(id)a3;
- (void)setNewerDiscoveredAtomicEntries:(id)a3;
- (void)setNewerVersionError:(id)a3;
- (void)setSchedulerPolicy:(id)a3;
- (void)setSelectorsForStaging:(id)a3;
- (void)setStagerPolicy:(id)a3;
- (void)setVendingAtomicInstanceForConfiguredEntries:(BOOL)a3;
@end

@implementation MAAutoAssetSetStatus

+ (id)newCurrentLockUsageSummary:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 currentLockUsage];

  if (v4)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"{"];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = [v3 currentLockUsage];
    uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v22)
    {
      uint64_t v20 = *(void *)v29;
      id v21 = v3;
      char v5 = 1;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = v6;
          uint64_t v7 = *(void *)(*((void *)&v28 + 1) + 8 * v6);
          v8 = [v3 currentLockUsage];
          v9 = [v8 safeObjectForKey:v7 ofClass:objc_opt_class()];

          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          id v10 = v9;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v25;
            char v14 = v5;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v25 != v13) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * i);
                uint64_t v17 = [v10 safeIntegerForKey:v16];
                if ((v14 & 1) == 0) {
                  [v4 appendString:@","];
                }
                [v4 appendFormat:@"[lockReason:%@ atomicInstance:%@ lockCount:%ld]", v7, v16, v17];
                char v14 = 0;
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
              char v14 = 0;
              char v5 = 0;
            }
            while (v12);
          }

          uint64_t v6 = v23 + 1;
          id v3 = v21;
        }
        while (v23 + 1 != v22);
        uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v22);
    }

    [v4 appendString:@"}"];
  }

  return v4;
}

- (NSDictionary)currentLockUsage
{
  return self->_currentLockUsage;
}

- (NSString)downloadedCatalogCachedAssetSetID
{
  return self->_downloadedCatalogCachedAssetSetID;
}

- (id)summary
{
  long long v30 = NSString;
  uint64_t v3 = [(MAAutoAssetSetStatus *)self clientDomainName];
  uint64_t v4 = [(MAAutoAssetSetStatus *)self assetSetIdentifier];
  v33 = [(MAAutoAssetSetStatus *)self configuredAssetEntries];
  uint64_t v28 = [v33 count];
  v32 = [(MAAutoAssetSetStatus *)self atomicInstancesDownloaded];
  uint64_t v27 = [v32 count];
  uint64_t v5 = [(MAAutoAssetSetStatus *)self newerAtomicInstanceDiscovered];
  v35 = (void *)v3;
  if (v5)
  {
    uint64_t v6 = [(MAAutoAssetSetStatus *)self newerAtomicInstanceDiscovered];
  }
  else
  {
    uint64_t v6 = @"N";
  }
  long long v26 = (void *)v5;
  long long v29 = [(MAAutoAssetSetStatus *)self newerDiscoveredAtomicEntries];
  uint64_t v25 = [v29 count];
  uint64_t v7 = [(MAAutoAssetSetStatus *)self latestDownloadedAtomicInstance];
  uint64_t v34 = (void *)v4;
  long long v31 = v6;
  if (v7)
  {
    v8 = [(MAAutoAssetSetStatus *)self latestDownloadedAtomicInstance];
  }
  else
  {
    v8 = @"N";
  }
  v9 = [(MAAutoAssetSetStatus *)self latestDowloadedAtomicInstanceEntries];
  uint64_t v10 = [v9 count];
  uint64_t v11 = @"Y";
  if ([(MAAutoAssetSetStatus *)self haveReceivedLookupResponse]) {
    uint64_t v12 = @"Y";
  }
  else {
    uint64_t v12 = @"N";
  }
  if ([(MAAutoAssetSetStatus *)self vendingAtomicInstanceForConfiguredEntries])
  {
    uint64_t v13 = @"Y";
  }
  else
  {
    uint64_t v13 = @"N";
  }
  if (![(MAAutoAssetSetStatus *)self downloadUserInitiated]) {
    uint64_t v11 = @"N";
  }
  char v14 = [(MAAutoAssetSetStatus *)self currentLockUsage];
  if (v14)
  {
    id v15 = +[MAAutoAssetSetStatus newCurrentLockUsageSummary:self];
    uint64_t v23 = v11;
    id v21 = v13;
    uint64_t v16 = v31;
    uint64_t v17 = v34;
    v18 = v35;
    v19 = [v30 stringWithFormat:@"[domain:%@|setID:%@|config:%ld|AIs:%ld(newer:%@[%ld])(latest:%@[%ld])|lookupRsp:%@(forConfig:%@)|user:%@|locks:%@]", v35, v34, v28, v27, v31, v25, v8, v10, v12, v21, v23, v15];
  }
  else
  {
    long long v24 = v11;
    uint64_t v22 = v13;
    uint64_t v16 = v31;
    uint64_t v17 = v34;
    v18 = v35;
    v19 = [v30 stringWithFormat:@"[domain:%@|setID:%@|config:%ld|AIs:%ld(newer:%@[%ld])(latest:%@[%ld])|lookupRsp:%@(forConfig:%@)|user:%@|locks:%@]", v35, v34, v28, v27, v31, v25, v8, v10, v12, v22, v24, @"N"];
  }

  if (v7) {
  if (v26)
  }

  return v19;
}

- (NSString)latestDownloadedAtomicInstance
{
  return self->_latestDownloadedAtomicInstance;
}

- (NSString)newerAtomicInstanceDiscovered
{
  return self->_newerAtomicInstanceDiscovered;
}

+ (id)shortTermLockFilename:(id)a3 forAssetSetIdentifier:(id)a4 forSetAtomicInstance:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = +[MAAutoAssetSetStatus _shortTermLockFilenameNormalizedComponent:a3];
  uint64_t v10 = +[MAAutoAssetSetStatus _shortTermLockFilenameNormalizedComponent:v8];

  if (v7)
  {
    uint64_t v11 = @"specific";
    if (([MEMORY[0x1E4FA56C0] stringIsEqual:v7 to:@"specific"] & 1) == 0) {
      uint64_t v11 = (__CFString *)v7;
    }
  }
  else
  {
    uint64_t v11 = @"latest";
  }
  id v12 = [NSString alloc];
  uint64_t v13 = getRepositoryPath(@"/private/var/MobileAsset/AssetsV2/locks");
  char v14 = (void *)[v12 initWithFormat:@"%@/%@/%@/%@/%@_%@.%@", v13, v9, v10, @"shared_locks", @"atomic_instance", v11, @"locker"];

  return v14;
}

- (NSArray)latestDowloadedAtomicInstanceEntries
{
  return self->_latestDowloadedAtomicInstanceEntries;
}

+ (id)_shortTermLockFilenameNormalizedComponent:(id)a3
{
  if (a3)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F28B88];
    id v4 = a3;
    uint64_t v5 = [v3 characterSetWithCharactersInString:@":;,/\\?~%*|\"<>[](){}"];
    uint64_t v6 = [v4 componentsSeparatedByCharactersInSet:v5];

    id v7 = [v6 componentsJoinedByString:@"_"];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (BOOL)vendingAtomicInstanceForConfiguredEntries
{
  return self->_vendingAtomicInstanceForConfiguredEntries;
}

- (NSArray)newerDiscoveredAtomicEntries
{
  return self->_newerDiscoveredAtomicEntries;
}

- (BOOL)haveReceivedLookupResponse
{
  return self->_haveReceivedLookupResponse;
}

- (BOOL)downloadUserInitiated
{
  return self->_downloadUserInitiated;
}

- (NSArray)configuredAssetEntries
{
  return self->_configuredAssetEntries;
}

- (NSString)clientDomainName
{
  return self->_clientDomainName;
}

- (NSArray)atomicInstancesDownloaded
{
  return self->_atomicInstancesDownloaded;
}

- (NSString)assetSetIdentifier
{
  return self->_assetSetIdentifier;
}

- (MAAutoAssetSetStatus)initWithCoder:(id)a3
{
  v77[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v72.receiver = self;
  v72.super_class = (Class)MAAutoAssetSetStatus;
  uint64_t v5 = [(MAAutoAssetSetStatus *)&v72 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    v77[0] = objc_opt_class();
    v77[1] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:2];
    id v8 = [v6 setWithArray:v7];

    v9 = (void *)MEMORY[0x1E4F1CAD0];
    v76[0] = objc_opt_class();
    v76[1] = objc_opt_class();
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:2];
    uint64_t v11 = [v9 setWithArray:v10];

    id v12 = (void *)MEMORY[0x1E4F1CAD0];
    v75[0] = objc_opt_class();
    v75[1] = objc_opt_class();
    v75[2] = objc_opt_class();
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:3];
    char v14 = [v12 setWithArray:v13];

    id v15 = (void *)MEMORY[0x1E4F1CAD0];
    v74[0] = objc_opt_class();
    v74[1] = objc_opt_class();
    v74[2] = objc_opt_class();
    v74[3] = objc_opt_class();
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:4];
    uint64_t v17 = [v15 setWithArray:v16];

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientDomainName"];
    clientDomainName = v5->_clientDomainName;
    v5->_clientDomainName = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetSetIdentifier"];
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v20;

    id v22 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v73[0] = objc_opt_class();
    v73[1] = objc_opt_class();
    v73[2] = objc_opt_class();
    uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:3];
    long long v24 = (void *)[v22 initWithArray:v23];
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"configuredAssetEntries"];
    configuredAssetEntries = v5->_configuredAssetEntries;
    v5->_configuredAssetEntries = (NSArray *)v25;

    uint64_t v27 = [v4 decodeObjectOfClasses:v8 forKey:@"atomicInstancesDownloaded"];
    atomicInstancesDownloaded = v5->_atomicInstancesDownloaded;
    v5->_atomicInstancesDownloaded = (NSArray *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"catalogCachedAssetSetID"];
    catalogCachedAssetSetID = v5->_catalogCachedAssetSetID;
    v5->_catalogCachedAssetSetID = (NSString *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"catalogDownloadedFromLive"];
    catalogDownloadedFromLive = v5->_catalogDownloadedFromLive;
    v5->_catalogDownloadedFromLive = (NSURL *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"catalogLastTimeChecked"];
    catalogLastTimeChecked = v5->_catalogLastTimeChecked;
    v5->_catalogLastTimeChecked = (NSDate *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"catalogPostedDate"];
    catalogPostedDate = v5->_catalogPostedDate;
    v5->_catalogPostedDate = (NSDate *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"newerAtomicInstanceDiscovered"];
    newerAtomicInstanceDiscovered = v5->_newerAtomicInstanceDiscovered;
    v5->_newerAtomicInstanceDiscovered = (NSString *)v37;

    uint64_t v39 = [v4 decodeObjectOfClasses:v11 forKey:@"newerDiscoveredAtomicEntries"];
    newerDiscoveredAtomicEntries = v5->_newerDiscoveredAtomicEntries;
    v5->_newerDiscoveredAtomicEntries = (NSArray *)v39;

    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"latestDownloadedAtomicInstance"];
    latestDownloadedAtomicInstance = v5->_latestDownloadedAtomicInstance;
    v5->_latestDownloadedAtomicInstance = (NSString *)v41;

    uint64_t v43 = [v4 decodeObjectOfClasses:v11 forKey:@"latestDowloadedAtomicInstanceEntries"];
    latestDowloadedAtomicInstanceEntries = v5->_latestDowloadedAtomicInstanceEntries;
    v5->_latestDowloadedAtomicInstanceEntries = (NSArray *)v43;

    uint64_t v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"downloadedCatalogCachedAssetSetID"];
    downloadedCatalogCachedAssetSetID = v5->_downloadedCatalogCachedAssetSetID;
    v5->_downloadedCatalogCachedAssetSetID = (NSString *)v45;

    uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"downloadedCatalogDownloadedFromLive"];
    downloadedCatalogDownloadedFromLive = v5->_downloadedCatalogDownloadedFromLive;
    v5->_downloadedCatalogDownloadedFromLive = (NSURL *)v47;

    uint64_t v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"downloadedCatalogLastTimeChecked"];
    downloadedCatalogLastTimeChecked = v5->_downloadedCatalogLastTimeChecked;
    v5->_downloadedCatalogLastTimeChecked = (NSDate *)v49;

    uint64_t v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"downloadedCatalogPostedDate"];
    downloadedCatalogPostedDate = v5->_downloadedCatalogPostedDate;
    v5->_downloadedCatalogPostedDate = (NSDate *)v51;

    uint64_t v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentNotifications"];
    currentNotifications = v5->_currentNotifications;
    v5->_currentNotifications = (MAAutoAssetSetNotifications *)v53;

    uint64_t v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentNeedPolicy"];
    currentNeedPolicy = v5->_currentNeedPolicy;
    v5->_currentNeedPolicy = (MAAutoAssetSetPolicy *)v55;

    uint64_t v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"schedulerPolicy"];
    schedulerPolicy = v5->_schedulerPolicy;
    v5->_schedulerPolicy = (MAAutoAssetSetPolicy *)v57;

    uint64_t v59 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stagerPolicy"];
    stagerPolicy = v5->_stagerPolicy;
    v5->_stagerPolicy = (MAAutoAssetSetPolicy *)v59;

    v5->_haveReceivedLookupResponse = [v4 decodeBoolForKey:@"haveReceivedLookupResponse"];
    v5->_vendingAtomicInstanceForConfiguredEntries = [v4 decodeBoolForKey:@"vendingAtomicInstanceForConfiguredEntries"];
    v5->_downloadUserInitiated = [v4 decodeBoolForKey:@"downloadUserInitiated"];
    uint64_t v61 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"downloadProgress"];
    downloadProgress = v5->_downloadProgress;
    v5->_downloadProgress = (MAAutoAssetSetProgress *)v61;

    v5->_downloadedNetworkBytes = [v4 decodeIntegerForKey:@"downloadedNetworkBytes"];
    v5->_downloadedFilesystemBytes = [v4 decodeIntegerForKey:@"downloadedFilesystemBytes"];
    uint64_t v63 = [v4 decodeObjectOfClasses:v14 forKey:@"currentLockUsage"];
    currentLockUsage = v5->_currentLockUsage;
    v5->_currentLockUsage = (NSDictionary *)v63;

    uint64_t v65 = [v4 decodeObjectOfClasses:v17 forKey:@"selectorsForStaging"];
    selectorsForStaging = v5->_selectorsForStaging;
    v5->_selectorsForStaging = (NSDictionary *)v65;

    uint64_t v67 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"availableForUseError"];
    availableForUseError = v5->_availableForUseError;
    v5->_availableForUseError = (NSError *)v67;

    uint64_t v69 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"newerVersionError"];
    newerVersionError = v5->_newerVersionError;
    v5->_newerVersionError = (NSError *)v69;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)initStatusForClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 withAtomicInstancesDownloaded:(id)a5 withNewerAtomicInstanceDiscovered:(id)a6 withNewerDiscoveredAtomicEntries:(id)a7 withLatestDownloadedAtomicInstance:(id)a8 withLatestDowloadedAtomicInstanceEntries:(id)a9 withAllDownloadedAtomicInstanceEntries:(id)a10 withCurrentNotifications:(id)a11 withCurrentNeedPolicy:(id)a12 withSchedulerPolicy:(id)a13 withStagerPolicy:(id)a14 withDownloadUserInitiated:(BOOL)a15 withDownloadProgress:(id)a16 withDownloadedNetworkBytes:(int64_t)a17 withDownloadedFilesystemBytes:(int64_t)a18 withCurrentLockUsage:(id)a19 withSelectorsForStaging:(id)a20 withAvailableForUseError:(id)a21 withNewerVersionError:(id)a22
{
  BYTE2(v23) = a15;
  LOWORD(v23) = 0;
  return -[MAAutoAssetSetStatus initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:vendingAtomicInstanceForConfiguredEntries:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:](self, "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:vendingAtomicInstanceForConfiguredEntries:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:", a3, a4, 0, a5, 0, 0, 0, 0, a6, a7,
           a8,
           a9,
           0,
           0,
           0,
           0,
           a11,
           a12,
           a13,
           a14,
           v23,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22);
}

- (id)initStatusForClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 withConfiguredAssetEntries:(id)a5 withAtomicInstancesDownloaded:(id)a6 withNewerAtomicInstanceDiscovered:(id)a7 withNewerDiscoveredAtomicEntries:(id)a8 withLatestDownloadedAtomicInstance:(id)a9 withLatestDowloadedAtomicInstanceEntries:(id)a10 withAllDownloadedAtomicInstanceEntries:(id)a11 withCurrentNotifications:(id)a12 withCurrentNeedPolicy:(id)a13 withSchedulerPolicy:(id)a14 withStagerPolicy:(id)a15 withDownloadUserInitiated:(BOOL)a16 withDownloadProgress:(id)a17 withDownloadedNetworkBytes:(int64_t)a18 withDownloadedFilesystemBytes:(int64_t)a19 withCurrentLockUsage:(id)a20 withSelectorsForStaging:(id)a21 withAvailableForUseError:(id)a22 withNewerVersionError:(id)a23
{
  BYTE2(v24) = a16;
  LOWORD(v24) = 0;
  return -[MAAutoAssetSetStatus initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:vendingAtomicInstanceForConfiguredEntries:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:](self, "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:vendingAtomicInstanceForConfiguredEntries:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:", a3, a4, 0, a6, 0, 0, 0, 0, a7, a8,
           a9,
           a10,
           0,
           0,
           0,
           0,
           a12,
           a13,
           a14,
           a15,
           v24,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23);
}

- (id)initStatusForClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 withConfiguredAssetEntries:(id)a5 withAtomicInstancesDownloaded:(id)a6 withCatalogCachedAssetSetID:(id)a7 withCatalogDownloadedFromLive:(id)a8 withCatalogLastTimeChecked:(id)a9 withCatalogPostedDate:(id)a10 withNewerAtomicInstanceDiscovered:(id)a11 withNewerDiscoveredAtomicEntries:(id)a12 withLatestDownloadedAtomicInstance:(id)a13 withLatestDowloadedAtomicInstanceEntries:(id)a14 withCurrentNotifications:(id)a15 withCurrentNeedPolicy:(id)a16 withSchedulerPolicy:(id)a17 withStagerPolicy:(id)a18 withDownloadUserInitiated:(BOOL)a19 withDownloadProgress:(id)a20 withDownloadedNetworkBytes:(int64_t)a21 withDownloadedFilesystemBytes:(int64_t)a22 withCurrentLockUsage:(id)a23 withSelectorsForStaging:(id)a24 withAvailableForUseError:(id)a25 withNewerVersionError:(id)a26
{
  BYTE2(v27) = a19;
  LOWORD(v27) = 0;
  return -[MAAutoAssetSetStatus initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:vendingAtomicInstanceForConfiguredEntries:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:](self, "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:vendingAtomicInstanceForConfiguredEntries:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12,
           a13,
           a14,
           0,
           0,
           0,
           0,
           a15,
           a16,
           a17,
           a18,
           v27,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26);
}

- (id)initStatusForClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 withConfiguredAssetEntries:(id)a5 withAtomicInstancesDownloaded:(id)a6 withCatalogCachedAssetSetID:(id)a7 withCatalogDownloadedFromLive:(id)a8 withCatalogLastTimeChecked:(id)a9 withCatalogPostedDate:(id)a10 withNewerAtomicInstanceDiscovered:(id)a11 withNewerDiscoveredAtomicEntries:(id)a12 withLatestDownloadedAtomicInstance:(id)a13 withLatestDowloadedAtomicInstanceEntries:(id)a14 withDownloadedCatalogCachedAssetSetID:(id)a15 withDownloadedCatalogDownloadedFromLive:(id)a16 withDownloadedCatalogLastTimeChecked:(id)a17 withDownloadedCatalogPostedDate:(id)a18 withCurrentNotifications:(id)a19 withCurrentNeedPolicy:(id)a20 withSchedulerPolicy:(id)a21 withStagerPolicy:(id)a22 withDownloadUserInitiated:(BOOL)a23 withDownloadProgress:(id)a24 withDownloadedNetworkBytes:(int64_t)a25 withDownloadedFilesystemBytes:(int64_t)a26 withCurrentLockUsage:(id)a27 withSelectorsForStaging:(id)a28 withAvailableForUseError:(id)a29 withNewerVersionError:(id)a30
{
  return -[MAAutoAssetSetStatus initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:vendingAtomicInstanceForConfiguredEntries:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:](self, "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:vendingAtomicInstanceForConfiguredEntries:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:", a3, a4, a5, a6, a7, a8);
}

- (id)initStatusForClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 withConfiguredAssetEntries:(id)a5 withAtomicInstancesDownloaded:(id)a6 withCatalogCachedAssetSetID:(id)a7 withCatalogDownloadedFromLive:(id)a8 withCatalogLastTimeChecked:(id)a9 withCatalogPostedDate:(id)a10 withNewerAtomicInstanceDiscovered:(id)a11 withNewerDiscoveredAtomicEntries:(id)a12 withLatestDownloadedAtomicInstance:(id)a13 withLatestDowloadedAtomicInstanceEntries:(id)a14 withDownloadedCatalogCachedAssetSetID:(id)a15 withDownloadedCatalogDownloadedFromLive:(id)a16 withDownloadedCatalogLastTimeChecked:(id)a17 withDownloadedCatalogPostedDate:(id)a18 withCurrentNotifications:(id)a19 withCurrentNeedPolicy:(id)a20 withSchedulerPolicy:(id)a21 withStagerPolicy:(id)a22 havingReceivedLookupResponse:(BOOL)a23 withDownloadUserInitiated:(BOOL)a24 withDownloadProgress:(id)a25 withDownloadedNetworkBytes:(int64_t)a26 withDownloadedFilesystemBytes:(int64_t)a27 withCurrentLockUsage:(id)a28 withSelectorsForStaging:(id)a29 withAvailableForUseError:(id)a30 withNewerVersionError:(id)a31
{
  return -[MAAutoAssetSetStatus initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:vendingAtomicInstanceForConfiguredEntries:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:](self, "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:vendingAtomicInstanceForConfiguredEntries:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:", a3, a4, a5, a6, a7, a8);
}

- (id)initStatusForClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 withConfiguredAssetEntries:(id)a5 withAtomicInstancesDownloaded:(id)a6 withCatalogCachedAssetSetID:(id)a7 withCatalogDownloadedFromLive:(id)a8 withCatalogLastTimeChecked:(id)a9 withCatalogPostedDate:(id)a10 withNewerAtomicInstanceDiscovered:(id)a11 withNewerDiscoveredAtomicEntries:(id)a12 withLatestDownloadedAtomicInstance:(id)a13 withLatestDowloadedAtomicInstanceEntries:(id)a14 withDownloadedCatalogCachedAssetSetID:(id)a15 withDownloadedCatalogDownloadedFromLive:(id)a16 withDownloadedCatalogLastTimeChecked:(id)a17 withDownloadedCatalogPostedDate:(id)a18 withCurrentNotifications:(id)a19 withCurrentNeedPolicy:(id)a20 withSchedulerPolicy:(id)a21 withStagerPolicy:(id)a22 havingReceivedLookupResponse:(BOOL)a23 vendingAtomicInstanceForConfiguredEntries:(BOOL)a24 withDownloadUserInitiated:(BOOL)a25 withDownloadProgress:(id)a26 withDownloadedNetworkBytes:(int64_t)a27 withDownloadedFilesystemBytes:(int64_t)a28 withCurrentLockUsage:(id)a29 withSelectorsForStaging:(id)a30 withAvailableForUseError:(id)a31 withNewerVersionError:(id)a32
{
  id v69 = a3;
  id v48 = a4;
  id v68 = a4;
  id v49 = a5;
  id v67 = a5;
  id v66 = a6;
  id v65 = a7;
  id v50 = a8;
  id v64 = a8;
  id v63 = a9;
  id v62 = a10;
  id v61 = a11;
  id v60 = a12;
  id v59 = a13;
  id v58 = a14;
  id v57 = a15;
  id v56 = a16;
  id v55 = a17;
  id v37 = a18;
  id v38 = a19;
  id v39 = a20;
  id v40 = a21;
  id v41 = a22;
  id v42 = a26;
  id v43 = a29;
  id v54 = a30;
  id v53 = a31;
  id v52 = a32;
  v70.receiver = self;
  v70.super_class = (Class)MAAutoAssetSetStatus;
  v44 = [(MAAutoAssetSetStatus *)&v70 init];
  uint64_t v45 = v44;
  if (v44)
  {
    objc_storeStrong((id *)&v44->_clientDomainName, a3);
    objc_storeStrong((id *)&v45->_assetSetIdentifier, v48);
    objc_storeStrong((id *)&v45->_configuredAssetEntries, v49);
    objc_storeStrong((id *)&v45->_atomicInstancesDownloaded, a6);
    objc_storeStrong((id *)&v45->_catalogCachedAssetSetID, a7);
    objc_storeStrong((id *)&v45->_catalogDownloadedFromLive, v50);
    objc_storeStrong((id *)&v45->_catalogLastTimeChecked, a9);
    objc_storeStrong((id *)&v45->_catalogPostedDate, a10);
    objc_storeStrong((id *)&v45->_newerAtomicInstanceDiscovered, a11);
    objc_storeStrong((id *)&v45->_newerDiscoveredAtomicEntries, a12);
    objc_storeStrong((id *)&v45->_latestDownloadedAtomicInstance, a13);
    objc_storeStrong((id *)&v45->_latestDowloadedAtomicInstanceEntries, a14);
    objc_storeStrong((id *)&v45->_downloadedCatalogCachedAssetSetID, a15);
    objc_storeStrong((id *)&v45->_downloadedCatalogDownloadedFromLive, a16);
    objc_storeStrong((id *)&v45->_downloadedCatalogLastTimeChecked, a17);
    objc_storeStrong((id *)&v45->_downloadedCatalogPostedDate, a18);
    objc_storeStrong((id *)&v45->_currentNotifications, a19);
    objc_storeStrong((id *)&v45->_currentNeedPolicy, a20);
    objc_storeStrong((id *)&v45->_schedulerPolicy, a21);
    objc_storeStrong((id *)&v45->_stagerPolicy, a22);
    v45->_haveReceivedLookupResponse = a23;
    v45->_vendingAtomicInstanceForConfiguredEntries = a24;
    v45->_downloadUserInitiated = a25;
    objc_storeStrong((id *)&v45->_downloadProgress, a26);
    v45->_downloadedNetworkBytes = a27;
    v45->_downloadedFilesystemBytes = a28;
    objc_storeStrong((id *)&v45->_currentLockUsage, a29);
    objc_storeStrong((id *)&v45->_selectorsForStaging, a30);
    objc_storeStrong((id *)&v45->_availableForUseError, a31);
    objc_storeStrong((id *)&v45->_newerVersionError, a32);
  }

  return v45;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MAAutoAssetSetStatus *)self clientDomainName];
  [v4 encodeObject:v5 forKey:@"clientDomainName"];

  uint64_t v6 = [(MAAutoAssetSetStatus *)self assetSetIdentifier];
  [v4 encodeObject:v6 forKey:@"assetSetIdentifier"];

  id v7 = [(MAAutoAssetSetStatus *)self configuredAssetEntries];
  [v4 encodeObject:v7 forKey:@"configuredAssetEntries"];

  id v8 = [(MAAutoAssetSetStatus *)self atomicInstancesDownloaded];
  [v4 encodeObject:v8 forKey:@"atomicInstancesDownloaded"];

  v9 = [(MAAutoAssetSetStatus *)self catalogCachedAssetSetID];
  [v4 encodeObject:v9 forKey:@"catalogCachedAssetSetID"];

  uint64_t v10 = [(MAAutoAssetSetStatus *)self catalogDownloadedFromLive];
  [v4 encodeObject:v10 forKey:@"catalogDownloadedFromLive"];

  uint64_t v11 = [(MAAutoAssetSetStatus *)self catalogLastTimeChecked];
  [v4 encodeObject:v11 forKey:@"catalogLastTimeChecked"];

  id v12 = [(MAAutoAssetSetStatus *)self catalogPostedDate];
  [v4 encodeObject:v12 forKey:@"catalogPostedDate"];

  uint64_t v13 = [(MAAutoAssetSetStatus *)self newerAtomicInstanceDiscovered];
  [v4 encodeObject:v13 forKey:@"newerAtomicInstanceDiscovered"];

  char v14 = [(MAAutoAssetSetStatus *)self newerDiscoveredAtomicEntries];
  [v4 encodeObject:v14 forKey:@"newerDiscoveredAtomicEntries"];

  id v15 = [(MAAutoAssetSetStatus *)self latestDownloadedAtomicInstance];
  [v4 encodeObject:v15 forKey:@"latestDownloadedAtomicInstance"];

  uint64_t v16 = [(MAAutoAssetSetStatus *)self latestDowloadedAtomicInstanceEntries];
  [v4 encodeObject:v16 forKey:@"latestDowloadedAtomicInstanceEntries"];

  uint64_t v17 = [(MAAutoAssetSetStatus *)self downloadedCatalogCachedAssetSetID];
  [v4 encodeObject:v17 forKey:@"downloadedCatalogCachedAssetSetID"];

  uint64_t v18 = [(MAAutoAssetSetStatus *)self downloadedCatalogDownloadedFromLive];
  [v4 encodeObject:v18 forKey:@"downloadedCatalogDownloadedFromLive"];

  v19 = [(MAAutoAssetSetStatus *)self downloadedCatalogLastTimeChecked];
  [v4 encodeObject:v19 forKey:@"downloadedCatalogLastTimeChecked"];

  uint64_t v20 = [(MAAutoAssetSetStatus *)self downloadedCatalogPostedDate];
  [v4 encodeObject:v20 forKey:@"downloadedCatalogPostedDate"];

  id v21 = [(MAAutoAssetSetStatus *)self currentNotifications];
  [v4 encodeObject:v21 forKey:@"currentNotifications"];

  id v22 = [(MAAutoAssetSetStatus *)self currentNeedPolicy];
  [v4 encodeObject:v22 forKey:@"currentNeedPolicy"];

  uint64_t v23 = [(MAAutoAssetSetStatus *)self schedulerPolicy];
  [v4 encodeObject:v23 forKey:@"schedulerPolicy"];

  uint64_t v24 = [(MAAutoAssetSetStatus *)self stagerPolicy];
  [v4 encodeObject:v24 forKey:@"stagerPolicy"];

  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetStatus haveReceivedLookupResponse](self, "haveReceivedLookupResponse"), @"haveReceivedLookupResponse");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetStatus vendingAtomicInstanceForConfiguredEntries](self, "vendingAtomicInstanceForConfiguredEntries"), @"vendingAtomicInstanceForConfiguredEntries");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetStatus downloadUserInitiated](self, "downloadUserInitiated"), @"downloadUserInitiated");
  uint64_t v25 = [(MAAutoAssetSetStatus *)self downloadProgress];
  [v4 encodeObject:v25 forKey:@"downloadProgress"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSetStatus downloadedNetworkBytes](self, "downloadedNetworkBytes"), @"downloadedNetworkBytes");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSetStatus downloadedFilesystemBytes](self, "downloadedFilesystemBytes"), @"downloadedFilesystemBytes");
  long long v26 = [(MAAutoAssetSetStatus *)self currentLockUsage];
  [v4 encodeObject:v26 forKey:@"currentLockUsage"];

  uint64_t v27 = [(MAAutoAssetSetStatus *)self selectorsForStaging];
  [v4 encodeObject:v27 forKey:@"selectorsForStaging"];

  uint64_t v28 = [(MAAutoAssetSetStatus *)self availableForUseError];
  [v4 encodeObject:v28 forKey:@"availableForUseError"];

  id v29 = [(MAAutoAssetSetStatus *)self newerVersionError];
  [v4 encodeObject:v29 forKey:@"newerVersionError"];
}

- (id)copy
{
  long long v26 = [MAAutoAssetSetStatus alloc];
  v46 = [(MAAutoAssetSetStatus *)self clientDomainName];
  uint64_t v45 = [(MAAutoAssetSetStatus *)self assetSetIdentifier];
  v32 = [(MAAutoAssetSetStatus *)self configuredAssetEntries];
  v44 = (void *)[v32 copy];
  uint64_t v31 = [(MAAutoAssetSetStatus *)self atomicInstancesDownloaded];
  id v43 = (void *)[v31 copy];
  id v42 = [(MAAutoAssetSetStatus *)self catalogCachedAssetSetID];
  id v39 = [(MAAutoAssetSetStatus *)self catalogDownloadedFromLive];
  id v41 = [(MAAutoAssetSetStatus *)self catalogLastTimeChecked];
  id v40 = [(MAAutoAssetSetStatus *)self catalogPostedDate];
  id v38 = [(MAAutoAssetSetStatus *)self newerAtomicInstanceDiscovered];
  long long v30 = [(MAAutoAssetSetStatus *)self newerDiscoveredAtomicEntries];
  id v37 = (void *)[v30 copy];
  id v29 = [(MAAutoAssetSetStatus *)self latestDownloadedAtomicInstance];
  v36 = (void *)[v29 copy];
  uint64_t v28 = [(MAAutoAssetSetStatus *)self latestDowloadedAtomicInstanceEntries];
  uint64_t v35 = (void *)[v28 copy];
  uint64_t v34 = [(MAAutoAssetSetStatus *)self downloadedCatalogCachedAssetSetID];
  uint64_t v33 = [(MAAutoAssetSetStatus *)self downloadedCatalogDownloadedFromLive];
  id v21 = [(MAAutoAssetSetStatus *)self downloadedCatalogLastTimeChecked];
  uint64_t v20 = [(MAAutoAssetSetStatus *)self downloadedCatalogPostedDate];
  uint64_t v25 = [(MAAutoAssetSetStatus *)self currentNotifications];
  uint64_t v16 = (void *)[v25 copy];
  uint64_t v24 = [(MAAutoAssetSetStatus *)self currentNeedPolicy];
  uint64_t v18 = (void *)[v24 copy];
  uint64_t v23 = [(MAAutoAssetSetStatus *)self schedulerPolicy];
  uint64_t v17 = (void *)[v23 copy];
  id v22 = [(MAAutoAssetSetStatus *)self stagerPolicy];
  id v15 = (void *)[v22 copy];
  BOOL v14 = [(MAAutoAssetSetStatus *)self haveReceivedLookupResponse];
  BOOL v3 = [(MAAutoAssetSetStatus *)self vendingAtomicInstanceForConfiguredEntries];
  BOOL v4 = [(MAAutoAssetSetStatus *)self downloadUserInitiated];
  v19 = [(MAAutoAssetSetStatus *)self downloadProgress];
  uint64_t v5 = (void *)[v19 copy];
  int64_t v6 = [(MAAutoAssetSetStatus *)self downloadedNetworkBytes];
  int64_t v7 = [(MAAutoAssetSetStatus *)self downloadedFilesystemBytes];
  id v8 = [(MAAutoAssetSetStatus *)self currentLockUsage];
  v9 = [(MAAutoAssetSetStatus *)self selectorsForStaging];
  uint64_t v10 = [(MAAutoAssetSetStatus *)self availableForUseError];
  uint64_t v11 = [(MAAutoAssetSetStatus *)self newerVersionError];
  BYTE2(v13) = v4;
  BYTE1(v13) = v3;
  LOBYTE(v13) = v14;
  id v27 = -[MAAutoAssetSetStatus initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:vendingAtomicInstanceForConfiguredEntries:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:](v26, "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:vendingAtomicInstanceForConfiguredEntries:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:", v46, v45, v44, v43, v42, v39, v41, v40, v38, v37,
          v36,
          v35,
          v34,
          v33,
          v21,
          v20,
          v16,
          v18,
          v17,
          v15,
          v13,
          v5,
          v6,
          v7,
          v8,
          v9,
          v10,
          v11);

  return v27;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v3 setDateFormat:@"yyyy-MM-dd_HH:mm:ss"];
  id v50 = NSString;
  uint64_t v4 = [(MAAutoAssetSetStatus *)self clientDomainName];
  v89 = [(MAAutoAssetSetStatus *)self assetSetIdentifier];
  id v57 = [(MAAutoAssetSetStatus *)self configuredAssetEntries];
  if (v57)
  {
    id v5 = [NSString alloc];
    id v43 = [(MAAutoAssetSetStatus *)self configuredAssetEntries];
    v78 = (__CFString *)objc_msgSend(v5, "initWithFormat:", @"%ld", objc_msgSend(v43, "count"));
  }
  else
  {
    v78 = @"N";
  }
  id v56 = [(MAAutoAssetSetStatus *)self atomicInstancesDownloaded];
  if (v56)
  {
    id v6 = [NSString alloc];
    id v42 = [(MAAutoAssetSetStatus *)self atomicInstancesDownloaded];
    v77 = (__CFString *)objc_msgSend(v6, "initWithFormat:", @"%ld", objc_msgSend(v42, "count"));
  }
  else
  {
    v77 = @"N";
  }
  id v55 = [(MAAutoAssetSetStatus *)self catalogCachedAssetSetID];
  if (v55)
  {
    v76 = [(MAAutoAssetSetStatus *)self catalogCachedAssetSetID];
  }
  else
  {
    v76 = @"N";
  }
  id v54 = [(MAAutoAssetSetStatus *)self catalogDownloadedFromLive];
  if (v54)
  {
    v75 = [(MAAutoAssetSetStatus *)self catalogDownloadedFromLive];
  }
  else
  {
    v75 = @"N";
  }
  uint64_t v7 = [(MAAutoAssetSetStatus *)self catalogLastTimeChecked];
  if (v7)
  {
    id v41 = [(MAAutoAssetSetStatus *)self catalogLastTimeChecked];
    objc_msgSend(v3, "stringFromDate:");
    v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v74 = @"N";
  }
  uint64_t v8 = [(MAAutoAssetSetStatus *)self catalogPostedDate];
  if (v8)
  {
    id v40 = [(MAAutoAssetSetStatus *)self catalogPostedDate];
    objc_msgSend(v3, "stringFromDate:");
    v73 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v73 = @"N";
  }
  uint64_t v9 = [(MAAutoAssetSetStatus *)self newerAtomicInstanceDiscovered];
  if (v9)
  {
    objc_super v72 = [(MAAutoAssetSetStatus *)self newerAtomicInstanceDiscovered];
  }
  else
  {
    objc_super v72 = @"N";
  }
  v88 = [(MAAutoAssetSetStatus *)self newerDiscoveredAtomicEntries];
  if (v88)
  {
    id v10 = [NSString alloc];
    id v39 = [(MAAutoAssetSetStatus *)self newerDiscoveredAtomicEntries];
    v71 = (__CFString *)objc_msgSend(v10, "initWithFormat:", @"%ld", objc_msgSend(v39, "count"));
  }
  else
  {
    v71 = @"N";
  }
  v87 = [(MAAutoAssetSetStatus *)self latestDownloadedAtomicInstance];
  if (v87)
  {
    objc_super v70 = [(MAAutoAssetSetStatus *)self latestDownloadedAtomicInstance];
  }
  else
  {
    objc_super v70 = @"N";
  }
  v86 = [(MAAutoAssetSetStatus *)self latestDowloadedAtomicInstanceEntries];
  if (v86)
  {
    id v11 = [NSString alloc];
    id v38 = [(MAAutoAssetSetStatus *)self latestDowloadedAtomicInstanceEntries];
    id v69 = (__CFString *)objc_msgSend(v11, "initWithFormat:", @"%ld", objc_msgSend(v38, "count"));
  }
  else
  {
    id v69 = @"N";
  }
  v85 = [(MAAutoAssetSetStatus *)self downloadedCatalogCachedAssetSetID];
  if (v85)
  {
    id v68 = [(MAAutoAssetSetStatus *)self downloadedCatalogCachedAssetSetID];
  }
  else
  {
    id v68 = @"N";
  }
  v84 = [(MAAutoAssetSetStatus *)self downloadedCatalogDownloadedFromLive];
  if (v84)
  {
    id v67 = [(MAAutoAssetSetStatus *)self downloadedCatalogDownloadedFromLive];
  }
  else
  {
    id v67 = @"N";
  }
  v83 = [(MAAutoAssetSetStatus *)self downloadedCatalogLastTimeChecked];
  if (v83)
  {
    id v37 = [(MAAutoAssetSetStatus *)self downloadedCatalogLastTimeChecked];
    objc_msgSend(v3, "stringFromDate:");
    id v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v66 = @"N";
  }
  v82 = [(MAAutoAssetSetStatus *)self downloadedCatalogPostedDate];
  if (v82)
  {
    v36 = [(MAAutoAssetSetStatus *)self downloadedCatalogPostedDate];
    objc_msgSend(v3, "stringFromDate:");
    id v65 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v65 = @"N";
  }
  id v49 = [(MAAutoAssetSetStatus *)self currentNotifications];
  v81 = [v49 summary];
  v80 = [(MAAutoAssetSetStatus *)self currentNeedPolicy];
  if (v80)
  {
    uint64_t v35 = [(MAAutoAssetSetStatus *)self currentNeedPolicy];
    id v64 = [v35 summary];
  }
  else
  {
    id v64 = @"N";
  }
  v79 = [(MAAutoAssetSetStatus *)self schedulerPolicy];
  id v53 = (void *)v7;
  if (v79)
  {
    uint64_t v34 = [(MAAutoAssetSetStatus *)self schedulerPolicy];
    id v63 = [v34 summary];
  }
  else
  {
    id v63 = @"N";
  }
  [(MAAutoAssetSetStatus *)self stagerPolicy];
  v48 = id v12 = @"N";
  if (v48)
  {
    uint64_t v33 = [(MAAutoAssetSetStatus *)self stagerPolicy];
    id v62 = [v33 summary];
  }
  else
  {
    id v62 = @"N";
  }
  if ([(MAAutoAssetSetStatus *)self haveReceivedLookupResponse]) {
    uint64_t v13 = @"Y";
  }
  else {
    uint64_t v13 = @"N";
  }
  v46 = v13;
  if ([(MAAutoAssetSetStatus *)self vendingAtomicInstanceForConfiguredEntries])
  {
    BOOL v14 = @"Y";
  }
  else
  {
    BOOL v14 = @"N";
  }
  uint64_t v45 = v14;
  if ([(MAAutoAssetSetStatus *)self downloadUserInitiated]) {
    id v15 = @"Y";
  }
  else {
    id v15 = @"N";
  }
  v44 = v15;
  uint64_t v47 = [(MAAutoAssetSetStatus *)self downloadProgress];
  id v58 = (void *)v4;
  id v59 = v3;
  if (v47)
  {
    v32 = [(MAAutoAssetSetStatus *)self downloadProgress];
    id v12 = [v32 description];
  }
  int64_t v16 = [(MAAutoAssetSetStatus *)self downloadedNetworkBytes];
  int64_t v17 = [(MAAutoAssetSetStatus *)self downloadedFilesystemBytes];
  uint64_t v18 = [(MAAutoAssetSetStatus *)self currentLockUsage];
  if (v18) {
    id v61 = +[MAAutoAssetSetStatus newCurrentLockUsageSummary:self];
  }
  else {
    id v61 = @"N";
  }
  v19 = [(MAAutoAssetSetStatus *)self selectorsForStaging];
  if (v19) {
    id v60 = +[MAAutoAssetSetStatus newSelectorsForStagingSummary:self];
  }
  else {
    id v60 = @"N";
  }
  uint64_t v51 = (void *)v9;
  uint64_t v20 = [(MAAutoAssetSetStatus *)self availableForUseError];
  id v52 = (void *)v8;
  if (v20)
  {
    uint64_t v31 = [(MAAutoAssetSetStatus *)self availableForUseError];
    id v21 = [v31 checkedSummary];
  }
  else
  {
    id v21 = @"N";
  }
  id v22 = [(MAAutoAssetSetStatus *)self newerVersionError];
  if (v22)
  {
    uint64_t v23 = [(MAAutoAssetSetStatus *)self newerVersionError];
    uint64_t v24 = [v23 checkedSummary];
    int64_t v29 = v16;
    uint64_t v25 = v58;
    objc_msgSend(v50, "stringWithFormat:", @"                      clientDomainName: %@\n                    assetSetIdentifier: %@\n                configuredAssetEntries: %@\n             atomicInstancesDownloaded: %@\n               catalogCachedAssetSetID: %@\n             catalogDownloadedFromLive: %@\n                catalogLastTimeChecked: %@\n                     catalogPostedDate: %@\n         newerAtomicInstanceDiscovered: %@\n          newerDiscoveredAtomicEntries: %@\n              latestDownloadedInstance: %@\n        latestDowloadedInstanceEntries: %@\n     downloadedCatalogCachedAssetSetID: %@\n   downloadedCatalogDownloadedFromLive: %@\n      downloadedCatalogLastTimeChecked: %@\n           downloadedCatalogPostedDate: %@\n                  currentNotifications: %@\n                     currentNeedPolicy: %@\n                       schedulerPolicy: %@\n                          stagerPolicy: %@\n            haveReceivedLookupResponse: %@\n vendingAtomicInstanceForConfigEntries: %@\n                 downloadUserInitiated: %@\n                      downloadProgress:\n%@\n                downloadedNetworkBytes: %ld\n             downloadedFilesystemBytes: %ld\n                      currentLockUsage: %@\n                   selectorsForStaging: %@\n                  availableForUseError: %@\n                     newerVersionError: %@\n", v58, v89, v78, v77, v76, v75, v74, v73, v72, v71, v70, v69, v68, v67, v66, v65,
      v81,
      v64,
      v63,
      v62,
      v46,
      v45,
      v44,
      v12,
      v29,
      v17,
      v61,
      v60,
      v21,
    long long v26 = v24);
  }
  else
  {
    int64_t v30 = v16;
    uint64_t v25 = v58;
    objc_msgSend(v50, "stringWithFormat:", @"                      clientDomainName: %@\n                    assetSetIdentifier: %@\n                configuredAssetEntries: %@\n             atomicInstancesDownloaded: %@\n               catalogCachedAssetSetID: %@\n             catalogDownloadedFromLive: %@\n                catalogLastTimeChecked: %@\n                     catalogPostedDate: %@\n         newerAtomicInstanceDiscovered: %@\n          newerDiscoveredAtomicEntries: %@\n              latestDownloadedInstance: %@\n        latestDowloadedInstanceEntries: %@\n     downloadedCatalogCachedAssetSetID: %@\n   downloadedCatalogDownloadedFromLive: %@\n      downloadedCatalogLastTimeChecked: %@\n           downloadedCatalogPostedDate: %@\n                  currentNotifications: %@\n                     currentNeedPolicy: %@\n                       schedulerPolicy: %@\n                          stagerPolicy: %@\n            haveReceivedLookupResponse: %@\n vendingAtomicInstanceForConfigEntries: %@\n                 downloadUserInitiated: %@\n                      downloadProgress:\n%@\n                downloadedNetworkBytes: %ld\n             downloadedFilesystemBytes: %ld\n                      currentLockUsage: %@\n                   selectorsForStaging: %@\n                  availableForUseError: %@\n                     newerVersionError: %@\n", v58, v89, v78, v77, v76, v75, v74, v73, v72, v71, v70, v69, v68, v67, v66, v65,
      v81,
      v64,
      v63,
      v62,
      v46,
      v45,
      v44,
      v12,
      v30,
      v17,
      v61,
      v60,
      v21,
    long long v26 = @"N");
  }

  if (v20)
  {
  }
  if (v19) {

  }
  if (v18) {
  if (v47)
  }
  {
  }
  if (v48)
  {
  }
  if (v79)
  {
  }
  if (v80)
  {
  }
  if (v82)
  {
  }
  if (v83)
  {
  }
  if (v84) {

  }
  if (v85) {
  if (v86)
  }
  {
  }
  if (v87) {

  }
  if (v88)
  {
  }
  if (v51) {

  }
  if (v52)
  {
  }
  if (v53)
  {
  }
  if (v54) {

  }
  if (v55) {
  if (v56)
  }
  {
  }
  if (v57)
  {
  }
  id v27 = v26;

  return v27;
}

+ (id)newCurrentLockUsageDetailed:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 currentLockUsage];

  if (v4)
  {
    id v5 = [NSString alloc];
    id v6 = [v3 currentLockUsage];
    uint64_t v7 = [v6 description];
    uint64_t v4 = (void *)[v5 initWithFormat:@"%@", v7];
  }
  return v4;
}

+ (id)newSelectorsForStagingSummary:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 selectorsForStaging];

  if (v4)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"{"];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id obj = [v3 selectorsForStaging];
    uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      char v8 = 1;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * v9);
          id v11 = [v3 selectorsForStaging];
          id v12 = [v11 safeObjectForKey:v10 ofClass:objc_opt_class()];

          uint64_t v13 = [v12 count];
          if ((v8 & 1) == 0) {
            [v4 appendString:@","];
          }
          [v4 appendFormat:@"%@:%ld", v10, v13];

          char v8 = 0;
          ++v9;
        }
        while (v6 != v9);
        uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
        char v8 = 0;
      }
      while (v6);
    }

    [v4 appendString:@"}"];
  }

  return v4;
}

- (void)setConfiguredAssetEntries:(id)a3
{
}

- (void)setAtomicInstancesDownloaded:(id)a3
{
}

- (NSString)catalogCachedAssetSetID
{
  return self->_catalogCachedAssetSetID;
}

- (void)setCatalogCachedAssetSetID:(id)a3
{
}

- (NSURL)catalogDownloadedFromLive
{
  return self->_catalogDownloadedFromLive;
}

- (void)setCatalogDownloadedFromLive:(id)a3
{
}

- (NSDate)catalogLastTimeChecked
{
  return self->_catalogLastTimeChecked;
}

- (void)setCatalogLastTimeChecked:(id)a3
{
}

- (NSDate)catalogPostedDate
{
  return self->_catalogPostedDate;
}

- (void)setCatalogPostedDate:(id)a3
{
}

- (void)setNewerAtomicInstanceDiscovered:(id)a3
{
}

- (void)setNewerDiscoveredAtomicEntries:(id)a3
{
}

- (void)setLatestDownloadedAtomicInstance:(id)a3
{
}

- (void)setLatestDowloadedAtomicInstanceEntries:(id)a3
{
}

- (NSDictionary)allDownloadedAtomicInstanceEntries
{
  return self->_allDownloadedAtomicInstanceEntries;
}

- (void)setAllDownloadedAtomicInstanceEntries:(id)a3
{
}

- (void)setDownloadedCatalogCachedAssetSetID:(id)a3
{
}

- (NSURL)downloadedCatalogDownloadedFromLive
{
  return self->_downloadedCatalogDownloadedFromLive;
}

- (void)setDownloadedCatalogDownloadedFromLive:(id)a3
{
}

- (NSDate)downloadedCatalogLastTimeChecked
{
  return self->_downloadedCatalogLastTimeChecked;
}

- (void)setDownloadedCatalogLastTimeChecked:(id)a3
{
}

- (NSDate)downloadedCatalogPostedDate
{
  return self->_downloadedCatalogPostedDate;
}

- (void)setDownloadedCatalogPostedDate:(id)a3
{
}

- (MAAutoAssetSetNotifications)currentNotifications
{
  return self->_currentNotifications;
}

- (void)setCurrentNotifications:(id)a3
{
}

- (MAAutoAssetSetPolicy)currentNeedPolicy
{
  return self->_currentNeedPolicy;
}

- (void)setCurrentNeedPolicy:(id)a3
{
}

- (MAAutoAssetSetPolicy)schedulerPolicy
{
  return self->_schedulerPolicy;
}

- (void)setSchedulerPolicy:(id)a3
{
}

- (MAAutoAssetSetPolicy)stagerPolicy
{
  return self->_stagerPolicy;
}

- (void)setStagerPolicy:(id)a3
{
}

- (void)setHaveReceivedLookupResponse:(BOOL)a3
{
  self->_haveReceivedLookupResponse = a3;
}

- (void)setVendingAtomicInstanceForConfiguredEntries:(BOOL)a3
{
  self->_vendingAtomicInstanceForConfiguredEntries = a3;
}

- (void)setDownloadUserInitiated:(BOOL)a3
{
  self->_downloadUserInitiated = a3;
}

- (MAAutoAssetSetProgress)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setDownloadProgress:(id)a3
{
}

- (int64_t)downloadedNetworkBytes
{
  return self->_downloadedNetworkBytes;
}

- (void)setDownloadedNetworkBytes:(int64_t)a3
{
  self->_downloadedNetworkBytes = a3;
}

- (int64_t)downloadedFilesystemBytes
{
  return self->_downloadedFilesystemBytes;
}

- (void)setDownloadedFilesystemBytes:(int64_t)a3
{
  self->_downloadedFilesystemBytes = a3;
}

- (void)setCurrentLockUsage:(id)a3
{
}

- (NSDictionary)selectorsForStaging
{
  return self->_selectorsForStaging;
}

- (void)setSelectorsForStaging:(id)a3
{
}

- (NSError)availableForUseError
{
  return self->_availableForUseError;
}

- (void)setAvailableForUseError:(id)a3
{
}

- (NSError)newerVersionError
{
  return self->_newerVersionError;
}

- (void)setNewerVersionError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newerVersionError, 0);
  objc_storeStrong((id *)&self->_availableForUseError, 0);
  objc_storeStrong((id *)&self->_selectorsForStaging, 0);
  objc_storeStrong((id *)&self->_currentLockUsage, 0);
  objc_storeStrong((id *)&self->_downloadProgress, 0);
  objc_storeStrong((id *)&self->_stagerPolicy, 0);
  objc_storeStrong((id *)&self->_schedulerPolicy, 0);
  objc_storeStrong((id *)&self->_currentNeedPolicy, 0);
  objc_storeStrong((id *)&self->_currentNotifications, 0);
  objc_storeStrong((id *)&self->_downloadedCatalogPostedDate, 0);
  objc_storeStrong((id *)&self->_downloadedCatalogLastTimeChecked, 0);
  objc_storeStrong((id *)&self->_downloadedCatalogDownloadedFromLive, 0);
  objc_storeStrong((id *)&self->_downloadedCatalogCachedAssetSetID, 0);
  objc_storeStrong((id *)&self->_allDownloadedAtomicInstanceEntries, 0);
  objc_storeStrong((id *)&self->_latestDowloadedAtomicInstanceEntries, 0);
  objc_storeStrong((id *)&self->_latestDownloadedAtomicInstance, 0);
  objc_storeStrong((id *)&self->_newerDiscoveredAtomicEntries, 0);
  objc_storeStrong((id *)&self->_newerAtomicInstanceDiscovered, 0);
  objc_storeStrong((id *)&self->_catalogPostedDate, 0);
  objc_storeStrong((id *)&self->_catalogLastTimeChecked, 0);
  objc_storeStrong((id *)&self->_catalogDownloadedFromLive, 0);
  objc_storeStrong((id *)&self->_catalogCachedAssetSetID, 0);
  objc_storeStrong((id *)&self->_atomicInstancesDownloaded, 0);
  objc_storeStrong((id *)&self->_configuredAssetEntries, 0);
  objc_storeStrong((id *)&self->_assetSetIdentifier, 0);
  objc_storeStrong((id *)&self->_clientDomainName, 0);
}

@end