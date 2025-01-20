@interface NRLinkAWDL
- (id)initLinkWithQueue:(id)a3 linkDelegate:(id)a4 nrUUID:(id)a5 wifiInterfaceName:(id)a6 localOuterEndpoint:(id)a7 remoteOuterEndpoint:(id)a8 listenerPortString:(id)a9;
- (unsigned)metric;
@end

@implementation NRLinkAWDL

- (unsigned)metric
{
  v3.receiver = self;
  v3.super_class = (Class)NRLinkAWDL;
  return [(NRLinkWiFi *)&v3 metric] + 20;
}

- (id)initLinkWithQueue:(id)a3 linkDelegate:(id)a4 nrUUID:(id)a5 wifiInterfaceName:(id)a6 localOuterEndpoint:(id)a7 remoteOuterEndpoint:(id)a8 listenerPortString:(id)a9
{
  v11.receiver = self;
  v11.super_class = (Class)NRLinkAWDL;
  id v9 = [(NRLinkWiFi *)&v11 initLinkWithQueue:a3 linkDelegate:a4 nrUUID:a5 wifiInterfaceName:a6 localOuterEndpoint:a7 remoteOuterEndpoint:a8 listenerPortString:a9];
  [v9 setSubtype:102];
  return v9;
}

@end