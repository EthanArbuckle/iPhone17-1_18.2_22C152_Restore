@interface VSRecognitionResultHandlingThread
- (VSRecognitionResultHandlingThread)init;
- (void)_handleRequests;
- (void)_notifyRequestHandled:(id)a3;
- (void)dealloc;
- (void)handleResults:(id)a3 withHandler:(id)a4;
- (void)invalidate;
- (void)setDelegate:(id)a3;
@end

@implementation VSRecognitionResultHandlingThread

- (void)_handleRequests
{
  do
  {
    id v3 = objc_alloc_init(MEMORY[0x263F086B0]);
    [(NSConditionLock *)self->_lock lockWhenCondition:2];
    char resultHandlingFlags = (char)self->_resultHandlingFlags;
    if ((resultHandlingFlags & 4) != 0 && [(NSMutableArray *)self->_requests count])
    {
      v5 = (void *)[(NSMutableArray *)self->_requests objectAtIndex:0];
      id v6 = v5;
      [(NSMutableArray *)self->_requests removeObjectAtIndex:0];
    }
    else
    {
      v5 = 0;
    }
    if (v5) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 1;
    }
    [(NSConditionLock *)self->_lock unlockWithCondition:v7];
    if (v5)
    {
      v8 = (void *)[v5 handler];
      char v9 = objc_opt_respondsToSelector();
      v10 = (void *)[v5 results];
      if (v9) {
        uint64_t v11 = [v8 actionForRecognitionResults:v10];
      }
      else {
        uint64_t v11 = objc_msgSend(v8, "actionForRecognitionResult:", objc_msgSend(v10, "lastObject"));
      }
      [v5 setNextAction:v11];
      [(VSRecognitionResultHandlingThread *)self performSelectorOnMainThread:sel__notifyRequestHandled_ withObject:v5 waitUntilDone:0];
    }
  }
  while ((resultHandlingFlags & 4) != 0);
}

- (void)_notifyRequestHandled:(id)a3
{
  if ((~*(unsigned char *)&self->_resultHandlingFlags & 6) == 0)
  {
    delegate = self->_delegate;
    uint64_t v6 = [a3 results];
    uint64_t v7 = [a3 nextAction];
    [(VSRecognitionResultHandlingThreadDelegate *)delegate recognitionResultHandlingThread:self didHandleResults:v6 nextAction:v7];
  }
}

- (void)invalidate
{
  if ((*(unsigned char *)&self->_resultHandlingFlags & 4) != 0)
  {
    [(NSConditionLock *)self->_lock lock];
    *(unsigned char *)&self->_resultHandlingFlags &= ~4u;
    lock = self->_lock;
    [(NSConditionLock *)lock unlockWithCondition:2];
  }
}

- (void)handleResults:(id)a3 withHandler:(id)a4
{
  if ((*(unsigned char *)&self->_resultHandlingFlags & 4) != 0)
  {
    uint64_t v6 = [[VSRecognitionResultHandlingRequest alloc] initWithHandler:a4 results:a3];
    [(NSConditionLock *)self->_lock lock];
    requests = self->_requests;
    if (!requests)
    {
      requests = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      self->_requests = requests;
    }
    [(NSMutableArray *)requests addObject:v6];
    if ((*(unsigned char *)&self->_resultHandlingFlags & 1) == 0)
    {
      *(unsigned char *)&self->_resultHandlingFlags |= 1u;
      [MEMORY[0x263F08B88] detachNewThreadSelector:sel__handleRequests toTarget:self withObject:0];
    }
    [(NSConditionLock *)self->_lock unlockWithCondition:2];
  }
}

- (void)setDelegate:(id)a3
{
  if (self->_delegate != a3)
  {
    self->_delegate = (VSRecognitionResultHandlingThreadDelegate *)a3;
    if (objc_opt_respondsToSelector()) {
      char v4 = 2;
    }
    else {
      char v4 = 0;
    }
    *(unsigned char *)&self->_char resultHandlingFlags = *(unsigned char *)&self->_resultHandlingFlags & 0xFD | v4;
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VSRecognitionResultHandlingThread;
  [(VSRecognitionResultHandlingThread *)&v3 dealloc];
}

- (VSRecognitionResultHandlingThread)init
{
  v5.receiver = self;
  v5.super_class = (Class)VSRecognitionResultHandlingThread;
  v2 = [(VSRecognitionResultHandlingThread *)&v5 init];
  objc_super v3 = v2;
  if (v2)
  {
    *(unsigned char *)&v2->_resultHandlingFlags |= 4u;
    v2->_lock = (NSConditionLock *)[objc_alloc(MEMORY[0x263F08748]) initWithCondition:1];
  }
  return v3;
}

@end