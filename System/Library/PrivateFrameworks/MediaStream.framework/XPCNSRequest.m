@interface XPCNSRequest
- (NSCoding)message;
- (NSData)data;
- (XPCNSRequest)initWithXPCRequest:(id)a3;
- (XPCRequest)request;
- (void)sendReply:(id)a3;
@end

@implementation XPCNSRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

- (XPCRequest)request
{
  return self->_request;
}

- (NSData)data
{
  return self->_data;
}

- (NSCoding)message
{
  return self->_message;
}

- (void)sendReply:(id)a3
{
  request = self->_request;
  id v5 = a3;
  v6 = [(XPCRequest *)request reply];
  int inserted = _insertMessage(v6, v5, 0, 0, 0);

  if (inserted)
  {
    v8 = self->_request;
    [(XPCRequest *)v8 sendReply];
  }
  else if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
  {
    _XPCLog(3, @"%@: Cannot send reply.", v9, v10, v11, v12, v13, v14, (uint64_t)self);
  }
}

- (XPCNSRequest)initWithXPCRequest:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)XPCNSRequest;
  v6 = [(XPCNSRequest *)&v23 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    v8 = [v5 message];
    id v21 = 0;
    id v22 = 0;
    int v9 = _unpack(v8, &v22, &v21);
    id v10 = v22;
    id v11 = v22;
    id v12 = v21;
    id v13 = v21;

    if (v9)
    {
      objc_storeStrong((id *)&v7->_message, v10);
      objc_storeStrong((id *)&v7->_data, v12);
    }
    else
    {
      if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))()) {
        _XPCLog(3, @"%@: Could not initialize object.", v14, v15, v16, v17, v18, v19, (uint64_t)v7);
      }

      v7 = 0;
    }
  }
  return v7;
}

@end