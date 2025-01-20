@interface CLTrackRunControllerRoutineAdapter
- (BOOL)valid;
- (CLTrackRunControllerRoutineAdapter)initWithTrackRunController:(void *)a3;
- (void)onVisit:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLTrackRunControllerRoutineAdapter

- (CLTrackRunControllerRoutineAdapter)initWithTrackRunController:(void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLTrackRunControllerRoutineAdapter;
  v4 = [(CLTrackRunControllerRoutineAdapter *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_trcEncloser = a3;
    v4->_valid = a3 != 0;
  }
  if (qword_102418FB0 != -1) {
    dispatch_once(&qword_102418FB0, &stru_102328308);
  }
  v6 = qword_102418FB8;
  if (os_log_type_enabled((os_log_t)qword_102418FB8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#cltrm,initWithTrackRunController", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102418FB0 != -1) {
      dispatch_once(&qword_102418FB0, &stru_102328308);
    }
    v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackRunControllerRoutineAdapter initWithTrackRunController:]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  return v5;
}

- (void)onVisit:(id)a3
{
  if (qword_102418FB0 != -1) {
    dispatch_once(&qword_102418FB0, &stru_102328308);
  }
  v5 = qword_102418FB8;
  if (os_log_type_enabled((os_log_t)qword_102418FB8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#cltrm,onVisit", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102418FB0 != -1) {
      dispatch_once(&qword_102418FB0, &stru_102328308);
    }
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackRunControllerRoutineAdapter onVisit:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  sub_101489190((uint64_t)self->_trcEncloser, a3);
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end