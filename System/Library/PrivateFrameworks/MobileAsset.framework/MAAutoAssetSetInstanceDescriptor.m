@interface MAAutoAssetSetInstanceDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)newMaxColumnStrings;
+ (id)paddedBanner:(id)a3;
+ (id)paddedHeader:(id)a3;
+ (id)paddedString:(id)a3 paddingToLenghtOfString:(id)a4 paddingWith:(id)a5 paddingBefore:(BOOL)a6;
- (BOOL)downloadUserInitiated;
- (BOOL)isFullyDownloaded;
- (BOOL)neverBeenLocked;
- (BOOL)stagedPriorToAvailable;
- (MAAutoAssetSetInstanceDescriptor)initWithCoder:(id)a3;
- (NSArray)atomicInstanceEntries;
- (NSString)assetSetIdentifier;
- (NSString)clientDomainName;
- (id)description;
- (id)description:(BOOL)a3;
- (id)initForClientDomainName:(id)a3 forAssetSetIdentifier:(id)a4 withAtomicInstanceEntries:(id)a5 withFullyDownloaded:(BOOL)a6 withNeverBeenLocked:(BOOL)a7 withDownloadUserInitiated:(BOOL)a8 withDownloadedNetworkBytes:(int64_t)a9 withDownloadedFilesystemBytes:(int64_t)a10 withStagedPriorToAvailable:(BOOL)a11;
- (id)padded:(id)a3;
- (id)summary;
- (int64_t)downloadedFilesystemBytes;
- (int64_t)downloadedNetworkBytes;
- (void)buildMaxColumnStrings:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MAAutoAssetSetInstanceDescriptor

- (id)initForClientDomainName:(id)a3 forAssetSetIdentifier:(id)a4 withAtomicInstanceEntries:(id)a5 withFullyDownloaded:(BOOL)a6 withNeverBeenLocked:(BOOL)a7 withDownloadUserInitiated:(BOOL)a8 withDownloadedNetworkBytes:(int64_t)a9 withDownloadedFilesystemBytes:(int64_t)a10 withStagedPriorToAvailable:(BOOL)a11
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  v24.receiver = self;
  v24.super_class = (Class)MAAutoAssetSetInstanceDescriptor;
  v21 = [(MAAutoAssetSetInstanceDescriptor *)&v24 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_clientDomainName, a3);
    objc_storeStrong((id *)&v22->_assetSetIdentifier, a4);
    objc_storeStrong((id *)&v22->_atomicInstanceEntries, a5);
    v22->_isFullyDownloaded = a6;
    v22->_neverBeenLocked = a7;
    v22->_downloadUserInitiated = a8;
    v22->_downloadedNetworkBytes = a9;
    v22->_downloadedFilesystemBytes = a10;
    v22->_stagedPriorToAvailable = a11;
  }

  return v22;
}

- (MAAutoAssetSetInstanceDescriptor)initWithCoder:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MAAutoAssetSetInstanceDescriptor;
  v5 = [(MAAutoAssetSetInstanceDescriptor *)&v16 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientDomainName"];
    clientDomainName = v5->_clientDomainName;
    v5->_clientDomainName = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetSetIdentifier"];
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClasses:v8 forKey:@"atomicInstanceEntries"];
    atomicInstanceEntries = v5->_atomicInstanceEntries;
    v5->_atomicInstanceEntries = (NSArray *)v13;

    v5->_isFullyDownloaded = [v4 decodeBoolForKey:@"isFullyDownloaded"];
    v5->_neverBeenLocked = [v4 decodeBoolForKey:@"neverBeenLocked"];
    v5->_downloadUserInitiated = [v4 decodeBoolForKey:@"downloadUserInitiated"];
    v5->_downloadedNetworkBytes = [v4 decodeIntegerForKey:@"downloadedNetworkBytes"];
    v5->_downloadedFilesystemBytes = [v4 decodeIntegerForKey:@"downloadedFilesystemBytes"];
    v5->_stagedPriorToAvailable = [v4 decodeBoolForKey:@"stagedPriorToAvailable"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(MAAutoAssetSetInstanceDescriptor *)self clientDomainName];
  [v7 encodeObject:v4 forKey:@"clientDomainName"];

  v5 = [(MAAutoAssetSetInstanceDescriptor *)self assetSetIdentifier];
  [v7 encodeObject:v5 forKey:@"assetSetIdentifier"];

  v6 = [(MAAutoAssetSetInstanceDescriptor *)self atomicInstanceEntries];
  [v7 encodeObject:v6 forKey:@"atomicInstanceEntries"];

  objc_msgSend(v7, "encodeBool:forKey:", -[MAAutoAssetSetInstanceDescriptor isFullyDownloaded](self, "isFullyDownloaded"), @"isFullyDownloaded");
  objc_msgSend(v7, "encodeBool:forKey:", -[MAAutoAssetSetInstanceDescriptor neverBeenLocked](self, "neverBeenLocked"), @"neverBeenLocked");
  objc_msgSend(v7, "encodeBool:forKey:", -[MAAutoAssetSetInstanceDescriptor downloadUserInitiated](self, "downloadUserInitiated"), @"downloadUserInitiated");
  objc_msgSend(v7, "encodeInteger:forKey:", -[MAAutoAssetSetInstanceDescriptor downloadedNetworkBytes](self, "downloadedNetworkBytes"), @"downloadedNetworkBytes");
  objc_msgSend(v7, "encodeInteger:forKey:", -[MAAutoAssetSetInstanceDescriptor downloadedFilesystemBytes](self, "downloadedFilesystemBytes"), @"downloadedFilesystemBytes");
  objc_msgSend(v7, "encodeBool:forKey:", -[MAAutoAssetSetInstanceDescriptor stagedPriorToAvailable](self, "stagedPriorToAvailable"), @"stagedPriorToAvailable");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return [(MAAutoAssetSetInstanceDescriptor *)self description:0];
}

