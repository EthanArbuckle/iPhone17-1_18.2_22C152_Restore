@interface MAAutoAssetLockTracker
+ (BOOL)supportsSecureCoding;
+ (id)summaryNewMaxColumnStrings;
+ (id)summaryPaddedBanner:(id)a3;
+ (id)summaryPaddedHeader:(id)a3;
+ (id)summaryPaddedString:(id)a3 paddingToLenghtOfString:(id)a4 paddingWith:(id)a5 paddingBefore:(BOOL)a6;
- (MAAutoAssetLockReason)clientLockReason;
- (MAAutoAssetLockTracker)initWithCoder:(id)a3;
- (MAAutoAssetPolicy)lockUsagePolicy;
- (NSDate)firstLockTimestamp;
- (NSDate)lastRefreshTimestamp;
- (NSString)clientProcessName;
- (id)_initForClientLockReason:(id)a3 forClientProcessName:(id)a4 withClientProcessID:(int64_t)a5 lockingWithUsagePolicy:(id)a6;
- (id)copy;
- (id)description;
- (id)initForClientLockReason:(id)a3 lockingWithUsagePolicy:(id)a4;
- (id)newSummaryDictionary;
- (id)summary;
- (id)summaryPadded:(id)a3;
- (int64_t)activeLockCount;
- (int64_t)clientProcessID;
- (int64_t)continueCount;
- (int64_t)maximumLockCount;
- (int64_t)totalLockCount;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveLockCount:(int64_t)a3;
- (void)setClientProcessID:(int64_t)a3;
- (void)setClientProcessName:(id)a3;
- (void)setContinueCount:(int64_t)a3;
- (void)setFirstLockTimestamp:(id)a3;
- (void)setLastRefreshTimestamp:(id)a3;
- (void)setLockUsagePolicy:(id)a3;
- (void)setMaximumLockCount:(int64_t)a3;
- (void)setTotalLockCount:(int64_t)a3;
- (void)summaryBuildMaxColumnStrings:(id)a3;
@end

@implementation MAAutoAssetLockTracker

- (id)initForClientLockReason:(id)a3 lockingWithUsagePolicy:(id)a4
{
  return [(MAAutoAssetLockTracker *)self _initForClientLockReason:a3 forClientProcessName:0 withClientProcessID:0 lockingWithUsagePolicy:a4];
}

- (id)_initForClientLockReason:(id)a3 forClientProcessName:(id)a4 withClientProcessID:(int64_t)a5 lockingWithUsagePolicy:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MAAutoAssetLockTracker;
  v14 = [(MAAutoAssetLockTracker *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_clientLockReason, a3);
    objc_storeStrong((id *)&v15->_clientProcessName, a4);
    v15->_clientProcessID = a5;
    objc_storeStrong((id *)&v15->_lockUsagePolicy, a6);
    *(int64x2_t *)&v15->_activeLockCount = vdupq_n_s64(1uLL);
    *(_OWORD *)&v15->_totalLockCount = xmmword_1B27E3520;
    uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
    firstLockTimestamp = v15->_firstLockTimestamp;
    v15->_firstLockTimestamp = (NSDate *)v16;

    objc_storeStrong((id *)&v15->_lastRefreshTimestamp, v15->_firstLockTimestamp);
  }

  return v15;
}

