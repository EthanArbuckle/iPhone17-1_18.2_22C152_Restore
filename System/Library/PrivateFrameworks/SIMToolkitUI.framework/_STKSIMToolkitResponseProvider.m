@interface _STKSIMToolkitResponseProvider
- (BOOL)hasSentResponse;
- (OS_os_log)logger;
- (_STKSIMToolkitResponseProvider)initWithQueue:(id)a3 telephonyClient:(id)a4 context:(id)a5 options:(id)a6 logger:(id)a7;
- (__CFString)_responseFromResponseType:(int64_t)a3;
- (void)sendResponse:(int64_t)a3;
- (void)sendResponse:(int64_t)a3 withBOOLResult:(BOOL)a4;
- (void)sendResponse:(int64_t)a3 withStringResult:(id)a4;
- (void)sendSuccessWithSelectedIndex:(unint64_t)a3;
@end

@implementation _STKSIMToolkitResponseProvider

- (_STKSIMToolkitResponseProvider)initWithQueue:(id)a3 telephonyClient:(id)a4 context:(id)a5 options:(id)a6 logger:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"_STKSIMToolkitResponseProvider.m", 21, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

    if (v14)
    {
LABEL_3:
      if (v15) {
        goto LABEL_4;
      }
LABEL_10:
      v25 = [MEMORY[0x263F08690] currentHandler];
      [v25 handleFailureInMethod:a2, self, @"_STKSIMToolkitResponseProvider.m", 23, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

      if (v16) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  v24 = [MEMORY[0x263F08690] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"_STKSIMToolkitResponseProvider.m", 22, @"Invalid parameter not satisfying: %@", @"telephonyClient" object file lineNumber description];

  if (!v15) {
    goto LABEL_10;
  }
LABEL_4:
  if (v16) {
    goto LABEL_5;
  }
LABEL_11:
  v26 = [MEMORY[0x263F08690] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"_STKSIMToolkitResponseProvider.m", 24, @"Invalid parameter not satisfying: %@", @"options" object file lineNumber description];

LABEL_5:
  v28.receiver = self;
  v28.super_class = (Class)_STKSIMToolkitResponseProvider;
  v18 = [(_STKSIMToolkitResponseProvider *)&v28 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_telephonyClient, a4);
    objc_storeStrong((id *)&v19->_context, a5);
    uint64_t v20 = [v16 copy];
    options = v19->_options;
    v19->_options = (NSDictionary *)v20;

    objc_storeStrong((id *)&v19->_queue, a3);
    objc_storeStrong((id *)&v19->_logger, a7);
  }

  return v19;
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (BOOL)hasSentResponse
{
  return self->_hasSentResponse;
}

- (void)sendResponse:(int64_t)a3
{
  if (!self->_hasSentResponse)
  {
    self->_hasSentResponse = 1;
    logger = self->_logger;
    BOOL v6 = os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG);
    if (a3 == 7)
    {
      if (v6) {
        -[_STKSIMToolkitResponseProvider sendResponse:]((uint64_t)self, logger);
      }
      queue = self->_queue;
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __47___STKSIMToolkitResponseProvider_sendResponse___block_invoke;
      v10[3] = &unk_2645F4458;
      v10[4] = self;
      v8 = v10;
    }
    else
    {
      if (v6) {
        [(_STKSIMToolkitResponseProvider *)self sendResponse:a3];
      }
      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __47___STKSIMToolkitResponseProvider_sendResponse___block_invoke_23;
      block[3] = &unk_2645F43C0;
      block[4] = self;
      block[5] = a3;
      v8 = block;
    }
    dispatch_async(queue, v8);
  }
}

- (void)sendResponse:(int64_t)a3 withBOOLResult:(BOOL)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (!self->_hasSentResponse)
  {
    BOOL v4 = a4;
    self->_hasSentResponse = 1;
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
    {
      if (self->_telephonyClient) {
        v9 = @"YES";
      }
      else {
        v9 = @"NO";
      }
      v10 = logger;
      v11 = [(_STKSIMToolkitResponseProvider *)self _responseFromResponseType:a3];
      *(_DWORD *)buf = 138412802;
      if (v4) {
        v12 = @"YES";
      }
      else {
        v12 = @"NO";
      }
      id v16 = v9;
      __int16 v17 = 2112;
      v18 = v11;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      _os_log_debug_impl(&dword_221DC0000, v10, OS_LOG_TYPE_DEBUG, "Really sending response to CT: sendSIMToolkitBooleanResponse - hasClient: %@, response: %@, result: %@", buf, 0x20u);
    }
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62___STKSIMToolkitResponseProvider_sendResponse_withBOOLResult___block_invoke;
    block[3] = &unk_2645F4850;
    block[4] = self;
    block[5] = a3;
    BOOL v14 = v4;
    dispatch_async(queue, block);
  }
}

