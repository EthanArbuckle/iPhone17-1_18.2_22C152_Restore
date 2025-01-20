@interface CDUserNotificationContent
+ (CDUserNotificationContent)appSignInContent;
+ (CDUserNotificationContent)learnMoreContent;
+ (CDUserNotificationContent)legacyAppSignInContent;
+ (CDUserNotificationContent)registerPasskeyContent;
+ (CDUserNotificationContent)storeAuthenticationContent;
+ (CDUserNotificationContent)storePurchaseContent;
+ (CDUserNotificationContent)tvProviderContent;
+ (id)_photosContent;
+ (id)_recognizeMyVoiceContent;
+ (id)_sharedWithYouContent;
+ (id)dedicatedCameraContentForDeviceType:(int64_t)a3;
+ (id)notificationContentForSystemService:(int64_t)a3;
+ (id)restrictedAccessContentForRestrictionType:(int64_t)a3;
- (NSArray)bodyArguments;
- (NSArray)titleArguments;
- (NSString)bodyKey;
- (NSString)bundleIdentifier;
- (NSString)categoryIdentifier;
- (NSString)iconName;
- (NSString)iconSystemName;
- (NSString)identifier;
- (NSString)titleKey;
- (unsigned)flags;
- (void)addBodyArgument:(id)a3;
- (void)addTitleArgument:(id)a3;
- (void)setBodyKey:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCategoryIdentifier:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setIconName:(id)a3;
- (void)setIconSystemName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setTitleKey:(id)a3;
@end

@implementation CDUserNotificationContent

+ (CDUserNotificationContent)appSignInContent
{
  v2 = objc_alloc_init(CDUserNotificationContent);
  [(CDUserNotificationContent *)v2 setBundleIdentifier:@"com.apple.CompanionNotifications"];
  [(CDUserNotificationContent *)v2 setCategoryIdentifier:@"CDUserNotificationCategoryGeneric"];
  [(CDUserNotificationContent *)v2 setFlags:17];
  [(CDUserNotificationContent *)v2 setIconSystemName:@"person.crop.circle"];
  [(CDUserNotificationContent *)v2 setTitleKey:@"APP_SIGN_IN_TITLE"];
  v3 = (void *)GestaltCopyAnswer();
  v4 = +[NSString stringWithFormat:@"%@_%@", @"APP_SIGN_IN_BODY", v3];
  v5 = [v4 uppercaseString];

  [(CDUserNotificationContent *)v2 setBodyKey:v5];

  return v2;
}

+ (CDUserNotificationContent)legacyAppSignInContent
{
  v2 = objc_alloc_init(CDUserNotificationContent);
  [(CDUserNotificationContent *)v2 setBundleIdentifier:@"com.apple.CompanionNotifications"];
  [(CDUserNotificationContent *)v2 setCategoryIdentifier:@"CDUserNotificationCategoryGeneric"];
  [(CDUserNotificationContent *)v2 setFlags:17];
  [(CDUserNotificationContent *)v2 setIconSystemName:@"person.crop.circle"];
  [(CDUserNotificationContent *)v2 setTitleKey:@"LEGACY_APP_SIGN_IN_TITLE"];
  [(CDUserNotificationContent *)v2 setBodyKey:@"LEGACY_APP_SIGN_IN_BODY"];

  return v2;
}

+ (CDUserNotificationContent)storePurchaseContent
{
  v2 = objc_alloc_init(CDUserNotificationContent);
  [(CDUserNotificationContent *)v2 setBundleIdentifier:@"com.apple.CompanionNotifications"];
  [(CDUserNotificationContent *)v2 setCategoryIdentifier:@"CDUserNotificationCategoryGeneric"];
  [(CDUserNotificationContent *)v2 setFlags:17];
  if (GestaltGetBoolean()) {
    CFStringRef v3 = @"faceid";
  }
  else {
    CFStringRef v3 = @"touchid";
  }
  [(CDUserNotificationContent *)v2 setIconSystemName:v3];
  [(CDUserNotificationContent *)v2 setTitleKey:@"STORE_PURCHASE_TITLE"];
  v4 = (void *)GestaltCopyAnswer();
  v5 = +[NSString stringWithFormat:@"%@_%@", @"STORE_PURCHASE_BODY", v4];
  v6 = [v5 uppercaseString];

  [(CDUserNotificationContent *)v2 setBodyKey:v6];

  return v2;
}

