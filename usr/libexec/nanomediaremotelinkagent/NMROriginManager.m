@interface NMROriginManager
+ (NMROriginManager)sharedManager;
- (NMROrigin)activeOrigin;
- (NMROrigin)companionOrigin;
- (NMROrigin)localOrigin;
- (NMROriginManager)init;
- (NSArray)availableOrigins;
- (id)originForPlayerPath:(id)a3;
- (id)originWithDeviceIdentifier:(id)a3;
- (id)originWithUniqueIdentifier:(id)a3;
- (void)_handleDeviceInfoDidChangeNotification:(id)a3;
- (void)_onQueue_updateActiveOriginIdentifier:(id)a3;
- (void)_onQueue_updateAvailableOrigins;
- (void)_updateMediaRemoteAvailableAndActiveOrigins;
- (void)_updateMediaRemoteLocalOrigin;
- (void)dealloc;
- (void)routingControllerAvailableRoutesDidChange:(id)a3;
@end

@implementation NMROriginManager

+ (NMROriginManager)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C2F0;
  block[3] = &unk_100045240;
  block[4] = a1;
  if (qword_100050638 != -1) {
    dispatch_once(&qword_100050638, block);
  }
  v2 = (void *)qword_100050630;

  return (NMROriginManager *)v2;
}

- (NMROriginManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)NMROriginManager;
  v2 = [(NMROriginManager *)&v13 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.NanoMediaRemote.OriginManager", v3);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"_handleMediaRemoteActiveOriginDidChangeNotification:" name:kMRMediaRemoteActiveOriginDidChangeNotification object:0];
    [v6 addObserver:v2 selector:"_handleMediaRemoteAvailableOriginsDidChangeNotification:" name:kMRMediaRemoteAvailableOriginsDidChangeNotification object:0];
    [v6 addObserver:v2 selector:"_handleDeviceInfoDidChangeNotification:" name:kMRDeviceInfoDidChangeNotification object:0];
    [(NMROriginManager *)v2 _updateMediaRemoteLocalOrigin];
    [(NMROriginManager *)v2 _updateMediaRemoteAvailableAndActiveOrigins];
    MRMediaRemoteSetWantsOriginChangeNotifications();
    id v7 = objc_alloc_init((Class)MPAVCompanionEndpointRoutingDataSource);
    v8 = (MPAVRoutingController *)[objc_alloc((Class)MPAVRoutingController) initWithDataSource:v7 name:@"CompanionDiscovery"];
    companionRoutingController = v2->_companionRoutingController;
    v2->_companionRoutingController = v8;

    [(MPAVRoutingController *)v2->_companionRoutingController setDelegate:v2];
    v10 = sub_10002C428(2);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [(MPAVRoutingController *)v2->_companionRoutingController name];
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%@] Begin discovery", buf, 0xCu);
    }
    [(MPAVRoutingController *)v2->_companionRoutingController setDiscoveryMode:3];
  }
  return v2;
}

- (void)dealloc
{
  MRMediaRemoteSetWantsOriginChangeNotifications();
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveEveryObserver(LocalCenter, self);
  availableOriginRefs = self->_availableOriginRefs;
  if (availableOriginRefs) {
    CFRelease(availableOriginRefs);
  }
  v5.receiver = self;
  v5.super_class = (Class)NMROriginManager;
  [(NMROriginManager *)&v5 dealloc];
}

- (NSArray)availableOrigins
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_10001A900;
  v10 = sub_10001A910;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001C68C;
  v5[3] = &unk_100044E00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NMROrigin)activeOrigin
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_10001A900;
  v10 = sub_10001A910;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001C7CC;
  v5[3] = &unk_100044E00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NMROrigin *)v3;
}

- (NMROrigin)localOrigin
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_10001A900;
  v10 = sub_10001A910;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001C90C;
  v5[3] = &unk_100044E00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NMROrigin *)v3;
}

- (NMROrigin)companionOrigin
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_10001A900;
  v10 = sub_10001A910;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001CA50;
  v5[3] = &unk_100044E00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NMROrigin *)v3;
}

