@interface FCNotificationDropboxData
- (FCNotificationDropboxData)init;
- (FCNotificationDropboxData)initWithDictionary:(id)a3;
- (NSDictionary)dictionary;
- (NSString)baseURLString;
- (NSString)deviceToken;
- (NSString)notificationUserID;
- (NSString)storefrontID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int)deviceDigestMode;
@end

@implementation FCNotificationDropboxData

- (FCNotificationDropboxData)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCNotificationDropboxData init]";
    __int16 v9 = 2080;
    v10 = "FCFileCoordinatedNotificationDropbox.m";
    __int16 v11 = 1024;
    int v12 = 98;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCNotificationDropboxData init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCNotificationDropboxData)initWithDictionary:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "dictionary");
    *(_DWORD *)buf = 136315906;
    int v12 = "-[FCNotificationDropboxData initWithDictionary:]";
    __int16 v13 = 2080;
    v14 = "FCFileCoordinatedNotificationDropbox.m";
    __int16 v15 = 1024;
    int v16 = 103;
    __int16 v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v10.receiver = self;
  v10.super_class = (Class)FCNotificationDropboxData;
  id v6 = [(FCNotificationDropboxData *)&v10 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dictionary, a3);
  }

  return v7;
}

- (NSString)baseURLString
{
  v2 = [(FCNotificationDropboxData *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"FCNotificationDropboxDataBaseURLDictionaryKey"];

  return (NSString *)v3;
}

- (NSString)notificationUserID
{
  v2 = [(FCNotificationDropboxData *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"FCNotificationDropboxDataNotificationUserIDDictionaryKey"];

  return (NSString *)v3;
}

- (NSString)deviceToken
{
  v2 = [(FCNotificationDropboxData *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"FCNotificationDropboxDataDeviceTokenDictionaryKey"];

  return (NSString *)v3;
}

- (NSString)storefrontID
{
  v2 = [(FCNotificationDropboxData *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"FCNotificationDropboxDataStorefrontIDDictionaryKey"];

  return (NSString *)v3;
}

- (int)deviceDigestMode
{
  v2 = [(FCNotificationDropboxData *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"FCNotificationDropboxDataDeviceDigestModeKey"];

  LODWORD(v2) = [v3 intValue];
  return (int)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = +[FCNotificationDropboxData allocWithZone:](FCNotificationDropboxData, "allocWithZone:");
  id v6 = [(FCNotificationDropboxData *)self dictionary];
  v7 = (void *)[v6 copyWithZone:a3];
  v8 = [(FCNotificationDropboxData *)v5 initWithDictionary:v7];

  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v5 = +[FCMutableNotificationData allocWithZone:](FCMutableNotificationData, "allocWithZone:");
  id v6 = [(FCNotificationDropboxData *)self dictionary];
  v7 = (void *)[v6 mutableCopyWithZone:a3];
  v8 = [(FCMutableNotificationData *)v5 initWithDictionary:v7];

  return v8;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
}

@end