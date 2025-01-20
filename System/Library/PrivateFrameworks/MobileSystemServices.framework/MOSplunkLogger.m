@interface MOSplunkLogger
- (BOOL)allowInvalidCert;
- (MOSplunkLogger)initWithName:(id)a3 configurationURL:(id)a4 splunkTopic:(id)a5 version:(id)a6 allowInvalidCert:(BOOL)a7;
- (NSMutableArray)events;
- (NSNumber)samplingPercentage;
- (NSString)path;
- (NSString)splunkTopic;
- (NSString)version;
- (NSURL)configurationURL;
- (NSURL)splunkUploadURL;
- (OS_dispatch_queue)queue;
- (double)lastSuccessfulConfigurationLoad;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)_onQueue_loadConfiguration;
- (void)logEventNamed:(id)a3 value:(id)a4;
- (void)setAllowInvalidCert:(BOOL)a3;
- (void)setConfigurationURL:(id)a3;
- (void)setEvents:(id)a3;
- (void)setLastSuccessfulConfigurationLoad:(double)a3;
- (void)setPath:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSamplingPercentage:(id)a3;
- (void)setSplunkTopic:(id)a3;
- (void)setSplunkUploadURL:(id)a3;
- (void)setVersion:(id)a3;
- (void)uploadEventsWithCompletion:(id)a3;
@end

@implementation MOSplunkLogger

- (MOSplunkLogger)initWithName:(id)a3 configurationURL:(id)a4 splunkTopic:(id)a5 version:(id)a6 allowInvalidCert:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v25.receiver = self;
  v25.super_class = (Class)MOSplunkLogger;
  v16 = [(MOSplunkLogger *)&v25 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_configurationURL, a4);
    objc_storeStrong((id *)&v17->_splunkTopic, a5);
    objc_storeStrong((id *)&v17->_version, a6);
    id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(MOSplunkLogger *)v17 setEvents:v18];

    [(MOSplunkLogger *)v17 setAllowInvalidCert:v7];
    id v19 = [NSString stringWithFormat:@"%@.SplunkLoggerQueue", v12];
    v20 = (const char *)[v19 UTF8String];
    v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v22 = dispatch_queue_create(v20, v21);
    [(MOSplunkLogger *)v17 setQueue:v22];

    v23 = v17;
  }

  return v17;
}

- (void)_onQueue_loadConfiguration
{
  v3 = [(MOSplunkLogger *)self queue];
  dispatch_assert_queue_V2(v3);

  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  v5 = [MEMORY[0x263F08C00] ephemeralSessionConfiguration];
  v6 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v5 delegate:self delegateQueue:0];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __44__MOSplunkLogger__onQueue_loadConfiguration__block_invoke;
  v15[3] = &unk_26412A740;
  v15[4] = self;
  dispatch_semaphore_t v16 = v4;
  BOOL v7 = v4;
  v8 = _Block_copy(v15);
  v9 = [(MOSplunkLogger *)self configurationURL];
  v10 = [v6 dataTaskWithURL:v9 completionHandler:v8];

  MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger _onQueue_loadConfiguration]", @"Loading configuration", v11, v12, v13, v14, v15[0]);
  [v10 resume];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

void __44__MOSplunkLogger__onQueue_loadConfiguration__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v9)
  {
    id v15 = v9;
    id v16 = 0;
LABEL_5:
    MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger _onQueue_loadConfiguration]_block_invoke", @"Unable to load configuration. Error: %@", v11, v12, v13, v14, (char)v15);
    id v18 = 0;
    id v19 = 0;
    v20 = 0;
    goto LABEL_6;
  }
  id v51 = 0;
  id v16 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:0 error:&v51];
  id v17 = v51;
  if (v17)
  {
    id v15 = v17;
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v16;
    id v19 = [v16 objectForKeyedSubscript:@"metricsUrl"];
    if (v19)
    {
      v50 = [NSURL URLWithString:v19];
      v29 = [*(id *)(a1 + 32) version];
      v30 = [v50 URLByAppendingPathComponent:v29];
      v31 = [*(id *)(a1 + 32) splunkTopic];
      v32 = [v30 URLByAppendingPathComponent:v31];
      [*(id *)(a1 + 32) setSplunkUploadURL:v32];

      v33 = [*(id *)(a1 + 32) splunkUploadURL];
      MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger _onQueue_loadConfiguration]_block_invoke", @"Splunk upload URL set to %@", v34, v35, v36, v37, (char)v33);
    }
    else
    {
      MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger _onQueue_loadConfiguration]_block_invoke", @"Could not find metrics URL in configuration", v25, v26, v27, v28, v48);
    }
    v38 = [v16 objectForKeyedSubscript:@"performance"];
    id v18 = [v38 objectForKeyedSubscript:@"samplingPercentage"];

    if (v18)
    {
      [*(id *)(a1 + 32) setSamplingPercentage:v18];
      MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger _onQueue_loadConfiguration]_block_invoke", @"Sampling percentage set to %@", v43, v44, v45, v46, (char)v18);
    }
    else
    {
      MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger _onQueue_loadConfiguration]_block_invoke", @"Could not find sampling percentage in configuration", v39, v40, v41, v42, v49);
    }
    id v15 = [*(id *)(a1 + 32) samplingPercentage];
    if (v15)
    {
      v47 = [*(id *)(a1 + 32) splunkUploadURL];

      if (v47)
      {
        [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
        objc_msgSend(*(id *)(a1 + 32), "setLastSuccessfulConfigurationLoad:");
      }
      id v15 = 0;
    }
    v20 = v16;
  }
  else
  {
    MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger _onQueue_loadConfiguration]_block_invoke", @"Configuration does not have the expected format", v21, v22, v23, v24, v48);
    id v18 = 0;
    id v19 = 0;
    v20 = 0;
    id v15 = 0;
  }
