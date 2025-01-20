@interface CLSensorRecorderAlmanacListener
- (id)classNameForSensorIdentifier:(id)a3;
- (int)subscriptionType;
- (void)notifier;
- (void)sensorWriter:(id)a3 didReceiveUpdateToConfigurationRequests:(id)a4;
- (void)sensorWriterWillStartMonitoring:(id)a3;
- (void)setNotifier:(void *)a3;
- (void)setSubscriptionType:(int)a3;
@end

@implementation CLSensorRecorderAlmanacListener

- (void)sensorWriterWillStartMonitoring:(id)a3
{
  if (self->_notifier)
  {
    unsigned int v4 = 100;
    if ([(CLSensorRecorderAlmanacListener *)self subscriptionType] == 2)
    {
      if (sub_100744514()) {
        unsigned int v4 = 100;
      }
      else {
        unsigned int v4 = 25;
      }
    }
    notifier = self->_notifier;
    unsigned int v6 = [(CLSensorRecorderAlmanacListener *)self subscriptionType];
    sub_10131C434((uint64_t)notifier, v6, v4);
  }
}

- (id)classNameForSensorIdentifier:(id)a3
{
  if ([a3 isEqualToString:off_102477558[0]()]) {
    return @"CMAccelerometerDataArray";
  }
  if ([a3 isEqualToString:off_102477560[0]()]) {
    return @"CMGyroDataArray";
  }
  if ([a3 isEqualToString:off_102477568[0]()]) {
    return @"CMAmbientPressureDataArray";
  }
  return 0;
}

- (void)sensorWriter:(id)a3 didReceiveUpdateToConfigurationRequests:(id)a4
{
  if (qword_102419280 != -1) {
    dispatch_once(&qword_102419280, &stru_102320248);
  }
  unsigned int v6 = qword_102419288;
  if (os_log_type_enabled((os_log_t)qword_102419288, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Dynamic Config] Update to Configuration Requests: %@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419280 != -1) {
      dispatch_once(&qword_102419280, &stru_102320248);
    }
    int v24 = 138412290;
    id v25 = a3;
    v18 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorRecorderAlmanacListener sensorWriter:didReceiveUpdateToConfigurationRequests:]", "%s\n", v18);
    if (v18 != (char *)buf) {
      free(v18);
    }
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [a4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(a4);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v10);
        uint64_t v12 = sub_100F8CC8C();
        int v13 = sub_100F8E384(v12, v11);
        if (v13 != 100)
        {
          int v14 = v13;
          if (qword_102419280 != -1) {
            dispatch_once(&qword_102419280, &stru_102320248);
          }
          v15 = qword_102419288;
          if (os_log_type_enabled((os_log_t)qword_102419288, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67240192;
            LODWORD(v27) = v14;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[Dynamic Config] Error on config insertion: %{public}d", buf, 8u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_102419280 != -1) {
              dispatch_once(&qword_102419280, &stru_102320248);
            }
            int v24 = 67240192;
            LODWORD(v25) = v14;
            v16 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSensorRecorderAlmanacListener sensorWriter:didReceiveUpdateToConfigurationRequests:]", "%s\n", v16);
            if (v16 != (char *)buf) {
              free(v16);
            }
          }
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v17 = [a4 countByEnumeratingWithState:&v19 objects:v23 count:16];
      id v8 = v17;
    }
    while (v17);
  }
}

- (void)notifier
{
  return self->_notifier;
}

- (void)setNotifier:(void *)a3
{
  self->_notifier = a3;
}

- (int)subscriptionType
{
  return self->_subscriptionType;
}

- (void)setSubscriptionType:(int)a3
{
  self->_subscriptionType = a3;
}

@end