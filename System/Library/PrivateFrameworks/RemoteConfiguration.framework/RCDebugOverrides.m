@interface RCDebugOverrides
+ (id)defaultDebugOverrides;
- (BOOL)disableAbTesting;
- (BOOL)enableExtraLogs;
- (BOOL)ignoreCache;
- (BOOL)isEqual:(id)a3;
- (BOOL)onlyUseFallbackURL;
- (NSArray)additionalSegmentSetIDs;
- (NSArray)overrideSegmentSetIDs;
- (NSString)description;
- (RCDebugOverrides)initWithDisableAbTesting:(BOOL)a3 overrideSegmentSetIDs:(id)a4 additionalSegmentSetIDs:(id)a5 configurationSource:(unint64_t)a6 debugEnvironment:(unint64_t)a7 ignoreCache:(BOOL)a8;
- (RCDebugOverrides)initWithDisableAbTesting:(BOOL)a3 overrideSegmentSetIDs:(id)a4 additionalSegmentSetIDs:(id)a5 configurationSource:(unint64_t)a6 debugEnvironment:(unint64_t)a7 ignoreCache:(BOOL)a8 enableExtraLogs:(BOOL)a9;
- (RCDebugOverrides)initWithDisableAbTesting:(BOOL)a3 overrideSegmentSetIDs:(id)a4 additionalSegmentSetIDs:(id)a5 onlyUseFallbackURL:(BOOL)a6 debugEnvironment:(unint64_t)a7;
- (id)dictionaryRepresentation;
- (unint64_t)configurationSource;
- (unint64_t)debugEnvironment;
- (unint64_t)hash;
@end

@implementation RCDebugOverrides

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalSegmentSetIDs, 0);

  objc_storeStrong((id *)&self->_overrideSegmentSetIDs, 0);
}

- (RCDebugOverrides)initWithDisableAbTesting:(BOOL)a3 overrideSegmentSetIDs:(id)a4 additionalSegmentSetIDs:(id)a5 configurationSource:(unint64_t)a6 debugEnvironment:(unint64_t)a7 ignoreCache:(BOOL)a8 enableExtraLogs:(BOOL)a9
{
  id v16 = a4;
  id v17 = a5;
  v21.receiver = self;
  v21.super_class = (Class)RCDebugOverrides;
  v18 = [(RCDebugOverrides *)&v21 init];
  v19 = v18;
  if (v18)
  {
    v18->_disableAbTesting = a3;
    objc_storeStrong((id *)&v18->_overrideSegmentSetIDs, a4);
    objc_storeStrong((id *)&v19->_additionalSegmentSetIDs, a5);
    v19->_configurationSource = a6;
    v19->_debugEnvironment = a7;
    v19->_ignoreCache = a8;
    v19->_enableExtraLogs = a9;
  }

  return v19;
}

- (unint64_t)configurationSource
{
  return self->_configurationSource;
}

- (BOOL)ignoreCache
{
  return self->_ignoreCache;
}

+ (id)defaultDebugOverrides
{
  LOBYTE(v4) = 0;
  v2 = [[RCDebugOverrides alloc] initWithDisableAbTesting:0 overrideSegmentSetIDs:0 additionalSegmentSetIDs:0 configurationSource:0 debugEnvironment:0 ignoreCache:0 enableExtraLogs:v4];

  return v2;
}

- (RCDebugOverrides)initWithDisableAbTesting:(BOOL)a3 overrideSegmentSetIDs:(id)a4 additionalSegmentSetIDs:(id)a5 onlyUseFallbackURL:(BOOL)a6 debugEnvironment:(unint64_t)a7
{
  BOOL v9 = a3;
  if (a6) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = a5;
  id v13 = a4;
  LOBYTE(v16) = 0;
  v14 = [[RCDebugOverrides alloc] initWithDisableAbTesting:v9 overrideSegmentSetIDs:v13 additionalSegmentSetIDs:v12 configurationSource:v11 debugEnvironment:a7 ignoreCache:0 enableExtraLogs:v16];

  return v14;
}