- (MAAutoAssetLockTracker)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MAAutoAssetLockTracker;
  v5 = [(MAAutoAssetLockTracker *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientLockReason"];
    clientLockReason = v5->_clientLockReason;
    v5->_clientLockReason = (MAAutoAssetLockReason *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientProcessName"];
    clientProcessName = v5->_clientProcessName;
    v5->_clientProcessName = (NSString *)v8;

    v5->_clientProcessID = [v4 decodeIntegerForKey:@"clientProcessID"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lockUsagePolicy"];
    lockUsagePolicy = v5->_lockUsagePolicy;
    v5->_lockUsagePolicy = (MAAutoAssetPolicy *)v10;

    v5->_activeLockCount = [v4 decodeIntegerForKey:@"activeLockCount"];
    v5->_maximumLockCount = [v4 decodeIntegerForKey:@"maximumLockCount"];
    v5->_totalLockCount = [v4 decodeIntegerForKey:@"totalLockCount"];
    v5->_continueCount = [v4 decodeIntegerForKey:@"continueLockCount"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstLockTimestamp"];
    firstLockTimestamp = v5->_firstLockTimestamp;
    v5->_firstLockTimestamp = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastRefreshTimestamp"];
    lastRefreshTimestamp = v5->_lastRefreshTimestamp;
    v5->_lastRefreshTimestamp = (NSDate *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MAAutoAssetLockTracker *)self clientLockReason];
  [v4 encodeObject:v5 forKey:@"clientLockReason"];

  uint64_t v6 = [(MAAutoAssetLockTracker *)self clientProcessName];
  [v4 encodeObject:v6 forKey:@"clientProcessName"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetLockTracker clientProcessID](self, "clientProcessID"), @"clientProcessID");
  v7 = [(MAAutoAssetLockTracker *)self lockUsagePolicy];
  [v4 encodeObject:v7 forKey:@"lockUsagePolicy"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetLockTracker activeLockCount](self, "activeLockCount"), @"activeLockCount");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetLockTracker maximumLockCount](self, "maximumLockCount"), @"maximumLockCount");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetLockTracker totalLockCount](self, "totalLockCount"), @"totalLockCount");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetLockTracker continueCount](self, "continueCount"), @"continueLockCount");
  uint64_t v8 = [(MAAutoAssetLockTracker *)self firstLockTimestamp];
  [v4 encodeObject:v8 forKey:@"firstLockTimestamp"];

  id v9 = [(MAAutoAssetLockTracker *)self lastRefreshTimestamp];
  [v4 encodeObject:v9 forKey:@"lastRefreshTimestamp"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v3 = [MAAutoAssetLockTracker alloc];
  id v4 = [(MAAutoAssetLockTracker *)self clientLockReason];
  v5 = [(MAAutoAssetLockTracker *)self lockUsagePolicy];
  id v6 = [(MAAutoAssetLockTracker *)v3 initForClientLockReason:v4 lockingWithUsagePolicy:v5];

  v7 = [(MAAutoAssetLockTracker *)self clientProcessName];
  [v6 setClientProcessName:v7];

  objc_msgSend(v6, "setClientProcessID:", -[MAAutoAssetLockTracker clientProcessID](self, "clientProcessID"));
  objc_msgSend(v6, "setActiveLockCount:", -[MAAutoAssetLockTracker activeLockCount](self, "activeLockCount"));
  objc_msgSend(v6, "setMaximumLockCount:", -[MAAutoAssetLockTracker maximumLockCount](self, "maximumLockCount"));
  objc_msgSend(v6, "setTotalLockCount:", -[MAAutoAssetLockTracker totalLockCount](self, "totalLockCount"));
  objc_msgSend(v6, "setContinueCount:", -[MAAutoAssetLockTracker continueCount](self, "continueCount"));
  uint64_t v8 = [(MAAutoAssetLockTracker *)self firstLockTimestamp];
  id v9 = (void *)[v8 copy];
  [v6 setFirstLockTimestamp:v9];

  uint64_t v10 = [(MAAutoAssetLockTracker *)self lastRefreshTimestamp];
  id v11 = (void *)[v10 copy];
  [v6 setLastRefreshTimestamp:v11];

  return v6;
}

