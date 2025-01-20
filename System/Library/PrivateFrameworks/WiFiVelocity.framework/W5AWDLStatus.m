@interface W5AWDLStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isAWDLRealTimeMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAWDLStatus:(id)a3;
- (BOOL)power;
- (NSArray)ipv6Addresses;
- (NSData)awdlElectionParameters;
- (NSData)awdlMasterChannel;
- (NSData)awdlOpMode;
- (NSData)awdlPeerDatabase;
- (NSData)awdlSecondaryMasterChannel;
- (NSData)awdlSidecarDiagnostics;
- (NSData)awdlStrategy;
- (NSData)awdlSyncChannelSequence;
- (NSData)awdlSyncEnabled;
- (NSData)awdlSyncParameters;
- (NSData)awdlSyncState;
- (NSString)hardwareMACAddress;
- (NSString)interfaceName;
- (NSString)macAddress;
- (W5AWDLStatus)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)airDropDiscoverableMode;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAirDropDiscoverableMode:(int64_t)a3;
- (void)setAwdlElectionParameters:(id)a3;
- (void)setAwdlMasterChannel:(id)a3;
- (void)setAwdlOpMode:(id)a3;
- (void)setAwdlPeerDatabase:(id)a3;
- (void)setAwdlSecondaryMasterChannel:(id)a3;
- (void)setAwdlSidecarDiagnostics:(id)a3;
- (void)setAwdlStrategy:(id)a3;
- (void)setAwdlSyncChannelSequence:(id)a3;
- (void)setAwdlSyncEnabled:(id)a3;
- (void)setAwdlSyncParameters:(id)a3;
- (void)setAwdlSyncState:(id)a3;
- (void)setHardwareMACAddress:(id)a3;
- (void)setInterfaceName:(id)a3;
- (void)setIpv6Addresses:(id)a3;
- (void)setIsAWDLRealTimeMode:(BOOL)a3;
- (void)setMacAddress:(id)a3;
- (void)setPower:(BOOL)a3;
@end

