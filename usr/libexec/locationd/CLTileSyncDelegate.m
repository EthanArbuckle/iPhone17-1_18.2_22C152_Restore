@interface CLTileSyncDelegate
- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5;
- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4;
- (CLTileSyncDelegate)initWithSyncManager:(void *)a3 silo:(id)a4;
- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5;
- (void)initialSyncStateObserver:(id)a3 initialSyncDidCompleteForPairingIdentifier:(id)a4;
- (void)initialSyncStateObserver:(id)a3 syncDidCompleteForPairingIdentifier:(id)a4;
- (void)initialSyncStateObserver:(id)a3 syncDidResetForPairingIdentifier:(id)a4;
- (void)initialSyncStateObserverClientCanRetryFailedRequests:(id)a3;
- (void)service:(id)a3 didSwitchFromPairingID:(id)a4 toPairingID:(id)a5;
- (void)service:(id)a3 encounteredError:(id)a4 context:(id)a5;
- (void)service:(id)a3 sessionEnded:(id)a4 error:(id)a5;
- (void)service:(id)a3 willSwitchFromPairingID:(id)a4 toPairingID:(id)a5;
- (void)serviceDidPairDevice:(id)a3;
- (void)serviceDidUnpairDevice:(id)a3;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4;
- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3;
- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5;
- (void)syncSession:(id)a3 didEndWithError:(id)a4;
@end

@implementation CLTileSyncDelegate

- (CLTileSyncDelegate)initWithSyncManager:(void *)a3 silo:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CLTileSyncDelegate;
  result = [(CLTileSyncDelegate *)&v7 init];
  if (result)
  {
    result->fManager = a3;
    result->fSilo = (CLSilo *)a4;
    result->fPsSession = 0;
  }
  return result;
}

- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5
{
  id v7 = sub_100429370((uint64_t)self->fManager, [a4 sessionMetadata:a3]);
  int v8 = *((unsigned __int8 *)self->fManager + 160);
  if (v8 == 82 || v8 == 73) {
    double v10 = 120.0;
  }
  else {
    double v10 = 900.0;
  }
  [a4 setMaxConcurrentMessages:1];
  [a4 setDelegate:self];
  [a4 setSerializer:objc_alloc_init(CLTileSyncSySerializer)];
  [a4 setTargetQueue:[-[CLSilo queue](self->fSilo, "queue")];
  [a4 setSessionMetadata:v7];
  [a4 setPerMessageTimeout:450.0];
  [a4 setFullSessionTimeout:v10];
  if (qword_1024193B0 != -1) {
    dispatch_once(&qword_1024193B0, &stru_1022B2480);
  }
  v11 = qword_1024193B8;
  if (os_log_type_enabled((os_log_t)qword_1024193B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    double v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "@GtsFlow, CS, startSession, 2, timeout, %{public}.0f", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193B0 != -1) {
      dispatch_once(&qword_1024193B0, &stru_1022B2480);
    }
    v13 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTileSyncDelegate service:startSession:error:]", "%s\n", v13);
    if (v13 != (char *)buf) {
      free(v13);
    }
  }
  return 1;
}

