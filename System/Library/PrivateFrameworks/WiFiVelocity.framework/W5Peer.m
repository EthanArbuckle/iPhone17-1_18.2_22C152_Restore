@interface W5Peer
+ (BOOL)supportsSecureCoding;
- (BOOL)_isOSVersionSupported:(id *)a3;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPeer:(id)a3;
- (BOOL)nearby;
- (NSData)iconImage;
- (NSString)build;
- (NSString)model;
- (NSString)name;
- (NSString)os;
- (NSString)peerID;
- (NSString)version;
- (RPCompanionLinkDevice)device;
- (W5Peer)initWithCoder:(id)a3;
- (W5Peer)initWithCompanionLinkDevice:(id)a3;
- (id)companionLinkDevice;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)controlFlags;
- (int64_t)discoveryFlags;
- (int64_t)proximity;
- (int64_t)type;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBuild:(id)a3;
- (void)setControlFlags:(int64_t)a3;
- (void)setDevice:(id)a3;
- (void)setDiscoveryFlags:(int64_t)a3;
- (void)setIconImage:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setNearby:(BOOL)a3;
- (void)setOs:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setProximity:(int64_t)a3;
- (void)setVersion:(id)a3;
@end

@implementation W5Peer

- (W5Peer)initWithCompanionLinkDevice:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)W5Peer;
  v4 = [(W5Peer *)&v7 init];
  if (v4)
  {
    v4->_peerID = (NSString *)objc_msgSend((id)objc_msgSend(a3, "idsDeviceIdentifier"), "copy");
    v4->_name = (NSString *)objc_msgSend((id)objc_msgSend(a3, "name"), "copy");
    v4->_model = (NSString *)objc_msgSend((id)objc_msgSend(a3, "model"), "copy");
    v4->_proximity = (int)[a3 proximity];
    *(_OWORD *)&v4->_discoveryFlags = xmmword_2142B2F80;
    if (a3) {
      [a3 operatingSystemVersion];
    }
    else {
      memset(v6, 0, sizeof(v6));
    }
    if ([(W5Peer *)v4 _isOSVersionSupported:v6]
      && (([a3 statusFlags] & 2) != 0
       || ([a3 statusFlags] & 4) != 0
       && (objc_msgSend((id)objc_msgSend(a3, "serviceTypes"), "containsObject:", @"com.apple.wifivelocityd.rapportWake") & 1) != 0|| (objc_msgSend(a3, "statusFlags") & 4) != 0 && -[W5Peer type](v4, "type") == 1))
    {
      v4->_discoveryFlags |= 2uLL;
    }
  }
  return v4;
}

- (BOOL)_isOSVersionSupported:(id *)a3
{
  int64_t var0 = a3->var0;
  switch([(W5Peer *)self type])
  {
    case 1:
      BOOL v4 = var0 <= 14;
      goto LABEL_3;
    case 2:
    case 3:
    case 4:
    case 5:
    case 7:
      BOOL v4 = var0 <= 17;
      goto LABEL_3;
    case 6:
      BOOL v4 = var0 <= 10;
      goto LABEL_3;
    case 8:
      BOOL v4 = var0 <= 1;
LABEL_3:
      BOOL result = !v4;
      break;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)W5Peer;
  [(W5Peer *)&v3 dealloc];
}

- (int64_t)type
{
  v2 = [(W5Peer *)self model];
  int64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  if ([(NSString *)v2 rangeOfString:@"iPod"] != 0x7FFFFFFFFFFFFFFFLL) {
    return 3;
  }
  if ([(NSString *)v2 rangeOfString:@"iPad"] != 0x7FFFFFFFFFFFFFFFLL) {
    return 4;
  }
  if ([(NSString *)v2 rangeOfString:@"iPhone"] != 0x7FFFFFFFFFFFFFFFLL) {
    return 2;
  }
  if ([(NSString *)v2 rangeOfString:@"Mac"] != 0x7FFFFFFFFFFFFFFFLL) {
    return 1;
  }
  if ([(NSString *)v2 rangeOfString:@"AppleTV"] != 0x7FFFFFFFFFFFFFFFLL) {
    return 5;
  }
  if ([(NSString *)v2 rangeOfString:@"Watch"] != 0x7FFFFFFFFFFFFFFFLL) {
    return 6;
  }
  if ([(NSString *)v2 rangeOfString:@"HomePod"] != 0x7FFFFFFFFFFFFFFFLL
    || [(NSString *)v2 rangeOfString:@"AudioAccessory"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    return 7;
  }
  if ([(NSString *)v2 rangeOfString:@"rProd"] != 0x7FFFFFFFFFFFFFFFLL
    || [(NSString *)v2 rangeOfString:@"RealityDevice"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    return 8;
  }
  return v3;
}

- (id)description
{
  int64_t v3 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:0];
  BOOL v4 = v3;
  peerID = @"LOCAL";
  if (self->_peerID) {
    peerID = (__CFString *)self->_peerID;
  }
  [v3 appendFormat:@"[%@] %@ / %@, ", peerID, self->_name, self->_model];
  if (self->_build) {
    [v4 appendFormat:@"%@, ", self->_build];
  }
  if (self->_os) {
    [v4 appendFormat:@"%@, ", self->_os];
  }
  if (self->_version) {
    [v4 appendFormat:@"%@, ", self->_version];
  }
  if (self->_nearby) {
    [v4 appendFormat:@"Nearby=%d, ", 1];
  }
  if (self->_discoveryFlags) {
    [v4 appendFormat:@"DiscoveryFlags=%lu, ", self->_discoveryFlags];
  }
  if (self->_controlFlags) {
    [v4 appendFormat:@"ControlFlags=%lu, ", self->_controlFlags];
  }
  if ([v4 hasSuffix:@", "]) {
    objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 2, 2);
  }
  v6 = (void *)[v4 copy];
  return v6;
}

