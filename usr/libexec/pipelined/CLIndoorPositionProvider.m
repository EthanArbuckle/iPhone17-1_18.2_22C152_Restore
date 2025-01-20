@interface CLIndoorPositionProvider
- (BOOL)withinQueueCanReinitializeRemoteState;
- (CLIndoorPositionProvider)initWithApiKey:(id)a3;
- (CLIndoorPositionProvider)initWithApiKey:(id)a3 onServer:(id)a4;
- (CLIndoorPositionProvider)initWithConnection:(id)a3;
- (ServiceState)state;
- (id)endpointName;
- (id)remoteObjectProtocol;
- (id)withinQueuePermanentShutdownReason;
- (void)clVisionNotificationAvailable:(id)a3;
- (void)clpOutdoorEstimatorLogEntryNotificationAvailable:(id)a3;
- (void)gpsEstimateAvailable:(id)a3;
- (void)gpsSignalQualityAvailable:(id)a3;
- (void)outdoorLocationAvailable:(id)a3;
- (void)playbackDatarun:(id)a3;
- (void)setApiKey:(id)a3;
- (void)setApiKey:(id)a3 onServer:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setState:(id)a3;
- (void)startUpdatingLocationAtLocation:(id)a3;
- (void)stopUpdatingLocation;
- (void)withinQueueInvalidateState;
- (void)withinQueueReinitializeRemoteState;
- (void)withinQueueSetDelegate:(id)a3;
@end

@implementation CLIndoorPositionProvider

- (CLIndoorPositionProvider)initWithApiKey:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLIndoorPositionProvider;
  v3 = [(CLIndoorXPCProvider *)&v7 init];
  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_1004529D0);
    v4 = qword_10047BEF0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_INFO)) {
      return v3;
    }
    goto LABEL_3;
  }
  v4 = qword_10047BEF0;
  if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Deprecated API.  Please call regular -init instead", v6, 2u);
  }
  return v3;
}

- (CLIndoorPositionProvider)initWithApiKey:(id)a3 onServer:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CLIndoorPositionProvider;
  v4 = [(CLIndoorXPCProvider *)&v8 init];
  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_1004529D0);
    v5 = qword_10047BEF0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_INFO)) {
      return v4;
    }
    goto LABEL_3;
  }
  v5 = qword_10047BEF0;
  if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)objc_super v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Deprecated API.  Please call regular -init instead", v7, 2u);
  }
  return v4;
}

- (CLIndoorPositionProvider)initWithConnection:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLIndoorPositionProvider;
  v5 = [(CLIndoorXPCProvider *)&v9 initWithConnection:v4];
  if (v5)
  {
    v6 = objc_alloc_init(ServiceState);
    state = v5->_state;
    v5->_state = v6;
  }
  return v5;
}

- (id)remoteObjectProtocol
{
  return &OBJC_PROTOCOL___CLIndoorProtocolPrivate;
}

- (id)endpointName
{
  return @"com.apple.pipelined";
}

- (id)withinQueuePermanentShutdownReason
{
  v2 = [(ServiceState *)self->_state delegateProxy];
  v3 = [v2 shutdownReason];

  return v3;
}

- (BOOL)withinQueueCanReinitializeRemoteState
{
  return self->_state != 0;
}

- (void)withinQueueInvalidateState
{
}

- (void)withinQueueReinitializeRemoteState
{
  id v6 = [(CLIndoorPositionProvider *)self state];
  v3 = [v6 delegateProxy];
  id v4 = [v3 delegate];
  [(CLIndoorPositionProvider *)self withinQueueSetDelegate:v4];

  id v7 = [(CLIndoorPositionProvider *)self state];
  LODWORD(v3) = [v7 updateLocation];

  if (v3)
  {
    id v8 = [(CLIndoorPositionProvider *)self state];
    [v8 setUpdateLocation:0];

    id v9 = [(CLIndoorPositionProvider *)self state];
    v5 = [v9 lastLocation];
    [(CLIndoorPositionProvider *)self startUpdatingLocationAtLocation:v5];
  }
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B830C;
  v7[3] = &unk_100452830;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(frameworkQueue, v7);
}

