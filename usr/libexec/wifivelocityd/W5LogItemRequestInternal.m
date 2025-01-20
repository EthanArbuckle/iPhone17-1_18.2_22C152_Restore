@interface W5LogItemRequestInternal
- (BOOL)includeEvents;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLogItemRequestInternal:(id)a3;
- (NSArray)itemRequests;
- (NSDate)addedAt;
- (NSDictionary)configuration;
- (NSString)filename;
- (NSURL)additionalLog;
- (NSUUID)uuid;
- (OS_os_transaction)transaction;
- (W5LogItemRequestInternal)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)reply;
- (unint64_t)hash;
- (unsigned)gid;
- (unsigned)uid;
- (void)dealloc;
- (void)setAddedAt:(id)a3;
- (void)setAdditionalLog:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setFilename:(id)a3;
- (void)setGid:(unsigned int)a3;
- (void)setIncludeEvents:(BOOL)a3;
- (void)setItemRequests:(id)a3;
- (void)setReply:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setUid:(unsigned int)a3;
- (void)setUuid:(id)a3;
@end

@implementation W5LogItemRequestInternal

- (W5LogItemRequestInternal)init
{
  v5.receiver = self;
  v5.super_class = (Class)W5LogItemRequestInternal;
  v2 = [(W5LogItemRequestInternal *)&v5 init];
  if (v2)
  {
    uint64_t v3 = os_transaction_create();
    [[+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager")] osTransactionCreate:@"com.apple.wifivelocity.W5LogItemRequestInternal" transaction:v3];
    v2->_transaction = (OS_os_transaction *)v3;
  }
  return v2;
}

- (void)dealloc
{
  [+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager") osTransactionComplete:self->_transaction];

  self->_transaction = 0;
  v3.receiver = self;
  v3.super_class = (Class)W5LogItemRequestInternal;
  [(W5LogItemRequestInternal *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = +[NSMutableString stringWithCapacity:0];
  [(NSMutableString *)v3 appendFormat:@"UUID: %@\n", self->_uuid];
  [(NSMutableString *)v3 appendFormat:@"UID: %d\n", self->_uid];
  [(NSMutableString *)v3 appendFormat:@"GID: %d\n", self->_gid];
  if (self->_includeEvents) {
    v4 = "Yes";
  }
  else {
    v4 = "No";
  }
  [(NSMutableString *)v3 appendFormat:@"Events: %s\n", v4];
  [(NSMutableString *)v3 appendFormat:@"Filename: %@\n", self->_filename];
  [(NSMutableString *)v3 appendFormat:@"AdditionalLog: %@\n", self->_additionalLog];
  [(NSMutableString *)v3 appendFormat:@"Configuration: %@\n", self->_configuration];
  [(NSMutableString *)v3 appendFormat:@"AddedAt: %@\n", self->_addedAt];
  [(NSMutableString *)v3 appendFormat:@"Requests:\n"];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  itemRequests = self->_itemRequests;
  id v6 = [(NSArray *)itemRequests countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(itemRequests);
        }
        [(NSMutableString *)v3 appendFormat:@"%@\n", *(void *)(*((void *)&v11 + 1) + 8 * (void)v9)];
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSArray *)itemRequests countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  return [(NSMutableString *)v3 copy];
}

- (BOOL)isEqualToLogItemRequestInternal:(id)a3
{
  uuid = self->_uuid;
  id v4 = [a3 uuid];

  return [(NSUUID *)uuid isEqual:v4];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [(W5LogItemRequestInternal *)self isEqualToLogItemRequestInternal:a3];
}

- (unint64_t)hash
{
  return (unint64_t)[(NSUUID *)self->_uuid hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[W5LogItemRequestInternal allocWithZone:a3] init];
  [(W5LogItemRequestInternal *)v4 setUuid:self->_uuid];
  [(W5LogItemRequestInternal *)v4 setItemRequests:self->_itemRequests];
  [(W5LogItemRequestInternal *)v4 setConfiguration:self->_configuration];
  [(W5LogItemRequestInternal *)v4 setFilename:self->_filename];
  [(W5LogItemRequestInternal *)v4 setAdditionalLog:self->_additionalLog];
  [(W5LogItemRequestInternal *)v4 setUid:self->_uid];
  [(W5LogItemRequestInternal *)v4 setGid:self->_gid];
  [(W5LogItemRequestInternal *)v4 setIncludeEvents:self->_includeEvents];
  [(W5LogItemRequestInternal *)v4 setAddedAt:self->_addedAt];
  [(W5LogItemRequestInternal *)v4 setReply:self->_reply];
  return v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (NSArray)itemRequests
{
  return self->_itemRequests;
}

- (void)setItemRequests:(id)a3
{
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
}

- (NSURL)additionalLog
{
  return self->_additionalLog;
}

- (void)setAdditionalLog:(id)a3
{
}

- (unsigned)uid
{
  return self->_uid;
}

- (void)setUid:(unsigned int)a3
{
  self->_uid = a3;
}

- (unsigned)gid
{
  return self->_gid;
}

- (void)setGid:(unsigned int)a3
{
  self->_gid = a3;
}

- (BOOL)includeEvents
{
  return self->_includeEvents;
}

- (void)setIncludeEvents:(BOOL)a3
{
  self->_includeEvents = a3;
}

- (NSDate)addedAt
{
  return self->_addedAt;
}

- (void)setAddedAt:(id)a3
{
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
}

@end