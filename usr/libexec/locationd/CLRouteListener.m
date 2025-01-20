@interface CLRouteListener
- (id).cxx_construct;
- (id)initInUniverse:(id)a3 withDelegate:(INotifier *)a4;
- (void)clearLocationData;
- (void)dealloc;
- (void)disable;
- (void)enable;
- (void)logRoute:(id)a3;
- (void)logState:(id)a3;
- (void)logTransitRoute:(id)a3;
- (void)navigationListener:(id)a3 didUpdateGuidanceState:(id)a4;
- (void)navigationListener:(id)a3 didUpdateRouteSummary:(id)a4;
- (void)navigationListener:(id)a3 didUpdateTransitSummary:(id)a4;
- (void)notifyFromLastInfo;
- (void)onDarwinNotification:(int)a3 data:(id)a4;
@end

@implementation CLRouteListener

- (id)initInUniverse:(id)a3 withDelegate:(INotifier *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CLRouteListener;
  v6 = [(CLRouteListener *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_parentNotifier = a4;
    v6->_universe = (CLIntersiloUniverse *)a3;
    v6->_silo = (CLDispatchSilo *)[a3 silo];
    v7->_enabled = 0;
    *(_OWORD *)&v7->_lastEtaInSeconds = xmmword_101D1C320;
    v7->_lastCoordinate = ($AB5116BA7E623E054F959CECB034F4E7)xmmword_101D2CCA8;
    v7->_geoNavListener = (GEONavigationListener *)[objc_alloc((Class)GEONavigationListener) initWithQueue:-[CLDispatchSilo queue](v7->_silo, "queue")];
    sub_101389C2C();
  }
  return 0;
}

- (void)dealloc
{
  [(GEONavigationListener *)self->_geoNavListener setDelegate:0];

  self->_geoNavListener = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLRouteListener;
  [(CLRouteListener *)&v3 dealloc];
}

- (void)enable
{
  if (self->_enabled) {
    sub_101A6C9E4();
  }
  [(GEONavigationListener *)self->_geoNavListener setDelegate:self];
  self->_enabled = 1;
  [(GEONavigationListener *)self->_geoNavListener requestRouteSummary];
  [(GEONavigationListener *)self->_geoNavListener requestTransitSummary];
  [(GEONavigationListener *)self->_geoNavListener requestGuidanceState];
  if (qword_102419380 != -1) {
    dispatch_once(&qword_102419380, &stru_1022C7838);
  }
  objc_super v3 = qword_102419388;
  if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLC: Enabled", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419380 != -1) {
      dispatch_once(&qword_102419380, &stru_1022C7838);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener enable]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
}

- (void)disable
{
  if (self->_enabled)
  {
    if (qword_102419380 != -1) {
      dispatch_once(&qword_102419380, &stru_1022C7838);
    }
    objc_super v3 = qword_102419388;
    if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLC: Disable", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419380 != -1) {
        dispatch_once(&qword_102419380, &stru_1022C7838);
      }
      v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener disable]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
    self->_enabled = 0;
    [(GEONavigationListener *)self->_geoNavListener setDelegate:0];
  }
  else
  {
    if (qword_102419380 != -1) {
      dispatch_once(&qword_102419380, &stru_1022C7838);
    }
    v4 = qword_102419388;
    if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#Warning CLC: Disable CLRouteListener when already disabled, shutdown?", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419380 != -1) {
        dispatch_once(&qword_102419380, &stru_1022C7838);
      }
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener disable]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
}

- (void)clearLocationData
{
  self->_lastEtaInSeconds = -1.0;
  self->_lastCoordinate = ($AB5116BA7E623E054F959CECB034F4E7)xmmword_101D2CCA8;
}

- (void)notifyFromLastInfo
{
  if (self->_lastEtaInSeconds != -1.0)
  {
    v3.n128_f64[0] = CFAbsoluteTimeGetCurrent();
    double v4 = self->_lastEtaInSeconds + self->_lastEtaAbsTime;
    if (v3.n128_f64[0] < v4)
    {
      double v5 = v4 - v3.n128_f64[0];
      self->_lastEtaInSeconds = v5;
      *(void *)&self->_lastEtaAbsTime = v3.n128_u64[0];
      v6 = (void (*)(__n128))*((void *)self->_parentNotifier->var0 + 2);
      v3.n128_f64[0] = v5;
      v6(v3);
      return;
    }
    self->_lastEtaInSeconds = -1.0;
  }
  v7 = (void (*)(void))*((void *)self->_parentNotifier->var0 + 3);

  v7();
}