- (void)sendResponse:(int64_t)a3 withStringResult:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (!self->_hasSentResponse)
  {
    self->_hasSentResponse = 1;
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
    {
      if (self->_telephonyClient) {
        v9 = @"YES";
      }
      else {
        v9 = @"NO";
      }
      v10 = logger;
      *(_DWORD *)buf = 138412802;
      id v15 = v9;
      __int16 v16 = 2112;
      __int16 v17 = [(_STKSIMToolkitResponseProvider *)self _responseFromResponseType:a3];
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_debug_impl(&dword_221DC0000, v10, OS_LOG_TYPE_DEBUG, "Really sending response to CT: sendSIMToolkitStringResponse - hasClient: %@, response: %@, result: %@", buf, 0x20u);
    }
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64___STKSIMToolkitResponseProvider_sendResponse_withStringResult___block_invoke;
    block[3] = &unk_2645F43E8;
    block[4] = self;
    int64_t v13 = a3;
    id v12 = v6;
    dispatch_async(queue, block);
  }
}

- (void)sendSuccessWithSelectedIndex:(unint64_t)a3
{
  if (!self->_hasSentResponse)
  {
    self->_hasSentResponse = 1;
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG)) {
      [(_STKSIMToolkitResponseProvider *)self sendSuccessWithSelectedIndex:a3];
    }
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __63___STKSIMToolkitResponseProvider_sendSuccessWithSelectedIndex___block_invoke;
    v7[3] = &unk_2645F43C0;
    v7[4] = self;
    v7[5] = a3;
    dispatch_async(queue, v7);
  }
}

- (__CFString)_responseFromResponseType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      v3 = (__CFString **)MEMORY[0x263F031E0];
      goto LABEL_9;
    case 1:
      v3 = (__CFString **)MEMORY[0x263F031C8];
      goto LABEL_9;
    case 2:
      v3 = (__CFString **)MEMORY[0x263F031E8];
      goto LABEL_9;
    case 3:
      v3 = (__CFString **)MEMORY[0x263F031D8];
      goto LABEL_9;
    case 4:
      v3 = (__CFString **)MEMORY[0x263F031B8];
      goto LABEL_9;
    case 5:
      v3 = (__CFString **)MEMORY[0x263F031C0];
      goto LABEL_9;
    case 6:
    case 7:
      v3 = (__CFString **)MEMORY[0x263F031D0];
LABEL_9:
      self = *v3;
      break;
    default:
      return self;
  }
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)sendResponse:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 16)) {
    v2 = @"YES";
  }
  else {
    v2 = @"NO";
  }
  int v3 = 138412290;
  BOOL v4 = v2;
  _os_log_debug_impl(&dword_221DC0000, a2, OS_LOG_TYPE_DEBUG, "Really sending response to CT: sendSIMToolkitUserActivity - hasClient: %@", (uint8_t *)&v3, 0xCu);
}

- (void)sendResponse:(uint64_t)a3 .cold.2(void *a1, void *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = a2;
  [a1 _responseFromResponseType:a3];
  OUTLINED_FUNCTION_0_2();
  uint64_t v8 = v6;
  _os_log_debug_impl(&dword_221DC0000, v5, OS_LOG_TYPE_DEBUG, "Really sending response to CT: sendSIMToolkitResponse - hasClient: %@, response: %@", v7, 0x16u);
}

- (void)sendSuccessWithSelectedIndex:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v5 = a2;
  uint64_t v6 = [a1 _responseFromResponseType:0];
  v7 = [NSNumber numberWithUnsignedInteger:a3];
  OUTLINED_FUNCTION_0_2();
  uint64_t v11 = v6;
  __int16 v12 = v8;
  uint64_t v13 = v9;
  _os_log_debug_impl(&dword_221DC0000, v5, OS_LOG_TYPE_DEBUG, "Really sending response to CT: selectSIMToolkitListItem - hasClient: %@, response: %@, result: %@", v10, 0x20u);
}

@end