- (id)description:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(MAAutoAssetSetInstanceDescriptor *)self atomicInstanceEntries];
  v6 = v5;
  if (v3)
  {
    id v20 = [v5 description];
  }
  else
  {
    uint64_t v7 = [v5 count];

    if ((int)v7 >= 2) {
      v8 = @"entries";
    }
    else {
      v8 = @"entry";
    }
    id v20 = (void *)[[NSString alloc] initWithFormat:@"%d %@", v7, v8];
  }
  id v19 = NSString;
  uint64_t v9 = [(MAAutoAssetSetInstanceDescriptor *)self clientDomainName];
  v10 = [(MAAutoAssetSetInstanceDescriptor *)self assetSetIdentifier];
  if ([(MAAutoAssetSetInstanceDescriptor *)self isFullyDownloaded]) {
    uint64_t v11 = @"Y";
  }
  else {
    uint64_t v11 = @"N";
  }
  if ([(MAAutoAssetSetInstanceDescriptor *)self neverBeenLocked]) {
    v12 = @"Y";
  }
  else {
    v12 = @"N";
  }
  if ([(MAAutoAssetSetInstanceDescriptor *)self downloadUserInitiated]) {
    uint64_t v13 = @"Y";
  }
  else {
    uint64_t v13 = @"N";
  }
  int64_t v14 = [(MAAutoAssetSetInstanceDescriptor *)self downloadedNetworkBytes];
  int64_t v15 = [(MAAutoAssetSetInstanceDescriptor *)self downloadedFilesystemBytes];
  if ([(MAAutoAssetSetInstanceDescriptor *)self stagedPriorToAvailable]) {
    objc_super v16 = @"Y";
  }
  else {
    objc_super v16 = @"N";
  }
  v17 = [v19 stringWithFormat:@">>>\n                clientDomainName: %@\n              assetSetIdentifier: %@\n           atomicInstanceEntries: %@\n                 fullyDownloaded: %@\n                 neverBeenLocked: %@\n                   userInitiated: %@\n          downloadedNetworkBytes: %ld\n       downloadedFilesystemBytes: %ld\n          stagedPriorToAvailable: %@\n<<<]", v9, v10, v20, v11, v12, v13, v14, v15, v16];

  return v17;
}