- (void)navigationListener:(id)a3 didUpdateRouteSummary:(id)a4
{
  [(CLDispatchSilo *)self->_silo assertInside];
  if (qword_102419380 != -1) {
    dispatch_once(&qword_102419380, &stru_1022C7838);
  }
  v6 = qword_102419388;
  if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEFAULT))
  {
    BOOL enabled = self->_enabled;
    BOOL v8 = [a4 transportType] == 1;
    unsigned int v9 = [a4 hasDestination];
    BOOL v10 = self->_lastEtaInSeconds == -1.0;
    *(_DWORD *)buf = 67240960;
    BOOL v21 = enabled;
    __int16 v22 = 1026;
    BOOL v23 = v8;
    __int16 v24 = 1026;
    unsigned int v25 = v9;
    __int16 v26 = 1026;
    BOOL v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CLC: Received a route, %{public}d,%{public}d,%{public}d,%{public}d", buf, 0x1Au);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419380 != -1) {
      dispatch_once(&qword_102419380, &stru_1022C7838);
    }
    [a4 transportType];
    [a4 hasDestination];
    v18 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener navigationListener:didUpdateRouteSummary:]", "%s\n", v18);
    if (v18 != (char *)buf) {
      free(v18);
    }
  }
  if (self->_enabled)
  {
    [(CLRouteListener *)self logRoute:a4];
    if ([a4 transportType] == 1)
    {
      [a4 travelTime];
      self->_lastEtaInSeconds = v11;
      self->_lastEtaAbsTime = CFAbsoluteTimeGetCurrent();
      if ([a4 hasDestination])
      {
        [objc_msgSend(objc_msgSend(objc_msgSend(a4, "destination"), "latLng"), "lat");
        self->_lastCoordinate.latitude = v12;
        id v13 = [a4 destination];
      }
      else
      {
        if (![a4 hasOrigin])
        {
          if (qword_102419380 != -1) {
            dispatch_once(&qword_102419380, &stru_1022C7838);
          }
          v16 = qword_102419388;
          if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#Warning CLC: Starting route without an appoximate location", buf, 2u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_102419380 != -1) {
              dispatch_once(&qword_102419380, &stru_1022C7838);
            }
            v19 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener navigationListener:didUpdateRouteSummary:]", "%s\n", v19);
            if (v19 != (char *)buf) {
              free(v19);
            }
          }
          goto LABEL_20;
        }
        [objc_msgSend(objc_msgSend(objc_msgSend(a4, "origin"), "latLng"), "lat");
        self->_lastCoordinate.latitude = v14;
        id v13 = [a4 origin];
      }
      [objc_msgSend(v13, "latLng") lng];
      self->_lastCoordinate.longitude = v15;
LABEL_20:
      parentNotifier = self->_parentNotifier;
      [a4 travelTime];
      (*((void (**)(INotifier *, $AB5116BA7E623E054F959CECB034F4E7 *))parentNotifier->var0 + 2))(parentNotifier, &self->_lastCoordinate);
      return;
    }
    if (self->_lastEtaInSeconds != -1.0)
    {
      self->_lastEtaInSeconds = -1.0;
      (*((void (**)(INotifier *))self->_parentNotifier->var0 + 3))(self->_parentNotifier);
    }
  }
}

- (void)navigationListener:(id)a3 didUpdateTransitSummary:(id)a4
{
  [(CLDispatchSilo *)self->_silo assertInside];
  if (qword_102419380 != -1) {
    dispatch_once(&qword_102419380, &stru_1022C7838);
  }
  v6 = qword_102419388;
  if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "CLC: Received a transit route", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419380 != -1) {
      dispatch_once(&qword_102419380, &stru_1022C7838);
    }
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener navigationListener:didUpdateTransitSummary:]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  if (self->_enabled) {
    [(CLRouteListener *)self logTransitRoute:a4];
  }
}

