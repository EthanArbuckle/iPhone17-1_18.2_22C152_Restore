@interface FMFCoalescedCommand
- (FMFClientSession)session;
- (FMFCoalescedCommand)initWithHandles:(id)a3 forSession:(id)a4 callerId:(id)a5 priority:(int64_t)a6 reason:(int64_t)a7 completionBlock:(id)a8;
- (FMFHandle)callerId;
- (NSSet)handles;
- (id)completionBlock;
- (int64_t)priority;
- (int64_t)reason;
- (void)setCallerId:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setHandles:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setReason:(int64_t)a3;
- (void)setSession:(id)a3;
@end

@implementation FMFCoalescedCommand

- (FMFCoalescedCommand)initWithHandles:(id)a3 forSession:(id)a4 callerId:(id)a5 priority:(int64_t)a6 reason:(int64_t)a7 completionBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)FMFCoalescedCommand;
  v18 = [(FMFCoalescedCommand *)&v21 init];
  v19 = v18;
  if (v18)
  {
    [(FMFCoalescedCommand *)v18 setHandles:v14];
    [(FMFCoalescedCommand *)v19 setSession:v15];
    [(FMFCoalescedCommand *)v19 setCallerId:v16];
    [(FMFCoalescedCommand *)v19 setPriority:a6];
    [(FMFCoalescedCommand *)v19 setReason:a7];
    [(FMFCoalescedCommand *)v19 setCompletionBlock:v17];
  }

  return v19;
}

- (FMFClientSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSSet)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
}

- (FMFHandle)callerId
{
  return self->_callerId;
}

- (void)setCallerId:(id)a3
{
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_callerId, 0);
  objc_storeStrong((id *)&self->_handles, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end