@interface MAAutoAssetSetSummary
+ (BOOL)supportsSecureCoding;
+ (id)assetSetRepresentationName:(int64_t)a3;
+ (id)summaryNewMaxColumnStrings;
+ (id)summaryPaddedBanner:(id)a3;
+ (id)summaryPaddedHeader:(id)a3;
+ (id)summaryPaddedString:(id)a3 paddingToLenghtOfString:(id)a4 paddingWith:(id)a5 paddingBefore:(BOOL)a6;
- (MAAutoAssetSetStatus)setJobStatus;
- (MAAutoAssetSetSummary)initWithCoder:(id)a3;
- (MAAutoAssetSetSummary)initWithDomainName:(id)a3 forAssetSetIdentifier:(id)a4 withAssetSetRepresentation:(int64_t)a5 withSetJobStatus:(id)a6 withScheduledIntervalSecs:(int64_t)a7 withScheduledRemainingSecs:(int64_t)a8 withPushDelaySecs:(int64_t)a9 withActiveClientCount:(int64_t)a10 withActiveMonitorCount:(int64_t)a11 withMaximumClientCount:(int64_t)a12 withTotalClientCount:(int64_t)a13;
- (NSString)assetSetIdentifier;
- (NSString)clientDomainName;
- (id)assetSetRepresentationName;
- (id)description;
- (id)summary;
- (id)summaryPadded:(id)a3;
- (int64_t)activeClientCount;
- (int64_t)activeMonitorCount;
- (int64_t)assetSetRepresentation;
- (int64_t)maximumClientCount;
- (int64_t)pushDelaySecs;
- (int64_t)scheduledIntervalSecs;
- (int64_t)scheduledRemainingSecs;
- (int64_t)totalClientCount;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveClientCount:(int64_t)a3;
- (void)setActiveMonitorCount:(int64_t)a3;
- (void)setAssetSetIdentifier:(id)a3;
- (void)setAssetSetRepresentation:(int64_t)a3;
- (void)setClientDomainName:(id)a3;
- (void)setMaximumClientCount:(int64_t)a3;
- (void)setPushDelaySecs:(int64_t)a3;
- (void)setScheduledIntervalSecs:(int64_t)a3;
- (void)setScheduledRemainingSecs:(int64_t)a3;
- (void)setSetJobStatus:(id)a3;
- (void)setTotalClientCount:(int64_t)a3;
- (void)summaryBuildMaxColumnStrings:(id)a3;
@end

@implementation MAAutoAssetSetSummary

- (MAAutoAssetSetSummary)initWithDomainName:(id)a3 forAssetSetIdentifier:(id)a4 withAssetSetRepresentation:(int64_t)a5 withSetJobStatus:(id)a6 withScheduledIntervalSecs:(int64_t)a7 withScheduledRemainingSecs:(int64_t)a8 withPushDelaySecs:(int64_t)a9 withActiveClientCount:(int64_t)a10 withActiveMonitorCount:(int64_t)a11 withMaximumClientCount:(int64_t)a12 withTotalClientCount:(int64_t)a13
{
  id v20 = a3;
  id v21 = a4;
  id v22 = a6;
  v26.receiver = self;
  v26.super_class = (Class)MAAutoAssetSetSummary;
  v23 = [(MAAutoAssetSetSummary *)&v26 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_clientDomainName, a3);
    objc_storeStrong((id *)&v24->_assetSetIdentifier, a4);
    v24->_assetSetRepresentation = a5;
    objc_storeStrong((id *)&v24->_setJobStatus, a6);
    v24->_scheduledIntervalSecs = a7;
    v24->_scheduledRemainingSecs = a8;
    v24->_pushDelaySecs = a9;
    v24->_activeClientCount = a10;
    v24->_activeMonitorCount = a11;
    v24->_maximumClientCount = a12;
    v24->_totalClientCount = a13;
  }

  return v24;
}

