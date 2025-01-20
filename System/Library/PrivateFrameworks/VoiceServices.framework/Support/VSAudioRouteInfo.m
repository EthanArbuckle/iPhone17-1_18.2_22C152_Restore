@interface VSAudioRouteInfo
- (BOOL)isAppleProduct;
- (BOOL)isBluetoothRoute;
- (NSDictionary)routeInfo;
- (VSAudioRouteInfo)initWithRouteAttributes:(id)a3;
- (id)audioRouteName;
@end

@implementation VSAudioRouteInfo

- (void).cxx_destruct
{
}

- (NSDictionary)routeInfo
{
  return self->_routeInfo;
}

- (BOOL)isAppleProduct
{
  v3 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"hdft", @"Hdft", @"usbD", @"hx90", @"wx90", @"rhac", @"wdef", 0);
  v4 = [(NSDictionary *)self->_routeInfo objectForKeyedSubscript:*MEMORY[0x263F54450]];
  if (v4) {
    int v5 = [v3 containsObject:v4] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)isBluetoothRoute
{
  v2 = [(NSDictionary *)self->_routeInfo objectForKeyedSubscript:*MEMORY[0x263F54438]];
  v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)audioRouteName
{
  return [(NSDictionary *)self->_routeInfo objectForKeyedSubscript:*MEMORY[0x263F54420]];
}

- (VSAudioRouteInfo)initWithRouteAttributes:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VSAudioRouteInfo;
  v6 = [(VSAudioRouteInfo *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_routeInfo, a3);
  }

  return v7;
}

@end