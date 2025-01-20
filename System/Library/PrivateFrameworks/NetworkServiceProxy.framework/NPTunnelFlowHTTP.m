@interface NPTunnelFlowHTTP
- (BOOL)isClientFlowClosed;
- (BOOL)receivedHeaders;
- (BOOL)responseSuccess;
- (NPTunnelFlowHTTP)initWithTunnel:(id)a3 URL:(id)a4 extraFlowProperties:(id)a5;
- (NSMutableData)responseData;
- (NSNumber)responseContentLength;
- (NSURL)url;
- (id)postCompletionHandler;
- (void)closeClientFlowWithError:(int)a3;
- (void)postData:(id)a3 withCompletionHandler:(id)a4;
- (void)sendDataToClient:(id)a3 fromTunnel:(BOOL)a4;
- (void)setPostCompletionHandler:(id)a3;
- (void)setReceivedHeaders:(BOOL)a3;
- (void)setResponseContentLength:(id)a3;
- (void)setResponseData:(id)a3;
- (void)setResponseSuccess:(BOOL)a3;
- (void)setUrl:(id)a3;
@end

@implementation NPTunnelFlowHTTP

- (NPTunnelFlowHTTP)initWithTunnel:(id)a3 URL:(id)a4 extraFlowProperties:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int bytes = 0;
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], 4uLL, &bytes) < 0)
  {
    v14 = nplog_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = __error();
      v17 = strerror(*v16);
      *(_DWORD *)buf = 136315138;
      v21 = v17;
      _os_log_error_impl(&dword_1A0FEE000, v14, OS_LOG_TYPE_ERROR, "SecRandomCopyBytes failed: %s", buf, 0xCu);
    }

    v13 = 0;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)NPTunnelFlowHTTP;
    v11 = [(NPTunnelFlow *)&v18 initWithTunnel:v8 appRule:0 hashKey:bytes extraFlowProperties:v10];
    p_isa = (id *)&v11->super.super.isa;
    if (v11)
    {
      [(NPTunnelFlow *)v11 setFallbackDisabled:1];
      objc_storeStrong(p_isa + 20, a4);
    }
    self = p_isa;
    v13 = self;
  }

  return v13;
}

- (void)postData:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  id v8 = [(NPTunnelFlowHTTP *)self url];
  id v9 = [v8 path];

  id v10 = [(NPTunnelFlowHTTP *)self postCompletionHandler];

  if (v10)
  {
    v7[2](v7, 0);
  }
  else
  {
    v11 = nplog_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v6 length];
      v13 = [(NPTunnelFlowHTTP *)self url];
      *(_DWORD *)buf = 134218242;
      uint64_t v27 = v12;
      __int16 v28 = 2112;
      v29 = v13;
      _os_log_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_DEFAULT, "Posting %lu bytes of data to %@", buf, 0x16u);
    }
    [(NPTunnelFlowHTTP *)self setPostCompletionHandler:v7];
    if (![(__CFString *)v9 length])
    {

      id v9 = @"/";
    }
    uint64_t v14 = [v6 length];
    id v15 = [NSString alloc];
    v16 = [(NPTunnelFlowHTTP *)self url];
    v17 = v16;
    if (v14)
    {
      objc_super v18 = [v16 host];
      v19 = (void *)[v15 initWithFormat:@"POST %@ HTTP/1.1\r\nHost: %@\r\nContent-Length: %lu\r\n\r\n", v9, v18, objc_msgSend(v6, "length")];
    }
    else
    {
      objc_super v18 = [v16 path];
      v20 = [(NPTunnelFlowHTTP *)self url];
      v21 = [v20 host];
      v19 = (void *)[v15 initWithFormat:@"GET %@ HTTP/1.1\r\nHost: %@\r\n\r\n", v18, v21];
    }
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    v23 = [v19 dataUsingEncoding:4];
    if (v23)
    {
      [v22 appendData:v23];
      if ([v6 length]) {
        [v22 appendData:v6];
      }
      id v24 = v22;
      dispatch_data_t v25 = dispatch_data_create((const void *)[v24 bytes], objc_msgSend(v24, "length"), 0, 0);
      [(NPTunnelFlow *)self handleAppData:v25];
    }
  }
}

