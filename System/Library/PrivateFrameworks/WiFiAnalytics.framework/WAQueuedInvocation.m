@interface WAQueuedInvocation
- (NSInvocation)invocation;
- (id)reply;
- (void)setInvocation:(id)a3;
- (void)setReply:(id)a3;
@end

@implementation WAQueuedInvocation

- (NSInvocation)invocation
{
  return self->_invocation;
}

- (void)setInvocation:(id)a3
{
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reply, 0);
  objc_storeStrong((id *)&self->_invocation, 0);
}

@end