@interface SYDClientProtocolProxy
- (SYDClientProtocol)target;
- (SYDClientProtocolProxy)initWithTarget:(id)a3;
- (void)setTarget:(id)a3;
- (void)storeDidChangeWithStoreID:(id)a3 changeDictionary:(id)a4;
@end

@implementation SYDClientProtocolProxy

- (SYDClientProtocolProxy)initWithTarget:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SYDClientProtocolProxy;
  v5 = [(SYDClientProtocolProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_target, v4);
  }

  return v6;
}

- (void)storeDidChangeWithStoreID:(id)a3 changeDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(SYDClientProtocolProxy *)self target];
  if (v8)
  {
    v9 = [(SYDClientProtocolProxy *)self target];
    [v9 storeDidChangeWithStoreID:v6 changeDictionary:v7];
  }
  else
  {
    v9 = SYDGetConnectionLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_218588000, v9, OS_LOG_TYPE_INFO, "Received storeDidChange for invalidated connection", v10, 2u);
    }
  }
}

- (SYDClientProtocol)target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  return (SYDClientProtocol *)WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (void).cxx_destruct
{
}

@end