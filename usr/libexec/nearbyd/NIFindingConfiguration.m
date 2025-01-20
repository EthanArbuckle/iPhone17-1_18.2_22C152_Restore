@interface NIFindingConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)localDeviceConfiguration;
- (BOOL)_internalIsCameraAssistanceEnabled;
- (BOOL)_internalIsCameraAssistanceInClientProcess;
- (BOOL)canUpdateToConfiguration:(id)a3;
- (BOOL)isCameraAssistanceEnabled;
- (BOOL)isCameraAssistanceInClientProcess;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFinder;
- (BOOL)isObserver;
- (NIDiscoveryToken)findingDiscoveryToken;
- (NIDiscoveryToken)sessionDiscoveryToken;
- (NIDiscoveryToken)specifiedToken;
- (NIFindingConfiguration)initWithCoder:(id)a3;
- (NIFindingConfiguration)initWithRole:(int64_t)a3 discoveryToken:(id)a4 preferredUpdateRate:(int64_t)a5;
- (NSDictionary)debugParameters;
- (id)_initInternalWithConfigType:(int64_t)a3 isFinder:(BOOL)a4 isObserver:(BOOL)a5 specifiedToken:(id)a6 preferredUpdateRate:(int64_t)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (int64_t)configType;
- (int64_t)preferredUpdateRate;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCameraAssistanceEnabled:(BOOL)a3;
- (void)setCameraAssistanceInClientProcess:(BOOL)a3;
- (void)setConfigType:(int64_t)a3;
- (void)setDebugParameters:(id)a3;
- (void)setIsFinder:(BOOL)a3;
- (void)setIsObserver:(BOOL)a3;
- (void)setPreferredUpdateRate:(int64_t)a3;
- (void)setSpecifiedToken:(id)a3;
@end

@implementation NIFindingConfiguration

+ (id)localDeviceConfiguration
{
  id v2 = [[NIFindingConfiguration alloc] _initInternalWithConfigType:2 isFinder:0 isObserver:0 specifiedToken:0 preferredUpdateRate:3];

  return v2;
}

- (NIFindingConfiguration)initWithRole:(int64_t)a3 discoveryToken:(id)a4 preferredUpdateRate:(int64_t)a5
{
  return (NIFindingConfiguration *)[(NIFindingConfiguration *)self _initInternalWithConfigType:1 isFinder:(a3 & 0xFFFFFFFFFFFFFFFDLL) == 0 isObserver:(a3 & 0xFFFFFFFFFFFFFFFELL) == 2 specifiedToken:a4 preferredUpdateRate:a5];
}

- (NIDiscoveryToken)sessionDiscoveryToken
{
  return self->_specifiedToken;
}

- (NIDiscoveryToken)findingDiscoveryToken
{
  return self->_specifiedToken;
}

- (id)_initInternalWithConfigType:(int64_t)a3 isFinder:(BOOL)a4 isObserver:(BOOL)a5 specifiedToken:(id)a6 preferredUpdateRate:(int64_t)a7
{
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)NIFindingConfiguration;
  v14 = [(NIConfiguration *)&v18 initInternal];
  v15 = v14;
  if (v14)
  {
    *((unsigned char *)v14 + 34) = a4;
    *((unsigned char *)v14 + 35) = a5;
    v14[6] = (id)a3;
    objc_storeStrong(v14 + 7, a6);
    v15[5] = (id)a7;
    *((unsigned char *)v15 + 32) = 0;
    *((unsigned char *)v15 + 33) = 1;
    id v16 = v15[8];
    v15[8] = 0;
  }
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NIFindingConfiguration;
  id v4 = [(NIConfiguration *)&v8 copyWithZone:a3];
  [v4 setIsFinder:self->_isFinder];
  [v4 setIsObserver:self->_isObserver];
  [v4 setConfigType:self->_configType];
  id v5 = [(NIDiscoveryToken *)self->_specifiedToken copy];
  [v4 setSpecifiedToken:v5];

  [v4 setPreferredUpdateRate:self->_preferredUpdateRate];
  [v4 setCameraAssistanceEnabled:self->_cameraAssistanceEnabled];
  [v4 setCameraAssistanceInClientProcess:self->_cameraAssistanceInClientProcess];
  id v6 = [(NSDictionary *)self->_debugParameters copy];
  [v4 setDebugParameters:v6];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NIFindingConfiguration;
  [(NIConfiguration *)&v5 encodeWithCoder:v4];
  [v4 encodeBool:self->_isFinder forKey:@"isFinder"];
  [v4 encodeBool:self->_isObserver forKey:@"isObserver"];
  [v4 encodeInteger:self->_configType forKey:@"configType"];
  [v4 encodeObject:self->_specifiedToken forKey:@"specifiedToken"];
  [v4 encodeInteger:self->_preferredUpdateRate forKey:@"preferredUpdateRate"];
  [v4 encodeBool:self->_cameraAssistanceEnabled forKey:@"cameraAssistanceEnabled"];
  [v4 encodeBool:self->_cameraAssistanceInClientProcess forKey:@"cameraAssistanceInClientProcess"];
  [v4 encodeObject:self->_debugParameters forKey:@"debugParameters"];
}

