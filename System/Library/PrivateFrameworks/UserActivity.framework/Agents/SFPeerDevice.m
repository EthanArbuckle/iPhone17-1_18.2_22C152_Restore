@interface SFPeerDevice
+ (id)deviceTypeForModelIdentifier:(id)a3;
+ (id)peerForSelf;
+ (id)testPeerForModel:(id)a3;
- (NSString)deviceType;
- (id)copy;
@end

@implementation SFPeerDevice

+ (id)peerForSelf
{
  bzero(&v12, 0x500uLL);
  uname(&v12);
  id v2 = objc_alloc_init((Class)SFPeerDevice);
  v3 = sub_10001CCE8();
  v4 = +[NSUUID UUID];
  v5 = [v4 UUIDString];
  [v2 setUniqueID:v5];

  v6 = +[NSString stringWithCString:v12.machine encoding:4];
  [v2 setModelIdentifier:v6];

  v7 = [v3 objectForKeyedSubscript:@"ProductName"];
  [v2 setProductName:v7];

  v8 = [v3 objectForKeyedSubscript:@"ProductVersion"];
  [v2 setProductVersion:v8];

  v9 = [v3 objectForKeyedSubscript:@"ProductBuildVersion"];
  [v2 setProductBuildVersion:v9];

  v10 = +[NSString stringWithCString:v12.nodename encoding:4];
  [v2 setName:v10];

  [v2 setDeviceColor:&stru_1000C6800];
  [v2 setEnclosureColor:&stru_1000C6800];

  return v2;
}

+ (id)testPeerForModel:(id)a3
{
  bzero(&v13, 0x500uLL);
  id v4 = a3;
  uname(&v13);
  id v5 = objc_alloc_init((Class)SFPeerDevice);
  v6 = sub_10001CCE8();
  v7 = +[NSUUID UUID];
  v8 = [v7 UUIDString];
  [v5 setUniqueID:v8];

  [v5 setModelIdentifier:v4];
  v9 = [v6 objectForKeyedSubscript:@"ProductName"];
  [v5 setProductName:v9];

  v10 = [v6 objectForKeyedSubscript:@"ProductVersion"];
  [v5 setProductVersion:v10];

  v11 = [v6 objectForKeyedSubscript:@"ProductBuildVersion"];
  [v5 setProductBuildVersion:v11];

  [v5 setName:@"UA Test Peer"];
  [v5 setDeviceColor:&stru_1000C6800];
  [v5 setEnclosureColor:&stru_1000C6800];

  return v5;
}

- (id)copy
{
  id v3 = objc_alloc_init((Class)SFPeerDevice);
  id v4 = [(SFPeerDevice *)self uniqueID];
  id v5 = [v4 copy];
  [v3 setUniqueID:v5];

  v6 = [(SFPeerDevice *)self modelIdentifier];
  id v7 = [v6 copy];
  [v3 setModelIdentifier:v7];

  v8 = [(SFPeerDevice *)self productName];
  id v9 = [v8 copy];
  [v3 setProductName:v9];

  v10 = [(SFPeerDevice *)self productVersion];
  id v11 = [v10 copy];
  [v3 setProductVersion:v11];

  utsname v12 = [(SFPeerDevice *)self productBuildVersion];
  id v13 = [v12 copy];
  [v3 setProductBuildVersion:v13];

  v14 = [(SFPeerDevice *)self name];
  id v15 = [v14 copy];
  [v3 setName:v15];

  v16 = [(SFPeerDevice *)self deviceColor];
  id v17 = [v16 copy];
  [v3 setDeviceColor:v17];

  v18 = [(SFPeerDevice *)self enclosureColor];
  id v19 = [v18 copy];
  [v3 setEnclosureColor:v19];

  return v3;
}

- (NSString)deviceType
{
  id v2 = [(SFPeerDevice *)self modelIdentifier];
  id v3 = +[SFPeerDevice deviceTypeForModelIdentifier:v2];

  return (NSString *)v3;
}

+ (id)deviceTypeForModelIdentifier:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[UTType _typeWithDeviceModelCode:v3];
    if ([v4 conformsToType:_UTTypeAppleDevice]
      && ([v4 identifier], (id v5 = (__CFString *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v6 = v5;
      if ([(__CFString *)v5 isEqualToString:@"com.apple.ipod"])
      {

        v6 = @"com.apple.ipod-touch";
      }
    }
    else
    {
      v6 = @"public.device";
    }
  }
  else
  {
    v6 = @"public.device";
  }

  return v6;
}

@end