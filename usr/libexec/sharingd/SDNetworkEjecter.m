@interface SDNetworkEjecter
- (NSNumber)flags;
- (NSString)protocol;
- (SDNetworkEjecter)initWithNode:(__SFNode *)a3;
- (SDNetworkEjecterDelegate)delegate;
- (int)start;
- (void)dealloc;
- (void)eject;
- (void)notifyClientAboutEject:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setFlags:(id)a3;
- (void)setProtocol:(id)a3;
- (void)stop;
@end

@implementation SDNetworkEjecter

- (SDNetworkEjecter)initWithNode:(__SFNode *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SDNetworkEjecter;
  v4 = [(SDNetworkEjecter *)&v9 init];
  v5 = v4;
  if (v4)
  {
    flags = v4->_flags;
    v4->_flags = 0;

    protocol = v5->_protocol;
    v5->_protocol = 0;

    *(void *)&v5->_mountedCount = 0;
    v5->_node = (__SFNode *)CFRetain(a3);
  }
  return v5;
}

- (void)dealloc
{
  CFRelease(self->_node);
  v3.receiver = self;
  v3.super_class = (Class)SDNetworkEjecter;
  [(SDNetworkEjecter *)&v3 dealloc];
}

- (void)notifyClientAboutEject:(int)a3
{
  if (!a3)
  {
    int mountedCount = self->_mountedCount;
    if (mountedCount)
    {
      int v6 = self->_ejectedCount + 1;
      self->_ejectedCount = v6;
      if (v6 != mountedCount) {
        return;
      }
    }
    SFNodeSetMountPoint();
    SFNodeRemoveKind();
    SFNodeSetConnectionState();
  }
  id v10 = (id)objc_opt_new();
  [v10 setObject:self->_node forKeyedSubscript:kSFOperationNodeKey];
  [v10 setObject:self->_flags forKeyedSubscript:kSFOperationFlagsKey];
  [v10 setObject:self->_protocol forKeyedSubscript:kSFOperationProtocolKey];
  if (a3)
  {
    v7 = +[NSError errorWithDomain:@"SFNodeError" code:a3 userInfo:0];
    [v10 setObject:v7 forKeyedSubscript:kSFOperationErrorKey];

    uint64_t v8 = 10;
  }
  else
  {
    uint64_t v8 = 9;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained networkEjecter:self event:v8 withResults:v10];
}

- (void)eject
{
  if (SFNodeIsMounted())
  {
    unint64_t v3 = [(NSNumber *)self->_flags longValue];
    if (SFNodeIsSharePoint())
    {
      uint64_t v4 = SFNodeCopyMountPoint();
      v5 = (void *)v4;
      if (v4)
      {
        uint64_t v10 = v4;
        int v6 = +[NSArray arrayWithObjects:&v10 count:1];
        [(SDNetworkEjecter *)self ejectMountPoints:v6 useAssistant:(v3 >> 1) & 1];
      }
      else
      {
        [(SDNetworkEjecter *)self notifyClientAboutEject:0xFFFFFFFFLL];
      }
    }
    else if (SFNodeIsServer())
    {
      v7 = +[SDStatusMonitor sharedMonitor];
      uint64_t v8 = (void *)SFNodeCopyRealName();
      if ([(NSString *)self->_protocol isEqual:kSFNodeProtocolODisk]) {
        [v7 odiskMountPointsForServer:v8];
      }
      else {
      id v9 = [v7 mountPointsForServer:v8];
      }
      [(SDNetworkEjecter *)self ejectMountPoints:v9 useAssistant:(v3 >> 1) & 1];
    }
  }
  else
  {
    [(SDNetworkEjecter *)self notifyClientAboutEject:0];
  }
}

- (int)start
{
  if (!self->_protocol)
  {
    sub_1001B2794();
    unint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    protocol = self->_protocol;
    self->_protocol = v3;

    if (!self->_protocol) {
      return -2;
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100137A60;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  return 0;
}

- (void)stop
{
  v2 = browser_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100137B58(v2);
  }
}

- (NSNumber)flags
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFlags:(id)a3
{
}

- (NSString)protocol
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProtocol:(id)a3
{
}

- (SDNetworkEjecterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SDNetworkEjecterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_protocol, 0);

  objc_storeStrong((id *)&self->_flags, 0);
}

@end