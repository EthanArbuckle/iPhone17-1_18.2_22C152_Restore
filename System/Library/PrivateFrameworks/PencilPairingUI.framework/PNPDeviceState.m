@interface PNPDeviceState
+ (BOOL)supportsSecureCoding;
- (BOOL)batteryLevelUnknown;
- (BOOL)isCharging;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOnLeftOrRightSide;
- (NSString)displayName;
- (NSString)name;
- (NSUUID)identifier;
- (PNPDeviceState)init;
- (PNPDeviceState)initWithCoder:(id)a3;
- (double)batteryLevel;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)deviceType;
- (unint64_t)edge;
- (unint64_t)orientation;
- (void)encodeWithCoder:(id)a3;
- (void)setBatteryLevel:(double)a3;
- (void)setBatteryLevelUnknown:(BOOL)a3;
- (void)setDeviceType:(int64_t)a3;
- (void)setDisplayName:(id)a3;
- (void)setEdge:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsCharging:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setOrientation:(unint64_t)a3;
@end

@implementation PNPDeviceState

- (PNPDeviceState)init
{
  v4.receiver = self;
  v4.super_class = (Class)PNPDeviceState;
  v2 = [(PNPDeviceState *)&v4 init];
  [(PNPDeviceState *)v2 setEdge:4];
  [(PNPDeviceState *)v2 setBatteryLevelUnknown:1];
  v2->_isCharging = 1;
  v2->_deviceType = 0;
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(PNPDeviceState *)self name];
  [v4 setName:v5];

  [(PNPDeviceState *)self batteryLevel];
  objc_msgSend(v4, "setBatteryLevel:");
  objc_msgSend(v4, "setEdge:", -[PNPDeviceState edge](self, "edge"));
  objc_msgSend(v4, "setOrientation:", -[PNPDeviceState orientation](self, "orientation"));
  objc_msgSend(v4, "setBatteryLevelUnknown:", -[PNPDeviceState batteryLevelUnknown](self, "batteryLevelUnknown"));
  v6 = [(PNPDeviceState *)self identifier];
  [v4 setIdentifier:v6];

  objc_msgSend(v4, "setIsCharging:", -[PNPDeviceState isCharging](self, "isCharging"));
  objc_msgSend(v4, "setDeviceType:", -[PNPDeviceState deviceType](self, "deviceType"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 name];
    v7 = [(PNPDeviceState *)self name];
    int v8 = [v6 isEqualToString:v7];

    if (v8)
    {
      [v5 batteryLevel];
      double v10 = v9;
      [(PNPDeviceState *)self batteryLevel];
      if (v10 == v11)
      {
        uint64_t v12 = [v5 edge];
        if (v12 == [(PNPDeviceState *)self edge])
        {
          uint64_t v13 = [v5 orientation];
          if (v13 == [(PNPDeviceState *)self orientation])
          {
            int v14 = [v5 batteryLevelUnknown];
            if (v14 == [(PNPDeviceState *)self batteryLevelUnknown])
            {
              int v15 = [v5 isCharging];
              if (v15 == [(PNPDeviceState *)self isCharging])
              {
                v16 = [v5 identifier];
                if (!v16)
                {
                  v7 = [(PNPDeviceState *)self identifier];
                  if (!v7) {
                    goto LABEL_12;
                  }
                }
                v17 = [v5 identifier];
                v18 = [(PNPDeviceState *)self identifier];
                int v19 = [v17 isEqual:v18];

                if (v16)
                {

                  if (v19)
                  {
LABEL_12:
                    uint64_t v20 = [v5 deviceType];
                    BOOL v21 = v20 == [(PNPDeviceState *)self deviceType];
LABEL_16:

                    goto LABEL_17;
                  }
                }
                else
                {

                  if (v19) {
                    goto LABEL_12;
                  }
                }
              }
            }
          }
        }
      }
    }
    BOOL v21 = 0;
    goto LABEL_16;
  }
  BOOL v21 = 0;
LABEL_17:

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(PNPDeviceState *)self name];
  [v6 encodeObject:v4 forKey:@"name"];

  [(PNPDeviceState *)self batteryLevel];
  objc_msgSend(v6, "encodeDouble:forKey:", @"batteryLevel");
  objc_msgSend(v6, "encodeInteger:forKey:", -[PNPDeviceState edge](self, "edge"), @"edge");
  objc_msgSend(v6, "encodeInteger:forKey:", -[PNPDeviceState orientation](self, "orientation"), @"orientation");
  objc_msgSend(v6, "encodeBool:forKey:", -[PNPDeviceState batteryLevelUnknown](self, "batteryLevelUnknown"), @"batteryLevelUnknown");
  objc_msgSend(v6, "encodeBool:forKey:", -[PNPDeviceState isCharging](self, "isCharging"), @"charging");
  id v5 = [(PNPDeviceState *)self identifier];
  [v6 encodeObject:v5 forKey:@"identifier"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[PNPDeviceState deviceType](self, "deviceType"), @"deviceType");
}

- (PNPDeviceState)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PNPDeviceState *)self init];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  name = v5->_name;
  v5->_name = (NSString *)v6;

  [v4 decodeDoubleForKey:@"batteryLevel"];
  v5->_batteryLevel = v8;
  v5->_edge = [v4 decodeIntegerForKey:@"edge"];
  v5->_orientation = [v4 decodeIntegerForKey:@"orientation"];
  v5->_batteryLevelUnknown = [v4 decodeBoolForKey:@"batteryLevelUnknown"];
  v5->_isCharging = [v4 decodeBoolForKey:@"charging"];
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];

  identifier = v5->_identifier;
  v5->_identifier = (NSUUID *)v9;

  return v5;
}

- (NSString)displayName
{
  v3 = [(PNPDeviceState *)self name];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = PencilPairingUIBundle();
    id v5 = [v6 localizedStringForKey:@"APPLE_PENCIL_NAME" value:&stru_26ECD9920 table:0];
  }
  if ([(PNPDeviceState *)self deviceType] == 4)
  {
    v7 = PencilPairingUIBundle();
    uint64_t v8 = [v7 localizedStringForKey:@"APPLE_PENCIL_NAME_PRO" value:&stru_26ECD9920 table:@"PencilPairingSqueeze-B532"];

    id v5 = (id)v8;
  }
  if (v5)
  {
    id v9 = v5;
  }
  else
  {
    double v10 = PencilPairingUIBundle();
    id v9 = [v10 localizedStringForKey:@"APPLE_PENCIL_NAME" value:&stru_26ECD9920 table:0];
  }
  return (NSString *)v9;
}

- (double)batteryLevel
{
  float batteryLevel = self->_batteryLevel;
  return BatteryLevel(batteryLevel);
}

- (BOOL)isOnLeftOrRightSide
{
  return [(PNPDeviceState *)self edge] == 2 || [(PNPDeviceState *)self edge] == 8;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void)setDisplayName:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setBatteryLevel:(double)a3
{
  self->_float batteryLevel = a3;
}

- (unint64_t)edge
{
  return self->_edge;
}

- (void)setEdge:(unint64_t)a3
{
  self->_edge = a3;
}

- (unint64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(unint64_t)a3
{
  self->_orientation = a3;
}

- (BOOL)batteryLevelUnknown
{
  return self->_batteryLevelUnknown;
}

- (void)setBatteryLevelUnknown:(BOOL)a3
{
  self->_batteryLevelUnknown = a3;
}

- (BOOL)isCharging
{
  return self->_isCharging;
}

- (void)setIsCharging:(BOOL)a3
{
  self->_isCharging = a3;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end