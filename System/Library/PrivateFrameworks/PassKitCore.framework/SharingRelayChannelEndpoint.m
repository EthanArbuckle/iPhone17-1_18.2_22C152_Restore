@interface SharingRelayChannelEndpoint
+ (id)_properties;
+ (id)databaseTable;
- (SharingRelayChannelEndpoint)initWithRelayServerEndpoint:(id)a3 inDatabase:(id)a4;
@end

@implementation SharingRelayChannelEndpoint

- (SharingRelayChannelEndpoint)initWithRelayServerEndpoint:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  v9 = PDSharingRelayServerEndpointStatusToString((uint64_t)[v7 mailboxStatus]);
  [v8 setObjectOrNull:v9 forKey:@"ra"];

  v10 = [v7 payloadEncryptionPassword];
  v11 = [v10 base64EncodedStringWithOptions:0];
  [v8 setObjectOrNull:v11 forKey:@"rb"];

  v12 = [v7 deviceClaim];
  [v8 setObjectOrNull:v12 forKey:@"rc"];

  v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 hasOutstandingMessages]);
  [v8 setObjectOrNull:v13 forKey:@"rd"];

  v14 = [v7 relayServerHost];
  v15 = (void *)_SQLValueForURL();
  [v8 setObjectOrNull:v15 forKey:@"rf"];

  v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 timeToLive]);
  [v8 setObjectOrNull:v16 forKey:@"rg"];

  v17 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 doesRemoteMailboxSupportPushNotifications]);
  [v8 setObjectOrNull:v17 forKey:@"rh"];

  id v18 = [v7 pollingBackoffCounter];
  v19 = +[NSNumber numberWithUnsignedInteger:v18];
  [v8 setObjectOrNull:v19 forKey:@"ri"];

  v20 = [(SQLiteEntity *)self initWithPropertyValues:v8 inDatabase:v6];
  return v20;
}

+ (id)databaseTable
{
  return @"mangosteen";
}

+ (id)_properties
{
  v4[0] = @"ra";
  v4[1] = @"rb";
  v4[2] = @"rc";
  v4[3] = @"rd";
  v4[4] = @"rf";
  v4[5] = @"rg";
  v4[6] = @"rh";
  v4[7] = @"ri";
  v2 = +[NSArray arrayWithObjects:v4 count:8];
  return v2;
}

@end