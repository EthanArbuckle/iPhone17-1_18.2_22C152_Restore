@interface MAAutoAssetStatus
+ (BOOL)supportsSecureCoding;
+ (id)newCurrentLockUsageSummary:(id)a3;
- (BOOL)downloadUserInitiated;
- (BOOL)downloadedAsPatch;
- (BOOL)neverBeenLocked;
- (BOOL)patchingAttempted;
- (BOOL)stagedPriorToAvailable;
- (MAAutoAssetNotifications)notifications;
- (MAAutoAssetProgress)downloadProgress;
- (MAAutoAssetSelector)assetSelector;
- (MAAutoAssetSelector)patchedFromBaseSelector;
- (MAAutoAssetStatus)initWithAssetSelector:(id)a3 withNotifications:(id)a4 withAvailableForUseAttributes:(id)a5 withNewerVersionAttributes:(id)a6 withDownloadUserInitiated:(BOOL)a7 withDownloadProgress:(id)a8 withDownloadedNetworkBytes:(int64_t)a9 withDownloadedFilesystemBytes:(int64_t)a10 withDownloadedAsPatch:(BOOL)a11 withPatchedFromBaseSelector:(id)a12 withPatchedFromBaseFilesystemBytes:(int64_t)a13 withPatchingAttempted:(BOOL)a14 withStagedPriorToAvailable:(BOOL)a15 withStagedFromOSVersion:(id)a16 withStagedFromBuildVersion:(id)a17 withCurrentLockUsage:(id)a18 withAvailableForUseError:(id)a19 withPatchingAttemptError:(id)a20 withNewerVersionError:(id)a21;
- (MAAutoAssetStatus)initWithAssetSelector:(id)a3 withNotifications:(id)a4 withAvailableForUseAttributes:(id)a5 withNewerVersionAttributes:(id)a6 withNeverBeenLocked:(BOOL)a7 withDownloadUserInitiated:(BOOL)a8 withDownloadProgress:(id)a9 withDownloadedNetworkBytes:(int64_t)a10 withDownloadedFilesystemBytes:(int64_t)a11 withDownloadedAsPatch:(BOOL)a12 withPatchedFromBaseSelector:(id)a13 withPatchedFromBaseFilesystemBytes:(int64_t)a14 withPatchingAttempted:(BOOL)a15 withStagedPriorToAvailable:(BOOL)a16 withStagedFromOSVersion:(id)a17 withStagedFromBuildVersion:(id)a18 withCurrentLockUsage:(id)a19 withAvailableForUseError:(id)a20 withPatchingAttemptError:(id)a21 withNewerVersionError:(id)a22;
- (MAAutoAssetStatus)initWithCoder:(id)a3;
- (NSDictionary)availableForUseAttributes;
- (NSDictionary)currentLockUsage;
- (NSDictionary)newerVersionAttributes;
- (NSError)availableForUseError;
- (NSError)newerVersionError;
- (NSError)patchingAttemptError;
- (NSString)stagedFromBuildVersion;
- (NSString)stagedFromOSVersion;
- (id)copy;
- (id)description;
- (id)newSummaryDictionary;
- (id)summary;
- (int64_t)downloadedFilesystemBytes;
- (int64_t)downloadedNetworkBytes;
- (int64_t)patchedFromBaseFilesystemBytes;
- (void)encodeWithCoder:(id)a3;
- (void)getAvailableForUseAttributesAssetFormat:(id *)a3 assetBuild:(id *)a4 minOSVersion:(id *)a5 maxOSVersion:(id *)a6 prerequisiteBuilds:(id *)a7;
- (void)setAssetSelector:(id)a3;
- (void)setAvailableForUseAttributes:(id)a3;
- (void)setAvailableForUseError:(id)a3;
- (void)setCurrentLockUsage:(id)a3;
- (void)setDownloadProgress:(id)a3;
- (void)setDownloadUserInitiated:(BOOL)a3;
- (void)setDownloadedAsPatch:(BOOL)a3;
- (void)setDownloadedFilesystemBytes:(int64_t)a3;
- (void)setDownloadedNetworkBytes:(int64_t)a3;
- (void)setNeverBeenLocked:(BOOL)a3;
- (void)setNewerVersionAttributes:(id)a3;
- (void)setNewerVersionError:(id)a3;
- (void)setNotifications:(id)a3;
- (void)setPatchedFromBaseFilesystemBytes:(int64_t)a3;
- (void)setPatchedFromBaseSelector:(id)a3;
- (void)setPatchingAttemptError:(id)a3;
- (void)setPatchingAttempted:(BOOL)a3;
- (void)setStagedFromBuildVersion:(id)a3;
- (void)setStagedFromOSVersion:(id)a3;
- (void)setStagedPriorToAvailable:(BOOL)a3;
@end

@implementation MAAutoAssetStatus

- (MAAutoAssetStatus)initWithAssetSelector:(id)a3 withNotifications:(id)a4 withAvailableForUseAttributes:(id)a5 withNewerVersionAttributes:(id)a6 withDownloadUserInitiated:(BOOL)a7 withDownloadProgress:(id)a8 withDownloadedNetworkBytes:(int64_t)a9 withDownloadedFilesystemBytes:(int64_t)a10 withDownloadedAsPatch:(BOOL)a11 withPatchedFromBaseSelector:(id)a12 withPatchedFromBaseFilesystemBytes:(int64_t)a13 withPatchingAttempted:(BOOL)a14 withStagedPriorToAvailable:(BOOL)a15 withStagedFromOSVersion:(id)a16 withStagedFromBuildVersion:(id)a17 withCurrentLockUsage:(id)a18 withAvailableForUseError:(id)a19 withPatchingAttemptError:(id)a20 withNewerVersionError:(id)a21
{
  LOWORD(v23) = __PAIR16__(a15, a14);
  LOBYTE(v22) = a11;
  return -[MAAutoAssetStatus initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withNeverBeenLocked:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailableForUseError:withPatchingAttemptError:withNewerVersionError:](self, "initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withNeverBeenLocked:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailableForUseError:withPatchingAttemptError:withNewerVersionError:", a3, a4, a5, a6, 0, a7, a8, a9, a10, v22, a12, a13, v23,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21);
}

