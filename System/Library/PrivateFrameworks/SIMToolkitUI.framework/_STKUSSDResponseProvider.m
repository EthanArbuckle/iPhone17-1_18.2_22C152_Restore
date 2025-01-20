@interface _STKUSSDResponseProvider
- (BOOL)hasSentResponse;
- (OS_os_log)logger;
- (_STKUSSDResponseProvider)initWithQueue:(id)a3 telephonyClient:(id)a4 options:(id)a5 logger:(id)a6;
- (void)dealloc;
- (void)sendResponse:(int64_t)a3;
- (void)sendResponse:(int64_t)a3 withStringResult:(id)a4;
@end

@implementation _STKUSSDResponseProvider

- (_STKUSSDResponseProvider)initWithQueue:(id)a3 telephonyClient:(id)a4 options:(id)a5 logger:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_8:
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"_STKUSSDResponseProvider.m", 22, @"Invalid parameter not satisfying: %@", @"telephonyClient" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v21 = [MEMORY[0x263F08690] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"_STKUSSDResponseProvider.m", 21, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

  if (!v13) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_9:
  v23 = [MEMORY[0x263F08690] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"_STKUSSDResponseProvider.m", 23, @"Invalid parameter not satisfying: %@", @"options" object file lineNumber description];

LABEL_4:
  v24.receiver = self;
  v24.super_class = (Class)_STKUSSDResponseProvider;
  v16 = [(_STKUSSDResponseProvider *)&v24 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_telephonyClient, a4);
    objc_storeStrong((id *)&v17->_queue, a3);
    uint64_t v18 = [v14 copy];
    options = v17->_options;
    v17->_options = (NSDictionary *)v18;

    objc_storeStrong((id *)&v17->_logger, a6);
  }

  return v17;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)_STKUSSDResponseProvider;
  [(_STKUSSDResponseProvider *)&v2 dealloc];
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
  self->_hasSentResponse = 1;
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41___STKUSSDResponseProvider_sendResponse___block_invoke;
  v4[3] = &unk_2645F43C0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)sendResponse:(int64_t)a3 withStringResult:(id)a4
{
  id v6 = a4;
  self->_hasSentResponse = 1;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58___STKUSSDResponseProvider_sendResponse_withStringResult___block_invoke;
  block[3] = &unk_2645F43E8;
  id v10 = v6;
  int64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end