@interface ACCUserNotification
- (ACCUserNotification)init;
- (BOOL)dismissOnUnlock;
- (BOOL)ignoreQuietMode;
- (BOOL)isModal;
- (BOOL)presentViaSystemAperture;
- (NSDictionary)userNotificationCFDict;
- (NSNumber)systemSoundID;
- (NSString)defaultButtonName;
- (NSString)groupIdentifier;
- (NSString)identifier;
- (NSString)message;
- (NSString)otherButtonName;
- (NSString)title;
- (NSString)uuid;
- (NSURL)iconURL;
- (__CFUserNotification)userNotificationCF;
- (double)timeout;
- (int)type;
- (void)createBackingUserNotification;
- (void)setDefaultButtonName:(id)a3;
- (void)setDismissOnUnlock:(BOOL)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setIconURL:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIgnoreQuietMode:(BOOL)a3;
- (void)setIsModal:(BOOL)a3;
- (void)setMessage:(id)a3;
- (void)setOtherButtonName:(id)a3;
- (void)setPresentViaSystemAperture:(BOOL)a3;
- (void)setSystemSoundID:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int)a3;
- (void)setUserNotificationCF:(__CFUserNotification *)a3;
- (void)setUserNotificationCFDict:(id)a3;
@end

@implementation ACCUserNotification

- (ACCUserNotification)init
{
  v16.receiver = self;
  v16.super_class = (Class)ACCUserNotification;
  v2 = [(ACCUserNotification *)&v16 init];
  v3 = v2;
  if (v2)
  {
    v2->_userNotificationCF = 0;
    v4 = +[NSUUID UUID];
    uint64_t v5 = [v4 UUIDString];
    uuid = v3->_uuid;
    v3->_uuid = (NSString *)v5;

    v3->_type = 0;
    title = v3->_title;
    v3->_title = 0;

    message = v3->_message;
    v3->_message = 0;

    defaultButtonName = v3->_defaultButtonName;
    v3->_defaultButtonName = 0;

    otherButtonName = v3->_otherButtonName;
    v3->_otherButtonName = 0;

    iconURL = v3->_iconURL;
    v3->_iconURL = 0;

    *(_DWORD *)&v3->_isModal = 0;
    systemSoundID = v3->_systemSoundID;
    v3->_systemSoundID = 0;

    identifier = v3->_identifier;
    v3->_identifier = 0;

    groupIdentifier = v3->_groupIdentifier;
    v3->_groupIdentifier = 0;
  }
  return v3;
}

- (void)createBackingUserNotification
{
  if ([(ACCUserNotification *)self userNotificationCF]) {
    [(ACCUserNotification *)self setUserNotificationCF:0];
  }
  [(ACCUserNotification *)self isModal];
  v28[0] = kCFUserNotificationAlertHeaderKey;
  uint64_t v3 = [(ACCUserNotification *)self title];
  v4 = (void *)v3;
  if (v3) {
    uint64_t v5 = (__CFString *)v3;
  }
  else {
    uint64_t v5 = &stru_51F10;
  }
  v29[0] = v5;
  v28[1] = kCFUserNotificationAlertMessageKey;
  uint64_t v6 = [(ACCUserNotification *)self message];
  v7 = (void *)v6;
  if (v6) {
    v8 = (__CFString *)v6;
  }
  else {
    v8 = &stru_51F10;
  }
  v29[1] = v8;
  v28[2] = kCFUserNotificationAlertTopMostKey;
  v9 = +[NSNumber numberWithBool:1];
  v29[2] = v9;
  v28[3] = SBUserNotificationDismissOnLock;
  v10 = +[NSNumber numberWithBool:0];
  v29[3] = v10;
  v28[4] = SBUserNotificationDontDismissOnUnlock;
  v11 = +[NSNumber numberWithBool:[(ACCUserNotification *)self dismissOnUnlock] ^ 1];
  v29[4] = v11;
  v28[5] = SBUserNotificationIgnoresQuietMode;
  v12 = +[NSNumber numberWithBool:[(ACCUserNotification *)self ignoreQuietMode]];
  v29[5] = v12;
  v13 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:6];
  id v14 = [v13 mutableCopy];

  uint64_t v15 = [(ACCUserNotification *)self defaultButtonName];
  if (v15)
  {
    objc_super v16 = (void *)v15;
    v17 = [(ACCUserNotification *)self defaultButtonName];
    id v18 = [v17 length];

    if (v18)
    {
      v19 = [(ACCUserNotification *)self defaultButtonName];
      [v14 setObject:v19 forKey:kCFUserNotificationDefaultButtonTitleKey];
    }
  }
  uint64_t v20 = [(ACCUserNotification *)self otherButtonName];
  if (v20)
  {
    v21 = (void *)v20;
    v22 = [(ACCUserNotification *)self otherButtonName];
    id v23 = [v22 length];

    if (v23)
    {
      v24 = [(ACCUserNotification *)self otherButtonName];
      [v14 setObject:v24 forKey:kCFUserNotificationAlternateButtonTitleKey];
    }
  }
  v25 = [(ACCUserNotification *)self systemSoundID];

  if (v25)
  {
    v26 = [(ACCUserNotification *)self systemSoundID];
    [v14 setObject:v26 forKey:SBUserNotificationSystemSoundIDKey];
  }
  if ([(ACCUserNotification *)self presentViaSystemAperture]) {
    [v14 setObject:&__kCFBooleanTrue forKey:SBUserNotificationSystemAperturePresentationKey];
  }
  id v27 = [v14 copy];
  [(ACCUserNotification *)self setUserNotificationCFDict:v27];
}

- (void)setUserNotificationCF:(__CFUserNotification *)a3
{
  userNotificationCF = self->_userNotificationCF;
  if (userNotificationCF) {
    CFRelease(userNotificationCF);
  }
  if (a3) {
    uint64_t v6 = (__CFUserNotification *)CFRetain(a3);
  }
  else {
    uint64_t v6 = 0;
  }
  self->_userNotificationCF = v6;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)defaultButtonName
{
  return self->_defaultButtonName;
}

- (void)setDefaultButtonName:(id)a3
{
}

- (NSString)otherButtonName
{
  return self->_otherButtonName;
}

- (void)setOtherButtonName:(id)a3
{
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
}

- (BOOL)isModal
{
  return self->_isModal;
}

- (void)setIsModal:(BOOL)a3
{
  self->_isModal = a3;
}

- (BOOL)dismissOnUnlock
{
  return self->_dismissOnUnlock;
}

- (void)setDismissOnUnlock:(BOOL)a3
{
  self->_dismissOnUnlock = a3;
}

- (BOOL)ignoreQuietMode
{
  return self->_ignoreQuietMode;
}

- (void)setIgnoreQuietMode:(BOOL)a3
{
  self->_ignoreQuietMode = a3;
}

- (BOOL)presentViaSystemAperture
{
  return self->_presentViaSystemAperture;
}

- (void)setPresentViaSystemAperture:(BOOL)a3
{
  self->_presentViaSystemAperture = a3;
}

- (NSNumber)systemSoundID
{
  return self->_systemSoundID;
}

- (void)setSystemSoundID:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
}

- (NSDictionary)userNotificationCFDict
{
  return self->_userNotificationCFDict;
}

- (void)setUserNotificationCFDict:(id)a3
{
}

- (__CFUserNotification)userNotificationCF
{
  return self->_userNotificationCF;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNotificationCFDict, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_systemSoundID, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_otherButtonName, 0);
  objc_storeStrong((id *)&self->_defaultButtonName, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end