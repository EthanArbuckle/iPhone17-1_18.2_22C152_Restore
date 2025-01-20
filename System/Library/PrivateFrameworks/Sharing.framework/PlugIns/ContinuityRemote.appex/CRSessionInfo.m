@interface CRSessionInfo
+ (id)placeholderImage;
+ (id)sessionInfoWithNotification:(id)a3;
- (BOOL)isValid;
- (BOOL)secureTextEntry;
- (BOOL)shouldUpdateAfterOpen;
- (CRSessionInfo)initWithNotification:(id)a3;
- (NSString)appName;
- (NSString)descriptiveText;
- (NSString)deviceIdentifier;
- (NSString)deviceName;
- (NSString)placeholderText;
- (NSString)sessionID;
- (UIImage)appImage;
- (int64_t)keyboardType;
- (int64_t)returnKeyType;
- (void)initDataWithNotification:(id)a3;
- (void)initTestDataWithNotification:(id)a3;
- (void)setAppImage:(id)a3;
- (void)setAppName:(id)a3;
- (void)setDescriptiveText:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setIsValid:(BOOL)a3;
- (void)setKeyboardType:(int64_t)a3;
- (void)setPlaceholderText:(id)a3;
- (void)setReturnKeyType:(int64_t)a3;
- (void)setSecureTextEntry:(BOOL)a3;
- (void)setSessionID:(id)a3;
- (void)setShouldUpdateAfterOpen:(BOOL)a3;
- (void)updateKeyboardPropertiesWithTextSessionInfo:(id)a3;
- (void)updateWithTextSessionInfo:(id)a3;
@end

@implementation CRSessionInfo

+ (id)sessionInfoWithNotification:(id)a3
{
  id v3 = a3;
  v4 = [[CRSessionInfo alloc] initWithNotification:v3];

  return v4;
}

- (CRSessionInfo)initWithNotification:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRSessionInfo;
  v5 = [(CRSessionInfo *)&v13 init];
  if (v5)
  {
    v6 = [v4 request];
    v7 = [v6 content];
    v8 = [v7 userInfo];
    v9 = [v8 objectForKey:@"deviceIdentifier"];

    if (v9)
    {
      if ([v9 isEqualToString:@"00000000-0000-0000-0000-000000000000"]) {
        [(CRSessionInfo *)v5 initTestDataWithNotification:v4];
      }
      else {
        [(CRSessionInfo *)v5 initDataWithNotification:v4];
      }
    }
    else
    {
      v11 = remote_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Cannot initialize session info, no device identifier", v12, 2u);
      }
    }
  }

  return v5;
}

- (void)updateKeyboardPropertiesWithTextSessionInfo:(id)a3
{
  id v4 = a3;
  self->_keyboardType = (int64_t)[v4 keyboardType];
  self->_returnKeyType = (int64_t)[v4 returnKeyType];
  unsigned __int8 v5 = [v4 secureTextEntry];

  self->_secureTextEntry = v5;
}

- (void)updateWithTextSessionInfo:(id)a3
{
  id v13 = a3;
  id v4 = [v13 identifier];

  if (v4)
  {
    unsigned __int8 v5 = [v13 identifier];
    sessionID = self->_sessionID;
    self->_sessionID = v5;
  }
  v7 = [v13 prompt];

  if (v7)
  {
    v8 = [v13 prompt];
    descriptiveText = self->_descriptiveText;
    self->_descriptiveText = v8;
  }
  v10 = [v13 title];

  if (v10)
  {
    v11 = [v13 title];
    appName = self->_appName;
    self->_appName = v11;
  }
}

