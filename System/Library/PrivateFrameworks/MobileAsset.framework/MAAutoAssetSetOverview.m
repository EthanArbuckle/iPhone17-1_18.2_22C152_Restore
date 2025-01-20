@interface MAAutoAssetSetOverview
+ (BOOL)supportsSecureCoding;
+ (id)overviewNewMaxColumnStrings;
+ (id)overviewPaddedBanner:(id)a3;
+ (id)overviewPaddedHeader:(id)a3;
+ (id)overviewPaddedString:(id)a3 paddingToLenghtOfString:(id)a4 paddingWith:(id)a5 paddingBefore:(BOOL)a6;
- (MAAutoAssetSetOverview)initWithCoder:(id)a3;
- (MAAutoAssetSetOverview)initWithDomainName:(id)a3 forAssetSetIdentifier:(id)a4 withConfiguredAssetEntries:(id)a5 withLatestDownloadedAtomicInstance:(id)a6 withDownloadedAtomicInstances:(id)a7 withDiscoveredAtomicInstance:(id)a8 withActiveClientCount:(int64_t)a9 withActiveMonitorCount:(int64_t)a10 withMaximumClientCount:(int64_t)a11 withTotalClientCount:(int64_t)a12;
- (NSArray)configuredAssetEntries;
- (NSArray)downloadedAtomicInstances;
- (NSString)assetSetIdentifier;
- (NSString)clientDomainName;
- (NSString)discoveredAtomicInstance;
- (NSString)latestDownloadedAtomicInstance;
- (id)_entry_string_to_use:(int64_t)a3;
- (id)description;
- (id)description:(BOOL)a3;
- (id)overviewPadded:(id)a3;
- (id)summary;
- (int64_t)activeClientCount;
- (int64_t)activeMonitorCount;
- (int64_t)maximumClientCount;
- (int64_t)totalClientCount;
- (void)encodeWithCoder:(id)a3;
- (void)overviewBuildMaxColumnStrings:(id)a3;
- (void)setActiveClientCount:(int64_t)a3;
- (void)setActiveMonitorCount:(int64_t)a3;
- (void)setAssetSetIdentifier:(id)a3;
- (void)setClientDomainName:(id)a3;
- (void)setConfiguredAssetEntries:(id)a3;
- (void)setDownloadedAtomicInstances:(id)a3;
- (void)setLatestDownloadedAtomicInstance:(id)a3;
- (void)setMaximumClientCount:(int64_t)a3;
- (void)setTotalClientCount:(int64_t)a3;
@end

@implementation MAAutoAssetSetOverview

- (MAAutoAssetSetOverview)initWithDomainName:(id)a3 forAssetSetIdentifier:(id)a4 withConfiguredAssetEntries:(id)a5 withLatestDownloadedAtomicInstance:(id)a6 withDownloadedAtomicInstances:(id)a7 withDiscoveredAtomicInstance:(id)a8 withActiveClientCount:(int64_t)a9 withActiveMonitorCount:(int64_t)a10 withMaximumClientCount:(int64_t)a11 withTotalClientCount:(int64_t)a12
{
  id v19 = a3;
  id v20 = a4;
  id v27 = a5;
  id v26 = a6;
  id v25 = a7;
  id v21 = a8;
  v28.receiver = self;
  v28.super_class = (Class)MAAutoAssetSetOverview;
  v22 = [(MAAutoAssetSetOverview *)&v28 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_clientDomainName, a3);
    objc_storeStrong((id *)&v23->_assetSetIdentifier, a4);
    objc_storeStrong((id *)&v23->_configuredAssetEntries, a5);
    objc_storeStrong((id *)&v23->_latestDownloadedAtomicInstance, a6);
    objc_storeStrong((id *)&v23->_downloadedAtomicInstances, a7);
    objc_storeStrong((id *)&v23->_discoveredAtomicInstance, a8);
    v23->_activeClientCount = a9;
    v23->_activeMonitorCount = a10;
    v23->_maximumClientCount = a11;
    v23->_totalClientCount = a12;
  }

  return v23;
}