- (id)description
{
  objc_super v17 = NSString;
  objc_super v19 = [(MAAutoAssetLockTracker *)self clientLockReason];
  v3 = [v19 summary];
  id v4 = [(MAAutoAssetLockTracker *)self clientProcessName];
  if (v4)
  {
    v18 = [(MAAutoAssetLockTracker *)self clientProcessName];
  }
  else
  {
    v18 = @"N";
  }
  int64_t v16 = [(MAAutoAssetLockTracker *)self clientProcessID];
  v5 = [(MAAutoAssetLockTracker *)self lockUsagePolicy];
  if (v5)
  {
    v15 = [(MAAutoAssetLockTracker *)self lockUsagePolicy];
    id v6 = [v15 summary];
  }
  else
  {
    id v6 = @"NONE";
  }
  int64_t v7 = [(MAAutoAssetLockTracker *)self activeLockCount];
  int64_t v8 = [(MAAutoAssetLockTracker *)self maximumLockCount];
  int64_t v9 = [(MAAutoAssetLockTracker *)self totalLockCount];
  int64_t v10 = [(MAAutoAssetLockTracker *)self continueCount];
  id v11 = [(MAAutoAssetLockTracker *)self firstLockTimestamp];
  uint64_t v12 = [(MAAutoAssetLockTracker *)self lastRefreshTimestamp];
  id v13 = [v17 stringWithFormat:@">>>\n        clientLockReason: %@\n       clientProcessName: %@\n         clientProcessID: %ld\n         lockUsagePolicy: %@\n         activeLockCount: %lld\n        maximumLockCount: %lld\n          totalLockCount: %lld\n           continueCount: %lld\n      firstLockTimestamp: %@\n    lastRefreshTimestamp: %@\n<<<]", v3, v18, v16, v6, v7, v8, v9, v10, v11, v12];

  if (v5)
  {
  }
  if (v4) {

  }
  return v13;
}

- (id)summary
{
  v3 = [(MAAutoAssetLockTracker *)self clientLockReason];
  v23 = [v3 summary];

  id v4 = [(MAAutoAssetLockTracker *)self clientProcessName];
  if (v4)
  {
    id v5 = [NSString alloc];
    id v6 = [(MAAutoAssetLockTracker *)self clientProcessName];
    v22 = (__CFString *)[v5 initWithFormat:@"%@(%ld)", v6, -[MAAutoAssetLockTracker clientProcessID](self, "clientProcessID")];
  }
  else
  {
    v22 = @"N";
  }

  int64_t v7 = [(MAAutoAssetLockTracker *)self lockUsagePolicy];
  if (v7)
  {
    int64_t v8 = [(MAAutoAssetLockTracker *)self lockUsagePolicy];
    int64_t v9 = [v8 summary];
  }
  else
  {
    int64_t v9 = @"NONE";
  }

  int64_t v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetLockTracker activeLockCount](self, "activeLockCount"));
  id v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetLockTracker maximumLockCount](self, "maximumLockCount"));
  uint64_t v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetLockTracker totalLockCount](self, "totalLockCount"));
  id v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetLockTracker continueCount](self, "continueCount"));
  id v14 = [NSString alloc];
  v15 = [(MAAutoAssetLockTracker *)self firstLockTimestamp];
  int64_t v16 = (void *)[v14 initWithFormat:@"%@", v15];

  id v17 = [NSString alloc];
  v18 = [(MAAutoAssetLockTracker *)self lastRefreshTimestamp];
  objc_super v19 = (void *)[v17 initWithFormat:@"%@", v18];

  v20 = [NSString stringWithFormat:@"clientReason:%@|clientProcess:%@|policy:%@|locks active:%@, max:%@, total:%@|continues:%@|first:%@|last:%@", v23, v22, v9, v10, v11, v12, v13, v16, v19];

  return v20;
}