- (void)navigationListener:(id)a3 didUpdateGuidanceState:(id)a4
{
  [(CLDispatchSilo *)self->_silo assertInside];
  if (qword_102419380 != -1) {
    dispatch_once(&qword_102419380, &stru_1022C7838);
  }
  v6 = qword_102419388;
  if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEFAULT))
  {
    BOOL enabled = self->_enabled;
    BOOL v8 = [a4 guidanceLevel] != 2;
    unsigned int v9 = [a4 hasGuidanceLevel];
    BOOL v10 = self->_lastEtaInSeconds == -1.0;
    *(_DWORD *)buf = 67240960;
    BOOL v20 = enabled;
    __int16 v21 = 1026;
    BOOL v22 = v8;
    __int16 v23 = 1026;
    unsigned int v24 = v9;
    __int16 v25 = 1026;
    BOOL v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CLC: Received a state change, %{public}d,%{public}d,%{public}d,%{public}d", buf, 0x1Au);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419380 != -1) {
      dispatch_once(&qword_102419380, &stru_1022C7838);
    }
    [a4 guidanceLevel];
    [a4 hasGuidanceLevel];
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener navigationListener:didUpdateGuidanceState:]", "%s\n", v17);
    if (v17 != (char *)buf) {
      free(v17);
    }
  }
  if (self->_enabled)
  {
    [(CLRouteListener *)self logState:a4];
    if (self->_lastEtaInSeconds != -1.0
      && [a4 hasGuidanceLevel]
      && [a4 guidanceLevel] != 2)
    {
      self->_lastEtaInSeconds = -1.0;
      (*((void (**)(INotifier *))self->_parentNotifier->var0 + 3))(self->_parentNotifier);
    }
    if ([a4 hasNavigationState])
    {
      parentNotifier = self->_parentNotifier;
      id v12 = [a4 navigationState];
      int v13 = (int)v12;
      if (v12 >= 9)
      {
        if (qword_102419380 != -1) {
          dispatch_once(&qword_102419380, &stru_1022C7838);
        }
        double v15 = qword_102419388;
        if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          BOOL v20 = v13;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "CLC: Received a unsupported GEONavigationState, %d", buf, 8u);
        }
        BOOL v16 = sub_10013D1A0(115, 0);
        id v14 = 0;
        if (v16)
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419380 != -1) {
            dispatch_once(&qword_102419380, &stru_1022C7838);
          }
          v18 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 0, "CLClientNavigationState GEONavigationStateToCLClientNavigationState(const GEONavigationState)", "%s\n", v18);
          if (v18 != (char *)buf) {
            free(v18);
          }
          id v14 = 0;
        }
      }
      else
      {
        id v14 = v12;
      }
      (*((void (**)(INotifier *, id))parentNotifier->var0 + 4))(parentNotifier, v14);
    }
  }
}

- (void)logRoute:(id)a3
{
  if ([a3 hasTransportType])
  {
    if (qword_102419380 != -1) {
      dispatch_once(&qword_102419380, &stru_1022C7838);
    }
    double v4 = qword_102419388;
    if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v5 = [a3 transportType];
      id v6 = [a3 transportType];
      if (v6 >= 7) {
        v7 = +[NSString stringWithFormat:@"(unknown: %i)", v6];
      }
      else {
        v7 = off_1022C78C0[(int)v6];
      }
      *(_DWORD *)buf = 67174915;
      LODWORD(v21[0]) = v5;
      WORD2(v21[0]) = 2113;
      *(void *)((char *)v21 + 6) = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "CLC: Route type        : %{private}d, %{private}@", buf, 0x12u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419380 != -1) {
        dispatch_once(&qword_102419380, &stru_1022C7838);
      }
      [a3 transportType];
      id v14 = [a3 transportType];
      if (v14 >= 7) {
        +[NSString stringWithFormat:@"(unknown: %i)", v14];
      }
      v19 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener logRoute:]", "%s\n", v19);
      if (v19 != (char *)buf) {
        free(v19);
      }
    }
  }
  if ([a3 hasOrigin])
  {
    if (qword_102419380 != -1) {
      dispatch_once(&qword_102419380, &stru_1022C7838);
    }
    BOOL v8 = qword_102419388;
    if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446210;
      v21[0] = "Has origin";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "CLC: Route origin      : %{public}s", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419380 != -1) {
        dispatch_once(&qword_102419380, &stru_1022C7838);
      }
      double v15 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener logRoute:]", "%s\n", v15);
      if (v15 != (char *)buf) {
        free(v15);
      }
    }
  }
  if ([a3 hasDestination])
  {
    if (qword_102419380 != -1) {
      dispatch_once(&qword_102419380, &stru_1022C7838);
    }
    unsigned int v9 = qword_102419388;
    if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446210;
      v21[0] = "Has destination";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "CLC: Route destination : %{public}s", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419380 != -1) {
        dispatch_once(&qword_102419380, &stru_1022C7838);
      }
      BOOL v16 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener logRoute:]", "%s\n", v16);
      if (v16 != (char *)buf) {
        free(v16);
      }
    }
  }
  if ([a3 hasDestinationName])
  {
    if (qword_102419380 != -1) {
      dispatch_once(&qword_102419380, &stru_1022C7838);
    }
    BOOL v10 = qword_102419388;
    if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEBUG))
    {
      id v11 = [a3 destinationName];
      *(_DWORD *)buf = 138477827;
      v21[0] = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "CLC: Route dest name   : %{private}@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419380 != -1) {
        dispatch_once(&qword_102419380, &stru_1022C7838);
      }
      [a3 destinationName];
      v17 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener logRoute:]", "%s\n", v17);
      if (v17 != (char *)buf) {
        free(v17);
      }
    }
  }
  if ([a3 hasTravelTime])
  {
    if (qword_102419380 != -1) {
      dispatch_once(&qword_102419380, &stru_1022C7838);
    }
    id v12 = qword_102419388;
    if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEBUG))
    {
      [a3 travelTime];
      *(_DWORD *)buf = 134283521;
      v21[0] = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "CLC: Route travel time : %{private}.01lf", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419380 != -1) {
        dispatch_once(&qword_102419380, &stru_1022C7838);
      }
      [a3 travelTime];
      v18 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener logRoute:]", "%s\n", v18);
      if (v18 != (char *)buf) {
        free(v18);
      }
    }
  }
}

