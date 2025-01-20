@interface TUScreenShareAttributes
+ (BOOL)supportsSecureCoding;
+ (NSNumber)defaultCornerRadius;
+ (NSNumber)defaultDisplayScale;
+ (NSNumber)defaultScaleFactor;
+ (NSValue)defaultSystemRootLayerTransform;
+ (id)defaultAttributes;
+ (int64_t)currentDeviceFamily;
+ (int64_t)currentDeviceHomeButtonType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToScreenShareAttributes:(id)a3;
- (BOOL)isSignificantChangeFromAttributes:(id)a3;
- (BOOL)isWindowed;
- (NSNumber)cornerRadius;
- (NSNumber)displayID;
- (NSNumber)displayScale;
- (NSNumber)frameRate;
- (NSNumber)scaleFactor;
- (NSString)description;
- (NSUUID)windowUUID;
- (NSValue)originalResolution;
- (NSValue)systemRootLayerTransform;
- (TUScreenShareAttributes)initWithAttributes:(id)a3;
- (TUScreenShareAttributes)initWithCoder:(id)a3;
- (int64_t)deviceFamily;
- (int64_t)deviceHomeButtonType;
- (int64_t)style;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCornerRadius:(id)a3;
- (void)setDeviceFamily:(int64_t)a3;
- (void)setDeviceHomeButtonType:(int64_t)a3;
- (void)setDisplayID:(id)a3;
- (void)setDisplayScale:(id)a3;
- (void)setFrameRate:(id)a3;
- (void)setOriginalResolution:(id)a3;
- (void)setScaleFactor:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSystemRootLayerTransform:(id)a3;
- (void)setWindowUUID:(id)a3;
- (void)setWindowed:(BOOL)a3;
@end

@implementation TUScreenShareAttributes

+ (id)defaultAttributes
{
  v3 = objc_alloc_init(TUScreenShareAttributes);
  [(TUScreenShareAttributes *)v3 setStyle:0];
  -[TUScreenShareAttributes setDeviceFamily:](v3, "setDeviceFamily:", [a1 currentDeviceFamily]);
  -[TUScreenShareAttributes setDeviceHomeButtonType:](v3, "setDeviceHomeButtonType:", [a1 currentDeviceHomeButtonType]);
  v4 = [a1 defaultDisplayScale];
  [(TUScreenShareAttributes *)v3 setDisplayScale:v4];

  v5 = [a1 defaultScaleFactor];
  [(TUScreenShareAttributes *)v3 setScaleFactor:v5];

  v6 = [a1 defaultCornerRadius];
  [(TUScreenShareAttributes *)v3 setCornerRadius:v6];

  v7 = [a1 defaultSystemRootLayerTransform];
  [(TUScreenShareAttributes *)v3 setSystemRootLayerTransform:v7];

  v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", 0.0, 0.0, 0.0, 0.0);
  [(TUScreenShareAttributes *)v3 setOriginalResolution:v8];

  return v3;
}