- (id)newSummaryDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v5 = [(MAAutoAssetLockTracker *)self clientLockReason];
  id v6 = (void *)[v5 newSummaryDictionary];
  [v3 setSafeObject:v6 forKey:@"clientLockReason"];

  int64_t v7 = [(MAAutoAssetLockTracker *)self clientProcessName];
  [v3 setSafeObject:v7 forKey:@"clientProcessName"];

  int64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[MAAutoAssetLockTracker clientProcessID](self, "clientProcessID"));
  [v3 setSafeObject:v8 forKey:@"clientProcessID"];

  int64_t v9 = [(MAAutoAssetLockTracker *)self lockUsagePolicy];
  int64_t v10 = (void *)[v9 newSummaryDictionary];
  [v3 setSafeObject:v10 forKey:@"lockUsagePolicy"];

  id v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[MAAutoAssetLockTracker activeLockCount](self, "activeLockCount"));
  [v3 setSafeObject:v11 forKey:@"activeLockCount"];

  uint64_t v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[MAAutoAssetLockTracker maximumLockCount](self, "maximumLockCount"));
  [v3 setSafeObject:v12 forKey:@"maximumLockCount"];

  id v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[MAAutoAssetLockTracker totalLockCount](self, "totalLockCount"));
  [v3 setSafeObject:v13 forKey:@"totalLockCount"];

  id v14 = objc_msgSend(NSNumber, "numberWithInteger:", -[MAAutoAssetLockTracker continueCount](self, "continueCount"));
  [v3 setSafeObject:v14 forKey:@"continueLockCount"];

  [v4 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  v15 = [(MAAutoAssetLockTracker *)self firstLockTimestamp];
  int64_t v16 = [v4 stringFromDate:v15];
  [v3 setSafeObject:v16 forKey:@"firstLockTimestamp"];

  id v17 = [(MAAutoAssetLockTracker *)self lastRefreshTimestamp];
  v18 = [v4 stringFromDate:v17];
  [v3 setSafeObject:v18 forKey:@"lastRefreshTimestamp"];

  return v3;
}

- (void)summaryBuildMaxColumnStrings:(id)a3
{
  id v53 = a3;
  id v4 = [(MAAutoAssetLockTracker *)self clientLockReason];
  uint64_t v5 = [v4 summary];

  id v6 = [(MAAutoAssetLockTracker *)self clientProcessName];
  v49 = (void *)v5;
  if (v6)
  {
    v52 = [(MAAutoAssetLockTracker *)self clientProcessName];
  }
  else
  {
    v52 = @"NONE";
  }

  v51 = objc_msgSend([NSString alloc], "initWithFormat:", @"%ld", -[MAAutoAssetLockTracker clientProcessID](self, "clientProcessID"));
  int64_t v7 = [(MAAutoAssetLockTracker *)self lockUsagePolicy];
  if (v7)
  {
    int64_t v8 = [(MAAutoAssetLockTracker *)self lockUsagePolicy];
    v50 = [v8 summary];
  }
  else
  {
    v50 = @"NONE";
  }

  int64_t v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetLockTracker activeLockCount](self, "activeLockCount"));
  int64_t v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetLockTracker maximumLockCount](self, "maximumLockCount"));
  id v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetLockTracker totalLockCount](self, "totalLockCount"));
  uint64_t v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetLockTracker continueCount](self, "continueCount"));
  id v13 = [NSString alloc];
  id v14 = [(MAAutoAssetLockTracker *)self firstLockTimestamp];
  v15 = (void *)[v13 initWithFormat:@"%@", v14];

  id v16 = [NSString alloc];
  id v17 = [(MAAutoAssetLockTracker *)self lastRefreshTimestamp];
  v18 = (void *)[v16 initWithFormat:@"%@", v17];

  unint64_t v19 = [v49 length];
  v20 = [v53 safeStringForKey:@"clientLockReason"];
  unint64_t v21 = [v20 length];

  if (v19 > v21) {
    [v53 setSafeObject:v49 forKey:@"clientLockReason"];
  }
  unint64_t v22 = [(__CFString *)v52 length];
  v23 = [v53 safeStringForKey:@"clientProcessName"];
  unint64_t v24 = [v23 length];

  if (v22 > v24) {
    [v53 setSafeObject:v52 forKey:@"clientProcessName"];
  }
  unint64_t v25 = [v51 length];
  v26 = [v53 safeStringForKey:@"clientProcessID"];
  unint64_t v27 = [v26 length];

  if (v25 > v27) {
    [v53 setSafeObject:v51 forKey:@"clientProcessID"];
  }
  unint64_t v28 = [(__CFString *)v50 length];
  v29 = [v53 safeStringForKey:@"lockUsagePolicy"];
  unint64_t v30 = [v29 length];

  if (v28 > v30) {
    [v53 setSafeObject:v50 forKey:@"lockUsagePolicy"];
  }
  unint64_t v31 = [v9 length];
  v32 = [v53 safeStringForKey:@"activeLockCount"];
  unint64_t v33 = [v32 length];

  if (v31 > v33) {
    [v53 setSafeObject:v9 forKey:@"activeLockCount"];
  }
  unint64_t v34 = [v10 length];
  v35 = [v53 safeStringForKey:@"maximumLockCount"];
  unint64_t v36 = [v35 length];

  if (v34 > v36) {
    [v53 setSafeObject:v10 forKey:@"maximumLockCount"];
  }
  unint64_t v37 = [v11 length];
  v38 = [v53 safeStringForKey:@"totalLockCount"];
  unint64_t v39 = [v38 length];

  if (v37 > v39) {
    [v53 setSafeObject:v11 forKey:@"totalLockCount"];
  }
  unint64_t v40 = [v12 length];
  v41 = [v53 safeStringForKey:@"continueLockCount"];
  unint64_t v42 = [v41 length];

  if (v40 > v42) {
    [v53 setSafeObject:v12 forKey:@"continueLockCount"];
  }
  unint64_t v43 = [v15 length];
  v44 = [v53 safeStringForKey:@"firstLockTimestamp"];
  unint64_t v45 = [v44 length];

  if (v43 > v45) {
    [v53 setSafeObject:v15 forKey:@"firstLockTimestamp"];
  }
  unint64_t v46 = [v18 length];
  v47 = [v53 safeStringForKey:@"lastRefreshTimestamp"];
  unint64_t v48 = [v47 length];

  if (v46 > v48) {
    [v53 setSafeObject:v18 forKey:@"lastRefreshTimestamp"];
  }
}