- (MAAutoAssetStatus)initWithAssetSelector:(id)a3 withNotifications:(id)a4 withAvailableForUseAttributes:(id)a5 withNewerVersionAttributes:(id)a6 withNeverBeenLocked:(BOOL)a7 withDownloadUserInitiated:(BOOL)a8 withDownloadProgress:(id)a9 withDownloadedNetworkBytes:(int64_t)a10 withDownloadedFilesystemBytes:(int64_t)a11 withDownloadedAsPatch:(BOOL)a12 withPatchedFromBaseSelector:(id)a13 withPatchedFromBaseFilesystemBytes:(int64_t)a14 withPatchingAttempted:(BOOL)a15 withStagedPriorToAvailable:(BOOL)a16 withStagedFromOSVersion:(id)a17 withStagedFromBuildVersion:(id)a18 withCurrentLockUsage:(id)a19 withAvailableForUseError:(id)a20 withPatchingAttemptError:(id)a21 withNewerVersionError:(id)a22
{
  id v41 = a3;
  id v44 = a4;
  id v35 = a5;
  id v40 = a5;
  id v43 = a6;
  id v25 = a9;
  id v42 = a13;
  id v39 = a17;
  id v26 = a18;
  id v27 = a19;
  id v28 = a20;
  id v29 = a21;
  id v30 = a22;
  v45.receiver = self;
  v45.super_class = (Class)MAAutoAssetStatus;
  v31 = [(MAAutoAssetStatus *)&v45 init];
  v32 = v31;
  if (v31)
  {
    objc_storeStrong((id *)&v31->_assetSelector, a3);
    objc_storeStrong((id *)&v32->_notifications, a4);
    objc_storeStrong((id *)&v32->_availableForUseAttributes, v35);
    objc_storeStrong((id *)&v32->_newerVersionAttributes, a6);
    v32->_neverBeenLocked = a7;
    v32->_downloadUserInitiated = a8;
    objc_storeStrong((id *)&v32->_downloadProgress, a9);
    v32->_downloadedNetworkBytes = a10;
    v32->_downloadedFilesystemBytes = a11;
    v32->_downloadedAsPatch = a12;
    objc_storeStrong((id *)&v32->_patchedFromBaseSelector, a13);
    v32->_patchedFromBaseFilesystemBytes = a14;
    v32->_patchingAttempted = a15;
    v32->_stagedPriorToAvailable = a16;
    objc_storeStrong((id *)&v32->_stagedFromOSVersion, a17);
    objc_storeStrong((id *)&v32->_stagedFromBuildVersion, a18);
    objc_storeStrong((id *)&v32->_currentLockUsage, a19);
    objc_storeStrong((id *)&v32->_availableForUseError, a20);
    objc_storeStrong((id *)&v32->_patchingAttemptError, a21);
    objc_storeStrong((id *)&v32->_newerVersionError, a22);
  }

  return v32;
}

