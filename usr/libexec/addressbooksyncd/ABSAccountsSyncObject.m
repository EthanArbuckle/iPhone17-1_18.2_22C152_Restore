@interface ABSAccountsSyncObject
+ (id)sha;
+ (void)processSyncObjASAPPortion:(id)a3;
+ (void)processSyncObjEndOfSessionPortion:(id)a3;
- (id)createProtobufWithOptions:(id)a3;
- (id)objectIdentifier;
- (id)sequencer;
- (int64_t)changeType;
@end

@implementation ABSAccountsSyncObject

+ (void)processSyncObjASAPPortion:(id)a3
{
  id v3 = a3;
  if ([v3 hasLocalContainerEnabled]
    && [v3 localContainerEnabled])
  {
    +[ABSAccountsManager setLocalContainerEnabled:1];
  }
}

+ (void)processSyncObjEndOfSessionPortion:(id)a3
{
  id v3 = a3;
  if ([v3 hasLocalContainerEnabled]
    && ([v3 localContainerEnabled] & 1) == 0)
  {
    +[ABSAccountsManager setLocalContainerEnabled:0];
  }
}

+ (id)sha
{
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  BOOL data = +[ABSAccountsManager localContainerEnabled];
  CC_SHA256_Update(&c, &data, 1u);
  v2 = +[ABSAccountsManager primaryiCloudCardDAVAccountIdentifier];
  id v3 = [v2 dataUsingEncoding:4];
  CC_SHA256_Update(&c, [v3 bytes], (CC_LONG)[v3 length]);
  CC_SHA256_Final(md, &c);
  id v4 = [objc_alloc((Class)NSData) initWithBytesNoCopy:md length:32 freeWhenDone:0];
  v5 = [v4 base64EncodedDataWithOptions:0];
  id v6 = [objc_alloc((Class)NSString) initWithData:v5 encoding:4];

  return v6;
}

- (id)objectIdentifier
{
  return @"None";
}

- (id)sequencer
{
  return 0;
}

- (int64_t)changeType
{
  return 2;
}

- (id)createProtobufWithOptions:(id)a3
{
  id v3 = +[ABSAccountsManager primaryiCloudCardDAVAccountIdentifier];
  id v4 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Sending primary iCloud CardDAV ID: %{public}@", (uint8_t *)&v12, 0xCu);
  }
  v5 = [[ABSPBSyncObject alloc] initWithMemo:@"Account"];
  id v6 = objc_alloc_init(ABSPBAccountsSyncObject);
  [(ABSPBSyncObject *)v5 setAccountsSyncObject:v6];

  BOOL v7 = +[ABSAccountsManager localContainerEnabled];
  v8 = [(ABSPBSyncObject *)v5 accountsSyncObject];
  [v8 setLocalContainerEnabled:v7];

  v9 = [(ABSPBSyncObject *)v5 accountsSyncObject];
  [v9 setPrimaryiCloudAccountCardDAVAccountExternalIdentifier:v3];

  v10 = [(ABSPBSyncObject *)v5 data];

  return v10;
}

@end