- (id)summaryPadded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MAAutoAssetLockTracker *)self clientLockReason];
  unint64_t v45 = [v5 summary];

  id v6 = [(MAAutoAssetLockTracker *)self clientProcessName];
  if (v6)
  {
    v44 = [(MAAutoAssetLockTracker *)self clientProcessName];
  }
  else
  {
    v44 = @"NONE";
  }

  unint64_t v43 = objc_msgSend([NSString alloc], "initWithFormat:", @"%ld", -[MAAutoAssetLockTracker clientProcessID](self, "clientProcessID"));
  int64_t v7 = [(MAAutoAssetLockTracker *)self lockUsagePolicy];
  if (v7)
  {
    int64_t v8 = [(MAAutoAssetLockTracker *)self lockUsagePolicy];
    unint64_t v42 = [v8 summary];
  }
  else
  {
    unint64_t v42 = @"NONE";
  }

  v41 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetLockTracker activeLockCount](self, "activeLockCount"));
  unint64_t v37 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetLockTracker maximumLockCount](self, "maximumLockCount"));
  v29 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetLockTracker totalLockCount](self, "totalLockCount"));
  unint64_t v40 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", -[MAAutoAssetLockTracker continueCount](self, "continueCount"));
  id v9 = [NSString alloc];
  int64_t v10 = [(MAAutoAssetLockTracker *)self firstLockTimestamp];
  unint64_t v39 = (void *)[v9 initWithFormat:@"%@", v10];

  id v11 = [NSString alloc];
  uint64_t v12 = [(MAAutoAssetLockTracker *)self lastRefreshTimestamp];
  v38 = (void *)[v11 initWithFormat:@"%@", v12];

  id v31 = (id)NSString;
  v35 = [v4 safeStringForKey:@"clientLockReason"];
  unint64_t v36 = +[MAAutoAssetLockTracker summaryPaddedString:v45 paddingToLenghtOfString:v35 paddingWith:@" " paddingBefore:0];
  unint64_t v34 = [v4 safeStringForKey:@"clientProcessName"];
  unint64_t v27 = +[MAAutoAssetLockTracker summaryPaddedString:v44 paddingToLenghtOfString:v34 paddingWith:@" " paddingBefore:0];
  unint64_t v33 = [v4 safeStringForKey:@"clientProcessID"];
  v26 = +[MAAutoAssetLockTracker summaryPaddedString:v43 paddingToLenghtOfString:v33 paddingWith:@" " paddingBefore:0];
  unint64_t v30 = [v4 safeStringForKey:@"lockUsagePolicy"];
  unint64_t v24 = +[MAAutoAssetLockTracker summaryPaddedString:v42 paddingToLenghtOfString:v30 paddingWith:@" " paddingBefore:0];
  unint64_t v28 = [v4 safeStringForKey:@"activeLockCount"];
  id v13 = +[MAAutoAssetLockTracker summaryPaddedString:v41 paddingToLenghtOfString:v28 paddingWith:@" " paddingBefore:1];
  unint64_t v25 = [v4 safeStringForKey:@"maximumLockCount"];
  unint64_t v21 = +[MAAutoAssetLockTracker summaryPaddedString:v37 paddingToLenghtOfString:v25 paddingWith:@" " paddingBefore:1];
  v23 = [v4 safeStringForKey:@"totalLockCount"];
  id v14 = +[MAAutoAssetLockTracker summaryPaddedString:v29 paddingToLenghtOfString:v23 paddingWith:@" " paddingBefore:1];
  unint64_t v22 = [v4 safeStringForKey:@"continueLockCount"];
  v15 = +[MAAutoAssetLockTracker summaryPaddedString:v40 paddingToLenghtOfString:v22 paddingWith:@" " paddingBefore:1];
  id v16 = [v4 safeStringForKey:@"firstLockTimestamp"];
  id v17 = +[MAAutoAssetLockTracker summaryPaddedString:v39 paddingToLenghtOfString:v16 paddingWith:@" " paddingBefore:1];
  v18 = [v4 safeStringForKey:@"lastRefreshTimestamp"];

  unint64_t v19 = +[MAAutoAssetLockTracker summaryPaddedString:v38 paddingToLenghtOfString:v18 paddingWith:@" " paddingBefore:1];
  id v32 = [v31 stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@|%@|%@", v36, v27, v26, v24, v13, v21, v14, v15, v17, v19];

  return v32;
}