- (MAAutoAssetSetOverview)initWithCoder:(id)a3
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MAAutoAssetSetOverview;
  v5 = [(MAAutoAssetSetOverview *)&v25 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientDomainName"];
    clientDomainName = v5->_clientDomainName;
    v5->_clientDomainName = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetSetIdentifier"];
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v11;

    id v13 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    v26[2] = objc_opt_class();
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];
    v15 = (void *)[v13 initWithArray:v14];
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"configuredAssetEntries"];
    configuredAssetEntries = v5->_configuredAssetEntries;
    v5->_configuredAssetEntries = (NSArray *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"latestDownloadedAtomicInstance"];
    latestDownloadedAtomicInstance = v5->_latestDownloadedAtomicInstance;
    v5->_latestDownloadedAtomicInstance = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClasses:v8 forKey:@"downloadedAtomicInstances"];
    downloadedAtomicInstances = v5->_downloadedAtomicInstances;
    v5->_downloadedAtomicInstances = (NSArray *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"discoveredAtomicInstance"];
    discoveredAtomicInstance = v5->_discoveredAtomicInstance;
    v5->_discoveredAtomicInstance = (NSString *)v22;

    v5->_activeClientCount = [v4 decodeIntegerForKey:@"activeClientCount"];
    v5->_activeMonitorCount = [v4 decodeIntegerForKey:@"activeMonitorCount"];
    v5->_maximumClientCount = [v4 decodeIntegerForKey:@"maximumClientCount"];
    v5->_totalClientCount = [v4 decodeIntegerForKey:@"totalClientCount"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  id v4 = [(MAAutoAssetSetOverview *)self clientDomainName];
  [v10 encodeObject:v4 forKey:@"clientDomainName"];

  v5 = [(MAAutoAssetSetOverview *)self assetSetIdentifier];
  [v10 encodeObject:v5 forKey:@"assetSetIdentifier"];

  v6 = [(MAAutoAssetSetOverview *)self configuredAssetEntries];
  [v10 encodeObject:v6 forKey:@"configuredAssetEntries"];

  v7 = [(MAAutoAssetSetOverview *)self latestDownloadedAtomicInstance];
  [v10 encodeObject:v7 forKey:@"latestDownloadedAtomicInstance"];

  v8 = [(MAAutoAssetSetOverview *)self downloadedAtomicInstances];
  [v10 encodeObject:v8 forKey:@"downloadedAtomicInstances"];

  uint64_t v9 = [(MAAutoAssetSetOverview *)self discoveredAtomicInstance];
  [v10 encodeObject:v9 forKey:@"discoveredAtomicInstance"];

  objc_msgSend(v10, "encodeInteger:forKey:", -[MAAutoAssetSetOverview activeClientCount](self, "activeClientCount"), @"activeClientCount");
  objc_msgSend(v10, "encodeInteger:forKey:", -[MAAutoAssetSetOverview activeMonitorCount](self, "activeMonitorCount"), @"activeMonitorCount");
  objc_msgSend(v10, "encodeInteger:forKey:", -[MAAutoAssetSetOverview maximumClientCount](self, "maximumClientCount"), @"maximumClientCount");
  objc_msgSend(v10, "encodeInteger:forKey:", -[MAAutoAssetSetOverview totalClientCount](self, "totalClientCount"), @"totalClientCount");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return [(MAAutoAssetSetOverview *)self description:0];
}

