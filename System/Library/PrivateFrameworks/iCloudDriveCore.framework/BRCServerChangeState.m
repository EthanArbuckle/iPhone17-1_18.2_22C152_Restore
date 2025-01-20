@interface BRCServerChangeState
+ (BOOL)supportsSecureCoding;
- (BOOL)hasNeverSyncedDown;
- (BRCServerChangeState)initWithCoder:(id)a3;
- (BRCServerChangeState)initWithServerSyncState:(id)a3;
- (CKServerChangeToken)changeToken;
- (NSDate)lastSyncDownDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithContext:(id)a3;
- (int64_t)lastSyncDownStatus;
- (unint64_t)clientRequestID;
- (void)encodeWithCoder:(id)a3;
- (void)forgetChangeTokens;
- (void)forgetClientRequestID;
- (void)setChangeToken:(id)a3;
- (void)setClientRequestID:(unint64_t)a3;
- (void)setLastSyncDownDate:(id)a3;
- (void)setLastSyncDownStatus:(int64_t)a3;
- (void)updateWithServerChangeToken:(id)a3 clientRequestID:(unint64_t)a4 caughtUp:(BOOL)a5;
@end

@implementation BRCServerChangeState

- (id)descriptionWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithCapacity:64];
  v7 = [(BRCServerChangeState *)v5 lastSyncDownDate];
  if (v7)
  {
    v8 = +[BRCUserDefaults defaultsForMangledID:0];
    v9 = [v8 dumpDateFormatter];

    v10 = [v9 stringFromDate:v7];
    [v6 appendFormat:@"last-sync:%@", v10];
  }
  else
  {
    [v6 appendString:@"last-sync:never"];
  }
  if (v5->_clientRequestID) {
    [v6 appendFormat:@", requestID:%llu", v5->_clientRequestID];
  }
  v11 = @", inconsistent";
  switch(v5->_lastSyncDownStatus)
  {
    case 0:
      break;
    case 1:
      goto LABEL_9;
    case 2:
      v11 = @", consistent";
      goto LABEL_9;
    case 3:
      v11 = @", caught-up";
LABEL_9:
      [v6 appendString:v11];
      break;
    default:
      [v6 appendFormat:@", status:%d(?)", v5->_lastSyncDownStatus];
      break;
  }
  changeToken = v5->_changeToken;
  if (changeToken)
  {
    v13 = prettyPrintServerChangeToken(changeToken, (uint64_t)v4);
    [v6 appendFormat:@", token:%@", v13];
  }
  objc_sync_exit(v5);

  return v6;
}

- (id)description
{
  return [(BRCServerChangeState *)self descriptionWithContext:0];
}

- (BOOL)hasNeverSyncedDown
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_lastSyncDownDate == 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)updateWithServerChangeToken:(id)a3 clientRequestID:(unint64_t)a4 caughtUp:(BOOL)a5
{
  BOOL v5 = a5;
  id v13 = a3;
  v9 = self;
  objc_sync_enter(v9);
  objc_storeStrong((id *)&v9->_changeToken, a3);
  uint64_t v10 = [MEMORY[0x263EFF910] date];
  lastSyncDownDate = v9->_lastSyncDownDate;
  v9->_lastSyncDownDate = (NSDate *)v10;

  uint64_t v12 = 2;
  if (v5) {
    uint64_t v12 = 3;
  }
  v9->_lastSyncDownStatus = v12;
  v9->_clientRequestID = a4;
  objc_sync_exit(v9);
}

- (void)forgetChangeTokens
{
  obj = self;
  objc_sync_enter(obj);
  changeToken = obj->_changeToken;
  obj->_changeToken = 0;

  lastSyncDownDate = obj->_lastSyncDownDate;
  obj->_lastSyncDownDate = 0;

  obj->_lastSyncDownStatus = 0;
  objc_sync_exit(obj);
}

- (void)forgetClientRequestID
{
  self->_clientRequestID = 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BRCServerChangeState)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BRCServerChangeState;
  BOOL v5 = [(BRCServerChangeState *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lsdDate"];
    lastSyncDownDate = v5->_lastSyncDownDate;
    v5->_lastSyncDownDate = (NSDate *)v6;

    v5->_lastSyncDownStatus = [v4 decodeInt64ForKey:@"lsdStatus"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"token"];
    changeToken = v5->_changeToken;
    v5->_changeToken = (CKServerChangeToken *)v8;

    v5->_clientRequestID = [v4 decodeInt64ForKey:@"requestID"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [v5 encodeObject:v4->_lastSyncDownDate forKey:@"lsdDate"];
  [v5 encodeObject:v4->_changeToken forKey:@"token"];
  [v5 encodeInt64:v4->_lastSyncDownStatus forKey:@"lsdStatus"];
  [v5 encodeInt64:v4->_clientRequestID forKey:@"requestID"];
  objc_sync_exit(v4);
}

- (BRCServerChangeState)initWithServerSyncState:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BRCServerChangeState;
  id v5 = [(BRCServerChangeState *)&v8 init];
  if (v5)
  {
    id v6 = v4;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v5->_lastSyncDownDate, *((id *)v6 + 1));
    v5->_lastSyncDownStatus = *((void *)v6 + 2);
    objc_storeStrong((id *)&v5->_changeToken, *((id *)v6 + 3));
    v5->_clientRequestID = *((void *)v6 + 4);
    objc_sync_exit(v6);
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithServerSyncState:self];
}

- (NSDate)lastSyncDownDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLastSyncDownDate:(id)a3
{
}

- (int64_t)lastSyncDownStatus
{
  return self->_lastSyncDownStatus;
}

- (void)setLastSyncDownStatus:(int64_t)a3
{
  self->_lastSyncDownStatus = a3;
}

- (CKServerChangeToken)changeToken
{
  return self->_changeToken;
}

- (void)setChangeToken:(id)a3
{
}

- (unint64_t)clientRequestID
{
  return self->_clientRequestID;
}

- (void)setClientRequestID:(unint64_t)a3
{
  self->_clientRequestID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeToken, 0);
  objc_storeStrong((id *)&self->_lastSyncDownDate, 0);
}

@end