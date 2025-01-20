@interface _ICQMegaBackupNetworkRequest
- (NSDictionary)additionalRequestHeaders;
- (NSDictionary)bodyJSON;
- (NSDictionary)requestHeaders;
- (NSError)error;
- (NSURL)requestURL;
- (_ICQMegaBackupNetworkRequest)initWithRequestURL:(id)a3 URLSession:(id)a4 queue:(id)a5;
- (id)_createURLRequestWithError:(id *)a3;
- (id)_dictionaryFromData:(id)a3 response:(id)a4 error:(id *)a5;
- (id)_errorForURLRequestError:(id)a3;
- (id)errorForUnsuccessfulResponse:(id)a3 body:(id)a4;
- (id)handleResponse:(id)a3 body:(id)a4;
- (void)_completeWithError:(id)a3;
- (void)_performURLRequest:(id)a3;
- (void)handleURLResponse:(id)a3 data:(id)a4 error:(id)a5;
- (void)invalidate;
- (void)resumeWithCompletionHandler:(id)a3;
@end

@implementation _ICQMegaBackupNetworkRequest

- (_ICQMegaBackupNetworkRequest)initWithRequestURL:(id)a3 URLSession:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_ICQMegaBackupNetworkRequest;
  v11 = [(_ICQMegaBackupNetworkRequest *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    requestURL = v11->_requestURL;
    v11->_requestURL = (NSURL *)v12;

    objc_storeStrong((id *)&v11->_queue, a5);
    objc_storeStrong((id *)&v11->_URLSession, a4);
  }

  return v11;
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NSURLSessionTask *)self->_URLSessionTask cancel];
  URLSessionTask = self->_URLSessionTask;
  self->_URLSessionTask = 0;

  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;
}

- (void)resumeWithCompletionHandler:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  v6 = (void *)[v5 copy];

  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v6;

  id v10 = 0;
  id v8 = [(_ICQMegaBackupNetworkRequest *)self _createURLRequestWithError:&v10];
  id v9 = v10;
  if (v8) {
    [(_ICQMegaBackupNetworkRequest *)self _performURLRequest:v8];
  }
  else {
    [(_ICQMegaBackupNetworkRequest *)self _completeWithError:v9];
  }
}

- (void)handleURLResponse:(id)a3 data:(id)a4 error:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NSURLSessionTask *)self->_URLSessionTask cancel];
  URLSessionTask = self->_URLSessionTask;
  self->_URLSessionTask = 0;

  id v12 = v8;
  v13 = [v12 URL];
  v14 = [v13 absoluteString];

  uint64_t v15 = [v12 statusCode];
  if (v12)
  {
    uint64_t v16 = v15;
    if (v9)
    {
      id v26 = 0;
      v17 = [(_ICQMegaBackupNetworkRequest *)self _dictionaryFromData:v9 response:v12 error:&v26];
      id v18 = v26;
    }
    else
    {
      v17 = 0;
      id v18 = 0;
    }
    v20 = _ICQGetLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = [v9 length];
      *(_DWORD *)buf = 138413058;
      id v28 = v14;
      __int16 v29 = 2050;
      uint64_t v30 = v16;
      __int16 v31 = 2050;
      uint64_t v32 = v21;
      __int16 v33 = 2112;
      v34 = v17;
      _os_log_impl(&dword_1D5851000, v20, OS_LOG_TYPE_DEFAULT, "Received response %@ Status Code: %{public}lu (%{public}lu bytes): %@", buf, 0x2Au);
    }

    v22 = _ICQGetLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = [v12 allHeaderFields];
      *(_DWORD *)buf = 138412546;
      id v28 = v14;
      __int16 v29 = 2114;
      uint64_t v30 = (uint64_t)v23;
      _os_log_impl(&dword_1D5851000, v22, OS_LOG_TYPE_DEFAULT, "Response %@ headers: %{public}@", buf, 0x16u);
    }
    if (v16 != 200 && !v18)
    {
      if (v17) {
        v24 = v17;
      }
      else {
        v24 = (void *)MEMORY[0x1E4F1CC08];
      }
      id v18 = [(_ICQMegaBackupNetworkRequest *)self errorForUnsuccessfulResponse:v12 body:v24];
    }
    if (v17 && !v18)
    {
      uint64_t v25 = [(_ICQMegaBackupNetworkRequest *)self handleResponse:v12 body:v17];
LABEL_24:
      id v18 = (id)v25;
      goto LABEL_25;
    }
    if (!v18)
    {
LABEL_23:
      uint64_t v25 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_ICQMegaBackupErrorDomain" code:0 userInfo:0];
      goto LABEL_24;
    }
  }
  else
  {
    v19 = _ICQGetLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v28 = v10;
      _os_log_impl(&dword_1D5851000, v19, OS_LOG_TYPE_DEFAULT, "Received error for request: %{public}@", buf, 0xCu);
    }

    id v18 = [(_ICQMegaBackupNetworkRequest *)self _errorForURLRequestError:v10];
    v17 = 0;
    if (!v18) {
      goto LABEL_23;
    }
  }
