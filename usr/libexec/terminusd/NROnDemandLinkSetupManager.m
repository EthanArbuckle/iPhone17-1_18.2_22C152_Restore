@interface NROnDemandLinkSetupManager
- (void)didUpdatePHSState:(BOOL)a3 llphsActive:(BOOL)a4;
@end

@implementation NROnDemandLinkSetupManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validPeersForInternetRelay, 0);
  objc_storeStrong((id *)&self->_deviceIdentifierToRegistrationPSK, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_messengers, 0);
  objc_storeStrong((id *)&self->_browser, 0);
  objc_storeStrong((id *)&self->_receiver, 0);
  objc_storeStrong((id *)&self->_phsSource, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)didUpdatePHSState:(BOOL)a3 llphsActive:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (qword_1001F4828 != -1) {
    dispatch_once(&qword_1001F4828, &stru_1001C61C8);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4828 != -1) {
      dispatch_once(&qword_1001F4828, &stru_1001C61C8);
    }
    _NRLogWithArgs();
  }
  if (!self
    || !self->_subscribedForPHSStateUpdates
    || ((self->_isPHSActive ^ v5) & 1) == 0 && self->_isLLPHSActive == v4)
  {
    return;
  }
  self->_isPHSActive = v5;
  self->_isLLPHSActive = v4;
  if (!v5 && !v4)
  {
    objc_initWeak(&location, self);
    dispatch_time_t v7 = dispatch_time(0, 5000000000);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000129DC;
    block[3] = &unk_1001C7FF0;
    v9 = queue;
    objc_copyWeak(&v30, &location);
    dispatch_after(v7, v9, block);

    objc_destroyWeak(&v30);
    p_id location = &location;
LABEL_14:
    objc_destroyWeak(p_location);
    return;
  }
  *(_WORD *)&self->_isPHSProvider = 0;
  self;
  if (qword_1001F4A20 != -1) {
    dispatch_once(&qword_1001F4A20, &stru_1001C6EC8);
  }
  id v11 = (id)qword_1001F4A18;
  v12 = v11;
  if (v11) {
    v13 = (void *)*((void *)v11 + 6);
  }
  else {
    v13 = 0;
  }
  id v14 = v13;
  BOOL v15 = sub_100154E58((uint64_t)v14);

  uint64_t v16 = 13;
  if (!v15) {
    uint64_t v16 = 14;
  }
  *((unsigned char *)&self->super.isa + v16) = 1;
  v17 = sub_10015BD9C();
  dispatch_async(v17, &stru_1001C6A38);

  if (self->_phsSource)
  {
    if (self->_isPHSClient) {
      goto LABEL_24;
    }
LABEL_29:
    if (self->_isPHSProvider)
    {
      sub_100012CD8((uint64_t)self);
    }
    return;
  }
  v18 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
  dispatch_time_t v19 = dispatch_time(0, 60000000000);
  dispatch_source_set_timer(v18, v19, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  objc_initWeak(from, self);
  id location = _NSConcreteStackBlock;
  uint64_t v38 = 3221225472;
  v39 = sub_100015140;
  v40 = &unk_1001C88B8;
  objc_copyWeak((id *)&v42, from);
  v20 = v18;
  v41 = v20;
  dispatch_source_set_event_handler(v20, &location);
  dispatch_activate(v20);
  phsSource = self->_phsSource;
  self->_phsSource = (OS_dispatch_source *)v20;
  v22 = v20;

  objc_destroyWeak((id *)&v42);
  objc_destroyWeak(from);
  if (!self->_isPHSClient) {
    goto LABEL_29;
  }
LABEL_24:
  if (self->_browserActivated)
  {
    sub_100012BB4((uint64_t)self);
  }
  else if (!self->_browser)
  {
    id v23 = objc_alloc_init((Class)RPCompanionLinkClient);
    [v23 setDispatchQueue:self->_queue];
    [v23 setControlFlags:6];
    objc_initWeak(&v44, self);
    id location = _NSConcreteStackBlock;
    uint64_t v38 = 3221225472;
    v39 = sub_100014E04;
    v40 = &unk_1001C6068;
    objc_copyWeak(&v43, &v44);
    v24 = v23;
    v41 = v24;
    v42 = self;
    [v24 setDeviceFoundHandler:&location];
    from[0] = _NSConcreteStackBlock;
    from[1] = (id)3221225472;
    from[2] = sub_100014F14;
    from[3] = &unk_1001C6090;
    objc_copyWeak(&v36, &v44);
    v25 = v24;
    v35 = v25;
    [v25 setDeviceLostHandler:from];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100015018;
    v31[3] = &unk_1001C7AC8;
    objc_copyWeak(&v33, &v44);
    v26 = v25;
    v32 = v26;
    [v26 activateWithCompletion:v31];
    browser = self->_browser;
    self->_browser = (RPCompanionLinkClient *)v26;
    v28 = v26;

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v36);

    objc_destroyWeak(&v43);
    p_id location = &v44;
    goto LABEL_14;
  }
}

@end