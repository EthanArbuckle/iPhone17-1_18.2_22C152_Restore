@interface CMStrideCalLocationFSM
- (CMStrideCalLocationFSMDelegate)delegate;
- (int)locationState;
- (int)originDeviceToGpsSource:(int)a3 locationType:(int)a4;
- (void)dealloc;
- (void)feedGpsOdometerData:(const NotificationData *)a3;
- (void)feedLocationData:(const void *)a3;
- (void)feedPedometerData:(const NotificationData *)a3;
- (void)requestTransitionToLocationState:(int)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CMStrideCalLocationFSM

- (int)locationState
{
  return self->fLocationState;
}

- (void)feedPedometerData:(const NotificationData *)a3
{
  if (self->fLocationState >= 2)
  {
    memcpy(v4, a3, sizeof(v4));
    [(CalTrackFinder *)self->fTrackFinder updatePedometerBuffer:v4];
  }
}

- (void)dealloc
{
  [(CalTrackFinder *)self->fTrackFinder stop];

  v3.receiver = self;
  v3.super_class = (Class)CMStrideCalLocationFSM;
  [(CMStrideCalLocationFSM *)&v3 dealloc];
}

- (void)requestTransitionToLocationState:(int)a3
{
  if (qword_102419030 != -1) {
    dispatch_once(&qword_102419030, &stru_1022F3100);
  }
  v5 = qword_102419038;
  if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
  {
    int fLocationState = self->fLocationState;
    *(_DWORD *)buf = 67109376;
    int v19 = fLocationState;
    __int16 v20 = 1024;
    int v21 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "fLocationState %d state %d", buf, 0xEu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022F3100);
    }
    int v11 = self->fLocationState;
    int v14 = 67109376;
    int v15 = v11;
    __int16 v16 = 1024;
    int v17 = a3;
    v12 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalLocationFSM requestTransitionToLocationState:]", "%s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
  int v7 = self->fLocationState;
  if (v7 != a3 && (a3 == 1 || v7))
  {
    fTrackFinder = self->fTrackFinder;
    if (a3 < 2)
    {
      [(CalTrackFinder *)fTrackFinder stop];

      self->fTrackFinder = 0;
    }
    else if (!fTrackFinder)
    {
      v9 = objc_alloc_init(CalTrackFinder);
      self->fTrackFinder = v9;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100D1D6C0;
      v13[3] = &unk_1022F30E0;
      v13[4] = self;
      [(CalTrackFinder *)v9 setCalTrackHandler:v13];
    }
    uint64_t v10 = self->fLocationState;
    self->int fLocationState = a3;
    [(CMStrideCalLocationFSM *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [(CMStrideCalLocationFSMDelegate *)[(CMStrideCalLocationFSM *)self delegate] fsm:self didTransitionFromState:v10 toState:self->fLocationState];
    }
  }
}

- (int)originDeviceToGpsSource:(int)a3 locationType:(int)a4
{
  sub_100103240();
  int v6 = sub_10010145C();
  int v7 = 4 * (a4 == 3);
  if (a4 == 1) {
    int v7 = 2;
  }
  if (a4 == 3) {
    int v8 = 3;
  }
  else {
    int v8 = 0;
  }
  if (a4 == 1) {
    int v8 = 1;
  }
  if (a3 != 1) {
    int v8 = 0;
  }
  if (a3 != 2) {
    int v7 = v8;
  }
  if (a4 == 3) {
    int v9 = 3;
  }
  else {
    int v9 = 0;
  }
  if (a4 == 1)
  {
    int v9 = 1;
    int v10 = 2;
  }
  else
  {
    int v10 = 4 * (a4 == 3);
  }
  if (a3 != 1) {
    int v10 = 0;
  }
  if (a3 == 2) {
    int v10 = v9;
  }
  if (v6) {
    return v10;
  }
  else {
    return v7;
  }
}

- (void)feedLocationData:(const void *)a3
{
  if (self->fLocationState >= 2 && (*((_DWORD *)a3 + 24) | 2) == 3)
  {
    int v5 = -[CMStrideCalLocationFSM originDeviceToGpsSource:locationType:](self, "originDeviceToGpsSource:locationType:", *((unsigned int *)a3 + 128));
    if (self->fSource != v5)
    {
      self->fSource = v5;
      [(CMStrideCalLocationFSM *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [(CMStrideCalLocationFSMDelegate *)[(CMStrideCalLocationFSM *)self delegate] fsm:self didUpdateSource:self->fSource];
      }
    }
    double v6 = *(double *)((char *)a3 + 76);
    id v7 = objc_alloc((Class)CLLocation);
    long long v8 = *((_OWORD *)a3 + 7);
    v12[6] = *((_OWORD *)a3 + 6);
    v12[7] = v8;
    v13[0] = *((_OWORD *)a3 + 8);
    *(_OWORD *)((char *)v13 + 12) = *(_OWORD *)((char *)a3 + 140);
    long long v9 = *((_OWORD *)a3 + 3);
    v12[2] = *((_OWORD *)a3 + 2);
    v12[3] = v9;
    long long v10 = *((_OWORD *)a3 + 5);
    v12[4] = *((_OWORD *)a3 + 4);
    v12[5] = v10;
    long long v11 = *((_OWORD *)a3 + 1);
    v12[0] = *(_OWORD *)a3;
    v12[1] = v11;
    -[CalTrackFinder updateGpsLocationBuffer:gpsSource:](self->fTrackFinder, "updateGpsLocationBuffer:gpsSource:", [v7 initWithClientLocation:v12], self->fSource);
    [(CMStrideCalLocationFSM *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [(CMStrideCalLocationFSMDelegate *)[(CMStrideCalLocationFSM *)self delegate] fsm:self didUpdateLocationAtTime:v6];
    }
  }
}

- (void)feedGpsOdometerData:(const NotificationData *)a3
{
  if (self->fLocationState >= 2)
  {
    long long v3 = *((_OWORD *)a3 + 9);
    v9[8] = *((_OWORD *)a3 + 8);
    v9[9] = v3;
    long long v4 = *((_OWORD *)a3 + 11);
    v9[10] = *((_OWORD *)a3 + 10);
    v9[11] = v4;
    long long v5 = *((_OWORD *)a3 + 5);
    v9[4] = *((_OWORD *)a3 + 4);
    v9[5] = v5;
    long long v6 = *((_OWORD *)a3 + 7);
    v9[6] = *((_OWORD *)a3 + 6);
    v9[7] = v6;
    long long v7 = *((_OWORD *)a3 + 1);
    v9[0] = *(_OWORD *)a3;
    v9[1] = v7;
    long long v8 = *((_OWORD *)a3 + 3);
    v9[2] = *((_OWORD *)a3 + 2);
    v9[3] = v8;
    [(CalTrackFinder *)self->fTrackFinder updateGpsOdometerBuffer:v9];
  }
}

- (CMStrideCalLocationFSMDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CMStrideCalLocationFSMDelegate *)a3;
}

@end