- (TUScreenShareAttributes)initWithAttributes:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TUScreenShareAttributes;
  v5 = [(TUScreenShareAttributes *)&v21 init];
  if (v5)
  {
    v5->_deviceFamily = [v4 deviceFamily];
    v5->_deviceHomeButtonType = [v4 deviceHomeButtonType];
    v5->_style = [v4 style];
    uint64_t v6 = [v4 displayScale];
    displayScale = v5->_displayScale;
    v5->_displayScale = (NSNumber *)v6;

    uint64_t v8 = [v4 scaleFactor];
    scaleFactor = v5->_scaleFactor;
    v5->_scaleFactor = (NSNumber *)v8;

    uint64_t v10 = [v4 cornerRadius];
    cornerRadius = v5->_cornerRadius;
    v5->_cornerRadius = (NSNumber *)v10;

    uint64_t v12 = [v4 originalResolution];
    originalResolution = v5->_originalResolution;
    v5->_originalResolution = (NSValue *)v12;

    uint64_t v14 = [v4 displayID];
    displayID = v5->_displayID;
    v5->_displayID = (NSNumber *)v14;

    uint64_t v16 = [v4 windowUUID];
    windowUUID = v5->_windowUUID;
    v5->_windowUUID = (NSUUID *)v16;

    v5->_windowed = [v4 isWindowed];
    uint64_t v18 = [v4 systemRootLayerTransform];
    systemRootLayerTransform = v5->_systemRootLayerTransform;
    v5->_systemRootLayerTransform = (NSValue *)v18;
  }
  return v5;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @" deviceFamily=%ld", -[TUScreenShareAttributes deviceFamily](self, "deviceFamily"));
  objc_msgSend(v3, "appendFormat:", @" deviceHomeButtonType=%ld", -[TUScreenShareAttributes deviceHomeButtonType](self, "deviceHomeButtonType"));
  objc_msgSend(v3, "appendFormat:", @" style=%ld", -[TUScreenShareAttributes style](self, "style"));
  id v4 = [(TUScreenShareAttributes *)self displayScale];
  [v3 appendFormat:@" displayScale=%@", v4];

  v5 = [(TUScreenShareAttributes *)self scaleFactor];
  [v3 appendFormat:@" scaleFactor=%@", v5];

  uint64_t v6 = [(TUScreenShareAttributes *)self cornerRadius];
  [v3 appendFormat:@" cornerRadius=%@", v6];

  v7 = [(TUScreenShareAttributes *)self displayID];
  [v3 appendFormat:@" displayID=%@", v7];

  uint64_t v8 = [(TUScreenShareAttributes *)self frameRate];
  [v3 appendFormat:@" frameRate=%@", v8];

  objc_msgSend(v3, "appendFormat:", @" windowed=%d", -[TUScreenShareAttributes isWindowed](self, "isWindowed"));
  v9 = [(TUScreenShareAttributes *)self windowUUID];
  [v3 appendFormat:@" windowUUID=%@", v9];

  uint64_t v10 = [(TUScreenShareAttributes *)self systemRootLayerTransform];
  [v3 appendFormat:@" systemRootLayerTransform=%@", v10];

  v11 = [(TUScreenShareAttributes *)self originalResolution];
  [v3 appendFormat:@" originalResolution=%@", v11];

  [v3 appendString:@">"];
  uint64_t v12 = (void *)[v3 copy];

  return (NSString *)v12;
}

+ (int64_t)currentDeviceFamily
{
  v2 = [(id)CUTWeakLinkClass() sharedInstance];
  uint64_t v3 = [v2 deviceType];
  if (v3 == 4) {
    int64_t v4 = 3;
  }
  else {
    int64_t v4 = 2 * (v3 == 2);
  }

  return v4;
}

+ (int64_t)currentDeviceHomeButtonType
{
  v2 = MobileGestalt_get_current_device();
  unsigned int homeButtonType = MobileGestalt_get_homeButtonType();
  if (homeButtonType < 3) {
    int64_t v4 = homeButtonType + 1;
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

+ (NSNumber)defaultDisplayScale
{
  return (NSNumber *)&unk_1EED24710;
}

+ (NSNumber)defaultScaleFactor
{
  return (NSNumber *)&unk_1EED24720;
}

+ (NSNumber)defaultCornerRadius
{
  v2 = MobileGestalt_get_current_device();
  uint64_t v3 = NSNumber;
  MobileGestalt_get_deviceCornerRadius();
  int64_t v4 = objc_msgSend(v3, "numberWithFloat:");

  return (NSNumber *)v4;
}

+ (NSValue)defaultSystemRootLayerTransform
{
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v2;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGAffineTransform:", v5);

  return (NSValue *)v3;
}

- (BOOL)isSignificantChangeFromAttributes:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(TUScreenShareAttributes *)self style];
  if (v5 == [v4 style])
  {
    uint64_t v6 = [(TUScreenShareAttributes *)self displayScale];
    v7 = [v4 displayScale];
    if (TUNumbersAreEqualOrNil((unint64_t)v6, (uint64_t)v7))
    {
      uint64_t v8 = [(TUScreenShareAttributes *)self displayID];
      v9 = [v4 displayID];
      if (TUNumbersAreEqualOrNil((unint64_t)v8, (uint64_t)v9))
      {
        uint64_t v10 = [(TUScreenShareAttributes *)self systemRootLayerTransform];
        v11 = [v4 systemRootLayerTransform];
        int v12 = TUObjectsAreEqualOrNil((unint64_t)v10, (uint64_t)v11) ^ 1;
      }
      else
      {
        LOBYTE(v12) = 1;
      }
    }
    else
    {
      LOBYTE(v12) = 1;
    }
  }
  else
  {
    LOBYTE(v12) = 1;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(TUScreenShareAttributes *)self isEqualToScreenShareAttributes:v4];

  return v5;
}