- (void)logTransitRoute:(id)a3
{
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v3 = [a3 possibleStops];
  id v4 = [v3 countByEnumeratingWithState:&v81 objects:v90 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v82;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v82 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v81 + 1) + 8 * (void)v7);
        if (qword_102419380 != -1) {
          dispatch_once(&qword_102419380, &stru_1022C7838);
        }
        unsigned int v9 = qword_102419388;
        if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "CLC: Transit Stop:", buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419380 != -1) {
            dispatch_once(&qword_102419380, &stru_1022C7838);
          }
          LOWORD(v86) = 0;
          v17 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v17);
          if (v17 != (char *)buf) {
            free(v17);
          }
        }
        if ([v8 hasStopID])
        {
          if (qword_102419380 != -1) {
            dispatch_once(&qword_102419380, &stru_1022C7838);
          }
          BOOL v10 = qword_102419388;
          if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEBUG))
          {
            id v11 = [v8 stopID];
            *(_DWORD *)buf = 134283521;
            id v89 = v11;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "CLC:     ID  : %{private}llu", buf, 0xCu);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_102419380 != -1) {
              dispatch_once(&qword_102419380, &stru_1022C7838);
            }
            id v18 = [v8 stopID];
            int v86 = 134283521;
            id v87 = v18;
            v19 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v19);
            if (v19 != (char *)buf) {
              free(v19);
            }
          }
        }
        if ([v8 hasCoordinate])
        {
          id v12 = [v8 coordinate];
          if (qword_102419380 != -1) {
            dispatch_once(&qword_102419380, &stru_1022C7838);
          }
          uint64_t v13 = qword_102419388;
          if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEBUG))
          {
            [v12 lat];
            *(_DWORD *)buf = 134283521;
            id v89 = v14;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "CLC:     LAT : %{private}lf", buf, 0xCu);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_102419380 != -1) {
              dispatch_once(&qword_102419380, &stru_1022C7838);
            }
            [v12 lat];
            int v86 = 134283521;
            id v87 = v20;
            __int16 v21 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v21);
            if (v21 != (char *)buf) {
              free(v21);
            }
          }
          if (qword_102419380 != -1) {
            dispatch_once(&qword_102419380, &stru_1022C7838);
          }
          double v15 = qword_102419388;
          if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEBUG))
          {
            [v12 lng];
            *(_DWORD *)buf = 134283521;
            id v89 = v16;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "CLC:     LON : %{private}lf", buf, 0xCu);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_102419380 != -1) {
              dispatch_once(&qword_102419380, &stru_1022C7838);
            }
            [v12 lng];
            int v86 = 134283521;
            id v87 = v22;
            __int16 v23 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v23);
            if (v23 != (char *)buf) {
              free(v23);
            }
          }
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v24 = [v3 countByEnumeratingWithState:&v81 objects:v90 count:16];
      id v5 = v24;
    }
    while (v24);
  }
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id obja = [a3 scheduledLinks];
  id v25 = [obja countByEnumeratingWithState:&v77 objects:v85 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v78;
    do
    {
      v28 = 0;
      do
      {
        if (*(void *)v78 != v27) {
          objc_enumerationMutation(obja);
        }
        v29 = *(void **)(*((void *)&v77 + 1) + 8 * (void)v28);
        if (qword_102419380 != -1) {
          dispatch_once(&qword_102419380, &stru_1022C7838);
        }
        v30 = qword_102419388;
        if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "CLC: Transit Link:", buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419380 != -1) {
            dispatch_once(&qword_102419380, &stru_1022C7838);
          }
          LOWORD(v86) = 0;
          v53 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v53);
          if (v53 != (char *)buf) {
            free(v53);
          }
        }
        if ([v29 hasLineID])
        {
          if (qword_102419380 != -1) {
            dispatch_once(&qword_102419380, &stru_1022C7838);
          }
          v31 = qword_102419388;
          if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEBUG))
          {
            id v32 = [v29 lineID];
            *(_DWORD *)buf = 134283521;
            id v89 = v32;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "CLC:     ID  : %{private}llu", buf, 0xCu);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_102419380 != -1) {
              dispatch_once(&qword_102419380, &stru_1022C7838);
            }
            id v54 = [v29 lineID];
            int v86 = 134283521;
            id v87 = v54;
            v55 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v55);
            if (v55 != (char *)buf) {
              free(v55);
            }
          }
        }
        if ([v29 hasScheduledDeparture])
        {
          if (qword_102419380 != -1) {
            dispatch_once(&qword_102419380, &stru_1022C7838);
          }
          v33 = qword_102419388;
          if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEBUG))
          {
            [v29 scheduledDeparture];
            *(_DWORD *)buf = 134283521;
            id v89 = v34;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "CLC:     DEP : %{private}lf", buf, 0xCu);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_102419380 != -1) {
              dispatch_once(&qword_102419380, &stru_1022C7838);
            }
            [v29 scheduledDeparture];
            int v86 = 134283521;
            id v87 = v56;
            v57 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v57);
            if (v57 != (char *)buf) {
              free(v57);
            }
          }
        }
        if ([v29 hasScheduledArrival])
        {
          if (qword_102419380 != -1) {
            dispatch_once(&qword_102419380, &stru_1022C7838);
          }
          v35 = qword_102419388;
          if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEBUG))
          {
            [v29 scheduledArrival];
            *(_DWORD *)buf = 134283521;
            id v89 = v36;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "CLC:     ARR : %{private}lf", buf, 0xCu);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_102419380 != -1) {
              dispatch_once(&qword_102419380, &stru_1022C7838);
            }
            [v29 scheduledArrival];
            int v86 = 134283521;
            id v87 = v58;
            v59 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v59);
            if (v59 != (char *)buf) {
              free(v59);
            }
          }
        }
        if ([v29 hasStopFrom])
        {
          if (qword_102419380 != -1) {
            dispatch_once(&qword_102419380, &stru_1022C7838);
          }
          v37 = qword_102419388;
          if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "CLC:     Stop From :", buf, 2u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_102419380 != -1) {
              dispatch_once(&qword_102419380, &stru_1022C7838);
            }
            LOWORD(v86) = 0;
            v60 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v60);
            if (v60 != (char *)buf) {
              free(v60);
            }
          }
          if (objc_msgSend(objc_msgSend(v29, "stopFrom"), "hasStopID"))
          {
            if (qword_102419380 != -1) {
              dispatch_once(&qword_102419380, &stru_1022C7838);
            }
            v38 = qword_102419388;
            if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEBUG))
            {
              id v39 = [objc_msgSend(v29, "stopFrom") stopID];
              *(_DWORD *)buf = 134283521;
              id v89 = v39;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "CLC:         ID  : %{private}llu", buf, 0xCu);
            }
            if (sub_10013D1A0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_102419380 != -1) {
                dispatch_once(&qword_102419380, &stru_1022C7838);
              }
              id v62 = [objc_msgSend(v29, "stopFrom") stopID];
              int v86 = 134283521;
              id v87 = v62;
              v63 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v63);
              if (v63 != (char *)buf) {
                free(v63);
              }
            }
          }
          if (objc_msgSend(objc_msgSend(v29, "stopFrom"), "hasCoordinate"))
          {
            id v40 = [objc_msgSend(v29, "stopFrom") coordinate];
            if (qword_102419380 != -1) {
              dispatch_once(&qword_102419380, &stru_1022C7838);
            }
            v41 = qword_102419388;
            if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEBUG))
            {
              [v40 lat];
              *(_DWORD *)buf = 134283521;
              id v89 = v42;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "CLC:         LAT : %{private}lf", buf, 0xCu);
            }
            if (sub_10013D1A0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_102419380 != -1) {
                dispatch_once(&qword_102419380, &stru_1022C7838);
              }
              [v40 lat];
              int v86 = 134283521;
              id v87 = v64;
              v65 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v65);
              if (v65 != (char *)buf) {
                free(v65);
              }
            }
            if (qword_102419380 != -1) {
              dispatch_once(&qword_102419380, &stru_1022C7838);
            }
            v43 = qword_102419388;
            if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEBUG))
            {
              [v40 lng];
              *(_DWORD *)buf = 134283521;
              id v89 = v44;
              _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "CLC:         LON : %{private}lf", buf, 0xCu);
            }
            if (sub_10013D1A0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_102419380 != -1) {
                dispatch_once(&qword_102419380, &stru_1022C7838);
              }
              [v40 lng];
              int v86 = 134283521;
              id v87 = v66;
              v67 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v67);
              if (v67 != (char *)buf) {
                free(v67);
              }
            }
          }
        }
        if ([v29 hasStopTo])
        {
          if (qword_102419380 != -1) {
            dispatch_once(&qword_102419380, &stru_1022C7838);
          }
          v45 = qword_102419388;
          if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "CLC:     Stop To :", buf, 2u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_102419380 != -1) {
              dispatch_once(&qword_102419380, &stru_1022C7838);
            }
            LOWORD(v86) = 0;
            v61 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v61);
            if (v61 != (char *)buf) {
              free(v61);
            }
          }
          if (objc_msgSend(objc_msgSend(v29, "stopTo"), "hasStopID"))
          {
            if (qword_102419380 != -1) {
              dispatch_once(&qword_102419380, &stru_1022C7838);
            }
            v46 = qword_102419388;
            if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEBUG))
            {
              id v47 = [objc_msgSend(v29, "stopTo") stopID];
              *(_DWORD *)buf = 134283521;
              id v89 = v47;
              _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "CLC:         ID  : %{private}llu", buf, 0xCu);
            }
            if (sub_10013D1A0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_102419380 != -1) {
                dispatch_once(&qword_102419380, &stru_1022C7838);
              }
              id v68 = [objc_msgSend(v29, "stopTo") stopID];
              int v86 = 134283521;
              id v87 = v68;
              v69 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v69);
              if (v69 != (char *)buf) {
                free(v69);
              }
            }
          }
          if (objc_msgSend(objc_msgSend(v29, "stopFrom"), "hasCoordinate"))
          {
            id v48 = [objc_msgSend(v29, "stopTo") coordinate];
            if (qword_102419380 != -1) {
              dispatch_once(&qword_102419380, &stru_1022C7838);
            }
            v49 = qword_102419388;
            if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEBUG))
            {
              [v48 lat];
              *(_DWORD *)buf = 134283521;
              id v89 = v50;
              _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "CLC:         LAT : %{private}lf", buf, 0xCu);
            }
            if (sub_10013D1A0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_102419380 != -1) {
                dispatch_once(&qword_102419380, &stru_1022C7838);
              }
              [v48 lat];
              int v86 = 134283521;
              id v87 = v70;
              v71 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v71);
              if (v71 != (char *)buf) {
                free(v71);
              }
            }
            if (qword_102419380 != -1) {
              dispatch_once(&qword_102419380, &stru_1022C7838);
            }
            v51 = qword_102419388;
            if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEBUG))
            {
              [v48 lng];
              *(_DWORD *)buf = 134283521;
              id v89 = v52;
              _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEBUG, "CLC:         LON : %{private}lf", buf, 0xCu);
            }
            if (sub_10013D1A0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_102419380 != -1) {
                dispatch_once(&qword_102419380, &stru_1022C7838);
              }
              [v48 lng];
              int v86 = 134283521;
              id v87 = v72;
              v73 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v73);
              if (v73 != (char *)buf) {
                free(v73);
              }
            }
          }
        }
        v28 = (char *)v28 + 1;
      }
      while (v26 != v28);
      id v74 = [obja countByEnumeratingWithState:&v77 objects:v85 count:16];
      id v26 = v74;
    }
    while (v74);
  }
}

