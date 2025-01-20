@interface MAAutoAssetSetLockTracker
+ (BOOL)supportsSecureCoding;
+ (id)summaryNewMaxColumnStrings;
+ (id)summaryPaddedBanner:(id)a3;
+ (id)summaryPaddedHeader:(id)a3;
+ (id)summaryPaddedString:(id)a3 paddingToLenghtOfString:(id)a4 paddingWith:(id)a5 paddingBefore:(BOOL)a6;
- (MAAutoAssetLockReason)clientLockReason;
- (MAAutoAssetSetLockTracker)initWithCoder:(id)a3;
- (MAAutoAssetSetPolicy)lockUsagePolicy;
- (NSDate)firstLockTimestamp;
- (NSDate)lastRefreshTimestamp;
- (id)copy;
- (id)description;
- (id)initForClientLockReason:(id)a3 lockingWithUsagePolicy:(id)a4;
- (id)summary;
- (id)summaryPadded:(id)a3;
- (int64_t)activeLockCount;
- (int64_t)continueCount;
- (int64_t)maximumLockCount;
- (int64_t)totalLockCount;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveLockCount:(int64_t)a3;
- (void)setContinueCount:(int64_t)a3;
- (void)setFirstLockTimestamp:(id)a3;
- (void)setLastRefreshTimestamp:(id)a3;
- (void)setLockUsagePolicy:(id)a3;
- (void)setMaximumLockCount:(int64_t)a3;
- (void)setTotalLockCount:(int64_t)a3;
- (void)summaryBuildMaxColumnStrings:(id)a3;
@end

@implementation MAAutoAssetSetLockTracker

- (id)initForClientLockReason:(id)a3 lockingWithUsagePolicy:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MAAutoAssetSetLockTracker;
  v9 = [(MAAutoAssetSetLockTracker *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientLockReason, a3);
    objc_storeStrong((id *)&v10->_lockUsagePolicy, a4);
    *(int64x2_t *)&v10->_activeLockCount = vdupq_n_s64(1uLL);
    *(_OWORD *)&v10->_totalLockCount = xmmword_1B27E3520;
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    firstLockTimestamp = v10->_firstLockTimestamp;
    v10->_firstLockTimestamp = (NSDate *)v11;

    objc_storeStrong((id *)&v10->_lastRefreshTimestamp, v10->_firstLockTimestamp);
  }

  return v10;
}

- (MAAutoAssetSetLockTracker)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MAAutoAssetSetLockTracker;
  v5 = [(MAAutoAssetSetLockTracker *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientLockReason"];
    clientLockReason = v5->_clientLockReason;
    v5->_clientLockReason = (MAAutoAssetLockReason *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lockUsagePolicy"];
    lockUsagePolicy = v5->_lockUsagePolicy;
    v5->_lockUsagePolicy = (MAAutoAssetSetPolicy *)v8;

    v5->_activeLockCount = [v4 decodeIntegerForKey:@"activeLockCount"];
    v5->_maximumLockCount = [v4 decodeIntegerForKey:@"maximumLockCount"];
    v5->_totalLockCount = [v4 decodeIntegerForKey:@"totalLockCount"];
    v5->_continueCount = [v4 decodeIntegerForKey:@"continueLockCount"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstLockTimestamp"];
    firstLockTimestamp = v5->_firstLockTimestamp;
    v5->_firstLockTimestamp = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastRefreshTimestamp"];
    lastRefreshTimestamp = v5->_lastRefreshTimestamp;
    v5->_lastRefreshTimestamp = (NSDate *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MAAutoAssetSetLockTracker *)self clientLockReason];
  [v4 encodeObject:v5 forKey:@"clientLockReason"];

  uint64_t v6 = [(MAAutoAssetSetLockTracker *)self lockUsagePolicy];
  [v4 encodeObject:v6 forKey:@"lockUsagePolicy"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSetLockTracker activeLockCount](self, "activeLockCount"), @"activeLockCount");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSetLockTracker maximumLockCount](self, "maximumLockCount"), @"maximumLockCount");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSetLockTracker totalLockCount](self, "totalLockCount"), @"totalLockCount");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSetLockTracker continueCount](self, "continueCount"), @"continueLockCount");
  id v7 = [(MAAutoAssetSetLockTracker *)self firstLockTimestamp];
  [v4 encodeObject:v7 forKey:@"firstLockTimestamp"];

  id v8 = [(MAAutoAssetSetLockTracker *)self lastRefreshTimestamp];
  [v4 encodeObject:v8 forKey:@"lastRefreshTimestamp"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v3 = [MAAutoAssetSetLockTracker alloc];
  id v4 = [(MAAutoAssetSetLockTracker *)self clientLockReason];
  v5 = [(MAAutoAssetSetLockTracker *)self lockUsagePolicy];
  id v6 = [(MAAutoAssetSetLockTracker *)v3 initForClientLockReason:v4 lockingWithUsagePolicy:v5];

  objc_msgSend(v6, "setActiveLockCount:", -[MAAutoAssetSetLockTracker activeLockCount](self, "activeLockCount"));
  objc_msgSend(v6, "setMaximumLockCount:", -[MAAutoAssetSetLockTracker maximumLockCount](self, "maximumLockCount"));
  objc_msgSend(v6, "setTotalLockCount:", -[MAAutoAssetSetLockTracker totalLockCount](self, "totalLockCount"));
  objc_msgSend(v6, "setContinueCount:", -[MAAutoAssetSetLockTracker continueCount](self, "continueCount"));
  id v7 = [(MAAutoAssetSetLockTracker *)self firstLockTimestamp];
  id v8 = (void *)[v7 copy];
  [v6 setFirstLockTimestamp:v8];

  v9 = [(MAAutoAssetSetLockTracker *)self lastRefreshTimestamp];
  uint64_t v10 = (void *)[v9 copy];
  [v6 setLastRefreshTimestamp:v10];

  return v6;
}

