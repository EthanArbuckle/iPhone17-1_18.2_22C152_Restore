@interface HIDKeyholeUserDevice
- (BOOL)useKeyholeOnGet;
- (HIDBluetoothDevice)delegate;
- (HIDKeyholeUserDevice)initWithProperties:(id)a3 hidDescriptor:(id)a4 keyholeID:(unsigned __int8)a5 delegate:(id)a6;
- (OS_dispatch_queue)queue;
- (id)device;
- (int)getReport:(char *)a3 reportLength:(int64_t *)a4 reportID:(unsigned int)a5 reportType:(int)a6;
- (int)setReport:(char *)a3 reportLength:(int64_t)a4 reportID:(unsigned int)a5 reportType:(int)a6;
- (unsigned)getReportKeyholeID;
- (unsigned)keyholeID;
- (unsigned)maxReportRetry;
- (void)dealloc;
- (void)handleInputReport:(char *)a3 reportLength:(int64_t)a4;
- (void)handleInputReport:(char *)a3 reportLength:(int64_t)a4 timestamp:(unint64_t)a5;
- (void)setDelegate:(id)a3;
- (void)setDevice:(id)a3;
- (void)setGetReportKeyholeID:(unsigned __int8)a3;
- (void)setMaxReportRetry:(unsigned __int8)a3;
- (void)setQueue:(id)a3;
- (void)setUseKeyholeOnGet:(BOOL)a3;
- (void)start:(id)a3;
- (void)stop;
@end

@implementation HIDKeyholeUserDevice

- (HIDKeyholeUserDevice)initWithProperties:(id)a3 hidDescriptor:(id)a4 keyholeID:(unsigned __int8)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HIDKeyholeUserDevice;
  v13 = [(HIDKeyholeUserDevice *)&v21 init];
  if (v13)
  {
    id v14 = [v10 mutableCopy];
    [v14 setObject:v11 forKeyedSubscript:@"ReportDescriptor"];
    *(_WORD *)(v13 + 9) = 1023;
    v13[8] = a5;
    objc_storeWeak((id *)v13 + 3, v12);
    uint64_t v15 = IOHIDUserDeviceCreateWithOptions();
    v16 = (void *)*((void *)v13 + 2);
    *((void *)v13 + 2) = v15;

    if (*((void *)v13 + 2))
    {
      IOHIDUserDeviceRegisterSetReportCallback();
      IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback();
      v17 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = v13[8];
        *(_DWORD *)buf = 67109120;
        int v23 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Created HIDKeyholeUserDevice with keyholeID %02X", buf, 8u);
      }
      v19 = v13;
    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)start:(id)a3
{
  p_queue = &self->_queue;
  id v5 = a3;
  id v4 = objc_storeWeak((id *)p_queue, v5);
  IOHIDUserDeviceScheduleWithDispatchQueue();
}

- (void)stop
{
  p_queue = &self->_queue;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_queue);

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_queue);
    IOHIDUserDeviceUnscheduleFromDispatchQueue();
  }
}

- (int)getReport:(char *)a3 reportLength:(int64_t *)a4 reportID:(unsigned int)a5 reportType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  [(HIDKeyholeUserDevice *)self maxReportRetry];
  unint64_t v11 = 0;
  while (1)
  {
    if (v11)
    {
      id v12 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
      {
        int keyholeID = self->_keyholeID;
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v36 = v11;
        *(_WORD *)&v36[4] = 1024;
        *(_DWORD *)&v36[6] = a5;
        LOWORD(v37) = 1024;
        *(_DWORD *)((char *)&v37 + 2) = keyholeID;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Retry #%u getting report (id=0x%02X, keyhole=0x%02X)", buf, 0x14u);
      }
    }
    kdebug_trace();
    if ([(HIDKeyholeUserDevice *)self useKeyholeOnGet])
    {
      *(_WORD *)buf = 0;
      buf[0] = [(HIDKeyholeUserDevice *)self getReportKeyholeID];
      buf[1] = a5;
      v13 = +[NSData dataWithBytes:buf length:2];
      uint64_t v14 = 0;
    }
    else
    {
      buf[0] = a5;
      v13 = +[NSData dataWithBytes:buf length:1];
      uint64_t v14 = [(HIDKeyholeUserDevice *)self getReportKeyholeID];
    }
    uint64_t v15 = [(HIDKeyholeUserDevice *)self delegate];
    int v16 = [v15 setReportData:v13 reportID:v14 reportType:v6 error:0];

    if (v16 == -536870201)
    {
      int v16 = -536870201;
      kdebug_trace();
      goto LABEL_27;
    }
    v33 = a3;
    v17 = a4;
    if (v16)
    {
      v22 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
      {
        int v24 = self->_keyholeID;
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v36 = v16;
        *(_WORD *)&v36[4] = 1024;
        *(_DWORD *)&v36[6] = a5;
        LOWORD(v37) = 1024;
        *(_DWORD *)((char *)&v37 + 2) = v24;
        _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Set report failed (err=0x%02X, id=0x%02X, keyhole=0x%02X)", buf, 0x14u);
      }
      goto LABEL_17;
    }
    int v18 = [(HIDKeyholeUserDevice *)self delegate];
    id v34 = 0;
    int v16 = [v18 getReportData:&v34 reportID:self->_keyholeID reportType:v6 error:0];
    id v19 = v34;

    if (v16 == -536870201)
    {
      int v16 = -536870201;
      goto LABEL_26;
    }
    if (!v16) {
      break;
    }
    v20 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
    {
      int v25 = self->_keyholeID;
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v36 = v16;
      *(_WORD *)&v36[4] = 1024;
      *(_DWORD *)&v36[6] = a5;
      LOWORD(v37) = 1024;
      *(_DWORD *)((char *)&v37 + 2) = v25;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Get report failed (err=0x%02X, id=0x%02X, keyhole=0x%02X)", buf, 0x14u);
    }

LABEL_17:
    BOOL v23 = v11++ >= [(HIDKeyholeUserDevice *)self maxReportRetry];
    a4 = v17;
    a3 = v33;
    if (v23)
    {
      kdebug_trace();
      return v16;
    }
  }
  uint64_t v26 = [(HIDKeyholeUserDevice *)self useKeyholeOnGet] ^ 1;
  if ((unint64_t)[v19 length] + v26 <= *v17)
  {
    char *v33 = a5;
    [v19 getBytes:&v33[v26] length:*v17 - v26];
    int v16 = 0;
    int64_t *v17 = (int64_t)[v19 length] + v26;
  }
  else
  {
    v27 = (void *)qword_1000CD178;
    int v16 = -536870181;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
    {
      v28 = v27;
      id v29 = [v19 length];
      int64_t v30 = *v17;
      int v31 = self->_keyholeID;
      *(_DWORD *)buf = 134218752;
      *(void *)v36 = v29;
      *(_WORD *)&v36[8] = 2048;
      int64_t v37 = v30;
      __int16 v38 = 1024;
      unsigned int v39 = a5;
      __int16 v40 = 1024;
      int v41 = v31;
      _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Invalid report length (actual=%lu, expected=%ld, id=0x%02X, keyhole=0x%02X)", buf, 0x22u);
    }
  }