- (void)initDataWithNotification:(id)a3
{
  id v4 = [a3 request];
  unsigned __int8 v5 = [v4 content];

  v6 = [v5 subtitle];
  appName = self->_appName;
  self->_appName = v6;

  v8 = [v5 body];
  descriptiveText = self->_descriptiveText;
  self->_descriptiveText = v8;

  v10 = [v5 title];
  deviceName = self->_deviceName;
  self->_deviceName = v10;

  v12 = [v5 userInfo];
  id v20 = [v12 objectForKey:@"appImage"];

  id v13 = +[UIImage imageWithData:v20];
  v14 = [v5 userInfo];
  v15 = [v14 objectForKey:@"deviceIdentifier"];

  v16 = [v5 userInfo];
  v17 = [v16 objectForKey:@"placeholderText"];

  v18 = [v5 userInfo];
  v19 = [v18 objectForKey:@"sessionID"];

  if (v13) {
    [(CRSessionInfo *)self setAppImage:v13];
  }
  if (v15) {
    [(CRSessionInfo *)self setDeviceIdentifier:v15];
  }
  if (v17) {
    [(CRSessionInfo *)self setPlaceholderText:v17];
  }
  if (v19) {
    [(CRSessionInfo *)self setSessionID:v19];
  }
}

- (void)initTestDataWithNotification:(id)a3
{
  id v4 = [a3 request];
  unsigned __int8 v5 = [v4 content];

  v6 = +[CRSessionInfo placeholderImage];
  appImage = self->_appImage;
  self->_appImage = v6;

  appName = self->_appName;
  self->_appName = (NSString *)@"Apple TV";

  descriptiveText = self->_descriptiveText;
  self->_descriptiveText = (NSString *)@"Enter text on your Apple TV";

  deviceName = self->_deviceName;
  self->_deviceName = (NSString *)@"My Apple TV";

  deviceIdentifier = self->_deviceIdentifier;
  self->_deviceIdentifier = (NSString *)@"00000000-0000-0000-0000-000000000001";

  placeholderText = self->_placeholderText;
  self->_placeholderText = (NSString *)@"Enter text";

  id v13 = [v5 userInfo];
  v14 = [v13 objectForKey:@"postAndUpdateKey"];
  self->_shouldUpdateAfterOpen = [v14 BOOLValue];

  if (self->_shouldUpdateAfterOpen)
  {
    v15 = remote_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Should test update after open", v16, 2u);
    }
  }
}

+ (id)placeholderImage
{
  v2 = +[UIImage imageWithContentsOfFile:@"/System/Library/PrivateFrameworks/Sharing.framework/ContinuityKeyboard-Placeholder"];
  id v3 = remote_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (!v4) {
      goto LABEL_7;
    }
    __int16 v9 = 0;
    unsigned __int8 v5 = "Successfully loaded placeholder app image.";
    v6 = (uint8_t *)&v9;
  }
  else
  {
    if (!v4) {
      goto LABEL_7;
    }
    __int16 v8 = 0;
    unsigned __int8 v5 = "Couldn't load test app image";
    v6 = (uint8_t *)&v8;
  }
  _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
LABEL_7:

  return v2;
}

- (UIImage)appImage
{
  return self->_appImage;
}

- (void)setAppImage:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)descriptiveText
{
  return self->_descriptiveText;
}

- (void)setDescriptiveText:(id)a3
{
}

- (NSString)placeholderText
{
  return self->_placeholderText;
}

- (void)setPlaceholderText:(id)a3
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (int64_t)returnKeyType
{
  return self->_returnKeyType;
}

- (void)setReturnKeyType:(int64_t)a3
{
  self->_returnKeyType = a3;
}

- (BOOL)secureTextEntry
{
  return self->_secureTextEntry;
}

- (void)setSecureTextEntry:(BOOL)a3
{
  self->_secureTextEntry = a3;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (BOOL)shouldUpdateAfterOpen
{
  return self->_shouldUpdateAfterOpen;
}

- (void)setShouldUpdateAfterOpen:(BOOL)a3
{
  self->_shouldUpdateAfterOpen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_placeholderText, 0);
  objc_storeStrong((id *)&self->_descriptiveText, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_appName, 0);

  objc_storeStrong((id *)&self->_appImage, 0);
}

@end