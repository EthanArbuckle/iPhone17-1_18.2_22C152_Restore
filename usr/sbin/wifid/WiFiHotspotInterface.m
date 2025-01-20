@interface WiFiHotspotInterface
- (BOOL)isScanning;
- (NSSet)networks;
- (OS_dispatch_queue)internalQueue;
- (SFRemoteHotspotSession)hotspotSession;
- (WiFiHotspotInterface)init;
- (id)copySortedHotspotDevicesByAutoPreferences;
- (id)getHotspotDeviceIdentifier:(id)a3;
- (id)getHotspotDeviceName:(id)a3;
- (id)hotspotUpdateNetworkcallback;
- (id)newHotspot:(id)a3 error:(id *)a4;
- (unsigned)isEqualHotspotDevices:(id)a3 compareTo:(id)a4;
- (unsigned)isEqualHotspotDevicesName:(id)a3 compareTo:(id)a4;
- (unsigned)isFamilyHotspot:(id)a3;
- (unsigned)isHotspotDeviceSupportADHS:(id)a3;
- (void)_stopBrowsingRemoveCache:(BOOL)a3;
- (void)callbackContext;
- (void)pauseBrowsing;
- (void)registerHotspotInterfaceUpdateNetworkCallback:(id)a3 withCallbackContext:(void *)a4;
- (void)session:(id)a3 updatedFoundDevices:(id)a4;
- (void)setCallbackContext:(void *)a3;
- (void)setHotspotSession:(id)a3;
- (void)setHotspotUpdateNetworkcallback:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setNetworks:(id)a3;
- (void)setScanning:(BOOL)a3;
- (void)startBrowsing;
- (void)stopBrowsing;
- (void)updateNetworksWithHotspots:(id)a3;
@end

@implementation WiFiHotspotInterface

- (WiFiHotspotInterface)init
{
  v11.receiver = self;
  v11.super_class = (Class)WiFiHotspotInterface;
  v2 = [(WiFiHotspotInterface *)&v11 init];
  if (!v2)
  {
LABEL_10:
    v4 = 0;
LABEL_5:

    v2 = 0;
    goto LABEL_6;
  }
  id v3 = objc_alloc_init((Class)SFRemoteHotspotSession);
  if (!v3)
  {
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3 message:"failed to create SFRemoteHotspotSession"];
    }
    goto LABEL_10;
  }
  v4 = v3;
  [v3 setDelegate:v2];
  objc_storeStrong((id *)&v2->_hotspotSession, v4);
  uint64_t v5 = +[NSSet set];
  networks = v2->_networks;
  v2->_networks = (NSSet *)v5;

  if (!v2->_networks) {
    goto LABEL_5;
  }
  dispatch_queue_t v7 = dispatch_queue_create(0, 0);
  internalQueue = v2->_internalQueue;
  v2->_internalQueue = (OS_dispatch_queue *)v7;

  if (!v2->_internalQueue) {
    goto LABEL_5;
  }
LABEL_6:

  return v2;
}

- (void)updateNetworksWithHotspots:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSMutableSet set];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v12 = [v11 signalStrength];
        id v13 = [v12 integerValue];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  v14 = [(WiFiHotspotInterface *)self networks];
  unsigned __int8 v15 = [v5 isEqualToSet:v14];

  if (v15)
  {
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3 message:"Instant HS scan finished-> No new networks found."];
    }
  }
  else
  {
    [(WiFiHotspotInterface *)self setNetworks:v5];
    v17 = (void *)qword_10027DD68;
    if (qword_10027DD68)
    {
      v18 = [(WiFiHotspotInterface *)self networks];
      [v17 WFLog:3, "networks found %@\n", v18 message];
    }
  }
  v19 = [(WiFiHotspotInterface *)self hotspotUpdateNetworkcallback];

  if (v19)
  {
    v20 = [(WiFiHotspotInterface *)self hotspotUpdateNetworkcallback];
    ((void (**)(void, uint64_t, void *))v20)[2](v20, 1, [(WiFiHotspotInterface *)self callbackContext]);
  }
}

