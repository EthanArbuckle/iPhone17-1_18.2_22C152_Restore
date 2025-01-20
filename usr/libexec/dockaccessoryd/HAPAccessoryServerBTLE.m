@interface HAPAccessoryServerBTLE
+ (id)hapUUIDFromBTLEUUID:(id)a3;
- (BOOL)isCached;
- (BOOL)isPaired;
- (BOOL)notifyingCharacteristicUpdated;
- (BOOL)stateChanged;
- (BOOL)updatePeripheralIdentifier:(id *)a3 isPairing:(BOOL)a4;
- (BOOL)updateResumeSessionID:(unint64_t)a3;
- (CBPeripheral)peripheral;
- (HAPAccessoryServerBTLE)initWithPeripheral:(id)a3 name:(id)a4 pairingUsername:(id)a5 statusFlags:(id)a6 stateNumber:(id)a7 enhancedEncryption:(BOOL)a8 connectReason:(unsigned __int8)a9 configNumber:(id)a10 category:(id)a11 setupHash:(id)a12 connectionIdleTime:(unsigned __int8)a13 browser:(id)a14 keyStore:(id)a15 whbStableIdentifier:(id)a16;
- (HAPAccessoryServerBrowser)browser;
- (HAPBLEPeripheral)blePeripheral;
- (NSNumber)stateNumber;
- (NSString)shortDescription;
- (NSString)whbStableIdentifier;
- (id)hapCharacteristicForCBCharacteristic:(id)a3;
- (id)readAndResetHAPMetrics:(BOOL)a3;
- (int64_t)linkType;
- (unint64_t)hapBLEProtocolVersion;
- (unint64_t)metricHAPBTLEConnectionCount;
- (unint64_t)metricHAPBTLEConnectionPerReasonCount;
- (unint64_t)metricHAPBTLEDiscoveryCount;
- (unint64_t)resumeSessionID;
- (unsigned)connectReason;
- (unsigned)connectionIdleTime;
- (void)configureCharacteristics:(id)a3 queue:(id)a4 withCompletionHandler:(id)a5;
- (void)discoverAccessoriesAndReadCharacteristicTypes:(id)a3;
- (void)enterTrackingMode;
- (void)exitTrackingMode;
- (void)generateBroadcastKey:(unsigned __int8)a3 queue:(id)a4 withCompletionHandler:(id)a5;
- (void)handleConnectionWithPeripheral:(id)a3 withError:(id)a4;
- (void)handleDisconnectionWithError:(id)a3 completionHandler:(id)a4;
- (void)incrementHAPBTLEMetricsConnectionCount;
- (void)incrementHAPBTLEMetricsDiscoveryCount;
- (void)setBlePeripheral:(id)a3;
- (void)setConnectReason:(unsigned __int8)a3;
- (void)setConnectionIdleTime:(unsigned __int8)a3;
- (void)setMetricHAPBTLEConnectionCount:(unint64_t)a3;
- (void)setMetricHAPBTLEConnectionPerReasonCount:(unint64_t)a3;
- (void)setMetricHAPBTLEDiscoveryCount:(unint64_t)a3;
- (void)setNotifyingCharacteristicUpdated:(BOOL)a3;
- (void)setStateChanged:(BOOL)a3;
- (void)setStateNumber:(id)a3;
- (void)updateConnectionIdleTime:(unsigned __int8)a3;
- (void)updatePeripheral:(id)a3;
@end

@implementation HAPAccessoryServerBTLE

+ (id)hapUUIDFromBTLEUUID:(id)a3
{
  id v3 = a3;
  v4 = +[HAPMetadata getSharedInstance];
  v5 = [v3 UUIDString];
  v6 = [v4 btleToServiceType:v5];

  id v7 = objc_alloc((Class)NSUUID);
  v8 = v7;
  if (v6)
  {
    id v9 = [v7 initWithUUIDString:v6];
  }
  else
  {
    v10 = [v3 UUIDString];
    id v9 = [v8 initWithUUIDString:v10];
  }

  return v9;
}