LABEL_26:
  kdebug_trace();

LABEL_27:
  return v16;
}

- (int)setReport:(char *)a3 reportLength:(int64_t)a4 reportID:(unsigned int)a5 reportType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  [(HIDKeyholeUserDevice *)self maxReportRetry];
  unint64_t v11 = 0;
  *(void *)&long long v12 = 67109632;
  long long v23 = v12;
  while (1)
  {
    if (v11)
    {
      v13 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
      {
        int keyholeID = self->_keyholeID;
        *(_DWORD *)buf = v23;
        int v25 = v11;
        __int16 v26 = 1024;
        unsigned int v27 = a5;
        __int16 v28 = 1024;
        int v29 = keyholeID;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Retry #%u setting report (id=0x%02X, keyhole=0x%02X)", buf, 0x14u);
      }
    }
    uint64_t v14 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", a3, a4, 0, v23);
    kdebug_trace();
    uint64_t v15 = [(HIDKeyholeUserDevice *)self delegate];
    int v16 = v6 == 1
        ? [v15 sendOutputReportData:v14 reportID:self->_keyholeID reportType:1]
        : [v15 setReportData:v14 reportID:self->_keyholeID reportType:v6 error:0];

    kdebug_trace();
    if (v16 == -536870201 || v16 == 0) {
      break;
    }
    int v18 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
    {
      int v20 = self->_keyholeID;
      *(_DWORD *)buf = v23;
      int v25 = v16;
      __int16 v26 = 1024;
      unsigned int v27 = a5;
      __int16 v28 = 1024;
      int v29 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Set report failed (err=0x%02X, id=0x%02X, keyhole=0x%02X)", buf, 0x14u);
    }

    if (v11++ >= [(HIDKeyholeUserDevice *)self maxReportRetry]) {
      return v16;
    }
  }

  return v16;
}

- (void)handleInputReport:(char *)a3 reportLength:(int64_t)a4
{
}

- (void)handleInputReport:(char *)a3 reportLength:(int64_t)a4 timestamp:(unint64_t)a5
{
}

- (void)dealloc
{
  v3 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    *(_DWORD *)buf = 67109120;
    unsigned int v7 = [(HIDKeyholeUserDevice *)self keyholeID];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Deallocating HIDKeyholeUserDevice with keyholeID %02X", buf, 8u);
  }
  [(HIDKeyholeUserDevice *)self stop];
  v5.receiver = self;
  v5.super_class = (Class)HIDKeyholeUserDevice;
  [(HIDKeyholeUserDevice *)&v5 dealloc];
}

- (unsigned)keyholeID
{
  return self->_keyholeID;
}

- (unsigned)getReportKeyholeID
{
  return self->_getReportKeyholeID;
}

- (void)setGetReportKeyholeID:(unsigned __int8)a3
{
  self->_getReportKeyholeID = a3;
}

- (unsigned)maxReportRetry
{
  return self->_maxReportRetry;
}

- (void)setMaxReportRetry:(unsigned __int8)a3
{
  self->_maxReportRetry = a3;
}

- (BOOL)useKeyholeOnGet
{
  return self->_useKeyholeOnGet;
}

- (void)setUseKeyholeOnGet:(BOOL)a3
{
  self->_useKeyholeOnGet = a3;
}

- (id)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (HIDBluetoothDevice)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HIDBluetoothDevice *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_queue);

  return (OS_dispatch_queue *)WeakRetained;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_queue);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong(&self->_device, 0);
}

@end