- (void)service:(id)a3 sessionEnded:(id)a4 error:(id)a5
{
  if (qword_1024193B0 != -1) {
    dispatch_once(&qword_1024193B0, &stru_1022B2480);
  }
  v5 = qword_1024193B8;
  if (os_log_type_enabled((os_log_t)qword_1024193B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "@GtsFlow, CS, endSession, 6", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193B0 != -1) {
      dispatch_once(&qword_1024193B0, &stru_1022B2480);
    }
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTileSyncDelegate service:sessionEnded:error:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
}

- (void)serviceDidPairDevice:(id)a3
{
  if (qword_1024193B0 != -1) {
    dispatch_once(&qword_1024193B0, &stru_1022B2480);
  }
  v4 = qword_1024193B8;
  if (os_log_type_enabled((os_log_t)qword_1024193B8, OS_LOG_TYPE_INFO))
  {
    int v5 = *((char *)self->fManager + 160);
    *(_DWORD *)buf = 67240192;
    int v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "@GtsSync, CsService, serviceDidPairDevice, state, %{public}c", buf, 8u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193B0 != -1) {
      dispatch_once(&qword_1024193B0, &stru_1022B2480);
    }
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTileSyncDelegate serviceDidPairDevice:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
}

- (void)serviceDidUnpairDevice:(id)a3
{
  if (qword_1024193B0 != -1) {
    dispatch_once(&qword_1024193B0, &stru_1022B2480);
  }
  v4 = qword_1024193B8;
  if (os_log_type_enabled((os_log_t)qword_1024193B8, OS_LOG_TYPE_INFO))
  {
    int v5 = *((char *)self->fManager + 160);
    *(_DWORD *)buf = 67240192;
    int v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "@GtsSync, CsService, serviceDidUnpairDevice, state, %{public}c", buf, 8u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193B0 != -1) {
      dispatch_once(&qword_1024193B0, &stru_1022B2480);
    }
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTileSyncDelegate serviceDidUnpairDevice:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
}

- (void)service:(id)a3 encounteredError:(id)a4 context:(id)a5
{
  id v7 = [[objc_msgSend(a4, "userInfo", a3) objectForKeyedSubscript:NSUnderlyingErrorKey];
  if (qword_1024193B0 != -1) {
    dispatch_once(&qword_1024193B0, &stru_1022B2480);
  }
  int v8 = qword_1024193B8;
  if (os_log_type_enabled((os_log_t)qword_1024193B8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    id v11 = [[objc_msgSend(a4, "localizedDescription") UTF8String];
    __int16 v12 = 2082;
    id v13 = [[objc_msgSend(v7, "localizedDescription") UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "@GtsSync, CsError, 2, service, %{public}s, underlying, %{public}s", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193B0 != -1) {
      dispatch_once(&qword_1024193B0, &stru_1022B2480);
    }
    [objc_msgSend(a4, "localizedDescription") UTF8String];
    [objc_msgSend(v7, "localizedDescription") UTF8String];
    v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTileSyncDelegate service:encounteredError:context:]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  sub_100429D04((uint64_t)self->fManager);
}

- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5
{
  __int16 v7 = sub_10042A1D4((uint64_t)self->fManager, [a3 sessionMetadata]);
  if ((_BYTE)v7 && ((*((uint64_t (**)(id, void))a4 + 2))(a4, *((void *)self->fManager + 3)) & 1) == 0)
  {
    if (qword_1024193B0 != -1) {
      dispatch_once(&qword_1024193B0, &stru_1022B2480);
    }
    int v8 = qword_1024193B8;
    if (os_log_type_enabled((os_log_t)qword_1024193B8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "@GtsSync, CsSession, enqueue failed", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193B0 != -1) {
        dispatch_once(&qword_1024193B0, &stru_1022B2480);
      }
      __int16 v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTileSyncDelegate syncSession:enqueueChanges:error:]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
  }
  if ((v7 & 0xFF00) == 0) {
    return 1;
  }
  if (qword_1024193B0 != -1) {
    dispatch_once(&qword_1024193B0, &stru_1022B2480);
  }
  v9 = qword_1024193B8;
  if (os_log_type_enabled((os_log_t)qword_1024193B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "@GtsFlow, CS, enqueueComplete, 4", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193B0 != -1) {
      dispatch_once(&qword_1024193B0, &stru_1022B2480);
    }
    id v11 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTileSyncDelegate syncSession:enqueueChanges:error:]", "%s\n", v11);
    if (v11 != (char *)buf) {
      free(v11);
    }
  }
  return 2;
}

- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5
{
  if (qword_1024193B0 != -1) {
    dispatch_once(&qword_1024193B0, &stru_1022B2480);
  }
  int v8 = qword_1024193B8;
  if (os_log_type_enabled((os_log_t)qword_1024193B8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    id v14 = [a4 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "@GtsSync, CsSession, applyChanges, %{public}lu\n", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193B0 != -1) {
      dispatch_once(&qword_1024193B0, &stru_1022B2480);
    }
    [a4 count];
    id v11 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTileSyncDelegate syncSession:applyChanges:completion:]", "%s\n", v11);
    if (v11 != (char *)buf) {
      free(v11);
    }
  }
  if ((unint64_t)[a4 count] >= 2)
  {
    if (qword_1024193B0 != -1) {
      dispatch_once(&qword_1024193B0, &stru_1022B2480);
    }
    v9 = qword_1024193B8;
    if (os_log_type_enabled((os_log_t)qword_1024193B8, OS_LOG_TYPE_ERROR))
    {
      id v10 = [a4 count];
      *(_DWORD *)buf = 134349056;
      id v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "@GtsSync, CsSession, More than 1 incoming change, %{public}lu, #CloneMe", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193B0 != -1) {
        dispatch_once(&qword_1024193B0, &stru_1022B2480);
      }
      [a4 count];
      __int16 v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLTileSyncDelegate syncSession:applyChanges:completion:]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
  }
  sub_10042A5FC((uint64_t)self->fManager, [a4 objectAtIndexedSubscript:0]);
  (*((void (**)(id, uint64_t, void))a5 + 2))(a5, 1, 0);
}

- (void)syncSession:(id)a3 didEndWithError:(id)a4
{
  id v6 = [[objc_msgSend(a4, "userInfo", a3) objectForKeyedSubscript:NSUnderlyingErrorKey];
  if (a4)
  {
    __int16 v7 = v6;
    if (qword_1024193B0 != -1) {
      dispatch_once(&qword_1024193B0, &stru_1022B2480);
    }
    int v8 = qword_1024193B8;
    if (os_log_type_enabled((os_log_t)qword_1024193B8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)v16 = [objc_msgSend(a4, "localizedDescription") UTF8String];
      *(_WORD *)&v16[8] = 2082;
      id v17 = [[objc_msgSend(v7, "localizedDescription") UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "@GtsSync, CsError, 0, didEndWithError, %{public}s, underlying, %{public}s", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193B0 != -1) {
        dispatch_once(&qword_1024193B0, &stru_1022B2480);
      }
      [objc_msgSend(a4, "localizedDescription") UTF8String];
      [objc_msgSend(v7, "localizedDescription") UTF8String];
      id v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTileSyncDelegate syncSession:didEndWithError:]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
  }
  BOOL v9 = sub_10042B03C((uint64_t)self->fManager, a4 != 0);
  if (qword_1024193B0 != -1) {
    dispatch_once(&qword_1024193B0, &stru_1022B2480);
  }
  id v10 = qword_1024193B8;
  if (os_log_type_enabled((os_log_t)qword_1024193B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)v16 = a4 != 0;
    *(_WORD *)&v16[4] = 1026;
    *(_DWORD *)&v16[6] = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "@GtsFlow, CS, sessionDidEnd, 5, error, %{public}d, synctrap, %{public}d", buf, 0xEu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193B0 != -1) {
      dispatch_once(&qword_1024193B0, &stru_1022B2480);
    }
    __int16 v12 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTileSyncDelegate syncSession:didEndWithError:]", "%s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
  if (v9)
  {
    if (qword_1024193B0 != -1) {
      dispatch_once(&qword_1024193B0, &stru_1022B2480);
    }
    id v11 = qword_1024193B8;
    if (os_log_type_enabled((os_log_t)qword_1024193B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "@GtsFlow, PS, syncDidCompleteTx, 2", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193B0 != -1) {
        dispatch_once(&qword_1024193B0, &stru_1022B2480);
      }
      id v14 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTileSyncDelegate syncSession:didEndWithError:]", "%s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
    [(PSYServiceSyncSession *)self->fPsSession syncDidComplete];
  }
}

- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4
{
  if (qword_1024193B0 != -1) {
    dispatch_once(&qword_1024193B0, &stru_1022B2480);
  }
  v4 = qword_1024193B8;
  if (os_log_type_enabled((os_log_t)qword_1024193B8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "@GtsSync, CsSession, resetDataStoreWithError", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193B0 != -1) {
      dispatch_once(&qword_1024193B0, &stru_1022B2480);
    }
    id v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTileSyncDelegate syncSession:resetDataStoreWithError:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  return 1;
}

- (void)service:(id)a3 willSwitchFromPairingID:(id)a4 toPairingID:(id)a5
{
  if (qword_1024193B0 != -1) {
    dispatch_once(&qword_1024193B0, &stru_1022B2480);
  }
  int v8 = qword_1024193B8;
  if (os_log_type_enabled((os_log_t)qword_1024193B8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    id v11 = [[objc_msgSend(a4, "UUIDString") UTF8String];
    __int16 v12 = 2082;
    id v13 = [[[a5 UUIDString] UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "@GtsSync, CsService, willSwitchPairing, old, %{public}s, new, %{public}s", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193B0 != -1) {
      dispatch_once(&qword_1024193B0, &stru_1022B2480);
    }
    [objc_msgSend(a4, "UUIDString") UTF8String];
    [objc_msgSend(a5, "UUIDString") UTF8String];
    BOOL v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTileSyncDelegate service:willSwitchFromPairingID:toPairingID:]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  sub_10042B788((uint64_t)self->fManager, a5);
}

- (void)service:(id)a3 didSwitchFromPairingID:(id)a4 toPairingID:(id)a5
{
  if (qword_1024193B0 != -1) {
    dispatch_once(&qword_1024193B0, &stru_1022B2480);
  }
  int v8 = qword_1024193B8;
  if (os_log_type_enabled((os_log_t)qword_1024193B8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    id v11 = [[objc_msgSend(a4, "UUIDString") UTF8String];
    __int16 v12 = 2082;
    id v13 = [[objc_msgSend(a5, "UUIDString") UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "@GtsSync, CsService, didSwitchPairing, old, %{public}s, new, %{public}s", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193B0 != -1) {
      dispatch_once(&qword_1024193B0, &stru_1022B2480);
    }
    [objc_msgSend(a4, "UUIDString") UTF8String];
    [objc_msgSend(a5, "UUIDString") UTF8String];
    BOOL v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTileSyncDelegate service:didSwitchFromPairingID:toPairingID:]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  sub_10042BC0C((uint64_t)self->fManager, a4 == 0, a5 == 0);
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  id v7 = a4;

  self->fPsSession = (PSYServiceSyncSession *)a4;
  if (qword_1024193B0 != -1) {
    dispatch_once(&qword_1024193B0, &stru_1022B2480);
  }
  int v8 = qword_1024193B8;
  if (os_log_type_enabled((os_log_t)qword_1024193B8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    id v15 = [objc_msgSend(a3, "activeSyncSession") syncSessionType];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "@GtsSync, PsCoord, beginSyncSession, %{public}lu", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193B0 != -1) {
      dispatch_once(&qword_1024193B0, &stru_1022B2480);
    }
    int v12 = 134349056;
    id v13 = [objc_msgSend(a3, "activeSyncSession") syncSessionType];
    id v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTileSyncDelegate syncCoordinator:beginSyncSession:]", "%s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  fSilo = self->fSilo;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10042C14C;
  v11[3] = &unk_10229FEB0;
  v11[4] = a3;
  v11[5] = self;
  [(CLSilo *)fSilo sync:v11];
}

- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4
{
  if (qword_1024193B0 != -1) {
    dispatch_once(&qword_1024193B0, &stru_1022B2480);
  }
  id v6 = qword_1024193B8;
  if (os_log_type_enabled((os_log_t)qword_1024193B8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67240192;
    unsigned int v12 = [a4 syncSessionType];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "@GtsSync, PsCoord, didInvalidateSyncSession, %{public}d", buf, 8u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193B0 != -1) {
      dispatch_once(&qword_1024193B0, &stru_1022B2480);
    }
    [a4 syncSessionType];
    BOOL v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTileSyncDelegate syncCoordinator:didInvalidateSyncSession:]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  if (qword_1024193B0 != -1) {
    dispatch_once(&qword_1024193B0, &stru_1022B2480);
  }
  id v7 = qword_1024193B8;
  if (os_log_type_enabled((os_log_t)qword_1024193B8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = [a3 syncRestriction];
    *(_DWORD *)buf = 67240192;
    unsigned int v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "@GtsFlow, PS, didInvalidateSession, 3, restriction, %{public}d", buf, 8u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193B0 != -1) {
      dispatch_once(&qword_1024193B0, &stru_1022B2480);
    }
    [a3 syncRestriction];
    id v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTileSyncDelegate syncCoordinator:didInvalidateSyncSession:]", "%s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
}

- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3
{
  if (qword_1024193B0 != -1) {
    dispatch_once(&qword_1024193B0, &stru_1022B2480);
  }
  int v5 = qword_1024193B8;
  if (os_log_type_enabled((os_log_t)qword_1024193B8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67240192;
    unsigned int v12 = [a3 syncRestriction];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "@GtsSync, PsCoord, syncCoordinatorDidChangeSyncRestriction, %{public}d", buf, 8u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193B0 != -1) {
      dispatch_once(&qword_1024193B0, &stru_1022B2480);
    }
    int v9 = 67240192;
    unsigned int v10 = [a3 syncRestriction];
    id v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTileSyncDelegate syncCoordinatorDidChangeSyncRestriction:]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  fSilo = self->fSilo;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10042D098;
  v8[3] = &unk_10229FEB0;
  v8[4] = a3;
  v8[5] = self;
  [(CLSilo *)fSilo sync:v8];
}

- (void)initialSyncStateObserver:(id)a3 initialSyncDidCompleteForPairingIdentifier:(id)a4
{
  if (qword_1024193B0 != -1) {
    dispatch_once(&qword_1024193B0, &stru_1022B2480);
  }
  v4 = qword_1024193B8;
  if (os_log_type_enabled((os_log_t)qword_1024193B8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "@GtsSync, PsObserver, initialSyncDidCompleteForPairingID", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193B0 != -1) {
      dispatch_once(&qword_1024193B0, &stru_1022B2480);
    }
    int v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTileSyncDelegate initialSyncStateObserver:initialSyncDidCompleteForPairingIdentifier:]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
}

- (void)initialSyncStateObserver:(id)a3 syncDidCompleteForPairingIdentifier:(id)a4
{
  if (qword_1024193B0 != -1) {
    dispatch_once(&qword_1024193B0, &stru_1022B2480);
  }
  int v5 = qword_1024193B8;
  if (os_log_type_enabled((os_log_t)qword_1024193B8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "@GtsSync, PsObserver, syncDidCompleteForPairingID", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193B0 != -1) {
      dispatch_once(&qword_1024193B0, &stru_1022B2480);
    }
    __int16 v11 = 0;
    unsigned int v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTileSyncDelegate initialSyncStateObserver:syncDidCompleteForPairingIdentifier:]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  if (qword_1024193B0 != -1) {
    dispatch_once(&qword_1024193B0, &stru_1022B2480);
  }
  id v6 = qword_1024193B8;
  if (os_log_type_enabled((os_log_t)qword_1024193B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "@GtsFlow, PS, syncDidCompleteRx, 4", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193B0 != -1) {
      dispatch_once(&qword_1024193B0, &stru_1022B2480);
    }
    __int16 v11 = 0;
    int v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTileSyncDelegate initialSyncStateObserver:syncDidCompleteForPairingIdentifier:]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  fSilo = self->fSilo;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10042DBFC;
  v10[3] = &unk_10229FED8;
  v10[4] = self;
  [(CLSilo *)fSilo sync:v10];
}

- (void)initialSyncStateObserver:(id)a3 syncDidResetForPairingIdentifier:(id)a4
{
  if (qword_1024193B0 != -1) {
    dispatch_once(&qword_1024193B0, &stru_1022B2480);
  }
  v4 = qword_1024193B8;
  if (os_log_type_enabled((os_log_t)qword_1024193B8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "@GtsSync, PsObserver, syncDidResetForPairingID", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193B0 != -1) {
      dispatch_once(&qword_1024193B0, &stru_1022B2480);
    }
    int v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTileSyncDelegate initialSyncStateObserver:syncDidResetForPairingIdentifier:]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
}

- (void)initialSyncStateObserverClientCanRetryFailedRequests:(id)a3
{
  if (qword_1024193B0 != -1) {
    dispatch_once(&qword_1024193B0, &stru_1022B2480);
  }
  v3 = qword_1024193B8;
  if (os_log_type_enabled((os_log_t)qword_1024193B8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "@GtsSync, PsObserver, initialSyncStateObserverClientCanRetryFailedRequests", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193B0 != -1) {
      dispatch_once(&qword_1024193B0, &stru_1022B2480);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTileSyncDelegate initialSyncStateObserverClientCanRetryFailedRequests:]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
}

@end