- (id)summary
{
  int64_t v15 = NSString;
  int64_t v14 = [(MAAutoAssetSetInstanceDescriptor *)self clientDomainName];
  BOOL v3 = [(MAAutoAssetSetInstanceDescriptor *)self assetSetIdentifier];
  id v4 = [(MAAutoAssetSetInstanceDescriptor *)self atomicInstanceEntries];
  uint64_t v13 = [v4 count];
  if ([(MAAutoAssetSetInstanceDescriptor *)self isFullyDownloaded]) {
    v5 = @"Y";
  }
  else {
    v5 = @"N";
  }
  if ([(MAAutoAssetSetInstanceDescriptor *)self neverBeenLocked]) {
    v6 = @"Y";
  }
  else {
    v6 = @"N";
  }
  if ([(MAAutoAssetSetInstanceDescriptor *)self downloadUserInitiated]) {
    uint64_t v7 = @"Y";
  }
  else {
    uint64_t v7 = @"N";
  }
  int64_t v8 = [(MAAutoAssetSetInstanceDescriptor *)self downloadedNetworkBytes];
  int64_t v9 = [(MAAutoAssetSetInstanceDescriptor *)self downloadedFilesystemBytes];
  if ([(MAAutoAssetSetInstanceDescriptor *)self stagedPriorToAvailable]) {
    v10 = @"Y";
  }
  else {
    v10 = @"N";
  }
  uint64_t v11 = [v15 stringWithFormat:@"[clientDomainName:%@, assetSetIdentifier:%@, numAtomicInstanceEntries:%ld, fullyDownloaded:%@, neverBeenLocked:%@, userInitiated:%@, networkBytes:%ld, fsBytes:%ld, stagedPrior:%@]", v14, v3, v13, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (void)buildMaxColumnStrings:(id)a3
{
  id v45 = a3;
  id v4 = [(MAAutoAssetSetInstanceDescriptor *)self clientDomainName];
  v5 = [(MAAutoAssetSetInstanceDescriptor *)self assetSetIdentifier];
  v6 = [(MAAutoAssetSetInstanceDescriptor *)self atomicInstanceEntries];
  uint64_t v7 = [v6 description];

  if ([(MAAutoAssetSetInstanceDescriptor *)self isFullyDownloaded]) {
    int64_t v8 = @"YES";
  }
  else {
    int64_t v8 = @"NO";
  }
  int64_t v9 = v8;
  if ([(MAAutoAssetSetInstanceDescriptor *)self neverBeenLocked]) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  v43 = v10;
  if ([(MAAutoAssetSetInstanceDescriptor *)self downloadUserInitiated]) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  v44 = v11;
  v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetInstanceDescriptor downloadedNetworkBytes](self, "downloadedNetworkBytes"));
  uint64_t v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetInstanceDescriptor downloadedFilesystemBytes](self, "downloadedFilesystemBytes"));
  if ([(MAAutoAssetSetInstanceDescriptor *)self stagedPriorToAvailable]) {
    int64_t v14 = @"YES";
  }
  else {
    int64_t v14 = @"NO";
  }
  int64_t v15 = v14;
  unint64_t v16 = [v4 length];
  v17 = [v45 safeStringForKey:@"clientDomainName"];
  unint64_t v18 = [v17 length];

  if (v16 > v18) {
    [v45 setSafeObject:v4 forKey:@"clientDomainName"];
  }
  unint64_t v19 = [v5 length];
  id v20 = [v45 safeStringForKey:@"assetSetIdentifier"];
  unint64_t v21 = [v20 length];

  if (v19 > v21) {
    [v45 setSafeObject:v5 forKey:@"assetSetIdentifier"];
  }
  unint64_t v22 = [v7 length];
  v23 = [v45 safeStringForKey:@"atomicInstanceEntries"];
  unint64_t v24 = [v23 length];

  if (v22 > v24) {
    [v45 setSafeObject:v7 forKey:@"atomicInstanceEntries"];
  }
  unint64_t v25 = [(__CFString *)v9 length];
  v26 = [v45 safeStringForKey:@"isFullyDownloaded"];
  unint64_t v27 = [v26 length];

  if (v25 > v27) {
    [v45 setSafeObject:v9 forKey:@"isFullyDownloaded"];
  }
  unint64_t v28 = [(__CFString *)v43 length];
  v29 = [v45 safeStringForKey:@"neverBeenLocked"];
  unint64_t v30 = [v29 length];

  if (v28 > v30) {
    [v45 setSafeObject:v43 forKey:@"neverBeenLocked"];
  }
  unint64_t v31 = [(__CFString *)v44 length];
  v32 = [v45 safeStringForKey:@"downloadUserInitiated"];
  unint64_t v33 = [v32 length];

  if (v31 > v33) {
    [v45 setSafeObject:v44 forKey:@"downloadUserInitiated"];
  }
  unint64_t v34 = [v12 length];
  v35 = [v45 safeStringForKey:@"downloadedNetworkBytes"];
  unint64_t v36 = [v35 length];

  if (v34 > v36) {
    [v45 setSafeObject:v12 forKey:@"downloadedNetworkBytes"];
  }
  unint64_t v37 = [v13 length];
  v38 = [v45 safeStringForKey:@"downloadedFilesystemBytes"];
  unint64_t v39 = [v38 length];

  if (v37 > v39) {
    [v45 setSafeObject:v13 forKey:@"downloadedFilesystemBytes"];
  }
  unint64_t v40 = [(__CFString *)v15 length];
  v41 = [v45 safeStringForKey:@"stagedPriorToAvailable"];
  unint64_t v42 = [v41 length];

  if (v40 > v42) {
    [v45 setSafeObject:v15 forKey:@"stagedPriorToAvailable"];
  }
}