- (BOOL)conformsToProtocol:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)W5Peer;
  return [(W5Peer *)&v4 conformsToProtocol:a3];
}

- (BOOL)isEqualToPeer:(id)a3
{
  peerID = self->_peerID;
  if (peerID == (NSString *)[a3 peerID])
  {
    LOBYTE(v6) = 1;
  }
  else if (self->_peerID)
  {
    uint64_t v6 = [a3 peerID];
    if (v6)
    {
      objc_super v7 = self->_peerID;
      uint64_t v8 = [a3 peerID];
      LOBYTE(v6) = [(NSString *)v7 isEqual:v8];
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [(W5Peer *)self isEqualToPeer:a3];
}

- (unint64_t)hash
{
  return [(NSString *)self->_peerID hash];
}

- (id)companionLinkDevice
{
  device = self->_device;
  if (device) {

  }
  objc_super v4 = (RPCompanionLinkDevice *)objc_alloc_init(MEMORY[0x263F62B80]);
  self->_device = v4;
  [(RPCompanionLinkDevice *)v4 setIdentifier:self->_peerID];
  return self->_device;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = [+[W5Peer allocWithZone:a3] init];
  [(W5Peer *)v4 setName:self->_name];
  [(W5Peer *)v4 setPeerID:self->_peerID];
  [(W5Peer *)v4 setModel:self->_model];
  [(W5Peer *)v4 setBuild:self->_build];
  [(W5Peer *)v4 setVersion:self->_version];
  [(W5Peer *)v4 setOs:self->_os];
  [(W5Peer *)v4 setNearby:self->_nearby];
  [(W5Peer *)v4 setProximity:self->_proximity];
  -[W5Peer setDevice:](v4, "setDevice:", objc_msgSend(MEMORY[0x263F08928], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), objc_msgSend(MEMORY[0x263F08910], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_device, 1, 0), 0));
  [(W5Peer *)v4 setControlFlags:self->_controlFlags];
  [(W5Peer *)v4 setDiscoveryFlags:self->_discoveryFlags];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_name forKey:@"_name"];
  [a3 encodeObject:self->_peerID forKey:@"_peerID"];
  [a3 encodeObject:self->_model forKey:@"_model"];
  [a3 encodeObject:self->_build forKey:@"_build"];
  [a3 encodeObject:self->_version forKey:@"_version"];
  [a3 encodeObject:self->_os forKey:@"_os"];
  [a3 encodeBool:self->_nearby forKey:@"_nearby"];
  [a3 encodeInteger:self->_proximity forKey:@"_proximity"];
  [a3 encodeObject:self->_device forKey:@"_device"];
  [a3 encodeInteger:self->_controlFlags forKey:@"_controlFlags"];
  int64_t discoveryFlags = self->_discoveryFlags;
  [a3 encodeInteger:discoveryFlags forKey:@"_discoveryFlags"];
}

- (W5Peer)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)W5Peer;
  objc_super v4 = [(W5Peer *)&v6 init];
  if (v4)
  {
    v4->_name = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_name"), "copy");
    v4->_peerID = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_peerID"), "copy");
    v4->_model = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_model"), "copy");
    v4->_build = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_build"), "copy");
    v4->_version = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_version"), "copy");
    v4->_os = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_os"), "copy");
    v4->_nearby = [a3 decodeBoolForKey:@"_nearby"];
    v4->_proximity = [a3 decodeIntegerForKey:@"_proximity"];
    v4->_device = (RPCompanionLinkDevice *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"_device"];
    v4->_int64_t discoveryFlags = [a3 decodeIntegerForKey:@"_discoveryFlags"];
    v4->_controlFlags = [a3 decodeIntegerForKey:@"_controlFlags"];
  }
  return v4;
}

- (NSString)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
}

- (NSString)os
{
  return self->_os;
}

- (void)setOs:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSData)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
}

- (BOOL)nearby
{
  return self->_nearby;
}

- (void)setNearby:(BOOL)a3
{
  self->_nearby = a3;
}

- (int64_t)proximity
{
  return self->_proximity;
}

- (void)setProximity:(int64_t)a3
{
  self->_proximity = a3;
}

- (int64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (void)setDiscoveryFlags:(int64_t)a3
{
  self->_int64_t discoveryFlags = a3;
}

- (int64_t)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(int64_t)a3
{
  self->_controlFlags = a3;
}

- (RPCompanionLinkDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

@end