@interface _TSF_TSDgPTPUnicastLinkLayerEtEPort
+ (id)diagnosticInfoForService:(id)a3;
- (NSData)destinationMACAddress;
- (_TSF_TSDgPTPUnicastLinkLayerEtEPort)initWithService:(id)a3 pid:(int)a4;
- (id)_destinationAddressString;
- (id)_destinationMACAddress;
- (id)_sourceAddressString;
- (id)propertiesForXPC;
- (int)portType;
@end

@implementation _TSF_TSDgPTPUnicastLinkLayerEtEPort

- (_TSF_TSDgPTPUnicastLinkLayerEtEPort)initWithService:(id)a3 pid:(int)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_TSF_TSDgPTPUnicastLinkLayerEtEPort;
  v4 = [(_TSF_TSDgPTPFDEtEPort *)&v9 initWithService:a3 pid:*(void *)&a4];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [(_TSF_TSDgPTPUnicastLinkLayerEtEPort *)v4 _destinationMACAddress];
    destinationMACAddress = v5->_destinationMACAddress;
    v5->_destinationMACAddress = (NSData *)v6;
  }
  return v5;
}

- (id)_sourceAddressString
{
  v9.receiver = self;
  v9.super_class = (Class)_TSF_TSDgPTPUnicastLinkLayerEtEPort;
  v3 = [(_TSF_TSDgPTPNetworkPort *)&v9 _sourceAddressString];
  v4 = [(_TSF_TSDgPTPPort *)self service];
  v5 = [v4 iodPropertyForKey:@"SourceMACAddress"];

  if (v5)
  {
    uint64_t v6 = (unsigned __int8 *)[v5 bytes];
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx", *v6, v6[1], v6[2], v6[3], v6[4], v6[5]);

    v3 = (void *)v7;
  }

  return v3;
}

- (id)_destinationAddressString
{
  v9.receiver = self;
  v9.super_class = (Class)_TSF_TSDgPTPUnicastLinkLayerEtEPort;
  v3 = [(_TSF_TSDgPTPNetworkPort *)&v9 _destinationAddressString];
  v4 = [(_TSF_TSDgPTPPort *)self service];
  v5 = [v4 iodPropertyForKey:@"DestinationMACAddress"];

  if (v5)
  {
    uint64_t v6 = (unsigned __int8 *)[v5 bytes];
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx", *v6, v6[1], v6[2], v6[3], v6[4], v6[5]);

    v3 = (void *)v7;
  }

  return v3;
}

- (id)_destinationMACAddress
{
  v2 = [(_TSF_TSDgPTPPort *)self service];
  v3 = [v2 iodPropertyForKey:@"DestinationMACAddress"];

  return v3;
}

- (int)portType
{
  return 5;
}

- (id)propertiesForXPC
{
  v9.receiver = self;
  v9.super_class = (Class)_TSF_TSDgPTPUnicastLinkLayerEtEPort;
  v3 = [(_TSF_TSDgPTPNetworkPort *)&v9 propertiesForXPC];
  v4 = [(_TSF_TSDgPTPPort *)self service];
  v5 = [v4 iodPropertyForKey:@"SourceMACAddress"];
  [v3 setObject:v5 forKeyedSubscript:@"SourceMACAddress"];

  uint64_t v6 = [(_TSF_TSDgPTPPort *)self service];
  uint64_t v7 = [v6 iodPropertyForKey:@"DestinationMACAddress"];
  [v3 setObject:v7 forKeyedSubscript:@"DestinationMACAddress"];

  return v3;
}

+ (id)diagnosticInfoForService:(id)a3
{
  id v4 = a3;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS____TSF_TSDgPTPUnicastLinkLayerEtEPort;
  v5 = objc_msgSendSuper2(&v15, sel_diagnosticInfoForService_, v4);
  uint64_t v6 = [NSNumber numberWithInt:5];
  [v5 setObject:v6 forKeyedSubscript:@"PortType"];

  uint64_t v7 = [v4 iodPropertyForKey:@"SourceMACAddress"];
  v8 = v7;
  if (v7)
  {
    objc_super v9 = (unsigned __int8 *)[v7 bytes];
    v10 = objc_msgSend(NSString, "stringWithFormat:", @"%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx", *v9, v9[1], v9[2], v9[3], v9[4], v9[5]);
    [v5 setObject:v10 forKeyedSubscript:@"SourceAddress"];
  }
  v11 = [v4 iodPropertyForKey:@"DestinationMACAddress"];

  if (v11)
  {
    v12 = (unsigned __int8 *)[v11 bytes];
    v13 = objc_msgSend(NSString, "stringWithFormat:", @"%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx", *v12, v12[1], v12[2], v12[3], v12[4], v12[5]);
    [v5 setObject:v13 forKeyedSubscript:@"DestinationAddress"];
  }
  return v5;
}

- (NSData)destinationMACAddress
{
  return self->_destinationMACAddress;
}

- (void).cxx_destruct
{
}

@end