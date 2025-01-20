@interface MRDAVRemoteControlClusterOutputDevice
- (BOOL)isLocalDevice;
- (MRDAVRemoteControlClusterOutputDevice)initWithDevices:(id)a3;
- (MRDAVRemoteControlClusterOutputDevice)initWithPrimaryOutputDevice:(id)a3 members:(id)a4;
- (NSArray)memberOutputDevices;
- (id)_calculateHierarchy:(id)a3;
- (id)_createStereoPairRepresentationFrom:(id)a3;
- (id)allClusterMembers;
- (id)clusterComposition;
- (id)descriptor;
- (unsigned)deviceSubtype;
- (unsigned)deviceType;
@end

@implementation MRDAVRemoteControlClusterOutputDevice

- (MRDAVRemoteControlClusterOutputDevice)initWithDevices:(id)a3
{
  id v4 = a3;
  v5 = [v4 firstObject];
  unsigned int v6 = [v5 clusterType];

  if (v6 == 2)
  {
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = sub_100091870;
    v39 = sub_100091880;
    id v40 = 0;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100091888;
    v32[3] = &unk_100419AA8;
    id v7 = [v4 mutableCopy];
    id v33 = v7;
    v34 = &v35;
    [v4 enumerateObjectsUsingBlock:v32];
    uint64_t v8 = v36[5];
    if (v8)
    {
      v9 = [v7 copy];
      self = [(MRDAVRemoteControlClusterOutputDevice *)self initWithPrimaryOutputDevice:v8 members:v9];
      v10 = self;
    }
    else
    {
      v9 = _MRLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10032CB78((uint64_t)v4, v9);
      }
      v10 = 0;
    }

    _Block_object_dispose(&v35, 8);
  }
  else
  {
    v11 = objc_msgSend(v4, "msv_firstWhere:", &stru_100419AC8);

    if (v11)
    {
      v29 = NSStringFromSelector("isAirPlayReceiverSessionActive");
      v12 = +[NSSortDescriptor sortDescriptorWithKey:v29 ascending:1];
      v42[0] = v12;
      v13 = NSStringFromSelector("isClusterLeader");
      v14 = +[NSSortDescriptor sortDescriptorWithKey:v13 ascending:0];
      v42[1] = v14;
      v15 = +[NSArray arrayWithObjects:v42 count:2];
    }
    else
    {
      v29 = NSStringFromSelector("isGroupLeader");
      v12 = +[NSSortDescriptor sortDescriptorWithKey:v29 ascending:0];
      v41[0] = v12;
      v13 = NSStringFromSelector("groupContextID");
      v14 = +[NSSortDescriptor sortDescriptorWithKey:v13 ascending:0];
      v41[1] = v14;
      v28 = NSStringFromSelector("isAirPlayReceiverSessionActive");
      v27 = +[NSSortDescriptor sortDescriptorWithKey:v28 ascending:1];
      v41[2] = v27;
      v16 = NSStringFromSelector("isProxyGroupPlayer");
      v17 = +[NSSortDescriptor sortDescriptorWithKey:v16 ascending:0];
      v41[3] = v17;
      v18 = NSStringFromSelector("uid");
      v19 = +[NSSortDescriptor sortDescriptorWithKey:v18 ascending:1];
      v41[4] = v19;
      v15 = +[NSArray arrayWithObjects:v41 count:5];
    }
    v20 = [v4 sortedArrayUsingDescriptors:v15];
    v21 = [v20 firstObject];
    if ((([v21 clusterType] - 1) & 0xFFFFFFFD) == 0)
    {
      v22 = objc_msgSend(v20, "mr_first:", &stru_100419AE8);
      if (v22 && (MRMediaRemoteGetParentGroupContainsDiscoverableGroupLeader() & 1) == 0)
      {
        id v23 = v22;

        v21 = v23;
      }
    }
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100091920;
    v30[3] = &unk_100417940;
    id v31 = v21;
    id v24 = v21;
    v25 = objc_msgSend(v20, "mr_filter:", v30);
    self = [(MRDAVRemoteControlClusterOutputDevice *)self initWithPrimaryOutputDevice:v24 members:v25];

    v10 = self;
  }

  return v10;
}

