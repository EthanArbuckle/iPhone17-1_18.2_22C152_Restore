@interface WBSScopeExitHandler
- (id)handler;
- (void)dealloc;
- (void)setHandler:(id)a3;
@end

@implementation WBSScopeExitHandler

- (void).cxx_destruct
{
}

- (void)setHandler:(id)a3
{
}

- (void)dealloc
{
  handler = (void (**)(id, SEL))self->_handler;
  if (handler) {
    handler[2](handler, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)WBSScopeExitHandler;
  [(WBSScopeExitHandler *)&v4 dealloc];
}

- (id)handler
{
  return self->_handler;
}

@end