- (id)description:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(MAAutoAssetSetOverview *)self configuredAssetEntries];
  v6 = v5;
  if (v3)
  {
    v7 = [v5 description];

    id v8 = [NSString alloc];
    uint64_t v9 = [(MAAutoAssetSetOverview *)self downloadedAtomicInstances];
    if (v9)
    {
      id v10 = [(MAAutoAssetSetOverview *)self downloadedAtomicInstances];
      uint64_t v11 = (void *)[v8 initWithFormat:@"%@", v10];

      goto LABEL_10;
    }
    uint64_t v18 = [v8 initWithFormat:@"%@", @"NONE", v28];
  }
  else
  {
    uint64_t v12 = [v5 count];

    id v13 = [NSString alloc];
    v14 = [(MAAutoAssetSetOverview *)self _entry_string_to_use:(int)v12];
    v7 = (void *)[v13 initWithFormat:@"%d %@", v12, v14];

    v15 = [(MAAutoAssetSetOverview *)self downloadedAtomicInstances];
    if (v15)
    {
      uint64_t v16 = [(MAAutoAssetSetOverview *)self downloadedAtomicInstances];
      uint64_t v17 = [v16 count];
    }
    else
    {
      uint64_t v17 = 0;
    }

    id v19 = [NSString alloc];
    uint64_t v9 = [(MAAutoAssetSetOverview *)self _entry_string_to_use:(int)v17];
    uint64_t v18 = [v19 initWithFormat:@"%d %@", v17, v9];
  }
  uint64_t v11 = (void *)v18;
LABEL_10:

  uint64_t v20 = NSString;
  id v21 = [(MAAutoAssetSetOverview *)self clientDomainName];
  uint64_t v22 = [(MAAutoAssetSetOverview *)self assetSetIdentifier];
  v23 = [(MAAutoAssetSetOverview *)self latestDownloadedAtomicInstance];
  if (v23)
  {
    v29 = [(MAAutoAssetSetOverview *)self latestDownloadedAtomicInstance];
  }
  else
  {
    v29 = @"NONE";
  }
  v24 = [(MAAutoAssetSetOverview *)self discoveredAtomicInstance];
  if (v24)
  {
    objc_super v25 = [(MAAutoAssetSetOverview *)self discoveredAtomicInstance];
  }
  else
  {
    objc_super v25 = @"NONE";
  }
  id v26 = [v20 stringWithFormat:@">>>\n                clientDomainName: %@\n              assetSetIdentifier: %@\n          configuredAssetEntries: %@\n  latestDownloadedAtomicInstance: %@\n        discoveredAtomicInstance: %@\n       downloadedAtomicInstances: %@\n               activeClientCount: %ld\n              activeMonitorCount: %ld\n              maximumClientCount: %ld\n                totalClientCount: %ld\n<<<]", v21, v22, v7, v29, v25, v11, -[MAAutoAssetSetOverview activeClientCount](self, "activeClientCount"), -[MAAutoAssetSetOverview activeMonitorCount](self, "activeMonitorCount"), -[MAAutoAssetSetOverview maximumClientCount](self, "maximumClientCount"), -[MAAutoAssetSetOverview totalClientCount](self, "totalClientCount")];
  if (v24) {

  }
  if (v23) {
  return v26;
  }
}

- (id)_entry_string_to_use:(int64_t)a3
{
  if (a3 >= 2) {
    return @"entries";
  }
  else {
    return @"entry";
  }
}

- (id)summary
{
  v15 = NSString;
  BOOL v3 = [(MAAutoAssetSetOverview *)self clientDomainName];
  uint64_t v4 = [(MAAutoAssetSetOverview *)self assetSetIdentifier];
  uint64_t v17 = [(MAAutoAssetSetOverview *)self configuredAssetEntries];
  uint64_t v14 = [v17 count];
  v5 = [(MAAutoAssetSetOverview *)self latestDownloadedAtomicInstance];
  if (v5)
  {
    uint64_t v16 = [(MAAutoAssetSetOverview *)self latestDownloadedAtomicInstance];
  }
  else
  {
    uint64_t v16 = @"NONE";
  }
  v6 = [(MAAutoAssetSetOverview *)self downloadedAtomicInstances];
  if (v6)
  {
    uint64_t v12 = [(MAAutoAssetSetOverview *)self downloadedAtomicInstances];
    uint64_t v13 = [v12 count];
  }
  else
  {
    uint64_t v13 = 0;
  }
  v7 = [(MAAutoAssetSetOverview *)self latestDownloadedAtomicInstance];
  if (v7)
  {
    id v8 = [(MAAutoAssetSetOverview *)self discoveredAtomicInstance];
  }
  else
  {
    id v8 = @"NONE";
  }
  uint64_t v9 = (void *)v4;
  id v10 = [v15 stringWithFormat:@"clientDomain:%@|assetIdentifier:%@|numConfiguredEntries:%ld|latestDownloadedEntry:%@|numDownloadedEntries:%ld|discoveredEntry:%@|clients:%lld|monitors:%lld|maxClients:%lld|totalClients:%lld", v3, v4, v14, v16, v13, v8, -[MAAutoAssetSetOverview activeClientCount](self, "activeClientCount"), -[MAAutoAssetSetOverview activeMonitorCount](self, "activeMonitorCount"), -[MAAutoAssetSetOverview activeMonitorCount](self, "activeMonitorCount"), -[MAAutoAssetSetOverview totalClientCount](self, "totalClientCount")];
  if (v7) {

  }
  if (v6) {
  if (v5)
  }

  return v10;
}

