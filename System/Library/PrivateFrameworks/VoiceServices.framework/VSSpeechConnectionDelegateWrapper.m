@interface VSSpeechConnectionDelegateWrapper
- (NSMutableArray)audioRequests;
- (NSMutableArray)requests;
- (NSMutableDictionary)concurrentSynthesisRequests;
- (VSPresynthesizedAudioRequest)currentAudioRequest;
- (VSSpeechConnection)connection;
- (VSSpeechConnectionDelegate)delegate;
- (VSSpeechConnectionDelegateWrapper)init;
- (VSSpeechRequest)currentRequest;
- (id)getLocalAudioRequest:(id)a3;
- (id)getLocalRequest:(id)a3;
- (void)audioRequest:(id)a3 didReportInstrumentMetrics:(id)a4 error:(id)a5;
- (void)audioRequest:(id)a3 didStopAtEnd:(BOOL)a4 error:(id)a5;
- (void)audioRequestDidStart:(id)a3;
- (void)setAudioRequests:(id)a3;
- (void)setConcurrentSynthesisRequests:(id)a3;
- (void)setConnection:(id)a3;
- (void)setCurrentAudioRequest:(id)a3;
- (void)setCurrentRequest:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRequests:(id)a3;
- (void)speechRequest:(id)a3 didReceiveTimingInfo:(id)a4;
- (void)speechRequest:(id)a3 didReportInstrumentMetrics:(id)a4;
- (void)speechRequest:(id)a3 didStartWithMark:(int64_t)a4 forRange:(_NSRange)a5;
- (void)speechRequest:(id)a3 didStopWithSuccess:(BOOL)a4 phonemesSpoken:(id)a5 error:(id)a6;
- (void)speechRequestDidContinue:(id)a3;
- (void)speechRequestDidPause:(id)a3;
- (void)speechRequestDidStart:(id)a3;
- (void)synthesisRequest:(id)a3 didFinishWithInstrumentMetrics:(id)a4 error:(id)a5;
- (void)synthesisRequest:(id)a3 didGenerateAudioChunk:(id)a4;
- (void)synthesisRequest:(id)a3 didReceiveTimingInfo:(id)a4;
@end

@implementation VSSpeechConnectionDelegateWrapper

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_audioRequests, 0);
  objc_storeStrong((id *)&self->_currentAudioRequest, 0);
  objc_storeStrong((id *)&self->_concurrentSynthesisRequests, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setConnection:(id)a3
{
}

- (VSSpeechConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  return (VSSpeechConnection *)WeakRetained;
}

- (void)setAudioRequests:(id)a3
{
}

- (NSMutableArray)audioRequests
{
  return self->_audioRequests;
}

- (void)setCurrentAudioRequest:(id)a3
{
}

- (VSPresynthesizedAudioRequest)currentAudioRequest
{
  return self->_currentAudioRequest;
}

- (void)setConcurrentSynthesisRequests:(id)a3
{
}

- (NSMutableDictionary)concurrentSynthesisRequests
{
  return self->_concurrentSynthesisRequests;
}

- (void)setRequests:(id)a3
{
}

- (NSMutableArray)requests
{
  return self->_requests;
}

- (void)setCurrentRequest:(id)a3
{
}

- (VSSpeechRequest)currentRequest
{
  return self->_currentRequest;
}

- (void)setDelegate:(id)a3
{
}

- (VSSpeechConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSSpeechConnectionDelegate *)WeakRetained;
}

- (void)audioRequest:(id)a3 didReportInstrumentMetrics:(id)a4 error:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = a5;
  p_connection = &self->_connection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (WeakRetained)
  {
    v12 = WeakRetained;
    p_delegate = &self->_delegate;
    id v14 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v14)
    {
      v15 = [(VSSpeechConnectionDelegateWrapper *)self getLocalAudioRequest:v18];
      if (v15)
      {
        id v16 = objc_loadWeakRetained((id *)p_delegate);
        id v17 = objc_loadWeakRetained((id *)p_connection);
        [v16 connection:v17 presynthesizedAudioRequest:v15 successWithInstrumentMetrics:v8 error:v9];
      }
    }
  }
}

