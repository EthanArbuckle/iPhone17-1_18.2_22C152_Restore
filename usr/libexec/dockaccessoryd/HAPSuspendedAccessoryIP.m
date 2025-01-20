@interface HAPSuspendedAccessoryIP
+ (id)logCategory;
- (HAPSuspendedAccessoryIP)initWithName:(id)a3 identifier:(id)a4 wakeTuples:(id)a5 queue:(id)a6;
- (NSArray)wakeTuples;
- (NSString)dnsName;
- (id)_wakeWithTuple:(id)a3 dnsName:(id)a4;
- (unint64_t)timeout;
- (void)_closeConnection;
- (void)dealloc;
- (void)setDnsName:(id)a3;
- (void)setTimeout:(unint64_t)a3;
- (void)wakeWithCompletion:(id)a3;
@end

@implementation HAPSuspendedAccessoryIP

- (HAPSuspendedAccessoryIP)initWithName:(id)a3 identifier:(id)a4 wakeTuples:(id)a5 queue:(id)a6
{
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HAPSuspendedAccessoryIP;
  v11 = [(HAPSuspendedAccessory *)&v16 initWithName:a3 identifier:a4 type:1 queue:a6];
  if (v11)
  {
    v12 = +[NSSet setWithArray:v10];
    uint64_t v13 = [v12 allObjects];
    wakeTuples = v11->_wakeTuples;
    v11->_wakeTuples = (NSArray *)v13;

    v11->_timeout = 10000000000;
  }

  return v11;
}

- (void)dealloc
{
  [(HAPSuspendedAccessoryIP *)self _closeConnection];
  v3.receiver = self;
  v3.super_class = (Class)HAPSuspendedAccessoryIP;
  [(HAPSuspendedAccessoryIP *)&v3 dealloc];
}

- (void)wakeWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(HAPSuspendedAccessory *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007D2C;
  v7[3] = &unk_100272F38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)_wakeWithTuple:(id)a3 dnsName:(id)a4
{
  id v6 = a3;
  unint64_t v7 = (unint64_t)a4;
  id v8 = [(HAPSuspendedAccessory *)self queue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [v6 wakeAddress];
  unint64_t v10 = v7 | v9;

  if (v10)
  {
    id v12 = (id)v7;
    uint64_t v13 = [v6 wakeAddress];

    if (v13)
    {
      v14 = [v6 wakeAddress];
      uint64_t v15 = +[NSString stringWithFormat:@"wake://%@%s%@", v14, "\x1E", v12];

      id v12 = (id)v15;
    }
    id v16 = v12;
    [v16 UTF8String];
    [v6 wakePort];
    [(HAPSuspendedAccessoryIP *)self timeout];
    [(HAPSuspendedAccessory *)self queue];
    v24 = v23 = self;
    uint64_t v17 = AsyncConnection_Connect();

    if (v17)
    {
      v18 = +[NSError errorWithOSStatus:](NSError, "errorWithOSStatus:", v17, 0, 0, v23, v24);
      v11 = +[NSError hapErrorWithcode:1 description:@"Connection failed" reason:0 suggestion:0 underlyingError:v18];
    }
    else
    {
      v11 = 0;
    }
    v19 = sub_100083F74();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = sub_100083FD0(0);
      v21 = [v11 domain];
      *(_DWORD *)buf = 138543874;
      v26 = v20;
      __int16 v27 = 2112;
      v28 = v21;
      __int16 v29 = 2048;
      id v30 = [v11 code];
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@The suspended accessory sent wake command with error: %{key:errorDomain}@ %{key:errorCode}ld", buf, 0x20u);
    }
  }
  else
  {
    v11 = +[NSError hapErrorWithcode:9];
  }

  return v11;
}

- (void)_closeConnection
{
  if (self->_connection)
  {
    AsyncConnection_Release();
    self->_connection = 0;
  }
}

+ (id)logCategory
{
  if (qword_1002AD620 != -1) {
    dispatch_once(&qword_1002AD620, &stru_100272F78);
  }
  v2 = (void *)qword_1002AD628;

  return v2;
}

- (NSArray)wakeTuples
{
  return self->_wakeTuples;
}

- (NSString)dnsName
{
  return self->_dnsName;
}

- (void)setDnsName:(id)a3
{
}

- (unint64_t)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(unint64_t)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dnsName, 0);

  objc_storeStrong((id *)&self->_wakeTuples, 0);
}

@end