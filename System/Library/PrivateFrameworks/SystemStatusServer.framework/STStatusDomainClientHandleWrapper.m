@interface STStatusDomainClientHandleWrapper
- (NSArray)preferredLocalizations;
- (STStatusDomainClientHandle)wrappedClientHandle;
- (STStatusDomainClientHandleWrapper)initWithWrappedClientHandle:(id)a3 preferredLocalizations:(id)a4;
- (void)observeData:(id)a3 forDomain:(unint64_t)a4 withChangeContext:(id)a5;
@end

@implementation STStatusDomainClientHandleWrapper

- (void)observeData:(id)a3 forDomain:(unint64_t)a4 withChangeContext:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(STStatusDomainClientHandleWrapper *)self wrappedClientHandle];
  [v10 observeData:v9 forDomain:a4 withChangeContext:v8];
}

- (STStatusDomainClientHandle)wrappedClientHandle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wrappedClientHandle);
  return (STStatusDomainClientHandle *)WeakRetained;
}

- (NSArray)preferredLocalizations
{
  return self->_preferredLocalizations;
}

- (STStatusDomainClientHandleWrapper)initWithWrappedClientHandle:(id)a3 preferredLocalizations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)STStatusDomainClientHandleWrapper;
  id v8 = [(STStatusDomainClientHandleWrapper *)&v13 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_wrappedClientHandle, v6);
    uint64_t v10 = [v7 copy];
    preferredLocalizations = v9->_preferredLocalizations;
    v9->_preferredLocalizations = (NSArray *)v10;
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredLocalizations, 0);
  objc_destroyWeak((id *)&self->_wrappedClientHandle);
}

@end