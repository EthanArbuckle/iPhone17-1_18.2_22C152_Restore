@interface GTBufferedSendOperation_tools_diagnostics
- (GTTransportMessage_tools_diagnostics)message;
- (GTTransportMessage_tools_diagnostics)replyTo;
- (OS_dispatch_queue)queue;
- (id)replyBlock;
- (unint64_t)timeout;
- (void)dealloc;
- (void)setMessage:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReplyBlock:(id)a3;
- (void)setReplyTo:(id)a3;
- (void)setTimeout:(unint64_t)a3;
@end

@implementation GTBufferedSendOperation_tools_diagnostics

- (void)setReplyBlock:(id)a3
{
  self->_replyBlock = a3;
}

- (id)replyBlock
{
  return self->_replyBlock;
}

- (void)setTimeout:(unint64_t)a3
{
  self->_timeout = a3;
}

- (unint64_t)timeout
{
  return self->_timeout;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setReplyTo:(id)a3
{
}

- (GTTransportMessage_tools_diagnostics)replyTo
{
  return self->_replyTo;
}

- (void)setMessage:(id)a3
{
}

- (GTTransportMessage_tools_diagnostics)message
{
  return self->_message;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GTBufferedSendOperation_tools_diagnostics;
  [(GTBufferedSendOperation_tools_diagnostics *)&v3 dealloc];
}

@end