- (id)copySortedHotspotDevicesByAutoPreferences
{
  id v3 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"self" ascending:0 comparator:&stru_1002431B0];
  id v4 = [(WiFiHotspotInterface *)self networks];
  id v9 = v3;
  uint64_t v5 = +[NSArray arrayWithObjects:&v9 count:1];
  id v6 = [v4 sortedArrayUsingDescriptors:v5];

  id v7 = [v6 copy];
  return v7;
}

- (id)newHotspot:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x3032000000;
    v39 = sub_100022D78;
    v40 = sub_100022C58;
    id v41 = 0;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = sub_100022D78;
    v34 = sub_100022C58;
    id v35 = 0;
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    id v9 = [(WiFiHotspotInterface *)self hotspotSession];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1001731BC;
    v26[3] = &unk_1002431D8;
    v28 = &v30;
    v29 = &v36;
    v10 = v8;
    v27 = v10;
    [v9 enableRemoteHotspotForDevice:v6 withCompletionHandler:v26];

    dispatch_time_t v11 = dispatch_time(0, 60000000000);
    if (dispatch_semaphore_wait(v10, v11))
    {
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:3 message:@"%s: Enable Remote Hotspot Timeout" arguments:("-[WiFiHotspotInterface newHotspot:error:]", 0)];
      }
      id v13 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
      CFStringRef v43 = @"Enable Remote Hotspot Timeout";
      v14 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      id v15 = [v13 initWithDomain:NSPOSIXErrorDomain code:-6722 userInfo:v14];
      v16 = (void *)v31[5];
      v31[5] = (uint64_t)v15;
    }
    if (a4 && (v17 = (void *)v31[5]) != 0)
    {
      *a4 = [v17 copy];
    }
    else
    {
      v20 = (void *)v37[5];
      if (v20)
      {
        long long v21 = [v20 name];
        [v7 setObject:v21 forKeyedSubscript:@"ssid"];

        long long v22 = [(id)v37[5] password];
        [v7 setObject:v22 forKeyedSubscript:@"password"];

        long long v23 = [(id)v37[5] channel];
        [v7 setObject:v23 forKeyedSubscript:@"channel"];
      }
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3 message:"Started Hotspot"];
      }
    }
    id v19 = [v7 copy];

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v36, 8);
  }
  else
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "Cannot enable hotspot, missing SFRemoteHotspotDevice")];
    }
    id v19 = 0;
  }

  return v19;
}

- (BOOL)isScanning
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = -86;
  internalQueue = self->_internalQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100173308;
  v5[3] = &unk_100242A28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)startBrowsing
{
  if (![(WiFiHotspotInterface *)self isScanning])
  {
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3 message:"Starting hotspot browsing"];
    }
    internalQueue = self->_internalQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001733D0;
    block[3] = &unk_10023E9B8;
    block[4] = self;
    dispatch_sync(internalQueue, block);
  }
}

- (void)stopBrowsing
{
}

- (void)pauseBrowsing
{
}

- (void)_stopBrowsingRemoveCache:(BOOL)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001734A8;
  v4[3] = &unk_100243200;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(internalQueue, v4);
}

- (id)getHotspotDeviceName:(id)a3
{
  id v3 = a3;
  id v4 = [v3 deviceName];
  id v5 = [v4 length];

  uint64_t v6 = [v3 deviceName];

  if ((unint64_t)v5 >= 0x21)
  {
    uint64_t v7 = [v6 substringToIndex:30];

    uint64_t v6 = (void *)v7;
  }

  return v6;
}

- (id)getHotspotDeviceIdentifier:(id)a3
{
  return [a3 deviceIdentifier];
}

