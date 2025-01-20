@interface DASessionSettings
+ (id)acceptableValueClasses;
+ (id)sessionSettingsWithDictionary:(id)a3;
- (BOOL)displayDeviceIdentifier;
- (BOOL)fullscreenPromptsEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSessionSettings:(id)a3;
- (DASessionSettings)init;
- (DASessionSettings)initWithDictionary:(id)a3;
- (NSString)deviceIdentifier;
- (id)description;
- (id)dictionary;
- (unint64_t)allowCellularSizeThreshold;
- (void)setAllowCellularSizeThreshold:(unint64_t)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setDisplayDeviceIdentifier:(BOOL)a3;
- (void)setFullscreenPromptsEnabled:(BOOL)a3;
@end

@implementation DASessionSettings

+ (id)sessionSettingsWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithDictionary:v4];

  return v5;
}

- (DASessionSettings)init
{
  return [(DASessionSettings *)self initWithDictionary:0];
}

- (DASessionSettings)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DASessionSettings;
  id v5 = [(DASessionSettings *)&v18 init];
  v6 = v5;
  if (!v5) {
    goto LABEL_22;
  }
  p_deviceIdentifier = (void **)&v5->_deviceIdentifier;
  deviceIdentifier = v5->_deviceIdentifier;
  v5->_displayDeviceIdentifier = 0;
  v5->_deviceIdentifier = (NSString *)&stru_100014D68;

  v6->_fullscreenPromptsEnabled = 1;
  v6->_allowCellularSizeThreshold = 0x100000;
  if (!v4) {
    goto LABEL_22;
  }
  v9 = [v4 objectForKeyedSubscript:@"displayDeviceIdentifier"];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6->_displayDeviceIdentifier = [v9 BOOLValue];
    }
  }
  v10 = [v4 objectForKeyedSubscript:@"deviceIdentifier"];
  if (!v10) {
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)&v6->_deviceIdentifier, v10);
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v10 stringValue];
    v12 = *p_deviceIdentifier;
    *p_deviceIdentifier = (void *)v11;
  }
  else
  {
LABEL_11:
    v6->_displayDeviceIdentifier = 0;
  }
LABEL_12:
  v13 = [v4 objectForKeyedSubscript:@"fullscreenPromptsEnabled"];
  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6->_fullscreenPromptsEnabled = [v13 BOOLValue];
    }
  }
  v14 = [v4 objectForKeyedSubscript:@"allowCellularSizeThreshold"];
  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = [v14 integerValue];
      if ((uint64_t)v15 < 0) {
        uint64_t v16 = -1;
      }
      else {
        uint64_t v16 = (uint64_t)v15;
      }
      v6->_allowCellularSizeThreshold = v16;
    }
  }

LABEL_22:
  return v6;
}

- (id)dictionary
{
  v9[0] = @"displayDeviceIdentifier";
  v3 = +[NSNumber numberWithBool:[(DASessionSettings *)self displayDeviceIdentifier]];
  v10[0] = v3;
  v9[1] = @"deviceIdentifier";
  id v4 = [(DASessionSettings *)self deviceIdentifier];
  v10[1] = v4;
  v9[2] = @"fullscreenPromptsEnabled";
  id v5 = +[NSNumber numberWithBool:[(DASessionSettings *)self fullscreenPromptsEnabled]];
  v10[2] = v5;
  v9[3] = @"allowCellularSizeThreshold";
  v6 = +[NSNumber numberWithUnsignedInteger:[(DASessionSettings *)self allowCellularSizeThreshold]];
  v10[3] = v6;
  v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

+ (id)acceptableValueClasses
{
  if (qword_10001C688 != -1) {
    dispatch_once(&qword_10001C688, &stru_1000146F0);
  }
  v2 = (void *)qword_10001C680;

  return v2;
}

- (BOOL)isEqualToSessionSettings:(id)a3
{
  id v4 = a3;
  id v5 = [(DASessionSettings *)self deviceIdentifier];
  v6 = [v4 deviceIdentifier];
  unsigned int v7 = [v5 isEqual:v6];

  if (v7
    && (unsigned int v8 = [(DASessionSettings *)self displayDeviceIdentifier],
        v8 == [v4 displayDeviceIdentifier])
    && (unsigned int v9 = [(DASessionSettings *)self fullscreenPromptsEnabled],
        v9 == [v4 fullscreenPromptsEnabled]))
  {
    id v12 = [(DASessionSettings *)self allowCellularSizeThreshold];
    BOOL v10 = v12 == [v4 allowCellularSizeThreshold];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DASessionSettings *)a3;
  unsigned __int8 v5 = self == v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v5 = [(DASessionSettings *)self isEqualToSessionSettings:v4];
  }

  return v5;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  unsigned int v5 = [(DASessionSettings *)self displayDeviceIdentifier];
  v6 = [(DASessionSettings *)self deviceIdentifier];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; displayDeviceIdentifier: %d; deviceIdentifier: %@; fullscreenPromptsEnabled: %d; allowCellularSizeThreshold: %lu>",
    v4,
    self,
    v5,
    v6,
    [(DASessionSettings *)self fullscreenPromptsEnabled],
  unsigned int v7 = [(DASessionSettings *)self allowCellularSizeThreshold]);

  return v7;
}

- (BOOL)displayDeviceIdentifier
{
  return self->_displayDeviceIdentifier;
}

- (void)setDisplayDeviceIdentifier:(BOOL)a3
{
  self->_displayDeviceIdentifier = a3;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (BOOL)fullscreenPromptsEnabled
{
  return self->_fullscreenPromptsEnabled;
}

- (void)setFullscreenPromptsEnabled:(BOOL)a3
{
  self->_fullscreenPromptsEnabled = a3;
}

- (unint64_t)allowCellularSizeThreshold
{
  return self->_allowCellularSizeThreshold;
}

- (void)setAllowCellularSizeThreshold:(unint64_t)a3
{
  self->_allowCellularSizeThreshold = a3;
}

- (void).cxx_destruct
{
}

@end