- (void)overviewBuildMaxColumnStrings:(id)a3
{
  id v52 = a3;
  uint64_t v4 = [(MAAutoAssetSetOverview *)self clientDomainName];
  v51 = [(MAAutoAssetSetOverview *)self assetSetIdentifier];
  id v5 = [NSString alloc];
  v6 = [(MAAutoAssetSetOverview *)self configuredAssetEntries];
  v50 = objc_msgSend(v5, "initWithFormat:", @"%lld", objc_msgSend(v6, "count"));

  v7 = [(MAAutoAssetSetOverview *)self latestDownloadedAtomicInstance];
  if (v7)
  {
    id v8 = [(MAAutoAssetSetOverview *)self latestDownloadedAtomicInstance];
  }
  else
  {
    id v8 = @"NONE";
  }

  uint64_t v9 = [(MAAutoAssetSetOverview *)self downloadedAtomicInstances];
  if (v9)
  {
    id v10 = [NSString alloc];
    uint64_t v11 = [(MAAutoAssetSetOverview *)self downloadedAtomicInstances];
    uint64_t v12 = (__CFString *)objc_msgSend(v10, "initWithFormat:", @"%lld", objc_msgSend(v11, "count"));
  }
  else
  {
    uint64_t v12 = @"NONE";
  }

  uint64_t v13 = [(MAAutoAssetSetOverview *)self latestDownloadedAtomicInstance];
  if (v13)
  {
    uint64_t v14 = [(MAAutoAssetSetOverview *)self discoveredAtomicInstance];
  }
  else
  {
    uint64_t v14 = @"NONE";
  }

  v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetOverview activeClientCount](self, "activeClientCount"));
  uint64_t v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetOverview activeMonitorCount](self, "activeMonitorCount"));
  uint64_t v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetOverview maximumClientCount](self, "maximumClientCount"));
  uint64_t v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetOverview totalClientCount](self, "totalClientCount"));
  v49 = v4;
  unint64_t v19 = [v4 length];
  uint64_t v20 = [v52 safeStringForKey:@"assetSetIdentifier"];
  unint64_t v21 = [v20 length];

  if (v19 > v21) {
    [v52 setSafeObject:v49 forKey:@"assetSetIdentifier"];
  }
  unint64_t v22 = [v51 length];
  v23 = [v52 safeStringForKey:@"assetSetIdentifier"];
  unint64_t v24 = [v23 length];

  if (v22 > v24) {
    [v52 setSafeObject:v51 forKey:@"assetSetIdentifier"];
  }
  unint64_t v25 = [v50 length];
  id v26 = [v52 safeStringForKey:@"configuredAssetEntries"];
  unint64_t v27 = [v26 length];

  if (v25 > v27) {
    [v52 setSafeObject:v50 forKey:@"configuredAssetEntries"];
  }
  unint64_t v28 = [(__CFString *)v8 length];
  v29 = [v52 safeStringForKey:@"latestDownloadedAtomicInstance"];
  unint64_t v30 = [v29 length];

  if (v28 > v30) {
    [v52 setSafeObject:v8 forKey:@"latestDownloadedAtomicInstance"];
  }
  unint64_t v31 = [(__CFString *)v12 length];
  v32 = [v52 safeStringForKey:@"downloadedAtomicInstances"];
  unint64_t v33 = [v32 length];

  if (v31 > v33) {
    [v52 setSafeObject:v12 forKey:@"downloadedAtomicInstances"];
  }
  unint64_t v34 = [(__CFString *)v14 length];
  v35 = [v52 safeStringForKey:@"discoveredAtomicInstance"];
  unint64_t v36 = [v35 length];

  if (v34 > v36) {
    [v52 setSafeObject:v14 forKey:@"discoveredAtomicInstance"];
  }
  unint64_t v37 = [v15 length];
  v38 = [v52 safeStringForKey:@"activeClientCount"];
  unint64_t v39 = [v38 length];

  if (v37 > v39) {
    [v52 setSafeObject:v15 forKey:@"activeClientCount"];
  }
  unint64_t v40 = [v16 length];
  v41 = [v52 safeStringForKey:@"activeMonitorCount"];
  unint64_t v42 = [v41 length];

  if (v40 > v42) {
    [v52 setSafeObject:v16 forKey:@"activeMonitorCount"];
  }
  unint64_t v43 = [v17 length];
  v44 = [v52 safeStringForKey:@"maximumClientCount"];
  unint64_t v45 = [v44 length];

  if (v43 > v45) {
    [v52 setSafeObject:v17 forKey:@"maximumClientCount"];
  }
  unint64_t v46 = [v18 length];
  v47 = [v52 safeStringForKey:@"totalClientCount"];
  unint64_t v48 = [v47 length];

  if (v46 > v48) {
    [v52 setSafeObject:v18 forKey:@"totalClientCount"];
  }
}

