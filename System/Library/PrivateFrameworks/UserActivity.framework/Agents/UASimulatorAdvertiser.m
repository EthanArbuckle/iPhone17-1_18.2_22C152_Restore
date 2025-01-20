@interface UASimulatorAdvertiser
- (BOOL)active;
- (BOOL)advertising;
- (BOOL)updateItem:(id)a3;
- (UASimulator)simulator;
- (UASimulatorAdvertiser)initWithSimulator:(id)a3;
- (id)advertisableItems;
- (id)pairedDevices;
- (id)statusString;
- (void)setAdvertisableItems:(id)a3;
@end

@implementation UASimulatorAdvertiser

- (UASimulatorAdvertiser)initWithSimulator:(id)a3
{
  id v5 = a3;
  v6 = [v5 controller];
  v7 = [v6 manager];
  v12.receiver = self;
  v12.super_class = (Class)UASimulatorAdvertiser;
  v8 = [(UAAdvertiser *)&v12 initWithManager:v7 name:@"SimAdvertiser"];

  if (v8)
  {
    objc_storeStrong((id *)(v8 + 57), a3);
    uint64_t v9 = +[NSMutableArray array];
    v10 = *(void **)(v8 + 49);
    *(void *)(v8 + 49) = v9;
  }
  return (UASimulatorAdvertiser *)v8;
}

- (id)advertisableItems
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [*(id *)(&v2->super._shouldAdvertiseAutoPullActivityList + 1) copy];
  objc_sync_exit(v2);

  return v3;
}

- (void)setAdvertisableItems:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = [v4 description];
    v7 = sub_100063FF0(v6);
    *(_DWORD *)buf = 138477827;
    v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Setting advertisable items to %{private}@", buf, 0xCu);
  }
  v8 = self;
  objc_sync_enter(v8);
  [*(id *)(&v8->super._shouldAdvertiseAutoPullActivityList + 1) removeAllObjects];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 && [v13 eligibleForHandoff])
        {
          v14 = [UASimulatorSuggestedItem alloc];
          v15 = [(UASimulatorAdvertiser *)v8 simulator];
          v16 = [v15 peeredDevice];
          v17 = [(UASimulatorAdvertiser *)v8 simulator];
          v18 = [(UASimulatorSuggestedItem *)v14 initWithUserActivityInfo:v13 peerDevice:v16 simulator:v17];

          [(UASimulatorSuggestedItem *)v18 setActive:1];
          [*(id *)(&v8->super._shouldAdvertiseAutoPullActivityList + 1) addObject:v18];

          goto LABEL_14;
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  v19 = [(UASimulatorAdvertiser *)v8 advertisableItems];
  v20 = [v19 firstObject];
  [(UASimulatorAdvertiser *)v8 updateItem:v20];

  objc_sync_exit(v8);
}

- (BOOL)active
{
  v3.receiver = self;
  v3.super_class = (Class)UASimulatorAdvertiser;
  return [(UACornerActionManagerHandler *)&v3 active];
}

- (BOOL)advertising
{
  v2 = [(UASimulatorAdvertiser *)self advertisableItems];
  objc_super v3 = [v2 firstObject];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)updateItem:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [v4 uuid];
    v7 = [v6 UUIDString];
    int v10 = 138543619;
    uint64_t v11 = v7;
    __int16 v12 = 2113;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "SIMULATOR: Telling paired client that the advertised item %{public}@/%{private}@ changed.", (uint8_t *)&v10, 0x16u);
  }
  v8 = [(UASimulatorAdvertiser *)self simulator];
  sub_10007C9D0((mach_port_t)[v8 pairedClientPort]);

  return 1;
}

- (id)pairedDevices
{
  objc_super v3 = [(UASimulatorAdvertiser *)self simulator];
  id v4 = [v3 peeredDevice];
  if (v4)
  {
    id v5 = [(UASimulatorAdvertiser *)self simulator];
    v6 = [v5 peeredDevice];
    v7 = +[NSSet setWithObject:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)statusString
{
  objc_super v3 = [(UASimulatorAdvertiser *)self advertisableItems];
  id v4 = [v3 count];

  if (!v4) {
    goto LABEL_4;
  }
  id v5 = +[NSMutableString string];
  [v5 appendFormat:@"### UASimulatorAdvertiser:"];
  v6 = [(UASimulatorAdvertiser *)self advertisableItems];
  v7 = [v6 firstObject];
  [v5 appendFormat:@"%@", v7];

  [v5 appendString:@"\n"];
  if (v5)
  {
    id v8 = [v5 copy];
  }
  else
  {
LABEL_4:
    id v8 = 0;
  }

  return v8;
}

- (UASimulator)simulator
{
  return (UASimulator *)objc_getProperty(self, a2, 57, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_advertisableItems + 1), 0);

  objc_storeStrong((id *)(&self->super._shouldAdvertiseAutoPullActivityList + 1), 0);
}

@end