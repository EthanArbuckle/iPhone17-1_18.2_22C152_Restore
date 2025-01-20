@interface CLOSTransaction
- (CLOSTransaction)initWithDescription:(const char *)a3;
- (void)dealloc;
@end

@implementation CLOSTransaction

- (CLOSTransaction)initWithDescription:(const char *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CLOSTransaction;
  v4 = [(CLOSTransaction *)&v10 init];
  if (v4)
  {
    v4->_description = +[NSString stringWithUTF8String:a3];
    v4->_transaction = (OS_os_transaction *)os_transaction_create();
    if (qword_102419610 != -1) {
      dispatch_once(&qword_102419610, &stru_1022D6518);
    }
    v5 = qword_102419618;
    if (os_log_type_enabled((os_log_t)qword_102419618, OS_LOG_TYPE_DEFAULT))
    {
      description = v4->_description;
      *(_DWORD *)buf = 134218242;
      p_transaction = &v4->_transaction;
      __int16 v17 = 2112;
      v18 = description;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "os_transaction created: (%p) %@", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419610 != -1) {
        dispatch_once(&qword_102419610, &stru_1022D6518);
      }
      v8 = v4->_description;
      int v11 = 134218242;
      v12 = &v4->_transaction;
      __int16 v13 = 2112;
      v14 = v8;
      v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLOSTransaction initWithDescription:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
  }
  return v4;
}

- (void)dealloc
{
  if (qword_102419610 != -1) {
    dispatch_once(&qword_102419610, &stru_1022D6518);
  }
  v3 = qword_102419618;
  if (os_log_type_enabled((os_log_t)qword_102419618, OS_LOG_TYPE_DEFAULT))
  {
    description = self->_description;
    *(_DWORD *)buf = 134218242;
    p_transaction = &self->_transaction;
    __int16 v14 = 2112;
    v15 = description;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "os_transaction released: (%p) %@", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419610 != -1) {
      dispatch_once(&qword_102419610, &stru_1022D6518);
    }
    v5 = self->_description;
    int v8 = 134218242;
    v9 = &self->_transaction;
    __int16 v10 = 2112;
    int v11 = v5;
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLOSTransaction dealloc]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }

  self->_transaction = 0;
  self->_description = 0;
  v7.receiver = self;
  v7.super_class = (Class)CLOSTransaction;
  [(CLOSTransaction *)&v7 dealloc];
}

@end