- (void)sendDataToClient:(id)a3 fromTunnel:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = nplog_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    unint64_t v44 = [(NPTunnelFlow *)self hashKey];
    __int16 v45 = 2048;
    unint64_t v46 = [(NPTunnelFlow *)self identifier];
    __int16 v47 = 2048;
    uint64_t v48 = [v6 length];
    _os_log_debug_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_DEBUG, "Flow %llu (%llu) received %lu bytes of HTTP response", buf, 0x20u);
  }

  v42.receiver = self;
  v42.super_class = (Class)NPTunnelFlowHTTP;
  [(NPTunnelFlow *)&v42 sendDataToClient:v6 fromTunnel:v4];
  id v8 = [(NPTunnelFlowHTTP *)self responseData];

  if (v8)
  {
    id v9 = [(NPTunnelFlowHTTP *)self responseData];
    [v9 appendData:v6];
  }
  else
  {
    id v9 = (void *)[v6 mutableCopy];
    [(NPTunnelFlowHTTP *)self setResponseData:v9];
  }

  if (![(NPTunnelFlowHTTP *)self receivedHeaders])
  {
    id v10 = [@"\r\n\r\n" dataUsingEncoding:4];
    uint64_t v11 = objc_msgSend(v6, "rangeOfData:options:range:", v10, 0, 0, objc_msgSend(v6, "length"));
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v13 = v11;
      uint64_t v14 = v12;
      id v15 = [(NPTunnelFlowHTTP *)self responseData];
      uint64_t v16 = objc_msgSend(v15, "subdataWithRange:", 0, v13);

      v41 = (void *)v16;
      v17 = (void *)[[NSString alloc] initWithData:v16 encoding:4];
      v39 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@": \r\n"];
      v40 = v17;
      objc_super v18 = [v17 componentsSeparatedByCharactersInSet:v39];
      v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_4];
      v20 = [v18 filteredArrayUsingPredicate:v19];
      if ((unint64_t)[v20 count] >= 2)
      {
        v21 = [v20 objectAtIndexedSubscript:1];
        uint64_t v22 = [v21 integerValue];

        if (v22 == 200) {
          [(NPTunnelFlowHTTP *)self setResponseSuccess:1];
        }
      }
      unint64_t v23 = [v20 indexOfObject:@"Content-Length"];
      if (v23 != 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v24 = v23;
        if (v23 < [v20 count] - 1)
        {
          dispatch_data_t v25 = NSNumber;
          v26 = [v20 objectAtIndexedSubscript:v24 + 1];
          uint64_t v27 = objc_msgSend(v25, "numberWithInteger:", objc_msgSend(v26, "integerValue"));
          [(NPTunnelFlowHTTP *)self setResponseContentLength:v27];
        }
      }
      __int16 v28 = [(NPTunnelFlowHTTP *)self responseData];
      unint64_t v29 = [v28 length];
      unint64_t v30 = v13 + v14;

      if (v29 <= v30)
      {
        [(NPTunnelFlowHTTP *)self setResponseData:0];
      }
      else
      {
        v31 = [(NPTunnelFlowHTTP *)self responseData];
        objc_msgSend(v31, "replaceBytesInRange:withBytes:length:", 0, v30, 0, 0);
      }
      [(NPTunnelFlowHTTP *)self setReceivedHeaders:1];
    }
  }
  uint64_t v32 = [(NPTunnelFlowHTTP *)self responseContentLength];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(NPTunnelFlowHTTP *)self responseData];
    uint64_t v35 = [v34 length];
    v36 = [(NPTunnelFlowHTTP *)self responseContentLength];
    uint64_t v37 = [v36 unsignedIntegerValue];

    if (v35 == v37)
    {
      v38 = [(NPTunnelFlow *)self tunnel];
      [v38 closeFlow:self];

      [(NPTunnelFlow *)self closeFromTunnel];
    }
  }
}

BOOL __48__NPTunnelFlowHTTP_sendDataToClient_fromTunnel___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  BOOL v3 = (objc_opt_isKindOfClass() & 1) != 0 && [v2 length] != 0;

  return v3;
}

- (void)closeClientFlowWithError:(int)a3
{
  BOOL v4 = [(NPTunnelFlowHTTP *)self postCompletionHandler];

  if (v4)
  {
    v5 = [(NPTunnelFlowHTTP *)self postCompletionHandler];
    ((void (**)(void, BOOL))v5)[2](v5, [(NPTunnelFlowHTTP *)self responseSuccess]);

    [(NPTunnelFlowHTTP *)self setPostCompletionHandler:0];
  }
  id v6 = [(NPTunnelFlow *)self tunnel];
  objc_msgSend(v6, "removeFlow:", -[NPTunnelFlow identifier](self, "identifier"));
}

- (BOOL)isClientFlowClosed
{
  return 0;
}

- (NSMutableData)responseData
{
  return (NSMutableData *)objc_getProperty(self, a2, 152, 1);
}

- (void)setResponseData:(id)a3
{
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 160, 1);
}

- (void)setUrl:(id)a3
{
}

- (id)postCompletionHandler
{
  return objc_getProperty(self, a2, 168, 1);
}

- (void)setPostCompletionHandler:(id)a3
{
}

- (BOOL)receivedHeaders
{
  return self->_receivedHeaders;
}

- (void)setReceivedHeaders:(BOOL)a3
{
  self->_receivedHeaders = a3;
}

- (NSNumber)responseContentLength
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (void)setResponseContentLength:(id)a3
{
}

- (BOOL)responseSuccess
{
  return self->_responseSuccess;
}

- (void)setResponseSuccess:(BOOL)a3
{
  self->_responseSuccess = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseContentLength, 0);
  objc_storeStrong(&self->_postCompletionHandler, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_responseData, 0);
}

@end