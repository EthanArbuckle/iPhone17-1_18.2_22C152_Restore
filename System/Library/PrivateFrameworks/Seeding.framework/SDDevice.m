@interface SDDevice
+ (BOOL)deviceIsHomePod;
+ (BOOL)supportsSecureCoding;
+ (id)_currentDevice;
+ (id)_devicesMatchingPlatforms:(unint64_t)a3;
+ (id)blankDeviceWithErrorMessage:(id)a3;
+ (id)currentDevice;
+ (id)deriveMacDeviceClassForProductType:(id)a3;
+ (id)deviceClass;
+ (id)deviceClassForProductType:(id)a3;
+ (id)deviceIdentifier;
+ (id)deviceName;
+ (id)deviceProductType;
+ (id)marketingProductName;
+ (id)osBuild;
+ (id)productVersion;
+ (unint64_t)devicePlatform;
+ (void)getCurrentDevice:(id)a3;
+ (void)getDevicesMatchingPlatforms:(unint64_t)a3 completion:(id)a4;
- (BOOL)_canFileFeedback;
- (BOOL)_isEnrolled;
- (BOOL)_unenrollWithUserIdentifier:(id)a3;
- (BOOL)hasDeviceManagementRestriction;
- (BOOL)isEqual:(id)a3;
- (BOOL)isErrorDevice;
- (BOOL)isFeedbackAssistantAvailable;
- (BOOL)isRunningSeedBuild;
- (NSDate)updatedAt;
- (NSDictionary)dictionaryRepresentation;
- (NSString)build;
- (NSString)deviceClass;
- (NSString)identifier;
- (NSString)name;
- (SDDevice)initWithCoder:(id)a3;
- (SDDevice)initWithDictionaryRepresentation:(id)a3;
- (SDSeedingConfiguration)currentConfiguration;
- (SDSeedingConfiguration)expectedConfiguration;
- (id)_enrolledBetaProgram;
- (id)description;
- (unint64_t)platform;
- (void)_configureDeviceWithExpectedConfiguration;
- (void)_configureDeviceWithExpectedConfigurationWithUserIdentifier:(id)a3;
- (void)_enrollInBetaProgram:(id)a3;
- (void)_enrollInBetaProgram:(id)a3 userIdentifier:(id)a4;
- (void)_verifyEnrollmentWithUserIdentifier:(id)a3 completion:(id)a4;
- (void)checkIn;
- (void)encodeWithCoder:(id)a3;
- (void)setBuild:(id)a3;
- (void)setCurrentConfiguration:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setExpectedConfiguration:(id)a3;
- (void)setHasDeviceManagementRestriction:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsFeedbackAssistantAvailable:(BOOL)a3;
- (void)setIsRunningSeedBuild:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPlatform:(unint64_t)a3;
- (void)setUpdatedAt:(id)a3;
- (void)updateCurrentConfiguration;
@end

@implementation SDDevice

- (SDDevice)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SDDevice;
  v5 = [(SDDevice *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"name"];
    [(SDDevice *)v5 setName:v6];

    v7 = [v4 objectForKeyedSubscript:@"identifier"];
    [(SDDevice *)v5 setIdentifier:v7];

    v8 = [v4 objectForKeyedSubscript:@"platform"];
    -[SDDevice setPlatform:](v5, "setPlatform:", [v8 integerValue]);

    v9 = [v4 objectForKeyedSubscript:@"deviceClass"];
    [(SDDevice *)v5 setDeviceClass:v9];

    v10 = [v4 objectForKeyedSubscript:@"build"];
    [(SDDevice *)v5 setBuild:v10];

    v11 = [v4 objectForKeyedSubscript:@"updatedAt"];
    [(SDDevice *)v5 setUpdatedAt:v11];

    v12 = [SDSeedingConfiguration alloc];
    v13 = [v4 objectForKeyedSubscript:@"currentConfiguration"];
    v14 = [(SDSeedingConfiguration *)v12 initWithDictionaryRepresentation:v13];
    [(SDDevice *)v5 setCurrentConfiguration:v14];

    v15 = [SDSeedingConfiguration alloc];
    v16 = [v4 objectForKeyedSubscript:@"expectedConfiguration"];
    v17 = [(SDSeedingConfiguration *)v15 initWithDictionaryRepresentation:v16];
    [(SDDevice *)v5 setExpectedConfiguration:v17];

    v18 = [v4 objectForKeyedSubscript:@"isFeedbackAssistantAvailable"];
    -[SDDevice setIsFeedbackAssistantAvailable:](v5, "setIsFeedbackAssistantAvailable:", [v18 BOOLValue]);

    v19 = [v4 objectForKeyedSubscript:@"isRunningSeedBuild"];
    -[SDDevice setIsRunningSeedBuild:](v5, "setIsRunningSeedBuild:", [v19 BOOLValue]);

    v20 = [v4 objectForKeyedSubscript:@"hasDeviceManagementRestriction"];
    -[SDDevice setHasDeviceManagementRestriction:](v5, "setHasDeviceManagementRestriction:", [v20 BOOLValue]);
  }
  return v5;
}