- (void)logState:(id)a3
{
  if ([a3 hasGuidanceLevel])
  {
    if (qword_102419380 != -1) {
      dispatch_once(&qword_102419380, &stru_1022C7838);
    }
    id v4 = qword_102419388;
    if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEBUG))
    {
      id v5 = [a3 guidanceLevel];
      if (v5 >= 4) {
        uint64_t v6 = +[NSString stringWithFormat:@"(unknown: %i)", v5];
      }
      else {
        uint64_t v6 = off_1022C7858[(int)v5];
      }
      *(_DWORD *)buf = 138543362;
      BOOL v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "CLC: Guidance Level   : %{public}@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419380 != -1) {
        dispatch_once(&qword_102419380, &stru_1022C7838);
      }
      id v13 = [a3 guidanceLevel];
      if (v13 >= 4) {
        +[NSString stringWithFormat:@"(unknown: %i)", v13];
      }
      BOOL v16 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener logState:]", "%s\n", v16);
      if (v16 != (char *)buf) {
        free(v16);
      }
    }
  }
  if ([a3 hasNavigationState])
  {
    if (qword_102419380 != -1) {
      dispatch_once(&qword_102419380, &stru_1022C7838);
    }
    v7 = qword_102419388;
    if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEBUG))
    {
      id v8 = [a3 navigationState];
      if (v8 >= 9) {
        unsigned int v9 = +[NSString stringWithFormat:@"(unknown: %i)", v8];
      }
      else {
        unsigned int v9 = off_1022C7878[(int)v8];
      }
      *(_DWORD *)buf = 138543362;
      BOOL v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CLC: Navigation State : %{public}@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419380 != -1) {
        dispatch_once(&qword_102419380, &stru_1022C7838);
      }
      id v14 = [a3 navigationState];
      if (v14 >= 9) {
        +[NSString stringWithFormat:@"(unknown: %i)", v14];
      }
      v17 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener logState:]", "%s\n", v17);
      if (v17 != (char *)buf) {
        free(v17);
      }
    }
  }
  if ([a3 hasTrackedTransportType])
  {
    if (qword_102419380 != -1) {
      dispatch_once(&qword_102419380, &stru_1022C7838);
    }
    BOOL v10 = qword_102419388;
    if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEBUG))
    {
      id v11 = [a3 trackedTransportType];
      if (v11 >= 7) {
        id v12 = +[NSString stringWithFormat:@"(unknown: %i)", v11];
      }
      else {
        id v12 = off_1022C78C0[(int)v11];
      }
      *(_DWORD *)buf = 138477827;
      BOOL v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "CLC: Transport Type   : %{private}@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419380 != -1) {
        dispatch_once(&qword_102419380, &stru_1022C7838);
      }
      id v15 = [a3 trackedTransportType];
      if (v15 >= 7) {
        +[NSString stringWithFormat:@"(unknown: %i)", v15];
      }
      id v18 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener logState:]", "%s\n", v18);
      if (v18 != (char *)buf) {
        free(v18);
      }
    }
  }
}

- (void)onDarwinNotification:(int)a3 data:(id)a4
{
  if (a3 == 8)
  {
    if (qword_102419380 != -1) {
      dispatch_once(&qword_102419380, &stru_1022C7838);
    }
    id v5 = qword_102419388;
    if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CLC: navigation stopped", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419380 != -1) {
        dispatch_once(&qword_102419380, &stru_1022C7838);
      }
      uint64_t v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRouteListener onDarwinNotification:data:]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
    if (self->_lastEtaInSeconds != -1.0)
    {
      self->_lastEtaInSeconds = -1.0;
      (*((void (**)(INotifier *))self->_parentNotifier->var0 + 3))(self->_parentNotifier);
    }
  }
}

- (void).cxx_destruct
{
  value = self->_darwinNotifierClient.__ptr_.__value_;
  self->_darwinNotifierClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (id).cxx_construct
{
  *((void *)self + 8) = 0;
  return self;
}

@end