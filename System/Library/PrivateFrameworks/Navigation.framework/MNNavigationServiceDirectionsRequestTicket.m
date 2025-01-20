@interface MNNavigationServiceDirectionsRequestTicket
- (GEODirectionsRequest)directionsRequest;
- (GEODirectionsResponse)directionsResponse;
- (MNNavigationServiceDirectionsRequestTicket)initWithProxy:(id)a3 request:(id)a4;
- (MNTraceRecordingData)traceRecordingData;
- (void)cancel;
- (void)submitWithHandler:(id)a3;
@end

@implementation MNNavigationServiceDirectionsRequestTicket

- (MNNavigationServiceDirectionsRequestTicket)initWithProxy:(id)a3 request:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MNNavigationServiceDirectionsRequestTicket;
  v9 = [(MNNavigationServiceDirectionsRequestTicket *)&v14 init];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
    requestIdentifier = v9->_requestIdentifier;
    v9->_requestIdentifier = (NSUUID *)v10;

    objc_storeStrong((id *)&v9->_proxy, a3);
    objc_storeStrong((id *)&v9->_request, a4);
    v12 = v9;
  }

  return v9;
}

- (void)submitWithHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    requestIdentifier = self->_requestIdentifier;
    *(_DWORD *)buf = 138412290;
    v15 = requestIdentifier;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "requestDirections: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  proxy = self->_proxy;
  request = self->_request;
  v9 = self->_requestIdentifier;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__MNNavigationServiceDirectionsRequestTicket_submitWithHandler___block_invoke;
  v11[3] = &unk_1E60F7370;
  objc_copyWeak(&v13, (id *)buf);
  id v10 = v4;
  id v12 = v10;
  [(MNNavigationClientProxy *)proxy requestDirections:request withIdentifier:v9 handler:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __64__MNNavigationServiceDirectionsRequestTicket_submitWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v5 = [v3 request];
    v6 = (void *)WeakRetained[4];
    WeakRetained[4] = v5;

    uint64_t v7 = [v3 response];
    id v8 = (void *)WeakRetained[5];
    WeakRetained[5] = v7;

    uint64_t v9 = [v3 traceRecordingData];
    id v10 = (void *)WeakRetained[6];
    WeakRetained[6] = v9;
  }
  if (*(void *)(a1 + 32))
  {
    v11 = [v3 routeInfos];
    id v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v17), "route", (void)v22);
          [v12 addObject:v18];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v15);
    }

    uint64_t v19 = *(void *)(a1 + 32);
    v20 = [v3 error];
    v21 = [v3 directionsError];
    (*(void (**)(uint64_t, void *, void *, void *))(v19 + 16))(v19, v12, v20, v21);
  }
}

- (void)cancel
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = MNGetMNNavigationServiceLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    requestIdentifier = self->_requestIdentifier;
    int v5 = 138412290;
    v6 = requestIdentifier;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEFAULT, "cancelDirectionsRequestWithIdentifier: %@", (uint8_t *)&v5, 0xCu);
  }

  [(MNNavigationClientProxy *)self->_proxy cancelDirectionsRequestWithIdentifier:self->_requestIdentifier];
}

- (GEODirectionsRequest)directionsRequest
{
  return self->_directionsRequest;
}

- (GEODirectionsResponse)directionsResponse
{
  return self->_directionsResponse;
}

- (MNTraceRecordingData)traceRecordingData
{
  return self->_traceRecordingData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traceRecordingData, 0);
  objc_storeStrong((id *)&self->_directionsResponse, 0);
  objc_storeStrong((id *)&self->_directionsRequest, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

@end