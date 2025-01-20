@interface MSDRapportDeviceExplorer
- (MSDRapportDeviceExplorer)initWithObserver:(id)a3;
- (MSDRapportDeviceExplorerProtocol)observer;
- (NSMutableArray)devices;
- (OS_dispatch_queue)queue;
- (RPCompanionLinkClient)rpClient;
- (id)_findMatchingMSDRapportDeviceForRPCompanionLinkDevice:(id)a3;
- (void)_activate;
- (void)_deactivate;
- (void)_handleRPCompanionLinkDeviceChanged:(id)a3 withChanges:(unsigned int)a4;
- (void)_handleRPCompanionLinkDeviceFound:(id)a3;
- (void)_handleRPCompanionLinkDeviceLost:(id)a3;
- (void)activate;
- (void)deactivate;
- (void)setDevices:(id)a3;
- (void)setObserver:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRpClient:(id)a3;
@end

@implementation MSDRapportDeviceExplorer

- (MSDRapportDeviceExplorer)initWithObserver:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSDRapportDeviceExplorer;
  v5 = [(MSDRapportDeviceExplorer *)&v9 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.MobileStoreDemo.RPDeviceExplorer", 0);
    [(MSDRapportDeviceExplorer *)v5 setQueue:v6];

    v7 = +[NSMutableArray arrayWithCapacity:0];
    [(MSDRapportDeviceExplorer *)v5 setDevices:v7];

    [(MSDRapportDeviceExplorer *)v5 setObserver:v4];
  }

  return v5;
}