- (SDDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SDDevice;
  v5 = [(SDDevice *)&v17 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    [(SDDevice *)v5 setName:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(SDDevice *)v5 setIdentifier:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"platform"];
    -[SDDevice setPlatform:](v5, "setPlatform:", [v8 integerValue]);
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceClass"];
    v10 = (void *)v9;
    if (v9) {
      v11 = (__CFString *)v9;
    }
    else {
      v11 = &stru_1F38E69D8;
    }
    [(SDDevice *)v5 setDeviceClass:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"build"];
    [(SDDevice *)v5 setBuild:v12];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updatedAt"];
    [(SDDevice *)v5 setUpdatedAt:v13];

    -[SDDevice setIsFeedbackAssistantAvailable:](v5, "setIsFeedbackAssistantAvailable:", [v4 decodeBoolForKey:@"isFeedbackAssistantAvailable"]);
    -[SDDevice setIsRunningSeedBuild:](v5, "setIsRunningSeedBuild:", [v4 decodeBoolForKey:@"isRunningSeedBuild"]);
    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentConfiguration"];
    [(SDDevice *)v5 setCurrentConfiguration:v14];

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expectedConfiguration"];
    [(SDDevice *)v5 setExpectedConfiguration:v15];

    -[SDDevice setHasDeviceManagementRestriction:](v5, "setHasDeviceManagementRestriction:", [v4 decodeBoolForKey:@"hasDeviceManagementRestriction"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v16 = a3;
  id v4 = [(SDDevice *)self name];
  [v16 encodeObject:v4 forKey:@"name"];

  v5 = [(SDDevice *)self identifier];
  [v16 encodeObject:v5 forKey:@"identifier"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SDDevice platform](self, "platform"));
  [v16 encodeObject:v6 forKey:@"platform"];

  uint64_t v7 = [(SDDevice *)self deviceClass];
  if (v7)
  {
    v8 = (void *)v7;
    uint64_t v9 = [(SDDevice *)self deviceClass];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v11 = [(SDDevice *)self deviceClass];
      [v16 encodeObject:v11 forKey:@"deviceClass"];
    }
  }
  v12 = [(SDDevice *)self build];
  [v16 encodeObject:v12 forKey:@"build"];

  v13 = [(SDDevice *)self updatedAt];
  [v16 encodeObject:v13 forKey:@"updatedAt"];

  v14 = [(SDDevice *)self currentConfiguration];
  [v16 encodeObject:v14 forKey:@"currentConfiguration"];

  v15 = [(SDDevice *)self expectedConfiguration];
  [v16 encodeObject:v15 forKey:@"expectedConfiguration"];

  objc_msgSend(v16, "encodeBool:forKey:", -[SDDevice isFeedbackAssistantAvailable](self, "isFeedbackAssistantAvailable"), @"isFeedbackAssistantAvailable");
  objc_msgSend(v16, "encodeBool:forKey:", -[SDDevice isRunningSeedBuild](self, "isRunningSeedBuild"), @"isRunningSeedBuild");
  objc_msgSend(v16, "encodeBool:forKey:", -[SDDevice hasDeviceManagementRestriction](self, "hasDeviceManagementRestriction"), @"hasDeviceManagementRestriction");
}

+ (void)getCurrentDevice:(id)a3
{
  id v3 = a3;
  id v4 = +[SDDaemonClient sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__SDDevice_getCurrentDevice___block_invoke;
  v6[3] = &unk_1E6CD8250;
  id v7 = v3;
  id v5 = v3;
  [v4 getCurrentDevice:v6];
}

uint64_t __29__SDDevice_getCurrentDevice___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)currentDevice
{
  v2 = +[SDDaemonClient sharedInstance];
  id v3 = [v2 getCurrentDeviceSynchronously];

  return v3;
}

+ (id)blankDeviceWithErrorMessage:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(SDDevice);
  [(SDDevice *)v4 setName:&stru_1F38E69D8];
  [(SDDevice *)v4 setIdentifier:@"__BLANK_ERROR_DEVICE__"];
  [(SDDevice *)v4 setPlatform:1];
  [(SDDevice *)v4 setDeviceClass:v3];
  [(SDDevice *)v4 setBuild:v3];

  id v5 = [MEMORY[0x1E4F1C9C8] now];
  [(SDDevice *)v4 setUpdatedAt:v5];

  [(SDDevice *)v4 setIsFeedbackAssistantAvailable:0];
  [(SDDevice *)v4 setIsRunningSeedBuild:0];
  [(SDDevice *)v4 setHasDeviceManagementRestriction:0];
  v6 = +[SDSeedingConfiguration nullConfiguration];
  [(SDDevice *)v4 setCurrentConfiguration:v6];

  id v7 = +[SDSeedingConfiguration nullConfiguration];
  [(SDDevice *)v4 setExpectedConfiguration:v7];

  return v4;
}

