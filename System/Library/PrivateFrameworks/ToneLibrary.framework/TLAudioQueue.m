@interface TLAudioQueue
+ (TLAudioQueue)sharedAudioQueue;
- (BOOL)_shouldAssumeRunningOnAudioQueue;
- (OS_dispatch_queue)_underlyingSerialQueue;
- (id)_init;
- (void)assertNotRunningOnAudioQueue;
- (void)assertRunningOnAudioQueue;
- (void)performSynchronousTaskWithBlock:(id)a3;
- (void)performSynchronousTaskWithOptions:(unint64_t)a3 block:(id)a4;
- (void)performTaskWithBlock:(id)a3;
@end

@implementation TLAudioQueue

+ (TLAudioQueue)sharedAudioQueue
{
  if (sharedAudioQueue__TLAudioQueueSharedInstanceOnceToken != -1) {
    dispatch_once(&sharedAudioQueue__TLAudioQueueSharedInstanceOnceToken, &__block_literal_global_6);
  }
  v2 = (void *)sharedAudioQueue__TLAudioQueueSharedInstance;

  return (TLAudioQueue *)v2;
}

uint64_t __32__TLAudioQueue_sharedAudioQueue__block_invoke()
{
  sharedAudioQueue__TLAudioQueueSharedInstance = [[TLAudioQueue alloc] _init];

  return MEMORY[0x1F41817F8]();
}

- (id)_init
{
  v15.receiver = self;
  v15.super_class = (Class)TLAudioQueue;
  v2 = [(TLAudioQueue *)&v15 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    v5 = NSString;
    v6 = [MEMORY[0x1E4F28B50] bundleForClass:v3];
    v7 = [v6 bundleIdentifier];
    v8 = [v5 stringWithFormat:@"%@.%@", v7, v4];

    id v9 = v8;
    dispatch_queue_t v10 = dispatch_queue_create((const char *)[v9 UTF8String], 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = [[NSString alloc] initWithFormat:@"%@.%@", v4, @"AssumeRunningOnAudioQueue"];
    assumeRunningOnAudioQueueThreadLocalStorageKey = v2->_assumeRunningOnAudioQueueThreadLocalStorageKey;
    v2->_assumeRunningOnAudioQueueThreadLocalStorageKey = (NSString *)v12;
  }
  return v2;
}

- (void)performTaskWithBlock:(id)a3
{
}

- (void)performSynchronousTaskWithBlock:(id)a3
{
}

- (void)performSynchronousTaskWithOptions:(unint64_t)a3 block:(id)a4
{
  if (a3)
  {
    v6 = (void *)MEMORY[0x1E4F29060];
    v7 = (void (**)(void))a4;
    v8 = [v6 currentThread];
    id v11 = [v8 threadDictionary];

    id v9 = self->_assumeRunningOnAudioQueueThreadLocalStorageKey;
    dispatch_queue_t v10 = [v11 objectForKey:v9];
    [v11 setValue:MEMORY[0x1E4F1CC38] forKey:v9];
    v7[2](v7);

    [v11 setValue:v10 forKey:v9];
  }
  else
  {
    serialQueue = self->_serialQueue;
    id v11 = a4;
    dispatch_sync(serialQueue, v11);
  }
}

- (void)assertRunningOnAudioQueue
{
  if (![(TLAudioQueue *)self _shouldAssumeRunningOnAudioQueue])
  {
    serialQueue = self->_serialQueue;
    dispatch_assert_queue_V2(serialQueue);
  }
}

- (void)assertNotRunningOnAudioQueue
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB936000, log, OS_LOG_TYPE_ERROR, "Expected to be running outside of the audio queue from within a task executed with the option: TLAudioTaskOptionAssumeRunningOnAudioQueue.", v1, 2u);
}

- (OS_dispatch_queue)_underlyingSerialQueue
{
  return self->_serialQueue;
}

- (BOOL)_shouldAssumeRunningOnAudioQueue
{
  v3 = [MEMORY[0x1E4F29060] currentThread];
  v4 = [v3 threadDictionary];

  v5 = [v4 objectForKey:self->_assumeRunningOnAudioQueueThreadLocalStorageKey];
  LOBYTE(v3) = [v5 BOOLValue];

  return (char)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_assumeRunningOnAudioQueueThreadLocalStorageKey, 0);
}

@end