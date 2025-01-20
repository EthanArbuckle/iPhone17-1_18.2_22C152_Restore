@interface BRCContainerMetadataSyncPersistedState
+ (BOOL)supportsSecureCoding;
+ (id)loadFromClientStateInSession:(id)a3 options:(id)a4;
- (BOOL)hasCaughtUpAtLeastOnce;
- (BOOL)needsContainerMetadataSyncDown;
- (BOOL)needsSharedDBSyncDown;
- (BRCContainerMetadataSyncPersistedState)init;
- (BRCContainerMetadataSyncPersistedState)initWithCoder:(id)a3;
- (CKOperationGroup)ckGroup;
- (CKServerChangeToken)serverChangeToken;
- (NSDate)lastSyncDownDate;
- (id)description;
- (unint64_t)allocateNextRequestID;
- (unint64_t)requestID;
- (void)containerMetadataWasReset;
- (void)encodeWithCoder:(id)a3;
- (void)setCkGroup:(id)a3;
- (void)setHasCaughtUpAtLeastOnce:(BOOL)a3;
- (void)setNeedsContainerMetadataSyncDown:(BOOL)a3;
- (void)setNeedsSharedDBSyncDown:(BOOL)a3;
- (void)updateWithServerChangeToken:(id)a3 requestID:(unint64_t)a4;
@end

@implementation BRCContainerMetadataSyncPersistedState

+ (id)loadFromClientStateInSession:(id)a3 options:(id)a4
{
  id v4 = a3;
  v5 = [v4 clientState];
  v6 = [v5 objectForKeyedSubscript:@"containerMetadataSync"];
  if (objc_opt_isKindOfClass())
  {
    if (([v6 hasCaughtUpAtLeastOnce] & 1) == 0
      && ([v6 needsContainerMetadataSyncDown] & 1) == 0)
    {
      [v6 setHasCaughtUpAtLeastOnce:1];
    }
  }
  else
  {
    uint64_t v9 = objc_opt_new();

    [v5 setObject:v9 forKeyedSubscript:@"containerMetadataSync"];
    v6 = (void *)v9;
  }
  v7 = [v4 clientTruthWorkloop];
  [v6 setAssertionQueue:v7];

  return v6;
}

- (id)description
{
  v3 = [(BRCContainerMetadataSyncPersistedState *)self lastSyncDownDate];
  if (v3)
  {
    if (description_onceToken != -1) {
      dispatch_once(&description_onceToken, &__block_literal_global_55);
    }
    id v4 = [(id)description_df stringFromDate:v3];
  }
  else
  {
    id v4 = @"never";
  }
  v5 = [NSString stringWithFormat:@"<%p>: %@:%@ %@:%lld %@:%@", self, @"serverChangeToken", self->_serverChangeToken, @"requestID", self->_requestID, @"lastSyncDate", v4];

  return v5;
}

uint64_t __53__BRCContainerMetadataSyncPersistedState_description__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)description_df;
  description_df = (uint64_t)v0;

  v2 = (void *)description_df;
  return [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
}

- (BRCContainerMetadataSyncPersistedState)init
{
  v3.receiver = self;
  v3.super_class = (Class)BRCContainerMetadataSyncPersistedState;
  result = [(BRCContainerMetadataSyncPersistedState *)&v3 init];
  if (result)
  {
    result->_needsContainerMetadataSyncDown = 1;
    result->_needsSharedDBSyncDown = 1;
  }
  return result;
}

