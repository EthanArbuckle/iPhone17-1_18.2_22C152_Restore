@interface BTStateWatcher
+ (id)monitorBuddyStateWithAction:(id)a3;
+ (id)monitorFirstUnlockWithAction:(id)a3;
+ (id)monitorURL:(id)a3 action:(id)a4;
- (BOOL)isWatchingBuddy;
- (BOOL)start;
- (BOOL)triggered;
- (BTStateWatcher)initWithURL:(id)a3 action:(id)a4;
- (NSString)targetFilename;
- (NSURL)directoryURL;
- (OS_dispatch_source)dispatchSourceAbort;
- (OS_dispatch_source)dispatchSourceChange;
- (id)block;
- (int)fd;
- (void)cancel;
- (void)dealloc;
- (void)directoryChanged;
- (void)fileDiscovered;
- (void)setBlock:(id)a3;
- (void)setDirectoryURL:(id)a3;
- (void)setDispatchSourceAbort:(id)a3;
- (void)setDispatchSourceChange:(id)a3;
- (void)setFd:(int)a3;
- (void)setIsWatchingBuddy:(BOOL)a3;
- (void)setTargetFilename:(id)a3;
- (void)setTriggered:(BOOL)a3;
@end

@implementation BTStateWatcher

- (BTStateWatcher)initWithURL:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)BTStateWatcher;
  v8 = [(BTStateWatcher *)&v19 init];
  if (v8)
  {
    v9 = v8;
    CFURLRef v10 = [v6 standardizedURL];
    v11 = (__CFString *)CFURLCopyPath(v10);
    unsigned int v12 = [(__CFString *)v11 hasSuffix:@"/"];
    CFRelease(v11);
    v18.receiver = v9;
    v18.super_class = (Class)BTStateWatcher;
    v13 = [(BTStateWatcher *)&v18 init];
    v14 = v13;
    if (v12)
    {
      [(BTStateWatcher *)v13 setDirectoryURL:v10];
      [(BTStateWatcher *)v14 setTargetFilename:0];
    }
    else
    {
      v15 = [(__CFURL *)v10 URLByDeletingLastPathComponent];
      [(BTStateWatcher *)v14 setDirectoryURL:v15];

      v16 = [(__CFURL *)v10 lastPathComponent];
      [(BTStateWatcher *)v14 setTargetFilename:v16];
    }
    [(BTStateWatcher *)v14 setBlock:v7];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)dealloc
{
  [(BTStateWatcher *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)BTStateWatcher;
  [(BTStateWatcher *)&v3 dealloc];
}

- (BOOL)start
{
  objc_super v3 = [(BTStateWatcher *)self block];

  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000793D0;
    block[3] = &unk_100232710;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    return 1;
  }
  else
  {
    objc_initWeak(&location, self);
    v5 = (id)qword_10026AAD8;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = [(BTStateWatcher *)self directoryURL];
      id v7 = [(BTStateWatcher *)self targetFilename];
      sub_1001B7A18(v6, v7, v40, v5);
    }

    v8 = [(BTStateWatcher *)self directoryURL];
    id v9 = [v8 path];
    -[BTStateWatcher setFd:](self, "setFd:", open((const char *)[v9 fileSystemRepresentation], 0x8000));

    int v10 = [(BTStateWatcher *)self fd];
    BOOL v4 = v10 > 0;
    if (v10 < 1)
    {
      v25 = (id)qword_10026AAD8;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = [(BTStateWatcher *)self directoryURL];
        sub_1001B79C0(v26, v39, v25);
      }
    }
    else
    {
      uintptr_t v11 = [(BTStateWatcher *)self fd];
      unsigned int v12 = dispatch_get_global_queue(0, 0);
      dispatch_source_t v13 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vnode, v11, 2uLL, v12);
      [(BTStateWatcher *)self setDispatchSourceChange:v13];

      v14 = [(BTStateWatcher *)self dispatchSourceChange];
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100079454;
      handler[3] = &unk_1002346B0;
      handler[4] = self;
      objc_copyWeak(&v35, &location);
      dispatch_source_set_event_handler(v14, handler);

      v15 = [(BTStateWatcher *)self dispatchSourceChange];
      dispatch_resume(v15);

      v16 = (id)qword_10026AAD8;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v17 = [(BTStateWatcher *)self directoryURL];
        objc_super v18 = [v17 path];
        sub_1001B7960(v18, v39, v16, v17);
      }

      dispatch_source_t v19 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vnode, [(BTStateWatcher *)self fd], 0x61uLL, v12);
      [(BTStateWatcher *)self setDispatchSourceAbort:v19];

      v20 = [(BTStateWatcher *)self dispatchSourceAbort];
      v28 = _NSConcreteStackBlock;
      uint64_t v29 = 3221225472;
      v30 = sub_1000794B4;
      v31 = &unk_1002346B0;
      v32 = self;
      objc_copyWeak(&v33, &location);
      dispatch_source_set_event_handler(v20, &v28);

      v21 = [(BTStateWatcher *)self dispatchSourceAbort];
      dispatch_resume(v21);

      v22 = (id)qword_10026AAD8;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v23 = [(BTStateWatcher *)self directoryURL];
        v24 = [v23 path];
        sub_1001B7900(v24, buf, v22, v23);
      }

      objc_destroyWeak(&v33);
      objc_destroyWeak(&v35);
    }
    objc_destroyWeak(&location);
  }
  return v4;
}

