@interface CLPeripheralManagerDelegate
- (CLPeripheralManagerDelegate)initWithSilo:(id)a3 provider:(void *)a4;
- (CLSilo)silo;
- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4;
- (void)peripheralManagerDidUpdateState:(id)a3;
- (void)provider;
- (void)setProvider:(void *)a3;
- (void)setSilo:(id)a3;
@end

@implementation CLPeripheralManagerDelegate

- (CLPeripheralManagerDelegate)initWithSilo:(id)a3 provider:(void *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CLPeripheralManagerDelegate;
  v6 = [(CLPeripheralManagerDelegate *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(CLPeripheralManagerDelegate *)v6 setSilo:a3];
    [(CLPeripheralManagerDelegate *)v7 setProvider:a4];
  }
  return v7;
}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102321758);
  }
  v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67240192;
    unsigned int v10 = [a3 state];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "iB: BT Peripheral manager state update: %{public}d", buf, 8u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102321758);
    }
    [a3 state];
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPeripheralManagerDelegate peripheralManagerDidUpdateState:]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  if ([a3 state] == (id)5)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102321758);
    }
    v6 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "iB: Attempt start", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102321758);
      }
      v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPeripheralManagerDelegate peripheralManagerDidUpdateState:]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
    [(CLSilo *)[(CLPeripheralManagerDelegate *)self silo] assertInside];
    (*(void (**)(void))(*(void *)[(CLPeripheralManagerDelegate *)self provider] + 264))();
  }
}

- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4
{
  if (a4)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102321758);
    }
    v5 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136380675;
      v9[0] = [[objc_msgSend(a4, "description") UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#Warning BT Peripheral manager error on advertising start attempt, %{private}s", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102321758);
      }
      [objc_msgSend(a4, "description") UTF8String];
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPeripheralManagerDelegate peripheralManagerDidStartAdvertising:error:]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102321758);
    }
    v7 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289026;
      LODWORD(v9[0]) = 0;
      WORD2(v9[0]) = 2082;
      *(void *)((char *)v9 + 6) = "";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"iB: BT Peripheral manager started advertising\"}", buf, 0x12u);
    }
  }
}

- (CLSilo)silo
{
  return self->_silo;
}

- (void)setSilo:(id)a3
{
}

- (void)provider
{
  return self->_provider;
}

- (void)setProvider:(void *)a3
{
  self->_provider = a3;
}

@end