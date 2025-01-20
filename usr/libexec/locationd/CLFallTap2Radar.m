@interface CLFallTap2Radar
- (BOOL)trigger:(id)a3 metaData:(id)a4 start:(id)a5 end:(id)a6 response:(unsigned __int8)a7 resolution:(unsigned __int8)a8 isNearFall:(BOOL)a9 isFallSubmissionAllowed:(BOOL)a10 isNearFallSubmissionAllowed:(BOOL)a11;
- (id)initInUniverse:(id)a3;
- (void)dealloc;
@end

@implementation CLFallTap2Radar

- (id)initInUniverse:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLFallTap2Radar;
  v4 = [(CLFallTap2Radar *)&v8 init];
  if (v4)
  {
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_10230DA80);
    }
    v5 = qword_1024190F8;
    if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Initializing CLFallTap2Radar instance", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024190F0 != -1) {
        dispatch_once(&qword_1024190F0, &stru_10230DA80);
      }
      v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFallTap2Radar initInUniverse:]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
    v4->_universe = (CLIntersiloUniverse *)a3;
  }
  return v4;
}

- (void)dealloc
{
  if (qword_1024190F0 != -1) {
    dispatch_once(&qword_1024190F0, &stru_10230DA80);
  }
  v3 = qword_1024190F8;
  if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Tearing down CLFallTap2Radar instance", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_10230DA80);
    }
    __int16 v6 = 0;
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFallTap2Radar dealloc]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)CLFallTap2Radar;
  [(CLFallTap2Radar *)&v5 dealloc];
}

- (BOOL)trigger:(id)a3 metaData:(id)a4 start:(id)a5 end:(id)a6 response:(unsigned __int8)a7 resolution:(unsigned __int8)a8 isNearFall:(BOOL)a9 isFallSubmissionAllowed:(BOOL)a10 isNearFallSubmissionAllowed:(BOOL)a11
{
  sub_100103240();
  if (sub_10073E30C())
  {
    if (a9 || a10)
    {
      if (a9 && !a11)
      {
        if (qword_1024190F0 != -1) {
          dispatch_once(&qword_1024190F0, &stru_10230DA80);
        }
        v11 = qword_1024190F8;
        if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 68289026;
          int v15 = 0;
          __int16 v16 = 2082;
          v17 = "";
          v12 = "{\"msg%{public}.0s\":\"CLFallTap2Radar::trigger avoiding tap to radar as near fall submission is not allowed\"}";
          goto LABEL_14;
        }
      }
    }
    else
    {
      if (qword_1024190F0 != -1) {
        dispatch_once(&qword_1024190F0, &stru_10230DA80);
      }
      v11 = qword_1024190F8;
      if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 68289026;
        int v15 = 0;
        __int16 v16 = 2082;
        v17 = "";
        v12 = "{\"msg%{public}.0s\":\"CLFallTap2Radar::trigger avoiding tap to radar as fall submission is not allowed\"}";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v14, 0x12u);
      }
    }
  }
  return 0;
}

@end