- (MAAutoAssetSetSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MAAutoAssetSetSummary;
  v5 = [(MAAutoAssetSetSummary *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientDomainName"];
    clientDomainName = v5->_clientDomainName;
    v5->_clientDomainName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetSetIdentifier"];
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v8;

    v5->_assetSetRepresentation = [v4 decodeInt64ForKey:@"assetSetRepresentation"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"setJobStatus"];
    setJobStatus = v5->_setJobStatus;
    v5->_setJobStatus = (MAAutoAssetSetStatus *)v10;

    v5->_scheduledIntervalSecs = [v4 decodeIntegerForKey:@"scheduledIntervalSecs"];
    v5->_scheduledRemainingSecs = [v4 decodeIntegerForKey:@"scheduledRemainingSecs"];
    v5->_pushDelaySecs = [v4 decodeIntegerForKey:@"pushDelaySecs"];
    v5->_activeClientCount = [v4 decodeIntegerForKey:@"activeClientCount"];
    v5->_activeMonitorCount = [v4 decodeIntegerForKey:@"activeMonitorCount"];
    v5->_maximumClientCount = [v4 decodeIntegerForKey:@"maximumClientCount"];
    v5->_totalClientCount = [v4 decodeIntegerForKey:@"totalClientCount"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(MAAutoAssetSetSummary *)self clientDomainName];
  [v7 encodeObject:v4 forKey:@"clientDomainName"];

  v5 = [(MAAutoAssetSetSummary *)self assetSetIdentifier];
  [v7 encodeObject:v5 forKey:@"assetSetIdentifier"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[MAAutoAssetSetSummary assetSetRepresentation](self, "assetSetRepresentation"), @"assetSetRepresentation");
  uint64_t v6 = [(MAAutoAssetSetSummary *)self setJobStatus];
  [v7 encodeObject:v6 forKey:@"setJobStatus"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[MAAutoAssetSetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs"), @"scheduledIntervalSecs");
  objc_msgSend(v7, "encodeInteger:forKey:", -[MAAutoAssetSetSummary pushDelaySecs](self, "pushDelaySecs"), @"pushDelaySecs");
  objc_msgSend(v7, "encodeInteger:forKey:", -[MAAutoAssetSetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs"), @"scheduledRemainingSecs");
  objc_msgSend(v7, "encodeInteger:forKey:", -[MAAutoAssetSetSummary activeClientCount](self, "activeClientCount"), @"activeClientCount");
  objc_msgSend(v7, "encodeInteger:forKey:", -[MAAutoAssetSetSummary activeMonitorCount](self, "activeMonitorCount"), @"activeMonitorCount");
  objc_msgSend(v7, "encodeInteger:forKey:", -[MAAutoAssetSetSummary maximumClientCount](self, "maximumClientCount"), @"maximumClientCount");
  objc_msgSend(v7, "encodeInteger:forKey:", -[MAAutoAssetSetSummary totalClientCount](self, "totalClientCount"), @"totalClientCount");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  uint64_t v26 = [(MAAutoAssetSetSummary *)self clientDomainName];
  uint64_t v25 = [(MAAutoAssetSetSummary *)self assetSetIdentifier];
  id v4 = [(MAAutoAssetSetSummary *)self assetSetRepresentationName];
  int64_t v24 = [(MAAutoAssetSetSummary *)self scheduledIntervalSecs];
  int64_t v5 = [(MAAutoAssetSetSummary *)self scheduledRemainingSecs];
  int64_t v6 = [(MAAutoAssetSetSummary *)self pushDelaySecs];
  int64_t v7 = [(MAAutoAssetSetSummary *)self activeClientCount];
  int64_t v8 = [(MAAutoAssetSetSummary *)self activeMonitorCount];
  int64_t v9 = [(MAAutoAssetSetSummary *)self maximumClientCount];
  int64_t v10 = [(MAAutoAssetSetSummary *)self totalClientCount];
  v11 = [(MAAutoAssetSetSummary *)self setJobStatus];
  if (v11)
  {
    v12 = [(MAAutoAssetSetSummary *)self setJobStatus];
    uint64_t v13 = [v12 description];
    v14 = v3;
    v15 = (void *)v13;
    int64_t v22 = v10;
    int64_t v20 = v8;
    v16 = (void *)v25;
    v17 = (void *)v26;
    v18 = [v14 stringWithFormat:@">>>\n                clientDomainName: %@\n              assetSetIdentifier: %@\n          assetSetRepresentation: %@\n           scheduledIntervalSecs: %ld\n          scheduledRemainingSecs: %ld\n                   pushDelaySecs: %ld\n               activeClientCount: %ld\n              activeMonitorCount: %ld\n              maximumClientCount: %ld\n                totalClientCount: %ld\n%@<<<]", v26, v25, v4, v24, v5, v6, v7, v20, v9, v22, v13];
  }
  else
  {
    int64_t v23 = v10;
    int64_t v21 = v8;
    v16 = (void *)v25;
    v17 = (void *)v26;
    v18 = [v3 stringWithFormat:@">>>\n                clientDomainName: %@\n              assetSetIdentifier: %@\n          assetSetRepresentation: %@\n           scheduledIntervalSecs: %ld\n          scheduledRemainingSecs: %ld\n                   pushDelaySecs: %ld\n               activeClientCount: %ld\n              activeMonitorCount: %ld\n              maximumClientCount: %ld\n                totalClientCount: %ld\n%@<<<]", v26, v25, v4, v24, v5, v6, v7, v21, v9, v23, @"                    setJobStatus: N\n"];
  }

  return v18;
}

- (id)summary
{
  v17 = [(MAAutoAssetSetSummary *)self clientDomainName];
  v16 = [(MAAutoAssetSetSummary *)self assetSetIdentifier];
  v15 = [(MAAutoAssetSetSummary *)self assetSetRepresentationName];
  v3 = [(MAAutoAssetSetSummary *)self setJobStatus];
  if (v3)
  {
    id v4 = [(MAAutoAssetSetSummary *)self setJobStatus];
    v14 = [v4 summary];
  }
  else
  {
    v14 = @"NONE";
  }

  int64_t v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs"));
  int64_t v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs"));
  v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetSummary pushDelaySecs](self, "pushDelaySecs"));
  int64_t v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetSummary activeClientCount](self, "activeClientCount"));
  int64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetSummary activeMonitorCount](self, "activeMonitorCount"));
  int64_t v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetSummary maximumClientCount](self, "maximumClientCount"));
  int64_t v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetSummary totalClientCount](self, "totalClientCount"));
  id v13 = [NSString stringWithFormat:@"clientDomain:%@|asset(%@)[%@]|status:%@|interval:%@|remaining:%@|pushDelay:%@|clients:%@|monitors:%@|maxClients:%@|totalClients:%@", v17, v16, v15, v14, v5, v6, v12, v7, v8, v9, v10];

  return v13;
}