- (id)padded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MAAutoAssetSetInstanceDescriptor *)self clientDomainName];
  v35 = (void *)v5;
  uint64_t v6 = [(MAAutoAssetSetInstanceDescriptor *)self assetSetIdentifier];
  unint64_t v34 = (void *)v6;
  uint64_t v7 = [(MAAutoAssetSetInstanceDescriptor *)self atomicInstanceEntries];
  unint64_t v42 = [v7 description];

  if ([(MAAutoAssetSetInstanceDescriptor *)self isFullyDownloaded]) {
    int64_t v8 = @"YES";
  }
  else {
    int64_t v8 = @"NO";
  }
  v41 = v8;
  if ([(MAAutoAssetSetInstanceDescriptor *)self neverBeenLocked]) {
    int64_t v9 = @"YES";
  }
  else {
    int64_t v9 = @"NO";
  }
  unint64_t v40 = v9;
  if ([(MAAutoAssetSetInstanceDescriptor *)self downloadUserInitiated]) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  uint64_t v11 = (objc_class *)NSString;
  unint64_t v39 = v10;
  v38 = objc_msgSend([v11 alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetInstanceDescriptor downloadedNetworkBytes](self, "downloadedNetworkBytes"));
  unint64_t v37 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetInstanceDescriptor downloadedFilesystemBytes](self, "downloadedFilesystemBytes"));
  if ([(MAAutoAssetSetInstanceDescriptor *)self stagedPriorToAvailable]) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  id v29 = (id)NSString;
  unint64_t v27 = v12;
  unint64_t v33 = [v4 safeStringForKey:@"clientDomainName"];
  unint64_t v36 = +[MAAutoAssetSetInstanceDescriptor paddedString:v5 paddingToLenghtOfString:v33 paddingWith:@" " paddingBefore:0];
  v32 = [v4 safeStringForKey:@"assetSetIdentifier"];
  v26 = +[MAAutoAssetSetInstanceDescriptor paddedString:v6 paddingToLenghtOfString:v32 paddingWith:@" " paddingBefore:0];
  unint64_t v31 = [v4 safeStringForKey:@"atomicInstanceEntries"];
  unint64_t v24 = +[MAAutoAssetSetInstanceDescriptor paddedString:v42 paddingToLenghtOfString:v31 paddingWith:@" " paddingBefore:0];
  unint64_t v28 = [v4 safeStringForKey:@"isFullyDownloaded"];
  unint64_t v22 = +[MAAutoAssetSetInstanceDescriptor paddedString:v41 paddingToLenghtOfString:v28 paddingWith:@" " paddingBefore:0];
  unint64_t v25 = [v4 safeStringForKey:@"neverBeenLocked"];
  uint64_t v13 = +[MAAutoAssetSetInstanceDescriptor paddedString:v40 paddingToLenghtOfString:v25 paddingWith:@" " paddingBefore:0];
  v23 = [v4 safeStringForKey:@"downloadUserInitiated"];
  int64_t v14 = +[MAAutoAssetSetInstanceDescriptor paddedString:v39 paddingToLenghtOfString:v23 paddingWith:@" " paddingBefore:0];
  unint64_t v21 = [v4 safeStringForKey:@"downloadedNetworkBytes"];
  int64_t v15 = +[MAAutoAssetSetInstanceDescriptor paddedString:v38 paddingToLenghtOfString:v21 paddingWith:@" " paddingBefore:0];
  unint64_t v16 = [v4 safeStringForKey:@"downloadedFilesystemBytes"];
  v17 = +[MAAutoAssetSetInstanceDescriptor paddedString:v37 paddingToLenghtOfString:v16 paddingWith:@" " paddingBefore:0];
  unint64_t v18 = [v4 safeStringForKey:@"stagedPriorToAvailable"];

  unint64_t v19 = +[MAAutoAssetSetInstanceDescriptor paddedString:v27 paddingToLenghtOfString:v18 paddingWith:@" " paddingBefore:0];

  id v30 = [v29 stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@|%@", v36, v26, v24, v22, v13, v14, v15, v17, v19];

  return v30;
}

