@interface ABSValidationSyncObject
+ (BOOL)validationEnabled;
+ (void)validateAgainst:(id)a3;
- (ABSValidationSyncObject)init;
- (BOOL)isEqual:(id)a3;
- (id)createProtobufWithOptions:(id)a3;
- (id)description;
- (id)objectIdentifier;
- (int64_t)changeType;
@end

@implementation ABSValidationSyncObject

- (ABSValidationSyncObject)init
{
  v7.receiver = self;
  v7.super_class = (Class)ABSValidationSyncObject;
  v2 = [(ABSValidationSyncObject *)&v7 init];
  if (v2)
  {
    v3 = +[ABSContactsInterface sharedInstance];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10002E188;
    v5[3] = &unk_100055170;
    v6 = v2;
    [v3 accessSync:v5];
  }
  return v2;
}

+ (BOOL)validationEnabled
{
  v2 = +[SYDevice targetableDevice];
  v3 = [v2 systemBuildVersion];

  v4 = [v3 substringToIndex:3];
  if ([v4 compare:@"16R" options:64] == (id)-1
    || !+[NDTLog isInternalDevice])
  {
    BOOL v7 = 0;
  }
  else
  {
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"cvEnabled", @"com.apple.Bridge.ContactsSyncDebug", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      BOOL v6 = AppBooleanValue == 0;
    }
    else {
      BOOL v6 = 0;
    }
    BOOL v7 = !v6;
  }

  return v7;
}

- (id)objectIdentifier
{
  return @"NYET";
}

- (int64_t)changeType
{
  return 2;
}

- (id)createProtobufWithOptions:(id)a3
{
  v4 = [[ABSPBSyncObject alloc] initWithMemo:@"Validation"];
  v5 = objc_alloc_init(ABSPBCountValidationObject);
  [(ABSPBSyncObject *)v4 setCountValidationObject:v5];

  int64_t rawContactCount = self->_rawContactCount;
  if ((rawContactCount & 0x8000000000000000) == 0)
  {
    BOOL v7 = [(ABSPBSyncObject *)v4 countValidationObject];
    [v7 setRawCount:rawContactCount];
  }
  int64_t unifiedContactCount = self->_unifiedContactCount;
  if ((unifiedContactCount & 0x8000000000000000) == 0)
  {
    v9 = [(ABSPBSyncObject *)v4 countValidationObject];
    [v9 setUnifiedCount:unifiedContactCount];
  }
  int64_t favoritesCount = self->_favoritesCount;
  if ((favoritesCount & 0x8000000000000000) == 0)
  {
    v11 = [(ABSPBSyncObject *)v4 countValidationObject];
    [v11 setFavoritesCount:favoritesCount];
  }
  BOOL v12 = CFPreferencesGetAppBooleanValue(@"cvAlertEnabled", @"com.apple.Bridge.ContactsSyncDebug", 0) != 0;
  v13 = [(ABSPBSyncObject *)v4 countValidationObject];
  [v13 setShowAlert:v12];

  v14 = [(ABSPBSyncObject *)v4 data];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    BOOL v6 = self->_rawContactCount == v5[2] && self->_unifiedContactCount == v5[3] && self->_favoritesCount == v5[4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@:%p raw:%d unified:%d favorites:%d>", v4, self, self->_rawContactCount, self->_unifiedContactCount, self->_favoritesCount];

  return v5;
}

+ (void)validateAgainst:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(ABSValidationSyncObject);
  if ([v3 hasRawCount]) {
    BOOL v5 = [v3 rawCount] != (id)v4->_rawContactCount;
  }
  else {
    BOOL v5 = 0;
  }
  if ([v3 hasUnifiedCount]) {
    BOOL v6 = [v3 unifiedCount] != (id)v4->_unifiedContactCount;
  }
  else {
    BOOL v6 = 0;
  }
  int v7 = v6 || v5;
  if ([v3 hasFavoritesCount]) {
    BOOL v8 = [v3 favoritesCount] != (id)v4->_favoritesCount;
  }
  else {
    BOOL v8 = 0;
  }
  if (v7 | v8)
  {
    v9 = *(NSObject **)(qword_100069D78 + 8);
    if (byte_100069D2C)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100038664();
      }
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        sub_1000386DC();
      }
      byte_100069D2C = 1;
      if ([v3 showAlert])
      {
        v11 = +[NSString stringWithFormat:@"Contact count mismatch. Please file a radar against \"AddressBookSync | watchOS\""];
        CFUserNotificationDisplayNotice(0.0, 0, 0, 0, 0, @"Sync validation failure", v11, @"OK");
      }
    }
  }
  else
  {
    v10 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Census validation successful. Remote: %@", (uint8_t *)&v12, 0xCu);
    }
    byte_100069D2C = 0;
  }
}

@end