- (unsigned)isEqualHotspotDevices:(id)a3 compareTo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 deviceName];
  uint64_t v8 = [v6 deviceName];
  if ([v7 isEqualToString:v8])
  {
    char v9 = [v5 deviceIdentifier];
    v10 = [v6 deviceIdentifier];
    unsigned __int8 v11 = [v9 isEqualToString:v10];
  }
  else
  {

    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (unsigned)isEqualHotspotDevicesName:(id)a3 compareTo:(id)a4
{
  id v5 = a4;
  id v6 = [a3 deviceName];
  unsigned __int8 v7 = [v6 isEqualToString:v5];

  return v7;
}

- (unsigned)isFamilyHotspot:(id)a3
{
  return [a3 group] == (id)2;
}

- (unsigned)isHotspotDeviceSupportADHS:(id)a3
{
  id v3 = a3;
  +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", @"iPad3,4", @"iPad3,5", @"iPad3,6", @"iPad4,1", @"iPad4,2", @"iPad4,3", @"iPad4,4", @"iPad4,5", @"iPad4,6", @"iPad4,7", @"iPad4,8", @"iPad4,9", @"iPad5,1", @"iPad5,2", @"iPad5,3", @"iPad5,4", @"iPad6,11",
    @"iPad6,11",
    @"iPad6,12",
    @"iPad6,12",
    @"iPad6,3",
    @"iPad6,4",
    @"iPad6,7",
    @"iPad6,8",
    @"iPad7,1",
    @"iPad7,10",
    @"iPad7,11",
    @"iPad7,12",
    @"iPad7,2",
    @"iPad7,3",
    @"iPad7,4",
    @"iPad7,5",
    @"iPad7,6",
    @"iPad7,7",
    @"iPad7,8",
    @"iPad7,9",
    @"iPad11,6",
    @"iPad11,7",
    @"iPad12,1",
    @"iPad12,2",
    @"iPhone5,1",
    @"iPhone5,2",
    @"iPhone5,3",
    @"iPhone5,4",
    @"iPhone6,1",
    @"iPhone6,2",
    @"iPhone7,1",
    @"iPhone7,2",
    @"iPhone8,1",
    @"iPhone8,1",
    @"iPhone8,2",
    @"iPhone8,2",
    @"iPhone8,4",
    @"iPhone8,4",
    @"iPhone9,1",
    @"iPhone9,2",
    @"iPhone9,3",
    @"iPhone9,4",
  id v4 = 0);
  id v5 = [v3 model];
  if ([v4 containsObject:v5])
  {

LABEL_5:
    unsigned __int8 v7 = 0;
    goto LABEL_6;
  }
  unsigned __int8 v6 = [v3 osSupportsAutoHotspot];

  if ((v6 & 1) == 0) {
    goto LABEL_5;
  }
  unsigned __int8 v7 = 1;
LABEL_6:

  return v7;
}

- (void)registerHotspotInterfaceUpdateNetworkCallback:(id)a3 withCallbackContext:(void *)a4
{
  id v9 = a3;
  unsigned __int8 v7 = (void *)qword_10027DD68;
  if (qword_10027DD68)
  {
    id v8 = objc_retainBlock(v9);
    [v7 WFLog:3, "%s: callback %@, context %@", "-[WiFiHotspotInterface registerHotspotInterfaceUpdateNetworkCallback:withCallbackContext:]", v8, a4 message];
  }
  [(WiFiHotspotInterface *)self setHotspotUpdateNetworkcallback:v9];
  [(WiFiHotspotInterface *)self setCallbackContext:a4];
}

- (void)session:(id)a3 updatedFoundDevices:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3, "Found hotspots %@", v6 message];
  }
  id v8 = +[NSMutableSet set];
  [v8 addObjectsFromArray:v6];
  [(WiFiHotspotInterface *)self updateNetworksWithHotspots:v8];
}

- (NSSet)networks
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNetworks:(id)a3
{
}

- (void)setScanning:(BOOL)a3
{
  self->_scanning = a3;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (SFRemoteHotspotSession)hotspotSession
{
  return (SFRemoteHotspotSession *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHotspotSession:(id)a3
{
}

- (void)callbackContext
{
  return self->_callbackContext;
}

- (void)setCallbackContext:(void *)a3
{
  self->_callbackContext = a3;
}

- (id)hotspotUpdateNetworkcallback
{
  return self->_hotspotUpdateNetworkcallback;
}

- (void)setHotspotUpdateNetworkcallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hotspotUpdateNetworkcallback, 0);
  objc_storeStrong((id *)&self->_hotspotSession, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);

  objc_storeStrong((id *)&self->_networks, 0);
}

@end