- (MRDAVRemoteControlClusterOutputDevice)initWithPrimaryOutputDevice:(id)a3 members:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 descriptor];
  v15.receiver = self;
  v15.super_class = (Class)MRDAVRemoteControlClusterOutputDevice;
  v9 = [(MRDAVRemoteControlClusterOutputDevice *)&v15 initWithDescriptor:v8];

  if (v9)
  {
    uint64_t v10 = [v7 arrayByAddingObject:v6];
    memberOutputDevices = v9->_memberOutputDevices;
    v9->_memberOutputDevices = (NSArray *)v10;

    uint64_t v12 = [(MRDAVRemoteControlClusterOutputDevice *)v9 _calculateHierarchy:v9->_memberOutputDevices];
    allClusterMembers = v9->_allClusterMembers;
    v9->_allClusterMembers = (NSArray *)v12;
  }
  return v9;
}

- (unsigned)deviceType
{
  return 1;
}

- (unsigned)deviceSubtype
{
  return 15;
}

- (id)clusterComposition
{
  return [(NSArray *)self->_memberOutputDevices mr_map:&stru_100419B08];
}

- (id)allClusterMembers
{
  return [(NSArray *)self->_allClusterMembers mr_map:&stru_100419B28];
}

- (BOOL)isLocalDevice
{
  return [(NSArray *)self->_memberOutputDevices mr_any:&stru_100419B48];
}

- (id)descriptor
{
  return [(MRDAVRemoteControlClusterOutputDevice *)self generateDescriptor];
}

- (id)_calculateHierarchy:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 count] > 1)
  {
    id v6 = [v4 mutableCopy];
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v18 = v4;
    id v8 = v4;
    id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v14 = [v13 tightSyncID];
          if (v14)
          {
            id v15 = [v7 objectForKeyedSubscript:v14];
            if (!v15)
            {
              id v15 = objc_alloc_init((Class)NSMutableArray);
              [v7 setObject:v15 forKeyedSubscript:v14];
            }
            [v15 addObject:v13];
            [v6 removeObject:v13];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v10);
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100091DF4;
    v19[3] = &unk_100419B70;
    id v16 = v6;
    id v20 = v16;
    v21 = self;
    [v7 enumerateKeysAndObjectsUsingBlock:v19];
    id v5 = v16;

    id v4 = v18;
  }
  else
  {
    id v5 = v4;
  }

  return v5;
}

- (id)_createStereoPairRepresentationFrom:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, "mr_first:", &stru_100419B90);
  if (!v4)
  {
    id v4 = [v3 firstObject];
  }
  id v5 = objc_alloc_init((Class)_MRAVOutputDeviceDescriptorProtobuf);
  id v6 = [v4 tightSyncID];
  [v5 setUniqueIdentifier:v6];

  id v7 = [v4 name];
  [v5 setName:v7];

  [v5 setClusterType:1];
  [v5 setDeviceType:1];
  [v5 setDeviceSubType:15];
  id v8 = objc_alloc((Class)NSString);
  id v9 = [v4 modelID];
  id v10 = [v8 initWithFormat:@"%@-%@", v9, @"TightSyncCluster"];
  [v5 setModelID:v10];

  uint64_t v11 = objc_msgSend(v3, "mr_map:", &stru_100419BB0);
  id v12 = [v11 mutableCopy];
  [v5 setAllClusterMembers:v12];

  id v13 = [objc_alloc((Class)MRAVDistantOutputDevice) initWithDescriptor:v5];

  return v13;
}

- (NSArray)memberOutputDevices
{
  return self->_memberOutputDevices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberOutputDevices, 0);

  objc_storeStrong((id *)&self->_allClusterMembers, 0);
}

@end