@interface _TSF_TSDgPTPEthernetPort
+ (id)diagnosticInfoForService:(id)a3;
- (_TSF_TSDgPTPEthernetPort)initWithService:(id)a3 pid:(int)a4;
- (id)_destinationAddressString;
- (id)_sourceAddressString;
- (id)propertiesForXPC;
- (int)portType;
@end

@implementation _TSF_TSDgPTPEthernetPort

- (_TSF_TSDgPTPEthernetPort)initWithService:(id)a3 pid:(int)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_TSF_TSDgPTPEthernetPort;
  return [(_TSF_TSDgPTPFDPtPPort *)&v5 initWithService:a3 pid:*(void *)&a4];
}

- (id)_sourceAddressString
{
  v9.receiver = self;
  v9.super_class = (Class)_TSF_TSDgPTPEthernetPort;
  v3 = [(_TSF_TSDgPTPNetworkPort *)&v9 _sourceAddressString];
  v4 = [(_TSF_TSDgPTPPort *)self service];
  objc_super v5 = [v4 iodPropertyForKey:@"SourceMACAddress"];

  if (v5)
  {
    v6 = (unsigned __int8 *)[v5 bytes];
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx", *v6, v6[1], v6[2], v6[3], v6[4], v6[5]);

    v3 = (void *)v7;
  }

  return v3;
}

- (id)_destinationAddressString
{
  return @"01:80:c2:00:00:0e";
}

- (int)portType
{
  return 1;
}

- (id)propertiesForXPC
{
  v7.receiver = self;
  v7.super_class = (Class)_TSF_TSDgPTPEthernetPort;
  v3 = [(_TSF_TSDgPTPNetworkPort *)&v7 propertiesForXPC];
  v4 = [(_TSF_TSDgPTPPort *)self service];
  objc_super v5 = [v4 iodPropertyForKey:@"SourceMACAddress"];
  [v3 setObject:v5 forKeyedSubscript:@"SourceMACAddress"];

  return v3;
}

+ (id)diagnosticInfoForService:(id)a3
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS____TSF_TSDgPTPEthernetPort;
  id v3 = a3;
  v4 = objc_msgSendSuper2(&v10, sel_diagnosticInfoForService_, v3);
  objc_super v5 = [NSNumber numberWithInt:1];
  [v4 setObject:v5 forKeyedSubscript:@"PortType"];

  v6 = [v3 iodPropertyForKey:@"SourceMACAddress"];

  if (v6)
  {
    objc_super v7 = (unsigned __int8 *)[v6 bytes];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx", *v7, v7[1], v7[2], v7[3], v7[4], v7[5], v10.receiver, v10.super_class);
    [v4 setObject:v8 forKeyedSubscript:@"SourceAddress"];
  }
  [v4 setObject:@"01:80:c2:00:00:0e" forKeyedSubscript:@"DestinationAddress"];

  return v4;
}

@end