- (id)originWithDeviceIdentifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_10001A900;
  v17 = sub_10001A910;
  id v18 = 0;
  if (v4)
  {
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001CBFC;
    block[3] = &unk_100044EC8;
    v12 = &v13;
    block[4] = self;
    id v11 = v4;
    dispatch_sync(serialQueue, block);

    id v7 = (void *)v14[5];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)originWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_10001A900;
  v17 = sub_10001A910;
  id v18 = 0;
  if (v4)
  {
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001CD74;
    block[3] = &unk_100044EC8;
    v12 = &v13;
    block[4] = self;
    id v11 = v4;
    dispatch_sync(serialQueue, block);

    id v7 = (void *)v14[5];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)originForPlayerPath:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 route];

  if (!v5)
  {
    uint64_t v8 = [(NMROriginManager *)self localOrigin];
    goto LABEL_5;
  }
  uint64_t v6 = [v4 route];
  unsigned int v7 = [v6 isPhoneRoute];

  if (v7)
  {
    uint64_t v8 = [(NMROriginManager *)self companionOrigin];
LABEL_5:
    v9 = (void *)v8;
    goto LABEL_7;
  }
  v10 = [v4 route];
  id v11 = [v10 routeUID];
  v9 = [(NMROriginManager *)self originWithDeviceIdentifier:v11];

LABEL_7:

  return v9;
}

- (void)_onQueue_updateAvailableOrigins
{
  v2 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v3 = +[NSMutableOrderedSet orderedSet];
  v41 = +[NSMutableDictionary dictionary];
  v40 = +[NSMutableDictionary dictionary];
  if (v2->_availableOriginRefs)
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 1, &kCFTypeArrayCallBacks);
    objc_super v5 = (__CFArray *)CFAutorelease(Mutable);
    CFArrayRef availableOriginRefs = v2->_availableOriginRefs;
    if (availableOriginRefs && CFArrayGetCount(availableOriginRefs) >= 1)
    {
      CFArrayRef v7 = v2->_availableOriginRefs;
      v45.length = CFArrayGetCount(v7);
      v45.location = 0;
      CFArrayAppendArray(v5, v7, v45);
    }
    CFIndex Count = CFArrayGetCount(v5);
    if (Count)
    {
      CFIndex v9 = Count;
      CFIndex v10 = 0;
      v39 = v2;
      do
      {
        ValueAtIndex = (NSOrderedSet *)CFArrayGetValueAtIndex(v5, v10);
        v12 = (const void *)MRMediaRemoteCopyDeviceInfo();
        if (v12)
        {
          CFTypeRef v13 = CFAutorelease(v12);
          if (!MRPairedDeviceGetIsAirPlayActive())
          {
            v17 = (void *)MRPairedDeviceCopyLinkAgent();
            if (v17) {
              v17 = (void *)CFAutorelease(v17);
            }
            v14 = v17;
            if (([v14 isEqualToString:@"com.apple.RemoteMediaServices"] & 1) != 0|| [v14 isEqualToString:@"com.apple.TVRemote"])
            {
              id v18 = sub_10002C428(2);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v44 = ValueAtIndex;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[Origin] Ignoring TVRemote origin: %@.", buf, 0xCu);
              }
              goto LABEL_28;
            }
            id v18 = sub_10001AEEC();
            v19 = [(NSDictionary *)v2->_availableOriginsByDeviceIdentifier objectForKeyedSubscript:v18];
            v20 = v19;
            if (v19)
            {
              uint64_t v21 = [(NMROrigin *)v19 uniqueIdentifier];
              if (v21)
              {
                v37 = (void *)v21;
                v38 = v3;
                id v22 = [(NMROrigin *)v20 uniqueIdentifier];
                id v23 = +[NSNumber numberWithInt:MROriginGetUniqueIdentifier()];
                if (v22 == v23)
                {
                }
                else
                {
                  v24 = v23;
                  unsigned __int8 v36 = [v22 isEqual:v23];

                  id v3 = v38;
                  if ((v36 & 1) == 0) {
                    goto LABEL_24;
                  }
                }
              }
              [(NMROrigin *)v20 updateOrigin:ValueAtIndex deviceInfo:v13];
            }
            else
            {
LABEL_24:
              v25 = [[NMROrigin alloc] initWithOrigin:ValueAtIndex deviceInfo:v13];

              v20 = v25;
            }
            [v3 addObject:v20];
            [v41 setObject:v20 forKeyedSubscript:v18];
            v26 = [(NMROrigin *)v20 uniqueIdentifier];
            [v40 setObject:v20 forKeyedSubscript:v26];

            v2 = v39;
LABEL_28:

            goto LABEL_29;
          }
          v14 = sub_10002C428(2);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v44 = ValueAtIndex;
            uint64_t v15 = v14;
            v16 = "[Origin] Ignoring AirPlay active origin: %@.";
LABEL_13:
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
          }
        }
        else
        {
          v14 = sub_10002C428(2);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v44 = ValueAtIndex;
            uint64_t v15 = v14;
            v16 = "[Origin] Ignoring origin with no device info: %@.";
            goto LABEL_13;
          }
        }