- (void)activate
{
  objc_initWeak(&location, self);
  v3 = [(MSDRapportDeviceExplorer *)self queue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100049680;
  v4[3] = &unk_100151AC8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)deactivate
{
  objc_initWeak(&location, self);
  v3 = [(MSDRapportDeviceExplorer *)self queue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004978C;
  v4[3] = &unk_100151AC8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_activate
{
  v3 = [(MSDRapportDeviceExplorer *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MSDRapportDeviceExplorer: Activating explorer!", (uint8_t *)buf, 2u);
  }

  id v5 = [(MSDRapportDeviceExplorer *)self rpClient];

  if (!v5)
  {
    objc_initWeak(buf, self);
    id v6 = objc_alloc_init((Class)RPCompanionLinkClient);
    [(MSDRapportDeviceExplorer *)self setRpClient:v6];

    v7 = [(MSDRapportDeviceExplorer *)self queue];
    v8 = [(MSDRapportDeviceExplorer *)self rpClient];
    [v8 setDispatchQueue:v7];

    objc_super v9 = [(MSDRapportDeviceExplorer *)self rpClient];
    [v9 setControlFlags:74758];

    v10 = [(MSDRapportDeviceExplorer *)self rpClient];
    [v10 setFlags:1];

    v11 = [(MSDRapportDeviceExplorer *)self rpClient];
    [v11 setPasswordType:2];

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100049C54;
    v28[3] = &unk_100151AC8;
    objc_copyWeak(&v29, buf);
    v12 = [(MSDRapportDeviceExplorer *)self rpClient];
    [v12 setInterruptionHandler:v28];

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100049CB0;
    v26[3] = &unk_100151AC8;
    objc_copyWeak(&v27, buf);
    v13 = [(MSDRapportDeviceExplorer *)self rpClient];
    [v13 setInvalidationHandler:v26];

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100049D0C;
    v24[3] = &unk_100152B60;
    objc_copyWeak(&v25, buf);
    v14 = [(MSDRapportDeviceExplorer *)self rpClient];
    [v14 setDeviceFoundHandler:v24];

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100049D68;
    v22[3] = &unk_100152B60;
    objc_copyWeak(&v23, buf);
    v15 = [(MSDRapportDeviceExplorer *)self rpClient];
    [v15 setDeviceLostHandler:v22];

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100049DC4;
    v20[3] = &unk_100152B88;
    objc_copyWeak(&v21, buf);
    v16 = [(MSDRapportDeviceExplorer *)self rpClient];
    [v16 setDeviceChangedHandler:v20];

    v17 = [(MSDRapportDeviceExplorer *)self rpClient];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100049E30;
    v18[3] = &unk_100151FF0;
    objc_copyWeak(&v19, buf);
    [v17 activateWithCompletion:v18];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(buf);
  }
}

- (void)_deactivate
{
  v3 = [(MSDRapportDeviceExplorer *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MSDRapportDeviceExplorer: Deactivating explorer!", buf, 2u);
  }

  id v5 = [(MSDRapportDeviceExplorer *)self rpClient];

  if (v5)
  {
    id v6 = [(MSDRapportDeviceExplorer *)self rpClient];
    [v6 setInterruptionHandler:0];

    v7 = [(MSDRapportDeviceExplorer *)self rpClient];
    [v7 invalidate];

    [(MSDRapportDeviceExplorer *)self setRpClient:0];
    v8 = [(MSDRapportDeviceExplorer *)self devices];
    objc_super v9 = +[NSArray arrayWithArray:v8];

    v10 = [(MSDRapportDeviceExplorer *)self devices];
    [v10 removeAllObjects];

    v11 = [(MSDRapportDeviceExplorer *)self observer];

    if (v11)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v12 = v9;
      id v13 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v20;
        do
        {
          v16 = 0;
          do
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v16);
            v18 = [(MSDRapportDeviceExplorer *)self observer];
            [v18 explorerDidLoseDevice:v17];

            v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          id v14 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v14);
      }
    }
  }
}

- (id)_findMatchingMSDRapportDeviceForRPCompanionLinkDevice:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(MSDRapportDeviceExplorer *)self devices];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_super v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 isEqualToRPCompanionLinkDevice:v4])
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_handleRPCompanionLinkDeviceFound:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDRapportDeviceExplorer *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000CE638();
  }

  unsigned int v7 = [v4 statusFlags];
  unint64_t v8 = (unint64_t)[v4 statusFlags] & 0x8000;
  if (!(v7 & 0x80000000 | v8))
  {
    objc_super v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1000CE5B8();
    }
    goto LABEL_18;
  }
  if ((v7 & 0x80000000) != 0 && v8)
  {
    objc_super v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1000CE5F8();
    }
    goto LABEL_18;
  }
  objc_super v9 = [(MSDRapportDeviceExplorer *)self _findMatchingMSDRapportDeviceForRPCompanionLinkDevice:v4];
  if (!v9)
  {
    long long v12 = [[MSDRapportDevice alloc] initWithRPCompanionLinkDevice:v4];
    long long v13 = [(MSDRapportDeviceExplorer *)self devices];
    [v13 addObject:v12];

    long long v14 = [(MSDRapportDeviceExplorer *)self observer];

    if (v14)
    {
      uint64_t v15 = [(MSDRapportDeviceExplorer *)self observer];
      [v15 explorerDidFindDevice:v12];
    }
    goto LABEL_17;
  }
  v10 = sub_100068600();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "MSDRapportDeviceExplorer: Received duplicated device. Renewing its RPCompanionLinkDevice.", v16, 2u);
  }

  [v9 renewRPCompanionLinkDevice:v4];
  [v9 setDroppedByRapport:0];
  long long v11 = [(MSDRapportDeviceExplorer *)self observer];

  if (v11)
  {
    long long v12 = [(MSDRapportDeviceExplorer *)self observer];
    [(MSDRapportDevice *)v12 explorerDidUpdateDevice:v9];
LABEL_17:
  }
LABEL_18:
}

- (void)_handleRPCompanionLinkDeviceLost:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDRapportDeviceExplorer *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000CE6AC();
  }

  unsigned int v7 = [(MSDRapportDeviceExplorer *)self _findMatchingMSDRapportDeviceForRPCompanionLinkDevice:v4];
  unint64_t v8 = v7;
  if (v7)
  {
    [v7 setDroppedByRapport:1];
    dispatch_time_t v9 = dispatch_time(0, 1000000000);
    v10 = [(MSDRapportDeviceExplorer *)self queue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10004A5EC;
    v11[3] = &unk_1001520B0;
    id v12 = v8;
    long long v13 = self;
    dispatch_after(v9, v10, v11);
  }
}

- (void)_handleRPCompanionLinkDeviceChanged:(id)a3 withChanges:(unsigned int)a4
{
  id v5 = a3;
  id v6 = [(MSDRapportDeviceExplorer *)self queue];
  dispatch_assert_queue_V2(v6);

  unsigned int v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000CE720();
  }

  [(MSDRapportDeviceExplorer *)self _findMatchingMSDRapportDeviceForRPCompanionLinkDevice:v5];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (RPCompanionLinkClient)rpClient
{
  return self->_rpClient;
}

- (void)setRpClient:(id)a3
{
}

- (NSMutableArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (MSDRapportDeviceExplorerProtocol)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (MSDRapportDeviceExplorerProtocol *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_rpClient, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end