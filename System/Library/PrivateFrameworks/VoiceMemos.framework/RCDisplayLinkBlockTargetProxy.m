@interface RCDisplayLinkBlockTargetProxy
- (RCDisplayLinkBlockTargetProxy)initWithHandlerBlock:(id)a3;
- (id)handlerBlock;
- (void)dealloc;
- (void)displayLinkFired:(id)a3;
@end

@implementation RCDisplayLinkBlockTargetProxy

- (RCDisplayLinkBlockTargetProxy)initWithHandlerBlock:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RCDisplayLinkBlockTargetProxy;
  result = [(RCDisplayLinkBlockTargetProxy *)&v5 init];
  if (result) {
    result->_handlerBlock = a3;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)RCDisplayLinkBlockTargetProxy;
  [(RCDisplayLinkBlockTargetProxy *)&v3 dealloc];
}

- (void)displayLinkFired:(id)a3
{
  handlerBlock = (uint64_t (**)(id, SEL))self->_handlerBlock;
  if (handlerBlock && (handlerBlock[2](handlerBlock, a2) & 1) == 0)
  {
    [a3 invalidate];
  }
}

- (id)handlerBlock
{
  return self->_handlerBlock;
}

@end