- (BOOL)isErrorDevice
{
  v2 = [(SDDevice *)self identifier];
  char v3 = [v2 isEqualToString:@"__BLANK_ERROR_DEVICE__"];

  return v3;
}

+ (id)_currentDevice
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__SDDevice__currentDevice__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_currentDevice_onceToken != -1) {
    dispatch_once(&_currentDevice_onceToken, block);
  }
  v2 = +[SDBetaManager sharedManager];
  int v3 = objc_msgSend(v2, "_isEnrollmentAllowedByDeviceManagement_legacy");
  [(id)_currentDevice_currentDevice setHasDeviceManagementRestriction:v3 ^ 1u];

  [(id)_currentDevice_currentDevice checkIn];
  id v4 = (void *)_currentDevice_currentDevice;
  return v4;
}

void __26__SDDevice__currentDevice__block_invoke(uint64_t a1)
{
  id v13 = [*(id *)(a1 + 32) deviceIdentifier];
  v2 = +[SDKeyValueStore deviceDictionaryForDeviceIdentifier:](SDKeyValueStore, "deviceDictionaryForDeviceIdentifier:");
  int v3 = (void *)[v2 mutableCopy];

  if (v3) {
    id v4 = [[SDDevice alloc] initWithDictionaryRepresentation:v3];
  }
  else {
    id v4 = (SDDevice *)objc_opt_new();
  }
  id v5 = (void *)_currentDevice_currentDevice;
  _currentDevice_currentDevice = (uint64_t)v4;

  [(id)_currentDevice_currentDevice setIdentifier:v13];
  uint64_t v6 = [*(id *)(a1 + 32) devicePlatform];
  [(id)_currentDevice_currentDevice setPlatform:v6];
  id v7 = [*(id *)(a1 + 32) deviceClass];
  [(id)_currentDevice_currentDevice setDeviceClass:v7];

  v8 = [*(id *)(a1 + 32) deviceName];
  [(id)_currentDevice_currentDevice setName:v8];

  uint64_t v9 = [*(id *)(a1 + 32) osBuild];
  [(id)_currentDevice_currentDevice setBuild:v9];

  v10 = +[SDSeedingConfiguration currentConfiguration];
  [(id)_currentDevice_currentDevice setCurrentConfiguration:v10];

  BOOL v11 = +[SDBuildInfo isFeedbackAssistantAvailable];
  [(id)_currentDevice_currentDevice setIsFeedbackAssistantAvailable:v11];
  BOOL v12 = +[SDBuildInfo currentBuildIsSeed];
  [(id)_currentDevice_currentDevice setIsRunningSeedBuild:v12];
}

