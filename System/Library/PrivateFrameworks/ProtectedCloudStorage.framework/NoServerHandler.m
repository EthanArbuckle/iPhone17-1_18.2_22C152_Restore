@interface NoServerHandler
- (NoServerHandler)initWithHandler:(id)a3;
- (id)handler;
- (void)call;
@end

@implementation NoServerHandler

- (NoServerHandler)initWithHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NoServerHandler;
  v5 = [(NoServerHandler *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x1AD11D080](v4);
    id handler = v5->_handler;
    v5->_id handler = (id)v6;
  }
  return v5;
}

- (void)call
{
  uint64_t v5 = MEMORY[0x1AD11D080](self->_handler, a2);
  id handler = self->_handler;
  self->_id handler = 0;

  id v4 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t))(v5 + 16))(v5);
    id v4 = (void *)v5;
  }
}

- (id)handler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end