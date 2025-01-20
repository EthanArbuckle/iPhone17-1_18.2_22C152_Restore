@interface ChildProcess
- (BOOL)exited;
- (ChildProcess)init;
- (NSString)device;
- (NSUUID)UUID;
- (NSXPCConnection)helper;
- (OS_os_transaction)osTransaction;
- (id)initForDevice:(id)a3 withConnection:(id)a4;
- (int)pid;
- (void)dealloc;
- (void)setDevice:(id)a3;
- (void)setExited:(BOOL)a3;
- (void)setHelper:(id)a3;
- (void)setOsTransaction:(id)a3;
- (void)setPid:(int)a3;
- (void)setUUID:(id)a3;
@end

@implementation ChildProcess

- (ChildProcess)init
{
  v3.receiver = self;
  v3.super_class = (Class)ChildProcess;
  return [(ChildProcess *)&v3 init];
}

- (id)initForDevice:(id)a3 withConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(ChildProcess *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_helper, a4);
    v10->_exited = 0;
    id v11 = +[NSString stringWithFormat:@"transaction for device %@", v7];
    [v11 UTF8String];
    uint64_t v12 = os_transaction_create();
    osTransaction = v10->_osTransaction;
    v10->_osTransaction = (OS_os_transaction *)v12;
  }
  return v10;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ChildProcess;
  [(ChildProcess *)&v2 dealloc];
}

- (NSString)device
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDevice:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSXPCConnection)helper
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHelper:(id)a3
{
}

- (BOOL)exited
{
  return self->_exited;
}

- (void)setExited:(BOOL)a3
{
  self->_exited = a3;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUUID:(id)a3
{
}

- (OS_os_transaction)osTransaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOsTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osTransaction, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_helper, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end