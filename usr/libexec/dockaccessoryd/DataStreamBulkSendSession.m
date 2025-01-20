@interface DataStreamBulkSendSession
- (BOOL)isActive;
- (DataStreamBulkSendProtocol)bulkSendProtocol;
- (DataStreamBulkSendSession)initWithProtocol:(id)a3 sessionIdentifier:(id)a4 queue:(id)a5 logIdentifier:(id)a6;
- (NSError)pendingError;
- (NSMutableArray)pendingReads;
- (NSNumber)sessionIdentifier;
- (NSString)logIdentifier;
- (OS_dispatch_queue)queue;
- (id)activeReadHandler;
- (void)_closeSession;
- (void)_pumpReadDataIfPossible;
- (void)asyncHandleIncomingPackets:(id)a3 isEof:(BOOL)a4;
- (void)asyncHandleRemoteCloseWithError:(id)a3;
- (void)cancelWithReason:(unsigned __int16)a3 completion:(id)a4;
- (void)dealloc;
- (void)read:(id)a3;
- (void)setActiveReadHandler:(id)a3;
- (void)setPendingError:(id)a3;
- (void)setPendingReads:(id)a3;
@end

@implementation DataStreamBulkSendSession

- (DataStreamBulkSendSession)initWithProtocol:(id)a3 sessionIdentifier:(id)a4 queue:(id)a5 logIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)DataStreamBulkSendSession;
  v14 = [(DataStreamBulkSendSession *)&v21 init];
  v15 = v14;
  if (v14)
  {
    *(_WORD *)&v14->_isClosed = 0;
    objc_storeWeak((id *)&v14->_bulkSendProtocol, v10);
    objc_storeStrong((id *)&v15->_sessionIdentifier, a4);
    objc_storeStrong((id *)&v15->_queue, a5);
    uint64_t v16 = +[NSMutableArray array];
    pendingReads = v15->_pendingReads;
    v15->_pendingReads = (NSMutableArray *)v16;

    uint64_t v18 = +[NSString stringWithFormat:@"%@/%@", v13, v11];
    logIdentifier = v15->_logIdentifier;
    v15->_logIdentifier = (NSString *)v18;
  }
  return v15;
}

- (void)dealloc
{
  if (!self->_isClosed)
  {
    v3 = [(DataStreamBulkSendSession *)self bulkSendProtocol];
    if (v3)
    {
      v4 = [(DataStreamBulkSendSession *)self sessionIdentifier];
      [v3 asyncBulkSendSessionDidCancelSessionWithIdentifier:v4 reason:5 hadReceivedEof:self->_hasReceivedEof completion:&stru_100273308];
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)DataStreamBulkSendSession;
  [(DataStreamBulkSendSession *)&v5 dealloc];
}

- (BOOL)isActive
{
  if (self->_isClosed) {
    return 0;
  }
  v4 = [(DataStreamBulkSendSession *)self pendingReads];
  if ([v4 count])
  {

    return 1;
  }
  objc_super v5 = [(DataStreamBulkSendSession *)self pendingError];

  if (v5) {
    return 1;
  }
  return !self->_hasReceivedEof;
}

- (void)cancelWithReason:(unsigned __int16)a3 completion:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  [(DataStreamBulkSendSession *)self _closeSession];
  v7 = [(DataStreamBulkSendSession *)self bulkSendProtocol];
  if (v7)
  {
    v8 = [(DataStreamBulkSendSession *)self sessionIdentifier];
    [v7 asyncBulkSendSessionDidCancelSessionWithIdentifier:v8 reason:v4 hadReceivedEof:self->_hasReceivedEof completion:v6];
  }
  else
  {
    v9 = self;
    id v10 = sub_100083F74();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = sub_100083FD0(v9);
      int v13 = 138543362;
      v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@No Bulk send protocol found", (uint8_t *)&v13, 0xCu);
    }
    id v12 = +[NSError errorWithDomain:@"DKErrorDomain" code:1 userInfo:0];
    (*((void (**)(id, void *))v6 + 2))(v6, v12);
  }
}

- (void)read:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(DataStreamBulkSendSession *)self queue];
  dispatch_assert_queue_V2(v5);

  if (self->_isClosed)
  {
    id v6 = [(DataStreamBulkSendSession *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002CF28;
    block[3] = &unk_100273330;
    id v9 = v4;
    dispatch_async(v6, block);
  }
  else
  {
    v7 = [(DataStreamBulkSendSession *)self activeReadHandler];

    if (v7)
    {
      [(DataStreamBulkSendSession *)self cancelWithReason:5 completion:&stru_100273350];
    }
    else
    {
      [(DataStreamBulkSendSession *)self setActiveReadHandler:v4];
      [(DataStreamBulkSendSession *)self _pumpReadDataIfPossible];
    }
  }
}

- (void)asyncHandleIncomingPackets:(id)a3 isEof:(BOOL)a4
{
  id v6 = a3;
  v7 = [(DataStreamBulkSendSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002D000;
  block[3] = &unk_100273150;
  BOOL v11 = a4;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)asyncHandleRemoteCloseWithError:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(DataStreamBulkSendSession *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002D1C4;
  v7[3] = &unk_100273040;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_closeSession
{
  if (!self->_isClosed)
  {
    self->_isClosed = 1;
    v3 = [(DataStreamBulkSendSession *)self activeReadHandler];
    [(DataStreamBulkSendSession *)self setActiveReadHandler:0];
    if (v3)
    {
      id v4 = [(DataStreamBulkSendSession *)self queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10002D38C;
      block[3] = &unk_100273330;
      id v6 = v3;
      dispatch_async(v4, block);
    }
  }
}

- (void)_pumpReadDataIfPossible
{
  v3 = [(DataStreamBulkSendSession *)self activeReadHandler];

  if (v3)
  {
    id v4 = [(DataStreamBulkSendSession *)self pendingReads];
    objc_super v5 = [v4 hmf_maybeDequeue];

    if (!v5)
    {
      id v6 = [(DataStreamBulkSendSession *)self pendingError];
      [(DataStreamBulkSendSession *)self setPendingError:0];
      if (v6) {
        goto LABEL_5;
      }
      if (!self->_hasReceivedEof) {
        goto LABEL_6;
      }
    }
    id v6 = 0;
LABEL_5:
    v7 = [(DataStreamBulkSendSession *)self activeReadHandler];
    [(DataStreamBulkSendSession *)self setActiveReadHandler:0];
    id v8 = [(DataStreamBulkSendSession *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002D500;
    block[3] = &unk_100273378;
    id v14 = v7;
    id v12 = v5;
    id v13 = v6;
    id v9 = v6;
    id v10 = v7;
    dispatch_async(v8, block);

LABEL_6:
  }
}

- (DataStreamBulkSendProtocol)bulkSendProtocol
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bulkSendProtocol);

  return (DataStreamBulkSendProtocol *)WeakRetained;
}

- (NSNumber)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)activeReadHandler
{
  return self->_activeReadHandler;
}

- (void)setActiveReadHandler:(id)a3
{
}

- (NSMutableArray)pendingReads
{
  return self->_pendingReads;
}

- (void)setPendingReads:(id)a3
{
}

- (NSError)pendingError
{
  return self->_pendingError;
}

- (void)setPendingError:(id)a3
{
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingError, 0);
  objc_storeStrong((id *)&self->_pendingReads, 0);
  objc_storeStrong(&self->_activeReadHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);

  objc_destroyWeak((id *)&self->_bulkSendProtocol);
}

@end