- (void)audioRequest:(id)a3 didStopAtEnd:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v18 = a3;
  id v8 = a5;
  p_connection = &self->_connection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (WeakRetained)
  {
    v11 = WeakRetained;
    p_delegate = &self->_delegate;
    id v13 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v13)
    {
      id v14 = [(VSSpeechConnectionDelegateWrapper *)self getLocalAudioRequest:v18];
      if (v14)
      {
        v15 = [(VSSpeechConnectionDelegateWrapper *)self audioRequests];
        [v15 removeObject:v14];

        id v16 = objc_loadWeakRetained((id *)p_delegate);
        id v17 = objc_loadWeakRetained((id *)p_connection);
        [v16 connection:v17 presynthesizedAudioRequest:v14 didStopAtEnd:v6 error:v8];
      }
    }
  }
}

- (void)audioRequestDidStart:(id)a3
{
  id v12 = a3;
  p_connection = &self->_connection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (WeakRetained)
  {
    BOOL v6 = WeakRetained;
    p_delegate = &self->_delegate;
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v8)
    {
      id v9 = [(VSSpeechConnectionDelegateWrapper *)self getLocalAudioRequest:v12];
      if (v9)
      {
        id v10 = objc_loadWeakRetained((id *)p_delegate);
        id v11 = objc_loadWeakRetained((id *)p_connection);
        [v10 connection:v11 presynthesizedAudioRequestDidStart:v9];
      }
    }
  }
}

- (void)synthesisRequest:(id)a3 didFinishWithInstrumentMetrics:(id)a4 error:(id)a5
{
  id v22 = a3;
  id v8 = a4;
  id v9 = a5;
  p_connection = &self->_connection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (WeakRetained)
  {
    id v12 = WeakRetained;
    p_delegate = &self->_delegate;
    id v14 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v14)
    {
      v15 = [(VSSpeechConnectionDelegateWrapper *)self concurrentSynthesisRequests];
      id v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v22, "pointer"));
      id v17 = [v15 objectForKey:v16];

      if (v17)
      {
        id v18 = [(VSSpeechConnectionDelegateWrapper *)self concurrentSynthesisRequests];
        v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v17, "pointer"));
        [v18 removeObjectForKey:v19];

        id v20 = objc_loadWeakRetained((id *)p_delegate);
        id v21 = objc_loadWeakRetained((id *)p_connection);
        [v20 connection:v21 synthesisRequest:v17 didFinishWithInstrumentMetrics:v8 error:v9];
      }
    }
  }
}

- (void)synthesisRequest:(id)a3 didGenerateAudioChunk:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  p_connection = &self->_connection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    p_delegate = &self->_delegate;
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v11)
    {
      id v12 = [(VSSpeechConnectionDelegateWrapper *)self concurrentSynthesisRequests];
      id v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v17, "pointer"));
      id v14 = [v12 objectForKey:v13];

      if (v14)
      {
        id v15 = objc_loadWeakRetained((id *)p_delegate);
        id v16 = objc_loadWeakRetained((id *)p_connection);
        [v15 connection:v16 speechRequest:v14 didGenerateAudioChunk:v6];
      }
    }
  }
}

- (void)speechRequest:(id)a3 didStopWithSuccess:(BOOL)a4 phonemesSpoken:(id)a5 error:(id)a6
{
  BOOL v8 = a4;
  id v21 = a3;
  id v10 = a5;
  id v11 = a6;
  p_connection = &self->_connection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (WeakRetained)
  {
    id v14 = WeakRetained;
    p_delegate = &self->_delegate;
    id v16 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v16)
    {
      id v17 = [(VSSpeechConnectionDelegateWrapper *)self getLocalRequest:v21];
      if (v17)
      {
        id v18 = [(VSSpeechConnectionDelegateWrapper *)self requests];
        [v18 removeObject:v17];

        id v19 = objc_loadWeakRetained((id *)p_delegate);
        id v20 = objc_loadWeakRetained((id *)p_connection);
        [v19 connection:v20 speechRequest:v17 didStopAtEnd:v8 phonemesSpoken:v10 error:v11];
      }
    }
  }
}

- (void)speechRequest:(id)a3 didReportInstrumentMetrics:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  p_connection = &self->_connection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    p_delegate = &self->_delegate;
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v11)
    {
      id v12 = [(VSSpeechConnectionDelegateWrapper *)self getLocalRequest:v15];
      if (v12)
      {
        id v13 = objc_loadWeakRetained((id *)p_delegate);
        id v14 = objc_loadWeakRetained((id *)p_connection);
        [v13 connection:v14 speechRequest:v12 successWithInstrumentMetrics:v6];
      }
    }
  }
}