@implementation W5AWDLStatus

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)W5AWDLStatus;
  [(W5AWDLStatus *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:0];
  [v3 appendFormat:@"MAC Address: %@ (hw=%@)\n", self->_macAddress, self->_hardwareMACAddress];
  [v3 appendFormat:@"Interface Name: %@\n", self->_interfaceName];
  if (self->_power) {
    v4 = "On";
  }
  else {
    v4 = "Off";
  }
  objc_msgSend(v3, "appendFormat:", @"Power: %s\n", v4);
  awdlSyncEnabled = self->_awdlSyncEnabled;
  if (awdlSyncEnabled)
  {
    if (*(_DWORD *)([(NSData *)awdlSyncEnabled bytes] + 8)) {
      v6 = "ENABLED";
    }
    else {
      v6 = "DISABLED";
    }
  }
  else
  {
    v6 = "n/a";
  }
  objc_msgSend(v3, "appendFormat:", @"AWDL is %s\n", v6);
  [v3 appendFormat:@"IPv6 Address: %@\n", -[NSArray firstObject](self->_ipv6Addresses, "firstObject")];
  if ([(NSArray *)self->_ipv6Addresses count] >= 2)
  {
    unint64_t v7 = 1;
    do
      [v3 appendFormat:@"              %@\n", -[NSArray objectAtIndexedSubscript:](self->_ipv6Addresses, "objectAtIndexedSubscript:", v7++)];
    while (v7 < [(NSArray *)self->_ipv6Addresses count]);
  }
  awdlStrategy = self->_awdlStrategy;
  if (awdlStrategy) {
    v9 = W5DescriptionForAWDLScheduleState(*(unsigned int *)([(NSData *)awdlStrategy bytes] + 8));
  }
  else {
    v9 = @"n/a";
  }
  [v3 appendFormat:@"Schedule State: %@\n", v9];
  awdlSyncChannelSequence = self->_awdlSyncChannelSequence;
  if (awdlSyncChannelSequence) {
    v11 = (__CFString *)W5DebugDescriptionForAWDLSyncChannelSequence((uint64_t)[(NSData *)awdlSyncChannelSequence bytes]);
  }
  else {
    v11 = @"n/a";
  }
  [v3 appendFormat:@"Channel Sequence: %@\n", v11];
  awdlOpMode = self->_awdlOpMode;
  if (awdlOpMode)
  {
    if (*(_DWORD *)([(NSData *)awdlOpMode bytes] + 4) <= 2u) {
      v13 = off_2641FEF18[*(unsigned int *)([(NSData *)self->_awdlOpMode bytes] + 4)];
    }
    else {
      v13 = "UNKNOWN";
    }
  }
  else
  {
    v13 = "n/a";
  }
  objc_msgSend(v3, "appendFormat:", @"Op Mode: %s\n", v13);
  if (self->_isAWDLRealTimeMode) {
    v14 = "Yes";
  }
  else {
    v14 = "No";
  }
  objc_msgSend(v3, "appendFormat:", @"Real Time Mode: %s\n", v14);
  awdlSyncState = self->_awdlSyncState;
  if (awdlSyncState) {
    v16 = W5DescriptionForAWDLSyncState((__CFString *)[(NSData *)awdlSyncState bytes]);
  }
  else {
    v16 = @"n/a";
  }
  [v3 appendFormat:@"Sync State: %@\n", v16];
  awdlSyncParameters = self->_awdlSyncParameters;
  if (awdlSyncParameters) {
    v18 = (__CFString *)W5DescriptionForAWDLSyncParameters((unsigned int *)[(NSData *)awdlSyncParameters bytes]);
  }
  else {
    v18 = @"n/a";
  }
  [v3 appendFormat:@"Sync Params:\n%@", v18];
  awdlMasterChannel = self->_awdlMasterChannel;
  if (awdlMasterChannel) {
    uint64_t v20 = *(unsigned int *)([(NSData *)awdlMasterChannel bytes] + 4);
  }
  else {
    uint64_t v20 = 0;
  }
  objc_msgSend(v3, "appendFormat:", @"Master Channel: %u\n", v20);
  awdlSecondaryMasterChannel = self->_awdlSecondaryMasterChannel;
  if (awdlSecondaryMasterChannel) {
    uint64_t v22 = *(unsigned int *)([(NSData *)awdlSecondaryMasterChannel bytes] + 4);
  }
  else {
    uint64_t v22 = 0;
  }
  objc_msgSend(v3, "appendFormat:", @"Secondary Master Channel: %u\n", v22);
  awdlElectionParameters = self->_awdlElectionParameters;
  if (awdlElectionParameters) {
    v24 = (__CFString *)W5DescriptionForAWDLElectionParameters((uint64_t)[(NSData *)awdlElectionParameters bytes]);
  }
  else {
    v24 = @"n/a";
  }
  [v3 appendFormat:@"Election Params:\n%@", v24];
  [v3 appendFormat:@"AirDrop Discoverable Mode: %@\n", W5DescriptionForAirDropDiscoverableMode(self->_airDropDiscoverableMode)];
  awdlPeerDatabase = self->_awdlPeerDatabase;
  if (awdlPeerDatabase) {
    objc_msgSend(v3, "appendFormat:", @"Peer DB Count: %ld peers\n", *(unsigned int *)(-[NSData bytes](awdlPeerDatabase, "bytes") + 4));
  }
  awdlSidecarDiagnostics = self->_awdlSidecarDiagnostics;
  if (awdlSidecarDiagnostics) {
    objc_msgSend(v3, "appendFormat:", @"Sidecar Tx Latency: %ld ms\n", *(unsigned int *)(-[NSData bytes](awdlSidecarDiagnostics, "bytes") + 4));
  }
  v27 = (void *)[v3 copy];
  return v27;
}

- (BOOL)conformsToProtocol:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)W5AWDLStatus;
  if (-[W5AWDLStatus conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || ([a3 isEqual:&unk_26C50B870] & 1) != 0)
  {
    return 1;
  }
  else
  {
    return [a3 isEqual:&unk_26C50B6D8];
  }
}

