@interface RDIDSMessageEventListener
+ (void)initialize;
- (void)dealloc;
- (void)service:(id)a3 didFailResource:(id)a4 IDSIdentifier:(id)a5 keyName:(id)a6 sensor:(id)a7 withError:(id)a8;
- (void)service:(id)a3 didReceiveResourceServiceMessage:(id)a4 fromID:(id)a5 incomingResponseIdentifier:(id)a6 outgoingResponseIdentifier:(id)a7;
- (void)service:(id)a3 didRequestToSendIDSMessage:(id)a4 withIDSIdentifier:(id)a5;
- (void)service:(id)a3 didRequestToSendResource:(id)a4 withIDSIdentifier:(id)a5 keyName:(id)a6 sensor:(id)a7 isRetry:(BOOL)a8;
@end

@implementation RDIDSMessageEventListener

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_10006EAB0 = (uint64_t)os_log_create("com.apple.SensorKit", "RDCompanionSideIDSMessageEventListener");
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)RDIDSMessageEventListener;
  [(RDIDSMessageEventListener *)&v3 dealloc];
}

- (void)service:(id)a3 didRequestToSendIDSMessage:(id)a4 withIDSIdentifier:(id)a5
{
  id v9 = [a4 objectForKeyedSubscript:@"RDGizmoSyncMessageTypeKey"];
  if (v9)
  {
    id v10 = [v9 integerValue];
    if (v10 != (id)4)
    {
      if (v10 != (id)3
        || ((unint64_t)objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"RDGizmoSyncArchiveTransferStatusKey"), "integerValue") | 2) != 2)
      {
        return;
      }
      if (a3)
      {
        id v11 = sub_100024F68((uint64_t)a3);
        id v12 = sub_100024DD4(a3, (uint64_t)v11, [*((id *)a3 + 3) devices]);
        if (v12)
        {
          v13 = sub_100039FA8(0, v12, self->_fileURLs, self->_defaults);
          v23 = sub_100013D80([RDIDSMessageStore alloc], v13);
          sub_1000144D8((uint64_t)v23, (const char *)a4, (uint64_t)a5);

          return;
        }
      }
      v22 = qword_10006EAB0;
      if (!os_log_type_enabled((os_log_t)qword_10006EAB0, OS_LOG_TYPE_ERROR)) {
        return;
      }
      *(_WORD *)buf = 0;
LABEL_21:
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "No remote device ID found", buf, 2u);
      return;
    }
    v15 = qword_10006EAB0;
    if (os_log_type_enabled((os_log_t)qword_10006EAB0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Resending any pending IDS messages", buf, 2u);
    }
    if (a3)
    {
      id v16 = sub_100024F68((uint64_t)a3);
      id v17 = sub_100024DD4(a3, (uint64_t)v16, [*((id *)a3 + 3) devices]);
      if (v17)
      {
        v18 = sub_100039FA8(0, v17, self->_fileURLs, self->_defaults);
        v19 = sub_100013D80([RDIDSMessageStore alloc], v18);
        v20 = sub_10002BCBC((id *)&self->_defaults->super.isa);
        id v21 = [objc_alloc((Class)NSMutableSet) initWithCapacity:v20];
        *(void *)buf = 0;
        v26 = buf;
        uint64_t v27 = 0x2020000000;
        uint64_t v28 = 0;
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_1000030C8;
        v24[3] = &unk_10005C9C8;
        v24[4] = v19;
        v24[5] = v21;
        v24[6] = a3;
        v24[7] = buf;
        v24[8] = v20;
        sub_100013E44((uint64_t)v19, (uint64_t)v24);

        _Block_object_dispose(buf, 8);
        return;
      }
    }
    v22 = qword_10006EAB0;
    if (os_log_type_enabled((os_log_t)qword_10006EAB0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      goto LABEL_21;
    }
  }
  else
  {
    v14 = qword_10006EAB0;
    if (os_log_type_enabled((os_log_t)qword_10006EAB0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "No message type key found!", buf, 2u);
    }
  }
}