- (void)summaryBuildMaxColumnStrings:(id)a3
{
  id v51 = a3;
  id v4 = [(MAAutoAssetSetSummary *)self clientDomainName];
  v50 = [(MAAutoAssetSetSummary *)self assetSetIdentifier];
  v49 = [(MAAutoAssetSetSummary *)self assetSetRepresentationName];
  int64_t v5 = [(MAAutoAssetSetSummary *)self setJobStatus];
  if (v5)
  {
    int64_t v6 = [(MAAutoAssetSetSummary *)self setJobStatus];
    v48 = [v6 summary];
  }
  else
  {
    v48 = @"NONE";
  }

  int64_t v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs"));
  int64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs"));
  int64_t v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetSummary pushDelaySecs](self, "pushDelaySecs"));
  int64_t v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetSummary activeClientCount](self, "activeClientCount"));
  v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetSummary activeMonitorCount](self, "activeMonitorCount"));
  v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetSummary maximumClientCount](self, "maximumClientCount"));
  id v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetSummary totalClientCount](self, "totalClientCount"));
  v47 = v4;
  unint64_t v14 = [v4 length];
  v15 = [v51 safeStringForKey:@"assetSetIdentifier"];
  unint64_t v16 = [v15 length];

  if (v14 > v16) {
    [v51 setSafeObject:v47 forKey:@"assetSetIdentifier"];
  }
  unint64_t v17 = [v50 length];
  v18 = [v51 safeStringForKey:@"assetSetIdentifier"];
  unint64_t v19 = [v18 length];

  if (v17 > v19) {
    [v51 setSafeObject:v50 forKey:@"assetSetIdentifier"];
  }
  unint64_t v20 = [v49 length];
  int64_t v21 = [v51 safeStringForKey:@"assetSetRepresentation"];
  unint64_t v22 = [v21 length];

  if (v20 > v22) {
    [v51 setSafeObject:v49 forKey:@"assetSetRepresentation"];
  }
  unint64_t v23 = [(__CFString *)v48 length];
  int64_t v24 = [v51 safeStringForKey:@"setJobStatus"];
  unint64_t v25 = [v24 length];

  if (v23 > v25) {
    [v51 setSafeObject:v48 forKey:@"setJobStatus"];
  }
  unint64_t v26 = [v7 length];
  v27 = [v51 safeStringForKey:@"scheduledIntervalSecs"];
  unint64_t v28 = [v27 length];

  if (v26 > v28) {
    [v51 setSafeObject:v7 forKey:@"scheduledIntervalSecs"];
  }
  unint64_t v29 = [v8 length];
  v30 = [v51 safeStringForKey:@"scheduledRemainingSecs"];
  unint64_t v31 = [v30 length];

  if (v29 > v31) {
    [v51 setSafeObject:v8 forKey:@"scheduledRemainingSecs"];
  }
  unint64_t v32 = [v9 length];
  v33 = [v51 safeStringForKey:@"pushDelaySecs"];
  unint64_t v34 = [v33 length];

  if (v32 > v34) {
    [v51 setSafeObject:v9 forKey:@"pushDelaySecs"];
  }
  unint64_t v35 = [v10 length];
  v36 = [v51 safeStringForKey:@"activeClientCount"];
  unint64_t v37 = [v36 length];

  if (v35 > v37) {
    [v51 setSafeObject:v10 forKey:@"activeClientCount"];
  }
  unint64_t v38 = [v11 length];
  v39 = [v51 safeStringForKey:@"activeMonitorCount"];
  unint64_t v40 = [v39 length];

  if (v38 > v40) {
    [v51 setSafeObject:v11 forKey:@"activeMonitorCount"];
  }
  unint64_t v41 = [v12 length];
  v42 = [v51 safeStringForKey:@"maximumClientCount"];
  unint64_t v43 = [v42 length];

  if (v41 > v43) {
    [v51 setSafeObject:v12 forKey:@"maximumClientCount"];
  }
  unint64_t v44 = [v13 length];
  v45 = [v51 safeStringForKey:@"totalClientCount"];
  unint64_t v46 = [v45 length];

  if (v44 > v46) {
    [v51 setSafeObject:v13 forKey:@"totalClientCount"];
  }
}

