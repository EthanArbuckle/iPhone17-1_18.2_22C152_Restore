@interface RBSXPCMessageReply
- (RBSXPCEncoding)payload;
- (void)_initWithMessage:(void *)a1;
- (void)prepareForHandoff;
- (void)send;
@end

@implementation RBSXPCMessageReply

- (RBSXPCEncoding)payload
{
  return (RBSXPCEncoding *)self->_payload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

- (void)_initWithMessage:(void *)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3 || MEMORY[0x192FECA30](v3) != MEMORY[0x1E4F14590])
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:sel__initWithMessage_ object:a1 file:@"RBSXPCUtilities.m" lineNumber:110 description:@"reply is not a dictionary"];
    }
    a1 = (void *)[a1 init];
    if (a1)
    {
      v5 = -[RBSXPCMessageContext _initWithHandoffToken:]([RBSXPCMessageContext alloc], v4);
      v6 = (void *)a1[2];
      a1[2] = v5;

      uint64_t v7 = +[RBSXPCCoder coderWithMessage:v4];
      v8 = (void *)a1[1];
      a1[1] = v7;
    }
  }

  return a1;
}

- (void)send
{
  if (!self->_sent)
  {
    self->_sent = 1;
    id v3 = [(RBSXPCMessageContext *)self->_context connection];
    v4 = [(RBSXPCCoder *)self->_payload createMessage];
    xpc_connection_send_message(v3, v4);

    -[RBSXPCMessageContext _unset](self->_context);
    context = self->_context;
    self->_context = 0;

    payload = self->_payload;
    self->_payload = 0;
  }
}

- (void)prepareForHandoff
{
  if (!self->_sent) {
    -[RBSXPCMessageContext _set]((uint64_t)self->_context);
  }
}

@end