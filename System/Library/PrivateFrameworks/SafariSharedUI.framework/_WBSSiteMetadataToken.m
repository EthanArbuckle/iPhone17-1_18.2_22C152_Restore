@interface _WBSSiteMetadataToken
- (BOOL)didReceiveResponse;
- (BOOL)isCancelled;
- (BOOL)isOneTimeRequest;
- (NSSet)parentRequests;
- (OS_dispatch_queue)queue;
- (WBSDispatchSourceTimer)delayTimer;
- (WBSSiteMetadataRequest)request;
- (_WBSSiteMetadataToken)initWithRequest:(id)a3 isOneTimeRequest:(BOOL)a4 queue:(id)a5 responseHandler:(id)a6;
- (id)description;
- (id)responseHandler;
- (int64_t)priority;
- (void)dealloc;
- (void)dispatchResponse:(id)a3;
- (void)removeParentRequest:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setDelayTimer:(id)a3;
- (void)setDidReceiveResponse:(BOOL)a3;
- (void)setParentRequests:(id)a3;
- (void)setPriority:(int64_t)a3;
@end

@implementation _WBSSiteMetadataToken

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (_WBSSiteMetadataToken)initWithRequest:(id)a3 isOneTimeRequest:(BOOL)a4 queue:(id)a5 responseHandler:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_WBSSiteMetadataToken;
  v14 = [(_WBSSiteMetadataToken *)&v20 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_queue, a5);
    objc_storeStrong((id *)&v15->_request, a3);
    v15->_priority = 0;
    v15->_isOneTimeRequest = a4;
    uint64_t v16 = MEMORY[0x1AD115160](v13);
    id responseHandler = v15->_responseHandler;
    v15->_id responseHandler = (id)v16;

    v15->_cancelledLock._os_unfair_lock_opaque = 0;
    v18 = v15;
  }

  return v15;
}

- (void)setDelayTimer:(id)a3
{
  v5 = (WBSDispatchSourceTimer *)a3;
  delayTimer = self->_delayTimer;
  p_delayTimer = &self->_delayTimer;
  v6 = delayTimer;
  if (delayTimer != v5)
  {
    v9 = v5;
    [(WBSDispatchSourceTimer *)v6 invalidate];
    objc_storeStrong((id *)p_delayTimer, a3);
    v5 = v9;
  }
}

- (void)setDidReceiveResponse:(BOOL)a3
{
  self->_didReceiveResponse = a3;
}

- (BOOL)isOneTimeRequest
{
  return self->_isOneTimeRequest;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)didReceiveResponse
{
  return self->_didReceiveResponse;
}

- (WBSSiteMetadataRequest)request
{
  return self->_request;
}

- (NSSet)parentRequests
{
  v2 = (void *)[(NSMutableSet *)self->_parentRequests copy];
  return (NSSet *)v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)_WBSSiteMetadataToken;
  [(_WBSSiteMetadataToken *)&v2 dealloc];
}

- (void)dispatchResponse:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_cancelledLock);
  BOOL cancelled = self->_cancelled;
  v6 = (void (**)(void, void))MEMORY[0x1AD115160](self->_responseHandler);
  os_unfair_lock_unlock(&self->_cancelledLock);
  if (!cancelled && v6 != 0)
  {
    v8 = [(WBSSiteMetadataRequest *)self->_request activity];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42___WBSSiteMetadataToken_dispatchResponse___block_invoke;
    block[3] = &unk_1E5E40968;
    block[4] = self;
    os_activity_apply(v8, block);

    ((void (**)(void, id))v6)[2](v6, v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayTimer, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_parentRequests, 0);
}

- (void)setParentRequests:(id)a3
{
  id v4 = (NSMutableSet *)[a3 mutableCopy];
  parentRequests = self->_parentRequests;
  self->_parentRequests = v4;
}

- (void)removeParentRequest:(id)a3
{
}

- (void)setCancelled:(BOOL)a3
{
  BOOL v3 = a3;
  p_cancelledLock = &self->_cancelledLock;
  os_unfair_lock_lock(&self->_cancelledLock);
  self->_BOOL cancelled = v3;
  if (v3)
  {
    id responseHandler = self->_responseHandler;
    self->_id responseHandler = 0;
  }
  os_unfair_lock_unlock(p_cancelledLock);
}

- (BOOL)isCancelled
{
  objc_super v2 = self;
  p_cancelledLock = &self->_cancelledLock;
  os_unfair_lock_lock(&self->_cancelledLock);
  LOBYTE(v2) = v2->_cancelled;
  os_unfair_lock_unlock(p_cancelledLock);
  return (char)v2;
}

- (id)description
{
  p_cancelledLock = &self->_cancelledLock;
  os_unfair_lock_lock(&self->_cancelledLock);
  BOOL cancelled = self->_cancelled;
  os_unfair_lock_unlock(p_cancelledLock);
  v5 = NSString;
  uint64_t v6 = objc_opt_class();
  request = self->_request;
  if (self->_isOneTimeRequest) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  unint64_t priority = self->_priority;
  v10 = v8;
  uint64_t v11 = WBSStringFromSiteMetadataRequestPriority(priority);
  id v12 = (void *)v11;
  if (cancelled) {
    id v13 = @"YES";
  }
  else {
    id v13 = @"NO";
  }
  v14 = [v5 stringWithFormat:@"<%@: %p, request: %@, isOneTime: %@, priority: %@, cancelled: %@>", v6, self, request, v10, v11, v13];

  return v14;
}

- (int64_t)priority
{
  return self->_priority;
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (WBSDispatchSourceTimer)delayTimer
{
  return self->_delayTimer;
}

@end