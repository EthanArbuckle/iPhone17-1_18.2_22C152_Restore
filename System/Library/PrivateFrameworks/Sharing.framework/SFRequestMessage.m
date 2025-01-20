@interface SFRequestMessage
- (id)responseHandler;
- (void)invalidate;
- (void)setResponseHandler:(id)a3;
@end

@implementation SFRequestMessage

- (void)invalidate
{
  v4.receiver = self;
  v4.super_class = (Class)SFRequestMessage;
  [(SFMessage *)&v4 invalidate];
  id responseHandler = self->_responseHandler;
  self->_id responseHandler = 0;
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end