- (NIFindingConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NIFindingConfiguration;
  objc_super v5 = [(NIConfiguration *)&v21 initWithCoder:v4];
  if (v5)
  {
    unsigned __int8 v6 = [v4 decodeBoolForKey:@"isFinder"];
    unsigned __int8 v7 = [v4 decodeBoolForKey:@"isObserver"];
    id v8 = [v4 decodeIntegerForKey:@"configType"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"specifiedToken"];
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      && (id v10 = [v4 decodeIntegerForKey:@"preferredUpdateRate"],
          +[NIInternalUtils isIntValidNearbyObjectUpdateRate:v10]))
    {
      unsigned __int8 v19 = [v4 decodeBoolForKey:@"cameraAssistanceEnabled"];
      unsigned __int8 v20 = v6;
      unsigned __int8 v18 = [v4 decodeBoolForKey:@"cameraAssistanceInClientProcess"];
      uint64_t v23 = objc_opt_class();
      v11 = +[NSArray arrayWithObjects:&v23 count:1];
      v12 = +[NSSet setWithArray:v11];

      uint64_t v22 = objc_opt_class();
      id v13 = +[NSArray arrayWithObjects:&v22 count:1];
      v14 = +[NSSet setWithArray:v13];

      v15 = [v4 decodeDictionaryWithKeysOfClasses:v12 objectsOfClasses:v14 forKey:@"debugParameters"];
      v5->_isFinder = v20;
      v5->_isObserver = v7;
      if (v8 == (id)1)
      {
        v5->_configType = 1;
        objc_storeStrong((id *)&v5->_specifiedToken, v9);
        v5->_preferredUpdateRate = (int64_t)v10;
        v5->_cameraAssistanceEnabled = v19;
        v5->_cameraAssistanceInClientProcess = v18;
        objc_storeStrong((id *)&v5->_debugParameters, v15);
        id v16 = v5;
      }
      else
      {
        id v16 = 0;
      }
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (BOOL)canUpdateToConfiguration:(id)a3
{
  id v4 = (NIFindingConfiguration *)a3;
  objc_super v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      BOOL v18 = 1;
    }
    else
    {
      unsigned int v6 = [(NIFindingConfiguration *)v4 isFinder];
      int isFinder = self->_isFinder;
      unsigned int v8 = [(NIFindingConfiguration *)v5 isObserver];
      BOOL isObserver = self->_isObserver;
      id v24 = [(NIFindingConfiguration *)v5 configType];
      int v23 = isObserver;
      int64_t configType = self->_configType;
      unint64_t specifiedToken = (unint64_t)v5->_specifiedToken;
      v12 = self->_specifiedToken;
      unsigned int v13 = [(id)specifiedToken isEqual:v12];
      if (specifiedToken | (unint64_t)v12) {
        int v14 = v13;
      }
      else {
        int v14 = 1;
      }
      unsigned int v15 = [(NIFindingConfiguration *)v5 isCameraAssistanceEnabled];
      int cameraAssistanceEnabled = self->_cameraAssistanceEnabled;
      unsigned int v17 = [(NIFindingConfiguration *)v5 isCameraAssistanceInClientProcess];
      BOOL v18 = 0;
      BOOL v20 = isFinder == v6 && v23 == v8 && v24 == (id)configType;
      if (v20 && ((v14 ^ 1) & 1) == 0) {
        BOOL v18 = cameraAssistanceEnabled == v15 && self->_cameraAssistanceInClientProcess == v17;
      }
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = (NIFindingConfiguration *)v4;
    if (v5 == self)
    {
      BOOL v12 = 1;
    }
    else if ([(NIFindingConfiguration *)self canUpdateToConfiguration:v5])
    {
      id v6 = [(NIFindingConfiguration *)v5 preferredUpdateRate];
      int64_t preferredUpdateRate = self->_preferredUpdateRate;
      debugParameters = v5->_debugParameters;
      v9 = self->_debugParameters;
      unsigned __int8 v10 = [(NSDictionary *)debugParameters isEqualToDictionary:v9];
      if ((unint64_t)debugParameters | (unint64_t)v9) {
        char v11 = v10;
      }
      else {
        char v11 = 1;
      }
      if (v6 == (id)preferredUpdateRate) {
        BOOL v12 = v11;
      }
      else {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = self->_isFinder ^ self->_isObserver ^ 0x1Fu;
  int64_t configType = self->_configType;
  unint64_t v5 = configType ^ [(NIDiscoveryToken *)self->_specifiedToken hash] ^ self->_preferredUpdateRate ^ v3;
  unint64_t v6 = self->_cameraAssistanceEnabled ^ (unint64_t)self->_cameraAssistanceInClientProcess;
  return v5 ^ v6 ^ (unint64_t)[(NSDictionary *)self->_debugParameters hash];
}

- (id)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  id v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  unint64_t v6 = [(NIFindingConfiguration *)self descriptionInternal];
  id v7 = [v3 initWithFormat:@"<%@: %@>", v5, v6];

  return v7;
}

- (id)descriptionInternal
{
  BOOL isFinder = self->_isFinder;
  BOOL isObserver = self->_isObserver;
  int64_t configType = self->_configType;
  unint64_t v6 = [(NIDiscoveryToken *)self->_specifiedToken descriptionInternal];
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<finder: %d [observer %d], cfg-type: %d, ses-token: %@, rate: %s, camera: %d [client %d], debug-params: %@>", isFinder, isObserver, configType, v6, +[NIInternalUtils NINearbyObjectUpdateRateToString:self->_preferredUpdateRate], self->_cameraAssistanceEnabled, self->_cameraAssistanceInClientProcess, self->_debugParameters);

  return v7;
}

- (BOOL)_internalIsCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

- (BOOL)_internalIsCameraAssistanceInClientProcess
{
  return self->_cameraAssistanceInClientProcess;
}

- (int64_t)preferredUpdateRate
{
  return self->_preferredUpdateRate;
}

- (void)setPreferredUpdateRate:(int64_t)a3
{
  self->_int64_t preferredUpdateRate = a3;
}

- (BOOL)isCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

- (void)setCameraAssistanceEnabled:(BOOL)a3
{
  self->_int cameraAssistanceEnabled = a3;
}

- (BOOL)isCameraAssistanceInClientProcess
{
  return self->_cameraAssistanceInClientProcess;
}

- (void)setCameraAssistanceInClientProcess:(BOOL)a3
{
  self->_cameraAssistanceInClientProcess = a3;
}

- (BOOL)isFinder
{
  return self->_isFinder;
}

- (void)setIsFinder:(BOOL)a3
{
  self->_BOOL isFinder = a3;
}

- (BOOL)isObserver
{
  return self->_isObserver;
}

- (void)setIsObserver:(BOOL)a3
{
  self->_BOOL isObserver = a3;
}

- (int64_t)configType
{
  return self->_configType;
}

- (void)setConfigType:(int64_t)a3
{
  self->_int64_t configType = a3;
}

- (NIDiscoveryToken)specifiedToken
{
  return self->_specifiedToken;
}

- (void)setSpecifiedToken:(id)a3
{
}

- (NSDictionary)debugParameters
{
  return self->_debugParameters;
}

- (void)setDebugParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugParameters, 0);

  objc_storeStrong((id *)&self->_specifiedToken, 0);
}

@end