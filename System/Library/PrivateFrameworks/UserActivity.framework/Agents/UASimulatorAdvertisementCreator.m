@interface UASimulatorAdvertisementCreator
- (BOOL)active;
- (UASimulator)simulator;
- (UASimulatorAdvertisementCreator)initWithManager:(id)a3 simulator:(id)a4;
- (id)eligibleAdvertiseableItemsInOrder;
- (id)items;
- (id)statusString;
- (int64_t)priority;
@end

@implementation UASimulatorAdvertisementCreator

- (UASimulatorAdvertisementCreator)initWithManager:(id)a3 simulator:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UASimulatorAdvertisementCreator;
  v8 = [(UAClientController *)&v11 initWithManager:a3 name:@"SimCreator"];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_simulator, a4);
  }

  return v9;
}

- (id)items
{
  v3 = [(UASimulatorAdvertisementCreator *)self simulator];
  if ([v3 activitiesShouldCrossover])
  {
    v4 = [(UASimulatorAdvertisementCreator *)self simulator];
    v5 = [v4 receiver];
    v6 = [v5 receivedItems];
    if (v6)
    {
      id v7 = [(UASimulatorAdvertisementCreator *)self simulator];
      v8 = [v7 receiver];
      v9 = [v8 receivedItems];
      v10 = +[NSSet setWithArray:v9];
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)eligibleAdvertiseableItemsInOrder
{
  v3 = [(UASimulatorAdvertisementCreator *)self simulator];
  unsigned int v4 = [v3 activitiesShouldCrossover];

  if (v4)
  {
    v5 = [(UASimulatorAdvertisementCreator *)self simulator];
    v6 = [v5 receiver];
    id v7 = [v6 receivedItems];

    v8 = +[NSMutableArray array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v7;
    id v9 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          v14 = [UASimulatorSuggestedItem alloc];
          v15 = [(UASimulatorAdvertisementCreator *)self simulator];
          v16 = [v15 peeredDevice];
          v17 = [(UASimulatorAdvertisementCreator *)self simulator];
          v18 = [(UASimulatorSuggestedItem *)v14 initWithUserActivityInfo:v13 peerDevice:v16 simulator:v17];

          [(UASimulatorSuggestedItem *)v18 setActive:1];
          [v8 addObject:v18];
        }
        id v10 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v10);
    }

    id v19 = [v8 copy];
    v20 = sub_10000BA18(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = [v19 description];
      v22 = sub_100063FF0(v21);
      *(_DWORD *)buf = 138477827;
      v30 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "SIMULATOR: Returning received activities %{private}@ as eligibleItems", buf, 0xCu);
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (int64_t)priority
{
  v9.receiver = self;
  v9.super_class = (Class)UASimulatorAdvertisementCreator;
  id v3 = [(UACornerActionManagerHandler *)&v9 priority];
  unsigned int v4 = [(UASimulatorAdvertisementCreator *)self simulator];
  unsigned int v5 = [v4 activitiesShouldCrossover];
  uint64_t v6 = 100;
  if (!v5) {
    uint64_t v6 = 0;
  }
  int64_t v7 = (int64_t)v3 + v6;

  return v7;
}

- (BOOL)active
{
  v2 = [(UASimulatorAdvertisementCreator *)self simulator];
  unsigned __int8 v3 = [v2 activitiesShouldCrossover];

  return v3;
}

- (id)statusString
{
  if ([(UASimulatorAdvertisementCreator *)self active]) {
    CFStringRef v3 = &stru_1000C6800;
  }
  else {
    CFStringRef v3 = @"(inactive) ";
  }
  unsigned int v4 = [(UASimulatorAdvertisementCreator *)self simulator];
  unsigned int v5 = [v4 peeredDevice];
  uint64_t v6 = [v5 name];
  int64_t v7 = [(UASimulatorAdvertisementCreator *)self simulator];
  v8 = [v7 receiver];
  objc_super v9 = [v8 receivedItems];
  id v10 = [v9 firstObject];
  if (v10)
  {
    v22 = [(UASimulatorAdvertisementCreator *)self simulator];
    [v22 receiver];
    v23 = v9;
    v12 = CFStringRef v11 = v3;
    [v12 receivedItems];
    uint64_t v13 = v25 = v4;
    [v13 firstObject];
    v24 = v7;
    v15 = v14 = v5;
    [v15 statusString];
    v16 = v8;
    v18 = v17 = v6;
    CFStringRef v21 = v11;
    objc_super v9 = v23;
    id v19 = +[NSString stringWithFormat:@"(sim-rebroadcasted-item):%@ %@ %@", v21, v17, v18];

    uint64_t v6 = v17;
    v8 = v16;

    unsigned int v5 = v14;
    int64_t v7 = v24;

    unsigned int v4 = v25;
  }
  else
  {
    id v19 = +[NSString stringWithFormat:@"(sim-rebroadcasted-item):%@ %@ %@", v3, v6, @"-"];
  }

  return v19;
}

- (UASimulator)simulator
{
  return (UASimulator *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
}

@end