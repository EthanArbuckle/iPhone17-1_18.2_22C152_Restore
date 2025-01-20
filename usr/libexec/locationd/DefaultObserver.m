@interface DefaultObserver
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation DefaultObserver

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 valueForKey:v8];
  if (qword_102489008 != -1) {
    dispatch_once(&qword_102489008, &stru_1023351C8);
  }
  v11 = qword_102489000;
  if (os_log_type_enabled((os_log_t)qword_102489000, OS_LOG_TYPE_INFO))
  {
    int v12 = 138543618;
    id v13 = v8;
    __int16 v14 = 2114;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[CMMslDefaultObserver] Received KVO for key,%{public}@,value,%{public}@", (uint8_t *)&v12, 0x16u);
  }
  sub_1016B25F0((uint64_t)a6, v8, v10);
}

@end