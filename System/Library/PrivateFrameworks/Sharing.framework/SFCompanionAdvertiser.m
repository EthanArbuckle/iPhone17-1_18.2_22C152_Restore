@interface SFCompanionAdvertiser
- (BOOL)supportsStreams;
- (NSData)serviceEndpointData;
- (NSString)serviceType;
- (SFCompanionAdvertiser)initWithServiceType:(id)a3;
- (SFCompanionAdvertiserDelegate)delegate;
- (void)dealloc;
- (void)getContinuationStreamsWithEndpointData:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setSupportsStreams:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation SFCompanionAdvertiser

- (SFCompanionAdvertiser)initWithServiceType:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFCompanionAdvertiser;
  v5 = [(SFCompanionAdvertiser *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    serviceType = v5->_serviceType;
    v5->_serviceType = (NSString *)v6;

    id v8 = +[SFCompanionManager serviceManager];
  }

  return v5;
}

- (void)dealloc
{
  self->_delegate = 0;
  v2.receiver = self;
  v2.super_class = (Class)SFCompanionAdvertiser;
  [(SFCompanionAdvertiser *)&v2 dealloc];
}

- (NSData)serviceEndpointData
{
  v3 = +[SFCompanionManager serviceManager];
  id v4 = [v3 streamDataForIdentifier:self->_serviceType];

  return (NSData *)v4;
}

- (void)getContinuationStreamsWithEndpointData:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[SFCompanionManager serviceManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__SFCompanionAdvertiser_getContinuationStreamsWithEndpointData_completionHandler___block_invoke;
  v9[3] = &unk_1E5BBDF20;
  id v10 = v5;
  id v8 = v5;
  [v7 getStreamsForData:v6 withStreamHandler:v9];
}

uint64_t __82__SFCompanionAdvertiser_getContinuationStreamsWithEndpointData_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)start
{
  if ([(SFCompanionAdvertiser *)self supportsStreams])
  {
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x3032000000;
    v7[3] = __Block_byref_object_copy__1;
    v7[4] = __Block_byref_object_dispose__1;
    id v8 = 0;
    v3 = self;
    id v8 = v3;
    id v4 = +[SFCompanionManager serviceManager];
    serviceType = v3->_serviceType;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __30__SFCompanionAdvertiser_start__block_invoke;
    v6[3] = &unk_1E5BBDF48;
    v6[4] = v3;
    v6[5] = v7;
    [v4 supportStreamsWithIdentifier:serviceType withStreamHandler:v6];

    _Block_object_dispose(v7, 8);
  }
}

uint64_t __30__SFCompanionAdvertiser_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v7 || !*(unsigned char *)(v7 + 8))
  {
    v9 = streams_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1A5389000, v9, OS_LOG_TYPE_DEFAULT, "No longer supports streams", v11, 2u);
    }

    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_8:
    uint64_t v8 = 0;
    goto LABEL_9;
  }
  [*(id *)(*(void *)(a1 + 32) + 16) advertiser:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) didReceiveInputStream:v5 outputStream:v6];
  uint64_t v8 = 1;
LABEL_9:

  return v8;
}

- (void)stop
{
  v3 = +[SFCompanionManager serviceManager];
  [v3 disableStreamSupportForIdentifier:self->_serviceType];

  [(SFCompanionAdvertiser *)self setSupportsStreams:0];
}

- (SFCompanionAdvertiserDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SFCompanionAdvertiserDelegate *)a3;
}

- (BOOL)supportsStreams
{
  return self->_supportsStreams;
}

- (void)setSupportsStreams:(BOOL)a3
{
  self->_supportsStreams = a3;
}

- (NSString)serviceType
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
}

@end