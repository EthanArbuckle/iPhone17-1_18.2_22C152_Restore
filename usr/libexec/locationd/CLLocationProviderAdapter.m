@interface CLLocationProviderAdapter
- (BOOL)syncgetIsSimulationEnabled;
- (BOOL)syncgetLocation:(id *)a3;
- (BOOL)syncgetLocationPrivate:(void *)a3;
- (BOOL)syncgetLocationUnavailable;
- (BOOL)syncgetNotification:(const int *)a3 data:(void *)a4;
- (id)syncgetName;
- (void)fetchLocationWithReply:(id)a3;
- (void)locationProvider;
- (void)register:(id)a3 forNotification:(int)a4 distanceFilter:(double)a5;
- (void)sendSimulatedLocation:(id)a3;
- (void)sendSimulatedLocationUnavailable;
- (void)setSimulationEnabled:(BOOL)a3;
- (void)shutdown;
- (void)start;
- (void)updateNotification:(int)a3 withRegistrationInfo:(id)a4 forClient:(id)a5;
@end

@implementation CLLocationProviderAdapter

- (void)updateNotification:(int)a3 withRegistrationInfo:(id)a4 forClient:(id)a5
{
  id v8 = sub_1000AC400(a4);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = [(CLNotifierServiceAdapter *)self notifierClientNumForCoparty:a5];
    v11 = [(CLLocationProviderAdapter *)self locationProvider];
    v12 = v11;
    v15[0] = a3;
    if (!v11
      || ((*(uint64_t (**)(void *, uint64_t, _DWORD *, id))(*(void *)v11 + 216))(v11, v10, v15, v9) & 1) == 0)
    {
      if (qword_102419380 != -1) {
        dispatch_once(&qword_102419380, &stru_1022C4110);
      }
      v13 = qword_102419388;
      if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        v20 = v12;
        __int16 v21 = 1024;
        int v22 = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "LocationProvider,Failed to updateRegistrationInfoForClient %p (%d)", buf, 0x12u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419380 != -1) {
          dispatch_once(&qword_102419380, &stru_1022C4110);
        }
        v15[1] = 134218240;
        v16 = v12;
        __int16 v17 = 1024;
        int v18 = v10;
        v14 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLLocationProviderAdapter updateNotification:withRegistrationInfo:forClient:]", "%s\n", v14);
        if (v14 != (char *)buf) {
          free(v14);
        }
      }
    }
  }
}

- (void)locationProvider
{
  result = [(CLNotifierServiceAdapter *)self notifier];
  if (result)
  {
  }
  return result;
}

- (void)register:(id)a3 forNotification:(int)a4 distanceFilter:(double)a5
{
  double v13 = a5;
  uint64_t v7 = [(CLNotifierServiceAdapter *)self notifierClientNumForCoparty:a3];
  id v8 = [(CLLocationProviderAdapter *)self locationProvider];
  id v9 = v8;
  int v12 = a4;
  if (!v8
    || ((*(uint64_t (**)(void *, uint64_t, int *, double *))(*(void *)v8 + 224))(v8, v7, &v12, &v13) & 1) == 0)
  {
    if (qword_102419380 != -1) {
      dispatch_once(&qword_102419380, &stru_1022C4110);
    }
    uint64_t v10 = qword_102419388;
    if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134349824;
      v23 = v9;
      __int16 v24 = 1026;
      int v25 = v7;
      __int16 v26 = 1026;
      int v27 = a4;
      __int16 v28 = 2050;
      double v29 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "LocationProvider,Failed to registerForFilteredLocation %{public}p (%{public}d, %{public}d, %{public}f)", buf, 0x22u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419380 != -1) {
        dispatch_once(&qword_102419380, &stru_1022C4110);
      }
      int v14 = 134349824;
      v15 = v9;
      __int16 v16 = 1026;
      int v17 = v7;
      __int16 v18 = 1026;
      int v19 = a4;
      __int16 v20 = 2050;
      double v21 = v13;
      v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLLocationProviderAdapter register:forNotification:distanceFilter:]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
  }
}

- (void)start
{
  if ([(CLLocationProviderAdapter *)self locationProvider])
  {
    v3 = *(void (**)(void))(*(void *)[(CLLocationProviderAdapter *)self locationProvider] + 208);
    v3();
  }
}

- (void)shutdown
{
  if ([(CLLocationProviderAdapter *)self locationProvider])
  {
    v3 = *(void (**)(void))(*(void *)[(CLLocationProviderAdapter *)self locationProvider] + 16);
    v3();
  }
}

- (void)setSimulationEnabled:(BOOL)a3
{
  if ([(CLLocationProviderAdapter *)self locationProvider])
  {
    v4 = *(void (**)(void))(*(void *)[(CLLocationProviderAdapter *)self locationProvider] + 280);
    v4();
  }
}

