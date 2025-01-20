@interface _NFControllerManager
- (BOOL)isUnifiedAccess:(id)a3;
- (NFCControllerDelegate)delegate;
- (_NFControllerManager)initWithQueue:(id)a3 driverWrapper:(id)a4;
- (void)decodeSecureElementTransaction:(id)a3 event:(id)a4;
- (void)driverRSSIStatsWithTotalSamples:(unsigned int)a3 avgRSSI:(unsigned int)a4 maxRSSI:(unsigned int)a5 minRSSI:(unsigned int)a6;
- (void)initSETransactionsStates;
- (void)log:(unsigned __int8)a3 msg:(id)a4;
- (void)notifyTransactionEvent:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation _NFControllerManager

- (void)log:(unsigned __int8)a3 msg:(id)a4
{
  id v4 = a4;
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(5, "%s:%i %s", "-[_NFControllerManager log:msg:]", 66, (const char *)[v4 UTF8String]);
  }
  v6 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v8 = "-[_NFControllerManager log:msg:]";
    __int16 v9 = 1024;
    int v10 = 66;
    __int16 v11 = 2080;
    id v12 = [v4 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s", buf, 0x1Cu);
  }
}

- (void)notifyTransactionEvent:(id)a3
{
  id v5 = a3;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DBD80;
  block[3] = &unk_100301C90;
  id v9 = v5;
  int v10 = self;
  SEL v11 = a2;
  id v7 = v5;
  dispatch_async(workQueue, block);
}

- (_NFControllerManager)initWithQueue:(id)a3 driverWrapper:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_NFControllerManager;
  id v9 = [(_NFControllerManager *)&v12 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workQueue, a3);
    objc_storeStrong((id *)&v10->_driverWrapper, a4);
    +[AppletTranslator initLibraryWithDelegate:v10];
  }

  return v10;
}

- (void)initSETransactionsStates
{
  driverWrapper = self->_driverWrapper;
  if (driverWrapper) {
    driverWrapper->_seDelegate = (NFDriverWrapperTransactionDelegate *)self;
  }
}

- (BOOL)isUnifiedAccess:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSData) initWithBytes:&unk_10028394E length:7];
  id v5 = [v4 NF_asHexString];

  id v6 = [objc_alloc((Class)NSData) initWithBytes:&unk_100283955 length:7];
  id v7 = [v6 NF_asHexString];

  id v8 = [objc_alloc((Class)NSData) initWithBytes:&unk_10028395C length:9];
  id v9 = [v8 NF_asHexString];

  if (([v3 hasPrefix:v5] & 1) != 0
    || ([v3 hasPrefix:v7] & 1) != 0)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    unsigned __int8 v10 = [v3 hasPrefix:v9];
  }

  return v10;
}

- (void)decodeSecureElementTransaction:(id)a3 event:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  workQueue = self->_workQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000DEDC4;
  v12[3] = &unk_100301CE0;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  SEL v15 = a2;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(workQueue, v12);
}

- (void)driverRSSIStatsWithTotalSamples:(unsigned int)a3 avgRSSI:(unsigned int)a4 maxRSSI:(unsigned int)a5 minRSSI:(unsigned int)a6
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E1B30;
  block[3] = &unk_100304108;
  void block[4] = self;
  unsigned int v8 = a3;
  unsigned int v9 = a4;
  unsigned int v10 = a5;
  unsigned int v11 = a6;
  dispatch_async(workQueue, block);
}

- (NFCControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NFCControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_driverWrapper, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end