- (id)description
{
  v3 = NSString;
  v16 = [(MAAutoAssetSetLockTracker *)self clientLockReason];
  id v4 = [v16 summary];
  v5 = [(MAAutoAssetSetLockTracker *)self lockUsagePolicy];
  if (v5)
  {
    objc_super v15 = [(MAAutoAssetSetLockTracker *)self lockUsagePolicy];
    id v6 = [v15 summary];
  }
  else
  {
    id v6 = @"NONE";
  }
  int64_t v7 = [(MAAutoAssetSetLockTracker *)self activeLockCount];
  int64_t v8 = [(MAAutoAssetSetLockTracker *)self maximumLockCount];
  int64_t v9 = [(MAAutoAssetSetLockTracker *)self totalLockCount];
  int64_t v10 = [(MAAutoAssetSetLockTracker *)self continueCount];
  uint64_t v11 = [(MAAutoAssetSetLockTracker *)self firstLockTimestamp];
  uint64_t v12 = [(MAAutoAssetSetLockTracker *)self lastRefreshTimestamp];
  v13 = [v3 stringWithFormat:@">>>\n        clientLockReason: %@\n         lockUsagePolicy: %@\n         activeLockCount: %lld\n        maximumLockCount: %lld\n          totalLockCount: %lld\n           continueCount: %lld\n      firstLockTimestamp: %@\n    lastRefreshTimestamp: %@\n<<<]", v4, v6, v7, v8, v9, v10, v11, v12];

  if (v5)
  {
  }
  return v13;
}

- (id)summary
{
  v3 = [(MAAutoAssetSetLockTracker *)self clientLockReason];
  v19 = [v3 summary];

  id v4 = [(MAAutoAssetSetLockTracker *)self lockUsagePolicy];
  if (v4)
  {
    v5 = [(MAAutoAssetSetLockTracker *)self lockUsagePolicy];
    id v6 = [v5 summary];
  }
  else
  {
    id v6 = @"NONE";
  }

  int64_t v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetLockTracker activeLockCount](self, "activeLockCount"));
  int64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetLockTracker maximumLockCount](self, "maximumLockCount"));
  int64_t v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetLockTracker totalLockCount](self, "totalLockCount"));
  int64_t v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetLockTracker continueCount](self, "continueCount"));
  id v11 = [NSString alloc];
  uint64_t v12 = [(MAAutoAssetSetLockTracker *)self firstLockTimestamp];
  v13 = (void *)[v11 initWithFormat:@"%@", v12];

  id v14 = [NSString alloc];
  objc_super v15 = [(MAAutoAssetSetLockTracker *)self lastRefreshTimestamp];
  v16 = (void *)[v14 initWithFormat:@"%@", v15];

  v17 = [NSString stringWithFormat:@"clientReason:%@|policy:%@|locks active:%@, max:%@, total:%@|continues:%@|first:%@|last:%@", v19, v6, v7, v8, v9, v10, v13, v16];

  return v17;
}

