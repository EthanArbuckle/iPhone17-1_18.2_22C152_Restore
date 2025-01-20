@interface CLHidEventManager
- (CLHidEventManager)initWithDelegate:(id)a3 queue:(id)a4 matching:(id)a5 type:(int64_t)a6;
- (CLHidEventManagerDelegate)delegate;
- (HIDEventSystemClient)manager;
- (NSMutableArray)matching;
- (OS_dispatch_queue)delegateQueue;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setMatching:(id)a3;
@end

@implementation CLHidEventManager

- (CLHidEventManager)initWithDelegate:(id)a3 queue:(id)a4 matching:(id)a5 type:(int64_t)a6
{
  v20.receiver = self;
  v20.super_class = (Class)CLHidEventManager;
  v10 = [(CLHidEventManager *)&v20 init];
  if (v10)
  {
    v11 = (HIDEventSystemClient *)[objc_alloc((Class)HIDEventSystemClient) initWithType:a6];
    v10->_delegateQueue = (OS_dispatch_queue *)a4;
    v10->_manager = v11;
    v10->_delegate = (CLHidEventManagerDelegate *)a3;
    v12 = (NSMutableArray *)objc_opt_new();
    v10->_matching = v12;
    [(NSMutableArray *)v12 addObject:a5];
    [(HIDEventSystemClient *)v10->_manager setMatching:v10->_matching];
    [(HIDEventSystemClient *)v10->_manager setDispatchQueue:[(CLHidEventManager *)v10 delegateQueue]];
    manager = v10->_manager;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1012F67A4;
    v19[3] = &unk_10231F2B0;
    v19[4] = v10;
    [(HIDEventSystemClient *)manager setEventHandler:v19];
    [(HIDEventSystemClient *)v10->_manager activate];
    if (qword_102418FD0 != -1) {
      dispatch_once(&qword_102418FD0, &stru_10231F2D0);
    }
    v14 = qword_102418FD8;
    if (os_log_type_enabled((os_log_t)qword_102418FD8, OS_LOG_TYPE_DEBUG))
    {
      id v15 = [(HIDEventSystemClient *)v10->_manager services];
      *(_DWORD *)buf = 138412290;
      id v24 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[CLHidManager] enumerated these devices: %@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102418FD0 != -1) {
        dispatch_once(&qword_102418FD0, &stru_10231F2D0);
      }
      id v17 = [(HIDEventSystemClient *)v10->_manager services];
      int v21 = 138412290;
      id v22 = v17;
      v18 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHidEventManager initWithDelegate:queue:matching:type:]", "%s\n", v18);
      if (v18 != (char *)buf) {
        free(v18);
      }
    }
  }
  return v10;
}

- (void)dealloc
{
  [(HIDEventSystemClient *)self->_manager cancel];

  [(NSMutableArray *)self->_matching removeAllObjects];
  v3.receiver = self;
  v3.super_class = (Class)CLHidEventManager;
  [(CLHidEventManager *)&v3 dealloc];
}

- (CLHidEventManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CLHidEventManagerDelegate *)a3;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (HIDEventSystemClient)manager
{
  return self->_manager;
}

- (NSMutableArray)matching
{
  return self->_matching;
}

- (void)setMatching:(id)a3
{
}

@end