@interface _NSAttributedStringAsyncReadReply
+ (id)readReplyWithConnection:(id)a3 reply:(id)a4;
- (BOOL)delivered;
- (NSXPCConnection)connection;
- (id)reply;
- (void)cancelWithError:(id)a3;
- (void)dealloc;
- (void)deliverAttributedString:(id)a3 documentAttributes:(id)a4 error:(id)a5;
@end

@implementation _NSAttributedStringAsyncReadReply

+ (id)readReplyWithConnection:(id)a3 reply:(id)a4
{
  v6 = objc_alloc_init((Class)a1);
  if (v6)
  {
    v6[2] = a3;
    v6[3] = [a4 copy];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_NSAttributedStringAsyncReadReply;
  [(_NSAttributedStringAsyncReadReply *)&v3 dealloc];
}

- (void)cancelWithError:(id)a3
{
}

- (void)deliverAttributedString:(id)a3 documentAttributes:(id)a4 error:(id)a5
{
  if (!self->_delivered)
  {
    v9 = [(_NSAttributedStringAsyncReadReply *)self reply];
    v9[2](v9, a3, a4, a5);
    [(NSXPCConnection *)[(_NSAttributedStringAsyncReadReply *)self connection] invalidate];
    self->_delivered = 1;
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (id)reply
{
  return self->_reply;
}

- (BOOL)delivered
{
  return self->_delivered;
}

@end