- (void)updateCurrentConfiguration
{
  int v3 = +[SDSeedingConfiguration currentConfiguration];
  [(SDDevice *)self setCurrentConfiguration:v3];

  +[SDKeyValueStore insertOrUpdateDevice:self];
}

+ (void)getDevicesMatchingPlatforms:(unint64_t)a3 completion:(id)a4
{
  id v5 = a4;
  uint64_t v6 = +[SDDaemonClient sharedInstance];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__SDDevice_getDevicesMatchingPlatforms_completion___block_invoke;
  v8[3] = &unk_1E6CD8298;
  id v9 = v5;
  id v7 = v5;
  [v6 getDevicesForPlatforms:a3 completion:v8];
}

uint64_t __51__SDDevice_getDevicesMatchingPlatforms_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)_devicesMatchingPlatforms:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = +[SDKeyValueStore devicesDictionary];
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        BOOL v12 = [SDDevice alloc];
        id v13 = -[SDDevice initWithDictionaryRepresentation:](v12, "initWithDictionaryRepresentation:", v11, (void)v15);
        if (([(SDDevice *)v13 platform] & a3) != 0) {
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)checkIn
{
  int v3 = [MEMORY[0x1E4F1C9C8] date];
  [(SDDevice *)self setUpdatedAt:v3];

  [(SDDevice *)self updateCurrentConfiguration];
}

- (NSDictionary)dictionaryRepresentation
{
  v24[11] = *MEMORY[0x1E4F143B8];
  v23[0] = @"name";
  objc_super v22 = [(SDDevice *)self name];
  v24[0] = v22;
  v23[1] = @"identifier";
  v21 = [(SDDevice *)self identifier];
  v24[1] = v21;
  v23[2] = @"platform";
  uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SDDevice platform](self, "platform"));
  v24[2] = v20;
  v23[3] = @"deviceClass";
  v19 = [(SDDevice *)self deviceClass];
  v24[3] = v19;
  v23[4] = @"build";
  long long v18 = [(SDDevice *)self build];
  v24[4] = v18;
  v23[5] = @"updatedAt";
  int v3 = [(SDDevice *)self updatedAt];
  v24[5] = v3;
  v23[6] = @"isFeedbackAssistantAvailable";
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[SDDevice isFeedbackAssistantAvailable](self, "isFeedbackAssistantAvailable"));
  v24[6] = v4;
  v23[7] = @"hasDeviceManagementRestiction";
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[SDDevice hasDeviceManagementRestriction](self, "hasDeviceManagementRestriction"));
  v24[7] = v5;
  v23[8] = @"isRunningSeedBuild";
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[SDDevice isRunningSeedBuild](self, "isRunningSeedBuild"));
  v24[8] = v6;
  v23[9] = @"currentConfiguration";
  uint64_t v7 = [(SDDevice *)self currentConfiguration];
  uint64_t v8 = [v7 dictionaryRepresentation];
  uint64_t v9 = (void *)v8;
  uint64_t v10 = MEMORY[0x1E4F1CC08];
  if (v8) {
    uint64_t v11 = v8;
  }
  else {
    uint64_t v11 = MEMORY[0x1E4F1CC08];
  }
  v24[9] = v11;
  v23[10] = @"expectedConfiguration";
  BOOL v12 = [(SDDevice *)self expectedConfiguration];
  uint64_t v13 = [v12 dictionaryRepresentation];
  v14 = (void *)v13;
  if (v13) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = v10;
  }
  v24[10] = v15;
  long long v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:11];

  return (NSDictionary *)v16;
}

- (id)description
{
  v2 = NSString;
  int v3 = [(SDDevice *)self dictionaryRepresentation];
  id v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(SDDevice *)self identifier];
    uint64_t v7 = [v5 identifier];

    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_enrollInBetaProgram:(id)a3
{
}

