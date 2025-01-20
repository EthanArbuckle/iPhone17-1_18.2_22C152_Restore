@interface PCRingBuffer
+ (id)sharedInstance;
- (APUnfairLock)lock;
- (NSMutableArray)ringBuffer;
- (PCRingBuffer)init;
- (void)cappedRingBufferTo:(unint64_t)a3;
- (void)setRingBuffer:(id)a3;
@end

@implementation PCRingBuffer

+ (id)sharedInstance
{
  if (qword_26AB31B90 != -1) {
    dispatch_once(&qword_26AB31B90, &unk_26D2A87C0);
  }
  v2 = (void *)qword_26AB31B98;
  return v2;
}

- (PCRingBuffer)init
{
  v8.receiver = self;
  v8.super_class = (Class)PCRingBuffer;
  v2 = [(PCRingBuffer *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F20B90]) initWithOptions:1];
    lock = v2->_lock;
    v2->_lock = (APUnfairLock *)v3;

    uint64_t v5 = [MEMORY[0x263EFF980] array];
    ringBuffer = v2->_ringBuffer;
    v2->_ringBuffer = (NSMutableArray *)v5;
  }
  return v2;
}

- (void)cappedRingBufferTo:(unint64_t)a3
{
  uint64_t v5 = [(PCRingBuffer *)self ringBuffer];
  unint64_t v6 = [v5 count];

  unint64_t v7 = v6 - a3;
  if (v6 > a3)
  {
    objc_super v8 = [(PCRingBuffer *)self ringBuffer];
    objc_msgSend(v8, "subarrayWithRange:", v7, a3);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    v9 = (void *)[v10 mutableCopy];
    [(PCRingBuffer *)self setRingBuffer:v9];
  }
}

- (NSMutableArray)ringBuffer
{
  return self->_ringBuffer;
}

- (void)setRingBuffer:(id)a3
{
}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_ringBuffer, 0);
}

@end