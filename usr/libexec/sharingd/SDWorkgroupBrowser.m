@interface SDWorkgroupBrowser
+ (id)sharedBrowser;
- (NSArray)nodes;
- (NSSet)workgroups;
- (SDWorkgroupBrowser)init;
- (void)bonjourNodesDidChange:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation SDWorkgroupBrowser

+ (id)sharedBrowser
{
  if (qword_10097FF70 != -1) {
    dispatch_once(&qword_10097FF70, &stru_1008CD378);
  }
  v2 = (void *)qword_10097FF78;

  return v2;
}

- (SDWorkgroupBrowser)init
{
  v6.receiver = self;
  v6.super_class = (Class)SDWorkgroupBrowser;
  v2 = [(SDWorkgroupBrowser *)&v6 init];
  v3 = v2;
  if (v2)
  {
    browser = v2->_browser;
    v2->_browser = 0;

    v3->_clientCount = 0;
  }
  return v3;
}

- (NSArray)nodes
{
  return [(SDBonjourBrowser *)self->_browser nodes];
}

- (NSSet)workgroups
{
  v2 = [(SDWorkgroupBrowser *)self nodes];
  v3 = v2;
  if (v2)
  {
    v4 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v2 count]);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    objc_super v6 = (char *)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = (void *)SFNodeCopyRealName();
          [v4 addObject:v10, v12];
        }
        v7 = (char *)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    v4 = 0;
  }

  return (NSSet *)v4;
}

- (void)bonjourNodesDidChange:(id)a3
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"com.apple.sharingd.WorkgroupsChanged" object:0 userInfo:0];
}

- (void)start
{
  int clientCount = self->_clientCount;
  self->_int clientCount = clientCount + 1;
  if (!clientCount)
  {
    v4 = [SDBonjourBrowser alloc];
    CFStringRef v8 = @"_workgroups._udp.";
    id v5 = +[NSArray arrayWithObjects:&v8 count:1];
    objc_super v6 = [(SDBonjourBrowser *)v4 initWithDomain:@"local" types:v5];
    browser = self->_browser;
    self->_browser = v6;

    [(SDBonjourBrowser *)self->_browser setDelegate:self];
    [(SDBonjourBrowser *)self->_browser start];
  }
}

- (void)stop
{
  int v2 = self->_clientCount - 1;
  self->_int clientCount = v2;
  if (!v2)
  {
    [(SDBonjourBrowser *)self->_browser setDelegate:0];
    [(SDBonjourBrowser *)self->_browser invalidate];
    browser = self->_browser;
    self->_browser = 0;
  }
}

- (void).cxx_destruct
{
}

@end