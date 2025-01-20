@interface DataStreamSocket
- (BOOL)isClosed;
- (BOOL)isClosing;
- (BOOL)writeData:(id)a3 error:(id *)a4;
- (DataStreamSocket)initWithStreamProtocol:(id)a3 applicationProtocolName:(id)a4 workQueue:(id)a5;
- (DataStreamSocketDelegate)delegate;
- (DataStreamStreamProtocol)streamProtocol;
- (NSMutableArray)pendingReads;
- (NSString)applicationProtocolName;
- (OS_dispatch_queue)workQueue;
- (id)readData;
- (unint64_t)trafficClass;
- (void)_writeData:(id)a3 completion:(id)a4;
- (void)close;
- (void)closeInitiated;
- (void)closeWithError:(id)a3;
- (void)handleIncomingData:(id)a3;
- (void)setClosed:(BOOL)a3;
- (void)setClosing:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setTrafficClass:(unint64_t)a3;
- (void)writeData:(id)a3 completion:(id)a4;
@end

@implementation DataStreamSocket

- (DataStreamSocket)initWithStreamProtocol:(id)a3 applicationProtocolName:(id)a4 workQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DataStreamSocket;
  v11 = [(DataStreamSocket *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_streamProtocol, v8);
    objc_storeStrong((id *)&v12->_applicationProtocolName, a4);
    objc_storeStrong((id *)&v12->_workQueue, a5);
    *(_WORD *)&v12->_closing = 0;
    v12->_trafficClass = 0;
    uint64_t v13 = +[NSMutableArray array];
    pendingReads = v12->_pendingReads;
    v12->_pendingReads = (NSMutableArray *)v13;
  }
  return v12;
}

- (DataStreamSocketDelegate)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);

  return (DataStreamSocketDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isClosed
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_closed;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)trafficClass
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t trafficClass = self->_trafficClass;
  os_unfair_lock_unlock(p_lock);
  return trafficClass;
}

- (void)setTrafficClass:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t trafficClass = self->_trafficClass;
  self->_unint64_t trafficClass = a3;
  os_unfair_lock_unlock(p_lock);
  if (trafficClass != a3)
  {
    v7 = [(DataStreamSocket *)self workQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001E920;
    block[3] = &unk_1002730E0;
    block[4] = self;
    block[5] = trafficClass;
    block[6] = a3;
    dispatch_async(v7, block);
  }
}

- (void)close
{
}

- (BOOL)writeData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned int v7 = [(DataStreamSocket *)self isClosed];
  if (v7)
  {
    if (a4)
    {
      *a4 = +[NSError errorWithDomain:@"DKErrorDomain" code:39 userInfo:0];
    }
  }
  else
  {
    [(DataStreamSocket *)self _writeData:v6 completion:0];
  }

  return v7 ^ 1;
}

- (void)writeData:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, void *))a4;
  if ([(DataStreamSocket *)self isClosed])
  {
    unsigned int v7 = +[NSError errorWithDomain:@"DKErrorDomain" code:39 userInfo:0];
    v6[2](v6, v7);
  }
  else
  {
    [(DataStreamSocket *)self _writeData:v8 completion:v6];
  }
}

- (void)_writeData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DataStreamSocket *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001EC4C;
  block[3] = &unk_100273108;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (id)readData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = [(NSMutableArray *)self->_pendingReads hmf_maybeDequeue];
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)closeWithError:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  if (self->_closed)
  {
    self->_closing = 0;
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    *(_WORD *)&self->_closing = 256;
    os_unfair_lock_unlock(&self->_lock);
    id v5 = [(DataStreamSocket *)self workQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10001EE00;
    v6[3] = &unk_100273040;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)handleIncomingData:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_pendingReads hmf_enqueue:v4];
  os_unfair_lock_unlock(&self->_lock);
  id v5 = [(DataStreamSocket *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001EF54;
  block[3] = &unk_100273018;
  block[4] = self;
  dispatch_async(v5, block);
}

- (void)closeInitiated
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_closing = 1;

  os_unfair_lock_unlock(p_lock);
}

- (NSString)applicationProtocolName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (DataStreamStreamProtocol)streamProtocol
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_streamProtocol);

  return (DataStreamStreamProtocol *)WeakRetained;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)isClosing
{
  return self->_closing;
}

- (void)setClosing:(BOOL)a3
{
  self->_closing = a3;
}

- (void)setClosed:(BOOL)a3
{
  self->_closed = a3;
}

- (NSMutableArray)pendingReads
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingReads, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_streamProtocol);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_applicationProtocolName, 0);
}

@end