- (BOOL)isEqualToScreenShareAttributes:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(TUScreenShareAttributes *)self deviceFamily];
  if (v5 == [v4 deviceFamily]
    && (int64_t v6 = [(TUScreenShareAttributes *)self deviceHomeButtonType],
        v6 == [v4 deviceHomeButtonType])
    && (int64_t v7 = -[TUScreenShareAttributes style](self, "style"), v7 == [v4 style]))
  {
    uint64_t v8 = [(TUScreenShareAttributes *)self displayScale];
    v9 = [v4 displayScale];
    if (TUObjectsAreEqualOrNil((unint64_t)v8, (uint64_t)v9))
    {
      uint64_t v10 = [(TUScreenShareAttributes *)self scaleFactor];
      v11 = [v4 scaleFactor];
      if (TUObjectsAreEqualOrNil((unint64_t)v10, (uint64_t)v11))
      {
        int v12 = [(TUScreenShareAttributes *)self cornerRadius];
        v13 = [v4 cornerRadius];
        if (TUObjectsAreEqualOrNil((unint64_t)v12, (uint64_t)v13))
        {
          uint64_t v14 = [(TUScreenShareAttributes *)self originalResolution];
          v15 = [v4 originalResolution];
          if (TUObjectsAreEqualOrNil((unint64_t)v14, (uint64_t)v15))
          {
            v28 = v14;
            unint64_t v16 = [(TUScreenShareAttributes *)self displayID];
            v29 = [v4 displayID];
            v30 = (void *)v16;
            if (TUObjectsAreEqualOrNil(v16, (uint64_t)v29))
            {
              unint64_t v17 = [(TUScreenShareAttributes *)self frameRate];
              v26 = [v4 frameRate];
              v27 = (void *)v17;
              if (TUObjectsAreEqualOrNil(v17, (uint64_t)v26))
              {
                v25 = [(TUScreenShareAttributes *)self windowUUID];
                v24 = [v4 windowUUID];
                if (TUObjectsAreEqualOrNil((unint64_t)v25, (uint64_t)v24))
                {
                  unint64_t v18 = [(TUScreenShareAttributes *)self systemRootLayerTransform];
                  v22 = [v4 systemRootLayerTransform];
                  v23 = (void *)v18;
                  if (TUObjectsAreEqualOrNil(v18, (uint64_t)v22))
                  {
                    BOOL v19 = [(TUScreenShareAttributes *)self isWindowed];
                    int v20 = v19 ^ [v4 isWindowed] ^ 1;
                  }
                  else
                  {
                    LOBYTE(v20) = 0;
                  }
                  uint64_t v14 = v28;
                }
                else
                {
                  LOBYTE(v20) = 0;
                  uint64_t v14 = v28;
                }
              }
              else
              {
                LOBYTE(v20) = 0;
                uint64_t v14 = v28;
              }
            }
            else
            {
              LOBYTE(v20) = 0;
              uint64_t v14 = v28;
            }
          }
          else
          {
            LOBYTE(v20) = 0;
          }
        }
        else
        {
          LOBYTE(v20) = 0;
        }
      }
      else
      {
        LOBYTE(v20) = 0;
      }
    }
    else
    {
      LOBYTE(v20) = 0;
    }
  }
  else
  {
    LOBYTE(v20) = 0;
  }

  return v20;
}