+ (id)monitorURL:(id)a3 action:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[BTStateWatcher alloc] initWithURL:v6 action:v5];

  v8 = [(BTStateWatcher *)v7 targetFilename];

  if (v8)
  {
    id v9 = qword_10026AAD8;
    if (os_log_type_enabled((os_log_t)qword_10026AAD8, OS_LOG_TYPE_DEBUG)) {
      sub_1001B7BD8(v9);
    }
    [(BTStateWatcher *)v7 directoryChanged];
  }
  if (![(BTStateWatcher *)v7 triggered] && ![(BTStateWatcher *)v7 start])
  {
    [(BTStateWatcher *)v7 cancel];

    id v7 = 0;
  }

  return v7;
}

+ (id)monitorBuddyStateWithAction:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  [v4 setIsWatchingBuddy:1];
  [v4 setBlock:v3];

  int out_token = -1;
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  uintptr_t v11 = sub_10007972C;
  unsigned int v12 = &unk_100234BD0;
  int v14 = -1;
  id v13 = v4;
  id v5 = v4;
  notify_register_dispatch("com.apple.purplebuddy.setupdone", &out_token, (dispatch_queue_t)&_dispatch_main_q, &v9);
  if (objc_msgSend(v5, "start", v9, v10, v11, v12)) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

+ (id)monitorFirstUnlockWithAction:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  [v4 setBlock:v3];

  int out_token = -1;
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  uintptr_t v11 = sub_1000798D4;
  unsigned int v12 = &unk_100234BD0;
  int v14 = -1;
  id v13 = v4;
  id v5 = v4;
  notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, (dispatch_queue_t)&_dispatch_main_q, &v9);
  if (objc_msgSend(v5, "start", v9, v10, v11, v12)) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (void)directoryChanged
{
  id v3 = [(BTStateWatcher *)self targetFilename];

  if (v3)
  {
    BOOL v4 = +[NSFileManager defaultManager];
    id v5 = [(BTStateWatcher *)self directoryURL];
    id v23 = 0;
    id v6 = [v4 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:0 options:0 error:&v23];
    id v7 = v23;

    if (v7)
    {
      v8 = (void *)qword_10026AAD8;
      if (os_log_type_enabled((os_log_t)qword_10026AAD8, OS_LOG_TYPE_ERROR)) {
        sub_1001B7CAC(v8, self, (uint64_t)v7);
      }
      [(BTStateWatcher *)self cancel];
    }
    else
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      objc_super v18 = v6;
      id v9 = v6;
      id v10 = [v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v20;
        while (2)
        {
          id v13 = 0;
          do
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            int v14 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)v13) lastPathComponent];
            v15 = [(BTStateWatcher *)self targetFilename];
            unsigned int v16 = [v14 isEqualToString:v15];

            if (v16)
            {
              [(BTStateWatcher *)self fileDiscovered];

              id v6 = v18;
              goto LABEL_18;
            }
            id v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          id v11 = [v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      v17 = (void *)qword_10026AAD8;
      id v6 = v18;
      if (os_log_type_enabled((os_log_t)qword_10026AAD8, OS_LOG_TYPE_DEBUG)) {
        sub_1001B7C1C(v17);
      }
    }
LABEL_18:
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100079C08;
    block[3] = &unk_100232710;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)fileDiscovered
{
  id v3 = (void *)qword_10026AAD8;
  if (os_log_type_enabled((os_log_t)qword_10026AAD8, OS_LOG_TYPE_DEBUG)) {
    sub_1001B7D68(v3);
  }
  [(BTStateWatcher *)self setTriggered:1];
  [(BTStateWatcher *)self cancel];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100079D14;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)cancel
{
  id v3 = qword_10026AAD8;
  if (os_log_type_enabled((os_log_t)qword_10026AAD8, OS_LOG_TYPE_DEBUG)) {
    sub_1001B7DF8(v3);
  }
  BOOL v4 = [(BTStateWatcher *)self dispatchSourceChange];

  if (v4)
  {
    id v5 = [(BTStateWatcher *)self dispatchSourceChange];
    dispatch_source_cancel(v5);

    [(BTStateWatcher *)self setDispatchSourceChange:0];
  }
  id v6 = [(BTStateWatcher *)self dispatchSourceAbort];

  if (v6)
  {
    id v7 = [(BTStateWatcher *)self dispatchSourceAbort];
    dispatch_source_cancel(v7);

    [(BTStateWatcher *)self setDispatchSourceAbort:0];
  }
  if ([(BTStateWatcher *)self fd] >= 1)
  {
    close([(BTStateWatcher *)self fd]);
    [(BTStateWatcher *)self setFd:0];
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  if (DarwinNotifyCenter) {
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, BYSetupAssistantFinishedDarwinNotification, 0);
  }
}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (void)setDirectoryURL:(id)a3
{
}

- (NSString)targetFilename
{
  return self->_targetFilename;
}

- (void)setTargetFilename:(id)a3
{
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (int)fd
{
  return self->_fd;
}

- (void)setFd:(int)a3
{
  self->_fd = a3;
}

- (OS_dispatch_source)dispatchSourceChange
{
  return self->_dispatchSourceChange;
}

- (void)setDispatchSourceChange:(id)a3
{
}

- (OS_dispatch_source)dispatchSourceAbort
{
  return self->_dispatchSourceAbort;
}

- (void)setDispatchSourceAbort:(id)a3
{
}

- (BOOL)triggered
{
  return self->_triggered;
}

- (void)setTriggered:(BOOL)a3
{
  self->_triggered = a3;
}

- (BOOL)isWatchingBuddy
{
  return self->_isWatchingBuddy;
}

- (void)setIsWatchingBuddy:(BOOL)a3
{
  self->_isWatchingBuddy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchSourceAbort, 0);
  objc_storeStrong((id *)&self->_dispatchSourceChange, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_targetFilename, 0);

  objc_storeStrong((id *)&self->_directoryURL, 0);
}

@end