- (MAAutoAssetStatus)initWithCoder:(id)a3
{
  v39[8] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)MAAutoAssetStatus;
  v5 = [(MAAutoAssetStatus *)&v37 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    v39[2] = objc_opt_class();
    v39[3] = objc_opt_class();
    v39[4] = objc_opt_class();
    v39[5] = objc_opt_class();
    v39[6] = objc_opt_class();
    v39[7] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:8];
    v8 = [v6 setWithArray:v7];

    v9 = (void *)MEMORY[0x1E4F1CAD0];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    v38[2] = objc_opt_class();
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:3];
    v11 = [v9 setWithArray:v10];

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetSelector"];
    assetSelector = v5->_assetSelector;
    v5->_assetSelector = (MAAutoAssetSelector *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notifications"];
    notifications = v5->_notifications;
    v5->_notifications = (MAAutoAssetNotifications *)v14;

    uint64_t v16 = [v4 decodeObjectOfClasses:v8 forKey:@"availableForUseAttributes"];
    availableForUseAttributes = v5->_availableForUseAttributes;
    v5->_availableForUseAttributes = (NSDictionary *)v16;

    uint64_t v18 = [v4 decodeObjectOfClasses:v8 forKey:@"newerVersionAttributes"];
    newerVersionAttributes = v5->_newerVersionAttributes;
    v5->_newerVersionAttributes = (NSDictionary *)v18;

    v5->_neverBeenLocked = [v4 decodeBoolForKey:@"neverBeenLocked"];
    v5->_downloadUserInitiated = [v4 decodeBoolForKey:@"downloadUserInitiated"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"downloadProgress"];
    downloadProgress = v5->_downloadProgress;
    v5->_downloadProgress = (MAAutoAssetProgress *)v20;

    v5->_downloadedNetworkBytes = [v4 decodeIntegerForKey:@"downloadedNetworkBytes"];
    v5->_downloadedFilesystemBytes = [v4 decodeIntegerForKey:@"downloadedFilesystemBytes"];
    v5->_downloadedAsPatch = [v4 decodeBoolForKey:@"downloadedAsPatch"];
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"patchedFromBaseSelector"];
    patchedFromBaseSelector = v5->_patchedFromBaseSelector;
    v5->_patchedFromBaseSelector = (MAAutoAssetSelector *)v22;

    v5->_patchedFromBaseFilesystemBytes = [v4 decodeIntegerForKey:@"patchedFromBaseFilesystemBytes"];
    v5->_patchingAttempted = [v4 decodeBoolForKey:@"patchingAttempted"];
    v5->_stagedPriorToAvailable = [v4 decodeBoolForKey:@"stagedPriorToAvailable"];
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stagedFromOSVersion"];
    stagedFromOSVersion = v5->_stagedFromOSVersion;
    v5->_stagedFromOSVersion = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stagedFromBuildVersion"];
    stagedFromBuildVersion = v5->_stagedFromBuildVersion;
    v5->_stagedFromBuildVersion = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClasses:v11 forKey:@"currentLockUsage"];
    currentLockUsage = v5->_currentLockUsage;
    v5->_currentLockUsage = (NSDictionary *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"availableForUseError"];
    availableForUseError = v5->_availableForUseError;
    v5->_availableForUseError = (NSError *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"patchingAttemptError"];
    patchingAttemptError = v5->_patchingAttemptError;
    v5->_patchingAttemptError = (NSError *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"newerVersionError"];
    newerVersionError = v5->_newerVersionError;
    v5->_newerVersionError = (NSError *)v34;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MAAutoAssetStatus *)self assetSelector];
  [v4 encodeObject:v5 forKey:@"assetSelector"];

  v6 = [(MAAutoAssetStatus *)self notifications];
  [v4 encodeObject:v6 forKey:@"notifications"];

  v7 = [(MAAutoAssetStatus *)self availableForUseAttributes];
  [v4 encodeObject:v7 forKey:@"availableForUseAttributes"];

  v8 = [(MAAutoAssetStatus *)self newerVersionAttributes];
  [v4 encodeObject:v8 forKey:@"newerVersionAttributes"];

  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetStatus neverBeenLocked](self, "neverBeenLocked"), @"neverBeenLocked");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetStatus downloadUserInitiated](self, "downloadUserInitiated"), @"downloadUserInitiated");
  v9 = [(MAAutoAssetStatus *)self downloadProgress];
  [v4 encodeObject:v9 forKey:@"downloadProgress"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetStatus downloadedNetworkBytes](self, "downloadedNetworkBytes"), @"downloadedNetworkBytes");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetStatus downloadedFilesystemBytes](self, "downloadedFilesystemBytes"), @"downloadedFilesystemBytes");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetStatus downloadedAsPatch](self, "downloadedAsPatch"), @"downloadedAsPatch");
  v10 = [(MAAutoAssetStatus *)self patchedFromBaseSelector];
  [v4 encodeObject:v10 forKey:@"patchedFromBaseSelector"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetStatus patchedFromBaseFilesystemBytes](self, "patchedFromBaseFilesystemBytes"), @"patchedFromBaseFilesystemBytes");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetStatus patchingAttempted](self, "patchingAttempted"), @"patchingAttempted");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetStatus stagedPriorToAvailable](self, "stagedPriorToAvailable"), @"stagedPriorToAvailable");
  v11 = [(MAAutoAssetStatus *)self stagedFromOSVersion];
  [v4 encodeObject:v11 forKey:@"stagedFromOSVersion"];

  uint64_t v12 = [(MAAutoAssetStatus *)self stagedFromBuildVersion];
  [v4 encodeObject:v12 forKey:@"stagedFromBuildVersion"];

  v13 = [(MAAutoAssetStatus *)self currentLockUsage];
  [v4 encodeObject:v13 forKey:@"currentLockUsage"];

  uint64_t v14 = [(MAAutoAssetStatus *)self availableForUseError];
  [v4 encodeObject:v14 forKey:@"availableForUseError"];

  v15 = [(MAAutoAssetStatus *)self patchingAttemptError];
  [v4 encodeObject:v15 forKey:@"patchingAttemptError"];

  id v16 = [(MAAutoAssetStatus *)self newerVersionError];
  [v4 encodeObject:v16 forKey:@"newerVersionError"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  id v27 = [MAAutoAssetStatus alloc];
  v31 = [(MAAutoAssetStatus *)self assetSelector];
  uint64_t v26 = (void *)[v31 copy];
  uint64_t v30 = [(MAAutoAssetStatus *)self notifications];
  id v25 = (void *)[v30 copy];
  uint64_t v24 = [(MAAutoAssetStatus *)self availableForUseAttributes];
  uint64_t v23 = [(MAAutoAssetStatus *)self newerVersionAttributes];
  BOOL v21 = [(MAAutoAssetStatus *)self neverBeenLocked];
  BOOL v20 = [(MAAutoAssetStatus *)self downloadUserInitiated];
  id v29 = [(MAAutoAssetStatus *)self downloadProgress];
  uint64_t v32 = (void *)[v29 copy];
  int64_t v19 = [(MAAutoAssetStatus *)self downloadedNetworkBytes];
  int64_t v18 = [(MAAutoAssetStatus *)self downloadedFilesystemBytes];
  BOOL v17 = [(MAAutoAssetStatus *)self downloadedAsPatch];
  uint64_t v22 = [(MAAutoAssetStatus *)self patchedFromBaseSelector];
  v15 = (void *)[v22 copy];
  int64_t v16 = [(MAAutoAssetStatus *)self patchedFromBaseFilesystemBytes];
  BOOL v3 = [(MAAutoAssetStatus *)self patchingAttempted];
  BOOL v4 = [(MAAutoAssetStatus *)self stagedPriorToAvailable];
  uint64_t v14 = [(MAAutoAssetStatus *)self stagedFromOSVersion];
  v5 = [(MAAutoAssetStatus *)self stagedFromBuildVersion];
  v6 = [(MAAutoAssetStatus *)self currentLockUsage];
  v7 = (void *)[v6 copy];
  v8 = [(MAAutoAssetStatus *)self availableForUseError];
  v9 = [(MAAutoAssetStatus *)self patchingAttemptError];
  v10 = [(MAAutoAssetStatus *)self newerVersionError];
  BYTE1(v13) = v4;
  LOBYTE(v13) = v3;
  LOBYTE(v12) = v17;
  uint64_t v28 = -[MAAutoAssetStatus initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withNeverBeenLocked:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailableForUseError:withPatchingAttemptError:withNewerVersionError:](v27, "initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withNeverBeenLocked:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailableForUseError:withPatchingAttemptError:withNewerVersionError:", v26, v25, v24, v23, v21, v20, v32, v19, v18, v12, v15, v16, v13,
          v14,
          v5,
          v7,
          v8,
          v9,
          v10);

  return v28;
}

