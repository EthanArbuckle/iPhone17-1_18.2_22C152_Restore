@interface DataStreamBulkSendSessionCandidate
- (DataStreamBulkSendProtocol)bulkSendProtocol;
- (DataStreamBulkSendSessionCandidate)initWithProtocol:(id)a3 requestHeader:(id)a4 metadata:(id)a5;
- (NSDictionary)metadata;
- (NSDictionary)requestHeader;
- (NSError)receivedFailure;
- (NSMutableArray)pendingReads;
- (void)acceptBulkSendSessionOnQueue:(id)a3 callback:(id)a4;
- (void)rejectBulkSendSessionWithStatus:(unsigned __int16)a3;
- (void)setPendingReads:(id)a3;
- (void)setReceivedFailure:(id)a3;
@end

@implementation DataStreamBulkSendSessionCandidate

- (DataStreamBulkSendSessionCandidate)initWithProtocol:(id)a3 requestHeader:(id)a4 metadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DataStreamBulkSendSessionCandidate;
  v11 = [(DataStreamBulkSendSessionCandidate *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_bulkSendProtocol, v8);
    objc_storeStrong((id *)&v12->_requestHeader, a4);
    uint64_t v13 = +[NSMutableArray array];
    pendingReads = v12->_pendingReads;
    v12->_pendingReads = (NSMutableArray *)v13;

    objc_storeStrong((id *)&v12->_metadata, a5);
  }

  return v12;
}

- (void)acceptBulkSendSessionOnQueue:(id)a3 callback:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DataStreamBulkSendSessionCandidate *)self bulkSendProtocol];
  [v8 asyncBulkSendSessionCandidate:self didAcceptOnQueue:v7 callback:v6];
}

- (void)rejectBulkSendSessionWithStatus:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [(DataStreamBulkSendSessionCandidate *)self bulkSendProtocol];
  [v5 asyncBulkSendSessionCandidate:self didRejectWithStatus:v3];
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (DataStreamBulkSendProtocol)bulkSendProtocol
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bulkSendProtocol);

  return (DataStreamBulkSendProtocol *)WeakRetained;
}

- (NSDictionary)requestHeader
{
  return self->_requestHeader;
}

- (NSMutableArray)pendingReads
{
  return self->_pendingReads;
}

- (void)setPendingReads:(id)a3
{
}

- (NSError)receivedFailure
{
  return self->_receivedFailure;
}

- (void)setReceivedFailure:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivedFailure, 0);
  objc_storeStrong((id *)&self->_pendingReads, 0);
  objc_storeStrong((id *)&self->_requestHeader, 0);
  objc_destroyWeak((id *)&self->_bulkSendProtocol);

  objc_storeStrong((id *)&self->_metadata, 0);
}

@end