- (HAPAccessoryServerBTLE)initWithPeripheral:(id)a3 name:(id)a4 pairingUsername:(id)a5 statusFlags:(id)a6 stateNumber:(id)a7 enhancedEncryption:(BOOL)a8 connectReason:(unsigned __int8)a9 configNumber:(id)a10 category:(id)a11 setupHash:(id)a12 connectionIdleTime:(unsigned __int8)a13 browser:(id)a14 keyStore:(id)a15 whbStableIdentifier:(id)a16
{
  id v20 = a3;
  id v38 = a4;
  id v39 = a5;
  id v21 = a6;
  id obj = a7;
  id v37 = a7;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  id v25 = a14;
  id v26 = a16;
  v40.receiver = self;
  v40.super_class = (Class)HAPAccessoryServerBTLE;
  v27 = [(HAPAccessoryServer *)&v40 initWithKeystore:a15];
  v28 = v27;
  if (v27)
  {
    objc_storeWeak((id *)(v27 + 356), v20);
    v29 = [v20 cbPeripheral];
    objc_storeWeak((id *)(v28 + 300), v29);

    id v30 = [v38 copy];
    v31 = (void *)*((void *)v28 + 1);
    *((void *)v28 + 1) = v30;

    id v32 = [v39 copy];
    v33 = (void *)*((void *)v28 + 2);
    *((void *)v28 + 2) = v32;

    objc_storeStrong((id *)(v28 + 284), obj);
    v28[282] = 0;
    v28[281] = 0;
    v28[280] = a9;
    v28[283] = a13;
    objc_storeWeak((id *)(v28 + 348), v25);
    objc_storeStrong((id *)(v28 + 292), a16);
    [v28 setSetupHash:v24];
    [v28 setHasPairings:sub_100017C38((char)objc_msgSend(v21, "unsignedCharValue"))];
    [v28 setCategory:v23];
    [v28 setConfigNumber:[v22 unsignedIntegerValue]];
    [v28 updatePeripheralIdentifier:0 isPairing:0];
  }

  return (HAPAccessoryServerBTLE *)v28;
}

- (int64_t)linkType
{
  return 2;
}

- (NSNumber)stateNumber
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = *(id *)(&self->_connectionIdleTime + 1);
  os_unfair_lock_unlock(p_lock);

  return (NSNumber *)v4;
}

- (void)setStateNumber:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  if (HMFEqualObjects())
  {
    os_unfair_lock_unlock(&self->super._lock);
  }
  else
  {
    objc_storeStrong((id *)(&self->_connectionIdleTime + 1), a3);
    os_unfair_lock_unlock(&self->super._lock);
    v6 = [(HAPAccessoryServer *)self delegate];
    uint64_t v7 = [(HAPAccessoryServer *)self delegateQueue];
    if (v7)
    {
      v8 = (void *)v7;
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        v10 = [(HAPAccessoryServer *)self delegateQueue];
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_1000819A4;
        v11[3] = &unk_100273040;
        id v12 = v6;
        v13 = self;
        dispatch_async(v10, v11);
      }
    }
  }
}

- (unsigned)connectReason
{
  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_connectReason;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (void)setConnectReason:(unsigned __int8)a3
{
  int v3 = a3;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_connectReason = v3;
  if (v3) {
    ++*(unint64_t *)((char *)&self->_metricHAPBTLEDiscoveryCount + 4);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)handleConnectionWithPeripheral:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = NSStringFromSelector(a2);
  char v9 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)handleDisconnectionWithError:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = NSStringFromSelector(a2);
  char v9 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (BOOL)updateResumeSessionID:(unint64_t)a3
{
  id v5 = [(HAPAccessoryServerBTLE *)self browser];
  id v6 = [(HAPAccessoryServer *)self identifier];
  unsigned int v7 = [v5 isPaired:v6];

  if (!v7) {
    return 0;
  }
  *(unint64_t *)((char *)&self->_hapBLEProtocolVersion + 4) = a3;
  v8 = self;
  char v9 = sub_100083F74();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = sub_100083FD0(v8);
    *(_DWORD *)buf = 138543618;
    id v23 = v10;
    __int16 v24 = 2048;
    unint64_t v25 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@Updating resumeSessionID: %llu", buf, 0x16u);
  }
  v11 = [(HAPAccessoryServer *)v8 keyStore];
  id v12 = [(HAPAccessoryServerBTLE *)v8 blePeripheral];
  v13 = [v12 uniqueBTIdentifier];
  v14 = [(HAPAccessoryServer *)v8 identifier];
  id v21 = 0;
  unsigned __int8 v15 = [v11 updatePeripheralIdentifier:v13 forAccessoryIdentifier:v14 protocolVersion:-[HAPAccessoryServerBTLE hapBLEProtocolVersion](v8, "hapBLEProtocolVersion") previousVersion:0 resumeSessionID:a3 error:&v21];
  id v16 = v21;

  if ((v15 & 1) == 0)
  {
    v17 = v8;
    v18 = sub_100083F74();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = sub_100083FD0(v17);
      *(_DWORD *)buf = 138543618;
      id v23 = v19;
      __int16 v24 = 2112;
      unint64_t v25 = (unint64_t)v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to update the peripheral identifier with error: %@", buf, 0x16u);
    }
  }

  return v15;
}

