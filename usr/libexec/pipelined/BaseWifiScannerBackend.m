@interface BaseWifiScannerBackend
- (BOOL)sensorPresent;
- (BaseWifiScannerBackend)init;
- (LoggerProtocol)log;
- (WifiScannerBackendDelegateProtocol)delegate;
- (void)dealloc;
- (void)invalidate;
- (void)scanAsync:(id)a3 initiated:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setLog:(id)a3;
- (void)startListeningCachedScans;
- (void)stopListeningCachedScans;
@end

@implementation BaseWifiScannerBackend

- (BaseWifiScannerBackend)init
{
  v9.receiver = self;
  v9.super_class = (Class)BaseWifiScannerBackend;
  v2 = [(BaseWifiScannerBackend *)&v9 init];
  if (byte_10047BF28)
  {
    if (atomic_load((unint64_t *)&unk_10047E330))
    {
      if (qword_10047BED8 == -1)
      {
        v4 = qword_10047BEE0;
        if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_FAULT)) {
          goto LABEL_6;
        }
        goto LABEL_5;
      }
      dispatch_once(&qword_10047BED8, &stru_100468A00);
      v4 = qword_10047BEE0;
      if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_FAULT))
      {
LABEL_5:
        unint64_t v5 = atomic_load((unint64_t *)&unk_10047E330);
        *(_DWORD *)buf = 134217984;
        unint64_t v11 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "@BaseWifiScannerBackend, init, abort_if_wifi_backend_live, gHasScannerBackend, %lu, possible leak?", buf, 0xCu);
      }
    }
  }
LABEL_6:
  atomic_store((unint64_t)v2, (unint64_t *)&unk_10047E330);
  if (qword_10047BED8 != -1)
  {
    dispatch_once(&qword_10047BED8, &stru_100468A00);
    v6 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEFAULT)) {
      return v2;
    }
    goto LABEL_8;
  }
  v6 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEFAULT))
  {
LABEL_8:
    unint64_t v7 = atomic_load((unint64_t *)&unk_10047E330);
    *(_DWORD *)buf = 134217984;
    unint64_t v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "@BaseWifiScannerBackend, init, gHasScannerBackend, %lu", buf, 0xCu);
  }
  return v2;
}

- (void)setDelegate:(id)a3
{
}

- (LoggerProtocol)log
{
  return self->_log;
}

- (void)dealloc
{
  [(BaseWifiScannerBackend *)self invalidate];
  if (qword_10047BED8 != -1) {
    dispatch_once(&qword_10047BED8, &stru_100468A00);
  }
  v3 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
  {
    unint64_t v4 = atomic_load((unint64_t *)&unk_10047E330);
    *(_DWORD *)buf = 134217984;
    unint64_t v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "@BaseWifiScannerBackend, dealloc, releasing backend, gHasScannerBackend, %lu", buf, 0xCu);
  }
  atomic_store(0, (unint64_t *)&unk_10047E330);
  if (atomic_load((unint64_t *)&unk_10047E330))
  {
    if (qword_10047BED8 != -1)
    {
      dispatch_once(&qword_10047BED8, &stru_100468A00);
      v6 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    v6 = qword_10047BEE0;
    if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR))
    {
LABEL_8:
      unint64_t v7 = atomic_load((unint64_t *)&unk_10047E330);
      *(_DWORD *)buf = 134217984;
      unint64_t v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "@BaseWifiScannerBackend, dealloc, failed to release backend, gHasScannerBackend, %lu", buf, 0xCu);
    }
  }
LABEL_9:
  v8.receiver = self;
  v8.super_class = (Class)BaseWifiScannerBackend;
  [(BaseWifiScannerBackend *)&v8 dealloc];
}

- (BOOL)sensorPresent
{
  return 0;
}

- (void)stopListeningCachedScans
{
}

- (void)startListeningCachedScans
{
}

- (void)scanAsync:(id)a3 initiated:(id)a4
{
}

- (void)invalidate
{
}

- (WifiScannerBackendDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WifiScannerBackendDelegateProtocol *)WeakRetained;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end