- (void)service:(id)a3 didRequestToSendResource:(id)a4 withIDSIdentifier:(id)a5 keyName:(id)a6 sensor:(id)a7 isRetry:(BOOL)a8
{
  if (a3
    && (id v14 = sub_100024F68((uint64_t)a3),
        (id v15 = sub_100024DD4(a3, (uint64_t)v14, [*((id *)a3 + 3) devices])) != 0))
  {
    id v16 = sub_100039FA8(0, v15, self->_fileURLs, self->_defaults);
    id v17 = sub_100013D80([RDIDSMessageStore alloc], v16);
    v26[0] = &off_100060F60;
    v25[0] = @"RDGizmoSyncMessageTypeKey";
    v25[1] = @"RDGizmoSyncSamplesURLKey";
    v26[1] = [a4 path];
    v26[2] = a6;
    v25[2] = @"RDGizmoSyncKeyKey";
    v25[3] = @"RDGizmoSyncSensorIdentifierKey";
    v26[3] = a7;
    v25[4] = @"RDGizmoSyncGizmoAbsoluteTimeKey";
    uint64_t v18 = mach_continuous_time();
    if (qword_10006EC88 != -1) {
      dispatch_once(&qword_10006EC88, &stru_10005CDC0);
    }
    unint64_t v19 = qword_10006EC90;
    double v20 = *(double *)&qword_10006EC98;
    double v21 = *(double *)&qword_10006ECA0;
    TMConvertTicksToSeconds();
    if (v19 >= v18) {
      double v22 = -v22;
    }
    v26[4] = +[NSNumber numberWithDouble:v21 + v20 + v22];
    sub_1000144D8((uint64_t)v17, (const char *)+[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:5], (uint64_t)a5);
  }
  else
  {
    v23 = qword_10006EAB0;
    if (os_log_type_enabled((os_log_t)qword_10006EAB0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v24 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "No remote device ID found", v24, 2u);
    }
  }
}

- (void)service:(id)a3 didFailResource:(id)a4 IDSIdentifier:(id)a5 keyName:(id)a6 sensor:(id)a7 withError:(id)a8
{
  id v11 = qword_10006EAB0;
  if (os_log_type_enabled((os_log_t)qword_10006EAB0, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543362;
    id v18 = a5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Resource send failed immediately for %{public}@, removing pending message", (uint8_t *)&v17, 0xCu);
  }
  if (a5)
  {
    if (a3
      && (id v12 = sub_100024F68((uint64_t)a3),
          (id v13 = sub_100024DD4(a3, (uint64_t)v12, [*((id *)a3 + 3) devices])) != 0))
    {
      id v14 = sub_100039FA8(0, v13, self->_fileURLs, self->_defaults);
      id v15 = sub_100013D80([RDIDSMessageStore alloc], v14);
      sub_1000149FC((uint64_t)v15, (const char *)a5);
    }
    else
    {
      id v16 = qword_10006EAB0;
      if (os_log_type_enabled((os_log_t)qword_10006EAB0, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v17) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "No remote device ID found", (uint8_t *)&v17, 2u);
      }
    }
  }
}

- (void)service:(id)a3 didReceiveResourceServiceMessage:(id)a4 fromID:(id)a5 incomingResponseIdentifier:(id)a6 outgoingResponseIdentifier:(id)a7
{
  id v11 = [a4 objectForKeyedSubscript:@"RDGizmoSyncMessageTypeKey"];
  if (!v11)
  {
    id v18 = qword_10006EAB0;
    if (!os_log_type_enabled((os_log_t)qword_10006EAB0, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_WORD *)buf = 0;
    unint64_t v19 = "No message type key found!";
    goto LABEL_15;
  }
  if (!a3
    || (id v12 = v11,
        id v13 = sub_100024F68((uint64_t)a3),
        (id v14 = sub_100024DD4(a3, (uint64_t)v13, [*((id *)a3 + 3) devices])) == 0))
  {
    id v18 = qword_10006EAB0;
    if (!os_log_type_enabled((os_log_t)qword_10006EAB0, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_WORD *)buf = 0;
    unint64_t v19 = "No remote device ID found";
LABEL_15:
    _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    return;
  }
  id v15 = v14;
  id v16 = [v12 integerValue];
  if (v16 == (id)3)
  {
    double v20 = sub_100039FA8(0, v15, self->_fileURLs, self->_defaults);
    double v21 = sub_100013D80([RDIDSMessageStore alloc], v20);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10000386C;
    v23[3] = &unk_10005C9F0;
    v23[4] = a4;
    v23[5] = v21;
    sub_100013E44((uint64_t)v21, (uint64_t)v23);
  }
  else if (v16 == (id)6)
  {
    int v17 = sub_100039FA8(0, v15, self->_fileURLs, self->_defaults);
    double v22 = sub_100013D80([RDIDSMessageStore alloc], v17);
    sub_1000149FC((uint64_t)v22, (const char *)a6);
  }
}

@end