- (void)summaryBuildMaxColumnStrings:(id)a3
{
  id v43 = a3;
  id v4 = [(MAAutoAssetSetLockTracker *)self clientLockReason];
  v42 = [v4 summary];

  v5 = [(MAAutoAssetSetLockTracker *)self lockUsagePolicy];
  if (v5)
  {
    id v6 = [(MAAutoAssetSetLockTracker *)self lockUsagePolicy];
    int64_t v7 = [v6 summary];
  }
  else
  {
    int64_t v7 = @"NONE";
  }

  int64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetLockTracker activeLockCount](self, "activeLockCount"));
  int64_t v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetLockTracker maximumLockCount](self, "maximumLockCount"));
  int64_t v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetLockTracker totalLockCount](self, "totalLockCount"));
  id v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetLockTracker continueCount](self, "continueCount"));
  id v12 = [NSString alloc];
  v13 = [(MAAutoAssetSetLockTracker *)self firstLockTimestamp];
  id v14 = (void *)[v12 initWithFormat:@"%@", v13];

  id v15 = [NSString alloc];
  v16 = [(MAAutoAssetSetLockTracker *)self lastRefreshTimestamp];
  v17 = (void *)[v15 initWithFormat:@"%@", v16];

  unint64_t v18 = [v42 length];
  v19 = [v43 safeStringForKey:@"clientLockReason"];
  unint64_t v20 = [v19 length];

  if (v18 > v20) {
    [v43 setSafeObject:v42 forKey:@"clientLockReason"];
  }
  unint64_t v21 = [(__CFString *)v7 length];
  v22 = [v43 safeStringForKey:@"lockUsagePolicy"];
  unint64_t v23 = [v22 length];

  if (v21 > v23) {
    [v43 setSafeObject:v7 forKey:@"lockUsagePolicy"];
  }
  unint64_t v24 = [v8 length];
  v25 = [v43 safeStringForKey:@"activeLockCount"];
  unint64_t v26 = [v25 length];

  if (v24 > v26) {
    [v43 setSafeObject:v8 forKey:@"activeLockCount"];
  }
  unint64_t v27 = [v9 length];
  v28 = [v43 safeStringForKey:@"maximumLockCount"];
  unint64_t v29 = [v28 length];

  if (v27 > v29) {
    [v43 setSafeObject:v9 forKey:@"maximumLockCount"];
  }
  unint64_t v30 = [v10 length];
  v31 = [v43 safeStringForKey:@"totalLockCount"];
  unint64_t v32 = [v31 length];

  if (v30 > v32) {
    [v43 setSafeObject:v10 forKey:@"totalLockCount"];
  }
  unint64_t v33 = [v11 length];
  v34 = [v43 safeStringForKey:@"continueLockCount"];
  unint64_t v35 = [v34 length];

  if (v33 > v35) {
    [v43 setSafeObject:v11 forKey:@"continueLockCount"];
  }
  unint64_t v36 = [v14 length];
  v37 = [v43 safeStringForKey:@"firstLockTimestamp"];
  unint64_t v38 = [v37 length];

  if (v36 > v38) {
    [v43 setSafeObject:v14 forKey:@"firstLockTimestamp"];
  }
  unint64_t v39 = [v17 length];
  v40 = [v43 safeStringForKey:@"lastRefreshTimestamp"];
  unint64_t v41 = [v40 length];

  if (v39 > v41) {
    [v43 setSafeObject:v17 forKey:@"lastRefreshTimestamp"];
  }
}