LABEL_6:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)uploadEventsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(MOSplunkLogger *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__MOSplunkLogger_uploadEventsWithCompletion___block_invoke;
  block[3] = &unk_26412A768;
  block[4] = self;
  dispatch_async(v5, block);

  v6 = [(MOSplunkLogger *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__MOSplunkLogger_uploadEventsWithCompletion___block_invoke_2;
  v8[3] = &unk_26412A7B8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

uint64_t __45__MOSplunkLogger_uploadEventsWithCompletion___block_invoke(uint64_t a1)
{
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v3 = v2;
  uint64_t result = [*(id *)(a1 + 32) lastSuccessfulConfigurationLoad];
  if (v3 - v5 > 86400.0)
  {
    v6 = *(void **)(a1 + 32);
    return objc_msgSend(v6, "_onQueue_loadConfiguration");
  }
  return result;
}

void __45__MOSplunkLogger_uploadEventsWithCompletion___block_invoke_2(uint64_t a1)
{
  v36[2] = *MEMORY[0x263EF8340];
  float v2 = (float)arc4random_uniform(0x64u);
  double v3 = [*(id *)(a1 + 32) samplingPercentage];
  [v3 floatValue];
  float v5 = v4 * 100.0;

  if (v5 >= v2)
  {
    id v7 = [MEMORY[0x263F08C00] ephemeralSessionConfiguration];
    id v8 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v7 delegate:*(void *)(a1 + 32) delegateQueue:0];
    id v9 = objc_alloc_init(MEMORY[0x263F089E0]);
    v10 = [*(id *)(a1 + 32) splunkUploadURL];
    [v9 setURL:v10];

    [v9 setHTTPMethod:@"POST"];
    v35[0] = @"postTime";
    uint64_t v11 = [NSNumber numberWithUnsignedLongLong:clock_gettime_nsec_np(_CLOCK_REALTIME) / 0xF4240];
    v35[1] = @"events";
    v36[0] = v11;
    uint64_t v12 = [*(id *)(a1 + 32) events];
    v36[1] = v12;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];

    id v34 = 0;
    uint64_t v14 = [MEMORY[0x263F08900] dataWithJSONObject:v13 options:0 error:&v34];
    id v15 = v34;
    v20 = v15;
    if (!v14 || v15)
    {
      MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger uploadEventsWithCompletion:]_block_invoke_2", @"Failed to serialize Splunk payload: %@", v16, v17, v18, v19, (char)v15);
    }
    else
    {
      [v9 setHTTPBody:v14];
      dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __45__MOSplunkLogger_uploadEventsWithCompletion___block_invoke_3;
      aBlock[3] = &unk_26412A790;
      uint64_t v22 = *(void **)(a1 + 40);
      aBlock[4] = *(void *)(a1 + 32);
      dispatch_semaphore_t v32 = v21;
      id v33 = v22;
      uint64_t v23 = v21;
      uint64_t v24 = _Block_copy(aBlock);
      uint64_t v25 = [v8 dataTaskWithRequest:v9 completionHandler:v24];
      MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger uploadEventsWithCompletion:]_block_invoke_2", @"Splunk upload start", v26, v27, v28, v29, v30);
      [v25 resume];
      dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  else
  {
    v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

void __45__MOSplunkLogger_uploadEventsWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v32 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v13 = v8;
  if (v8)
  {
    MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger uploadEventsWithCompletion:]_block_invoke_3", @"Error in uploading the events to splunk: %@", v9, v10, v11, v12, (char)v8);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v7;
      if ([v14 statusCode] < 200 || objc_msgSend(v14, "statusCode") > 299)
      {
        char v31 = [v14 statusCode];
        MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger uploadEventsWithCompletion:]_block_invoke_3", @"Splunk upload unexpected status: %d", v25, v26, v27, v28, v31);
      }
      else
      {
        MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger uploadEventsWithCompletion:]_block_invoke_3", @"Splunk upload successful", v15, v16, v17, v18, v30);
        uint64_t v19 = [*(id *)(a1 + 32) events];
        [v19 removeAllObjects];
      }
    }
    else
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger uploadEventsWithCompletion:]_block_invoke_3", @"Received the wrong kind of response: %@", v21, v22, v23, v24, (char)v14);
    }
  }
  uint64_t v29 = *(void *)(a1 + 48);
  if (v29) {
    (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v13);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)logEventNamed:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = (void *)[a4 mutableCopy];
  id v8 = [NSNumber numberWithUnsignedLongLong:clock_gettime_nsec_np(_CLOCK_REALTIME) / 0xF4240];
  [v7 setObject:v8 forKeyedSubscript:@"eventTime"];

  uint64_t v9 = [(MOSplunkLogger *)self splunkTopic];
  [v7 setObject:v9 forKeyedSubscript:@"topic"];

  [v7 setObject:v6 forKeyedSubscript:@"eventType"];
  uint64_t v10 = [(MOSplunkLogger *)self queue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __38__MOSplunkLogger_logEventNamed_value___block_invoke;
  v12[3] = &unk_26412A7E0;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  dispatch_async(v10, v12);
}