+ (CDUserNotificationContent)registerPasskeyContent
{
  v2 = objc_alloc_init(CDUserNotificationContent);
  [(CDUserNotificationContent *)v2 setBundleIdentifier:@"com.apple.CompanionNotifications"];
  [(CDUserNotificationContent *)v2 setCategoryIdentifier:@"CDUserNotificationCategoryGeneric"];
  [(CDUserNotificationContent *)v2 setFlags:17];
  [(CDUserNotificationContent *)v2 setIconSystemName:@"person.badge.key.fill"];
  [(CDUserNotificationContent *)v2 setTitleKey:@"REGISTER_PASSKEY_TITLE"];
  CFStringRef v3 = (void *)GestaltCopyAnswer();
  v4 = +[NSString stringWithFormat:@"%@_%@", @"REGISTER_PASSKEY_BODY", v3];
  v5 = [v4 uppercaseString];

  [(CDUserNotificationContent *)v2 setBodyKey:v5];

  return v2;
}

+ (id)notificationContentForSystemService:(int64_t)a3
{
  switch(a3)
  {
    case 4:
      CFStringRef v3 = [a1 _recognizeMyVoiceContent];
      break;
    case 3:
      CFStringRef v3 = [a1 _photosContent];
      break;
    case 2:
      CFStringRef v3 = [a1 _sharedWithYouContent];
      break;
    default:
      CFStringRef v3 = 0;
      break;
  }

  return v3;
}

+ (id)restrictedAccessContentForRestrictionType:(int64_t)a3
{
  v4 = objc_alloc_init(CDUserNotificationContent);
  [(CDUserNotificationContent *)v4 setBundleIdentifier:@"com.apple.CompanionNotifications"];
  [(CDUserNotificationContent *)v4 setCategoryIdentifier:@"CDUserNotificationCategoryGeneric"];
  [(CDUserNotificationContent *)v4 setFlags:17];
  [(CDUserNotificationContent *)v4 setIconSystemName:@"figure.child.and.lock.fill"];
  [(CDUserNotificationContent *)v4 setTitleKey:@"RESTRICTED_ACCESS_TITLE"];
  switch(a3)
  {
    case 1:
      v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"RESTRICTED_ACCESS_BODY_CONTENT";
      goto LABEL_8;
    case 2:
      v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"RESTRICTED_ACCESS_BODY_SETTINGS";
      goto LABEL_8;
    case 3:
      v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"RESTRICTED_ACCESS_BODY_PURCHASE";
      goto LABEL_8;
    case 4:
      v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"RESTRICTED_ACCESS_BODY_CONFERENCE_ROOM_DISPLAY";
      goto LABEL_8;
    case 5:
      v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"RESTRICTED_ACCESS_BODY_MODIFY_RESTRICTIONS";
      goto LABEL_8;
    case 6:
      v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"RESTRICTED_ACCESS_BODY_TURN_OFF_RESTRICTIONS";
LABEL_8:
      v8 = [v5 localizedStringForKey:v7 value:&stru_100035B58 table:0];
      [(CDUserNotificationContent *)v4 setBodyKey:v8];

      break;
    default:
      break;
  }

  return v4;
}

+ (CDUserNotificationContent)storeAuthenticationContent
{
  v2 = objc_alloc_init(CDUserNotificationContent);
  [(CDUserNotificationContent *)v2 setBundleIdentifier:@"com.apple.CompanionNotifications"];
  [(CDUserNotificationContent *)v2 setCategoryIdentifier:@"CDUserNotificationCategoryGeneric"];
  [(CDUserNotificationContent *)v2 setFlags:17];
  [(CDUserNotificationContent *)v2 setIconSystemName:@"person.circle"];
  [(CDUserNotificationContent *)v2 setTitleKey:@"STORE_AUTHENTICATION_TITLE"];
  CFStringRef v3 = (void *)GestaltCopyAnswer();
  v4 = +[NSString stringWithFormat:@"%@_%@", @"STORE_AUTHENTICATION_BODY", v3];
  v5 = [v4 uppercaseString];

  [(CDUserNotificationContent *)v2 setBodyKey:v5];

  return v2;
}

