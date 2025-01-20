@interface EPWatchPusher
- (BOOL)_deviceSupportsExtensiblePairingWithAdvertisedName:(id)a3;
- (EPWatchPusher)init;
- (NSMutableDictionary)contexts;
- (id)writeDataForAdvertisedName:(id)a3 bluetoothDeviceID:(id)a4;
- (void)_notifyClientsOfFailureForAdvertisedName:(id)a3;
- (void)_notifyClientsOfMetadata:(id)a3 forAdvertisedName:(id)a4;
- (void)_waitTimeoutWithAdvertisedName:(id)a3;
- (void)invalidate;
- (void)readResult:(id)a3 advertisedName:(id)a4 bluetoothDeviceID:(id)a5;
- (void)setContexts:(id)a3;
- (void)waitForWatchPairingExtendedMetadataForAdvertisedName:(id)a3 completion:(id)a4;
@end

@implementation EPWatchPusher

- (EPWatchPusher)init
{
  v3 = +[CBUUID UUIDWithString:@"1F9636E6-CA97-4C30-BC5F-C477D6A6CF32"];
  v4 = +[CBUUID UUIDWithString:@"E168D473-8EFD-4485-A1FD-B25EDAD4DCE2"];
  v9.receiver = self;
  v9.super_class = (Class)EPWatchPusher;
  v5 = [(EPBulkCharacteristicReaderWriter *)&v9 initWithWriteCharacteristicUUID:v3 readCharacteristicUUID:v4 timeout:9.0];

  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    contexts = v5->_contexts;
    v5->_contexts = v6;
  }
  return v5;
}