- (id)description
{
  v58 = (void *)MEMORY[0x1E4F28E78];
  BOOL v3 = [(MAAutoAssetStatus *)self assetSelector];
  v68 = [v3 summary];
  BOOL v4 = [(MAAutoAssetStatus *)self notifications];
  v67 = [v4 summary];
  v5 = [(MAAutoAssetStatus *)self availableForUseAttributes];
  v6 = @"N";
  if (v5) {
    v7 = @"Y";
  }
  else {
    v7 = @"N";
  }
  v57 = v7;
  v8 = [(MAAutoAssetStatus *)self newerVersionAttributes];
  if (v8) {
    v9 = @"Y";
  }
  else {
    v9 = @"N";
  }
  v56 = v9;
  if ([(MAAutoAssetStatus *)self neverBeenLocked]) {
    v10 = @"Y";
  }
  else {
    v10 = @"N";
  }
  v54 = v10;
  if ([(MAAutoAssetStatus *)self downloadUserInitiated]) {
    v11 = @"Y";
  }
  else {
    v11 = @"N";
  }
  v53 = v11;
  uint64_t v12 = [(MAAutoAssetStatus *)self downloadProgress];
  if (v12)
  {
    id v43 = [(MAAutoAssetStatus *)self downloadProgress];
    v65 = [v43 summary];
  }
  else
  {
    v65 = @"N";
  }
  int64_t v51 = [(MAAutoAssetStatus *)self downloadedNetworkBytes];
  int64_t v50 = [(MAAutoAssetStatus *)self downloadedFilesystemBytes];
  if ([(MAAutoAssetStatus *)self downloadedAsPatch]) {
    uint64_t v13 = @"Y";
  }
  else {
    uint64_t v13 = @"N";
  }
  v49 = v13;
  uint64_t v14 = [(MAAutoAssetStatus *)self patchedFromBaseSelector];
  if (v14)
  {
    id v41 = [(MAAutoAssetStatus *)self patchedFromBaseSelector];
    v64 = [v41 summary];
  }
  else
  {
    v64 = @"N";
  }
  int64_t v48 = [(MAAutoAssetStatus *)self patchedFromBaseFilesystemBytes];
  if ([(MAAutoAssetStatus *)self patchingAttempted]) {
    v15 = @"Y";
  }
  else {
    v15 = @"N";
  }
  v46 = v15;
  if ([(MAAutoAssetStatus *)self stagedPriorToAvailable]) {
    int64_t v16 = @"Y";
  }
  else {
    int64_t v16 = @"N";
  }
  objc_super v45 = v16;
  uint64_t v17 = [(MAAutoAssetStatus *)self stagedFromOSVersion];
  if (v17)
  {
    v6 = [(MAAutoAssetStatus *)self stagedFromOSVersion];
  }
  uint64_t v18 = [(MAAutoAssetStatus *)self stagedFromBuildVersion];
  if (v18)
  {
    v63 = [(MAAutoAssetStatus *)self stagedFromBuildVersion];
  }
  else
  {
    v63 = @"N";
  }
  v66 = [(MAAutoAssetStatus *)self currentLockUsage];
  if (v66) {
    v62 = +[MAAutoAssetStatus newCurrentLockUsageSummary:self];
  }
  else {
    v62 = @"N";
  }
  v47 = [(MAAutoAssetStatus *)self availableForUseError];
  v52 = (void *)v18;
  if (v47)
  {
    id v40 = [(MAAutoAssetStatus *)self availableForUseError];
    v61 = [v40 checkedSummary];
  }
  else
  {
    v61 = @"N";
  }
  int64_t v19 = [(MAAutoAssetStatus *)self patchingAttemptError];
  v55 = (void *)v17;
  if (v19)
  {
    id v39 = [(MAAutoAssetStatus *)self patchingAttemptError];
    v60 = [v39 checkedSummary];
  }
  else
  {
    v60 = @"N";
  }
  BOOL v20 = [(MAAutoAssetStatus *)self newerVersionError];
  if (v20)
  {
    [(MAAutoAssetStatus *)self newerVersionError];
    id v44 = v8;
    id v42 = v5;
    BOOL v21 = v4;
    v23 = uint64_t v22 = v3;
    [v23 checkedSummary];
    uint64_t v24 = v14;
    v26 = id v25 = v12;
    objc_msgSend(v58, "stringWithFormat:", @"                   assetSelector: %@\n                   notifications: %@\n       availableForUseAttributes: %@\n          newerVersionAttributes: %@\n                 neverBeenLocked: %@\n           downloadUserInitiated: %@\n                downloadProgress: %@\n          downloadedNetworkBytes: %ld\n       downloadedFilesystemBytes: %ld\n               downloadedAsPatch: %@\n         patchedFromBaseSelector: %@\n  patchedFromBaseFilesystemBytes: %ld\n               patchingAttempted: %@\n          stagedPriorToAvailable: %@\n             stagedFromOSVersion: %@\n          stagedFromBuildVersion: %@\n                currentLockUsage: %@\n            availableForUseError: %@\n            patchingAttemptError: %@\n               newerVersionError: %@\n", v68, v67, v57, v56, v54, v53, v65, v51, v50, v49, v64, v48, v46, v45, v6, v63,
      v62,
      v61,
      v60,
    v59 = v26);

    uint64_t v12 = v25;
    uint64_t v14 = v24;

    BOOL v3 = v22;
    BOOL v4 = v21;
    v5 = v42;
    v8 = v44;
  }
  else
  {
    objc_msgSend(v58, "stringWithFormat:", @"                   assetSelector: %@\n                   notifications: %@\n       availableForUseAttributes: %@\n          newerVersionAttributes: %@\n                 neverBeenLocked: %@\n           downloadUserInitiated: %@\n                downloadProgress: %@\n          downloadedNetworkBytes: %ld\n       downloadedFilesystemBytes: %ld\n               downloadedAsPatch: %@\n         patchedFromBaseSelector: %@\n  patchedFromBaseFilesystemBytes: %ld\n               patchingAttempted: %@\n          stagedPriorToAvailable: %@\n             stagedFromOSVersion: %@\n          stagedFromBuildVersion: %@\n                currentLockUsage: %@\n            availableForUseError: %@\n            patchingAttemptError: %@\n               newerVersionError: %@\n", v68, v67, v57, v56, v54, v53, v65, v51, v50, v49, v64, v48, v46, v45, v6, v63,
      v62,
      v61,
      v60,
    v59 = @"N");
  }

  if (v19)
  {
  }
  if (v47)
  {
  }
  if (v66) {

  }
  if (v52) {
  if (v55)
  }

  if (v14)
  {
  }
  if (v12)
  {
  }
  id v27 = [(MAAutoAssetStatus *)self availableForUseAttributes];

  if (v27)
  {
    id v72 = 0;
    v73[0] = 0;
    id v70 = 0;
    id v71 = 0;
    id v69 = 0;
    [(MAAutoAssetStatus *)self getAvailableForUseAttributesAssetFormat:v73 assetBuild:&v72 minOSVersion:&v71 maxOSVersion:&v70 prerequisiteBuilds:&v69];
    id v28 = v73[0];
    id v29 = (__CFString *)v72;
    uint64_t v30 = (__CFString *)v71;
    v31 = (__CFString *)v70;
    uint64_t v32 = (__CFString *)v69;
    v33 = v32;
    uint64_t v34 = @"Missing";
    if (v29) {
      uint64_t v34 = v29;
    }
    id v35 = @"N";
    if (v30) {
      v36 = v30;
    }
    else {
      v36 = @"N";
    }
    if (v31) {
      objc_super v37 = v31;
    }
    else {
      objc_super v37 = @"N";
    }
    if (v32) {
      id v35 = v32;
    }
    [v59 appendFormat:@"                     assetFormat: %@\n                      assetBuild: %@\n                    minOSVersion: %@\n                    maxOSVersion: %@\n         prerequisiteAssetBuilds: %@\n", v28, v34, v36, v37, v35];
  }
  return v59;
}

