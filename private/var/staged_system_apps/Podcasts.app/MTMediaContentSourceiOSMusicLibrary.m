@interface MTMediaContentSourceiOSMusicLibrary
+ (id)sharedInstance;
- (BOOL)iTunesMatchEnabled;
- (MTMediaContentSourceiOSMusicLibrary)init;
- (OS_dispatch_queue)workQueue;
- (void)determineiTunesMatchEnabledWithCompletion:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation MTMediaContentSourceiOSMusicLibrary

- (MTMediaContentSourceiOSMusicLibrary)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTMediaContentSourceiOSMusicLibrary;
  v2 = [(MTMediaContentSourceiOSMusicLibrary *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -15);
    dispatch_queue_t v4 = dispatch_queue_create("MTMediaContentSourceiOSMusicLibrary", v3);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)determineiTunesMatchEnabledWithCompletion:(id)a3
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100058BC8;
  v10[3] = &unk_100552F10;
  id v11 = a3;
  id v4 = v11;
  v5 = objc_retainBlock(v10);
  v6 = [(MTMediaContentSourceiOSMusicLibrary *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011CE8;
  block[3] = &unk_10054D738;
  block[4] = self;
  id v9 = v5;
  objc_super v7 = v5;
  dispatch_async(v6, block);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (BOOL)iTunesMatchEnabled
{
  return self->_iTunesMatchEnabled;
}

+ (id)sharedInstance
{
  if (qword_10060A920 != -1) {
    dispatch_once(&qword_10060A920, &stru_100552EE8);
  }
  v2 = (void *)qword_10060A928;

  return v2;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end