- (void)_enrollInBetaProgram:(id)a3 userIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v14 = Log_1();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD702000, v14, OS_LOG_TYPE_INFO, "Program was nil, no change will be made to the beta program.", buf, 2u);
    }
    goto LABEL_13;
  }
  unint64_t v8 = [(SDDevice *)self platform];
  if (v8 != [v6 platform])
  {
    v14 = Log_1();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SDDevice _enrollInBetaProgram:userIdentifier:](v14);
    }
    goto LABEL_13;
  }
  uint64_t v9 = [[SDSeedingConfiguration alloc] initWithBetaProgram:v6];
  [(SDDevice *)self setExpectedConfiguration:v9];

  [(SDDevice *)self updateCurrentConfiguration];
  uint64_t v10 = [(SDDevice *)self currentConfiguration];
  uint64_t v11 = [(SDDevice *)self expectedConfiguration];
  int v12 = [v10 isEqual:v11];

  if (!v12)
  {
    uint64_t v15 = +[SDDevice _currentDevice];
    BOOL v16 = [(SDDevice *)self isEqual:v15];

    if (!v16) {
      goto LABEL_14;
    }
    [(SDDevice *)self _configureDeviceWithExpectedConfigurationWithUserIdentifier:v7];
    v14 = +[SDBetaManager sharedManager];
    [v14 _saveBetaProgram:v6];
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v13 = Log_1();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v17 = 0;
    _os_log_impl(&dword_1DD702000, v13, OS_LOG_TYPE_DEFAULT, "Seeding configuration matches expected configuration.", v17, 2u);
  }

  [(SDDevice *)self _configureDeviceWithExpectedConfigurationWithUserIdentifier:v7];
LABEL_14:
}

- (void)_configureDeviceWithExpectedConfiguration
{
}

- (void)_configureDeviceWithExpectedConfigurationWithUserIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = Log_1();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v8 = 0;
    _os_log_impl(&dword_1DD702000, v5, OS_LOG_TYPE_DEFAULT, "Updating seeding configuration with expected configuration.", v8, 2u);
  }

  id v6 = +[SDBetaManager sharedManager];
  id v7 = [(SDDevice *)self expectedConfiguration];
  [v6 _enrollUsingSeedingConfiguration:v7 userIdentifier:v4];

  [(SDDevice *)self updateCurrentConfiguration];
}

- (BOOL)_unenrollWithUserIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[SDSeedingConfiguration nullConfiguration];
  [(SDDevice *)self setExpectedConfiguration:v5];

  id v6 = +[SDDevice _currentDevice];
  BOOL v7 = [(SDDevice *)self isEqual:v6];

  if (v7)
  {
    unint64_t v8 = +[SDBetaManager sharedManager];
    char v9 = [v8 _unenrollFromBetaProgramWithUserIdentifier:v4];

    [(SDDevice *)self updateCurrentConfiguration];
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (BOOL)_isEnrolled
{
  int v3 = +[SDDevice _currentDevice];
  BOOL v4 = [(SDDevice *)self isEqual:v3];

  if (v4)
  {
    id v5 = +[SDBetaManager sharedManager];
    char v6 = [v5 _isEnrolledInBetaProgram];
  }
  else
  {
    id v5 = [(SDDevice *)self currentConfiguration];
    char v6 = [v5 seedProgram] != 0;
  }

  return v6;
}

- (id)_enrolledBetaProgram
{
  return +[SDBetaManager _currentBetaProgram];
}

- (void)_verifyEnrollmentWithUserIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = +[SDDevice _currentDevice];
  BOOL v9 = [(SDDevice *)self isEqual:v8];

  if (v9)
  {
    [(SDDevice *)self updateCurrentConfiguration];
    uint64_t v10 = [(SDDevice *)self currentConfiguration];
    uint64_t v11 = [v10 assetAudience];

    int v12 = [(SDDevice *)self currentConfiguration];
    uint64_t v13 = [v12 seedProgramID];
    uint64_t v14 = [v13 integerValue];

    uint64_t v15 = [(SDDevice *)self currentConfiguration];
    BOOL v16 = [v15 accountID];

    long long v17 = Log_1();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v23 = v11;
      __int16 v24 = 2048;
      uint64_t v25 = v14;
      __int16 v26 = 2114;
      v27 = v16;
      _os_log_impl(&dword_1DD702000, v17, OS_LOG_TYPE_DEFAULT, "Verifying with assetAudience [%{public}@], programID [%lu], accountID [%{public}@]", buf, 0x20u);
    }

    long long v18 = +[SDBetaManager sharedManager];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __59__SDDevice__verifyEnrollmentWithUserIdentifier_completion___block_invoke;
    v19[3] = &unk_1E6CD82C0;
    v19[4] = self;
    id v20 = v6;
    id v21 = v7;
    [v18 verifyAssetAudience:v11 programID:v14 accountID:v16 withCompletion:v19];
  }
}

