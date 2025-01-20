@interface SWNavigationObserver
- (SWNavigationObserver)initWithBlock:(id)a3;
- (id)block;
- (void)handledNavigationWithURL:(id)a3;
@end

@implementation SWNavigationObserver

- (SWNavigationObserver)initWithBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SWNavigationObserver;
  v5 = [(SWNavigationObserver *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x22A621430](v4);
    id block = v5->_block;
    v5->_id block = (id)v6;
  }
  return v5;
}

- (void)handledNavigationWithURL:(id)a3
{
  id v6 = a3;
  id v4 = [(SWNavigationObserver *)self block];

  if (v4)
  {
    v5 = [(SWNavigationObserver *)self block];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
}

@end