void __38__MOSplunkLogger_logEventNamed_value___block_invoke(uint64_t a1)
{
  float v2 = [*(id *)(a1 + 32) events];
  [v2 addObject:*(void *)(a1 + 40)];

  double v3 = [*(id *)(a1 + 32) events];
  unint64_t v4 = [v3 count];

  if (v4 >= 0x3E9)
  {
    MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger logEventNamed:value:]_block_invoke", @"Maximum number of events exceeded. Discarding oldest event.", v5, v6, v7, v8, v9);
    id v10 = [*(id *)(a1 + 32) events];
    [v10 removeObjectAtIndex:0];
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  uint64_t v8 = (void (**)(id, uint64_t, void))a5;
  MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger URLSession:didReceiveChallenge:completionHandler:]", @"Splunk upload challenge", v9, v10, v11, v12, v28);
  int v30 = 0;
  if ([v7 previousFailureCount] >= 1) {
    goto LABEL_2;
  }
  id v13 = [v7 protectionSpace];
  id v14 = [v13 authenticationMethod];
  int v15 = [v14 isEqualToString:*MEMORY[0x263F08560]];

  if (!v15)
  {
    v8[2](v8, 1, 0);
    goto LABEL_11;
  }
  uint64_t v16 = [v7 protectionSpace];
  MEMORY[0x2105680C0]([v16 serverTrust], &v30);

  if (![(MOSplunkLogger *)self allowInvalidCert] && v30 != 4 && v30 != 1)
  {
    MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger URLSession:didReceiveChallenge:completionHandler:]", @"Error evaluating trust. SecTrustResultType=%d", v17, v18, v19, v20, v30);
LABEL_2:
    v8[2](v8, 2, 0);
    goto LABEL_11;
  }
  if ([(MOSplunkLogger *)self allowInvalidCert]) {
    MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger URLSession:didReceiveChallenge:completionHandler:]", @"Force Accepting Credential", v21, v22, v23, v24, v29);
  }
  uint64_t v25 = (void *)MEMORY[0x263F08BB8];
  uint64_t v26 = [v7 protectionSpace];
  uint64_t v27 = objc_msgSend(v25, "credentialForTrust:", objc_msgSend(v26, "serverTrust"));

  ((void (**)(id, uint64_t, void *))v8)[2](v8, 0, v27);
LABEL_11:
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)allowInvalidCert
{
  return self->_allowInvalidCert;
}

- (void)setAllowInvalidCert:(BOOL)a3
{
  self->_allowInvalidCert = a3;
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSURL)splunkUploadURL
{
  return self->_splunkUploadURL;
}

- (void)setSplunkUploadURL:(id)a3
{
}

- (NSURL)configurationURL
{
  return self->_configurationURL;
}

- (void)setConfigurationURL:(id)a3
{
}

- (NSString)splunkTopic
{
  return self->_splunkTopic;
}

- (void)setSplunkTopic:(id)a3
{
}

- (NSNumber)samplingPercentage
{
  return self->_samplingPercentage;
}

- (void)setSamplingPercentage:(id)a3
{
}

- (double)lastSuccessfulConfigurationLoad
{
  return self->_lastSuccessfulConfigurationLoad;
}

- (void)setLastSuccessfulConfigurationLoad:(double)a3
{
  self->_lastSuccessfulConfigurationLoad = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samplingPercentage, 0);
  objc_storeStrong((id *)&self->_splunkTopic, 0);
  objc_storeStrong((id *)&self->_configurationURL, 0);
  objc_storeStrong((id *)&self->_splunkUploadURL, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_events, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

@end