- (id)summary
{
  v58 = (void *)MEMORY[0x1E4F28E78];
  BOOL v3 = [(MAAutoAssetStatus *)self assetSelector];
  v68 = [v3 summary];
  BOOL v4 = [(MAAutoAssetStatus *)self notifications];
  v67 = [v4 summary];
  v5 = [(MAAutoAssetStatus *)self availableForUseAttributes];
  v6 = @"N";
  if (v5) {
    v7 = @"Y";
  }
  else {
    v7 = @"N";
  }
  v57 = v7;
  v8 = [(MAAutoAssetStatus *)self newerVersionAttributes];
  if (v8) {
    v9 = @"Y";
  }
  else {
    v9 = @"N";
  }
  v56 = v9;
  if ([(MAAutoAssetStatus *)self neverBeenLocked]) {
    v10 = @"Y";
  }
  else {
    v10 = @"N";
  }
  v54 = v10;
  if ([(MAAutoAssetStatus *)self downloadUserInitiated]) {
    v11 = @"Y";
  }
  else {
    v11 = @"N";
  }
  v53 = v11;
  uint64_t v12 = [(MAAutoAssetStatus *)self downloadProgress];
  if (v12)
  {
    id v43 = [(MAAutoAssetStatus *)self downloadProgress];
    v65 = [v43 summary];
  }
  else
  {
    v65 = @"N";
  }
  int64_t v51 = [(MAAutoAssetStatus *)self downloadedNetworkBytes];
  int64_t v50 = [(MAAutoAssetStatus *)self downloadedFilesystemBytes];
  if ([(MAAutoAssetStatus *)self downloadedAsPatch]) {
    uint64_t v13 = @"Y";
  }
  else {
    uint64_t v13 = @"N";
  }
  v49 = v13;
  uint64_t v14 = [(MAAutoAssetStatus *)self patchedFromBaseSelector];
  if (v14)
  {
    id v41 = [(MAAutoAssetStatus *)self patchedFromBaseSelector];
    v64 = [v41 summary];
  }
  else
  {
    v64 = @"N";
  }
  int64_t v48 = [(MAAutoAssetStatus *)self patchedFromBaseFilesystemBytes];
  if ([(MAAutoAssetStatus *)self patchingAttempted]) {
    v15 = @"Y";
  }
  else {
    v15 = @"N";
  }
  v46 = v15;
  if ([(MAAutoAssetStatus *)self stagedPriorToAvailable]) {
    int64_t v16 = @"Y";
  }
  else {
    int64_t v16 = @"N";
  }
  objc_super v45 = v16;
  uint64_t v17 = [(MAAutoAssetStatus *)self stagedFromOSVersion];
  if (v17)
  {
    v6 = [(MAAutoAssetStatus *)self stagedFromOSVersion];
  }
  uint64_t v18 = [(MAAutoAssetStatus *)self stagedFromBuildVersion];
  if (v18)
  {
    v63 = [(MAAutoAssetStatus *)self stagedFromBuildVersion];
  }
  else
  {
    v63 = @"N";
  }
  v66 = [(MAAutoAssetStatus *)self currentLockUsage];
  if (v66) {
    v62 = +[MAAutoAssetStatus newCurrentLockUsageSummary:self];
  }
  else {
    v62 = @"N";
  }
  v47 = [(MAAutoAssetStatus *)self availableForUseError];
  v55 = (void *)v17;
  if (v47)
  {
    id v40 = [(MAAutoAssetStatus *)self availableForUseError];
    v61 = [v40 checkedSummary];
  }
  else
  {
    v61 = @"N";
  }
  int64_t v19 = [(MAAutoAssetStatus *)self patchingAttemptError];
  v52 = (void *)v18;
  if (v19)
  {
    id v39 = [(MAAutoAssetStatus *)self patchingAttemptError];
    v60 = [v39 checkedSummary];
  }
  else
  {
    v60 = @"N";
  }
  BOOL v20 = [(MAAutoAssetStatus *)self newerVersionError];
  if (v20)
  {
    [(MAAutoAssetStatus *)self newerVersionError];
    v21 = id v42 = v14;
    [v21 checkedSummary];
    id v44 = v12;
    uint64_t v22 = v8;
    uint64_t v23 = v5;
    uint64_t v24 = v4;
    v26 = id v25 = v3;
    objc_msgSend(v58, "stringWithFormat:", @"[assetSelector:%@|notifications:%@|availableForUseAttributes:%@|newerVersionAttributes:%@|neverBeenLocked:%@|downloadUserInitiated:%@|downloadProgress:%@|downloadedNetworkBytes:%ld|downloadedFilesystemBytes:%ld|downloadedAsPatch:%@|patchedFromBaseSelector:%@|patchedFromBaseBytes:%ld|patchingAttempted:%@|stagedPriorToAvailable:%@|stagedFromOSVersion:%@|stagedFromBuildVersion:%@|currentLockUsage:%@|availableForUseError:%@|patchingAttemptError:%@|newerVersionError:%@", v68, v67, v57, v56, v54, v53, v65, v51, v50, v49, v64, v48, v46, v45, v6, v63,
      v62,
      v61,
      v60,
    v59 = v26);

    BOOL v3 = v25;
    BOOL v4 = v24;
    v5 = v23;
    v8 = v22;
    uint64_t v12 = v44;

    uint64_t v14 = v42;
  }
  else
  {
    objc_msgSend(v58, "stringWithFormat:", @"[assetSelector:%@|notifications:%@|availableForUseAttributes:%@|newerVersionAttributes:%@|neverBeenLocked:%@|downloadUserInitiated:%@|downloadProgress:%@|downloadedNetworkBytes:%ld|downloadedFilesystemBytes:%ld|downloadedAsPatch:%@|patchedFromBaseSelector:%@|patchedFromBaseBytes:%ld|patchingAttempted:%@|stagedPriorToAvailable:%@|stagedFromOSVersion:%@|stagedFromBuildVersion:%@|currentLockUsage:%@|availableForUseError:%@|patchingAttemptError:%@|newerVersionError:%@", v68, v67, v57, v56, v54, v53, v65, v51, v50, v49, v64, v48, v46, v45, v6, v63,
      v62,
      v61,
      v60,
    v59 = @"N");
  }

  if (v19)
  {
  }
  if (v47)
  {
  }
  if (v66) {

  }
  if (v52) {
  if (v55)
  }

  if (v14)
  {
  }
  if (v12)
  {
  }
  id v27 = [(MAAutoAssetStatus *)self availableForUseAttributes];

  if (v27)
  {
    id v72 = 0;
    v73[0] = 0;
    id v70 = 0;
    id v71 = 0;
    id v69 = 0;
    [(MAAutoAssetStatus *)self getAvailableForUseAttributesAssetFormat:v73 assetBuild:&v72 minOSVersion:&v71 maxOSVersion:&v70 prerequisiteBuilds:&v69];
    id v28 = v73[0];
    id v29 = (__CFString *)v72;
    uint64_t v30 = (__CFString *)v71;
    v31 = (__CFString *)v70;
    uint64_t v32 = (__CFString *)v69;
    v33 = v32;
    uint64_t v34 = @"Missing";
    if (v29) {
      uint64_t v34 = v29;
    }
    id v35 = @"N";
    if (v30) {
      v36 = v30;
    }
    else {
      v36 = @"N";
    }
    if (v31) {
      objc_super v37 = v31;
    }
    else {
      objc_super v37 = @"N";
    }
    if (v32) {
      id v35 = v32;
    }
    [v59 appendFormat:@"|assetFormat:%@|assetBuild:%@|minOSVersion:%@|maxOSVersion:%@|prerequisiteAssetBuilds:%@", v28, v34, v36, v37, v35];
  }
  [v59 appendString:@"]"];
  return v59;
}