- (id)summaryPadded:(id)a3
{
  id v4 = a3;
  v5 = [(MAAutoAssetSetLockTracker *)self clientLockReason];
  unint64_t v38 = [v5 summary];

  id v6 = [(MAAutoAssetSetLockTracker *)self lockUsagePolicy];
  if (v6)
  {
    int64_t v7 = [(MAAutoAssetSetLockTracker *)self lockUsagePolicy];
    v37 = [v7 summary];
  }
  else
  {
    v37 = @"NONE";
  }

  unint64_t v36 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetLockTracker activeLockCount](self, "activeLockCount"));
  unint64_t v30 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetLockTracker maximumLockCount](self, "maximumLockCount"));
  unint64_t v26 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetLockTracker totalLockCount](self, "totalLockCount"));
  unint64_t v35 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetSetLockTracker continueCount](self, "continueCount"));
  id v8 = [NSString alloc];
  int64_t v9 = [(MAAutoAssetSetLockTracker *)self firstLockTimestamp];
  v34 = (void *)[v8 initWithFormat:@"%@", v9];

  id v10 = [NSString alloc];
  id v11 = [(MAAutoAssetSetLockTracker *)self lastRefreshTimestamp];
  unint64_t v33 = (void *)[v10 initWithFormat:@"%@", v11];

  id v27 = (id)NSString;
  unint64_t v32 = [v4 safeStringForKey:@"clientLockReason"];
  v25 = +[MAAutoAssetSetLockTracker summaryPaddedString:v38 paddingToLenghtOfString:v32 paddingWith:@" " paddingBefore:0];
  v31 = [v4 safeStringForKey:@"lockUsagePolicy"];
  unint64_t v23 = +[MAAutoAssetSetLockTracker summaryPaddedString:v37 paddingToLenghtOfString:v31 paddingWith:@" " paddingBefore:0];
  unint64_t v29 = [v4 safeStringForKey:@"activeLockCount"];
  unint64_t v21 = +[MAAutoAssetSetLockTracker summaryPaddedString:v36 paddingToLenghtOfString:v29 paddingWith:@" " paddingBefore:1];
  unint64_t v24 = [v4 safeStringForKey:@"maximumLockCount"];
  id v12 = +[MAAutoAssetSetLockTracker summaryPaddedString:v30 paddingToLenghtOfString:v24 paddingWith:@" " paddingBefore:1];
  v22 = [v4 safeStringForKey:@"totalLockCount"];
  v13 = +[MAAutoAssetSetLockTracker summaryPaddedString:v26 paddingToLenghtOfString:v22 paddingWith:@" " paddingBefore:1];
  unint64_t v20 = [v4 safeStringForKey:@"continueLockCount"];
  id v14 = +[MAAutoAssetSetLockTracker summaryPaddedString:v35 paddingToLenghtOfString:v20 paddingWith:@" " paddingBefore:1];
  id v15 = [v4 safeStringForKey:@"firstLockTimestamp"];
  v16 = +[MAAutoAssetSetLockTracker summaryPaddedString:v34 paddingToLenghtOfString:v15 paddingWith:@" " paddingBefore:1];
  v17 = [v4 safeStringForKey:@"lastRefreshTimestamp"];

  unint64_t v18 = +[MAAutoAssetSetLockTracker summaryPaddedString:v33 paddingToLenghtOfString:v17 paddingWith:@" " paddingBefore:1];
  id v28 = [v27 stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@", v25, v23, v21, v12, v13, v14, v16, v18];

  return v28;
}

+ (id)summaryNewMaxColumnStrings
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v2 setSafeObject:@"clientLockReason" forKey:@"clientLockReason"];
  [v2 setSafeObject:@"lockUsagePolicy" forKey:@"lockUsagePolicy"];
  [v2 setSafeObject:@"activeLockCount" forKey:@"activeLockCount"];
  [v2 setSafeObject:@"maximumLockCount" forKey:@"maximumLockCount"];
  [v2 setSafeObject:@"totalLockCount" forKey:@"totalLockCount"];
  [v2 setSafeObject:@"continueLockCount" forKey:@"continueLockCount"];
  [v2 setSafeObject:@"firstLockTimestamp" forKey:@"firstLockTimestamp"];
  [v2 setSafeObject:@"lastRefreshTimestamp" forKey:@"lastRefreshTimestamp"];
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
  id v14 = v12;
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
    id v14 = (void *)v20;
  }
  return v14;
}