- (id)summaryPadded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MAAutoAssetSetSummary *)self clientDomainName];
  int64_t v6 = [(MAAutoAssetSetSummary *)self assetSetIdentifier];
  unint64_t v43 = [(MAAutoAssetSetSummary *)self assetSetRepresentationName];
  int64_t v7 = [(MAAutoAssetSetSummary *)self setJobStatus];
  if (v7)
  {
    int64_t v8 = [(MAAutoAssetSetSummary *)self setJobStatus];
    v42 = [v8 summary];
  }
  else
  {
    v42 = @"NONE";
  }

  v39 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs"));
  unint64_t v32 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs"));
  unint64_t v41 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetSummary pushDelaySecs](self, "pushDelaySecs"));
  unint64_t v40 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetSummary activeClientCount](self, "activeClientCount"));
  unint64_t v25 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetSummary activeMonitorCount](self, "activeMonitorCount"));
  unint64_t v38 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetSummary maximumClientCount](self, "maximumClientCount"));
  unint64_t v37 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetSummary totalClientCount](self, "totalClientCount"));
  id v29 = (id)NSString;
  unint64_t v35 = [v4 safeStringForKey:@"clientDomainName"];
  v27 = (void *)v5;
  v36 = +[MAAutoAssetSummary summaryPaddedString:v5 paddingToLenghtOfString:v35 paddingWith:@" " paddingBefore:0];
  unint64_t v34 = [v4 safeStringForKey:@"assetSetIdentifier"];
  unint64_t v26 = +[MAAutoAssetSummary summaryPaddedString:v6 paddingToLenghtOfString:v34 paddingWith:@" " paddingBefore:0];
  v33 = [v4 safeStringForKey:@"assetSetRepresentation"];
  unint64_t v23 = +[MAAutoAssetSummary summaryPaddedString:v43 paddingToLenghtOfString:v33 paddingWith:@" " paddingBefore:0];
  unint64_t v31 = [v4 safeStringForKey:@"setJobStatus"];
  int64_t v21 = +[MAAutoAssetSummary summaryPaddedString:v42 paddingToLenghtOfString:v31 paddingWith:@" " paddingBefore:0];
  unint64_t v28 = [v4 safeStringForKey:@"scheduledIntervalSecs"];
  unint64_t v20 = +[MAAutoAssetSummary summaryPaddedString:v39 paddingToLenghtOfString:v28 paddingWith:@" " paddingBefore:1];
  int64_t v24 = [v4 safeStringForKey:@"scheduledRemainingSecs"];
  unint64_t v17 = +[MAAutoAssetSummary summaryPaddedString:v32 paddingToLenghtOfString:v24 paddingWith:@" " paddingBefore:1];
  unint64_t v22 = [v4 safeStringForKey:@"pushDelaySecs"];
  unint64_t v16 = +[MAAutoAssetSummary summaryPaddedString:v41 paddingToLenghtOfString:v22 paddingWith:@" " paddingBefore:1];
  unint64_t v19 = [v4 safeStringForKey:@"activeClientCount"];
  int64_t v9 = +[MAAutoAssetSummary summaryPaddedString:v40 paddingToLenghtOfString:v19 paddingWith:@" " paddingBefore:1];
  v18 = [v4 safeStringForKey:@"activeMonitorCount"];
  int64_t v10 = +[MAAutoAssetSummary summaryPaddedString:v25 paddingToLenghtOfString:v18 paddingWith:@" " paddingBefore:1];
  v11 = [v4 safeStringForKey:@"maximumClientCount"];
  v12 = +[MAAutoAssetSummary summaryPaddedString:v38 paddingToLenghtOfString:v11 paddingWith:@" " paddingBefore:1];
  id v13 = [v4 safeStringForKey:@"totalClientCount"];

  unint64_t v14 = +[MAAutoAssetSummary summaryPaddedString:v37 paddingToLenghtOfString:v13 paddingWith:@" " paddingBefore:1];
  id v30 = [v29 stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@", v36, v26, v23, v21, v20, v17, v16, v9, v10, v12, v14];

  return v30;
}