- (BOOL)isEqualToAWDLStatus:(id)a3
{
  macAddress = self->_macAddress;
  if (!macAddress)
  {
    if (![a3 macAddress]) {
      goto LABEL_5;
    }
    macAddress = self->_macAddress;
  }
  if (!-[NSString isEqual:](macAddress, "isEqual:", [a3 macAddress])) {
    return 0;
  }
LABEL_5:
  hardwareMACAddress = self->_hardwareMACAddress;
  if (!hardwareMACAddress)
  {
    if (![a3 hardwareMACAddress]) {
      goto LABEL_9;
    }
    hardwareMACAddress = self->_hardwareMACAddress;
  }
  if (!-[NSString isEqual:](hardwareMACAddress, "isEqual:", [a3 hardwareMACAddress])) {
    return 0;
  }
LABEL_9:
  interfaceName = self->_interfaceName;
  if (!interfaceName)
  {
    if (![a3 interfaceName]) {
      goto LABEL_13;
    }
    interfaceName = self->_interfaceName;
  }
  if (!-[NSString isEqual:](interfaceName, "isEqual:", [a3 interfaceName])) {
    return 0;
  }
LABEL_13:
  int power = self->_power;
  if (power != [a3 power]) {
    return 0;
  }
  ipv6Addresses = self->_ipv6Addresses;
  if (ipv6Addresses) {
    goto LABEL_17;
  }
  if ([a3 ipv6Addresses])
  {
    ipv6Addresses = self->_ipv6Addresses;
LABEL_17:
    if (-[NSArray isEqual:](ipv6Addresses, "isEqual:", [a3 ipv6Addresses])) {
      goto LABEL_18;
    }
    return 0;
  }
LABEL_18:
  int isAWDLRealTimeMode = self->_isAWDLRealTimeMode;
  if (isAWDLRealTimeMode != [a3 isAWDLRealTimeMode]) {
    return 0;
  }
  int64_t airDropDiscoverableMode = self->_airDropDiscoverableMode;
  if (airDropDiscoverableMode != [a3 airDropDiscoverableMode]
    || !-[NSData isEqualToData:](self->_awdlSyncEnabled, "isEqualToData:", [a3 awdlSyncEnabled])
    || !-[NSData isEqualToData:](self->_awdlOpMode, "isEqualToData:", [a3 awdlOpMode])
    || !-[NSData isEqualToData:](self->_awdlSyncState, "isEqualToData:", [a3 awdlSyncState])
    || !-[NSData isEqualToData:](self->_awdlStrategy, "isEqualToData:", [a3 awdlStrategy])
    || !-[NSData isEqualToData:](self->_awdlMasterChannel, "isEqualToData:", [a3 awdlMasterChannel])
    || !-[NSData isEqualToData:](self->_awdlSecondaryMasterChannel, "isEqualToData:", [a3 awdlSecondaryMasterChannel])|| !-[NSData isEqualToData:](self->_awdlSyncParameters, "isEqualToData:", objc_msgSend(a3, "awdlSyncParameters"))|| !-[NSData isEqualToData:](self->_awdlElectionParameters, "isEqualToData:", objc_msgSend(a3, "awdlElectionParameters"))|| !-[NSData isEqualToData:](self->_awdlSyncChannelSequence, "isEqualToData:", objc_msgSend(a3, "awdlSyncChannelSequence"))|| !-[NSData isEqualToData:](self->_awdlPeerDatabase, "isEqualToData:", objc_msgSend(a3, "awdlPeerDatabase")))
  {
    return 0;
  }
  awdlSidecarDiagnostics = self->_awdlSidecarDiagnostics;
  uint64_t v13 = [a3 awdlSidecarDiagnostics];
  return [(NSData *)awdlSidecarDiagnostics isEqualToData:v13];
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
  return [(W5AWDLStatus *)self isEqualToAWDLStatus:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[W5AWDLStatus allocWithZone:a3] init];
  [(W5AWDLStatus *)v4 setMacAddress:self->_macAddress];
  [(W5AWDLStatus *)v4 setHardwareMACAddress:self->_hardwareMACAddress];
  [(W5AWDLStatus *)v4 setInterfaceName:self->_interfaceName];
  [(W5AWDLStatus *)v4 setIpv6Addresses:self->_ipv6Addresses];
  [(W5AWDLStatus *)v4 setPower:self->_power];
  [(W5AWDLStatus *)v4 setAwdlSecondaryMasterChannel:self->_awdlSecondaryMasterChannel];
  [(W5AWDLStatus *)v4 setAwdlOpMode:self->_awdlOpMode];
  [(W5AWDLStatus *)v4 setAwdlMasterChannel:self->_awdlMasterChannel];
  [(W5AWDLStatus *)v4 setAwdlElectionParameters:self->_awdlElectionParameters];
  [(W5AWDLStatus *)v4 setAwdlSyncState:self->_awdlSyncState];
  [(W5AWDLStatus *)v4 setAwdlSyncParameters:self->_awdlSyncParameters];
  [(W5AWDLStatus *)v4 setAwdlSyncEnabled:self->_awdlSyncEnabled];
  [(W5AWDLStatus *)v4 setAwdlSyncChannelSequence:self->_awdlSyncChannelSequence];
  [(W5AWDLStatus *)v4 setAwdlStrategy:self->_awdlStrategy];
  [(W5AWDLStatus *)v4 setIsAWDLRealTimeMode:self->_isAWDLRealTimeMode];
  [(W5AWDLStatus *)v4 setAirDropDiscoverableMode:self->_airDropDiscoverableMode];
  [(W5AWDLStatus *)v4 setAwdlPeerDatabase:self->_awdlPeerDatabase];
  [(W5AWDLStatus *)v4 setAwdlSidecarDiagnostics:self->_awdlSidecarDiagnostics];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_macAddress forKey:@"_macAddress"];
  [a3 encodeObject:self->_hardwareMACAddress forKey:@"_hardwareMACAddress"];
  [a3 encodeObject:self->_interfaceName forKey:@"_interfaceName"];
  [a3 encodeObject:self->_ipv6Addresses forKey:@"_ipv6Addresses"];
  [a3 encodeBool:self->_power forKey:@"_power"];
  [a3 encodeBool:self->_isAWDLRealTimeMode forKey:@"_isAWDLRealTimeMode"];
  [a3 encodeObject:self->_awdlSyncState forKey:@"_awdlSyncState"];
  [a3 encodeObject:self->_awdlSyncEnabled forKey:@"_awdlSyncEnabled"];
  [a3 encodeObject:self->_awdlSyncChannelSequence forKey:@"_awdlSyncChannelSequence"];
  [a3 encodeObject:self->_awdlStrategy forKey:@"_awdlStrategy"];
  [a3 encodeObject:self->_awdlElectionParameters forKey:@"_awdlElectionParameters"];
  [a3 encodeObject:self->_awdlMasterChannel forKey:@"_awdlMasterChannel"];
  [a3 encodeObject:self->_awdlSecondaryMasterChannel forKey:@"_awdlSecondaryMasterChannel"];
  [a3 encodeObject:self->_awdlOpMode forKey:@"_awdlOpMode"];
  [a3 encodeObject:self->_awdlSyncParameters forKey:@"_awdlSyncParameters"];
  [a3 encodeObject:self->_awdlPeerDatabase forKey:@"_awdlPeerDatabase"];
  [a3 encodeInteger:self->_airDropDiscoverableMode forKey:@"_airDropDiscoverableMode"];
  awdlSidecarDiagnostics = self->_awdlSidecarDiagnostics;
  [a3 encodeObject:awdlSidecarDiagnostics forKey:@"_awdlSidecarDiagnostics"];
}

