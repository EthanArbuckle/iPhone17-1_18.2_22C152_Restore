@interface CLHidDevice
- (BOOL)setReport:(int64_t)a3 payload:(char *)a4 length:(int64_t)a5;
- (CLHidDevice)initWithHidDevice:(id)a3 matchingDict:(id)a4;
- (HIDDevice)hidDevice;
- (NSDictionary)matching;
- (void)dealloc;
- (void)setHidDevice:(id)a3;
- (void)setMatching:(id)a3;
@end

@implementation CLHidDevice

- (CLHidDevice)initWithHidDevice:(id)a3 matchingDict:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CLHidDevice;
  result = [(CLHidDevice *)&v7 init];
  if (result)
  {
    result->_matching = (NSDictionary *)a4;
    result->_hidDevice = (HIDDevice *)a3;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLHidDevice;
  [(CLHidDevice *)&v3 dealloc];
}

- (BOOL)setReport:(int64_t)a3 payload:(char *)a4 length:(int64_t)a5
{
  uint64_t v11 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100ABFB40;
  v10[3] = &unk_1022DC000;
  v10[4] = a3;
  unsigned __int8 v6 = [(HIDDevice *)[(CLHidDevice *)self hidDevice] setReport:a4 reportLength:a5 withIdentifier:a3 forType:2 error:&v11 timeout:0 callback:v10];
  if ((v6 & 1) == 0)
  {
    if (qword_102418FD0 != -1) {
      dispatch_once(&qword_102418FD0, &stru_1022DC098);
    }
    objc_super v7 = qword_102418FD8;
    if (os_log_type_enabled((os_log_t)qword_102418FD8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      int64_t v17 = a3;
      __int16 v18 = 2112;
      uint64_t v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[CLHidManager] setReport: id=0x%lx, failed=%@", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102418FD0 != -1) {
        dispatch_once(&qword_102418FD0, &stru_1022DC098);
      }
      int v12 = 134218242;
      int64_t v13 = a3;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLHidDevice setReport:payload:length:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
  }
  return v6;
}

- (NSDictionary)matching
{
  return self->_matching;
}

- (void)setMatching:(id)a3
{
}

- (HIDDevice)hidDevice
{
  return self->_hidDevice;
}

- (void)setHidDevice:(id)a3
{
  self->_hidDevice = (HIDDevice *)a3;
}

@end