- (id)overviewPadded:(id)a3
{
  id v4 = a3;
  v44 = [(MAAutoAssetSetOverview *)self clientDomainName];
  unint64_t v45 = [(MAAutoAssetSetOverview *)self assetSetIdentifier];
  id v5 = [NSString alloc];
  v6 = [(MAAutoAssetSetOverview *)self configuredAssetEntries];
  unint64_t v43 = objc_msgSend(v5, "initWithFormat:", @"%lld", objc_msgSend(v6, "count"));

  v7 = [(MAAutoAssetSetOverview *)self latestDownloadedAtomicInstance];
  if (v7)
  {
    unint64_t v39 = [(MAAutoAssetSetOverview *)self latestDownloadedAtomicInstance];
  }
  else
  {
    unint64_t v39 = @"NONE";
  }

  id v8 = [(MAAutoAssetSetOverview *)self downloadedAtomicInstances];
  if (v8)
  {
    id v9 = [NSString alloc];
    id v10 = [(MAAutoAssetSetOverview *)self downloadedAtomicInstances];
    unint64_t v42 = (__CFString *)objc_msgSend(v9, "initWithFormat:", @"%lld", objc_msgSend(v10, "count"));
  }
  else
  {
    unint64_t v42 = @"NONE";
  }

  uint64_t v11 = [(MAAutoAssetSetOverview *)self latestDownloadedAtomicInstance];
  if (v11)
  {
    uint64_t v12 = [(MAAutoAssetSetOverview *)self discoveredAtomicInstance];
  }
  else
  {
    uint64_t v12 = @"NONE";
  }

  unint64_t v30 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetOverview activeClientCount](self, "activeClientCount"));
  v41 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetOverview activeMonitorCount](self, "activeMonitorCount"));
  unint64_t v40 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetOverview maximumClientCount](self, "maximumClientCount"));
  v38 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetOverview totalClientCount](self, "totalClientCount"));
  id v32 = (id)NSString;
  unint64_t v37 = [v4 safeStringForKey:@"clientDomainName"];
  v29 = +[MAAutoAssetSetOverview overviewPaddedString:v44 paddingToLenghtOfString:v37 paddingWith:@" " paddingBefore:0];
  unint64_t v36 = [v4 safeStringForKey:@"assetSetIdentifier"];
  unint64_t v27 = +[MAAutoAssetSetOverview overviewPaddedString:v45 paddingToLenghtOfString:v36 paddingWith:@" " paddingBefore:0];
  v35 = [v4 safeStringForKey:@"configuredAssetEntries"];
  unint64_t v21 = +[MAAutoAssetSetOverview overviewPaddedString:v43 paddingToLenghtOfString:v35 paddingWith:@" " paddingBefore:0];
  unint64_t v31 = [v4 safeStringForKey:@"latestDownloadedAtomicInstance"];
  unint64_t v25 = +[MAAutoAssetSetOverview overviewPaddedString:v39 paddingToLenghtOfString:v31 paddingWith:@" " paddingBefore:0];
  unint64_t v28 = [v4 safeStringForKey:@"downloadedAtomicInstances"];
  v23 = +[MAAutoAssetSetOverview overviewPaddedString:v42 paddingToLenghtOfString:v28 paddingWith:@" " paddingBefore:0];
  id v26 = [v4 safeStringForKey:@"discoveredAtomicInstance"];
  unint64_t v34 = v12;
  uint64_t v20 = +[MAAutoAssetSetOverview overviewPaddedString:v12 paddingToLenghtOfString:v26 paddingWith:@" " paddingBefore:0];
  unint64_t v24 = [v4 safeStringForKey:@"activeClientCount"];
  uint64_t v13 = +[MAAutoAssetSetOverview overviewPaddedString:v30 paddingToLenghtOfString:v24 paddingWith:@" " paddingBefore:1];
  unint64_t v22 = [v4 safeStringForKey:@"activeMonitorCount"];
  uint64_t v14 = +[MAAutoAssetSetOverview overviewPaddedString:v41 paddingToLenghtOfString:v22 paddingWith:@" " paddingBefore:1];
  v15 = [v4 safeStringForKey:@"maximumClientCount"];
  uint64_t v16 = +[MAAutoAssetSetOverview overviewPaddedString:v40 paddingToLenghtOfString:v15 paddingWith:@" " paddingBefore:1];
  uint64_t v17 = [v4 safeStringForKey:@"totalClientCount"];

  uint64_t v18 = +[MAAutoAssetSetOverview overviewPaddedString:v38 paddingToLenghtOfString:v17 paddingWith:@" " paddingBefore:1];
  id v33 = [v32 stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@|%@|%@", v29, v27, v21, v25, v23, v20, v13, v14, v16, v18];

  return v33;
}