- (void)getAvailableForUseAttributesAssetFormat:(id *)a3 assetBuild:(id *)a4 minOSVersion:(id *)a5 maxOSVersion:(id *)a6 prerequisiteBuilds:(id *)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = [(MAAutoAssetStatus *)self availableForUseAttributes];

  if (v13)
  {
    if (a3)
    {
      uint64_t v14 = [(MAAutoAssetStatus *)self availableForUseAttributes];
      *a3 = [v14 safeStringForKey:@"AssetFormat"];

      if (!*a3) {
        *a3 = @"StreamingZip";
      }
    }
    if (a4)
    {
      v15 = [(MAAutoAssetStatus *)self availableForUseAttributes];
      *a4 = [v15 safeStringForKey:@"Build"];
    }
    if (a5)
    {
      int64_t v16 = [(MAAutoAssetStatus *)self availableForUseAttributes];
      *a5 = [v16 safeStringForKey:@"_MinOSVersion"];
    }
    if (a6)
    {
      uint64_t v17 = [(MAAutoAssetStatus *)self availableForUseAttributes];
      *a6 = [v17 safeStringForKey:@"_MaxOSVersion"];
    }
    if (a7)
    {
      uint64_t v18 = [(MAAutoAssetStatus *)self availableForUseAttributes];
      int64_t v19 = [v18 safeObjectForKey:@"PrerequisiteAssetBuilds" ofClass:objc_opt_class()];

      if (v19)
      {
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v20 = v19;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          id v28 = v19;
          uint64_t v23 = 0;
          uint64_t v24 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v30 != v24) {
                objc_enumerationMutation(v20);
              }
              uint64_t v26 = *(void *)(*((void *)&v29 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if (v23)
                {
                  [v23 appendFormat:@",%@", v26];
                }
                else
                {
                  uint64_t v23 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%@", v26];
                }
              }
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
          }
          while (v22);

          if (v23) {
            id v27 = v23;
          }
          else {
            id v27 = 0;
          }
          int64_t v19 = v28;
        }
        else
        {

          id v27 = 0;
        }
        *a7 = v27;
      }
      else
      {
        *a7 = 0;
      }
    }
  }
}