void __59__SDDevice__verifyEnrollmentWithUserIdentifier_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = (void *)a1[4];
  id v8 = v5;
  if (a2) {
    [v6 _enrollInBetaProgram:v5];
  }
  else {
    [v6 _unenrollWithUserIdentifier:a1[5]];
  }
  uint64_t v7 = a1[6];
  if (v7) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);
  }
}

- (BOOL)_canFileFeedback
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v3 = +[SDDevice _currentDevice];
  BOOL v4 = [(SDDevice *)self isEqual:v3];

  if (v4) {
    [(SDDevice *)self updateCurrentConfiguration];
  }
  if ([(SDDevice *)self platform] == 4) {
    return 0;
  }
  if ([(SDDevice *)self platform] == 1
    || [(SDDevice *)self platform] == 2
    || [(SDDevice *)self platform] == 32)
  {
    BOOL v6 = [(SDDevice *)self _isEnrolled];
    BOOL v7 = [(SDDevice *)self isRunningSeedBuild];
    BOOL v8 = [(SDDevice *)self isFeedbackAssistantAvailable];
    BOOL v5 = (v6 || v7) && v8;
    BOOL v9 = Log_1();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 67109888;
      *(_DWORD *)int v12 = v6;
      *(_WORD *)&v12[4] = 1024;
      *(_DWORD *)&v12[6] = v7;
      LOWORD(v13) = 1024;
      *(_DWORD *)((char *)&v13 + 2) = v8;
      HIWORD(v13) = 1024;
      int v14 = (v6 || v7) && v8;
      _os_log_impl(&dword_1DD702000, v9, OS_LOG_TYPE_DEFAULT, "canFileFeedback: enrolledInSeed: %d, onSeedBuild: %d, isFBAAvailable %d, -> result: %d", (uint8_t *)&v11, 0x1Au);
    }
  }
  else
  {
    BOOL v9 = Log_1();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      *(void *)int v12 = "-[SDDevice _canFileFeedback]";
      *(_WORD *)&v12[8] = 2048;
      unint64_t v13 = [(SDDevice *)self platform];
      _os_log_impl(&dword_1DD702000, v9, OS_LOG_TYPE_DEFAULT, "%s is not supported on platform [%lu]", (uint8_t *)&v11, 0x16u);
    }
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)deviceIdentifier
{
  v2 = (void *)MGCopyAnswer();
  return v2;
}

+ (unint64_t)devicePlatform
{
  if ([a1 deviceIsHomePod]) {
    return 16;
  }
  else {
    return 1;
  }
}

+ (BOOL)deviceIsHomePod
{
  return MGGetSInt32Answer() == 7;
}

+ (id)deviceClass
{
  if ([a1 deviceIsHomePod]) {
    v2 = @"HomePod";
  }
  else {
    v2 = (__CFString *)MGCopyAnswer();
  }
  return v2;
}

+ (id)deviceProductType
{
  v2 = (void *)MGCopyAnswer();
  return v2;
}

+ (id)deviceClassForProductType:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    BOOL v6 = @"AppleTV";
    if (([v4 containsString:@"AppleTV"] & 1) == 0)
    {
      BOOL v6 = @"iPhone";
      if (([v5 containsString:@"iPhone"] & 1) == 0)
      {
        BOOL v6 = @"iPad";
        if (([v5 containsString:@"iPad"] & 1) == 0)
        {
          BOOL v6 = @"Watch";
          if (([v5 containsString:@"Watch"] & 1) == 0)
          {
            if ([v5 containsString:@"AudioAccessory"])
            {
              BOOL v6 = @"HomePod";
            }
            else if ([v5 containsString:@"Mac"])
            {
              BOOL v6 = [a1 deriveMacDeviceClassForProductType:v5];
            }
            else
            {
              BOOL v8 = Log_1();
              if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
                +[SDDevice deviceClassForProductType:]((uint64_t)v5, v8);
              }

              BOOL v6 = &stru_1F38E69D8;
            }
          }
        }
      }
    }
    BOOL v7 = v6;
  }
  else
  {
    BOOL v7 = &stru_1F38E69D8;
  }

  return v7;
}