+ (CDUserNotificationContent)tvProviderContent
{
  v2 = objc_alloc_init(CDUserNotificationContent);
  [(CDUserNotificationContent *)v2 setBundleIdentifier:@"com.apple.CompanionNotifications"];
  [(CDUserNotificationContent *)v2 setCategoryIdentifier:@"CDUserNotificationCategoryGeneric"];
  [(CDUserNotificationContent *)v2 setFlags:17];
  [(CDUserNotificationContent *)v2 setIconSystemName:@"tv"];
  [(CDUserNotificationContent *)v2 setTitleKey:@"TV_PROVIDER_TITLE"];
  CFStringRef v3 = (void *)GestaltCopyAnswer();
  v4 = +[NSString stringWithFormat:@"%@_%@", @"TV_PROVIDER_BODY", v3];
  v5 = [v4 uppercaseString];

  [(CDUserNotificationContent *)v2 setBodyKey:v5];

  return v2;
}

+ (CDUserNotificationContent)learnMoreContent
{
  v2 = objc_alloc_init(CDUserNotificationContent);
  [(CDUserNotificationContent *)v2 setBundleIdentifier:@"com.apple.CompanionNotifications"];
  [(CDUserNotificationContent *)v2 setCategoryIdentifier:@"CDUserNotificationCategoryGeneric"];
  [(CDUserNotificationContent *)v2 setFlags:17];
  [(CDUserNotificationContent *)v2 setIconSystemName:@"safari"];
  [(CDUserNotificationContent *)v2 setTitleKey:@"LEARN_MORE_TITLE"];
  CFStringRef v3 = (void *)GestaltCopyAnswer();
  v4 = +[NSString stringWithFormat:@"%@_%@", @"LEARN_MORE_BODY", v3];
  v5 = [v4 uppercaseString];

  [(CDUserNotificationContent *)v2 setBodyKey:v5];

  return v2;
}

+ (id)dedicatedCameraContentForDeviceType:(int64_t)a3
{
  CFStringRef v3 = objc_alloc_init(CDUserNotificationContent);
  [(CDUserNotificationContent *)v3 setBundleIdentifier:@"com.apple.CompanionNotifications"];
  [(CDUserNotificationContent *)v3 setCategoryIdentifier:@"CDUserNotificationCategoryGeneric"];
  [(CDUserNotificationContent *)v3 setFlags:17];
  [(CDUserNotificationContent *)v3 setIconSystemName:@"rectangle.inset.filled.and.camera"];
  [(CDUserNotificationContent *)v3 setTitleKey:@"DEDICATED_CAMERA_TITLE"];
  v4 = +[NSString stringWithFormat:@"%@_%@", @"DEDICATED_CAMERA_BODY", @"AppleTV"];
  v5 = [v4 uppercaseString];

  [(CDUserNotificationContent *)v3 setBodyKey:v5];

  return v3;
}

- (NSArray)titleArguments
{
  id v2 = [(NSMutableArray *)self->_mutableTitleArguments copy];
  CFStringRef v3 = v2;
  if (!v2) {
    id v2 = &__NSArray0__struct;
  }
  v4 = (NSArray *)v2;

  return v4;
}

- (void)addTitleArgument:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  mutableTitleArguments = self->_mutableTitleArguments;
  id v10 = v4;
  if (mutableTitleArguments)
  {
    if (v4)
    {
LABEL_3:
      [(NSMutableArray *)mutableTitleArguments addObject:v5];
      goto LABEL_6;
    }
  }
  else
  {
    CFStringRef v7 = +[NSMutableArray array];
    v8 = self->_mutableTitleArguments;
    self->_mutableTitleArguments = v7;

    id v5 = v10;
    mutableTitleArguments = self->_mutableTitleArguments;
    if (v10) {
      goto LABEL_3;
    }
  }
  v9 = +[NSNull null];
  [(NSMutableArray *)mutableTitleArguments addObject:v9];

LABEL_6:
}

- (NSArray)bodyArguments
{
  id v2 = [(NSMutableArray *)self->_mutableBodyArguments copy];
  CFStringRef v3 = v2;
  if (!v2) {
    id v2 = &__NSArray0__struct;
  }
  id v4 = (NSArray *)v2;

  return v4;
}