- (W5AWDLStatus)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)W5AWDLStatus;
  v4 = [(W5AWDLStatus *)&v8 init];
  if (v4)
  {
    v4->_macAddress = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_macAddress"), "copy");
    v4->_hardwareMACAddress = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_hardwareMACAddress"), "copy");
    v4->_interfaceName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_interfaceName"), "copy");
    objc_super v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = objc_opt_class();
    v4->_ipv6Addresses = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"_ipv6Addresses"), "copy");
    v4->_int power = [a3 decodeBoolForKey:@"_power"];
    v4->_int isAWDLRealTimeMode = [a3 decodeBoolForKey:@"_isAWDLRealTimeMode"];
    v4->_awdlSyncState = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_awdlSyncState"), "copy");
    v4->_awdlSyncEnabled = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_awdlSyncEnabled"), "copy");
    v4->_awdlSyncChannelSequence = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_awdlSyncChannelSequence"), "copy");
    v4->_awdlStrategy = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_awdlStrategy"), "copy");
    v4->_awdlElectionParameters = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_awdlElectionParameters"), "copy");
    v4->_awdlMasterChannel = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_awdlMasterChannel"), "copy");
    v4->_awdlSecondaryMasterChannel = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_awdlSecondaryMasterChannel"), "copy");
    v4->_awdlOpMode = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_awdlOpMode"), "copy");
    v4->_awdlSyncParameters = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_awdlSyncParameters"), "copy");
    v4->_awdlPeerDatabase = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_awdlPeerDatabase"), "copy");
    v4->_int64_t airDropDiscoverableMode = [a3 decodeIntegerForKey:@"_airDropDiscoverableMode"];
    v4->_awdlSidecarDiagnostics = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_awdlSidecarDiagnostics"), "copy");
  }
  return v4;
}