+ (id)deriveMacDeviceClassForProductType:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4F442D8] _typeWithDeviceModelCode:a3];
  id v4 = [v3 identifier];
  BOOL v5 = [v4 stringByReplacingOccurrencesOfString:@"com.apple." withString:&stru_1F38E69D8];
  BOOL v6 = [v5 lowercaseString];

  if ([v6 containsString:@"macbookpro"])
  {
    BOOL v7 = @"MacBookPro";
  }
  else if ([v6 containsString:@"macbookair"])
  {
    BOOL v7 = @"MacBookAir";
  }
  else if ([v6 containsString:@"macbook"])
  {
    BOOL v7 = @"MacBook";
  }
  else if ([v6 containsString:@"imac"])
  {
    BOOL v7 = @"iMac";
  }
  else if ([v6 containsString:@"macmini"])
  {
    BOOL v7 = @"Macmini";
  }
  else if ([v6 containsString:@"macpro"])
  {
    BOOL v7 = @"MacPro";
  }
  else if ([v6 containsString:@"macstudio"])
  {
    BOOL v7 = @"MacStudio";
  }
  else
  {
    BOOL v8 = Log_1();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      int v11 = v6;
      _os_log_impl(&dword_1DD702000, v8, OS_LOG_TYPE_DEFAULT, "No Mac product mapping for [%{public}@]", (uint8_t *)&v10, 0xCu);
    }

    BOOL v7 = &stru_1F38E69D8;
  }

  return v7;
}

+ (id)deviceName
{
  v2 = (void *)MGCopyAnswer();
  return v2;
}

+ (id)osBuild
{
  v2 = (__CFString *)MGCopyAnswer();
  int v3 = v2;
  if (!v2) {
    v2 = @"Unknown";
  }
  id v4 = v2;

  return v4;
}

+ (id)marketingProductName
{
  v2 = (void *)MGCopyAnswer();
  return v2;
}

+ (id)productVersion
{
  v2 = (void *)MGCopyAnswer();
  return v2;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)platform
{
  return self->_platform;
}

- (void)setPlatform:(unint64_t)a3
{
  self->_platform = a3;
}

- (NSString)deviceClass
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDeviceClass:(id)a3
{
}

- (NSString)build
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBuild:(id)a3
{
}

- (NSDate)updatedAt
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUpdatedAt:(id)a3
{
}

- (BOOL)isFeedbackAssistantAvailable
{
  return self->_isFeedbackAssistantAvailable;
}

- (void)setIsFeedbackAssistantAvailable:(BOOL)a3
{
  self->_isFeedbackAssistantAvailable = a3;
}

- (BOOL)isRunningSeedBuild
{
  return self->_isRunningSeedBuild;
}

- (void)setIsRunningSeedBuild:(BOOL)a3
{
  self->_isRunningSeedBuild = a3;
}

- (BOOL)hasDeviceManagementRestriction
{
  return self->_hasDeviceManagementRestriction;
}

- (void)setHasDeviceManagementRestriction:(BOOL)a3
{
  self->_hasDeviceManagementRestriction = a3;
}

- (SDSeedingConfiguration)currentConfiguration
{
  return (SDSeedingConfiguration *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCurrentConfiguration:(id)a3
{
}

- (SDSeedingConfiguration)expectedConfiguration
{
  return (SDSeedingConfiguration *)objc_getProperty(self, a2, 72, 1);
}

- (void)setExpectedConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedConfiguration, 0);
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
  objc_storeStrong((id *)&self->_updatedAt, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)_enrollInBetaProgram:(os_log_t)log userIdentifier:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DD702000, log, OS_LOG_TYPE_ERROR, "Cannot enroll device in beta program: mismatching platforms.", v1, 2u);
}

+ (void)deviceClassForProductType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DD702000, a2, OS_LOG_TYPE_ERROR, "No deviceClass for product [%{public}@]", (uint8_t *)&v2, 0xCu);
}

@end