- (void)addBodyArgument:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  mutableBodyArguments = self->_mutableBodyArguments;
  id v10 = v4;
  if (mutableBodyArguments)
  {
    if (v4)
    {
LABEL_3:
      [(NSMutableArray *)mutableBodyArguments addObject:v5];
      goto LABEL_6;
    }
  }
  else
  {
    CFStringRef v7 = +[NSMutableArray array];
    v8 = self->_mutableBodyArguments;
    self->_mutableBodyArguments = v7;

    id v5 = v10;
    mutableBodyArguments = self->_mutableBodyArguments;
    if (v10) {
      goto LABEL_3;
    }
  }
  v9 = +[NSNull null];
  [(NSMutableArray *)mutableBodyArguments addObject:v9];

LABEL_6:
}

+ (id)_sharedWithYouContent
{
  id v2 = objc_alloc_init(CDUserNotificationContent);
  [(CDUserNotificationContent *)v2 setBundleIdentifier:@"com.apple.CompanionNotifications"];
  [(CDUserNotificationContent *)v2 setCategoryIdentifier:@"CDUserNotificationCategoryGeneric"];
  [(CDUserNotificationContent *)v2 setFlags:17];
  [(CDUserNotificationContent *)v2 setIconSystemName:@"shared.with.you"];
  [(CDUserNotificationContent *)v2 setTitleKey:@"SHARED_WITH_YOU_TITLE"];
  CFStringRef v3 = (void *)GestaltCopyAnswer();
  id v4 = +[NSString stringWithFormat:@"%@_%@", @"SHARED_WITH_YOU_BODY", v3];
  id v5 = [v4 uppercaseString];

  [(CDUserNotificationContent *)v2 setBodyKey:v5];

  return v2;
}

+ (id)_photosContent
{
  id v2 = objc_alloc_init(CDUserNotificationContent);
  [(CDUserNotificationContent *)v2 setBundleIdentifier:@"com.apple.CompanionNotifications"];
  [(CDUserNotificationContent *)v2 setCategoryIdentifier:@"CDUserNotificationCategoryGeneric"];
  [(CDUserNotificationContent *)v2 setFlags:17];
  [(CDUserNotificationContent *)v2 setIconSystemName:@"photos"];
  [(CDUserNotificationContent *)v2 setTitleKey:@"PHOTOS_TITLE"];
  CFStringRef v3 = (void *)GestaltCopyAnswer();
  id v4 = +[NSString stringWithFormat:@"%@_%@", @"PHOTOS_BODY", v3];
  id v5 = [v4 uppercaseString];

  [(CDUserNotificationContent *)v2 setBodyKey:v5];

  return v2;
}

+ (id)_recognizeMyVoiceContent
{
  id v2 = objc_alloc_init(CDUserNotificationContent);
  [(CDUserNotificationContent *)v2 setBundleIdentifier:@"com.apple.CompanionNotifications"];
  [(CDUserNotificationContent *)v2 setCategoryIdentifier:@"CDUserNotificationCategoryGeneric"];
  [(CDUserNotificationContent *)v2 setFlags:17];
  [(CDUserNotificationContent *)v2 setIconName:@"siri-icon"];
  [(CDUserNotificationContent *)v2 setTitleKey:@"RECOGNIZE_MY_VOICE_TITLE"];
  CFStringRef v3 = (void *)GestaltCopyAnswer();
  id v4 = +[NSString stringWithFormat:@"%@_%@", @"RECOGNIZE_MY_VOICE_BODY", v3];
  id v5 = [v4 uppercaseString];

  [(CDUserNotificationContent *)v2 setBodyKey:v5];

  return v2;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (void)setCategoryIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (NSString)iconSystemName
{
  return self->_iconSystemName;
}

- (void)setIconSystemName:(id)a3
{
}

- (NSString)iconName
{
  return self->_iconName;
}

- (void)setIconName:(id)a3
{
}

- (NSString)titleKey
{
  return self->_titleKey;
}

- (void)setTitleKey:(id)a3
{
}

- (NSString)bodyKey
{
  return self->_bodyKey;
}

- (void)setBodyKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyKey, 0);
  objc_storeStrong((id *)&self->_titleKey, 0);
  objc_storeStrong((id *)&self->_iconName, 0);
  objc_storeStrong((id *)&self->_iconSystemName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_mutableBodyArguments, 0);

  objc_storeStrong((id *)&self->_mutableTitleArguments, 0);
}

@end