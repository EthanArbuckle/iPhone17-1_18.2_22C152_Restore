@interface SiriUICarDNDContextProvider
- (BOOL)allowContextProvider:(id)a3;
- (SADeviceCarDNDHintContext)hintContext;
- (SiriUICarDNDContextProviderDelegate)delegate;
- (id)getCurrentContext;
- (void)_setHintContext:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SiriUICarDNDContextProvider

- (BOOL)allowContextProvider:(id)a3
{
  return 1;
}

- (id)getCurrentContext
{
  if (self->_hintContext)
  {
    id v3 = objc_alloc(MEMORY[0x263EFF8C0]);
    v4 = [(SADeviceCarDNDHintContext *)self->_hintContext dictionary];
    v5 = objc_msgSend(v3, "initWithObjects:", v4, 0);
  }
  else
  {
    v5 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained contextProvided:self];

  return v5;
}

- (SiriUICarDNDContextProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriUICarDNDContextProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SADeviceCarDNDHintContext)hintContext
{
  return self->_hintContext;
}

- (void)_setHintContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hintContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end