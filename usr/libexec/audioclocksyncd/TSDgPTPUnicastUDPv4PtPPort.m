@interface TSDgPTPUnicastUDPv4PtPPort
+ (id)diagnosticInfoForService:(id)a3;
- (NSNumber)destinationIPv4Address;
- (TSDgPTPUnicastUDPv4PtPPort)initWithService:(id)a3 pid:(int)a4;
- (id)_destinationAddressString;
- (id)_destinationIPv4Address;
- (id)_sourceAddressString;
- (id)propertiesForXPC;
- (int)portType;
@end

@implementation TSDgPTPUnicastUDPv4PtPPort

- (TSDgPTPUnicastUDPv4PtPPort)initWithService:(id)a3 pid:(int)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TSDgPTPUnicastUDPv4PtPPort;
  v4 = [(TSDgPTPFDPtPPort *)&v9 initWithService:a3 pid:*(void *)&a4];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [(TSDgPTPUnicastUDPv4PtPPort *)v4 _destinationIPv4Address];
    destinationIPv4Address = v5->_destinationIPv4Address;
    v5->_destinationIPv4Address = (NSNumber *)v6;
  }
  return v5;
}

- (int)portType
{
  return 3;
}

- (id)_sourceAddressString
{
  v9.receiver = self;
  v9.super_class = (Class)TSDgPTPUnicastUDPv4PtPPort;
  v3 = [(TSDgPTPNetworkPort *)&v9 _sourceAddressString];
  v4 = [(TSDgPTPPort *)self service];
  v5 = [v4 iodPropertyForKey:@"SourceIPAddress"];

  if (v5)
  {
    unsigned int v6 = [v5 unsignedIntValue];
    uint64_t v7 = +[NSString stringWithFormat:@"%u.%u.%u.%u", HIBYTE(v6), BYTE2(v6), BYTE1(v6), v6];

    v3 = (void *)v7;
  }

  return v3;
}

- (id)_destinationAddressString
{
  v9.receiver = self;
  v9.super_class = (Class)TSDgPTPUnicastUDPv4PtPPort;
  v3 = [(TSDgPTPNetworkPort *)&v9 _destinationAddressString];
  v4 = [(TSDgPTPPort *)self service];
  v5 = [v4 iodPropertyForKey:@"DestinationIPAddress"];

  if (v5)
  {
    unsigned int v6 = [v5 unsignedIntValue];
    uint64_t v7 = +[NSString stringWithFormat:@"%u.%u.%u.%u", HIBYTE(v6), BYTE2(v6), BYTE1(v6), v6];

    v3 = (void *)v7;
  }

  return v3;
}

- (id)_destinationIPv4Address
{
  v2 = [(TSDgPTPPort *)self service];
  v3 = [v2 iodPropertyForKey:@"DestinationIPAddress"];

  return v3;
}

- (id)propertiesForXPC
{
  v9.receiver = self;
  v9.super_class = (Class)TSDgPTPUnicastUDPv4PtPPort;
  v3 = [(TSDgPTPNetworkPort *)&v9 propertiesForXPC];
  v4 = [(TSDgPTPPort *)self service];
  v5 = [v4 iodPropertyForKey:@"SourceIPAddress"];
  [v3 setObject:v5 forKeyedSubscript:@"SourceIPAddress"];

  unsigned int v6 = [(TSDgPTPPort *)self service];
  uint64_t v7 = [v6 iodPropertyForKey:@"DestinationIPAddress"];
  [v3 setObject:v7 forKeyedSubscript:@"DestinationIPAddress"];

  return v3;
}

+ (id)diagnosticInfoForService:(id)a3
{
  id v4 = a3;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___TSDgPTPUnicastUDPv4PtPPort;
  v5 = [super diagnosticInfoForService:v4];
  unsigned int v6 = +[NSNumber numberWithInt:3];
  [v5 setObject:v6 forKeyedSubscript:@"PortType"];

  uint64_t v7 = [v4 iodPropertyForKey:@"SourceIPAddress"];
  v8 = v7;
  if (v7)
  {
    unsigned int v9 = [v7 unsignedIntValue];
    v10 = +[NSString stringWithFormat:@"%u.%u.%u.%u", HIBYTE(v9), BYTE2(v9), BYTE1(v9), v9];
    [v5 setObject:v10 forKeyedSubscript:@"SourceAddress"];
  }
  v11 = [v4 iodPropertyForKey:@"DestinationIPAddress"];

  if (v11)
  {
    unsigned int v12 = [v11 unsignedIntValue];
    v13 = +[NSString stringWithFormat:@"%u.%u.%u.%u", HIBYTE(v12), BYTE2(v12), BYTE1(v12), v12];
    [v5 setObject:v13 forKeyedSubscript:@"DestinationAddress"];
  }

  return v5;
}

- (NSNumber)destinationIPv4Address
{
  return self->_destinationIPv4Address;
}

- (void).cxx_destruct
{
}

@end