- (id)newSummaryDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  BOOL v4 = [(MAAutoAssetStatus *)self assetSelector];
  v5 = (void *)[v4 newSummaryDictionary];
  [v3 setSafeObject:v5 forKey:@"assetSelector"];

  v6 = [(MAAutoAssetStatus *)self notifications];
  v7 = (void *)[v6 newSummaryDictionary];
  [v3 setSafeObject:v7 forKey:@"notifications"];

  v8 = [(MAAutoAssetStatus *)self availableForUseAttributes];
  if (v8) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  [v3 setSafeObject:v9 forKey:@"availableForUseError"];

  v10 = [(MAAutoAssetStatus *)self newerVersionAttributes];
  if (v10) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  [v3 setSafeObject:v11 forKey:@"newerVersionAttributes"];

  if ([(MAAutoAssetStatus *)self neverBeenLocked]) {
    uint64_t v12 = @"YES";
  }
  else {
    uint64_t v12 = @"NO";
  }
  [v3 setSafeObject:v12 forKey:@"neverBeenLocked"];
  if ([(MAAutoAssetStatus *)self downloadUserInitiated]) {
    uint64_t v13 = @"YES";
  }
  else {
    uint64_t v13 = @"NO";
  }
  [v3 setSafeObject:v13 forKey:@"downloadUserInitiated"];
  uint64_t v14 = [(MAAutoAssetStatus *)self downloadProgress];
  if (v14)
  {
    id v15 = [(MAAutoAssetStatus *)self downloadProgress];
    int64_t v16 = (void *)[v15 newSummaryDictionary];
    [v3 setSafeObject:v16 forKey:@"downloadProgress"];
  }
  else
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    [v3 setSafeObject:v15 forKey:@"downloadProgress"];
  }

  uint64_t v17 = objc_msgSend(NSNumber, "numberWithInteger:", -[MAAutoAssetStatus downloadedNetworkBytes](self, "downloadedNetworkBytes"));
  [v3 setSafeObject:v17 forKey:@"downloadedNetworkBytes"];

  uint64_t v18 = objc_msgSend(NSNumber, "numberWithInteger:", -[MAAutoAssetStatus downloadedFilesystemBytes](self, "downloadedFilesystemBytes"));
  [v3 setSafeObject:v18 forKey:@"downloadedFilesystemBytes"];

  if ([(MAAutoAssetStatus *)self downloadedAsPatch]) {
    int64_t v19 = @"YES";
  }
  else {
    int64_t v19 = @"NO";
  }
  [v3 setSafeObject:v19 forKey:@"downloadedAsPatch"];
  id v20 = [(MAAutoAssetStatus *)self patchedFromBaseSelector];
  if (v20)
  {
    id v21 = [(MAAutoAssetStatus *)self patchedFromBaseSelector];
    uint64_t v22 = (void *)[v21 newSummaryDictionary];
    [v3 setSafeObject:v22 forKey:@"patchedFromBaseSelector"];
  }
  else
  {
    id v21 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    [v3 setSafeObject:v21 forKey:@"patchedFromBaseSelector"];
  }

  uint64_t v23 = objc_msgSend(NSNumber, "numberWithInteger:", -[MAAutoAssetStatus patchedFromBaseFilesystemBytes](self, "patchedFromBaseFilesystemBytes"));
  [v3 setSafeObject:v23 forKey:@"patchedFromBaseFilesystemBytes"];

  if ([(MAAutoAssetStatus *)self patchingAttempted]) {
    uint64_t v24 = @"YES";
  }
  else {
    uint64_t v24 = @"NO";
  }
  [v3 setSafeObject:v24 forKey:@"patchingAttempted"];
  if ([(MAAutoAssetStatus *)self stagedPriorToAvailable]) {
    id v25 = @"YES";
  }
  else {
    id v25 = @"NO";
  }
  [v3 setSafeObject:v25 forKey:@"stagedPriorToAvailable"];
  uint64_t v26 = [(MAAutoAssetStatus *)self stagedFromOSVersion];
  if (v26)
  {
    id v27 = [(MAAutoAssetStatus *)self stagedFromOSVersion];
    [v3 setSafeObject:v27 forKey:@"stagedFromOSVersion"];
  }
  else
  {
    [v3 setSafeObject:@"NO" forKey:@"stagedFromOSVersion"];
  }

  id v28 = [(MAAutoAssetStatus *)self stagedFromBuildVersion];
  if (v28)
  {
    long long v29 = [(MAAutoAssetStatus *)self stagedFromBuildVersion];
    [v3 setSafeObject:v29 forKey:@"stagedFromBuildVersion"];
  }
  else
  {
    [v3 setSafeObject:@"NO" forKey:@"stagedFromBuildVersion"];
  }

  long long v30 = [(MAAutoAssetStatus *)self currentLockUsage];
  if (v30)
  {
    id v31 = [(MAAutoAssetStatus *)self currentLockUsage];
  }
  else
  {
    id v31 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  }
  long long v32 = v31;
  [v3 setSafeObject:v31 forKey:@"currentLockUsage"];

  v33 = [(MAAutoAssetStatus *)self availableForUseError];
  if (v33)
  {
    uint64_t v34 = [(MAAutoAssetStatus *)self availableForUseError];
    id v35 = [v34 checkedSummary];
    [v3 setSafeObject:v35 forKey:@"availableForUseError"];
  }
  else
  {
    [v3 setSafeObject:@"NO" forKey:@"availableForUseError"];
  }

  v36 = [(MAAutoAssetStatus *)self patchingAttemptError];
  if (v36)
  {
    objc_super v37 = [(MAAutoAssetStatus *)self patchingAttemptError];
    v38 = [v37 checkedSummary];
    [v3 setSafeObject:v38 forKey:@"patchingAttemptError"];
  }
  else
  {
    [v3 setSafeObject:@"NO" forKey:@"patchingAttemptError"];
  }

  id v39 = [(MAAutoAssetStatus *)self newerVersionError];
  if (v39)
  {
    id v40 = [(MAAutoAssetStatus *)self newerVersionError];
    id v41 = [v40 checkedSummary];
    [v3 setSafeObject:v41 forKey:@"newerVersionError"];
  }
  else
  {
    [v3 setSafeObject:@"NO" forKey:@"newerVersionError"];
  }

  id v42 = [(MAAutoAssetStatus *)self availableForUseAttributes];

  if (v42)
  {
    id v56 = 0;
    id v57 = 0;
    id v54 = 0;
    id v55 = 0;
    id v53 = 0;
    [(MAAutoAssetStatus *)self getAvailableForUseAttributesAssetFormat:&v57 assetBuild:&v56 minOSVersion:&v55 maxOSVersion:&v54 prerequisiteBuilds:&v53];
    id v43 = v57;
    id v44 = (__CFString *)v56;
    objc_super v45 = (__CFString *)v55;
    v46 = (__CFString *)v54;
    v47 = (__CFString *)v53;
    [v3 setObject:v43 forKey:@"assetFormat"];
    if (v44) {
      int64_t v48 = v44;
    }
    else {
      int64_t v48 = @"VALUE-SHOULD-BE-DEFINED-BUT-MISSING";
    }
    [v3 setObject:v48 forKey:@"assetBuild"];
    if (v45) {
      v49 = v45;
    }
    else {
      v49 = @"NO";
    }
    [v3 setObject:v49 forKey:@"minOSVersion"];
    if (v46) {
      int64_t v50 = v46;
    }
    else {
      int64_t v50 = @"NO";
    }
    [v3 setObject:v50 forKey:@"maxOSVersion"];
    if (v47) {
      int64_t v51 = v47;
    }
    else {
      int64_t v51 = @"NO";
    }
    [v3 setObject:v51 forKey:@"prerequisiteAssetBuilds"];
  }
  return v3;
}