LABEL_29:

        ++v10;
      }
      while (v9 != v10);
    }
  }
  [v3 sortUsingComparator:&stru_100045280];
  unsigned __int8 v27 = [v3 isEqual:v2->_availableOrigins];
  v28 = (NSOrderedSet *)[v3 copy];
  availableOrigins = v2->_availableOrigins;
  v2->_availableOrigins = v28;

  v30 = (NSDictionary *)[v41 copy];
  availableOriginsByDeviceIdentifier = v2->_availableOriginsByDeviceIdentifier;
  v2->_availableOriginsByDeviceIdentifier = v30;

  v32 = (NSDictionary *)[v40 copy];
  availableOriginsByOriginIdentifier = v2->_availableOriginsByOriginIdentifier;
  v2->_availableOriginsByOriginIdentifier = v32;

  if ((v27 & 1) == 0)
  {
    v34 = sub_10002C428(3);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = v2->_availableOrigins;
      *(_DWORD *)buf = 138412290;
      v44 = v35;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "[Origin] Updated available origins: %@", buf, 0xCu);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001D498;
    block[3] = &unk_100044D08;
    block[4] = v2;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_onQueue_updateActiveOriginIdentifier:(id)a3
{
  id v4 = (NSNumber *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (!v4
    || ([(NSDictionary *)self->_availableOriginsByOriginIdentifier objectForKeyedSubscript:v4], objc_super v5 = objc_claimAutoreleasedReturnValue(), v5, !v5))
  {
    uint64_t v6 = sub_10002C428(2);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000313F4();
    }

    CFArrayRef v7 = self->_localOriginIdentifier;
    id v4 = v7;
  }
  if (![(NSNumber *)self->_activeOriginIdentifier isEqualToNumber:v4])
  {
    objc_storeStrong((id *)&self->_activeOriginIdentifier, v4);
    uint64_t v8 = sub_10002C428(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      CFIndex v9 = [(NSDictionary *)self->_availableOriginsByOriginIdentifier objectForKeyedSubscript:self->_activeOriginIdentifier];
      *(_DWORD *)buf = 138412290;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Origin] Update active origin: %@", buf, 0xCu);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001D6B0;
    block[3] = &unk_100044D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_updateMediaRemoteLocalOrigin
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D784;
  block[3] = &unk_100044D08;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_updateMediaRemoteAvailableAndActiveOrigins
{
  id v3 = sub_10002C428(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Origin] Fetching MediaRemote available origins and active origin.", buf, 2u);
  }

  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  *(void *)buf = 0;
  v17 = buf;
  uint64_t v18 = 0x3032000000;
  v19 = sub_10001A900;
  v20 = sub_10001A910;
  id v21 = 0;
  id v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  CFIndex v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_10001DAB4;
  CFTypeRef v13 = &unk_1000452A8;
  uint64_t v15 = v22;
  dispatch_group_t v14 = v4;
  MRMediaRemoteGetAvailableOrigins();
  dispatch_group_enter(v14);
  block[7] = _NSConcreteStackBlock;
  block[8] = 3221225472;
  block[9] = sub_10001DB24;
  block[10] = &unk_1000452D0;
  CFIndex v9 = buf;
  objc_super v5 = v14;
  uint64_t v8 = v5;
  MRMediaRemoteGetActiveOrigin();
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001DBB4;
  block[3] = &unk_1000452F8;
  block[4] = self;
  void block[5] = v22;
  block[6] = buf;
  dispatch_group_notify(v5, serialQueue, block);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v22, 8);
}

- (void)_handleDeviceInfoDidChangeNotification:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001DCF4;
  v7[3] = &unk_100044CB8;
  id v8 = v4;
  CFIndex v9 = self;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

- (void)routingControllerAvailableRoutesDidChange:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001DE90;
  v7[3] = &unk_100044CB8;
  id v8 = v4;
  CFIndex v9 = self;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionRoutingController, 0);
  objc_storeStrong((id *)&self->_localOriginIdentifier, 0);
  objc_storeStrong((id *)&self->_activeOriginIdentifier, 0);
  objc_storeStrong((id *)&self->_availableOriginsByOriginIdentifier, 0);
  objc_storeStrong((id *)&self->_availableOriginsByDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_availableOrigins, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end