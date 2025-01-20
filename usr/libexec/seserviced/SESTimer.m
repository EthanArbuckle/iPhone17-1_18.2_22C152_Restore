@interface SESTimer
- (void)dealloc;
@end

@implementation SESTimer

- (void)dealloc
{
  dispatch_source_cancel((dispatch_source_t)self->_src);
  v3.receiver = self;
  v3.super_class = (Class)SESTimer;
  [(SESTimer *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

@end