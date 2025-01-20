@interface MBNotificationCenter
+ (id)sharedNotificationCenter;
- (MBNotificationCenter)init;
- (int)_tokenForName:(id)a3;
- (unint64_t)_stateForToken:(int)a3;
- (unint64_t)stateForNotification:(id)a3;
- (void)_postNotification:(id)a3;
- (void)_setState:(unint64_t)a3 forToken:(int)a4;
- (void)dealloc;
- (void)postNotification:(id)a3;
- (void)postNotification:(id)a3 ifStateChanged:(unint64_t)a4;
- (void)setState:(unint64_t)a3 forNotification:(id)a4;
@end

@implementation MBNotificationCenter

+ (id)sharedNotificationCenter
{
  if (qword_100113068 != -1) {
    dispatch_once(&qword_100113068, &stru_1000F2608);
  }
  return (id)qword_100113060;
}

- (MBNotificationCenter)init
{
  v6.receiver = self;
  v6.super_class = (Class)MBNotificationCenter;
  v2 = [(MBNotificationCenter *)&v6 init];
  if (v2)
  {
    v2->_tokensByName = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create(Name, 0);
  }
  return v2;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_queue);
  v3.receiver = self;
  v3.super_class = (Class)MBNotificationCenter;
  [(MBNotificationCenter *)&v3 dealloc];
}

- (void)_postNotification:(id)a3
{
  for (char i = 1; ; char i = 0)
  {
    char v5 = i;
    uint32_t v6 = notify_post([a3 UTF8String:v9, v10]);
    if (!v6) {
      break;
    }
    uint32_t v7 = v6;
    v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = a3;
      __int16 v13 = 2048;
      uint64_t v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "notify_post(%@) failed: %lu", buf, 0x16u);
      id v9 = a3;
      uint64_t v10 = v7;
      _MBLog();
    }
    if ((v5 & 1) == 0) {
      objc_exception_throw([objc_alloc((Class)MBException) initWithCode:1 format:@"notify_post failed: %lu", v7]);
    }
  }
}

- (int)_tokenForName:(id)a3
{
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = -1;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100095DB4;
  block[3] = &unk_1000F2630;
  block[4] = self;
  block[5] = a3;
  block[6] = &v8;
  block[7] = &v12;
  dispatch_sync(queue, block);
  if (*((_DWORD *)v13 + 6))
  {
    id v6 = objc_alloc((Class)MBException);
    objc_exception_throw([v6 initWithCode:1 format:@"notify_register_check failed: %lu", *((unsigned int *)v13 + 6)]);
  }
  int v4 = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v4;
}

- (unint64_t)_stateForToken:(int)a3
{
  for (char i = 1; ; char i = 0)
  {
    char v5 = i;
    uint64_t state64 = 0;
    uint32_t state = notify_get_state(a3, &state64);
    if (!state) {
      break;
    }
    uint32_t v7 = state;
    uint64_t v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "notify_get_state failed: %lu", buf, 0xCu);
      _MBLog();
    }
    if ((v5 & 1) == 0) {
      objc_exception_throw([objc_alloc((Class)MBException) initWithCode:1 format:@"notify_get_state failed: %lu", v7]);
    }
  }
  return state64;
}

- (void)_setState:(unint64_t)a3 forToken:(int)a4
{
  for (char i = 1; ; char i = 0)
  {
    char v7 = i;
    uint32_t v8 = notify_set_state(a4, a3);
    if (!v8) {
      break;
    }
    uint32_t v9 = v8;
    uint64_t v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v12 = a3;
      __int16 v13 = 2048;
      uint64_t v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "notify_set_state(%llu) failed: %lu", buf, 0x16u);
      _MBLog();
    }
    if ((v7 & 1) == 0) {
      objc_exception_throw([objc_alloc((Class)MBException) initWithCode:1 format:@"notify_set_state failed: %lu", v9]);
    }
  }
}

- (void)postNotification:(id)a3
{
  char v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Posting notification: %@", buf, 0xCu);
    id v6 = a3;
    _MBLog();
  }
  -[MBNotificationCenter _postNotification:](self, "_postNotification:", a3, v6);
}

- (unint64_t)stateForNotification:(id)a3
{
  uint64_t v4 = [(MBNotificationCenter *)self _tokenForName:a3];

  return [(MBNotificationCenter *)self _stateForToken:v4];
}

- (void)setState:(unint64_t)a3 forNotification:(id)a4
{
  char v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v11 = a4;
    __int16 v12 = 2048;
    unint64_t v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Setting notification state: %@ %llu", buf, 0x16u);
    id v8 = a4;
    unint64_t v9 = a3;
    _MBLog();
  }
  -[MBNotificationCenter _setState:forToken:](self, "_setState:forToken:", a3, -[MBNotificationCenter _tokenForName:](self, "_tokenForName:", a4, v8, v9));
}

- (void)postNotification:(id)a3 ifStateChanged:(unint64_t)a4
{
  uint64_t v7 = -[MBNotificationCenter _tokenForName:](self, "_tokenForName:");
  if ([(MBNotificationCenter *)self _stateForToken:v7] != a4)
  {
    id v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = a3;
      __int16 v13 = 2048;
      unint64_t v14 = a4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Posting notification for state change: %@ %llu", buf, 0x16u);
      id v9 = a3;
      unint64_t v10 = a4;
      _MBLog();
    }
    -[MBNotificationCenter _setState:forToken:](self, "_setState:forToken:", a4, v7, v9, v10);
    [(MBNotificationCenter *)self _postNotification:a3];
  }
}

@end