@interface fileRef
- (BOOL)hasConflict:(unsigned int)a3;
- (NSString)streamName;
- (OS_dispatch_queue)refSyncQueue;
- (SMBNode)fidCtx;
- (fileRef)initWithMode:(unsigned int)a3;
- (int)reconnState;
- (unsigned)createDisposition;
- (unsigned)decRef;
- (unsigned)desiredAccess;
- (unsigned)openMode;
- (unsigned)refCount;
- (unsigned)shareMode;
- (void)addRef;
- (void)dealloc;
- (void)setCreateDisposition:(unsigned int)a3;
- (void)setDesiredAccess:(unsigned int)a3;
- (void)setFidCtx:(id)a3;
- (void)setOpenMode:(unsigned int)a3;
- (void)setReconnState:(int)a3;
- (void)setRefCount:(unsigned int)a3;
- (void)setRefSyncQueue:(id)a3;
- (void)setShareMode:(unsigned int)a3;
- (void)setStreamName:(id)a3;
@end

@implementation fileRef

- (fileRef)initWithMode:(unsigned int)a3
{
  v9.receiver = self;
  v9.super_class = (Class)fileRef;
  v4 = [(fileRef *)&v9 init];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.SMBProvider.refSyncQueue", 0);
    refSyncQueue = v4->_refSyncQueue;
    v4->_refSyncQueue = (OS_dispatch_queue *)v5;

    v4->_reconnState = 0;
    v4->_openMode = a3;
    streamName = v4->_streamName;
    v4->_streamName = 0;

    v4->_refCount = 0;
  }
  return v4;
}

- (BOOL)hasConflict:(unsigned int)a3
{
  char v3 = a3;
  if ((self->_openMode & 0x20) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005796C();
    }
    goto LABEL_14;
  }
  unsigned int v5 = (a3 >> 1) & ((self->_openMode & 0x10) >> 4);
  if (v5 == 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000578FC();
    if ((v3 & 0x20) == 0) {
      goto LABEL_8;
    }
  }
  else if ((v3 & 0x20) == 0)
  {
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10005788C();
  }
  LOBYTE(v5) = 1;
LABEL_8:
  if ((v3 & 0x10) != 0 && (self->_openMode & 2) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005781C();
    }
LABEL_14:
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (void)addRef
{
  char v3 = [(fileRef *)self refSyncQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C3A8;
  block[3] = &unk_100088838;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (unsigned)decRef
{
  v2 = self;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  char v3 = [(fileRef *)self refSyncQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002C494;
  v5[3] = &unk_100088810;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)fileRef;
  [(fileRef *)&v2 dealloc];
}

- (OS_dispatch_queue)refSyncQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRefSyncQueue:(id)a3
{
}

- (int)reconnState
{
  return self->_reconnState;
}

- (void)setReconnState:(int)a3
{
  self->_reconnState = a3;
}

- (unsigned)openMode
{
  return self->_openMode;
}

- (void)setOpenMode:(unsigned int)a3
{
  self->_openMode = a3;
}

- (unsigned)refCount
{
  return self->_refCount;
}

- (void)setRefCount:(unsigned int)a3
{
  self->_refCount = a3;
}

- (SMBNode)fidCtx
{
  return (SMBNode *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFidCtx:(id)a3
{
}

- (unsigned)shareMode
{
  return self->_shareMode;
}

- (void)setShareMode:(unsigned int)a3
{
  self->_shareMode = a3;
}

- (unsigned)desiredAccess
{
  return self->_desiredAccess;
}

- (void)setDesiredAccess:(unsigned int)a3
{
  self->_desiredAccess = a3;
}

- (unsigned)createDisposition
{
  return self->_createDisposition;
}

- (void)setCreateDisposition:(unsigned int)a3
{
  self->_createDisposition = a3;
}

- (NSString)streamName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setStreamName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamName, 0);
  objc_storeStrong((id *)&self->_fidCtx, 0);
  objc_storeStrong((id *)&self->_refSyncQueue, 0);
}

@end