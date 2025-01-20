@interface Keybag
+ (BOOL)afterFirstUserUnlock;
+ (BOOL)canRunWhenLocked;
+ (BOOL)isLocked;
+ (BOOL)supportsMultiUser;
- (Keybag)init;
- (Keybag)initWithDelegate:(id)a3;
- (KeybagDelegate)delegate;
- (void)dealloc;
- (void)onQueueUpdateDelegate;
- (void)setDelegate:(id)a3;
@end

@implementation Keybag

+ (BOOL)afterFirstUserUnlock
{
  int v2 = MKBDeviceUnlockedSinceBoot();
  int v3 = v2;
  if ((v2 & 0x80000000) == 0) {
    return v2 == 1;
  }
  if (qword_10047BED8 != -1) {
    dispatch_once(&qword_10047BED8, &stru_10046BD20);
  }
  v5 = qword_10047BEE0;
  BOOL v6 = os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v6)
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Couldn't get unlocked since boot state.  result: %d", (uint8_t *)v7, 8u);
    return 0;
  }
  return result;
}

+ (BOOL)canRunWhenLocked
{
  sub_1001637A4((uint64_t)v4);
  sub_10001D078((uint64_t)v4, (uint64_t)&__p, &v7);
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0)
  {
    BOOL v2 = v7.__r_.__value_.__l.__size_ != 1 || *v7.__r_.__value_.__l.__data_ != 65;
    operator delete(v7.__r_.__value_.__l.__data_);
    if (v6 < 0) {
      goto LABEL_12;
    }
    return v2;
  }
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) != 1)
  {
    BOOL v2 = 1;
    if (v6 < 0) {
      goto LABEL_12;
    }
    return v2;
  }
  BOOL v2 = v7.__r_.__value_.__s.__data_[0] != 65;
  if ((v6 & 0x80000000) == 0) {
    return v2;
  }
LABEL_12:
  operator delete(__p);
  return v2;
}

+ (BOOL)isLocked
{
  return MKBGetDeviceLockState() - 1 < 2;
}

+ (BOOL)supportsMultiUser
{
  if (qword_10047E8D8 != -1) {
    dispatch_once(&qword_10047E8D8, &stru_10046BD00);
  }
  return byte_10047E8D2;
}

- (Keybag)init
{
  return 0;
}

- (Keybag)initWithDelegate:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)Keybag;
  v5 = [(Keybag *)&v22 init];
  char v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    int v7 = MKBDeviceFormattedForContentProtection();
    int v8 = v7;
    if (!v7)
    {
      char v10 = 0;
LABEL_9:
      v6->_formattedWithProtection = v10;
      dispatch_queue_t v11 = dispatch_queue_create("com.apple.indoor.keybag", 0);
      q = v6->_q;
      v6->_q = (OS_dispatch_queue *)v11;

      objc_initWeak(&location, v6);
      objc_copyWeak(&v20, &location);
      v13 = (const char *)[kMobileKeyBagLockStatusNotification UTF8String];
      v14 = v6->_q;
      *(void *)buf = _NSConcreteStackBlock;
      uint64_t v24 = 3321888768;
      v25 = sub_10039F4CC;
      v26 = &unk_10046BD40;
      objc_copyWeak(&v27, &v20);
      v15 = objc_retainBlock(buf);
      objc_destroyWeak(&v27);
      uint32_t v16 = notify_register_dispatch(v13, &v6->_keybagToken, v14, v15);

      if (!v16)
      {
LABEL_14:
        [(Keybag *)v6 onQueueUpdateDelegate];
        v18 = v6;
        objc_destroyWeak(&v20);
        objc_destroyWeak(&location);
        goto LABEL_15;
      }
      if (qword_10047BED8 == -1)
      {
        v17 = qword_10047BEE0;
        if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR))
        {
LABEL_13:
          v6->_keybagToken = 0;
          goto LABEL_14;
        }
      }
      else
      {
        dispatch_once(&qword_10047BED8, &stru_10046BD20);
        v17 = qword_10047BEE0;
        if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR)) {
          goto LABEL_13;
        }
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to register for lock state notification change: %u", buf, 8u);
      goto LABEL_13;
    }
    if (v7 != 1)
    {
      if (qword_10047BED8 != -1)
      {
        dispatch_once(&qword_10047BED8, &stru_10046BD20);
        v9 = qword_10047BEE0;
        if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR)) {
          goto LABEL_7;
        }
        goto LABEL_6;
      }
      v9 = qword_10047BEE0;
      if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR))
      {
LABEL_6:
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Bad response for formatted for content protection: %d", buf, 8u);
      }
    }
LABEL_7:
    char v10 = 1;
    goto LABEL_9;
  }
LABEL_15:

  return v6;
}

- (void)dealloc
{
  int keybagToken = self->_keybagToken;
  if (keybagToken) {
    notify_cancel(keybagToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)Keybag;
  [(Keybag *)&v4 dealloc];
}

- (void)onQueueUpdateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (+[Keybag isLocked]) {
    [WeakRetained keybagDidLock];
  }
  else {
    [WeakRetained keybagDidUnlock];
  }
}

- (KeybagDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (KeybagDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_q, 0);
}

@end