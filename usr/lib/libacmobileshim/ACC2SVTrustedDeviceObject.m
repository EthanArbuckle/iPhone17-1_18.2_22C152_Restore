@interface ACC2SVTrustedDeviceObject
- (ACC2SVTrustedDeviceObject)initWithDictionary:(id)a3;
- (BOOL)isSMSDevice;
- (BOOL)isTOTPDevice;
- (NSData)deviceIcon;
- (NSDate)lastUseDate;
- (NSString)deviceClass;
- (NSString)deviceColor;
- (NSString)deviceDescription;
- (NSString)deviceDisplayDescription;
- (NSString)deviceID;
- (NSString)deviceModel;
- (NSString)deviceModelName;
- (NSString)deviceType;
- (NSString)imageURL;
- (double)scale;
- (id)description;
- (void)dealloc;
- (void)setDeviceClass:(id)a3;
- (void)setDeviceColor:(id)a3;
- (void)setDeviceDescription:(id)a3;
- (void)setDeviceID:(id)a3;
- (void)setDeviceIcon:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDeviceModelName:(id)a3;
- (void)setDeviceType:(id)a3;
- (void)setLastUseDate:(id)a3;
@end

@implementation ACC2SVTrustedDeviceObject

- (ACC2SVTrustedDeviceObject)initWithDictionary:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ACC2SVTrustedDeviceObject;
  v4 = [(ACC2SVTrustedDeviceObject *)&v8 init];
  if (v4)
  {
    -[ACC2SVTrustedDeviceObject setDeviceID:](v4, "setDeviceID:", [a3 objectForKey:@"di"]);
    -[ACC2SVTrustedDeviceObject setDeviceType:](v4, "setDeviceType:", [a3 objectForKey:@"dk"]);
    -[ACC2SVTrustedDeviceObject setDeviceClass:](v4, "setDeviceClass:", [a3 objectForKey:@"ds"]);
    -[ACC2SVTrustedDeviceObject setDeviceDescription:](v4, "setDeviceDescription:", [a3 objectForKey:@"dd"]);
    -[ACC2SVTrustedDeviceObject setDeviceModel:](v4, "setDeviceModel:", [a3 objectForKey:@"dm"]);
    -[ACC2SVTrustedDeviceObject setDeviceModelName:](v4, "setDeviceModelName:", [a3 objectForKey:@"dn"]);
    -[ACC2SVTrustedDeviceObject setDeviceColor:](v4, "setDeviceColor:", [a3 objectForKey:@"dc"]);
    v5 = (void *)MEMORY[0x263EFF910];
    [a3 objectForKey:@"du"] doubleValue];
    -[ACC2SVTrustedDeviceObject setLastUseDate:](v4, "setLastUseDate:", [v5 dateWithTimeIntervalSince1970:v6 / 1000.0]);
  }
  return v4;
}

- (void)dealloc
{
  [(ACC2SVTrustedDeviceObject *)self setDeviceID:0];
  [(ACC2SVTrustedDeviceObject *)self setDeviceType:0];
  [(ACC2SVTrustedDeviceObject *)self setDeviceClass:0];
  [(ACC2SVTrustedDeviceObject *)self setDeviceDescription:0];
  [(ACC2SVTrustedDeviceObject *)self setDeviceModel:0];
  [(ACC2SVTrustedDeviceObject *)self setDeviceModelName:0];
  [(ACC2SVTrustedDeviceObject *)self setDeviceColor:0];
  [(ACC2SVTrustedDeviceObject *)self setDeviceIcon:0];
  [(ACC2SVTrustedDeviceObject *)self setLastUseDate:0];
  v3.receiver = self;
  v3.super_class = (Class)ACC2SVTrustedDeviceObject;
  [(ACC2SVTrustedDeviceObject *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Description: %@, Type:%@, Class: %@, Model:%@, Color:%@", -[ACC2SVTrustedDeviceObject deviceDescription](self, "deviceDescription"), -[ACC2SVTrustedDeviceObject deviceType](self, "deviceType"), -[ACC2SVTrustedDeviceObject deviceClass](self, "deviceClass"), -[ACC2SVTrustedDeviceObject deviceModel](self, "deviceModel"), -[ACC2SVTrustedDeviceObject deviceColor](self, "deviceColor")];
}

- (BOOL)isSMSDevice
{
  v2 = [(ACC2SVTrustedDeviceObject *)self deviceType];

  return [(NSString *)v2 isEqualToString:@"S"];
}

- (BOOL)isTOTPDevice
{
  v2 = [(ACC2SVTrustedDeviceObject *)self deviceType];

  return [(NSString *)v2 isEqualToString:@"T"];
}

- (NSString)deviceDisplayDescription
{
  objc_super v3 = [(ACC2SVTrustedDeviceObject *)self deviceDescription];
  if (![(ACC2SVTrustedDeviceObject *)self isSMSDevice]) {
    return v3;
  }
  uint64_t v4 = [(NSString *)v3 stringByReplacingOccurrencesOfString:@"Phone number ending in " withString:&stru_26F261788];
  return (NSString *)[NSString stringWithFormat:+[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", @"Number ending in %@", v4];
}

- (NSString)imageURL
{
  if (![(NSString *)[(ACC2SVTrustedDeviceObject *)self deviceClass] length]
    || ![(NSString *)[(ACC2SVTrustedDeviceObject *)self deviceModel] length])
  {
    return 0;
  }
  objc_super v3 = (void *)[MEMORY[0x263F089D8] stringWithString:@"https://statici.icloud.com/fmipmobile/deviceImages-4.0/"];
  [v3 appendString:-[ACC2SVTrustedDeviceObject deviceClass](self, "deviceClass")];
  [v3 appendString:@"/"];
  [v3 appendString:-[ACC2SVTrustedDeviceObject deviceModel](self, "deviceModel")];
  if ([(NSString *)[(ACC2SVTrustedDeviceObject *)self deviceColor] length])
  {
    [v3 appendString:@"-"];
    [v3 appendString:-[ACC2SVTrustedDeviceObject deviceColor](self, "deviceColor")];
  }
  [v3 appendString:@"/"];
  [(ACC2SVTrustedDeviceObject *)self scale];
  if (v4 <= 2.00999999)
  {
    [(ACC2SVTrustedDeviceObject *)self scale];
    v5 = &stru_26F261788;
    if (v6 > 1.00999999) {
      v5 = @"__2x";
    }
  }
  else
  {
    v5 = @"__3x";
  }
  [v3 appendString:[NSString stringWithFormat:@"online-sourcelist%@.png", v5]];
  return (NSString *)v3;
}

- (double)scale
{
  v2 = (void *)[MEMORY[0x263F1C920] mainScreen];

  [v2 scale];
  return result;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
}

- (NSString)deviceDescription
{
  return self->_deviceDescription;
}

- (void)setDeviceDescription:(id)a3
{
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
}

- (NSString)deviceModelName
{
  return self->_deviceModelName;
}

- (void)setDeviceModelName:(id)a3
{
}

- (NSString)deviceColor
{
  return self->_deviceColor;
}

- (void)setDeviceColor:(id)a3
{
}

- (NSData)deviceIcon
{
  return self->_deviceIcon;
}

- (void)setDeviceIcon:(id)a3
{
}

- (NSDate)lastUseDate
{
  return self->_lastUseDate;
}

- (void)setLastUseDate:(id)a3
{
}

@end