- (unint64_t)hash
{
  int64_t v3 = [(TUScreenShareAttributes *)self deviceFamily];
  int64_t v4 = [(TUScreenShareAttributes *)self deviceHomeButtonType] ^ v3;
  int64_t v5 = v4 ^ [(TUScreenShareAttributes *)self style];
  v25 = [(TUScreenShareAttributes *)self displayScale];
  uint64_t v6 = [v25 hash];
  int64_t v7 = [(TUScreenShareAttributes *)self scaleFactor];
  uint64_t v8 = v5 ^ v6 ^ [v7 hash];
  v9 = [(TUScreenShareAttributes *)self cornerRadius];
  uint64_t v10 = [v9 hash];
  v11 = [(TUScreenShareAttributes *)self originalResolution];
  uint64_t v12 = v10 ^ [v11 hash];
  v13 = [(TUScreenShareAttributes *)self displayID];
  uint64_t v14 = v8 ^ v12 ^ [v13 hash];
  v15 = [(TUScreenShareAttributes *)self frameRate];
  uint64_t v16 = [v15 hash];
  unint64_t v17 = [(TUScreenShareAttributes *)self windowUUID];
  uint64_t v18 = v16 ^ [v17 hash];
  BOOL v19 = [(TUScreenShareAttributes *)self systemRootLayerTransform];
  uint64_t v20 = v18 ^ [v19 hash];
  BOOL v21 = [(TUScreenShareAttributes *)self isWindowed];
  uint64_t v22 = 1237;
  if (v21) {
    uint64_t v22 = 1231;
  }
  unint64_t v23 = v14 ^ v20 ^ v22;

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUScreenShareAttributes)initWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = NSStringFromSelector(sel_deviceFamily);
  self->_deviceFamily = [v4 decodeIntegerForKey:v5];

  uint64_t v6 = NSStringFromSelector(sel_deviceHomeButtonType);
  self->_deviceHomeButtonType = [v4 decodeIntegerForKey:v6];

  int64_t v7 = NSStringFromSelector(sel_style);
  self->_style = [v4 decodeIntegerForKey:v7];

  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(sel_displayScale);
  uint64_t v10 = [v4 decodeObjectOfClass:v8 forKey:v9];
  displayScale = self->_displayScale;
  self->_displayScale = v10;

  uint64_t v12 = objc_opt_class();
  v13 = NSStringFromSelector(sel_scaleFactor);
  uint64_t v14 = [v4 decodeObjectOfClass:v12 forKey:v13];
  scaleFactor = self->_scaleFactor;
  self->_scaleFactor = v14;

  uint64_t v16 = objc_opt_class();
  unint64_t v17 = NSStringFromSelector(sel_cornerRadius);
  uint64_t v18 = [v4 decodeObjectOfClass:v16 forKey:v17];
  cornerRadius = self->_cornerRadius;
  self->_cornerRadius = v18;

  uint64_t v20 = objc_opt_class();
  BOOL v21 = NSStringFromSelector(sel_originalResolution);
  uint64_t v22 = [v4 decodeObjectOfClass:v20 forKey:v21];
  originalResolution = self->_originalResolution;
  self->_originalResolution = v22;

  uint64_t v24 = objc_opt_class();
  v25 = NSStringFromSelector(sel_frameRate);
  v26 = [v4 decodeObjectOfClass:v24 forKey:v25];
  frameRate = self->_frameRate;
  self->_frameRate = v26;

  uint64_t v28 = objc_opt_class();
  v29 = NSStringFromSelector(sel_displayID);
  v30 = [v4 decodeObjectOfClass:v28 forKey:v29];
  displayID = self->_displayID;
  self->_displayID = v30;

  v32 = NSStringFromSelector(sel_isWindowed);
  self->_windowed = [v4 decodeBoolForKey:v32];

  uint64_t v33 = objc_opt_class();
  v34 = NSStringFromSelector(sel_windowUUID);
  v35 = [v4 decodeObjectOfClass:v33 forKey:v34];
  windowUUID = self->_windowUUID;
  self->_windowUUID = v35;

  uint64_t v37 = objc_opt_class();
  v38 = NSStringFromSelector(sel_systemRootLayerTransform);
  v39 = [v4 decodeObjectOfClass:v37 forKey:v38];

  systemRootLayerTransform = self->_systemRootLayerTransform;
  self->_systemRootLayerTransform = v39;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(TUScreenShareAttributes *)self deviceFamily];
  uint64_t v6 = NSStringFromSelector(sel_deviceFamily);
  [v4 encodeInteger:v5 forKey:v6];

  int64_t v7 = [(TUScreenShareAttributes *)self deviceHomeButtonType];
  uint64_t v8 = NSStringFromSelector(sel_deviceHomeButtonType);
  [v4 encodeInteger:v7 forKey:v8];

  int64_t v9 = [(TUScreenShareAttributes *)self style];
  uint64_t v10 = NSStringFromSelector(sel_style);
  [v4 encodeInteger:v9 forKey:v10];

  v11 = [(TUScreenShareAttributes *)self displayScale];
  uint64_t v12 = NSStringFromSelector(sel_displayScale);
  [v4 encodeObject:v11 forKey:v12];

  v13 = [(TUScreenShareAttributes *)self scaleFactor];
  uint64_t v14 = NSStringFromSelector(sel_scaleFactor);
  [v4 encodeObject:v13 forKey:v14];

  v15 = [(TUScreenShareAttributes *)self cornerRadius];
  uint64_t v16 = NSStringFromSelector(sel_cornerRadius);
  [v4 encodeObject:v15 forKey:v16];

  unint64_t v17 = [(TUScreenShareAttributes *)self frameRate];
  uint64_t v18 = NSStringFromSelector(sel_frameRate);
  [v4 encodeObject:v17 forKey:v18];

  BOOL v19 = [(TUScreenShareAttributes *)self displayID];
  uint64_t v20 = NSStringFromSelector(sel_displayID);
  [v4 encodeObject:v19 forKey:v20];

  BOOL v21 = [(TUScreenShareAttributes *)self isWindowed];
  uint64_t v22 = NSStringFromSelector(sel_isWindowed);
  [v4 encodeBool:v21 forKey:v22];

  unint64_t v23 = [(TUScreenShareAttributes *)self windowUUID];
  uint64_t v24 = NSStringFromSelector(sel_windowUUID);
  [v4 encodeObject:v23 forKey:v24];

  v25 = [(TUScreenShareAttributes *)self originalResolution];
  v26 = NSStringFromSelector(sel_originalResolution);
  [v4 encodeObject:v25 forKey:v26];

  id v28 = [(TUScreenShareAttributes *)self systemRootLayerTransform];
  v27 = NSStringFromSelector(sel_systemRootLayerTransform);
  [v4 encodeObject:v28 forKey:v27];
}

