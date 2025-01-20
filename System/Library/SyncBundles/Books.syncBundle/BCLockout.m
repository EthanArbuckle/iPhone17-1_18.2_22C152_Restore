@interface BCLockout
- (BOOL)lock:(BOOL)a3;
- (NSArray)endNotifications;
- (NSArray)startNotifications;
- (NSString)path;
- (void)_sendNotfications:(id)a3 isLock:(BOOL)a4;
- (void)dealloc;
- (void)setEndNotifications:(id)a3;
- (void)setPath:(id)a3;
- (void)setStartNotifications:(id)a3;
- (void)unlock;
@end

@implementation BCLockout

- (void)dealloc
{
  [(BCLockout *)self unlock];

  v3.receiver = self;
  v3.super_class = (Class)BCLockout;
  [(BCLockout *)&v3 dealloc];
}

- (void)setPath:(id)a3
{
  if (self->_lockFile)
  {
    [(BCLockout *)self unlock];

    self->_lockFile = 0;
  }
  if (a3) {
    self->_lockFile = [[IMLockFile alloc] initWithPath:a3];
  }
}

- (NSString)path
{
  return [(IMLockFile *)self->_lockFile path];
}

- (BOOL)lock:(BOOL)a3
{
  lockFile = self->_lockFile;
  if (!lockFile)
  {
    v22 = BCDefaultLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_13A8C((uint64_t)self, v22, v23, v24, v25, v26, v27, v28);
    }
    return 0;
  }
  BOOL v5 = a3;
  if ([(IMLockFile *)lockFile locked] && self->_isExclusive == v5) {
    return 1;
  }
  if (!dword_26DCC) {
    mach_timebase_info((mach_timebase_info_t)&dword_26DC8);
  }
  uint64_t v7 = mach_absolute_time();
  if (![(IMLockFile *)self->_lockFile tryLock:v5])
  {
    v8 = BCDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_13B64((uint64_t)self, v8, v9, v10, v11, v12, v13, v14);
    }
    do
    {
      usleep(0x2710u);
      uint64_t v15 = mach_absolute_time();
      uint64_t v17 = dword_26DC8;
      unint64_t v16 = dword_26DCC;
      unsigned int v18 = [(IMLockFile *)self->_lockFile tryLock:v5];
    }
    while ((v18 & 1) == 0 && (v15 - v7) * v17 / v16 < 0x12A05F200);
    if (!v18)
    {
      v29 = BCDefaultLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_13AF8((uint64_t)self, v29, v30, v31, v32, v33, v34, v35);
      }
      return 0;
    }
  }
  self->_isExclusive = v5;
  if ([(BCLockout *)self startNotifications] && v5)
  {
    v19 = [(BCLockout *)self startNotifications];
    BOOL v6 = 1;
    v20 = self;
    uint64_t v21 = 1;
LABEL_21:
    [(BCLockout *)v20 _sendNotfications:v19 isLock:v21];
    return v6;
  }
  BOOL v6 = 1;
  if ([(BCLockout *)self endNotifications] && !v5)
  {
    v19 = [(BCLockout *)self endNotifications];
    v20 = self;
    uint64_t v21 = 0;
    goto LABEL_21;
  }
  return v6;
}

- (void)unlock
{
  if ([(IMLockFile *)self->_lockFile locked])
  {
    [(IMLockFile *)self->_lockFile unlock];
    if (self->_isExclusive)
    {
      if ([(BCLockout *)self endNotifications])
      {
        objc_super v3 = [(BCLockout *)self endNotifications];
        [(BCLockout *)self _sendNotfications:v3 isLock:0];
      }
    }
  }
}

- (void)_sendNotfications:(id)a3 isLock:(BOOL)a4
{
  BOOL v4 = a4;
  CFNotificationCenterRef DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  if (DarwinNotifyCenter)
  {
    uint64_t v7 = DarwinNotifyCenter;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = [a3 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(a3);
          }
          CFStringRef v12 = *(const __CFString **)(*((void *)&v17 + 1) + 8 * i);
          CFNotificationCenterPostNotification(v7, v12, 0, 0, 1u);
          uint64_t v13 = BCDefaultLog();
          BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
          if (v4)
          {
            if (!v14) {
              continue;
            }
            *(_DWORD *)buf = 138412290;
            CFStringRef v22 = v12;
            uint64_t v15 = v13;
            unint64_t v16 = "Lockout raise %@";
          }
          else
          {
            if (!v14) {
              continue;
            }
            *(_DWORD *)buf = 138412290;
            CFStringRef v22 = v12;
            uint64_t v15 = v13;
            unint64_t v16 = "Lockout lower %@";
          }
          _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
        }
        id v9 = [a3 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v9);
    }
  }
}

- (NSArray)startNotifications
{
  return self->_startNotifications;
}

- (void)setStartNotifications:(id)a3
{
}

- (NSArray)endNotifications
{
  return self->_endNotifications;
}

- (void)setEndNotifications:(id)a3
{
}

@end