+ (id)newCurrentLockUsageSummary:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = [v3 currentLockUsage];

  if (v4)
  {
    BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"{"];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id obj = [v3 currentLockUsage];
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
          v11 = [v3 currentLockUsage];
          uint64_t v12 = [v11 safeIntegerForKey:v10];

          if ((v8 & 1) == 0) {
            [v4 appendString:@","];
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v4 appendFormat:@"%@:%ld", v10, v12];
          }
          else {
            objc_msgSend(v4, "appendFormat:", @"?:%ld", v12, v14);
          }
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

- (MAAutoAssetSelector)assetSelector
{
  return self->_assetSelector;
}

- (void)setAssetSelector:(id)a3
{
}

- (MAAutoAssetNotifications)notifications
{
  return self->_notifications;
}

- (void)setNotifications:(id)a3
{
}

- (NSDictionary)availableForUseAttributes
{
  return self->_availableForUseAttributes;
}

- (void)setAvailableForUseAttributes:(id)a3
{
}

- (NSDictionary)newerVersionAttributes
{
  return self->_newerVersionAttributes;
}

- (void)setNewerVersionAttributes:(id)a3
{
}

- (BOOL)neverBeenLocked
{
  return self->_neverBeenLocked;
}

- (void)setNeverBeenLocked:(BOOL)a3
{
  self->_neverBeenLocked = a3;
}

- (BOOL)downloadUserInitiated
{
  return self->_downloadUserInitiated;
}

- (void)setDownloadUserInitiated:(BOOL)a3
{
  self->_downloadUserInitiated = a3;
}

- (MAAutoAssetProgress)downloadProgress
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

- (BOOL)downloadedAsPatch
{
  return self->_downloadedAsPatch;
}

- (void)setDownloadedAsPatch:(BOOL)a3
{
  self->_downloadedAsPatch = a3;
}

- (MAAutoAssetSelector)patchedFromBaseSelector
{
  return self->_patchedFromBaseSelector;
}

- (void)setPatchedFromBaseSelector:(id)a3
{
}

- (int64_t)patchedFromBaseFilesystemBytes
{
  return self->_patchedFromBaseFilesystemBytes;
}

- (void)setPatchedFromBaseFilesystemBytes:(int64_t)a3
{
  self->_patchedFromBaseFilesystemBytes = a3;
}

- (BOOL)patchingAttempted
{
  return self->_patchingAttempted;
}

- (void)setPatchingAttempted:(BOOL)a3
{
  self->_patchingAttempted = a3;
}

- (BOOL)stagedPriorToAvailable
{
  return self->_stagedPriorToAvailable;
}

- (void)setStagedPriorToAvailable:(BOOL)a3
{
  self->_stagedPriorToAvailable = a3;
}

- (NSString)stagedFromOSVersion
{
  return self->_stagedFromOSVersion;
}

- (void)setStagedFromOSVersion:(id)a3
{
}

- (NSString)stagedFromBuildVersion
{
  return self->_stagedFromBuildVersion;
}

- (void)setStagedFromBuildVersion:(id)a3
{
}

- (NSDictionary)currentLockUsage
{
  return self->_currentLockUsage;
}

- (void)setCurrentLockUsage:(id)a3
{
}

- (NSError)availableForUseError
{
  return self->_availableForUseError;
}

- (void)setAvailableForUseError:(id)a3
{
}

- (NSError)patchingAttemptError
{
  return self->_patchingAttemptError;
}

- (void)setPatchingAttemptError:(id)a3
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
  objc_storeStrong((id *)&self->_patchingAttemptError, 0);
  objc_storeStrong((id *)&self->_availableForUseError, 0);
  objc_storeStrong((id *)&self->_currentLockUsage, 0);
  objc_storeStrong((id *)&self->_stagedFromBuildVersion, 0);
  objc_storeStrong((id *)&self->_stagedFromOSVersion, 0);
  objc_storeStrong((id *)&self->_patchedFromBaseSelector, 0);
  objc_storeStrong((id *)&self->_downloadProgress, 0);
  objc_storeStrong((id *)&self->_newerVersionAttributes, 0);
  objc_storeStrong((id *)&self->_availableForUseAttributes, 0);
  objc_storeStrong((id *)&self->_notifications, 0);
  objc_storeStrong((id *)&self->_assetSelector, 0);
}

@end