- (void)updatePeripheral:(id)a3
{
}

- (BOOL)updatePeripheralIdentifier:(id *)a3 isPairing:(BOOL)a4
{
  unsigned int v7 = [(HAPAccessoryServerBTLE *)self browser];
  v8 = [(HAPAccessoryServer *)self identifier];
  unsigned __int8 v9 = [v7 isPaired:v8];

  if ((v9 & 1) != 0 || a4)
  {
    unint64_t v32 = 0;
    uint64_t v33 = 0;
    v11 = [(HAPAccessoryServer *)self keyStore];
    id v12 = [(HAPAccessoryServer *)self identifier];
    id v31 = 0;
    id v13 = [v11 readPeripheralIdentifierForAccessoryIdentifier:v12 protocolVersion:0 resumeSessionID:&v32 error:&v31];
    id v14 = v31;

    if (v32)
    {
      unsigned __int8 v15 = self;
      id v16 = sub_100083F74();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = sub_100083FD0(v15);
        *(_DWORD *)buf = 138543618;
        v35 = v17;
        __int16 v36 = 2048;
        unint64_t v37 = v32;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%{public}@Initializing BLE Server with resumeSessionID: %llu", buf, 0x16u);
      }
      *(unint64_t *)((char *)&v15->_hapBLEProtocolVersion + 4) = v32;
    }
    v18 = [(HAPAccessoryServer *)self keyStore];
    v19 = [(HAPAccessoryServerBTLE *)self blePeripheral];
    id v20 = [v19 uniqueBTIdentifier];
    id v21 = [(HAPAccessoryServer *)self identifier];
    id v30 = 0;
    unsigned __int8 v10 = [v18 updatePeripheralIdentifier:v20 forAccessoryIdentifier:v21 protocolVersion:-[HAPAccessoryServerBTLE hapBLEProtocolVersion](self, "hapBLEProtocolVersion") previousVersion:&v33 resumeSessionID:-[HAPAccessoryServerBTLE resumeSessionID](self, "resumeSessionID") error:&v30];
    id v22 = v30;

    if (v10)
    {
      if (v33 == 1 && (id)[(HAPAccessoryServerBTLE *)self hapBLEProtocolVersion] != (id)1)
      {
        id v23 = self;
        __int16 v24 = sub_100083F74();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v25 = sub_100083FD0(v23);
          *(_DWORD *)buf = 138543362;
          v35 = v25;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Incompatible update BLE 1.0 -> BLE 2.x", buf, 0xCu);
        }
        [(HAPAccessoryServer *)v23 setIncompatibleUpdate:1];
      }
    }
    else
    {
      id v26 = self;
      v27 = sub_100083F74();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = sub_100083FD0(v26);
        *(_DWORD *)buf = 138543618;
        v35 = v28;
        __int16 v36 = 2112;
        unint64_t v37 = (unint64_t)v22;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to update the peripheral identifier with error: %@", buf, 0x16u);
      }
      if (a3)
      {
        *a3 = +[NSError hapErrorWithcode:1 description:@"Failed to update peripheral" reason:@"Failed to store peripheral identifier to the keystore" suggestion:0 underlyingError:v22];
      }
    }
  }
  else if (a3)
  {
    +[NSError hapErrorWithcode:3 description:@"Failed to update peripheral." reason:@"The accessory is unpaired" suggestion:0 underlyingError:0];
    unsigned __int8 v10 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v10;
}

- (void)updateConnectionIdleTime:(unsigned __int8)a3
{
  int v3 = NSStringFromSelector(a2);
  id v4 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v3];
  id v5 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (void)configureCharacteristics:(id)a3 queue:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = NSStringFromSelector(a2);
  id v12 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v11];
  id v13 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (void)generateBroadcastKey:(unsigned __int8)a3 queue:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = NSStringFromSelector(a2);
  id v10 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v9];
  id v11 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

- (BOOL)isPaired
{
  int v3 = [(HAPAccessoryServerBTLE *)self browser];
  id v4 = [(HAPAccessoryServer *)self identifier];
  unsigned __int8 v5 = [v3 isPaired:v4];

  return v5;
}

- (void)discoverAccessoriesAndReadCharacteristicTypes:(id)a3
{
}

- (BOOL)isCached
{
  v2 = [(HAPAccessoryServerBTLE *)self blePeripheral];
  unsigned __int8 v3 = [v2 isCached];

  return v3;
}

- (NSString)shortDescription
{
  v7.receiver = self;
  v7.super_class = (Class)HAPAccessoryServerBTLE;
  unsigned __int8 v3 = [(HAPAccessoryServer *)&v7 shortDescription];
  id v4 = [(HAPAccessoryServerBTLE *)self stateNumber];
  unsigned __int8 v5 = +[NSString stringWithFormat:@"%@ (%@)", v3, v4];

  return (NSString *)v5;
}

