@interface BRCZoneHealthSyncPersistedState
+ (BOOL)supportsSecureCoding;
+ (id)loadFromClientStateInSession:(id)a3 options:(id)a4;
- (BOOL)needsSyncDown;
- (BRCZoneHealthSyncPersistedState)initWithCoder:(id)a3;
- (BRCZoneHealthSyncPersistedState)initWithZoneHealthState:(id)a3;
- (CKOperationGroup)ckGroup;
- (CKServerChangeToken)serverChangeToken;
- (NSDate)lastSyncDownDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)allocateNextRequestID;
- (unint64_t)requestID;
- (void)encodeWithCoder:(id)a3;
- (void)setCkGroup:(id)a3;
- (void)setNeedsSyncDown:(BOOL)a3;
- (void)updateWithServerChangeToken:(id)a3 requestID:(unint64_t)a4;
- (void)zoneHealthWasReset;
@end

@implementation BRCZoneHealthSyncPersistedState

+ (id)loadFromClientStateInSession:(id)a3 options:(id)a4
{
  v4 = [a3 clientState];
  v5 = [v4 objectForKeyedSubscript:@"zoneHealthSync"];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = objc_alloc_init((Class)objc_opt_class());

    [v7 setNeedsSyncDown:1];
    [v4 setObject:v7 forKeyedSubscript:@"zoneHealthSync"];
    v5 = v7;
  }

  return v5;
}

- (BRCZoneHealthSyncPersistedState)initWithZoneHealthState:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BRCZoneHealthSyncPersistedState;
  v5 = [(BRCZoneHealthSyncPersistedState *)&v8 init];
  if (v5)
  {
    id v6 = v4;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v5->_lastSyncDownDate, *((id *)v6 + 3));
    objc_storeStrong((id *)&v5->_serverChangeToken, *((id *)v6 + 4));
    v5->_needsSyncDown = *((unsigned char *)v6 + 16);
    v5->_requestID = *((void *)v6 + 5);
    objc_storeStrong((id *)&v5->_ckGroup, *((id *)v6 + 6));
    objc_sync_exit(v6);
  }
  return v5;
}

- (BRCZoneHealthSyncPersistedState)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRCZoneHealthSyncPersistedState;
  v5 = [(BRCZoneHealthSyncPersistedState *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastSyncDate"];
    lastSyncDownDate = v5->_lastSyncDownDate;
    v5->_lastSyncDownDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serverChangeToken"];
    serverChangeToken = v5->_serverChangeToken;
    v5->_serverChangeToken = (CKServerChangeToken *)v8;

    v5->_needsSyncDown = [v4 decodeBoolForKey:@"zoneHealthSyncIdle"] ^ 1;
    v5->_requestID = [v4 decodeInt64ForKey:@"requestID"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ckGroup"];
    ckGroup = v5->_ckGroup;
    v5->_ckGroup = (CKOperationGroup *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6.receiver = v5;
  v6.super_class = (Class)BRCZoneHealthSyncPersistedState;
  [(BRCPersistedState *)&v6 encodeWithCoder:v4];
  [v4 encodeObject:v5->_lastSyncDownDate forKey:@"lastSyncDate"];
  [v4 encodeObject:v5->_serverChangeToken forKey:@"serverChangeToken"];
  [v4 encodeBool:!v5->_needsSyncDown forKey:@"zoneHealthSyncIdle"];
  [v4 encodeInt64:v5->_requestID forKey:@"requestID"];
  [v4 encodeObject:v5->_ckGroup forKey:@"ckGroup"];
  objc_sync_exit(v5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithZoneHealthState:self];
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

- (void)zoneHealthWasReset
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

- (id)description
{
  unint64_t v3 = +[BRCUserDefaults defaultsForMangledID:0];
  id v4 = [v3 dumpDateFormatter];

  v5 = NSString;
  objc_super v6 = [v4 stringFromDate:self->_lastSyncDownDate];
  if (self->_needsSyncDown) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  unint64_t requestID = self->_requestID;
  uint64_t v9 = [(CKServerChangeToken *)self->_serverChangeToken descriptionWithContext:0];
  uint64_t v10 = [v5 stringWithFormat:@"zone-health-state{last-sync:%@, needs-syncdown:%@, requestID:%lld, changeToken:%@}", v6, v7, requestID, v9];

  return v10;
}

- (NSDate)lastSyncDownDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (CKServerChangeToken)serverChangeToken
{
  return self->_serverChangeToken;
}

- (unint64_t)requestID
{
  return self->_requestID;
}

- (BOOL)needsSyncDown
{
  return self->_needsSyncDown;
}

- (void)setNeedsSyncDown:(BOOL)a3
{
  self->_needsSyncDown = a3;
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
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
  objc_storeStrong((id *)&self->_lastSyncDownDate, 0);
}

@end