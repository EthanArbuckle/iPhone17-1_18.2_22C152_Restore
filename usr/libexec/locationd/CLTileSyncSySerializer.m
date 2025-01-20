@interface CLTileSyncSySerializer
- (id)changeFromData:(id)a3 ofType:(int64_t)a4;
- (id)dataFromChange:(id)a3;
@end

@implementation CLTileSyncSySerializer

- (id)dataFromChange:(id)a3
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = [objc_alloc(off_10241AF18()) initWithProperties:[a3 properties]];
  if (qword_1024193B0 != -1) {
    dispatch_once(&qword_1024193B0, &stru_1022B2480);
  }
  v6 = qword_1024193B8;
  if (os_log_type_enabled((os_log_t)qword_1024193B8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67240192;
    int v10 = isKindOfClass & 1;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "@GtsSync, CsSerial, dataFromChange, isKind, %{public}d\n", buf, 8u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193B0 != -1) {
      dispatch_once(&qword_1024193B0, &stru_1022B2480);
    }
    v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTileSyncSySerializer dataFromChange:]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  if (isKindOfClass) {
    return +[NSKeyedArchiver archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
  }
  else {
    return 0;
  }
}

- (id)changeFromData:(id)a3 ofType:(int64_t)a4
{
  if (qword_1024193B0 != -1) {
    dispatch_once(&qword_1024193B0, &stru_1022B2480);
  }
  id v5 = qword_1024193B8;
  if (os_log_type_enabled((os_log_t)qword_1024193B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v9 = a4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "@GtsWarn, GizmoSync, changeFromData, %ld, #CloneMe", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193B0 != -1) {
      dispatch_once(&qword_1024193B0, &stru_1022B2480);
    }
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTileSyncSySerializer changeFromData:ofType:]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  return 0;
}

@end