+ (id)summaryNewMaxColumnStrings
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v2 setSafeObject:@"clientLockReason" forKey:@"clientLockReason"];
  [v2 setSafeObject:@"clientProcessName" forKey:@"clientProcessName"];
  [v2 setSafeObject:@"clientProcessID" forKey:@"clientProcessID"];
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
    id v17 = [NSString string];
    v18 = [v17 stringByPaddingToLength:v16 withString:v11 startingAtIndex:0];

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
  uint64_t v20 = NSString;
  id v3 = a3;
  unint64_t v24 = [v3 safeStringForKey:@"clientLockReason"];
  v26 = +[MAAutoAssetLockTracker summaryPaddedString:@"clientLockReason" paddingToLenghtOfString:v24 paddingWith:@" " paddingBefore:0];
  v23 = [v3 safeStringForKey:@"clientProcessName"];
  unint64_t v25 = +[MAAutoAssetLockTracker summaryPaddedString:@"clientProcessName" paddingToLenghtOfString:v23 paddingWith:@" " paddingBefore:0];
  unint64_t v22 = [v3 safeStringForKey:@"clientProcessID"];
  uint64_t v16 = +[MAAutoAssetLockTracker summaryPaddedString:@"clientProcessID" paddingToLenghtOfString:v22 paddingWith:@" " paddingBefore:0];
  id v19 = [v3 safeStringForKey:@"lockUsagePolicy"];
  uint64_t v15 = +[MAAutoAssetLockTracker summaryPaddedString:@"lockUsagePolicy" paddingToLenghtOfString:v19 paddingWith:@" " paddingBefore:0];
  v18 = [v3 safeStringForKey:@"activeLockCount"];
  unint64_t v13 = +[MAAutoAssetLockTracker summaryPaddedString:@"activeLockCount" paddingToLenghtOfString:v18 paddingWith:@" " paddingBefore:0];
  id v17 = [v3 safeStringForKey:@"maximumLockCount"];
  id v11 = +[MAAutoAssetLockTracker summaryPaddedString:@"maximumLockCount" paddingToLenghtOfString:v17 paddingWith:@" " paddingBefore:0];
  id v14 = [v3 safeStringForKey:@"totalLockCount"];
  id v4 = +[MAAutoAssetLockTracker summaryPaddedString:@"totalLockCount" paddingToLenghtOfString:v14 paddingWith:@" " paddingBefore:0];
  id v12 = [v3 safeStringForKey:@"continueLockCount"];
  uint64_t v5 = +[MAAutoAssetLockTracker summaryPaddedString:@"continueLockCount" paddingToLenghtOfString:v12 paddingWith:@" " paddingBefore:0];
  BOOL v6 = [v3 safeStringForKey:@"firstLockTimestamp"];
  int64_t v7 = +[MAAutoAssetLockTracker summaryPaddedString:@"firstLockTimestamp" paddingToLenghtOfString:v6 paddingWith:@" " paddingBefore:0];
  int64_t v8 = [v3 safeStringForKey:@"lastRefreshTimestamp"];

  id v9 = +[MAAutoAssetLockTracker summaryPaddedString:@"lastRefreshTimestamp" paddingToLenghtOfString:v8 paddingWith:@" " paddingBefore:0];
  unint64_t v21 = [v20 stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@|%@|%@", v26, v25, v16, v15, v13, v11, v4, v5, v7, v9];

  return v21;
}

