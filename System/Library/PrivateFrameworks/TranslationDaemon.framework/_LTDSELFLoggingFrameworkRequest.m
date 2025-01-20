@interface _LTDSELFLoggingFrameworkRequest
- (BOOL)isResponseReceivedEventSent;
- (NSArray)endpoints;
- (SISchemaUUID)frameworkRequestId;
- (SISchemaUUID)mtId;
- (_LTDSELFLoggingFrameworkRequest)initWithInvocationId:(id)a3 endpoints:(id)a4 sessionIdProvider:(id)a5 qssSessionId:(id)a6 requestType:(int64_t)a7 requestRoute:(int64_t)a8 requestSize:(unint64_t)a9;
- (_LTDSELFLoggingSessionIdProvider)sessionIdProvider;
- (int64_t)requestRoute;
- (void)responseReceived:(unint64_t)a3;
- (void)setEndpoints:(id)a3;
- (void)setFrameworkRequestId:(id)a3;
- (void)setIsResponseReceivedEventSent:(BOOL)a3;
- (void)setMtId:(id)a3;
- (void)setRequestRoute:(int64_t)a3;
- (void)setSessionIdProvider:(id)a3;
@end

@implementation _LTDSELFLoggingFrameworkRequest

- (_LTDSELFLoggingFrameworkRequest)initWithInvocationId:(id)a3 endpoints:(id)a4 sessionIdProvider:(id)a5 qssSessionId:(id)a6 requestType:(int64_t)a7 requestRoute:(int64_t)a8 requestSize:(unint64_t)a9
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v40 = a6;
  v45.receiver = self;
  v45.super_class = (Class)_LTDSELFLoggingFrameworkRequest;
  v17 = [(_LTDSELFLoggingFrameworkRequest *)&v45 init];
  if (v17)
  {
    id v35 = v16;
    id v36 = v15;
    id v37 = v14;
    uint64_t v18 = [objc_alloc(MEMORY[0x263F6EEE0]) initWithNSUUID:v14];
    mtId = v17->_mtId;
    v17->_mtId = (SISchemaUUID *)v18;

    objc_storeStrong((id *)&v17->_endpoints, a4);
    objc_storeStrong((id *)&v17->_sessionIdProvider, a5);
    id v20 = objc_alloc(MEMORY[0x263F6EEE0]);
    id v21 = objc_alloc_init(MEMORY[0x263F08C38]);
    uint64_t v22 = [v20 initWithNSUUID:v21];
    frameworkRequestId = v17->_frameworkRequestId;
    v17->_frameworkRequestId = (SISchemaUUID *)v22;

    v17->_int64_t requestRoute = a8;
    v17->_isResponseReceivedEventSent = 0;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    obj = v17->_endpoints;
    uint64_t v24 = [(NSArray *)obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v42 != v26) {
            objc_enumerationMutation(obj);
          }
          v28 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          v29 = v17->_frameworkRequestId;
          int64_t requestRoute = v17->_requestRoute;
          v31 = v17->_mtId;
          v32 = [(_LTDSELFLoggingSessionIdProvider *)v17->_sessionIdProvider sessionId];
          [v28 frameworkRequestSentWithFrameworkRequestId:v29 qssSessionId:v40 requestType:a7 requestRoute:requestRoute requestSize:a9 mtId:v31 sessionId:v32];
        }
        uint64_t v25 = [(NSArray *)obj countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v25);
    }

    v33 = v17;
    id v15 = v36;
    id v14 = v37;
    id v16 = v35;
  }

  return v17;
}

- (void)responseReceived:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (!self->_isResponseReceivedEventSent)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    obj = self->_endpoints;
    uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
          frameworkRequestId = self->_frameworkRequestId;
          int64_t requestRoute = self->_requestRoute;
          mtId = self->_mtId;
          v13 = [(_LTDSELFLoggingSessionIdProvider *)self->_sessionIdProvider sessionId];
          [v9 frameworkRequestResponseReceivedWithFrameworkRequestId:frameworkRequestId requestRoute:requestRoute mtId:mtId sessionId:v13 numberOfSentences:a3];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }

    self->_isResponseReceivedEventSent = 1;
  }
}

- (SISchemaUUID)mtId
{
  return self->_mtId;
}

- (void)setMtId:(id)a3
{
}

- (NSArray)endpoints
{
  return self->_endpoints;
}

- (void)setEndpoints:(id)a3
{
}

- (_LTDSELFLoggingSessionIdProvider)sessionIdProvider
{
  return self->_sessionIdProvider;
}

- (void)setSessionIdProvider:(id)a3
{
}

- (SISchemaUUID)frameworkRequestId
{
  return self->_frameworkRequestId;
}

- (void)setFrameworkRequestId:(id)a3
{
}

- (int64_t)requestRoute
{
  return self->_requestRoute;
}

- (void)setRequestRoute:(int64_t)a3
{
  self->_int64_t requestRoute = a3;
}

- (BOOL)isResponseReceivedEventSent
{
  return self->_isResponseReceivedEventSent;
}

- (void)setIsResponseReceivedEventSent:(BOOL)a3
{
  self->_isResponseReceivedEventSent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameworkRequestId, 0);
  objc_storeStrong((id *)&self->_sessionIdProvider, 0);
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_mtId, 0);
}

@end