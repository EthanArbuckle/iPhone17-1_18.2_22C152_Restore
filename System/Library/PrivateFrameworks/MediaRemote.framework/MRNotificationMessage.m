@interface MRNotificationMessage
- (MRNotificationMessage)initWithNotification:(id)a3;
- (MRPlayerPath)playerPath;
- (NSDictionary)userInfo;
- (NSString)notification;
- (unint64_t)type;
@end

@implementation MRNotificationMessage

- (MRNotificationMessage)initWithNotification:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MRNotificationMessage;
  v5 = [(MRProtocolMessage *)&v16 init];
  if (v5)
  {
    v6 = objc_alloc_init(_MRNotificationMessageProtobuf);
    v7 = [v4 name];
    [(_MRNotificationMessageProtobuf *)v6 addNotification:v7];

    v8 = [v4 userInfo];
    v9 = (void *)[v8 mutableCopy];

    v11 = MRGetPlayerPathFromUserInfo(v9, v10);
    if (v11)
    {
      [v9 removeObjectForKey:@"kMRNowPlayingPlayerPathUserInfoKey"];
      [v9 removeObjectForKey:@"kMRNowPlayingPlayerUserInfoKey"];
      [v9 removeObjectForKey:@"kMRNowPlayingClientUserInfoKey"];
      [v9 removeObjectForKey:@"kMRMediaRemoteOriginUserInfoKey"];
      v12 = [v11 protobuf];
      [(_MRNotificationMessageProtobuf *)v6 addPlayerPath:v12];
    }
    if ([v9 count])
    {
      v13 = MRCreateEncodedUserInfo(v9);
      v14 = MSVArchivedDataWithRootObject();
      [(_MRNotificationMessageProtobuf *)v6 addUserInfo:v14];
    }
    [(MRProtocolMessage *)v5 setUnderlyingCodableMessage:v6];
  }
  return v5;
}

- (NSString)notification
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v3 = [v2 notifications];
  id v4 = [v3 firstObject];

  return (NSString *)v4;
}

- (NSDictionary)userInfo
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v3 = [(MRProtocolMessage *)self underlyingCodableMessage];
  id v4 = [v3 userInfos];
  v5 = [v4 firstObject];

  if (v5)
  {
    v6 = MSVPropertyListDataClasses();
    v7 = MSVUnarchivedObjectOfClasses();
  }
  else
  {
    v7 = 0;
  }
  uint64_t v8 = [(MRNotificationMessage *)self playerPath];
  v9 = (void *)v8;
  if (v8)
  {
    if (v7)
    {
      v10 = (void *)[v7 mutableCopy];
      [v10 setObject:v9 forKey:@"kMRNowPlayingPlayerPathUserInfoKey"];

      v7 = v10;
    }
    else
    {
      v13 = @"kMRNowPlayingPlayerPathUserInfoKey";
      v14[0] = v8;
      v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    }
  }
  v11 = MRCreateDecodedUserInfo(v7);

  return (NSDictionary *)v11;
}

- (MRPlayerPath)playerPath
{
  v3 = [MRPlayerPath alloc];
  id v4 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v5 = [v4 playerPaths];
  v6 = [v5 firstObject];
  v7 = [(MRPlayerPath *)v3 initWithProtobuf:v6];

  return v7;
}

- (unint64_t)type
{
  return 11;
}

@end