- (NSString)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(id)a3
{
}

- (NSString)hardwareMACAddress
{
  return self->_hardwareMACAddress;
}

- (void)setHardwareMACAddress:(id)a3
{
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (NSArray)ipv6Addresses
{
  return self->_ipv6Addresses;
}

- (void)setIpv6Addresses:(id)a3
{
}

- (BOOL)power
{
  return self->_power;
}

- (void)setPower:(BOOL)a3
{
  self->_int power = a3;
}

- (NSData)awdlSyncEnabled
{
  return self->_awdlSyncEnabled;
}

- (void)setAwdlSyncEnabled:(id)a3
{
}

- (NSData)awdlSyncState
{
  return self->_awdlSyncState;
}

- (void)setAwdlSyncState:(id)a3
{
}

- (NSData)awdlSyncChannelSequence
{
  return self->_awdlSyncChannelSequence;
}

- (void)setAwdlSyncChannelSequence:(id)a3
{
}

- (NSData)awdlStrategy
{
  return self->_awdlStrategy;
}

- (void)setAwdlStrategy:(id)a3
{
}

- (NSData)awdlElectionParameters
{
  return self->_awdlElectionParameters;
}

- (void)setAwdlElectionParameters:(id)a3
{
}

- (NSData)awdlMasterChannel
{
  return self->_awdlMasterChannel;
}

- (void)setAwdlMasterChannel:(id)a3
{
}

- (NSData)awdlSecondaryMasterChannel
{
  return self->_awdlSecondaryMasterChannel;
}

- (void)setAwdlSecondaryMasterChannel:(id)a3
{
}

- (NSData)awdlOpMode
{
  return self->_awdlOpMode;
}

- (void)setAwdlOpMode:(id)a3
{
}

- (NSData)awdlSyncParameters
{
  return self->_awdlSyncParameters;
}

- (void)setAwdlSyncParameters:(id)a3
{
}

- (NSData)awdlPeerDatabase
{
  return self->_awdlPeerDatabase;
}

- (void)setAwdlPeerDatabase:(id)a3
{
}

- (NSData)awdlSidecarDiagnostics
{
  return self->_awdlSidecarDiagnostics;
}

- (void)setAwdlSidecarDiagnostics:(id)a3
{
}

- (BOOL)isAWDLRealTimeMode
{
  return self->_isAWDLRealTimeMode;
}

- (void)setIsAWDLRealTimeMode:(BOOL)a3
{
  self->_int isAWDLRealTimeMode = a3;
}

- (int64_t)airDropDiscoverableMode
{
  return self->_airDropDiscoverableMode;
}

- (void)setAirDropDiscoverableMode:(int64_t)a3
{
  self->_int64_t airDropDiscoverableMode = a3;
}

@end