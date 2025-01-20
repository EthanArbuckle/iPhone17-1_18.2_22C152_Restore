@interface LockdownSRPState
- (BOOL)pairingSessionStarted;
- (CUPairingSession)pairingSession;
- (LockdownSRPState)init;
- (NSMutableDictionary)srpResponse;
- (OS_dispatch_semaphore)sem;
- (int)retval;
- (void)invalidate;
- (void)setPairingSession:(id)a3;
- (void)setPairingSessionStarted:(BOOL)a3;
- (void)setRetval:(int)a3;
- (void)setSrpResponse:(id)a3;
@end

@implementation LockdownSRPState

- (LockdownSRPState)init
{
  v9.receiver = self;
  v9.super_class = (Class)LockdownSRPState;
  v2 = [(LockdownSRPState *)&v9 init];
  if (!v2) {
    goto LABEL_4;
  }
  v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  srpResponse = v2->_srpResponse;
  v2->_srpResponse = v3;

  if (!v2->_srpResponse) {
    goto LABEL_5;
  }
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  sem = v2->_sem;
  v2->_sem = (OS_dispatch_semaphore *)v5;

  if (v2->_sem) {
LABEL_4:
  }
    v7 = v2;
  else {
LABEL_5:
  }
    v7 = 0;

  return v7;
}

- (void)invalidate
{
}

- (int)retval
{
  return self->_retval;
}

- (void)setRetval:(int)a3
{
  self->_retval = a3;
}

- (CUPairingSession)pairingSession
{
  return self->_pairingSession;
}

- (void)setPairingSession:(id)a3
{
}

- (BOOL)pairingSessionStarted
{
  return self->_pairingSessionStarted;
}

- (void)setPairingSessionStarted:(BOOL)a3
{
  self->_pairingSessionStarted = a3;
}

- (NSMutableDictionary)srpResponse
{
  return self->_srpResponse;
}

- (void)setSrpResponse:(id)a3
{
}

- (OS_dispatch_semaphore)sem
{
  return self->_sem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sem, 0);
  objc_storeStrong((id *)&self->_srpResponse, 0);

  objc_storeStrong((id *)&self->_pairingSession, 0);
}

@end