+ (id)newMaxColumnStrings
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v2 setSafeObject:@"clientDomainName" forKey:@"clientDomainName"];
  [v2 setSafeObject:@"assetSetIdentifier" forKey:@"assetSetIdentifier"];
  [v2 setSafeObject:@"atomicInstanceEntries" forKey:@"atomicInstanceEntries"];
  [v2 setSafeObject:@"isFullyDownloaded" forKey:@"isFullyDownloaded"];
  [v2 setSafeObject:@"neverBeenLocked" forKey:@"neverBeenLocked"];
  [v2 setSafeObject:@"downloadUserInitiated" forKey:@"downloadUserInitiated"];
  [v2 setSafeObject:@"downloadedNetworkBytes" forKey:@"downloadedNetworkBytes"];
  [v2 setSafeObject:@"downloadedFilesystemBytes" forKey:@"downloadedFilesystemBytes"];
  [v2 setSafeObject:@"stagedPriorToAvailable" forKey:@"stagedPriorToAvailable"];
  return v2;
}

+ (id)paddedString:(id)a3 paddingToLenghtOfString:(id)a4 paddingWith:(id)a5 paddingBefore:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  unint64_t v13 = [v12 length];
  int64_t v14 = v12;
  if (v13 < [v10 length])
  {
    uint64_t v15 = [v10 length];
    uint64_t v16 = v15 - [v12 length];
    v17 = [NSString string];
    unint64_t v18 = [v17 stringByPaddingToLength:v16 withString:v11 startingAtIndex:0];

    id v19 = [NSString alloc];
    if (v6) {
      uint64_t v20 = [v19 initWithFormat:@"%@%@", v18, v12];
    }
    else {
      uint64_t v20 = [v19 initWithFormat:@"%@%@", v12, v18];
    }
    int64_t v14 = (void *)v20;
  }
  return v14;
}