+ (id)summaryPaddedBanner:(id)a3
{
  unint64_t v21 = NSString;
  id v3 = a3;
  unint64_t v25 = [v3 safeStringForKey:@"clientLockReason"];
  v26 = +[MAAutoAssetLockTracker summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v25 paddingWith:@"=" paddingBefore:0];
  unint64_t v24 = [v3 safeStringForKey:@"clientProcessName"];
  v18 = +[MAAutoAssetLockTracker summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v24 paddingWith:@"=" paddingBefore:0];
  v23 = [v3 safeStringForKey:@"clientProcessID"];
  uint64_t v16 = +[MAAutoAssetLockTracker summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v23 paddingWith:@"=" paddingBefore:0];
  uint64_t v20 = [v3 safeStringForKey:@"lockUsagePolicy"];
  uint64_t v15 = +[MAAutoAssetLockTracker summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v20 paddingWith:@"=" paddingBefore:0];
  id v19 = [v3 safeStringForKey:@"activeLockCount"];
  id v11 = +[MAAutoAssetLockTracker summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v19 paddingWith:@"=" paddingBefore:0];
  id v17 = [v3 safeStringForKey:@"maximumLockCount"];
  id v12 = +[MAAutoAssetLockTracker summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v17 paddingWith:@"=" paddingBefore:0];
  id v14 = [v3 safeStringForKey:@"totalLockCount"];
  id v4 = +[MAAutoAssetLockTracker summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v14 paddingWith:@"=" paddingBefore:0];
  unint64_t v13 = [v3 safeStringForKey:@"continueLockCount"];
  uint64_t v5 = +[MAAutoAssetLockTracker summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v13 paddingWith:@"=" paddingBefore:0];
  BOOL v6 = [v3 safeStringForKey:@"firstLockTimestamp"];
  int64_t v7 = +[MAAutoAssetLockTracker summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v6 paddingWith:@"=" paddingBefore:0];
  int64_t v8 = [v3 safeStringForKey:@"lastRefreshTimestamp"];

  id v9 = +[MAAutoAssetLockTracker summaryPaddedString:&stru_1F0A75970 paddingToLenghtOfString:v8 paddingWith:@"=" paddingBefore:0];
  unint64_t v22 = [v21 stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@|%@|%@", v26, v18, v16, v15, v11, v12, v4, v5, v7, v9];

  return v22;
}

- (MAAutoAssetLockReason)clientLockReason
{
  return self->_clientLockReason;
}

- (NSString)clientProcessName
{
  return self->_clientProcessName;
}

- (void)setClientProcessName:(id)a3
{
}

- (int64_t)clientProcessID
{
  return self->_clientProcessID;
}

- (void)setClientProcessID:(int64_t)a3
{
  self->_clientProcessID = a3;
}

- (MAAutoAssetPolicy)lockUsagePolicy
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
  objc_storeStrong((id *)&self->_clientProcessName, 0);
  objc_storeStrong((id *)&self->_clientLockReason, 0);
}

@end