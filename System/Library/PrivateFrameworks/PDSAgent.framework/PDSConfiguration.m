@interface PDSConfiguration
- (NSString)pushHandlerPort;
- (NSURL)daemonRootDirectory;
- (OS_dispatch_queue)queue;
- (OS_dispatch_workloop)workloop;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setDaemonRootDirectory:(id)a3;
- (void)setPushHandlerPort:(id)a3;
- (void)setQueue:(id)a3;
- (void)setWorkloop:(id)a3;
@end

@implementation PDSConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(PDSConfiguration *)self queue];
  [v4 setQueue:v5];

  v6 = [(PDSConfiguration *)self workloop];
  [v4 setWorkloop:v6];

  v7 = [(PDSConfiguration *)self daemonRootDirectory];
  v8 = (void *)[v7 copy];
  [v4 setDaemonRootDirectory:v8];

  v9 = [(PDSConfiguration *)self pushHandlerPort];
  v10 = (void *)[v9 copy];
  [v4 setPushHandlerPort:v10];

  return v4;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PDSConfiguration *)self queue];
  v6 = [(PDSConfiguration *)self workloop];
  v7 = [(PDSConfiguration *)self daemonRootDirectory];
  v8 = [(PDSConfiguration *)self pushHandlerPort];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; queue = %p; workloop = %p; daemonRootDirectory = %@; pushHandlerPort = %@>",
    v4,
    self,
    v5,
    v6,
    v7,
  v9 = v8);

  return v9;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_workloop)workloop
{
  return self->_workloop;
}

- (void)setWorkloop:(id)a3
{
}

- (NSURL)daemonRootDirectory
{
  return self->_daemonRootDirectory;
}

- (void)setDaemonRootDirectory:(id)a3
{
}

- (NSString)pushHandlerPort
{
  return self->_pushHandlerPort;
}

- (void)setPushHandlerPort:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushHandlerPort, 0);
  objc_storeStrong((id *)&self->_daemonRootDirectory, 0);
  objc_storeStrong((id *)&self->_workloop, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end