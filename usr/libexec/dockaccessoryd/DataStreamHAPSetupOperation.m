@interface DataStreamHAPSetupOperation
- (DataStreamHAPSetupOperation)initWithAccessory:(id)a3 queue:(id)a4 logIdentifier:(id)a5 transferManagementService:(id)a6 maxControllerTransportMTU:(unint64_t)a7 setupOperationReadRequired:(BOOL)a8;
- (int64_t)sessionIdentifier;
- (unint64_t)maxControllerTransportMTU;
- (void)_readRequiredTransportCharacteristics;
- (void)processTransportSetupResponse:(id)a3;
- (void)setMaxControllerTransportMTU:(unint64_t)a3;
- (void)setSessionIdentifier:(int64_t)a3;
- (void)startSetup;
@end

@implementation DataStreamHAPSetupOperation

- (DataStreamHAPSetupOperation)initWithAccessory:(id)a3 queue:(id)a4 logIdentifier:(id)a5 transferManagementService:(id)a6 maxControllerTransportMTU:(unint64_t)a7 setupOperationReadRequired:(BOOL)a8
{
  BOOL v8 = a8;
  v13.receiver = self;
  v13.super_class = (Class)DataStreamHAPSetupOperation;
  v10 = [(DataStreamSetupOperation *)&v13 initWithAccessory:a3 queue:a4 logIdentifier:a5 transferManagementService:a6];
  v11 = v10;
  if (v10)
  {
    v10->_maxControllerTransportMTU = a7;
    if (v8) {
      [(DataStreamHAPSetupOperation *)v10 _readRequiredTransportCharacteristics];
    }
  }
  return v11;
}

- (void)setMaxControllerTransportMTU:(unint64_t)a3
{
  if (!self->_maxControllerTransportMTU) {
    self->_maxControllerTransportMTU = a3;
  }
}

- (void)_readRequiredTransportCharacteristics
{
  v3 = [(DataStreamSetupOperation *)self transferManagementService];
  v4 = [v3 characteristicsOfType:@"00000130-0000-1000-8000-4D69736D6574"];
  v5 = [v4 objectAtIndexedSubscript:0];

  if (v5)
  {
    v20 = v5;
    v6 = +[NSArray arrayWithObjects:&v20 count:1];
    objc_initWeak((id *)location, self);
    v7 = [(DataStreamSetupOperation *)self accessory];
    BOOL v8 = [(DataStreamSetupOperation *)self queue];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000326E0;
    v17[3] = &unk_1002733A0;
    objc_copyWeak(&v18, (id *)location);
    [v7 readCharacteristicValues:v6 timeout:v8 completionQueue:v17 completionHandler:0.0];

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v9 = self;
    v10 = sub_100083F74();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = sub_100083FD0(v9);
      v12 = [(DataStreamSetupOperation *)v9 accessory];
      objc_super v13 = [v12 name];
      v14 = [(DataStreamSetupOperation *)v9 accessory];
      v15 = [v14 identifier];
      *(_DWORD *)location = 138543874;
      *(void *)&location[4] = v11;
      __int16 v22 = 2112;
      v23 = v13;
      __int16 v24 = 2112;
      v25 = v15;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@HDS characteristic(s) not found configuration/version (%@/%@)", location, 0x20u);
    }
    v16 = [(DataStreamSetupOperation *)v9 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100032640;
    block[3] = &unk_100273018;
    block[4] = v9;
    dispatch_async(v16, block);
  }
}