+ (id)overviewNewMaxColumnStrings
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v2 setSafeObject:@"clientDomainName" forKey:@"clientDomainName"];
  [v2 setSafeObject:@"assetSetIdentifier" forKey:@"assetSetIdentifier"];
  [v2 setSafeObject:@"configuredAssetEntries" forKey:@"configuredAssetEntries"];
  [v2 setSafeObject:@"latestDownloadedAtomicInstance" forKey:@"latestDownloadedAtomicInstance"];
  [v2 setSafeObject:@"downloadedAtomicInstances" forKey:@"downloadedAtomicInstances"];
  [v2 setSafeObject:@"discoveredAtomicInstance" forKey:@"discoveredAtomicInstance"];
  [v2 setSafeObject:@"activeClientCount" forKey:@"activeClientCount"];
  [v2 setSafeObject:@"activeMonitorCount" forKey:@"activeMonitorCount"];
  [v2 setSafeObject:@"maximumClientCount" forKey:@"maximumClientCount"];
  [v2 setSafeObject:@"totalClientCount" forKey:@"totalClientCount"];
  return v2;
}

+ (id)overviewPaddedString:(id)a3 paddingToLenghtOfString:(id)a4 paddingWith:(id)a5 paddingBefore:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  unint64_t v13 = [v12 length];
  uint64_t v14 = v12;
  if (v13 < [v10 length])
  {
    uint64_t v15 = [v10 length];
    uint64_t v16 = v15 - [v12 length];
    uint64_t v17 = [NSString string];
    uint64_t v18 = [v17 stringByPaddingToLength:v16 withString:v11 startingAtIndex:0];

    id v19 = [NSString alloc];
    if (v6) {
      uint64_t v20 = [v19 initWithFormat:@"%@%@", v18, v12];
    }
    else {
      uint64_t v20 = [v19 initWithFormat:@"%@%@", v12, v18];
    }
    uint64_t v14 = (void *)v20;
  }
  return v14;
}