- (BOOL)_deviceSupportsExtensiblePairingWithAdvertisedName:(id)a3
{
  v3 = sub_10001381C(a3);
  v4 = v3;
  BOOL v7 = 0;
  if (v3)
  {
    v5 = [v3 objectForKeyedSubscript:@"v"];
    uint64_t v6 = (uint64_t)[v5 integerValue];

    if (v6 > 1) {
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (id)writeDataForAdvertisedName:(id)a3 bluetoothDeviceID:(id)a4
{
  if (-[EPWatchPusher _deviceSupportsExtensiblePairingWithAdvertisedName:](self, "_deviceSupportsExtensiblePairingWithAdvertisedName:", a3, a4))
  {
    v4 = [@"push" dataUsingEncoding:4];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)readResult:(id)a3 advertisedName:(id)a4 bluetoothDeviceID:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    if (v11)
    {
      v10 = [[NRPBWatchPairingExtendedMetadata alloc] initWithData:v11];
      [(EPWatchPusher *)self _notifyClientsOfMetadata:v10 forAdvertisedName:v8];
    }
    else
    {
      [(EPWatchPusher *)self _notifyClientsOfFailureForAdvertisedName:v8];
    }
  }
}

- (void)_notifyClientsOfMetadata:(id)a3 forAdvertisedName:(id)a4
{
  id v6 = a3;
  contexts = self->_contexts;
  id v8 = a4;
  id v9 = [(NSMutableDictionary *)contexts objectForKeyedSubscript:v8];
  if (!v9) {
    id v9 = objc_opt_new();
  }
  [v9 setMetadata:v6];
  v10 = [v9 timer];
  [v10 invalidate];

  [v9 setTimer:0];
  [(NSMutableDictionary *)self->_contexts setObject:v9 forKeyedSubscript:v8];

  id v11 = [v9 completions];
  [v9 setCompletions:0];
  v12 = +[EPFactory queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000700EC;
  v15[3] = &unk_100165530;
  id v16 = v11;
  id v17 = v6;
  id v13 = v6;
  id v14 = v11;
  dispatch_async(v12, v15);
}

- (void)_notifyClientsOfFailureForAdvertisedName:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_contexts objectForKeyedSubscript:v4];
  id v6 = v5;
  if (v5)
  {
    BOOL v7 = [v5 timer];
    [v7 invalidate];

    [v6 setTimer:0];
    id v8 = [v6 completions];
    [v6 setCompletions:0];
    id v9 = +[EPFactory queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100070334;
    block[3] = &unk_1001655F8;
    id v12 = v8;
    id v10 = v8;
    dispatch_async(v9, block);

    [(NSMutableDictionary *)self->_contexts removeObjectForKey:v4];
  }
}

- (void)invalidate
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v3 = [(NSMutableDictionary *)self->_contexts allKeys];
  id v4 = [v3 copy];

  id obj = v4;
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = [(NSMutableDictionary *)self->_contexts objectForKeyedSubscript:*(void *)(*((void *)&v18 + 1) + 8 * (void)v8)];
        id v10 = [v9 timer];
        [v10 invalidate];

        [v9 setTimer:0];
        id v11 = [v9 completions];
        [v9 setCompletions:0];
        id v12 = +[EPFactory queue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100070654;
        block[3] = &unk_1001655F8;
        id v17 = v11;
        id v13 = v11;
        dispatch_async(v12, block);

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  v15.receiver = self;
  v15.super_class = (Class)EPWatchPusher;
  [(EPBulkCharacteristicReaderWriter *)&v15 invalidate];
}

- (void)waitForWatchPairingExtendedMetadataForAdvertisedName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMutableDictionary *)self->_contexts objectForKeyedSubscript:v6];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100070AC4;
  v29[3] = &unk_100167EF8;
  v29[4] = self;
  id v9 = v6;
  id v30 = v9;
  id v10 = v7;
  id v31 = v10;
  id v11 = objc_retainBlock(v29);
  id v12 = (void (**)(void, void, void, void))v11;
  if (!v9)
  {
    id v14 = (void (*)(void, void, void, const __CFString *))v11[2];
    CFStringRef v15 = @"No advertisedName";
    goto LABEL_7;
  }
  if (v8 && ([v8 timer], id v13 = objc_claimAutoreleasedReturnValue(), v13, !v13))
  {
    id v17 = [v8 metadata];
    ((void (**)(void, uint64_t, void *, const __CFString *))v12)[2](v12, 1, v17, @"Using context metadata");
  }
  else
  {
    if ([(EPBulkCharacteristicReaderWriter *)self invalidated])
    {
      id v14 = (void (*)(void, void, void, const __CFString *))v12[2];
      CFStringRef v15 = @"Invalidated";
LABEL_7:
      v14(v12, 0, 0, v15);
      goto LABEL_14;
    }
    if (![(EPWatchPusher *)self _deviceSupportsExtensiblePairingWithAdvertisedName:v9])
    {
      ((void (**)(void, uint64_t, void, const __CFString *))v12)[2](v12, 1, 0, @"Device Supports Extensible Pairing With Advertised Name");
      goto LABEL_14;
    }
    id v16 = [v8 timer];

    if (!v16)
    {
      [(EPBulkCharacteristicReaderWriter *)self readDiscoveredDevice:v9];
      long long v19 = objc_opt_new();

      long long v20 = objc_opt_new();
      [v19 setCompletions:v20];

      long long v21 = [v19 completions];
      id v22 = objc_retainBlock(v12);
      [v21 addObject:v22];

      v23 = [@"com.apple.nanoregistry.waitforwatchpairingextendedmetadata." stringByAppendingString:v9];
      v24 = +[EPFactory queue];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100070CA4;
      v27[3] = &unk_100165530;
      v27[4] = self;
      id v25 = v9;
      id v28 = v25;
      v26 = +[TimerFactory timerWithIdentifier:v23 delay:1 gracePeriod:v24 waking:v27 handlerQueue:9.0 handlerBlock:0.0];
      [v19 setTimer:v26];

      [(NSMutableDictionary *)self->_contexts setObject:v19 forKeyedSubscript:v25];
      id v8 = v19;
      goto LABEL_14;
    }
    id v17 = [v8 completions];
    id v18 = objc_retainBlock(v12);
    [v17 addObject:v18];
  }
LABEL_14:
}

- (void)_waitTimeoutWithAdvertisedName:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000A3CF0();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = sub_1000A3CF0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134218242;
      id v9 = self;
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "EPWatchPusher[%p]: Push timer timed out for device %@", (uint8_t *)&v8, 0x16u);
    }
  }
  [(EPWatchPusher *)self _notifyClientsOfFailureForAdvertisedName:v4];
}

- (NSMutableDictionary)contexts
{
  return self->_contexts;
}

- (void)setContexts:(id)a3
{
}

- (void).cxx_destruct
{
}

@end