- (void)startSetup
{
  v2 = self;
  v3 = sub_100083F74();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = sub_100083FD0(v2);
    *(_DWORD *)buf = 138543362;
    v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%{public}@Creating new DataStream using HAP", buf, 0xCu);
  }
  v5 = [[HAPDataStreamTransportCommandWrapper alloc] initWithValue:0];
  v6 = [[HAPDataStreamTransportProtocolWrapper alloc] initWithValue:1];
  v7 = [[HAPDataStreamTransportSetup alloc] initWithCommand:v5 transportType:v6 controllerKeySalt:0];

  id v22 = 0;
  BOOL v8 = [(HAPDataStreamTransportSetup *)v7 serializeWithError:&v22];
  id v9 = v22;
  if (v8)
  {
    v10 = [(DataStreamSetupOperation *)v2 transferManagementService];
    v11 = [v10 characteristicsOfType:@"00000131-0000-1000-8000-4D69736D6574"];
    v12 = [v11 objectAtIndexedSubscript:0];

    objc_super v13 = +[HAPCharacteristicWriteRequestTuple writeRequestTupleForCharacteristic:v12 value:v8 authorizationData:0 timedWrite:0 responseValue:1 type:0];
    objc_initWeak((id *)buf, v2);
    v14 = [(DataStreamSetupOperation *)v2 accessory];
    v23 = v13;
    v15 = +[NSArray arrayWithObjects:&v23 count:1];
    v16 = [(DataStreamSetupOperation *)v2 queue];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100032AFC;
    v20[3] = &unk_1002733A0;
    objc_copyWeak(&v21, (id *)buf);
    [v14 writeCharacteristicValues:v15 timeout:v16 completionQueue:v20 completionHandler:0.0];

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v17 = v2;
    id v18 = sub_100083F74();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = sub_100083FD0(v17);
      *(_DWORD *)buf = 138543618;
      v25 = v19;
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to create new DataStream; cannot serialize request (%@)",
        buf,
        0x16u);
    }
    [(DataStreamSetupOperation *)v17 postDidFailWithError:v9];
  }
}

- (void)processTransportSetupResponse:(id)a3
{
  id v4 = a3;
  v5 = [v4 parameters];
  v6 = [v5 sessionIdentifier];

  v7 = self;
  BOOL v8 = sub_100083F74();
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v10 = sub_100083FD0(v7);
      v11 = [v4 parameters];
      v12 = [v11 sessionIdentifier];
      int v27 = 138543618;
      v28 = v10;
      __int16 v29 = 2112;
      v30 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%{public}@[Start Stream] The setup transfer succeeded; will use session identifier %@",
        (uint8_t *)&v27,
        0x16u);
    }
    objc_super v13 = [v4 parameters];
    v14 = [v13 sessionIdentifier];
    v15 = [v14 value];
    -[DataStreamHAPSetupOperation setSessionIdentifier:](v7, "setSessionIdentifier:", [v15 integerValue]);

    v16 = v7;
    v17 = sub_100083F74();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = sub_100083FD0(v16);
      int v27 = 138543362;
      v28 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%{public}@[Start Stream] DataStream configuration valid; starting stream",
        (uint8_t *)&v27,
        0xCu);
    }
    v19 = [DataStreamHAPTransport alloc];
    v20 = [(DataStreamSetupOperation *)v16 accessory];
    id v21 = [(DataStreamHAPSetupOperation *)v16 sessionIdentifier];
    id v22 = [(DataStreamHAPSetupOperation *)v16 maxControllerTransportMTU];
    v23 = [(DataStreamSetupOperation *)v16 queue];
    __int16 v24 = [(DataStreamSetupOperation *)v16 logIdentifier];
    v25 = [(DataStreamHAPTransport *)v19 initWithAccessory:v20 sessionIdentifier:v21 maxControllerTransportMTU:v22 workQueue:v23 logIdentifier:v24];

    [(DataStreamSetupOperation *)v16 postDidSucceedWithTransport:v25 sessionEncryption:0];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      __int16 v26 = sub_100083FD0(v7);
      int v27 = 138543362;
      v28 = v26;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@[Start Stream] The setup transfer write reply did not contain a session identifier", (uint8_t *)&v27, 0xCu);
    }
    v25 = +[NSError dkErrorWithCode:36];
    [(DataStreamSetupOperation *)v7 postDidFailWithError:v25];
  }
}

- (unint64_t)maxControllerTransportMTU
{
  return self->_maxControllerTransportMTU;
}

- (int64_t)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(int64_t)a3
{
  self->_sessionIdentifier = a3;
}

@end