- (BRCContainerMetadataSyncPersistedState)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRCContainerMetadataSyncPersistedState;
  v5 = [(BRCPersistedState *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serverChangeToken"];
    serverChangeToken = v5->_serverChangeToken;
    v5->_serverChangeToken = (CKServerChangeToken *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastSyncDate"];
    lastSyncDownDate = v5->_lastSyncDownDate;
    v5->_lastSyncDownDate = (NSDate *)v8;

    v5->_needsContainerMetadataSyncDown = [v4 decodeBoolForKey:@"isContainerMetadataSyncIdle"] ^ 1;
    v5->_needsSharedDBSyncDown = [v4 decodeBoolForKey:@"isSharedDBSyncIdle"] ^ 1;
    v5->_requestID = [v4 decodeInt64ForKey:@"requestID"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ckGroup"];
    ckGroup = v5->_ckGroup;
    v5->_ckGroup = (CKOperationGroup *)v10;

    v5->_hasCaughtUpAtLeastOnce = [v4 decodeBoolForKey:@"containerMetadataHasCaughtUp"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6.receiver = v5;
  v6.super_class = (Class)BRCContainerMetadataSyncPersistedState;
  [(BRCPersistedState *)&v6 encodeWithCoder:v4];
  [v4 encodeObject:v5->_serverChangeToken forKey:@"serverChangeToken"];
  [v4 encodeObject:v5->_lastSyncDownDate forKey:@"lastSyncDate"];
  [v4 encodeBool:!v5->_needsContainerMetadataSyncDown forKey:@"isContainerMetadataSyncIdle"];
  [v4 encodeBool:!v5->_needsSharedDBSyncDown forKey:@"isSharedDBSyncIdle"];
  [v4 encodeInt64:v5->_requestID forKey:@"requestID"];
  [v4 encodeObject:v5->_ckGroup forKey:@"ckGroup"];
  [v4 encodeBool:v5->_hasCaughtUpAtLeastOnce forKey:@"containerMetadataHasCaughtUp"];
  objc_sync_exit(v5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)updateWithServerChangeToken:(id)a3 requestID:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  objc_storeStrong((id *)&v8->_serverChangeToken, a3);
  uint64_t v9 = [MEMORY[0x263EFF910] date];
  lastSyncDownDate = v8->_lastSyncDownDate;
  v8->_lastSyncDownDate = (NSDate *)v9;

  unint64_t requestID = v8->_requestID;
  if (requestID < a4)
  {
    if (requestID)
    {
      v12 = brc_bread_crumbs();
      objc_super v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        int v14 = 138412802;
        v15 = v8;
        __int16 v16 = 2048;
        unint64_t v17 = a4;
        __int16 v18 = 2112;
        v19 = v12;
        _os_log_fault_impl(&dword_23FA42000, v13, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _requestID == 0 %@: got request ID: %llu%@", (uint8_t *)&v14, 0x20u);
      }
    }
    v8->_unint64_t requestID = a4;
  }
  objc_sync_exit(v8);
}

- (void)containerMetadataWasReset
{
  obj = self;
  objc_sync_enter(obj);
  serverChangeToken = obj->_serverChangeToken;
  obj->_serverChangeToken = 0;

  lastSyncDownDate = obj->_lastSyncDownDate;
  obj->_lastSyncDownDate = 0;

  objc_sync_exit(obj);
}

- (unint64_t)allocateNextRequestID
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = v2->_requestID + 1;
  v2->_unint64_t requestID = v3;
  objc_sync_exit(v2);

  return v3;
}

- (CKServerChangeToken)serverChangeToken
{
  return self->_serverChangeToken;
}

- (NSDate)lastSyncDownDate
{
  return self->_lastSyncDownDate;
}

- (BOOL)needsContainerMetadataSyncDown
{
  return self->_needsContainerMetadataSyncDown;
}

- (void)setNeedsContainerMetadataSyncDown:(BOOL)a3
{
  self->_needsContainerMetadataSyncDown = a3;
}

- (BOOL)needsSharedDBSyncDown
{
  return self->_needsSharedDBSyncDown;
}

- (void)setNeedsSharedDBSyncDown:(BOOL)a3
{
  self->_needsSharedDBSyncDown = a3;
}

- (BOOL)hasCaughtUpAtLeastOnce
{
  return self->_hasCaughtUpAtLeastOnce;
}

- (void)setHasCaughtUpAtLeastOnce:(BOOL)a3
{
  self->_hasCaughtUpAtLeastOnce = a3;
}

- (unint64_t)requestID
{
  return self->_requestID;
}

- (CKOperationGroup)ckGroup
{
  return self->_ckGroup;
}

- (void)setCkGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckGroup, 0);
  objc_storeStrong((id *)&self->_lastSyncDownDate, 0);
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
}

@end