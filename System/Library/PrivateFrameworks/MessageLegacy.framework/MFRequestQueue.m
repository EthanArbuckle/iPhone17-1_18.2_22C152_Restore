@interface MFRequestQueue
- (MFRequestQueue)init;
- (void)_processRequests:(id)a3 consumers:(id)a4;
- (void)addRequest:(id)a3 consumer:(id)a4;
- (void)addRequests:(id)a3 consumers:(id)a4;
- (void)dealloc;
- (void)processRequest:(id)a3 consumer:(id)a4;
- (void)processRequests:(id)a3 consumers:(id)a4;
@end

@implementation MFRequestQueue

- (MFRequestQueue)init
{
  v4.receiver = self;
  v4.super_class = (Class)MFRequestQueue;
  v2 = [(MFRequestQueue *)&v4 init];
  if (v2)
  {
    v2->_condition = (NSConditionLock *)[objc_alloc(MEMORY[0x1E4F734B0]) initWithName:@"condition" condition:0 andDelegate:v2];
    v2->_requests = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v2->_consumers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v2;
}

- (void)addRequest:(id)a3 consumer:(id)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v8[0] = a3;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v7 = a4;
  -[MFRequestQueue addRequests:consumers:](self, "addRequests:consumers:", v6, [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1]);
}

- (void)addRequests:(id)a3 consumers:(id)a4
{
  _MFLockGlobalLock();
  ++self->_waitingOutside;
  [(MFRequestQueue *)self willAddRequests:a3 consumers:a4];
  [(NSMutableArray *)self->_requests addObjectsFromArray:a3];
  [(NSMutableArray *)self->_consumers addObjectsFromArray:a4];
  _MFUnlockGlobalLock();
  [(NSConditionLock *)self->_condition lockWhenCondition:0];
  _MFLockGlobalLock();
  unsigned int waitingOutside = self->_waitingOutside;
  unsigned int v8 = self->_waitingInside + 1;
  self->_waitingInside = v8;
  if (waitingOutside == v8)
  {
    v9 = (void *)[(NSMutableArray *)self->_requests copy];
    [(NSMutableArray *)self->_requests removeAllObjects];
    self->_unsigned int waitingOutside = 0;
    v10 = (void *)[(NSMutableArray *)self->_consumers copy];
    [(NSMutableArray *)self->_consumers removeAllObjects];
    _MFUnlockGlobalLock();
    if (v9)
    {
      [(MFRequestQueue *)self _processRequests:v9 consumers:v10];

      goto LABEL_6;
    }
  }
  else
  {
    _MFUnlockGlobalLock();
    v10 = 0;
  }

  [(NSConditionLock *)self->_condition unlock];
  [(NSConditionLock *)self->_condition lockWhenCondition:1];
LABEL_6:
  _MFLockGlobalLock();
  unsigned int v11 = self->_waitingInside - 1;
  self->_waitingInside = v11;
  BOOL v12 = v11 != 0;
  _MFUnlockGlobalLock();
  condition = self->_condition;
  [(NSConditionLock *)condition unlockWithCondition:v12];
}

- (void)processRequest:(id)a3 consumer:(id)a4
{
}

- (void)_processRequests:(id)a3 consumers:(id)a4
{
}

- (void)processRequests:(id)a3 consumers:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  uint64_t v7 = [a3 count];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
      -[MFRequestQueue processRequest:consumer:](self, "processRequest:consumer:", [a3 objectAtIndex:i], objc_msgSend(a4, "objectAtIndex:", i));
  }
}

- (void)dealloc
{
  if (self->_waitingInside) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"RequestQueue.m", 120, @"nobody should be waiting at -dealloc time");
  }
  if (self->_waitingOutside) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"RequestQueue.m", 121, @"nobody should be waiting at -dealloc time");
  }

  v4.receiver = self;
  v4.super_class = (Class)MFRequestQueue;
  [(MFRequestQueue *)&v4 dealloc];
}

@end