+ (id)overviewPaddedHeader:(id)a3
{
  uint64_t v20 = NSString;
  id v3 = a3;
  unint64_t v24 = [v3 safeStringForKey:@"clientDomainName"];
  id v26 = +[MAAutoAssetSetOverview overviewPaddedString:@"clientDomainName" paddingToLenghtOfString:v24 paddingWith:@" " paddingBefore:0];
  v23 = [v3 safeStringForKey:@"assetSetIdentifier"];
  unint64_t v25 = +[MAAutoAssetSetOverview overviewPaddedString:@"assetSetIdentifier" paddingToLenghtOfString:v23 paddingWith:@" " paddingBefore:0];
  unint64_t v22 = [v3 safeStringForKey:@"configuredAssetEntries"];
  uint64_t v16 = +[MAAutoAssetSetOverview overviewPaddedString:@"configuredAssetEntries" paddingToLenghtOfString:v22 paddingWith:@" " paddingBefore:0];
  id v19 = [v3 safeStringForKey:@"latestDownloadedAtomicInstance"];
  uint64_t v15 = +[MAAutoAssetSetOverview overviewPaddedString:@"latestDownloadedAtomicInstance" paddingToLenghtOfString:v19 paddingWith:@" " paddingBefore:0];
  uint64_t v18 = [v3 safeStringForKey:@"downloadedAtomicInstances"];
  unint64_t v13 = +[MAAutoAssetSetOverview overviewPaddedString:@"downloadedAtomicInstances" paddingToLenghtOfString:v18 paddingWith:@" " paddingBefore:0];
  uint64_t v17 = [v3 safeStringForKey:@"discoveredAtomicInstance"];
  id v11 = +[MAAutoAssetSetOverview overviewPaddedString:@"discoveredAtomicInstance" paddingToLenghtOfString:v17 paddingWith:@" " paddingBefore:0];
  uint64_t v14 = [v3 safeStringForKey:@"activeClientCount"];
  id v4 = +[MAAutoAssetSetOverview overviewPaddedString:@"activeClientCount" paddingToLenghtOfString:v14 paddingWith:@" " paddingBefore:0];
  id v12 = [v3 safeStringForKey:@"activeMonitorCount"];
  id v5 = +[MAAutoAssetSetOverview overviewPaddedString:@"activeMonitorCount" paddingToLenghtOfString:v12 paddingWith:@" " paddingBefore:0];
  BOOL v6 = [v3 safeStringForKey:@"maximumClientCount"];
  v7 = +[MAAutoAssetSetOverview overviewPaddedString:@"maximumClientCount" paddingToLenghtOfString:v6 paddingWith:@" " paddingBefore:0];
  id v8 = [v3 safeStringForKey:@"totalClientCount"];

  id v9 = +[MAAutoAssetSetOverview overviewPaddedString:@"totalClientCount" paddingToLenghtOfString:v8 paddingWith:@" " paddingBefore:0];
  unint64_t v21 = [v20 stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@|%@|%@", v26, v25, v16, v15, v13, v11, v4, v5, v7, v9];

  return v21;
}

+ (id)overviewPaddedBanner:(id)a3
{
  unint64_t v21 = NSString;
  id v3 = a3;
  unint64_t v25 = [v3 safeStringForKey:@"clientDomainName"];
  id v26 = +[MAAutoAssetSetOverview overviewPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v25 paddingWith:@"=" paddingBefore:0];
  unint64_t v24 = [v3 safeStringForKey:@"assetSetIdentifier"];
  uint64_t v18 = +[MAAutoAssetSetOverview overviewPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v24 paddingWith:@"=" paddingBefore:0];
  v23 = [v3 safeStringForKey:@"configuredAssetEntries"];
  uint64_t v16 = +[MAAutoAssetSetOverview overviewPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v23 paddingWith:@"=" paddingBefore:0];
  uint64_t v20 = [v3 safeStringForKey:@"latestDownloadedAtomicInstance"];
  uint64_t v15 = +[MAAutoAssetSetOverview overviewPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v20 paddingWith:@"=" paddingBefore:0];
  id v19 = [v3 safeStringForKey:@"downloadedAtomicInstances"];
  id v11 = +[MAAutoAssetSetOverview overviewPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v19 paddingWith:@"=" paddingBefore:0];
  uint64_t v17 = [v3 safeStringForKey:@"discoveredAtomicInstance"];
  id v12 = +[MAAutoAssetSetOverview overviewPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v17 paddingWith:@"=" paddingBefore:0];
  uint64_t v14 = [v3 safeStringForKey:@"activeClientCount"];
  id v4 = +[MAAutoAssetSetOverview overviewPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v14 paddingWith:@"=" paddingBefore:0];
  unint64_t v13 = [v3 safeStringForKey:@"activeMonitorCount"];
  id v5 = +[MAAutoAssetSetOverview overviewPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v13 paddingWith:@"=" paddingBefore:0];
  BOOL v6 = [v3 safeStringForKey:@"maximumClientCount"];
  v7 = +[MAAutoAssetSetOverview overviewPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v6 paddingWith:@"=" paddingBefore:0];
  id v8 = [v3 safeStringForKey:@"totalClientCount"];

  id v9 = +[MAAutoAssetSetOverview overviewPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v8 paddingWith:@"=" paddingBefore:0];
  unint64_t v22 = [v21 stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@|%@|%@", v26, v18, v16, v15, v11, v12, v4, v5, v7, v9];

  return v22;
}

- (NSString)clientDomainName
{
  return self->_clientDomainName;
}

- (void)setClientDomainName:(id)a3
{
}

- (NSString)assetSetIdentifier
{
  return self->_assetSetIdentifier;
}

- (void)setAssetSetIdentifier:(id)a3
{
}

- (NSArray)configuredAssetEntries
{
  return self->_configuredAssetEntries;
}

- (void)setConfiguredAssetEntries:(id)a3
{
}

- (NSString)latestDownloadedAtomicInstance
{
  return self->_latestDownloadedAtomicInstance;
}

- (void)setLatestDownloadedAtomicInstance:(id)a3
{
}

- (NSArray)downloadedAtomicInstances
{
  return self->_downloadedAtomicInstances;
}

- (void)setDownloadedAtomicInstances:(id)a3
{
}

- (NSString)discoveredAtomicInstance
{
  return self->_discoveredAtomicInstance;
}

- (int64_t)activeClientCount
{
  return self->_activeClientCount;
}

- (void)setActiveClientCount:(int64_t)a3
{
  self->_activeClientCount = a3;
}

- (int64_t)activeMonitorCount
{
  return self->_activeMonitorCount;
}

- (void)setActiveMonitorCount:(int64_t)a3
{
  self->_activeMonitorCount = a3;
}

- (int64_t)maximumClientCount
{
  return self->_maximumClientCount;
}

- (void)setMaximumClientCount:(int64_t)a3
{
  self->_maximumClientCount = a3;
}

- (int64_t)totalClientCount
{
  return self->_totalClientCount;
}

- (void)setTotalClientCount:(int64_t)a3
{
  self->_totalClientCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveredAtomicInstance, 0);
  objc_storeStrong((id *)&self->_downloadedAtomicInstances, 0);
  objc_storeStrong((id *)&self->_latestDownloadedAtomicInstance, 0);
  objc_storeStrong((id *)&self->_configuredAssetEntries, 0);
  objc_storeStrong((id *)&self->_assetSetIdentifier, 0);
  objc_storeStrong((id *)&self->_clientDomainName, 0);
}

@end