- (void)sendSimulatedLocation:(id)a3
{
  [objc_msgSend(a3, "gnssOdometerInfo", sub_1000DBC34(v21).n128_f64[0]) odometer];
  v21[0] = v5;
  [objc_msgSend(a3, "gnssOdometerInfo") deltaDistance];
  v21[1] = v6;
  [objc_msgSend(a3, "gnssOdometerInfo") deltaDistanceAccuracy];
  v21[2] = v7;
  [a3 trustedTimestamp];
  v21[3] = v8;
  id v9 = [(CLLocationProviderAdapter *)self locationProvider];
  if (a3)
  {
    [a3 clientLocation];
  }
  else
  {
    long long v17 = 0u;
    memset(v18, 0, 28);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0u;
  }
  v19[4] = v14;
  v19[5] = v15;
  v19[2] = v12;
  v19[3] = v13;
  *(_OWORD *)((char *)v20 + 12) = *(_OWORD *)((char *)v18 + 12);
  v19[7] = v17;
  v20[0] = v18[0];
  v19[6] = v16;
  v19[0] = v10;
  v19[1] = v11;
  (*(void (**)(void *, _OWORD *, void *))(*(void *)v9 + 264))(v9, v19, v21);
  if (v22) {
    sub_1000DB0A0(v22);
  }
}

- (void)sendSimulatedLocationUnavailable
{
  v2 = *(void (**)(void))(*(void *)[(CLLocationProviderAdapter *)self locationProvider] + 272);

  v2();
}

- (BOOL)syncgetNotification:(const int *)a3 data:(void *)a4
{
  v4 = *(uint64_t (**)(void))(*(void *)[(CLLocationProviderAdapter *)self locationProvider] + 128);

  return v4();
}

- (BOOL)syncgetLocation:(id *)a3
{
  v3 = *(uint64_t (**)(void))(*(void *)[(CLLocationProviderAdapter *)self locationProvider] + 232);

  return v3();
}

- (BOOL)syncgetLocationPrivate:(void *)a3
{
  v3 = *(uint64_t (**)(void))(*(void *)[(CLLocationProviderAdapter *)self locationProvider] + 240);

  return v3();
}

- (void)fetchLocationWithReply:(id)a3
{
  *(_DWORD *)long long v11 = 0xFFFF;
  *(_OWORD *)&v11[4] = 0uLL;
  *(_OWORD *)&v11[20] = xmmword_101D1C320;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&v11[36] = _Q0;
  *(_OWORD *)&v11[52] = _Q0;
  *(_OWORD *)&v11[68] = _Q0;
  *(_DWORD *)&v11[84] = 0;
  *(void *)&v11[88] = 0xBFF0000000000000;
  long long v12 = 0uLL;
  LODWORD(v13) = 0;
  *(void *)((char *)&v13 + 4) = 0xBFF0000000000000;
  HIDWORD(v13) = 0x7FFFFFFF;
  memset(v14, 0, 25);
  id v9 = [(CLLocationProviderAdapter *)self locationProvider];
  uint64_t v10 = (*(uint64_t (**)(void *, unsigned char *))(*(void *)v9 + 248))(v9, v11);
  long long v22 = v12;
  long long v23 = v13;
  v24[0] = *(_OWORD *)v14;
  *(_OWORD *)((char *)v24 + 12) = *(_OWORD *)&v14[12];
  long long v18 = *(_OWORD *)&v11[32];
  long long v19 = *(_OWORD *)&v11[48];
  long long v20 = *(_OWORD *)&v11[64];
  long long v21 = *(_OWORD *)&v11[80];
  long long v16 = *(_OWORD *)v11;
  long long v17 = *(_OWORD *)&v11[16];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  _DWORD v15[2] = sub_1006B9104;
  v15[3] = &unk_1022C1CA0;
  (*((void (**)(id, uint64_t, id))a3 + 2))(a3, v10, [v15 copy]);
}

- (BOOL)syncgetLocationUnavailable
{
  v2 = *(uint64_t (**)(void))(*(void *)[(CLLocationProviderAdapter *)self locationProvider] + 256);

  return v2();
}

- (BOOL)syncgetIsSimulationEnabled
{
  return *((unsigned char *)[(CLLocationProviderAdapter *)self locationProvider] + 109);
}

- (id)syncgetName
{
  v2 = [(CLLocationProviderAdapter *)self locationProvider];
  if (v2[31] < 0)
  {
    sub_1000DC48C(__p, *((void **)v2 + 1), *((void *)v2 + 2));
  }
  else
  {
    long long v3 = *(_OWORD *)(v2 + 8);
    uint64_t v8 = *((void *)v2 + 3);
    *(_OWORD *)__p = v3;
  }
  if (v8 >= 0) {
    v4 = __p;
  }
  else {
    v4 = (void **)__p[0];
  }
  uint64_t v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v4, __p[0], __p[1], v8);
  if (SHIBYTE(v8) < 0) {
    operator delete(__p[0]);
  }
  return v5;
}

@end