- (void)synthesisRequest:(id)a3 didReceiveTimingInfo:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  p_connection = &self->_connection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    p_delegate = &self->_delegate;
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v11)
    {
      id v12 = [(VSSpeechConnectionDelegateWrapper *)self concurrentSynthesisRequests];
      id v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v17, "pointer"));
      id v14 = [v12 objectForKey:v13];

      if (v14)
      {
        id v15 = objc_loadWeakRetained((id *)p_delegate);
        id v16 = objc_loadWeakRetained((id *)p_connection);
        [v15 connection:v16 speechRequest:v14 didReceiveTimingInfo:v6];
      }
    }
  }
}

- (void)speechRequest:(id)a3 didReceiveTimingInfo:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  p_connection = &self->_connection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    p_delegate = &self->_delegate;
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v11)
    {
      id v12 = [(VSSpeechConnectionDelegateWrapper *)self getLocalRequest:v15];
      if (v12)
      {
        id v13 = objc_loadWeakRetained((id *)p_delegate);
        id v14 = objc_loadWeakRetained((id *)p_connection);
        [v13 connection:v14 speechRequest:v12 didReceiveTimingInfo:v6];
      }
    }
  }
}

- (void)speechRequest:(id)a3 didStartWithMark:(int64_t)a4 forRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v17 = a3;
  p_connection = &self->_connection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (WeakRetained)
  {
    id v11 = WeakRetained;
    p_delegate = &self->_delegate;
    id v13 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v13)
    {
      id v14 = [(VSSpeechConnectionDelegateWrapper *)self getLocalRequest:v17];
      if (v14)
      {
        id v15 = objc_loadWeakRetained((id *)p_delegate);
        id v16 = objc_loadWeakRetained((id *)p_connection);
        objc_msgSend(v15, "connection:speechRequest:willSpeakMark:inRange:", v16, v14, a4, location, length);
      }
    }
  }
}

- (void)speechRequestDidContinue:(id)a3
{
  id v12 = a3;
  p_connection = &self->_connection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    p_delegate = &self->_delegate;
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v8)
    {
      id v9 = [(VSSpeechConnectionDelegateWrapper *)self getLocalRequest:v12];
      if (v9)
      {
        id v10 = objc_loadWeakRetained((id *)p_delegate);
        id v11 = objc_loadWeakRetained((id *)p_connection);
        [v10 connection:v11 speechRequestDidContinue:v9];
      }
    }
  }
}

- (void)speechRequestDidPause:(id)a3
{
  id v12 = a3;
  p_connection = &self->_connection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    p_delegate = &self->_delegate;
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v8)
    {
      id v9 = [(VSSpeechConnectionDelegateWrapper *)self getLocalRequest:v12];
      if (v9)
      {
        id v10 = objc_loadWeakRetained((id *)p_delegate);
        id v11 = objc_loadWeakRetained((id *)p_connection);
        [v10 connection:v11 speechRequestDidPause:v9];
      }
    }
  }
}

- (void)speechRequestDidStart:(id)a3
{
  id v12 = a3;
  p_connection = &self->_connection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    p_delegate = &self->_delegate;
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v8)
    {
      id v9 = [(VSSpeechConnectionDelegateWrapper *)self getLocalRequest:v12];
      if (v9)
      {
        id v10 = objc_loadWeakRetained((id *)p_delegate);
        id v11 = objc_loadWeakRetained((id *)p_connection);
        [v10 connection:v11 speechRequestDidStart:v9];
      }
    }
  }
}

- (id)getLocalAudioRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(VSSpeechConnectionDelegateWrapper *)self audioRequests];
  id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v10 = [v4 requestCreatedTimestamp];
        if (v10 == [v9 requestCreatedTimestamp])
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)getLocalRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(VSSpeechConnectionDelegateWrapper *)self requests];
  id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v10 = [v4 requestCreatedTimestamp];
        if (v10 == [v9 requestCreatedTimestamp])
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (VSSpeechConnectionDelegateWrapper)init
{
  v10.receiver = self;
  v10.super_class = (Class)VSSpeechConnectionDelegateWrapper;
  v2 = [(VSSpeechConnectionDelegateWrapper *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    requests = v2->_requests;
    v2->_requests = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    audioRequests = v2->_audioRequests;
    v2->_audioRequests = v5;

    uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    concurrentSynthesisRequests = v2->_concurrentSynthesisRequests;
    v2->_concurrentSynthesisRequests = v7;
  }
  return v2;
}

@end