- (RCDebugOverrides)initWithDisableAbTesting:(BOOL)a3 overrideSegmentSetIDs:(id)a4 additionalSegmentSetIDs:(id)a5 configurationSource:(unint64_t)a6 debugEnvironment:(unint64_t)a7 ignoreCache:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v12 = a3;
  id v14 = a5;
  id v15 = a4;
  LOBYTE(v18) = 0;
  uint64_t v16 = [[RCDebugOverrides alloc] initWithDisableAbTesting:v12 overrideSegmentSetIDs:v15 additionalSegmentSetIDs:v14 configurationSource:a6 debugEnvironment:a7 ignoreCache:v8 enableExtraLogs:v18];

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [(RCDebugOverrides *)self disableAbTesting];
    if (v6 == [v5 disableAbTesting])
    {
      BOOL v8 = (void *)MEMORY[0x1E4FBA8A8];
      BOOL v9 = [(RCDebugOverrides *)self overrideSegmentSetIDs];
      v10 = [v5 overrideSegmentSetIDs];
      if (objc_msgSend(v8, "rc_object:isEqualToObject:", v9, v10))
      {
        uint64_t v11 = (void *)MEMORY[0x1E4FBA8A8];
        BOOL v12 = [(RCDebugOverrides *)self additionalSegmentSetIDs];
        id v13 = [v5 additionalSegmentSetIDs];
        if (objc_msgSend(v11, "rc_object:isEqualToObject:", v12, v13)
          && (unint64_t v14 = [(RCDebugOverrides *)self configurationSource],
              v14 == [v5 configurationSource])
          && (unint64_t v15 = [(RCDebugOverrides *)self debugEnvironment],
              v15 == [v5 debugEnvironment])
          && (int v16 = [(RCDebugOverrides *)self ignoreCache],
              v16 == [v5 ignoreCache]))
        {
          BOOL v18 = [(RCDebugOverrides *)self enableExtraLogs];
          int v7 = v18 ^ [v5 enableExtraLogs] ^ 1;
        }
        else
        {
          LOBYTE(v7) = 0;
        }
      }
      else
      {
        LOBYTE(v7) = 0;
      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v3 = objc_msgSend(NSNumber, "numberWithBool:", -[RCDebugOverrides disableAbTesting](self, "disableAbTesting"));
  uint64_t v4 = [v3 hash];
  id v5 = [(RCDebugOverrides *)self overrideSegmentSetIDs];
  uint64_t v6 = [v5 hash];
  int v7 = [(RCDebugOverrides *)self additionalSegmentSetIDs];
  uint64_t v8 = v6 ^ [v7 hash] ^ v4;
  BOOL v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[RCDebugOverrides configurationSource](self, "configurationSource"));
  uint64_t v10 = [v9 hash];
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[RCDebugOverrides debugEnvironment](self, "debugEnvironment"));
  uint64_t v12 = v8 ^ v10 ^ [v11 hash];
  id v13 = objc_msgSend(NSNumber, "numberWithBool:", -[RCDebugOverrides ignoreCache](self, "ignoreCache"));
  uint64_t v14 = [v13 hash];
  unint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", -[RCDebugOverrides enableExtraLogs](self, "enableExtraLogs"));
  unint64_t v16 = v12 ^ v14 ^ [v15 hash];

  return v16;
}

- (NSString)description
{
  uint64_t v11 = NSString;
  uint64_t v3 = objc_opt_class();
  BOOL v4 = [(RCDebugOverrides *)self disableAbTesting];
  id v5 = [(RCDebugOverrides *)self overrideSegmentSetIDs];
  uint64_t v6 = objc_msgSend(v5, "rc_description");
  int v7 = [(RCDebugOverrides *)self additionalSegmentSetIDs];
  uint64_t v8 = objc_msgSend(v7, "rc_description");
  objc_msgSend(v11, "stringWithFormat:", @"<%@: %p; disableAbTesting: %d overrideSegmentSetIDs: %@ additionalSegmentSetIDs: %@ configurationSource: %lu debugEnvironment: %lu ignoreCache: %d enableExtraLogs: %d>",
    v3,
    self,
    v4,
    v6,
    v8,
    [(RCDebugOverrides *)self configurationSource],
    [(RCDebugOverrides *)self debugEnvironment],
    [(RCDebugOverrides *)self ignoreCache],
  BOOL v9 = [(RCDebugOverrides *)self enableExtraLogs]);

  return (NSString *)v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v4 = objc_msgSend(NSNumber, "numberWithBool:", -[RCDebugOverrides disableAbTesting](self, "disableAbTesting"));
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v4, @"disableAbTesting");

  id v5 = [(RCDebugOverrides *)self overrideSegmentSetIDs];
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v5, @"overrideSegmentSetIds");

  uint64_t v6 = [(RCDebugOverrides *)self additionalSegmentSetIDs];
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v6, @"additionalSegmentSetIds");

  int v7 = (void *)[v3 copy];

  return v7;
}

- (BOOL)onlyUseFallbackURL
{
  return [(RCDebugOverrides *)self configurationSource] == 2;
}

- (BOOL)disableAbTesting
{
  return self->_disableAbTesting;
}

- (NSArray)overrideSegmentSetIDs
{
  return self->_overrideSegmentSetIDs;
}

- (NSArray)additionalSegmentSetIDs
{
  return self->_additionalSegmentSetIDs;
}

- (unint64_t)debugEnvironment
{
  return self->_debugEnvironment;
}

- (BOOL)enableExtraLogs
{
  return self->_enableExtraLogs;
}

@end