- (id)assetSetRepresentationName
{
  int64_t v2 = [(MAAutoAssetSetSummary *)self assetSetRepresentation];
  return +[MAAutoAssetSummary assetRepresentationName:v2];
}

+ (id)assetSetRepresentationName:(int64_t)a3
{
  return +[MAAutoAssetSummary assetRepresentationName:a3];
}

+ (id)summaryNewMaxColumnStrings
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v2 setSafeObject:@"clientDomainName" forKey:@"clientDomainName"];
  [v2 setSafeObject:@"assetSetIdentifier" forKey:@"assetSetIdentifier"];
  [v2 setSafeObject:@"assetSetRepresentation" forKey:@"assetSetRepresentation"];
  [v2 setSafeObject:@"setJobStatus" forKey:@"setJobStatus"];
  [v2 setSafeObject:@"scheduledIntervalSecs" forKey:@"scheduledIntervalSecs"];
  [v2 setSafeObject:@"scheduledRemainingSecs" forKey:@"scheduledRemainingSecs"];
  [v2 setSafeObject:@"activeClientCount" forKey:@"activeClientCount"];
  [v2 setSafeObject:@"activeMonitorCount" forKey:@"activeMonitorCount"];
  [v2 setSafeObject:@"maximumClientCount" forKey:@"maximumClientCount"];
  [v2 setSafeObject:@"totalClientCount" forKey:@"totalClientCount"];
  return v2;
}

