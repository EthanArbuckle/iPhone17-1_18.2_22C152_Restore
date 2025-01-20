@interface _LTPowerLogger
+ (id)sharedInstance;
- (BOOL)_shouldLogRequest:(int64_t)a3;
- (NSOrderedSet)requestTypeSet;
- (OS_dispatch_queue)loggerQueue;
- (_LTPowerLogger)init;
- (id)_maskForRequestType:(id)a3;
- (void)logTranslateRequestEvent:(id)a3 requestType:(id)a4 routeType:(int64_t)a5;
- (void)setLoggerQueue:(id)a3;
- (void)setRequestTypeSet:(id)a3;
@end

@implementation _LTPowerLogger

- (_LTPowerLogger)init
{
  v9.receiver = self;
  v9.super_class = (Class)_LTPowerLogger;
  v2 = [(_LTPowerLogger *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.translation.powerlog", 0);
    loggerQueue = v2->_loggerQueue;
    v2->_loggerQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_msgSend(MEMORY[0x263EFF9D8], "orderedSetWithObjects:", @"sentence", @"singleParagraph", @"paragraphs", @"tts", @"text-to-speech", @"speech", @"preheat", @"text-LID", 0);
    requestTypeSet = v2->_requestTypeSet;
    v2->_requestTypeSet = (NSOrderedSet *)v5;

    v7 = v2;
  }

  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_23);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

- (void)logTranslateRequestEvent:(id)a3 requestType:(id)a4 routeType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(_LTPowerLogger *)self _shouldLogRequest:a5])
  {
    loggerQueue = self->_loggerQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65___LTPowerLogger_logTranslateRequestEvent_requestType_routeType___block_invoke;
    block[3] = &unk_265547500;
    id v12 = v8;
    v13 = self;
    id v14 = v9;
    dispatch_async(loggerQueue, block);
  }
}

- (id)_maskForRequestType:(id)a3
{
  NSUInteger v3 = [(NSOrderedSet *)self->_requestTypeSet indexOfObject:a3];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = &unk_270C33928;
  }
  else
  {
    v4 = [NSNumber numberWithUnsignedInteger:v3];
  }
  return v4;
}

- (BOOL)_shouldLogRequest:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

- (OS_dispatch_queue)loggerQueue
{
  return self->_loggerQueue;
}

- (void)setLoggerQueue:(id)a3
{
}

- (NSOrderedSet)requestTypeSet
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRequestTypeSet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestTypeSet, 0);
  objc_storeStrong((id *)&self->_loggerQueue, 0);
}

@end