- (void)withinQueueSetDelegate:(id)a3
{
  id v9 = a3;
  id v4 = [[IndoorProtocolProxy alloc] initWithDelegate:v9];
  v5 = [(CLIndoorPositionProvider *)self state];
  [v5 setDelegateProxy:v4];

  id v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CLIndoorDelegateProtocolInternal];
  [(NSXPCConnection *)self->super._connection setExportedInterface:v6];

  id v7 = [(CLIndoorPositionProvider *)self state];
  id v8 = [v7 delegateProxy];
  [(NSXPCConnection *)self->super._connection setExportedObject:v8];
}

- (void)setApiKey:(id)a3
{
  id v3 = a3;
  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_1004529D0);
    id v4 = qword_10047BEF0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v4 = qword_10047BEF0;
  if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_ERROR))
  {
LABEL_3:
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "This API is deprecated. Please stop using", v5, 2u);
  }
LABEL_4:
}

- (void)setApiKey:(id)a3 onServer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_1004529D0);
    id v7 = qword_10047BEF0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v7 = qword_10047BEF0;
  if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_ERROR))
  {
LABEL_3:
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "This API is deprecated. Please stop using", v8, 2u);
  }
LABEL_4:
}

- (void)playbackDatarun:(id)a3
{
  id v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3321888768;
  v9[2] = sub_1000B86C4;
  v9[3] = &unk_100452850;
  id v6 = self;
  id v7 = v4;
  v10 = v6;
  id v11 = v7;
  id v8 = v6;
  dispatch_async(frameworkQueue, v9);
}

- (void)startUpdatingLocationAtLocation:(id)a3
{
  id v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3321888768;
  v9[2] = sub_1000B8964;
  v9[3] = &unk_100452880;
  id v6 = self;
  id v7 = v4;
  v10 = v6;
  id v11 = v7;
  id v8 = v6;
  dispatch_async(frameworkQueue, v9);
}

- (void)stopUpdatingLocation
{
  frameworkQueue = self->super._frameworkQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_1000B8E24;
  block[3] = &unk_1004528B0;
  id v5 = self;
  id v3 = v5;
  dispatch_async(frameworkQueue, block);
}

- (void)outdoorLocationAvailable:(id)a3
{
  id v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3321888768;
  v9[2] = sub_1000B9160;
  v9[3] = &unk_1004528E0;
  id v6 = self;
  id v7 = v4;
  v10 = v6;
  id v11 = v7;
  id v8 = v6;
  dispatch_async(frameworkQueue, v9);
}

- (void)gpsEstimateAvailable:(id)a3
{
  id v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3321888768;
  v9[2] = sub_1000B9620;
  v9[3] = &unk_100452910;
  id v6 = self;
  id v7 = v4;
  v10 = v6;
  id v11 = v7;
  id v8 = v6;
  dispatch_sync(frameworkQueue, v9);
}

- (void)gpsSignalQualityAvailable:(id)a3
{
  id v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3321888768;
  v9[2] = sub_1000B9884;
  v9[3] = &unk_100452940;
  id v6 = self;
  id v7 = v4;
  v10 = v6;
  id v11 = v7;
  id v8 = v6;
  dispatch_sync(frameworkQueue, v9);
}

- (void)clVisionNotificationAvailable:(id)a3
{
  id v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3321888768;
  v9[2] = sub_1000B9AE8;
  v9[3] = &unk_100452970;
  id v6 = self;
  id v7 = v4;
  v10 = v6;
  id v11 = v7;
  id v8 = v6;
  dispatch_sync(frameworkQueue, v9);
}

- (void)clpOutdoorEstimatorLogEntryNotificationAvailable:(id)a3
{
  id v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3321888768;
  v9[2] = sub_1000B9D4C;
  v9[3] = &unk_1004529A0;
  id v6 = self;
  id v7 = v4;
  v10 = v6;
  id v11 = v7;
  id v8 = v6;
  dispatch_sync(frameworkQueue, v9);
}

- (ServiceState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end