+ (id)summaryPaddedHeader:(id)a3
{
  id v19 = NSString;
  id v3 = a3;
  v22 = [v3 safeStringForKey:@"clientLockReason"];
  v17 = +[MAAutoAssetSetLockTracker summaryPaddedString:@"clientLockReason" paddingToLenghtOfString:v22 paddingWith:@" " paddingBefore:0];
  unint64_t v21 = [v3 safeStringForKey:@"lockUsagePolicy"];
  uint64_t v15 = +[MAAutoAssetSetLockTracker summaryPaddedString:@"lockUsagePolicy" paddingToLenghtOfString:v21 paddingWith:@" " paddingBefore:0];
  unint64_t v18 = [v3 safeStringForKey:@"activeLockCount"];
  unint64_t v13 = +[MAAutoAssetSetLockTracker summaryPaddedString:@"activeLockCount" paddingToLenghtOfString:v18 paddingWith:@" " paddingBefore:0];
  uint64_t v16 = [v3 safeStringForKey:@"maximumLockCount"];
  id v11 = +[MAAutoAssetSetLockTracker summaryPaddedString:@"maximumLockCount" paddingToLenghtOfString:v16 paddingWith:@" " paddingBefore:0];
  id v14 = [v3 safeStringForKey:@"totalLockCount"];
  id v4 = +[MAAutoAssetSetLockTracker summaryPaddedString:@"totalLockCount" paddingToLenghtOfString:v14 paddingWith:@" " paddingBefore:0];
  id v12 = [v3 safeStringForKey:@"continueLockCount"];
  v5 = +[MAAutoAssetSetLockTracker summaryPaddedString:@"continueLockCount" paddingToLenghtOfString:v12 paddingWith:@" " paddingBefore:0];
  BOOL v6 = [v3 safeStringForKey:@"firstLockTimestamp"];
  int64_t v7 = +[MAAutoAssetSetLockTracker summaryPaddedString:@"firstLockTimestamp" paddingToLenghtOfString:v6 paddingWith:@" " paddingBefore:0];
  id v8 = [v3 safeStringForKey:@"lastRefreshTimestamp"];

  id v9 = +[MAAutoAssetSetLockTracker summaryPaddedString:@"lastRefreshTimestamp" paddingToLenghtOfString:v8 paddingWith:@" " paddingBefore:0];
  uint64_t v20 = [v19 stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@", v17, v15, v13, v11, v4, v5, v7, v9];

  return v20;
}

+ (id)summaryPaddedBanner:(id)a3
{
  id v19 = NSString;
  id v3 = a3;
  v22 = [v3 safeStringForKey:@"clientLockReason"];
  v17 = +[MAAutoAssetSetLockTracker summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v22 paddingWith:@"=" paddingBefore:0];
  unint64_t v21 = [v3 safeStringForKey:@"lockUsagePolicy"];
  uint64_t v15 = +[MAAutoAssetSetLockTracker summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v21 paddingWith:@"=" paddingBefore:0];
  unint64_t v18 = [v3 safeStringForKey:@"activeLockCount"];
  unint64_t v13 = +[MAAutoAssetSetLockTracker summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v18 paddingWith:@"=" paddingBefore:0];
  uint64_t v16 = [v3 safeStringForKey:@"maximumLockCount"];
  id v11 = +[MAAutoAssetSetLockTracker summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v16 paddingWith:@"=" paddingBefore:0];
  id v14 = [v3 safeStringForKey:@"totalLockCount"];
  id v4 = +[MAAutoAssetSetLockTracker summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v14 paddingWith:@"=" paddingBefore:0];
  id v12 = [v3 safeStringForKey:@"continueLockCount"];
  v5 = +[MAAutoAssetSetLockTracker summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v12 paddingWith:@"=" paddingBefore:0];
  BOOL v6 = [v3 safeStringForKey:@"firstLockTimestamp"];
  int64_t v7 = +[MAAutoAssetSetLockTracker summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v6 paddingWith:@"=" paddingBefore:0];
  id v8 = [v3 safeStringForKey:@"lastRefreshTimestamp"];

  id v9 = +[MAAutoAssetSetLockTracker summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v8 paddingWith:@"=" paddingBefore:0];
  uint64_t v20 = [v19 stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@", v17, v15, v13, v11, v4, v5, v7, v9];

  return v20;
}

- (MAAutoAssetLockReason)clientLockReason
{
  return self->_clientLockReason;
}

- (MAAutoAssetSetPolicy)lockUsagePolicy
{
  return self->_lockUsagePolicy;
}

- (void)setLockUsagePolicy:(id)a3
{
}

- (int64_t)activeLockCount
{
  return self->_activeLockCount;
}

- (void)setActiveLockCount:(int64_t)a3
{
  self->_activeLockCount = a3;
}

- (int64_t)maximumLockCount
{
  return self->_maximumLockCount;
}

- (void)setMaximumLockCount:(int64_t)a3
{
  self->_maximumLockCount = a3;
}

- (int64_t)totalLockCount
{
  return self->_totalLockCount;
}

- (void)setTotalLockCount:(int64_t)a3
{
  self->_totalLockCount = a3;
}

- (int64_t)continueCount
{
  return self->_continueCount;
}

- (void)setContinueCount:(int64_t)a3
{
  self->_continueCount = a3;
}

- (NSDate)firstLockTimestamp
{
  return self->_firstLockTimestamp;
}

- (void)setFirstLockTimestamp:(id)a3
{
}

- (NSDate)lastRefreshTimestamp
{
  return self->_lastRefreshTimestamp;
}

- (void)setLastRefreshTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRefreshTimestamp, 0);
  objc_storeStrong((id *)&self->_firstLockTimestamp, 0);
  objc_storeStrong((id *)&self->_lockUsagePolicy, 0);
  objc_storeStrong((id *)&self->_clientLockReason, 0);
}

@end