- (int64_t)deviceFamily
{
  return self->_deviceFamily;
}

- (void)setDeviceFamily:(int64_t)a3
{
  self->_deviceFamily = a3;
}

- (int64_t)deviceHomeButtonType
{
  return self->_deviceHomeButtonType;
}

- (void)setDeviceHomeButtonType:(int64_t)a3
{
  self->_deviceHomeButtonType = a3;
}

- (NSNumber)displayID
{
  return self->_displayID;
}

- (void)setDisplayID:(id)a3
{
}

- (NSNumber)displayScale
{
  return self->_displayScale;
}

- (void)setDisplayScale:(id)a3
{
}

- (NSNumber)frameRate
{
  return self->_frameRate;
}

- (void)setFrameRate:(id)a3
{
}

- (NSValue)originalResolution
{
  return self->_originalResolution;
}

- (void)setOriginalResolution:(id)a3
{
}

- (NSNumber)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(id)a3
{
}

- (NSNumber)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (BOOL)isWindowed
{
  return self->_windowed;
}

- (void)setWindowed:(BOOL)a3
{
  self->_windowed = a3;
}

- (NSUUID)windowUUID
{
  return self->_windowUUID;
}

- (void)setWindowUUID:(id)a3
{
}

- (NSValue)systemRootLayerTransform
{
  return self->_systemRootLayerTransform;
}

- (void)setSystemRootLayerTransform:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemRootLayerTransform, 0);
  objc_storeStrong((id *)&self->_windowUUID, 0);
  objc_storeStrong((id *)&self->_cornerRadius, 0);
  objc_storeStrong((id *)&self->_scaleFactor, 0);
  objc_storeStrong((id *)&self->_originalResolution, 0);
  objc_storeStrong((id *)&self->_frameRate, 0);
  objc_storeStrong((id *)&self->_displayScale, 0);

  objc_storeStrong((id *)&self->_displayID, 0);
}

@end