- (void)enterTrackingMode
{
}

- (void)exitTrackingMode
{
}

- (id)hapCharacteristicForCBCharacteristic:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = NSStringFromSelector(a2);
  id v6 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (NSString)whbStableIdentifier
{
  return *(NSString **)((char *)&self->_stateNumber + 4);
}

- (BOOL)stateChanged
{
  return self->_stateChanged;
}

- (void)setStateChanged:(BOOL)a3
{
  self->_stateChanged = a3;
}

- (BOOL)notifyingCharacteristicUpdated
{
  return self->_notifyingCharacteristicUpdated;
}

- (void)setNotifyingCharacteristicUpdated:(BOOL)a3
{
  self->_notifyingCharacteristicUpdated = a3;
}

- (CBPeripheral)peripheral
{
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_whbStableIdentifier + 4));

  return (CBPeripheral *)WeakRetained;
}

- (unint64_t)hapBLEProtocolVersion
{
  return *(unint64_t *)((char *)&self->_peripheral + 4);
}

- (unint64_t)resumeSessionID
{
  return *(unint64_t *)((char *)&self->_hapBLEProtocolVersion + 4);
}

- (unint64_t)metricHAPBTLEConnectionCount
{
  return *(unint64_t *)((char *)&self->_resumeSessionID + 4);
}

- (void)setMetricHAPBTLEConnectionCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_resumeSessionID + 4) = a3;
}

- (unint64_t)metricHAPBTLEDiscoveryCount
{
  return *(unint64_t *)((char *)&self->_metricHAPBTLEConnectionCount + 4);
}

- (void)setMetricHAPBTLEDiscoveryCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_metricHAPBTLEConnectionCount + 4) = a3;
}

- (unint64_t)metricHAPBTLEConnectionPerReasonCount
{
  return *(unint64_t *)((char *)&self->_metricHAPBTLEDiscoveryCount + 4);
}

- (void)setMetricHAPBTLEConnectionPerReasonCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_metricHAPBTLEDiscoveryCount + 4) = a3;
}

- (HAPAccessoryServerBrowser)browser
{
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_metricHAPBTLEConnectionPerReasonCount + 4));

  return (HAPAccessoryServerBrowser *)WeakRetained;
}

- (unsigned)connectionIdleTime
{
  return self->_connectionIdleTime;
}

- (void)setConnectionIdleTime:(unsigned __int8)a3
{
  self->_connectionIdleTime = a3;
}

- (HAPBLEPeripheral)blePeripheral
{
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_browser + 4));

  return (HAPBLEPeripheral *)WeakRetained;
}

- (void)setBlePeripheral:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)((char *)&self->_browser + 4));
  objc_destroyWeak((id *)((char *)&self->_metricHAPBTLEConnectionPerReasonCount + 4));
  objc_destroyWeak((id *)((char *)&self->_whbStableIdentifier + 4));
  objc_storeStrong((id *)((char *)&self->_stateNumber + 4), 0);

  objc_storeStrong((id *)(&self->_connectionIdleTime + 1), 0);
}

- (void)incrementHAPBTLEMetricsConnectionCount
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  ++*(unint64_t *)((char *)&self->_resumeSessionID + 4);

  os_unfair_lock_unlock(p_lock);
}

- (void)incrementHAPBTLEMetricsDiscoveryCount
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  ++*(unint64_t *)((char *)&self->_metricHAPBTLEConnectionCount + 4);

  os_unfair_lock_unlock(p_lock);
}

- (id)readAndResetHAPMetrics:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v11[0] = &off_100281670;
  id v6 = +[NSNumber numberWithUnsignedInteger:*(unint64_t *)((char *)&self->_metricHAPBTLEConnectionCount + 4)];
  v12[0] = v6;
  v11[1] = &off_100281688;
  id v7 = +[NSNumber numberWithUnsignedInteger:*(unint64_t *)((char *)&self->_resumeSessionID + 4)];
  v12[1] = v7;
  v11[2] = &off_1002816A0;
  id v8 = +[NSNumber numberWithUnsignedInteger:*(unint64_t *)((char *)&self->_metricHAPBTLEDiscoveryCount + 4)];
  v12[2] = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];

  if (v3)
  {
    *(unint64_t *)((char *)&self->_metricHAPBTLEConnectionCount + 4) = 0;
    *(unint64_t *)((char *)&self->_resumeSessionID + 4) = 0;
    *(unint64_t *)((char *)&self->_metricHAPBTLEDiscoveryCount + 4) = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

@end