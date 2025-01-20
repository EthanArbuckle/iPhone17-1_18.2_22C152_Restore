@interface STUserData
- (BOOL)checkForUnsafePhotos;
- (BOOL)hasPasscode;
- (BOOL)isCommunicationSafetyAnalyticsEnabled;
- (BOOL)isCommunicationSafetyNotificationEnabled;
- (BOOL)isParent;
- (BOOL)isRemote;
- (BOOL)screenTimeEnabled;
- (BOOL)syncingEnabled;
- (NSString)familyMemberType;
- (NSString)givenName;
- (NSString)identifier;
- (STUserData)initWithIdentifier:(id)a3 givenName:(id)a4 isParent:(BOOL)a5 isRemote:(BOOL)a6 hasPasscode:(BOOL)a7 screenTimeEnabled:(BOOL)a8 syncingEnabled:(BOOL)a9 checkForUnsafePhotos:(BOOL)a10 communicationSafetyNotificationEnabled:(BOOL)a11 communicationSafetyAnalyticsEnabled:(BOOL)a12 familyMemberType:(id)a13;
@end

@implementation STUserData

- (STUserData)initWithIdentifier:(id)a3 givenName:(id)a4 isParent:(BOOL)a5 isRemote:(BOOL)a6 hasPasscode:(BOOL)a7 screenTimeEnabled:(BOOL)a8 syncingEnabled:(BOOL)a9 checkForUnsafePhotos:(BOOL)a10 communicationSafetyNotificationEnabled:(BOOL)a11 communicationSafetyAnalyticsEnabled:(BOOL)a12 familyMemberType:(id)a13
{
  id v20 = a3;
  id v21 = a4;
  id v22 = a13;
  v28.receiver = self;
  v28.super_class = (Class)STUserData;
  v23 = [(STUserData *)&v28 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_identifier, a3);
    objc_storeStrong((id *)&v24->_givenName, a4);
    v24->_isParent = a5;
    v24->_isRemote = a6;
    v24->_hasPasscode = a7;
    v24->_screenTimeEnabled = a8;
    v24->_syncingEnabled = a9;
    v24->_checkForUnsafePhotos = a10;
    v24->_isCommunicationSafetyNotificationEnabled = a11;
    v24->_isCommunicationSafetyAnalyticsEnabled = a12;
    uint64_t v25 = [v22 copy];
    familyMemberType = v24->_familyMemberType;
    v24->_familyMemberType = (NSString *)v25;
  }
  return v24;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)givenName
{
  return self->_givenName;
}

- (BOOL)isParent
{
  return self->_isParent;
}

- (BOOL)isRemote
{
  return self->_isRemote;
}

- (BOOL)hasPasscode
{
  return self->_hasPasscode;
}

- (BOOL)screenTimeEnabled
{
  return self->_screenTimeEnabled;
}

- (BOOL)syncingEnabled
{
  return self->_syncingEnabled;
}

- (BOOL)checkForUnsafePhotos
{
  return self->_checkForUnsafePhotos;
}

- (BOOL)isCommunicationSafetyNotificationEnabled
{
  return self->_isCommunicationSafetyNotificationEnabled;
}

- (BOOL)isCommunicationSafetyAnalyticsEnabled
{
  return self->_isCommunicationSafetyAnalyticsEnabled;
}

- (NSString)familyMemberType
{
  return self->_familyMemberType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyMemberType, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end