+ (id)paddedHeader:(id)a3
{
  id v19 = NSString;
  id v3 = a3;
  v23 = [v3 safeStringForKey:@"clientDomainName"];
  unint64_t v24 = +[MAAutoAssetSetInstanceDescriptor paddedString:@"clientDomainName" paddingToLenghtOfString:v23 paddingWith:@" " paddingBefore:0];
  unint64_t v22 = [v3 safeStringForKey:@"assetSetIdentifier"];
  v17 = +[MAAutoAssetSetInstanceDescriptor paddedString:@"assetSetIdentifier" paddingToLenghtOfString:v22 paddingWith:@" " paddingBefore:0];
  unint64_t v21 = [v3 safeStringForKey:@"atomicInstanceEntries"];
  uint64_t v15 = +[MAAutoAssetSetInstanceDescriptor paddedString:@"atomicInstanceEntries" paddingToLenghtOfString:v21 paddingWith:@" " paddingBefore:0];
  unint64_t v18 = [v3 safeStringForKey:@"isFullyDownloaded"];
  unint64_t v13 = +[MAAutoAssetSetInstanceDescriptor paddedString:@"isFullyDownloaded" paddingToLenghtOfString:v18 paddingWith:@" " paddingBefore:0];
  uint64_t v16 = [v3 safeStringForKey:@"neverBeenLocked"];
  id v11 = +[MAAutoAssetSetInstanceDescriptor paddedString:@"neverBeenLocked" paddingToLenghtOfString:v16 paddingWith:@" " paddingBefore:0];
  int64_t v14 = [v3 safeStringForKey:@"downloadUserInitiated"];
  id v4 = +[MAAutoAssetSetInstanceDescriptor paddedString:@"downloadUserInitiated" paddingToLenghtOfString:v14 paddingWith:@" " paddingBefore:0];
  id v12 = [v3 safeStringForKey:@"downloadedNetworkBytes"];
  uint64_t v5 = +[MAAutoAssetSetInstanceDescriptor paddedString:@"downloadedNetworkBytes" paddingToLenghtOfString:v12 paddingWith:@" " paddingBefore:0];
  BOOL v6 = [v3 safeStringForKey:@"downloadedFilesystemBytes"];
  uint64_t v7 = +[MAAutoAssetSetInstanceDescriptor paddedString:@"downloadedFilesystemBytes" paddingToLenghtOfString:v6 paddingWith:@" " paddingBefore:0];
  int64_t v8 = [v3 safeStringForKey:@"stagedPriorToAvailable"];

  id v9 = +[MAAutoAssetSetInstanceDescriptor paddedString:@"stagedPriorToAvailable" paddingToLenghtOfString:v8 paddingWith:@" " paddingBefore:0];
  uint64_t v20 = [v19 stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@|%@", v24, v17, v15, v13, v11, v4, v5, v7, v9];

  return v20;
}

+ (id)paddedBanner:(id)a3
{
  id v19 = NSString;
  id v3 = a3;
  v23 = [v3 safeStringForKey:@"clientDomainName"];
  unint64_t v24 = +[MAAutoAssetSetInstanceDescriptor paddedString:&stru_1F0A75970 paddingToLenghtOfString:v23 paddingWith:@"=" paddingBefore:0];
  unint64_t v22 = [v3 safeStringForKey:@"assetSetIdentifier"];
  v17 = +[MAAutoAssetSetInstanceDescriptor paddedString:&stru_1F0A75970 paddingToLenghtOfString:v22 paddingWith:@"=" paddingBefore:0];
  unint64_t v21 = [v3 safeStringForKey:@"atomicInstanceEntries"];
  uint64_t v15 = +[MAAutoAssetSetInstanceDescriptor paddedString:&stru_1F0A75970 paddingToLenghtOfString:v21 paddingWith:@"=" paddingBefore:0];
  unint64_t v18 = [v3 safeStringForKey:@"isFullyDownloaded"];
  unint64_t v13 = +[MAAutoAssetSetInstanceDescriptor paddedString:&stru_1F0A75970 paddingToLenghtOfString:v18 paddingWith:@"=" paddingBefore:0];
  uint64_t v16 = [v3 safeStringForKey:@"neverBeenLocked"];
  id v4 = +[MAAutoAssetSetInstanceDescriptor paddedString:&stru_1F0A75970 paddingToLenghtOfString:v16 paddingWith:@"=" paddingBefore:0];
  int64_t v14 = [v3 safeStringForKey:@"downloadUserInitiated"];
  uint64_t v5 = +[MAAutoAssetSetInstanceDescriptor paddedString:&stru_1F0A75970 paddingToLenghtOfString:v14 paddingWith:@"=" paddingBefore:0];
  id v12 = [v3 safeStringForKey:@"downloadedNetworkBytes"];
  BOOL v6 = +[MAAutoAssetSetInstanceDescriptor paddedString:&stru_1F0A75970 paddingToLenghtOfString:v12 paddingWith:@"=" paddingBefore:0];
  uint64_t v7 = [v3 safeStringForKey:@"downloadedFilesystemBytes"];
  int64_t v8 = +[MAAutoAssetSetInstanceDescriptor paddedString:&stru_1F0A75970 paddingToLenghtOfString:v7 paddingWith:@"=" paddingBefore:0];
  id v9 = [v3 safeStringForKey:@"stagedPriorToAvailable"];

  id v10 = +[MAAutoAssetSetInstanceDescriptor paddedString:&stru_1F0A75970 paddingToLenghtOfString:v9 paddingWith:@"=" paddingBefore:0];
  uint64_t v20 = [v19 stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@|%@", v24, v17, v15, v13, v4, v5, v6, v8, v10];

  return v20;
}

- (NSString)clientDomainName
{
  return self->_clientDomainName;
}

- (NSString)assetSetIdentifier
{
  return self->_assetSetIdentifier;
}

- (NSArray)atomicInstanceEntries
{
  return self->_atomicInstanceEntries;
}

- (BOOL)isFullyDownloaded
{
  return self->_isFullyDownloaded;
}

- (BOOL)neverBeenLocked
{
  return self->_neverBeenLocked;
}

- (BOOL)downloadUserInitiated
{
  return self->_downloadUserInitiated;
}

- (int64_t)downloadedNetworkBytes
{
  return self->_downloadedNetworkBytes;
}

- (int64_t)downloadedFilesystemBytes
{
  return self->_downloadedFilesystemBytes;
}

- (BOOL)stagedPriorToAvailable
{
  return self->_stagedPriorToAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_atomicInstanceEntries, 0);
  objc_storeStrong((id *)&self->_assetSetIdentifier, 0);
  objc_storeStrong((id *)&self->_clientDomainName, 0);
}

@end