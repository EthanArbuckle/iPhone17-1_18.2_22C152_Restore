@interface FCMutableNotificationData
- (FCMutableNotificationData)init;
- (FCMutableNotificationData)initWithDictionary:(id)a3;
- (void)setBaseURLString:(id)a3;
- (void)setDeviceDigestMode:(int)a3;
- (void)setDeviceToken:(id)a3;
- (void)setNotificationUserID:(id)a3;
- (void)setStorefrontID:(id)a3;
@end

@implementation FCMutableNotificationData

- (FCMutableNotificationData)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCMutableNotificationData init]";
    __int16 v9 = 2080;
    v10 = "FCFileCoordinatedNotificationDropbox.m";
    __int16 v11 = 1024;
    int v12 = 159;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCMutableNotificationData init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCMutableNotificationData)initWithDictionary:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "dictionary");
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCMutableNotificationData initWithDictionary:]";
    __int16 v11 = 2080;
    int v12 = "FCFileCoordinatedNotificationDropbox.m";
    __int16 v13 = 1024;
    int v14 = 164;
    __int16 v15 = 2114;
    v16 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v8.receiver = self;
  v8.super_class = (Class)FCMutableNotificationData;
  v5 = [(FCNotificationDropboxData *)&v8 initWithDictionary:v4];

  return v5;
}

- (void)setBaseURLString:(id)a3
{
  id v4 = a3;
  id v5 = [(FCNotificationDropboxData *)self dictionary];
  objc_msgSend(v5, "fc_safelySetObjectAllowingNil:forKey:", v4, @"FCNotificationDropboxDataBaseURLDictionaryKey");
}

- (void)setNotificationUserID:(id)a3
{
  id v4 = a3;
  id v5 = [(FCNotificationDropboxData *)self dictionary];
  objc_msgSend(v5, "fc_safelySetObjectAllowingNil:forKey:", v4, @"FCNotificationDropboxDataNotificationUserIDDictionaryKey");
}

- (void)setDeviceToken:(id)a3
{
  id v4 = a3;
  id v5 = [(FCNotificationDropboxData *)self dictionary];
  objc_msgSend(v5, "fc_safelySetObjectAllowingNil:forKey:", v4, @"FCNotificationDropboxDataDeviceTokenDictionaryKey");
}

- (void)setStorefrontID:(id)a3
{
  id v4 = a3;
  id v5 = [(FCNotificationDropboxData *)self dictionary];
  objc_msgSend(v5, "fc_safelySetObjectAllowingNil:forKey:", v4, @"FCNotificationDropboxDataStorefrontIDDictionaryKey");
}

- (void)setDeviceDigestMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(FCNotificationDropboxData *)self dictionary];
  id v4 = [NSNumber numberWithInt:v3];
  objc_msgSend(v5, "fc_safelySetObjectAllowingNil:forKey:", v4, @"FCNotificationDropboxDataDeviceDigestModeKey");
}

@end