+ (id)summaryPaddedString:(id)a3 paddingToLenghtOfString:(id)a4 paddingWith:(id)a5 paddingBefore:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  unint64_t v13 = [v12 length];
  unint64_t v14 = v12;
  if (v13 < [v10 length])
  {
    uint64_t v15 = [v10 length];
    uint64_t v16 = v15 - [v12 length];
    unint64_t v17 = [NSString string];
    v18 = [v17 stringByPaddingToLength:v16 withString:v11 startingAtIndex:0];

    id v19 = [NSString alloc];
    if (v6) {
      uint64_t v20 = [v19 initWithFormat:@"%@%@", v18, v12];
    }
    else {
      uint64_t v20 = [v19 initWithFormat:@"%@%@", v12, v18];
    }
    unint64_t v14 = (void *)v20;
  }
  return v14;
}

+ (id)summaryPaddedHeader:(id)a3
{
  uint64_t v20 = NSString;
  id v3 = a3;
  int64_t v24 = [v3 safeStringForKey:@"clientDomainName"];
  unint64_t v26 = +[MAAutoAssetSummary summaryPaddedString:@"clientDomainName" paddingToLenghtOfString:v24 paddingWith:@" " paddingBefore:0];
  unint64_t v23 = [v3 safeStringForKey:@"assetSetIdentifier"];
  unint64_t v25 = +[MAAutoAssetSummary summaryPaddedString:@"assetSetIdentifier" paddingToLenghtOfString:v23 paddingWith:@" " paddingBefore:0];
  unint64_t v22 = [v3 safeStringForKey:@"assetSetRepresentation"];
  uint64_t v16 = +[MAAutoAssetSummary summaryPaddedString:@"assetSetRepresentation" paddingToLenghtOfString:v22 paddingWith:@" " paddingBefore:0];
  id v19 = [v3 safeStringForKey:@"setJobStatus"];
  uint64_t v15 = +[MAAutoAssetSummary summaryPaddedString:@"setJobStatus" paddingToLenghtOfString:v19 paddingWith:@" " paddingBefore:0];
  v18 = [v3 safeStringForKey:@"scheduledIntervalSecs"];
  unint64_t v13 = +[MAAutoAssetSummary summaryPaddedString:@"scheduledIntervalSecs" paddingToLenghtOfString:v18 paddingWith:@" " paddingBefore:0];
  unint64_t v17 = [v3 safeStringForKey:@"scheduledRemainingSecs"];
  id v11 = +[MAAutoAssetSummary summaryPaddedString:@"scheduledRemainingSecs" paddingToLenghtOfString:v17 paddingWith:@" " paddingBefore:0];
  unint64_t v14 = [v3 safeStringForKey:@"activeClientCount"];
  id v4 = +[MAAutoAssetSummary summaryPaddedString:@"activeClientCount" paddingToLenghtOfString:v14 paddingWith:@" " paddingBefore:0];
  id v12 = [v3 safeStringForKey:@"activeMonitorCount"];
  uint64_t v5 = +[MAAutoAssetSummary summaryPaddedString:@"activeMonitorCount" paddingToLenghtOfString:v12 paddingWith:@" " paddingBefore:0];
  BOOL v6 = [v3 safeStringForKey:@"maximumClientCount"];
  int64_t v7 = +[MAAutoAssetSummary summaryPaddedString:@"maximumClientCount" paddingToLenghtOfString:v6 paddingWith:@" " paddingBefore:0];
  int64_t v8 = [v3 safeStringForKey:@"totalClientCount"];

  id v9 = +[MAAutoAssetSummary summaryPaddedString:@"totalClientCount" paddingToLenghtOfString:v8 paddingWith:@" " paddingBefore:0];
  int64_t v21 = [v20 stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@|%@|%@", v26, v25, v16, v15, v13, v11, v4, v5, v7, v9];

  return v21;
}

+ (id)summaryPaddedBanner:(id)a3
{
  int64_t v21 = NSString;
  id v3 = a3;
  unint64_t v25 = [v3 safeStringForKey:@"clientDomainName"];
  unint64_t v26 = +[MAAutoAssetSummary summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v25 paddingWith:@"=" paddingBefore:0];
  int64_t v24 = [v3 safeStringForKey:@"assetSetIdentifier"];
  v18 = +[MAAutoAssetSummary summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v24 paddingWith:@"=" paddingBefore:0];
  unint64_t v23 = [v3 safeStringForKey:@"assetSetRepresentation"];
  uint64_t v16 = +[MAAutoAssetSummary summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v23 paddingWith:@"=" paddingBefore:0];
  uint64_t v20 = [v3 safeStringForKey:@"setJobStatus"];
  uint64_t v15 = +[MAAutoAssetSummary summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v20 paddingWith:@"=" paddingBefore:0];
  id v19 = [v3 safeStringForKey:@"scheduledIntervalSecs"];
  id v11 = +[MAAutoAssetSummary summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v19 paddingWith:@"=" paddingBefore:0];
  unint64_t v17 = [v3 safeStringForKey:@"scheduledRemainingSecs"];
  id v12 = +[MAAutoAssetSummary summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v17 paddingWith:@"=" paddingBefore:0];
  unint64_t v14 = [v3 safeStringForKey:@"activeClientCount"];
  id v4 = +[MAAutoAssetSummary summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v14 paddingWith:@"=" paddingBefore:0];
  unint64_t v13 = [v3 safeStringForKey:@"activeMonitorCount"];
  uint64_t v5 = +[MAAutoAssetSummary summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v13 paddingWith:@"=" paddingBefore:0];
  BOOL v6 = [v3 safeStringForKey:@"maximumClientCount"];
  int64_t v7 = +[MAAutoAssetSummary summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v6 paddingWith:@"=" paddingBefore:0];
  int64_t v8 = [v3 safeStringForKey:@"totalClientCount"];

  id v9 = +[MAAutoAssetSummary summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v8 paddingWith:@"=" paddingBefore:0];
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

- (int64_t)assetSetRepresentation
{
  return self->_assetSetRepresentation;
}

- (void)setAssetSetRepresentation:(int64_t)a3
{
  self->_assetSetRepresentation = a3;
}

- (MAAutoAssetSetStatus)setJobStatus
{
  return self->_setJobStatus;
}

- (void)setSetJobStatus:(id)a3
{
}

- (int64_t)scheduledIntervalSecs
{
  return self->_scheduledIntervalSecs;
}

- (void)setScheduledIntervalSecs:(int64_t)a3
{
  self->_scheduledIntervalSecs = a3;
}

- (int64_t)scheduledRemainingSecs
{
  return self->_scheduledRemainingSecs;
}

- (void)setScheduledRemainingSecs:(int64_t)a3
{
  self->_scheduledRemainingSecs = a3;
}

- (int64_t)pushDelaySecs
{
  return self->_pushDelaySecs;
}

- (void)setPushDelaySecs:(int64_t)a3
{
  self->_pushDelaySecs = a3;
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
  objc_storeStrong((id *)&self->_setJobStatus, 0);
  objc_storeStrong((id *)&self->_assetSetIdentifier, 0);
  objc_storeStrong((id *)&self->_clientDomainName, 0);
}

@end