@interface SDManagedBrowser
+ (id)sharedBrowser;
- (NSArray)nodes;
- (SDManagedBrowser)init;
- (void)setServers:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation SDManagedBrowser

+ (id)sharedBrowser
{
  if (qword_1009802C0 != -1) {
    dispatch_once(&qword_1009802C0, &stru_1008CFD50);
  }
  v2 = (void *)qword_1009802C8;

  return v2;
}

- (SDManagedBrowser)init
{
  v6.receiver = self;
  v6.super_class = (Class)SDManagedBrowser;
  v2 = [(SDManagedBrowser *)&v6 init];
  v3 = v2;
  if (v2)
  {
    servers = v2->_servers;
    v2->_servers = 0;

    v3->_clientCount = 0;
    v3->_sendNotification = 0;
  }
  return v3;
}

- (void)setServers:(id)a3
{
  id v5 = a3;
  if (sub_1000D9194(self->_servers, v5))
  {
    objc_storeStrong((id *)&self->_servers, a3);
    self->_sendNotification = 1;
  }
}

- (NSArray)nodes
{
  return [(NSDictionary *)self->_servers allValues];
}

- (void)start
{
  int clientCount = self->_clientCount;
  self->_int clientCount = clientCount + 1;
  if (!clientCount)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001BD974;
    block[3] = &unk_1008CA4B8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)stop
{
  int v2 = self->_clientCount - 1;
  self->_int clientCount = v2;
  if (!v2)
  {
    servers = self->_servers;
    self->_servers = 0;
  }
}

- (void).cxx_destruct
{
}

@end