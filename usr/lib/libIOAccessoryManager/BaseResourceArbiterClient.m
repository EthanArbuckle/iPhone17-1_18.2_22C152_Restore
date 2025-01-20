@interface BaseResourceArbiterClient
- (BOOL)asynchRequestResourceAccess:(BOOL)a3;
- (BOOL)synchRequestResourceAccess;
- (ResourceArbiterClientDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation BaseResourceArbiterClient

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)synchRequestResourceAccess
{
  return 1;
}

- (BOOL)asynchRequestResourceAccess:(BOOL)a3
{
  v4 = [(BaseResourceArbiterClient *)self delegate];
  if (v4)
  {
    [(BaseResourceArbiterClient *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __57__BaseResourceArbiterClient_asynchRequestResourceAccess___block_invoke;
      block[3] = &unk_2642FFAD8;
      block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
      LOBYTE(v4) = 1;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return (char)v4;
}

uint64_t __57__BaseResourceArbiterClient_asynchRequestResourceAccess___block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) delegate];

  return [v1 resourceAccessResult:1];
}

- (ResourceArbiterClientDelegate)delegate
{
  return (ResourceArbiterClientDelegate *)objc_loadWeak((id *)&self->_delegate);
}

@end