@interface RPDelegateBase
- (BOOL)containsDelegate:(id)a3;
- (BOOL)hasDelegate:(id)a3;
- (BOOL)valid;
- (OS_dispatch_queue)delegateQueue;
- (Protocol)protocol;
- (RPDelegateBase)init;
- (unint64_t)delegateCount;
- (void)addDelegate:(id)a3;
- (void)callDelegate:(id)a3;
- (void)callDelegate:(id)a3 forProtocol:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)removeAllDelegates;
- (void)removeDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setProtocol:(id)a3;
@end

@implementation RPDelegateBase

- (RPDelegateBase)init
{
  v11.receiver = self;
  v11.super_class = (Class)RPDelegateBase;
  v2 = [(RPDelegateBase *)&v11 init];
  if (v2)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v13 = "-[RPDelegateBase init]";
      __int16 v14 = 1024;
      int v15 = 25;
      __int16 v16 = 2048;
      v17 = v2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
    }
    uint64_t v3 = objc_opt_class();
    BOOL v4 = v3 != objc_opt_class() || dword_100099BB8 > 2;
    if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100053B44();
    }
    v5 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:0];
    delegateArray = v2->_delegateArray;
    v2->_delegateArray = v5;

    v7 = (NSLock *)objc_alloc_init((Class)NSLock);
    lock = v2->_lock;
    v2->_lock = v7;

    v2->_isValid = 1;
    delegateQueue = v2->_delegateQueue;
    v2->_protocol = 0;
    v2->_delegateQueue = 0;
  }
  return v2;
}

- (void)dealloc
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v5 = "-[RPDelegateBase dealloc]";
    __int16 v6 = 1024;
    int v7 = 39;
    __int16 v8 = 2048;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  v3.receiver = self;
  v3.super_class = (Class)RPDelegateBase;
  [(RPDelegateBase *)&v3 dealloc];
}

- (void)invalidate
{
  [(NSLock *)self->_lock lock];
  if (self->_isValid)
  {
    [(NSMutableArray *)self->_delegateArray removeAllObjects];
    self->_isValid = 0;
  }
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (BOOL)valid
{
  [(NSLock *)self->_lock lock];
  BOOL isValid = self->_isValid;
  [(NSLock *)self->_lock unlock];
  return isValid;
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_lock lock];
  if (self->_isValid && ![(RPDelegateBase *)self containsDelegate:v4]) {
    [(NSMutableArray *)self->_delegateArray addObject:v4];
  }
  [(NSLock *)self->_lock unlock];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_lock lock];
  if (self->_isValid)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v5 = self->_delegateArray;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          if (*(id *)(*((void *)&v10 + 1) + 8 * i) == v4)
          {
            -[NSMutableArray removeObject:](self->_delegateArray, "removeObject:", v4, (void)v10);
            [(NSLock *)self->_lock unlock];

            goto LABEL_13;
          }
        }
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  [(NSLock *)self->_lock unlock];
LABEL_13:
}

- (void)removeAllDelegates
{
  [(NSLock *)self->_lock lock];
  if (self->_isValid) {
    [(NSMutableArray *)self->_delegateArray removeAllObjects];
  }
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (unint64_t)delegateCount
{
  [(NSLock *)self->_lock lock];
  id v3 = [(NSMutableArray *)self->_delegateArray count];
  [(NSLock *)self->_lock unlock];
  return (unint64_t)v3;
}

- (BOOL)hasDelegate:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  [(NSLock *)lock lock];
  LOBYTE(lock) = [(RPDelegateBase *)self containsDelegate:v5];

  [(NSLock *)self->_lock unlock];
  return (char)lock;
}

- (void)callDelegate:(id)a3
{
}

- (void)callDelegate:(id)a3 forProtocol:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NSLock *)self->_lock lock];
  if (self->_isValid)
  {
    id v8 = [(NSMutableArray *)self->_delegateArray copy];
    [(NSLock *)self->_lock unlock];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v10)
    {
      id v12 = v10;
      uint64_t v13 = *(void *)v22;
      *(void *)&long long v11 = 136446466;
      long long v18 = v11;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v9);
          }
          int v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v15, "conformsToProtocol:", v7, v18))
          {
            delegateQueue = self->_delegateQueue;
            if (delegateQueue)
            {
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_100037BF4;
              block[3] = &unk_100085D90;
              id v17 = v6;
              block[4] = v15;
              id v20 = v17;
              dispatch_async(delegateQueue, block);
            }
            else
            {
              (*((void (**)(id, void *))v6 + 2))(v6, v15);
            }
          }
          else if (dword_100099BB8 <= 2 {
                 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          }
          {
            *(_DWORD *)buf = v18;
            v26 = "-[RPDelegateBase callDelegate:forProtocol:]";
            __int16 v27 = 1024;
            int v28 = 145;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d calling delegate does not conform to protocol", buf, 0x12u);
          }
        }
        id v12 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v12);
    }
  }
  else
  {
    [(NSLock *)self->_lock unlock];
  }
}

- (BOOL)containsDelegate:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_delegateArray;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (*(id *)(*((void *)&v10 + 1) + 8 * i) == v4)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (Protocol)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(id)a3
{
  self->_protocol = (Protocol *)a3;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_lock, 0);

  objc_storeStrong((id *)&self->_delegateArray, 0);
}

@end