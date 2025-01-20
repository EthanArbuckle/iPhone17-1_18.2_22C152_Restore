@interface SBSConnectedDisplayInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isMirrored;
- (CGSize)size;
- (NSString)deviceName;
- (NSString)displayName;
- (NSString)identifier;
- (SBSConnectedDisplayInfo)initWithCoder:(id)a3;
- (SBSConnectedDisplayInfo)initWithIdentifier:(id)a3 deviceName:(id)a4 displayName:(id)a5 size:(CGSize)a6 mirrored:(BOOL)a7 supportedScales:(unint64_t)a8 displayModeSettings:(id)a9 arrangement:(id)a10;
- (SBSDisplayModeSettings)displayModeSettings;
- (SBSRelativeDisplayArrangement)arrangement;
- (id)description;
- (unint64_t)supportedScales;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SBSConnectedDisplayInfo

- (SBSConnectedDisplayInfo)initWithIdentifier:(id)a3 deviceName:(id)a4 displayName:(id)a5 size:(CGSize)a6 mirrored:(BOOL)a7 supportedScales:(unint64_t)a8 displayModeSettings:(id)a9 arrangement:(id)a10
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  id v26 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a9;
  id v20 = a10;
  v27.receiver = self;
  v27.super_class = (Class)SBSConnectedDisplayInfo;
  v21 = [(SBSConnectedDisplayInfo *)&v27 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_identifier, a3);
    objc_storeStrong((id *)&v22->_deviceName, a4);
    objc_storeStrong((id *)&v22->_displayName, a5);
    v22->_size.CGFloat width = width;
    v22->_size.CGFloat height = height;
    v22->_mirrored = a7;
    objc_storeStrong((id *)&v22->_displayModeSettings, a9);
    v22->_supportedScales = a8;
    objc_storeStrong((id *)&v22->_arrangement, a10);
  }

  return v22;
}

- (SBSConnectedDisplayInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBSConnectedDisplayInfo;
  v5 = [(SBSConnectedDisplayInfo *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceName"];
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v10;

    [v4 decodeCGSizeForKey:@"size"];
    v5->_size.CGFloat width = v12;
    v5->_size.CGFloat height = v13;
    v5->_mirrored = [v4 decodeBoolForKey:@"mirrored"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"arrangement"];
    arrangement = v5->_arrangement;
    v5->_arrangement = (SBSRelativeDisplayArrangement *)v14;

    v5->_supportedScales = [v4 decodeIntegerForKey:@"supportedScales"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayModeSettings"];
    displayModeSettings = v5->_displayModeSettings;
    v5->_displayModeSettings = (SBSDisplayModeSettings *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_displayName forKey:@"displayName"];
  [v5 encodeObject:self->_deviceName forKey:@"deviceName"];
  [v5 encodeCGSize:self->_size.width forKey:@"size"];
  [v5 encodeBool:self->_mirrored forKey:@"mirrored"];
  [v5 encodeObject:self->_arrangement forKey:@"arrangement"];
  [v5 encodeInteger:self->_supportedScales forKey:@"supportedScales"];
  [v5 encodeObject:self->_displayModeSettings forKey:@"displayModeSettings"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 appendString:self->_identifier withName:@"identifier"];
  [v3 appendString:self->_displayName withName:@"displayName"];
  id v4 = (id)[v3 appendBool:self->_mirrored withName:@"mirrored"];
  id v5 = [v3 appendSize:@"size" withName:self->_size.width, self->_size.height];
  id v6 = (id)[v3 appendObject:self->_arrangement withName:@"arrangement"];
  id v7 = (id)[v3 appendInteger:self->_supportedScales withName:@"supportedScales"];
  id v8 = (id)[v3 appendObject:self->_displayModeSettings withName:@"displayModeSettings"];
  v9 = [v3 build];

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isMirrored
{
  return self->_mirrored;
}

- (SBSRelativeDisplayArrangement)arrangement
{
  return self->_arrangement;
}

- (unint64_t)supportedScales
{
  return self->_supportedScales;
}

- (SBSDisplayModeSettings)displayModeSettings
{
  return self->_displayModeSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayModeSettings, 0);
  objc_storeStrong((id *)&self->_arrangement, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end