LABEL_25:
  [(_ICQMegaBackupNetworkRequest *)self _completeWithError:v18];
}

- (id)_dictionaryFromData:(id)a3 response:(id)a4 error:(id *)a5
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (![v7 length])
  {
    id v12 = (id)MEMORY[0x1E4F1CC08];
    goto LABEL_30;
  }
  id v9 = [v8 MIMEType];
  id v25 = 0;
  id v10 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v25];
  id v11 = v25;
  if (!v10)
  {
    if ([v9 isEqualToString:@"application/json"])
    {
      v13 = _ICQGetLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D5851000, v13, OS_LOG_TYPE_DEFAULT, "Malormed JSON", buf, 2u);
      }

      if (a5)
      {
        v14 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v30 = *MEMORY[0x1E4F28A50];
        v31[0] = v11;
        uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
        *a5 = [v14 errorWithDomain:@"_ICQMegaBackupErrorDomain" code:2 userInfo:v15];
      }
      goto LABEL_27;
    }
    if (![v9 isEqualToString:@"text/plain"]) {
      goto LABEL_21;
    }
    if ((unint64_t)[v7 length] > 0x3FF)
    {
      v20 = _ICQGetLogSystem();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
LABEL_20:

LABEL_21:
        if ([v8 statusCode] != 200)
        {
          id v12 = (id)MEMORY[0x1E4F1CC08];
          goto LABEL_29;
        }
        uint64_t v16 = _ICQGetLogSystem();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
LABEL_25:

          if (a5)
          {
            [MEMORY[0x1E4F28C58] errorWithDomain:@"_ICQMegaBackupErrorDomain" code:2 userInfo:0];
            id v12 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          }
LABEL_27:
          id v12 = 0;
          goto LABEL_29;
        }
        *(_DWORD *)buf = 138543362;
        v27 = v9;
        v17 = "Unexpected response format with Content-Type \"%{public}@\"";
        id v18 = v16;
        uint32_t v19 = 12;
LABEL_24:
        _os_log_impl(&dword_1D5851000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
        goto LABEL_25;
      }
      uint64_t v21 = [v8 URL];
      uint64_t v23 = [v7 length];
      *(_DWORD *)buf = 138412546;
      v27 = v21;
      __int16 v28 = 2050;
      uint64_t v29 = v23;
      _os_log_impl(&dword_1D5851000, v20, OS_LOG_TYPE_DEFAULT, "Received large text response from %@ (%{public}lu bytes)", buf, 0x16u);
    }
    else
    {
      v20 = [[NSString alloc] initWithData:v7 encoding:4];
      uint64_t v21 = _ICQGetLogSystem();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = [v8 URL];
        *(_DWORD *)buf = 138412546;
        v27 = v22;
        __int16 v28 = 2114;
        uint64_t v29 = (uint64_t)v20;
        _os_log_impl(&dword_1D5851000, v21, OS_LOG_TYPE_DEFAULT, "Received text response from %@: \"%{public}@\"", buf, 0x16u);
      }
    }

    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v16 = _ICQGetLogSystem();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    *(_WORD *)buf = 0;
    v17 = "Non-dict JSON";
    id v18 = v16;
    uint32_t v19 = 2;
    goto LABEL_24;
  }
  id v12 = v10;
LABEL_29:

LABEL_30:
  return v12;
}

- (NSDictionary)additionalRequestHeaders
{
  return (NSDictionary *)MEMORY[0x1E4F1CC08];
}

- (NSDictionary)bodyJSON
{
  return (NSDictionary *)MEMORY[0x1E4F1CC08];
}

- (id)handleResponse:(id)a3 body:(id)a4
{
  return 0;
}

- (id)errorForUnsuccessfulResponse:(id)a3 body:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 statusCode];
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134349056;
    uint64_t v10 = v4;
    _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "Received status code response: %{public}ld", (uint8_t *)&v9, 0xCu);
  }

  if (v4 == 429) {
    uint64_t v6 = 6;
  }
  else {
    uint64_t v6 = 3;
  }
  id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_ICQMegaBackupErrorDomain" code:v6 userInfo:0];
  return v7;
}

- (id)_createURLRequestWithError:(id *)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1D9453DC0](self, a2);
  uint64_t v6 = [(_ICQMegaBackupNetworkRequest *)self bodyJSON];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v6])
  {
    id v16 = 0;
    id v7 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v6 options:0 error:&v16];
    id v8 = v16;

    if (v7)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F28E88]);
      uint64_t v10 = [(_ICQMegaBackupNetworkRequest *)self requestURL];
      uint64_t v11 = (void *)[v9 initWithURL:v10];

      id v12 = [(_ICQMegaBackupNetworkRequest *)self requestHeaders];
      [v11 setAllHTTPHeaderFields:v12];

      [(_ICQMegaBackupNetworkRequest *)self addAdditionalRequestHeaders:v11];
      [v11 setHTTPBody:v7];
      [v11 setHTTPMethod:@"POST"];
      goto LABEL_13;
    }
  }
  else
  {

    id v8 = 0;
  }
  v13 = _ICQGetLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_1D5851000, v13, OS_LOG_TYPE_DEFAULT, "Invalid request body", v15, 2u);
  }

  if (!a3)
  {
    uint64_t v11 = 0;
    goto LABEL_14;
  }
  if (v8)
  {
    uint64_t v17 = *MEMORY[0x1E4F28A50];
    v18[0] = v8;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  }
  else
  {
    id v7 = 0;
  }
  [MEMORY[0x1E4F28C58] errorWithDomain:@"_ICQMegaBackupErrorDomain" code:0 userInfo:v7];
  uint64_t v11 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

LABEL_14:
  return v11;
}

- (NSDictionary)requestHeaders
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:@"application/json" forKeyedSubscript:@"Content-Type"];
  uint64_t v4 = [(_ICQMegaBackupNetworkRequest *)self additionalRequestHeaders];
  [v3 addEntriesFromDictionary:v4];

  id v5 = (void *)[v3 copy];
  return (NSDictionary *)v5;
}

- (id)_errorForURLRequestError:(id)a3
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F289A0]];

  if (v5)
  {
    uint64_t v6 = [v3 code];
    if (v6 == -1002)
    {
      uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F28228];
      v25[0] = *MEMORY[0x1E4F28A50];
      v25[1] = v16;
      v26[0] = v3;
      v26[1] = @"Bad URL";
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
      uint64_t v10 = v15;
      uint64_t v11 = 1;
    }
    else
    {
      id v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = *MEMORY[0x1E4F28228];
      if (v6 == -1001)
      {
        v27[0] = *MEMORY[0x1E4F28A50];
        v27[1] = v8;
        v28[0] = v3;
        v28[1] = @"Timed out";
        id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
        uint64_t v10 = v7;
        uint64_t v11 = 4;
      }
      else
      {
        v23[0] = *MEMORY[0x1E4F28A50];
        v23[1] = v8;
        v24[0] = v3;
        v24[1] = @"Network failure";
        id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
        uint64_t v10 = v7;
        uint64_t v11 = 5;
      }
    }
  }
  else
  {
    id v12 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v21 = *MEMORY[0x1E4F28228];
    v22 = @"Unknown URL request errro";
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v9 = (void *)[v12 initWithDictionary:v13];

    if (v3)
    {
      uint64_t v19 = *MEMORY[0x1E4F28A50];
      id v20 = v3;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      [v9 addEntriesFromDictionary:v14];
    }
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = 0;
  }
  uint64_t v17 = [v10 errorWithDomain:@"_ICQMegaBackupErrorDomain" code:v11 userInfo:v9];

  return v17;
}

- (void)_performURLRequest:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  URLSession = self->_URLSession;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51___ICQMegaBackupNetworkRequest__performURLRequest___block_invoke;
  v12[3] = &unk_1E6A52120;
  v12[4] = self;
  uint64_t v6 = [(NSURLSession *)URLSession dataTaskWithRequest:v4 completionHandler:v12];
  URLSessionTask = self->_URLSessionTask;
  self->_URLSessionTask = v6;

  uint64_t v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v4 allHTTPHeaderFields];
    uint64_t v10 = [v4 HTTPBody];
    uint64_t v11 = [v10 length];
    *(_DWORD *)buf = 138412802;
    id v14 = v4;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    __int16 v17 = 2050;
    uint64_t v18 = v11;
    _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "Sending request %@ %@ (%{public}lu body bytes)", buf, 0x20u);
  }
  [(NSURLSessionTask *)self->_URLSessionTask resume];
}

- (void)_completeWithError:(id)a3
{
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v4 = (NSError *)[v9 copy];
  error = self->_error;
  self->_error = v4;

  uint64_t v6 = _Block_copy(self->_completionHandler);
  id v7 = v6;
  if (v6)
  {
    (*((void (**)(void *, _ICQMegaBackupNetworkRequest *, id))v6 + 2))(v6, self, v9);
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0;
  }
}

- (NSURL)requestURL
{
  return self->_requestURL;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_requestURL, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_URLSessionTask, 0);
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end